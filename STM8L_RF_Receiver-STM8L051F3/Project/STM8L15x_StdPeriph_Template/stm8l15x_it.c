/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/stm8l15x_it.c
  * @author  MCD Application Team
  * @version V1.6.0
  * @date    28-June-2013
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all peripherals interrupt service routine.
  ******************************************************************************
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */  

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x_it.h"
#include "board.h"
#include "delay.h"

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */
/* Periodic Tasks */
#define CNTVAL_250MS  (u16)250
_Bool FLAG_250ms = FALSE;
u16 cnt_flag_250ms = 0;
#define CNTVAL_500MS  (u16)500
_Bool FLAG_500ms = FALSE;
u16 cnt_flag_500ms = 0;
#define CNTVAL_1000MS (u16)1000
_Bool FLAG_1000ms = FALSE;
u16 cnt_flag_1000ms = 0;
/*================*/

/* Buttons debouncing and repetition delay */
#define DIG_IN_DEB_TIME   (u8)30    /* 30ms digital input debounce time */
#define BTN_DELAY         (u8)150   //300ms
u8 btn1_0_cnt = 0;
u8 btn1_1_cnt = 0;
u8 BTN1_DEB_STATE = BTN_DEPRESSED;	
_Bool BTN1_DELAY_FLAG = FALSE;
u8 btn1_delay_cnt = 0;
u16 BTN1_press_timer = 0;
/* External variables */
extern _Bool Timeout_istout1;
extern _Bool Timeout_istout2;
extern u16 Timeout_toutcnt1;
extern u16 Timeout_toutcnt2;
extern u16 Timeout_tout1;
extern u16 Timeout_tout2;

/* LED Blink */
#define LEDBLINK_ONTIME  (u16)50
#define LEDBLINK_OFFTIME (u16)200
u16 cnt_blink_redLED = 0;
u16 cnt_blink_greenLED = 0;
_Bool flag_blink_on_off = TRUE;
_Bool flag_blink_redLED = FALSE;
_Bool flag_blink_greenLED = FALSE;
extern _Bool flag_blink_redLED;
extern _Bool flag_blink_greenLED;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
#ifdef _COSMIC_
/**
  * @brief Dummy interrupt routine
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt,0)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif

/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief FLASH Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(FLASH_IRQHandler,1)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief DMA1 channel0 and channel1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief DMA1 channel2 and channel3 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief RTC / CSS_LSE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief External IT PORTE/F and PVD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PORTB / PORTG Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PORTD /PORTH Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN0 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN2 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
  if(!BTN1_STATE)
  {
    
  }
  EXTI->SR1 |= BTN1_PIN; //clear interrupt flag by writing a "1"
}

/**
  * @brief External IT PIN3 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN4 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
  if(!NRF_IRQ_STATE)
  {
    
  }
  EXTI->SR1 |= NRF_IRQ_PIN; //clear interrupt flag by writing a "1"
}

/**
  * @brief External IT PIN5 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN6 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief External IT PIN7 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief LCD /AES Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief CLK switch/CSS/TIM1 break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief ADC1/Comparator Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief TIM2 Update/Overflow/Trigger/Break /USART2 TX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
  if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
  {
    /* ===== CKECK PERIODIC TASKS FLAGS ===== */
    if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
    if(cnt_flag_250ms >= CNTVAL_250MS) 
    {
      cnt_flag_250ms = 0;
      FLAG_250ms = TRUE;
    }
    if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
    if(cnt_flag_500ms >= CNTVAL_500MS) 
    {
      cnt_flag_500ms = 0;
      FLAG_500ms = TRUE;
    }
    if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
    if(cnt_flag_1000ms >= CNTVAL_1000MS) 
    {
      cnt_flag_1000ms = 0;
      FLAG_1000ms = TRUE;
    }
    /* ===== CHECK TIMEOUTS ===== */
    if(!Timeout_istout1)
    {
      Timeout_toutcnt1++;
      if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
    }
    if(!Timeout_istout2)
    {
      Timeout_toutcnt2++;
      if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
    }
    /* ========== DEBOUNCE INPUTS ========== 1MS */
    /* Debounce BTN1 */
    if(!BTN1_STATE)
    {
      if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
      btn1_1_cnt = 0;
      if(btn1_0_cnt >= DIG_IN_DEB_TIME)
      {
        BTN1_DEB_STATE = BTN_PRESSED;
      }
    }
    else
    {
      if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
      btn1_0_cnt = 0;
      if(btn1_1_cnt >= DIG_IN_DEB_TIME)
      {
        BTN1_DEB_STATE = BTN_DEPRESSED;
        BTN1_press_timer = 0;
      }
    }
   
    /* Record button press time */
    if(BTN1_DEB_STATE == BTN_PRESSED)
    {
      if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
    }
    /* Process button repetition rate delays */
    if(!BTN1_DELAY_FLAG)
    {
      btn1_delay_cnt++;
      if(btn1_delay_cnt == BTN_DELAY)
      {
        btn1_delay_cnt = 0;
        BTN1_DELAY_FLAG = TRUE;
      }
    }
    /* ======================================= */
    
    /* Blink LED */
    if(flag_blink_redLED)
    {
      if(cnt_blink_redLED < U16_MAX) cnt_blink_redLED++;
      if(flag_blink_on_off)
      {
        if(cnt_blink_redLED >= LEDBLINK_ONTIME)
        {
          flag_blink_on_off = FALSE;
          cnt_blink_redLED = 0;
          LED_OFF;
        }
      }
      else
      {
        if(cnt_blink_redLED >= LEDBLINK_OFFTIME)
        {
          flag_blink_on_off = TRUE;
          cnt_blink_redLED = 0;
          LED_RED_ON;
        }
      }
    }
    if(flag_blink_greenLED)
    {
      if(cnt_blink_greenLED < U16_MAX) cnt_blink_greenLED++;
      if(flag_blink_on_off)
      {
        if(cnt_blink_greenLED >= LEDBLINK_ONTIME)
        {
          flag_blink_on_off = FALSE;
          cnt_blink_greenLED = 0;
          LED_OFF;
        }
      }
      else
      {
        if(cnt_blink_greenLED >= LEDBLINK_OFFTIME)
        {
          flag_blink_on_off = TRUE;
          cnt_blink_greenLED = 0;
          LED_GREEN_ON;
        }
      }
    }
    /* ======================================= */
    TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
  }
}

/**
  * @brief Timer2 Capture/Compare / USART2 RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}


/**
  * @brief Timer3 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief Timer3 Capture/Compare /USART3 RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief TIM1 Update/Overflow/Trigger/Commutation Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief TIM1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief SPI1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI1_IRQHandler,26)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */		
}

/**
  * @brief USART1 TX / TIM5 Update/Overflow/Trigger/Break Interrupt  routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief USART1 RX / Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief I2C1 / SPI2 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @}
  */ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/