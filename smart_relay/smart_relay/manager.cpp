/*
 * manager.c
 *
 * Created: 11/23/2017 1:18:38 PM
 *  Author: Acshi
 */

 #include "manager.h"
 #include "leaf.h"
 #include "smart_relay.h"

void managerHandleAuthenticatedMsg(EepromData *eepromData, uint16_t deviceAddress, uint8_t* dataMessage) {
    Serial << "Received authenticated message to " << deviceAddress << endl;
    Serial << "Data bytes: ";
    for (uint8_t i = 0; i < DATA_LENGTH; i++) {
        Serial << dataMessage[i] << ", ";
    }
    Serial << endl;

    if (deviceAddress < eepromData->baseId || deviceAddress > eepromData->baseId + eepromData->numDevices) {
        Serial << "Message was not for us!\n";
        return;
    }

    //uint8_t duplicateMessage[DATA_LENGTH];
    //for (uint8_t i = 0; i < DATA_LENGTH; i++) {
        //duplicateMessage[i] = dataMessage[i];
    //}

    //Serial << "Responding with duplicate message\n";
    //sendMessage(fromAddress, deviceAddress, duplicateMessage);
}

void managerSetCommand(EepromData *eepromData, uint16_t deviceAddress, int16_t value) {
    // is it for us?
    if (deviceAddress >= eepromData->baseId && deviceAddress < eepromData->baseId + eepromData->numDevices) {
        leafSetCommand(eepromData, deviceAddress, value);
        return;
    }

    // forward it over IR
    uint8_t message[DATA_LENGTH];
    uint8_t messageI = 0;
    message[messageI++] = 's';
    message[messageI++] = (value >> 8) & 0xff;
    message[messageI++] = value & 0xff;

    sendMessage(deviceAddress, message);
}

void managerSetup(EepromData *eepromData) {

}

void managerLoop(EepromData *eepromData) {
    irTryParse();

    while (Serial.available()) {
        int16_t c = Serial.read();
        // set value
        if (c == 's') {
            uint16_t deviceAddress = Serial.parseInt();
            int16_t sep = Serial.read();
            if (sep != ':') {
                break;
            }
            int16_t value = Serial.parseInt();
            managerSetCommand(eepromData, deviceAddress, value);
        }
    }

    /*static uint32_t lastCheckMs = millis();
    uint32_t nowMs = millis();

    if (nowMs > lastCheckMs + 100) {
        lastCheckMs = nowMs;
        ir_debug();
    }

    static uint32_t lastSendMs = millis();
    if (nowMs > lastSendMs + 2000) {
        lastSendMs = nowMs;
        Serial << "Sending message...\n";
        static uint8_t data[4] = { 1, 2, 3, 4 };
        sendMessage(1, eepromData.baseId, data);
        //advanceNonce();
        irResume();
    }*/
}