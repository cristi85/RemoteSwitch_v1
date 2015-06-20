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
#include "config.h"
#include "delay.h"
#include "errors.h"
#include "nrf24.h"
#include "stm8l10x_it.h"
#include "timeout.h"

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */

/* Private define ------------------------------------------------------------*/
#define ON                         (u8)1
#define OFF                        (u8)0
#define READROM_U8(adr)            (u8)(*((u8 *)(u32)(adr)))
#define READROM_U16(adr)           (u16)(*((u16 *)(u32)(adr)))
#define READROM_U32(adr)           (u32)(*((u32 *)(u32)(adr)))
#define BLINK_REDLED(x)            {blink_redLED_times=(u8)x;   ((x==255)?(flag_blink_unlimited=TRUE):(flag_blink_unlimited=FALSE)); flag_blink_on_off=TRUE; cnt_state_redLED=0; LED_RED_ON; flag_blink_redLED=TRUE;}
#define BLINK_GREENLED(x)          {blink_greenLED_times=(u8)x; ((x==255)?(flag_blink_unlimited=TRUE):(flag_blink_unlimited=FALSE)); flag_blink_on_off=TRUE; cnt_state_greenLED=0; LED_GREEN_ON; flag_blink_greenLED=TRUE;}
#define BLINKSTOP_REDLED           {flag_blink_redLED=FALSE; LED_OFF;}
#define BLINKSTOP_GREENLED         {flag_blink_greenLED=FALSE; LED_OFF;}
#define ISBLINKING_REDLED          (flag_blink_redLED)
#define ISBLINKING_GREENLED        (flag_blink_greenLED)
#define STATUS_LOWBATT             (u8)0x01
#define RF_CHANNEL                 (u8)0
#define RF_PAYLOAD_LEN             (u8)6
#define HBRIDGE_CHARGE_TIME        (u16)600  /* minimum H-Bridge capacitor charge time [ms] */
#define HBRIDGE_ON_TIME            (u8)100   /* H-Bridge conduction time [ms] */
#define MAX_NUM_RECEIVERS          (u8)10
#define CONSEC_ERROR_NRF24_REG_THR (u8)10
#define BTN1_DELETE_ID_THR         (u16)3000
/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  u32 ID[MAX_NUM_RECEIVERS];
  u8 NumLrndRcv;
} tReceivers;
typedef union
{
  struct
  {
    u8 b0;
    u8 b1;
    u8 b2;
    u8 b3;
  } B;
  u32 DW;
} tBtoDW;
typedef enum States 
{
  ST_INIT                      = 0,
  ST_WAIT_INPUT_OR_FLAG        = 1,
  ST_NRF_IRQ                   = 2,
  ST_SWITCH_LIGHT              = 3,
  ST_WAIT_TIMEOUT1_CAP_CHARGE  = 4,
  ST_WAIT_TIMEOUT1_HBRIDGE_ON  = 5
} StatesType;
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static u8 rcvdata[6];
static u8 tx_address[5] = {0x06, 0x05, 0x2e, 0x58, 0xc1};
static u8 rx_address[5] = {0x4e, 0xcc, 0x54, 0xda, 0x5f};
static u8 LightState = OFF;
static const tReceivers Receivers;
static tBtoDW BtoDW;
static _Bool LrnModeActive = FALSE;
static _Bool FLAG_BTN1_lock = FALSE;
static _Bool FLAG_reset_LEDblink_error = FALSE;
static _Bool FLAG_check_nrf_reg = FALSE;
static u8 error_nrf24_reg_cnt = 0;
static volatile StatesType state = ST_INIT;
static volatile u8 program_status = 0;
static volatile u8 interrupt_status = 0;
static volatile u8 debug_registers[8];
static u8 debug_reg_idx = 0;
static u8 task_1000ms_cnt = 0;
static u16 init_delay = U16_MAX;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void TASK_1000ms(void);
void TASK_500ms(void);
void TASK_250ms(void);
void BTN1_Released(void);
void LearnNewID(void);
_Bool IsLearnedID(void);
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  program_status = 1;
  /* Wait for power supply settling (xms) */
  while(init_delay--);
  disableInterrupts();
  Config();
  program_status = 2;
  Errors_Init();
  enableInterrupts();
  program_status = 3;
  if(RST_GetFlagStatus(RST_FLAG_IWDGF))
  {
    BLINK_REDLED(1);
  }
  else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
  {
    BLINK_REDLED(2);
  }
  RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
  while(ISBLINKING_REDLED);
  program_status = 4;
  LED_GREEN_ON;
  HBRIDGE_OFF;
  Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
  /* Wait for NRF24 power-up (200ms) */
  Timeout_SetTimeout2(200);
  while(!Timeout_IsTimeout2());
  /* init hardware pins */
  nrf24_init();
  //nrf24_config_esb(RF_CHANNEL, RF_PAYLOAD_LEN);
  nrf24_config_sb(RF_CHANNEL, RF_PAYLOAD_LEN, rx_address, tx_address);
  /* Set the device addresses */
  //nrf24_tx_address(tx_address);
  //nrf24_rx_address(rx_address);
  LED_OFF;
  IWDG_Enable();
  program_status = 5;
  while (1)
  {
    switch(state)
    {
      case ST_INIT:
      {
        state = ST_WAIT_INPUT_OR_FLAG;
        break;
      }
      case ST_WAIT_INPUT_OR_FLAG:
      {
        if(FLAG_250ms)
        {
          FLAG_250ms = FALSE;
          TASK_250ms();
        }
        if(FLAG_500ms)
        {
          FLAG_500ms = FALSE;
          TASK_500ms();
        }
        if(FLAG_1000ms)
        {
          FLAG_1000ms = FALSE;
          TASK_1000ms();  // NRF check registers to be modified to fit SB configuration
        }
        /* ============== PRESS BTN1 with key repetition lock ================= */
        if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
        {
          FLAG_BTN1_lock = TRUE;
        }
        if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
        {
          FLAG_BTN1_lock = FALSE;
          BTN1_Released();
        }
        /* ============== END PRESS BTN1 with key repetition lock ================= */
        if(! NRF_IRQ_STATE)
        {
          state = ST_NRF_IRQ;
        }
        break;
      }
      case ST_NRF_IRQ:
      {
        if(!Errors_CheckError(ERROR_NRF24_INIT) && !Errors_CheckError(ERROR_NRF24_COMM))
        {
          nrf24_getData(rcvdata);
          BtoDW.B.b0 = rcvdata[0];  // convert 4 bytes to u32
          BtoDW.B.b1 = rcvdata[1];
          BtoDW.B.b2 = rcvdata[2];
          BtoDW.B.b3 = rcvdata[3];
          
          if(LrnModeActive)
          {
            LearnNewID();
            state = ST_WAIT_INPUT_OR_FLAG;
          }
          else
          {
            if(IsLearnedID())
            {
              state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
            }
            else
            {
              state = ST_WAIT_INPUT_OR_FLAG;
            }
          }
        }
        else
        {
          state = ST_WAIT_INPUT_OR_FLAG;
        }
        break;
      }
      case ST_SWITCH_LIGHT:
      {
	      u8 status;
		    status = rcvdata[4];
        if(status & STATUS_LOWBATT)
          {
            BLINK_GREENLED(5);
          } 
          else 
          {
            LED_GREEN_ON;
          }
        if(LightState == OFF)
        {
          LIGHT_ON;
          LightState = ON;
        }
        else
        {
          LIGHT_OFF;
          LightState = OFF;
        }
        /* set timeout for H-Bridge ON */
        Timeout_SetTimeout1(HBRIDGE_ON_TIME);
        state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
        break;
      }
      case ST_WAIT_TIMEOUT1_CAP_CHARGE:
      {
        if(Timeout_IsTimeout1())
        {
          state = ST_SWITCH_LIGHT;
        }
        break;
      }
      case ST_WAIT_TIMEOUT1_HBRIDGE_ON:
      {
        if(Timeout_IsTimeout1())
        {
          HBRIDGE_OFF;
          /* set timeout for H-Bridge capacitor to charge */
          Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
          BLINKSTOP_GREENLED;
          state = ST_WAIT_INPUT_OR_FLAG;
        }
        break;
      }
      default: break;
    }
    IWDG_ReloadCounter();
    if(Errors_IsError() && !FLAG_reset_LEDblink_error)
    {
      BLINK_REDLED(255);
      FLAG_reset_LEDblink_error = TRUE;
    }
    else 
    {
      if(FLAG_reset_LEDblink_error)
      {
        BLINKSTOP_REDLED;
        FLAG_reset_LEDblink_error = FALSE;
      }
    }
  }
}

_Bool IsLearnedID()
{
  u8 i;
  _Bool flag_IDfound = FALSE;
  for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
  {
    if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
    {
      flag_IDfound = TRUE;
      break;
    }
  }
  return flag_IDfound;
}

void LearnNewID()
{
  // Check if ID already exists
  u8 i;
  _Bool flag_IDfound = FALSE;
  for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
  {
    if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
    {
      flag_IDfound = TRUE;
      break;
    }
  }
  if(!flag_IDfound)
  {
    // Store Received ID in flash
    FLASH_Unlock(FLASH_MemType_Program);
    FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)rcvdata[0] );
    FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)rcvdata[1] );
    FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)rcvdata[2] );
    FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)rcvdata[3] );
    FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
    FLASH_Lock(FLASH_MemType_Program);
    /* Check what was written */
    if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
    {
      Errors_SetError(ERROR_FLASH_WRITE);
    }
  }
  LrnModeActive = FALSE;
  BLINKSTOP_GREENLED;
}

void BTN1_Released()
{
  if(BTN1_press_timer < BTN1_DELETE_ID_THR)
  {
    /* Button press was shorter than 3 seconds */
    if(!Errors_IsError())
    {
      if(!LrnModeActive)
      {
        if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
        {
          LrnModeActive = TRUE;
          BLINK_GREENLED(255);
        }
        else
        {
          BLINK_REDLED(2);
        }
      }
      else
      {
        LrnModeActive = FALSE;
        BLINKSTOP_GREENLED;
      }
    }
  }
  else
  {
    /* Button press was longer than 3 seconds */
    u8 i;
    u16 adr;
    LED_RED_ON;
    FLASH_Unlock(FLASH_MemType_Program);
    adr = (u16)&Receivers;
    for(i = 0; i < sizeof(Receivers); i++)
    {
      FLASH_EraseByte(adr++);
    }
    FLASH_Lock(FLASH_MemType_Program);
    /* Check if erase was successfull */
    Errors_ResetError(ERROR_FLASH_ERASE);
    if((*(u8*)(&Receivers.NumLrndRcv)) != 0)
    {
      Errors_SetError(ERROR_FLASH_ERASE);
    }
    if(!Errors_CheckError(ERROR_FLASH_ERASE))
    {
      for(i = 0; i < MAX_NUM_RECEIVERS; i++)
      {
        if((*(u32*)(&(Receivers.ID[i]))) != 0)
        {
          Errors_SetError(ERROR_FLASH_ERASE);
          break;
        }
      }
    }
    LED_OFF;
  }
  BTN1_press_timer = 0;
}

void TASK_1000ms()
{
  static volatile u8 read_reg;
  
  if(task_1000ms_cnt >= 0)
  {
    FLAG_check_nrf_reg = TRUE;
  }
  if(FLAG_check_nrf_reg)
  {
    /* check NRF registers to be modified to fit radio SB configuration */
    Errors_ResetError(ERROR_NRF24_REG);
    debug_reg_idx = 0;
    nrf24_readRegister(CONFIG, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)(nrf24_CONFIG|((1<<PWR_UP)|(1<<PRIM_RX))))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(RF_CH, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != RF_CHANNEL)
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(RX_PW_P1, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != RF_PAYLOAD_LEN)
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(RF_SETUP, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)((1<<RF_DR_LOW)|(3<<RF_PWR)))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(EN_AA, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)((1<<ENAA_P0)|(1<<ENAA_P1)|(0<<ENAA_P2)|(0<<ENAA_P3)|(0<<ENAA_P4)|(0<<ENAA_P5)))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(EN_RXADDR, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)((1<<ERX_P0)|(1<<ERX_P1)|(0<<ERX_P2)|(0<<ERX_P3)|(0<<ERX_P4)|(0<<ERX_P5)))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(SETUP_RETR, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)((0x04<<ARD)|(0x0F<<ARC)))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    nrf24_readRegister(DYNPD, &read_reg, 1);
    debug_registers[debug_reg_idx++] = read_reg;
    /*if(read_reg != (u8)((0<<DPL_P0)|(0<<DPL_P1)|(0<<DPL_P2)|(0<<DPL_P3)|(0<<DPL_P4)|(0<<DPL_P5)))
    {
      Errors_SetError(ERROR_NRF24_REG);
    }*/
    /*if(Errors_CheckError(ERROR_NRF24_REG) && error_nrf24_reg_cnt <= CONSEC_ERROR_NRF24_REG_THR)
    {
      error_nrf24_reg_cnt++;
      nrf24_init();
      nrf24_config_esb(RF_CHANNEL, RF_PAYLOAD_LEN);
      Errors_ResetError(ERROR_NRF24_REG);
    }
    else
    {
      error_nrf24_reg_cnt = 0;
    }*/
  }
  task_1000ms_cnt++;
}

void TASK_500ms()
{

}

void TASK_250ms()
{

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
