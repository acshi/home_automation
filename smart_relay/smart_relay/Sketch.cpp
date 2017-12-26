/*
 * Skepth.cpp
 *
 * Created: 8/22/2017 10:06:12 PM
 * Author : Acshi
 */

 #include "smart_relay.h"
 #include "manager.h"
 #include "leaf.h"
 #include "EEPROM.h"

// encryption related...
uint8_t nonce[crypto_secretbox_NONCEBYTES] = { 169, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123};

uint8_t contentMessage[CIPHER_LENGTH];
uint8_t contentCipher[CIPHER_LENGTH];

// IR related...
#define IR_RECV_PIN 2
// The send pin is 3

IRsend irSend;
IRrecv irRecv(IR_RECV_PIN);

uint8_t irRecvRegBit;
volatile uint8_t *irRecvReg;

#define START_ON_TIME 2400
#define ZERO_ON_TIME 800
#define ONE_ON_TIME 1600
#define OFF_TIME 200
#define START_ON_TICKS (START_ON_TIME/USECPERTICK)
#define ZERO_ON_TICKS (ZERO_ON_TIME/USECPERTICK)
#define ONE_ON_TICKS (ONE_ON_TIME/USECPERTICK)

volatile uint16_t irTicks = 0;
volatile uint8_t irRecvState = STATE_IDLE;
volatile bool irReceiving = false;
volatile bool irRecvReady = false;

volatile uint8_t irRecvBuffer[TOTAL_MSG_LENGTH];
volatile uint8_t irRecvI = 0;
volatile uint8_t irRecvBitI = 0;

volatile uint16_t irTickMark = 0;
volatile bool irTickMarkReady = false;

#define NOISE_APIN 0

EepromData eepromData;

void prepareContentMessage(uint16_t deviceAddress, uint8_t *dataMessage) {
    for (uint8_t i = 0; i < crypto_secretbox_ZEROBYTES; i++) {
        contentMessage[i] = 0;
    }

    uint16_t msgI = crypto_secretbox_ZEROBYTES;

    contentMessage[msgI++] = (deviceAddress >> 8) & 0xff;
    contentMessage[msgI++] = deviceAddress & 0xff;
    for (uint8_t i = 0; i < DATA_LENGTH; i++) {
        contentMessage[msgI++] = dataMessage[i];
    }

    crypto_secretbox(contentCipher, contentMessage, CIPHER_LENGTH, nonce, eepromData.key);
}

void advanceNonce() {
    // effectively nonce += 1
    for (uint8_t i = 0; i < crypto_secretbox_NONCEBYTES; i++) {
        nonce[i]++;
        if (nonce[i] != 0) {
            break;
        }
    }
}

void sendIrBytes(uint8_t *bytes, uint16_t numBytes) {
    for (uint8_t i = 0; i < numBytes; i++) {
        uint8_t b = bytes[i];
        //Serial << b << ", ";
        for (uint8_t bitI = 0; bitI < 8; bitI++) {
            if (b & 1) {
                irSend.mark(ONE_ON_TIME);
            } else {
                irSend.mark(ZERO_ON_TIME);
            }
            irSend.space(OFF_TIME);
            b >>= 1;
        }
    }
    //Serial << endl;
}

void sendMessage(uint16_t deviceAddress, uint8_t* dataMessage) {
    prepareContentMessage(deviceAddress, dataMessage);

    irSend.enableIROut(38);

    irSend.mark(START_ON_TIME);
    irSend.space(OFF_TIME);

    //Serial << "nonce: ";
    sendIrBytes(nonce, crypto_secretbox_NONCEBYTES);
    //Serial << "cipher: ";
    sendIrBytes(contentCipher + crypto_secretbox_BOXZEROBYTES, INNER_CIPHER_LENGTH);

    irSend.space(0);
}

bool decryptMessage(uint8_t *receiveBuffer) {
    for (uint8_t i = 0; i < crypto_secretbox_BOXZEROBYTES; i++) {
        contentCipher[i] = 0;
    }
    for (uint8_t i = 0; i < INNER_CIPHER_LENGTH; i++) {
        contentCipher[crypto_secretbox_BOXZEROBYTES + i] = receiveBuffer[crypto_secretbox_NONCEBYTES + i];
    }
    uint8_t *receivedNonce = (uint8_t*)irRecvBuffer;
    int status = crypto_secretbox_open(contentMessage, contentCipher, CIPHER_LENGTH, receivedNonce, eepromData.key);
    return status == 0; // true on success
}

// resolve these early on to have the portability of Arduino, but the speed of native use
volatile uint8_t* resolvePinInputRegister(uint8_t pin) {
    return portInputRegister(digitalPinToPort(pin));
}

uint8_t resolvePinBit(uint8_t pin) {
    return digitalPinToBitMask(pin);
}

void irResume() {
    for (uint8_t i = 0; i < sizeof(irRecvBuffer); i++) {
        irRecvBuffer[i] = 0;
    }
    irRecvState = STATE_IDLE;
    irRecv.enableIRIn();
}

bool irTryParse() {
    if (irRecvState != STATE_STOP || !irRecvReady) {
        return false;
    }
    irRecvReady = false;

    Serial << "IR entered stop state with recvBit of " << irRecvI << endl;

    if (!decryptMessage((uint8_t*)irRecvBuffer)) {
        Serial << "Message failed to authenticate...\n";
        Serial << "Dump of received bytes follows:\n";
        for (uint8_t i = 0; i < sizeof(irRecvBuffer); i++) {
            Serial << irRecvBuffer[i] << endl;
        }
        Serial << "Dump over\n";
        irResume();
        return false;
    }

    uint8_t msgI = crypto_secretbox_ZEROBYTES;
    uint16_t deviceAdress = (contentMessage[msgI] << 8) | contentMessage[msgI + 1];
    msgI += 2;

    if (eepromData.isManager) {
        managerHandleAuthenticatedMsg(&eepromData, deviceAdress, &contentMessage[msgI]);
    } else {
        leafHandleAuthenticatedMsg(&eepromData, deviceAdress, &contentMessage[msgI]);
    }
    
    irResume();
    return true;
}

uint8_t readIr() {
    return (uint8_t)(*irRecvReg & irRecvRegBit ? HIGH : LOW);
}

#define MATCH_TICKS_CENTER_VAL(ticks, low, val, high) (ticks >= (low + val) / 2 && ticks <= (val + high) / 2)

// specialized form of the interrupt vector in IRremote.cpp
ISR (TIMER_INTR_NAME)
{
    TIMER_RESET;

    // Read if IR Receiver -> SPACE [xmt LED off] or a MARK [xmt LED on]
    uint8_t  irVal = readIr();

    irTicks++;  // One more 50uS tick

    switch(irRecvState) {
    //......................................................................
    case STATE_IDLE: // In the middle of a gap
        if (irVal == MARK) {
            if (irTicks >= GAP_TICKS)  {
                // Gap big enough and just ended; Record duration; Start recording transmission
                irRecvState = STATE_MARK;
            }
            irTicks = 0;
        }
        break;
    //......................................................................
    case STATE_MARK:  // Timing Mark
        if (irVal == SPACE) {   // Mark ended; Record time
            if (!irTickMarkReady) {
                irTickMark = irTicks;
                irTickMarkReady = true;
            }

            if (MATCH_TICKS_CENTER_VAL(irTicks, ONE_ON_TICKS, START_ON_TICKS, GAP_TICKS)) {
                irRecvI = 0;
                irRecvBitI = 0;
                irTicks = 0;
                irReceiving = true;
                return;
            }
            if (!irReceiving) {
                return;
            }
            if (MATCH_TICKS_CENTER_VAL(irTicks, ZERO_ON_TICKS, ONE_ON_TICKS, START_ON_TICKS)) {
                irRecvBuffer[irRecvI] += 1 << irRecvBitI;
                irRecvBitI++;
                if (irRecvBitI == 8) {
                    irRecvBitI = 0;
                    irRecvI++;
                }
            } else if (MATCH_TICKS_CENTER_VAL(irTicks, 0, ZERO_ON_TICKS, ONE_ON_TICKS)) {
                irRecvBitI++;
                if (irRecvBitI == 8) {
                    irRecvBitI = 0;
                    irRecvI++;
                }
            }
            if (irRecvI == sizeof(irRecvBuffer)) {
                // buffer full
                irRecvState = STATE_STOP;
                irRecvReady = true;
                irReceiving = false;
            } else {
                irRecvState = STATE_SPACE;
            }
            irTicks = 0;
        }
        break;
    //......................................................................
    case STATE_SPACE:  // Timing Space
        if (irVal == MARK) {  // Space just ended
            irTicks = 0;
            irRecvState = STATE_MARK;
        } else if (irTicks > GAP_TICKS) {  // Space
            // A long Space, indicates gap between codes
            // Flag the current code as ready for processing
            // Switch to STOP
            // Don't reset timer; keep counting Space width
            irRecvState = STATE_STOP;
            irRecvReady = true;
            irReceiving = false;
        }
        break;
    //......................................................................
    case STATE_STOP:  // Waiting; Measuring Gap
        if (irVal == MARK) { 
            irTicks = 0;  // Reset gap timer
        }
        break;
    //......................................................................
    /*case STATE_OVERFLOW:  // Flag up a read overflow; Stop the State Machine
        irDidOverflow = true;
        irRecvState = STATE_STOP;
        break;*/
    }
}

void initializeFromEeprom() {
    EEPROM.get(0, eepromData);
    Serial << "Base Id: " << eepromData.baseId << endl;
    Serial << "Is manager: " << eepromData.isManager << endl;
    Serial << "Num devices: " << eepromData.numDevices << endl;
    for (uint8_t i = 0; i < eepromData.numDevices; i++) {
        Serial << "Device " << i << " type: ";
        switch (eepromData.deviceTypes[i]) {
            case DEVICE_RELAY_A:
                Serial << "relay A";
                break;
            case DEVICE_RELAY_B:
                Serial << "relay B";
                break;
            case DEVICE_UNUSED:
                Serial << "unused";
                break;
            default:
                Serial << "unknown";
                break;
        }
        Serial << endl;
    }
    Serial << endl;
}

byte rand_byte() {
    byte val = 0;
    byte bit_i = 0;
    while (bit_i < 8) {
        // note: the noise circuit gives noise only in the first three bits.
        byte a = (byte)analogRead(NOISE_APIN);
        byte b = (byte)analogRead(NOISE_APIN);

        for (byte pair = 0; pair < 3 && bit_i < 8; pair++) {
            byte bit_val = 1 << pair;
            if (~(a & bit_val) & (b & bit_val)) {
                bit_i++;
            } else if ((a & bit_val) & ~(b & bit_val)) {
                val += 1 << bit_i;
                bit_i++;
            }
        }
    }
    return val;
}

void randomize_nonce() {
    for (uint8_t i = 0; i < crypto_secretbox_NONCEBYTES; i++) {
        nonce[i] = rand_byte();
    }
}

void ir_debug() {
    Serial << "irRecvI: " << irRecvI << " irRecvState: " << irRecvState << " irTicks: " << irTicks << " irVal: " << readIr() << endl;
    //Serial << irRecvState << " " << irVal << endl;
}

void setup() {
    Serial.begin(250000);
    Serial.setTimeout(10);

    initializeFromEeprom();

    irRecvRegBit = resolvePinBit(IR_RECV_PIN);
    irRecvReg = resolvePinInputRegister(IR_RECV_PIN);

    irResume();
}

void loop() {
    if (eepromData.isManager) {
        managerLoop(&eepromData);
    } else {
        leafLoop(&eepromData);
    }
}
