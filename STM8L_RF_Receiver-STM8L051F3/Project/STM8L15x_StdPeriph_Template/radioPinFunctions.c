/*
* ----------------------------------------------------------------------------
* “THE COFFEEWARE LICENSE” (Revision 1):
* <ihsan@kehribar.me> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a coffee in return.
* -----------------------------------------------------------------------------
* Please define your platform spesific functions in this file ...
* -----------------------------------------------------------------------------
*/

#include "board.h"

/* ------------------------------------------------------------------------- */
void nrf24_setupPins()
{
    /* PINS WILL BE SET UP IN config.c  */
}
/* ------------------------------------------------------------------------- */
void nrf24_ce_digitalWrite(u8 state)
{
  NRF_CE(state);
}
/* ------------------------------------------------------------------------- */
void nrf24_csn_digitalWrite(u8 state)
{
    NRF_CSN(state);
}
/* ------------------------------------------------------------------------- */
/*void nrf24_sck_digitalWrite(u8 state)
{
    NRF_SCK(state);
}

void nrf24_mosi_digitalWrite(u8 state)
{
    NRF_MOSI(state);
}

uint8_t nrf24_miso_digitalRead()
{
    return NRF_MISO_STATE;
}*/
/* ------------------------------------------------------------------------- */
