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
            Serial << "Relay A turned " << (value ? "on\n" : "off\n");
            break;
        case DEVICE_RELAY_B:
            relayBState = value ? HIGH : LOW;
            digitalWrite(RELAY_B_SET_PIN, relayBState);
            Serial << "Relay B turned " << (value ? "on\n" : "off\n");
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
            Serial << "Latching Relay A turned " << (value ? "on\n" : "off\n");
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
            Serial << "Latching Relay B turned " << (value ? "on\n" : "off\n");
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
            Serial << "Reading (latching?) relay A: " << (relayAState ? "on\n" : "off\n");
            return relayAState;
        case DEVICE_RELAY_B:
        case DEVICE_LATCHING_RELAY_B:
            Serial << "Reading (latching?) relay B: " << (relayBState ? "on\n" : "off\n");
            return relayBState;
        default:
            return -1;
    }
}

void leafHandleAuthenticatedMsg(EepromData *eepromData, uint32_t deviceAddress, uint8_t* dataMessage) {
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
    int32_t value = (uint32_t)dataMessage[messageI] << 24 | (uint32_t)dataMessage[messageI + 1] << 16 | (uint16_t)dataMessage[messageI + 2] << 8 | dataMessage[messageI + 3];
    messageI += 4;

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
    } else {
        Serial << "Unknown command: " << command << endl;
    }
}

void leafSetup(EepromData *eepromData) {
    pinMode(RELAY_A_RESET_PIN, OUTPUT);
    pinMode(RELAY_A_SET_PIN, OUTPUT);
    pinMode(RELAY_B_RESET_PIN, OUTPUT);
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