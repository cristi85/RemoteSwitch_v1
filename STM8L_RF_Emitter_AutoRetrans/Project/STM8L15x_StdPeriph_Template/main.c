/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.0
  * @date    28-June-2013
  * @brief   Main program body
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
#include "board.h"
#include "stm8l15x_it.h"
#include "config.h"
#include "delay.h"
#include "errors.h"
#include "nrf24.h"

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */

/* Private define ------------------------------------------------------------*/
#define STATUS_LOWBATT (u8)0x01
/* Private typedef -----------------------------------------------------------*/
typedef union
{
  struct
  {
    u8 b[6];
  } B;
  struct
  {
    u32 ownID;
    u8 status;
    u8 txcnt;
  } M;
} tTXmsg;
/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
#define TRANSMITTER 6
#if (TRANSMITTER == 1)
static u32 ownID_btn1 = 0xE3BB35B3;
static u32 ownID_btn2 = 0xADFE3BDC;
#elif (TRANSMITTER == 2)
static u32 ownID_btn1 = 0xDC669956;
static u32 ownID_btn2 = 0x7CCBA622;
#elif (TRANSMITTER == 3)
static u32 ownID_btn1 = 0XA42E3D62;
static u32 ownID_btn2 = 0XA727245E;
#elif (TRANSMITTER == 4)
static u32 ownID_btn1 = 0X380831CF;
static u32 ownID_btn2 = 0XA883BA17;
#elif (TRANSMITTER == 5)
static u32 ownID_btn1 = 0X2BD14591;
static u32 ownID_btn2 = 0X3F83D1E8;
#elif (TRANSMITTER == 6)
static u32 ownID_btn1 = 0XBE383603;
static u32 ownID_btn2 = 0XD9701E21;
#endif
static u8 rx_address[5] = {0x06, 0x05, 0x2e, 0x58, 0xc1};
static u8 tx_address[5] = {0x4e, 0xcc, 0x54, 0xda, 0x5f};
static u8 tx_cnt = 0;
static tTXmsg TXmsg;
/* Private function prototypes -----------------------------------------------*/
static void Goto_HALT(void);
static void LED_Green_Blink(u8);
static void LED_Red_Blink(u8);
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  static u8 status;
  bool flag_display_retrans_cnt;
  disableInterrupts();
  Config();
  Errors_Init();
  enableInterrupts();
  Goto_HALT();
  
  while (1)
  {
    if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2))
    {
      DELAY_STOP;
      goto sleep;
    }
    
    PWR_PVDCmd(ENABLE);                    /* Power voltage detector and brownout Reset unit supply current 2,6uA */
    PWR_PVDLevelConfig(PWR_PVDLevel_2V26); /* Set Programmable voltage detector threshold to 2,26V */
    if(DELAY_EXPIRED)
      flag_display_retrans_cnt = TRUE;
    else 
      flag_display_retrans_cnt = FALSE;
    while(!DELAY_EXPIRED);           /* wait for power-up delay to expire (199.68ms) - needed for nRF24L01+ power up */
    DELAY_STOP;
    
    CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
    nrf24_init();                          /* init hardware pins */
    nrf24_config(0, 6);                    /* Channel #0 , payload length: 6 */
    nrf24_tx_address(tx_address);          /* Set the device addresses */
    nrf24_rx_address(rx_address);
    
    /* Check NRF24 Init error */
    if(Errors_CheckError(ERROR_NRF24_INIT))
    {
      LED_Red_Blink(2);
      goto sleep;
    }    

    TXmsg.M.status = 0;                    /* Reset status byte */
    
    /* Check Programmable voltage detector (PVD) output flag, if battery low send this information */
    /* Internal reference voltage should be stable at this point */
    if(PWR->CSR1 & PWR_FLAG_PVDOF)
    {
      /* VDD/VDDA is below the VPVD threshold (2,26V) */
      TXmsg.M.status |= STATUS_LOWBATT;
    }
    PWR_PVDCmd(DISABLE);
    
    if(btn_pressed == BUTTON1)
    {
      TXmsg.M.ownID = (u32)ownID_btn1;
      TXmsg.M.txcnt = tx_cnt++;
      nrf24_send((u8*)&TXmsg.B.b[0]);
    }
    else if(btn_pressed = BUTTON2)
    {
      TXmsg.M.ownID = (u32)ownID_btn2;
      TXmsg.M.txcnt = tx_cnt++;
      nrf24_send((u8*)&TXmsg.B.b[0]);
    }
    btn_pressed = 0;

    do
    {
      status = nrf24_getStatus();
    }
    while(!(status & ((1 << TX_DS)  | (1 << MAX_RT))));

    if(status & (1 << TX_DS))  /* send successful */
    {
      if(flag_display_retrans_cnt)
      {
        u8 i;
        u8 retrans_cnt = nrf24_retransmissionCount();
        LED_Green_Blink(retrans_cnt);
      }
      else
      {
        LED_Green_Blink(1);
      }
    }
    else if(status & (1 << MAX_RT))  /* send failed, max retries exceeded */
    {
      LED_Red_Blink(1);
    }
    
    sleep:
    Goto_HALT();
  }
}

static void Goto_HALT()
{
  LED_OFF;
  NRF_OFF;
  // Prepare for HALT mode
  NRF_CE(0);
  NRF_CSN(0);
  //NRF_SCK(0);
  //NRF_MOSI(0);
  CLK->PCKENR1 = 0x00; //Stop all peripheral clocks
  CLK->PCKENR2 = 0x00;
  CLK->PCKENR3 = 0x00;
  PWR_FastWakeUpCmd(ENABLE);     //Enables or disables the Fast WakeUp from Ultra Low Power mode, system does not wait for VrefINT to stabilize (around 3ms)
  PWR_UltraLowPowerCmd(ENABLE);  //Enables or disables the Ultra Low Power mode, disable VrefINT during Halt or Active-Halt modes
  CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE);  //Configures clock during halt and active halt modes
                                                  //Fast wakeup from Halt/Active-halt modes enabled: HSI/8 used as system clock source after wakeup from Halt/Active-halt
  CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);  //When it is set, the main voltage regulator is powered off as soon as the MCU enters Active-halt mode, so the wakeup time is longer
                                                  //1: MVR regulator OFF in Active-halt mode
  halt(); /* go to HALT mode */
}

static void LED_Green_Blink(u8 times)
{
  if(times > 1)
  {
    u8 i;
    for(i = 0; i < times - 1; i++)
    {
      LED_GREEN_ON;
      DELAY50MS_START;
      while(!DELAY_EXPIRED);
      DELAY_STOP;
      LED_OFF;
      DELAY200MS_START;
      while(!DELAY_EXPIRED);
      DELAY_STOP;
    }
    LED_GREEN_ON;
    DELAY50MS_START;
    while(!DELAY_EXPIRED);
    DELAY_STOP;
    LED_OFF;
  }
  else if(times == 1)
  {
    LED_GREEN_ON;
    DELAY50MS_START;
    while(!DELAY_EXPIRED);
    DELAY_STOP;
    LED_OFF;
  }
}

static void LED_Red_Blink(u8 times)
{
  if(times > 1)
  {
    u8 i;
    for(i = 0; i < times - 1; i++)
    {
      LED_RED_ON;
      DELAY50MS_START;
      while(!DELAY_EXPIRED);
      DELAY_STOP;
      LED_OFF;
      DELAY200MS_START;
      while(!DELAY_EXPIRED);
      DELAY_STOP;
    }
    LED_RED_ON;
    DELAY50MS_START;
    while(!DELAY_EXPIRED);
    DELAY_STOP;
    LED_OFF;
  }
  else if(times == 1)
  {
    LED_RED_ON;
    DELAY50MS_START;
    while(!DELAY_EXPIRED);
    DELAY_STOP;
    LED_OFF;
  }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
