#include "board.h"

void Config()
{
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  //CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //set HSI/4 = 4MHz SysClk to Core and Memory, minimum clock = 125KHz for CLK_SYSCLKDiv_128
  //PWR_PVDCmd(ENABLE);  //Power voltage detector and brownout Reset unit supply current 2,6uA
  //PWR_PVDLevelConfig(PWR_PVDLevel_2V26); //set Programmable voltage detector threshold to 2,26V
  //PWR_GetFlagStatus(PWR_FLAG_PVDOF);  //checks whether the specified PWR flag is set or not
  
  //Configure external interrupts - BTN1 and BTN2 presses
  //EXTI_SetPinSensitivity(EXTI_Pin_2, EXTI_Trigger_Falling_Low);
  //EXTI_SetPinSensitivity(EXTI_Pin_4, EXTI_Trigger_Falling_Low);
  //EXTI_SelectPort(EXTI_Port_B);
  //EXTI_SetHalfPortSelection(EXTI_HalfPort_B_MSB, ENABLE);
  
  // Timer 4 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000

  // Timer 2 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  TIM2_TimeBaseInit(TIM2_Prescaler_16, TIM2_CounterMode_Up, 125); // timebase of 1ms, 2MHz/16/125
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  TIM2_Cmd(ENABLE);
  
  
  /* SPI configuration */
  CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  SPI_Init(SPI1, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0);
  SPI_Cmd(SPI1, ENABLE);
  
  /* Output PP High - bicolor LED to GND */
  GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);

  /* Input pull up no IT - onboard Button, external pull-up */
  GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
  
  /* nRF24L01+ pins */
  GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
  GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  /*GPIO_Mode_In_PU_IT*/GPIO_Mode_In_PU_No_IT);

  /* H bridge outputs */
  GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);

  NRF_CE(0);
  NRF_CSN(0);
  
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  IWDG_SetPrescaler(IWDG_Prescaler_16);  /* 107.78ms for RL[7:0]= 0xFF */
  IWDG_SetReload(0xFF);
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
  IWDG_ReloadCounter();
}

uint8_t spi_transfer(uint8_t tx)
{
  SPI1->DR = tx;
  while(!(SPI1->SR & SPI_FLAG_RXNE));
  return ((uint8_t)SPI1->DR);
}