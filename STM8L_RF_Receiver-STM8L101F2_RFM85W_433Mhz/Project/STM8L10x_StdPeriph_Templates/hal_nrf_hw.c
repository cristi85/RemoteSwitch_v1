/*
 * Copyright (c) 2006 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is confidential property of Nordic Semiconductor. The use,
 * copying, transfer or disclosure of such information is prohibited except by express written
 * agreement with Nordic Semiconductor.
 *
 */
/** @file
 *  C-file defining the hardware depenent interface of the nRF24l01.
 *
 *  @author Jon Helge Nistad
 *
 */
#include "board.h"

extern uint8_t spi_transfer(uint8_t tx);

u8 hal_nrf_rw(u8 value)
{
  //return hal_spi_master_read_write(value);
  return spi_transfer(value);
}

