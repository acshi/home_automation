/*
 * manager.c
 *
 * Created: 11/23/2017 1:18:38 PM
 *  Author: Acshi
 */

 #include "manager.h"
 #include "leaf.h"
 #include "smart_relay.h"

void managerHandleAuthenticatedMsg(EepromData *eepromData, uint32_t deviceAddress, uint8_t* dataMessage) {
    Serial << "Received authenticated message to " << deviceAddress << endl;
    Serial << "Data bytes: ";
    for (uint8_t i = 0; i < DATA_LENGTH; i++) {
        Serial << dataMessage[i] << ", ";
    }
    Serial << endl;

    uint8_t messageI = 0;
    uint8_t command = dataMessage[messageI++];
    int32_t value = (uint32_t)dataMessage[messageI] << 24 | (uint32_t)dataMessage[messageI + 1] << 16 | (uint16_t)dataMessage[messageI + 2] << 8 | dataMessage[messageI + 3];
    messageI += 4;

    if (command == 'v') {
        Serial << 'v' << deviceAddress << ':' << value << endl;
    }
}

void managerSetCommand(EepromData *eepromData, uint32_t deviceAddress, int32_t value) {
    // is it for us?
    if (deviceAddress >= eepromData->baseId && deviceAddress < eepromData->baseId + eepromData->numDevices) {
        leafSetCommand(eepromData, deviceAddress, value);
        return;
    }

    Serial << "Forwarding command not for us\n";

    // forward it over IR
    uint8_t message[DATA_LENGTH];
    uint8_t messageI = 0;
    message[messageI++] = 's';
    message[messageI++] = (value >> 24) & 0xff;
    message[messageI++] = (value >> 16) & 0xff;
    message[messageI++] = (value >> 8) & 0xff;
    message[messageI++] = value & 0xff;

    randomizeNonce();
    sendMessage(deviceAddress, message);
}

void managerReadCommand(EepromData *eepromData, uint32_t deviceAddress) {
    // is it for us?
    if (deviceAddress >= eepromData->baseId && deviceAddress < eepromData->baseId + eepromData->numDevices) {
        int32_t value = leafReadCommand(eepromData, deviceAddress);
        Serial << 'v' << deviceAddress << ':' << value << endl;
        return;
    }

    Serial << "Forwarding command not for us\n";

    // forward it over IR
    uint8_t message[DATA_LENGTH] = {'r', 0, 0, 0, 0};
    randomizeNonce();
    sendMessage(deviceAddress, message);
}

void managerSetup(EepromData *eepromData) {

}

void managerLoop(EepromData *eepromData) {
    irTryParse();

    while (Serial.available()) {
        int16_t c = Serial.read();
        if (c != 's' && c != 'r') {
            continue;
        }

        uint32_t deviceAddress = Serial.parseInt();

        // set value
        if (c == 's') {
            int16_t sep = Serial.read();
            if (sep != ':') {
                Serial << "expected ':'\n";
                break;
            }
            int32_t value = Serial.parseInt();
            Serial << "Set command for " << deviceAddress << " with value " << value << endl;
            managerSetCommand(eepromData, deviceAddress, value);
        } else if (c == 'r') {
            Serial << "Read command for " << deviceAddress << endl;
            managerReadCommand(eepromData, deviceAddress);
        }
    }
}