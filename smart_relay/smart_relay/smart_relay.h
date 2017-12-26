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

#define ADDRESS_LENGTH 2
#define DATA_LENGTH 3
#define CONTENT_MSG_LENGTH (ADDRESS_LENGTH + DATA_LENGTH)
#define CIPHER_LENGTH (crypto_secretbox_ZEROBYTES + CONTENT_MSG_LENGTH)
#define INNER_CIPHER_LENGTH (CIPHER_LENGTH - crypto_secretbox_BOXZEROBYTES)
#define TOTAL_MSG_LENGTH (crypto_secretbox_NONCEBYTES + INNER_CIPHER_LENGTH)

#define RELAY_A_SET_PIN 5
#define RELAY_B_SET_PIN 6

enum DEVICE_TYPE {
    DEVICE_UNUSED = 0,
    DEVICE_RELAY_A,
    DEVICE_RELAY_B
};

struct EepromData {
    uint8_t isManager;
    uint16_t baseId;
    uint8_t numDevices;
    uint8_t deviceTypes[8];
    uint8_t key[32];
};

bool irTryParse();
void sendMessage(uint16_t deviceAddress, uint8_t* dataMessage);
byte rand_byte();
void randomize_nonce();

void ir_debug();

#endif /* SMART_RELAY_H_ */