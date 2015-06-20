#ifndef _DELAY_H_
#define _DELAY_H_

#include "board.h"

#define DELAY200MS_START   {CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  \
                             /* Init TIM4 to give Update event after 199.68ms */     \
                             /* Increment TIM4 every 1.024ms (for 2MHz clock) */     \
                             TIM4->PSCR = (u8)(TIM4_Prescaler_2048);                 \
                             TIM4->ARR = 195;  /* 195 * 1.024ms = 199.68ms */        \
                             TIM4->CNTR = 0;                                         \
                             TIM4->SR1 &= (u8)(~TIM4_IT_Update);                     \
                             TIM4->CR1 |= TIM4_CR1_CEN;                              \
                            }
#define DELAY120MS_START   {CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  \
                             /* Init TIM4 to give Update event after 199.68ms */     \
                             /* Increment TIM4 every 1.024ms (for 2MHz clock) */     \
                             TIM4->PSCR = (u8)(TIM4_Prescaler_2048);                 \
                             TIM4->ARR = 117;  /* 1117 * 1.024ms = 119.808 ms */     \
                             TIM4->CNTR = 0;                                         \
                             TIM4->SR1 &= (u8)(~TIM4_IT_Update);                     \
                             TIM4->CR1 |= TIM4_CR1_CEN;                              \
                            }
#define DELAY50MS_START   {CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  \
                             /* Init TIM4 to give Update event after 199.68ms */    \
                             /* Increment TIM4 every 1.024ms (for 2MHz clock) */    \
                             TIM4->PSCR = (u8)(TIM4_Prescaler_2048);                \
                             TIM4->ARR = 49;  /* 49 * 1.024ms = 50.176ms */         \
                             TIM4->CNTR = 0;                                        \
                             TIM4->SR1 &= (u8)(~TIM4_IT_Update);                    \
                             TIM4->CR1 |= TIM4_CR1_CEN;                             \
                          }
#define DELAY5MS_START    {CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  \
                             /* Init TIM4 to give Update event after 199.68ms */    \
                             /* Increment TIM4 every 1.024ms (for 2MHz clock) */    \
                             TIM4->PSCR = (u8)(TIM4_Prescaler_2048);                \
                             TIM4->ARR = 5;  /* 5 * 1.024ms = 5.12 ms */            \
                             TIM4->CNTR = 0;                                        \
                             TIM4->SR1 &= (u8)(~TIM4_IT_Update);                    \
                             TIM4->CR1 |= TIM4_CR1_CEN;                             \
                          }
#define DELAY_STOP        { TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);                       \
                            CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);  /* Stop TIM4 peripheral clock */ \
                          }
#define DELAY_EXPIRED     ((TIM4->SR1 & TIM4_IT_Update) != 0)

void delay_ms(u16 n_ms);
void delay_4us(u8);

#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif