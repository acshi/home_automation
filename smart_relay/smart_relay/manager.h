/*
 * manager.h
 *
 * Created: 11/23/2017 1:20:17 PM
 *  Author: Acshi
 */

#ifndef MANAGER_H_
#define MANAGER_H_

#include "Arduino.h"
#include "smart_relay.h"

void managerHandleAuthenticatedMsg(EepromData *eepromData, uint16_t deviceAddress, uint8_t *dataMessage);
void managerSetup(EepromData *eepromData);
void managerLoop(EepromData *eepromData);

#endif /* MANAGER_H_ */