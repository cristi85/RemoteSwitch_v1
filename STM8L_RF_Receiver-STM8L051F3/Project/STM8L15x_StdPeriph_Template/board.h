#ifndef _BOARD_H_
#define _BOARD_H_

#include "stm8l15x_conf.h"

#define HWVERSION 10  /* Hardware version v1.0 */

#if defined (HWVERSION)
  #if HWVERSION == 10  /* if Hardware version v1.0 */
    /* Board LED: Pin1, Pin2 */
    #define LED_PORT      GPIOC 
    #if defined (STM8L051F3)
      #define LED_PIN1    GPIO_Pin_5
      #define LED_PIN2    GPIO_Pin_6
    #elif defined(STM8L101F2)
      #define LED_PIN1    GPIO_Pin_3
      #define LED_PIN2    GPIO_Pin_4
    #else
      #error "Pinout configured only for STM8L051F3 and STM8L101F2!"
    #endif
    #define LED_GREEN_ON    {(LED_PORT->ODR &= (u8)(~LED_PIN1)); (LED_PORT->ODR |=       LED_PIN2);}
    #define LED_RED_ON      {(LED_PORT->ODR |=       LED_PIN1);  (LED_PORT->ODR &= (u8)(~LED_PIN2));}
    #define LED_OFF         {(LED_PORT->ODR &= (u8)(~LED_PIN1)); (LED_PORT->ODR &= (u8)(~LED_PIN2));}
    #define IS_LED_RED_ON   {(LED_PORT->ODR & LED_PIN2) && (LED_PORT->ODR & (~LED_PIN1))} 
    #define IS_LED_GREEN_ON

    /* Board Buttons
    PB0 Button 1, button press = 0
    PD0 Button 2, button press = 0
    */
    #define BTN1_PORT  GPIOA 
    #define BTN1_PIN   GPIO_Pin_2
    #define BTN1_STATE (BTN1_PORT->IDR & BTN1_PIN)

    /* ======NRF24L01+====== */
    // CE - digital OUTPUT
    #define NRF_CE_PORT   GPIOB 
    #define NRF_CE_PIN    GPIO_Pin_3
    // CSN - digital OUTPUT
    #define NRF_CSN_PORT  GPIOB 
    #define NRF_CSN_PIN   GPIO_Pin_1
    // SCK - digital OUTPUT
    #define NRF_SCK_PORT  GPIOB 
    #define NRF_SCK_PIN   GPIO_Pin_5
    // MOSI - digital OUTPUT
    #define NRF_MOSI_PORT  GPIOB 
    #define NRF_MOSI_PIN   GPIO_Pin_6
    // MISO - digital INPUT
    #define NRF_MISO_PORT  GPIOB 
    #define NRF_MISO_PIN   GPIO_Pin_7
    // IRQ - digital INPUT
    #define NRF_IRQ_PORT   GPIOB 
    #define NRF_IRQ_PIN    GPIO_Pin_4
    #define NRF_IRQ_STATE  ((u16)(NRF_IRQ_PORT->IDR & NRF_IRQ_PIN) != (u16)0 ? (u8)1 : (u8)0)
    #define NRF_CE(x)      (x==(u8)0 ? (NRF_CE_PORT->ODR   &= (~NRF_CE_PIN))   : (NRF_CE_PORT->ODR   |= NRF_CE_PIN))
    #define NRF_CSN(x)     (x==(u8)0 ? (NRF_CSN_PORT->ODR  &= (~NRF_CSN_PIN))  : (NRF_CSN_PORT->ODR  |= NRF_CSN_PIN))
    //#define NRF_SCK(x)     (x==(u8)0 ? (NRF_SCK_PORT->ODR  &= (~NRF_SCK_PIN))  : (NRF_SCK_PORT->ODR  |= NRF_SCK_PIN))
    //#define NRF_MOSI(x)    (x==(u8)0 ? (NRF_MOSI_PORT->ODR &= (~NRF_MOSI_PIN)) : (NRF_MOSI_PORT->ODR |= NRF_MOSI_PIN))
    //#define NRF_MISO_STATE ((u16)(NRF_MISO_PORT->IDR & NRF_MISO_PIN) != (u16)0 ? (u8)1 : (u8)0)
    #define NRF_OFF        (NRF_ON_PORT->ODR   |= NRF_ON_PIN)
    #define NRF_ON         (NRF_ON_PORT->ODR   &= (~NRF_ON_PIN))
    /* ======END NRF24L01+====== */

    /* H bridge */
    #define PMOS_L_PORT   GPIOD
    #define PMOS_L_PIN    GPIO_Pin_0
    #define PMOS_R_PORT   GPIOB
    #define PMOS_R_PIN    GPIO_Pin_2
    #define NMOS_L_PORT   GPIOB
    #define NMOS_L_PIN    GPIO_Pin_0
    #define NMOS_R_PORT   GPIOC
    #if defined (STM8L051F3)
      #define NMOS_R_PIN    GPIO_Pin_4
    #elif defined(STM8L101F2)
      #define NMOS_R_PIN    GPIO_Pin_2
    #else
      #error "Pinout configured only for STM8L051F3 and STM8L101F2"
    #endif
    #define PMOS_L_HIGH   (PMOS_L_PORT->ODR |= PMOS_L_PIN)
    #define PMOS_L_LOW    (PMOS_L_PORT->ODR &= (u8)(~PMOS_L_PIN))
    #define PMOS_R_HIGH   (PMOS_R_PORT->ODR |= PMOS_R_PIN)
    #define PMOS_R_LOW    (PMOS_R_PORT->ODR &= (u8)(~PMOS_R_PIN))
    #define NMOS_L_HIGH   (NMOS_L_PORT->ODR |= NMOS_L_PIN)
    #define NMOS_L_LOW    (NMOS_L_PORT->ODR &= (u8)(~NMOS_L_PIN))
    #define NMOS_R_HIGH   (NMOS_R_PORT->ODR |= NMOS_R_PIN)
    #define NMOS_R_LOW    (NMOS_R_PORT->ODR &= (u8)(~NMOS_R_PIN))
    #define HBRIDGE_OFF   {PMOS_L_HIGH; PMOS_R_HIGH; NMOS_L_LOW; NMOS_R_LOW;}
    #define HBRIDGE_OPENR {PMOS_L_LOW; NMOS_R_HIGH;} 
    #define HBRIDGE_OPENL {PMOS_R_LOW; NMOS_L_HIGH;}
    #define LIGHT_ON      HBRIDGE_OPENL
    #define LIGHT_OFF     HBRIDGE_OPENR
  #else  /* #if HWVERSION ==  */
    #error "No valid hardware version defined! Please define HWVERSION with a valid version"
  #endif
#else  /* #if defined (HWVERSION) */
  #error "No hardware version defined! Please define HWVERSION!"
#endif
#endif