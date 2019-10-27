/*
 * leaf.h
 *
 * Created: 11/23/2017 1:20:04 PM
 *  Author: Acshi
 */

#ifndef LEAF_H_
#define LEAF_H_

#include "Arduino.h"
#include "smart_relay.h"

void leafSetCommand(EepromData *eepromData, uint32_t deviceAddress, int32_t value);
int32_t leafReadCommand(EepromData *eepromData, uint32_t deviceAddress);
void leafHandleAuthenticatedMsg(EepromData *eepromData, uint32_t deviceAddress, uint8_t *dataMessage);
void leafSetupPins();
void leafSetup(EepromData *eepromData);
void leafLoop(EepromData *eepromData);

#endif /* LEAF_H_ */