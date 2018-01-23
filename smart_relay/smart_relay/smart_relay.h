/*
 * smart_relay.h
 *
 * Created: 11/23/2017 1:20:40 PM
 *  Author: Acshi
 */

#ifndef SMART_RELAY_H_
#define SMART_RELAY_H_

extern "C" {
    #include "avrnacl.h"
};

#include "Arduino.h"
#include "Streaming.h"
#include "IRremote.h"
#include "IRremote/boarddefs.h"

#define ADDRESS_LENGTH 4
#define DATA_LENGTH 5
#define CONTENT_MSG_LENGTH (ADDRESS_LENGTH + DATA_LENGTH)
#define CIPHER_LENGTH (crypto_secretbox_ZEROBYTES + CONTENT_MSG_LENGTH)
#define INNER_CIPHER_LENGTH (CIPHER_LENGTH - crypto_secretbox_BOXZEROBYTES)
#define TOTAL_MSG_LENGTH (crypto_secretbox_NONCEBYTES + INNER_CIPHER_LENGTH)

#define RELAY_A_SET_PIN 4
#define RELAY_A_RESET_PIN 5
#define RELAY_B_SET_PIN 6
#define RELAY_B_RESET_PIN 7

enum DEVICE_TYPE {
    DEVICE_UNUSED = 0,
    DEVICE_RELAY_A,
    DEVICE_RELAY_B,
    DEVICE_LATCHING_RELAY_A,
    DEVICE_LATCHING_RELAY_B,
    DEVICE_UNKNOWN // marks the _first_ unknown type
};

struct EepromData {
    uint8_t key[32];
    uint8_t isManager;
    uint32_t baseId;
    uint8_t numDevices;
    uint8_t deviceTypes[8];
};

bool irTryParse();
void sendMessage(uint32_t deviceAddress, uint8_t* dataMessage);
byte randByte();
void advanceNonce();
void randomizeNonce();

void irDebug();

#endif /* SMART_RELAY_H_ */