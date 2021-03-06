/* Copyright (c) 2007 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is property of Nordic Semiconductor ASA.
 * Terms and conditions of usage are described in detail in NORDIC
 * SEMICONDUCTOR STANDARD SOFTWARE LICENSE AGREEMENT. 
 *
 * Licensees are granted free, non-transferable use of the information. NO
 * WARRENTY of ANY KIND is provided. This heading must NOT be removed from
 * the file.
 *
 * $LastChangedRevision: 2132 $
 */ 

/** @file
 * Header file defining the hardware depenent interface of the C8051F320
 *
 *
 */

#ifndef HAL_NRF_HW_H__
#define HAL_NRF_HW_H__

//sbit CSN = P0^3;  // CSN PIN for BFB
//sbit CE = P0^4;   // CE PIN

/** Macro that set radio's CSN line LOW.
 *
 */
#define CSN_LOW() NRF_CSN(0)

/** Macro that set radio's CSN line HIGH.
 *
 */
#define CSN_HIGH() NRF_CSN(1)

/** Macro that set radio's CE line LOW.
 *
 */
#define CE_LOW() NRF_CE(0)

/** Macro that set radio's CE line HIGH.
 *
 */
#define CE_HIGH() NRF_CE(1)

/**
 * Pulses the CE to nRF24L01 for at least 10 us
 */
#define CE_PULSE()  do { \
                      uint8_t count; \
                      count = 15; \
                      NRF_CE(1);  \
                      while(count--) \
                      ; \
                      NRF_CE(0);  \
                    } while(0)


#endif /* HAL_NRF_HW_H__ */
