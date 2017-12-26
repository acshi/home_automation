/*
 * leaf.cpp
 *
 * Created: 11/23/2017 1:19:40 PM
 *  Author: Acshi
 */

#include "leaf.h"
#include "smart_relay.h"

bool relayAState = false;
bool relayBState = false;

void leafSetCommand(EepromData *eepromData, uint16_t deviceAddress, int16_t value) {
    // is it for us?
    if (deviceAddress < eepromData->baseId || deviceAddress >= eepromData->baseId + eepromData->numDevices) {
        return;
    }

    uint8_t deviceI = deviceAddress - eepromData->baseId;
    switch (eepromData->deviceTypes[deviceI]) {
        case DEVICE_RELAY_A:
            relayAState = value ? HIGH : LOW;
            digitalWrite(RELAY_A_SET_PIN, relayAState);
            break;
        case DEVICE_RELAY_B:
            relayBState = value ? HIGH : LOW;
            digitalWrite(RELAY_B_SET_PIN, relayBState);
            break;
    }
}

void leafHandleAuthenticatedMsg(EepromData *eepromData, uint16_t deviceAddress, uint8_t* dataMessage) {
    Serial << "Received authenticated message to " << deviceAddress << endl;
    Serial << "Data bytes: ";
    for (uint8_t i = 0; i < DATA_LENGTH; i++) {
        Serial << dataMessage[i] << ", ";
    }
    Serial << endl;

    if (deviceAddress < eepromData->baseId || deviceAddress >= eepromData->baseId + eepromData->numDevices) {
        Serial << "Message was not for us!\n";
        return;
    }

    uint8_t messageI = 0;
    uint8_t command = dataMessage[messageI++];
    int16_t value = dataMessage[messageI] << 8 | dataMessage[messageI + 1];
    messageI += 2;

    if (command == 's') {
        leafSetCommand(eepromData, deviceAddress, value);
    } else {
        Serial << "Unknown command: " << command << endl;
    }
}

void leafSetup(EepromData *eepromData) {
    pinMode(RELAY_A_SET_PIN, OUTPUT);
    pinMode(RELAY_B_SET_PIN, OUTPUT);
}

void leafLoop(EepromData *eepromData) {
    irTryParse();

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