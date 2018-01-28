/*
 * leaf.cpp
 *
 * Created: 11/23/2017 1:19:40 PM
 *  Author: Acshi
 */

#include "leaf.h"
#include "smart_relay.h"
#include <avr/power.h>
#include <avr/sleep.h>

bool relayAState = false;
bool relayBState = false;

void leafSetCommand(EepromData *eepromData, uint32_t deviceAddress, int32_t value) {
    // is it for us?
    if (deviceAddress < eepromData->baseId || deviceAddress >= eepromData->baseId + eepromData->numDevices) {
        return;
    }

    uint8_t deviceI = deviceAddress - eepromData->baseId;
    switch (eepromData->deviceTypes[deviceI]) {
        case DEVICE_RELAY_A:
            relayAState = value ? HIGH : LOW;
            digitalWrite(RELAY_A_SET_PIN, relayAState);
            if (LEAF_UART_ENABLED) {
                Serial << "Relay A turned " << (value ? "on\n" : "off\n");
            }
            break;
        case DEVICE_RELAY_B:
            relayBState = value ? HIGH : LOW;
            digitalWrite(RELAY_B_SET_PIN, relayBState);
            if (LEAF_UART_ENABLED) {
                Serial << "Relay B turned " << (value ? "on\n" : "off\n");
            }
            break;
        case DEVICE_LATCHING_RELAY_A:
            relayAState = value ? HIGH : LOW;
            if (relayAState) {
                digitalWrite(RELAY_A_SET_PIN, HIGH);
                delay(15);
                digitalWrite(RELAY_A_SET_PIN, LOW);
            } else {
                digitalWrite(RELAY_A_RESET_PIN, HIGH);
                delay(15);
                digitalWrite(RELAY_A_RESET_PIN, LOW);
            }
            if (LEAF_UART_ENABLED) {
                Serial << "Latching Relay A turned " << (value ? "on\n" : "off\n");
            }
            break;
        case DEVICE_LATCHING_RELAY_B:
            relayBState = value ? HIGH : LOW;
            if (relayBState) {
                digitalWrite(RELAY_B_SET_PIN, HIGH);
                delay(15);
                digitalWrite(RELAY_B_SET_PIN, LOW);
            } else {
                digitalWrite(RELAY_B_RESET_PIN, HIGH);
                delay(15);
                digitalWrite(RELAY_B_RESET_PIN, LOW);
            }
            if (LEAF_UART_ENABLED) {
                Serial << "Latching Relay B turned " << (value ? "on\n" : "off\n");
            }
            break;
        default:
            break;
    }
}

int32_t leafReadCommand(EepromData *eepromData, uint32_t deviceAddress) {
    // is it for us?
    if (deviceAddress < eepromData->baseId || deviceAddress >= eepromData->baseId + eepromData->numDevices) {
        return -1;
    }

    uint8_t deviceI = deviceAddress - eepromData->baseId;
    switch (eepromData->deviceTypes[deviceI]) {
        case DEVICE_RELAY_A:
        case DEVICE_LATCHING_RELAY_A:
            if (LEAF_UART_ENABLED) {
                Serial << "Reading (latching?) relay A: " << (relayAState ? "on\n" : "off\n");
            }
            return relayAState;
        case DEVICE_RELAY_B:
        case DEVICE_LATCHING_RELAY_B:
            if (LEAF_UART_ENABLED) {
                Serial << "Reading (latching?) relay B: " << (relayBState ? "on\n" : "off\n");
            }
            return relayBState;
        default:
            return -1;
    }
}

void leafHandleAuthenticatedMsg(EepromData *eepromData, uint32_t deviceAddress, uint8_t* dataMessage) {
    if (LEAF_UART_ENABLED) {
        Serial << "Received authenticated message to " << deviceAddress << endl;
        Serial << "Data bytes: ";
        for (uint8_t i = 0; i < DATA_LENGTH; i++) {
            Serial << dataMessage[i] << ", ";
        }
        Serial << endl;
    }

    if (deviceAddress < eepromData->baseId || deviceAddress >= eepromData->baseId + eepromData->numDevices) {
        if (LEAF_UART_ENABLED) {
            Serial << "Message was not for us!\n";
        }
        set_sleep_mode(SLEEP_MODE_PWR_DOWN); // return to deep sleep
        return;
    }

    uint8_t messageI = 0;
    uint8_t command = dataMessage[messageI++];
    int32_t value = (uint32_t)dataMessage[messageI] << 24 | (uint32_t)dataMessage[messageI + 1] << 16 | (uint16_t)dataMessage[messageI + 2] << 8 | dataMessage[messageI + 3];
    messageI += 4;

    // make sure timer 0 is enabled, which powers millis for timing our response actions
    PRR &= ~(1<<PRTIM0);

    if (command == 's') {
        leafSetCommand(eepromData, deviceAddress, value);
    } else if (command == 'r') {
        uint32_t value = leafReadCommand(eepromData, deviceAddress);
        uint8_t message[DATA_LENGTH];
        uint8_t messageI = 0;
        message[messageI++] = 'v';
        message[messageI++] = (value >> 24) & 0xff;
        message[messageI++] = (value >> 16) & 0xff;
        message[messageI++] = (value >> 8) & 0xff;
        message[messageI++] = value & 0xff;
        advanceNonce();
        sendMessage(deviceAddress, message);
    } else if (LEAF_UART_ENABLED) {
        Serial << "Unknown command: " << command << endl;
    }

    if (LEAF_UART_ENABLED) {
        delay(10); // time to finish sending message
    }

    PRR |= (1<<PRTIM0); // done with timer 0
}

ISR(INT0_vect) {
    // Use standby sleep as we receive the IR communication
    set_sleep_mode(SLEEP_MODE_EXT_STANDBY);
    EIMSK = 0; // don't continue firing this interrupt
    Serial << "INT\n";
}

void leafSetup(EepromData *eepromData) {
    pinMode(RELAY_A_RESET_PIN, OUTPUT);
    pinMode(RELAY_A_SET_PIN, OUTPUT);
    pinMode(RELAY_B_RESET_PIN, OUTPUT);
    pinMode(RELAY_B_SET_PIN, OUTPUT);

    // time for last serial text to pass through
    delay(5);

    // enable IR input interrupts
    irResume();

    // Prepare wakeup interrupt from low level on IR_RECV pin, which is also INT0
    EICRA = 0;
    EIMSK = (1<<INT0);

    // Set sleep mode, SAVE keeps the Timer2 running
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    // Disable ADC, must be done before calling turning off in PRR
    ADCSRA &= ~(1 << ADEN);
    // no need for brown-out detector
    sleep_bod_disable();
    // Power Reduction Register
    // Just leave on timer2 which we use to wakeup
    PRR = ((1<<PRADC)|(1<<PRUSART0)|(1<<PRSPI)|(1<<PRTIM1)|(1<<PRTIM0)|(0<<PRTIM2)|(1<<PRTWI));
    if (LEAF_UART_ENABLED) {
        // Enable serial
        PRR &= ~(1<<PRUSART0);
        Serial.begin(250000);
    }
    // Enter sleep mode
    sleep_mode();
}

void leafLoop(EepromData *eepromData) {
    irTryParse();
    if (LEAF_UART_ENABLED) {
        PRR &= ~(1<<PRTIM0);
        delayMicroseconds(20);
        PRR |= (1<<PRTIM0);
    }
    if (getIrRecvState() == STATE_IDLE) {
        EIMSK = (1<<INT0); // make sure we can exit deep sleep
        set_sleep_mode(SLEEP_MODE_PWR_DOWN); // return to deep sleep
    }
    sleep_mode();

    /*static int32_t attempts = 0;
    if (irTickMarkReady) {
        irTickMarkReady = false;
        Serial << irTickMark << ':' << attempts;// << endl;
        Serial << " recvI: " << irRecvI << " bit#: " << irRecvBitI << " val: " << irRecvBuffer[irRecvI] << endl;
        attempts = 0;
    } else {
        attempts++;
    }*/
}