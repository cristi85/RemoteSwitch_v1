#include "board.h"

void Config()
{
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  //CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //set HSI/4 = 4MHz SysClk to Core and Memory, minimum clock = 125KHz for CLK_SYSCLKDiv_128
  //PWR_PVDCmd(ENABLE);  //Power voltage detector and brownout Reset unit supply current 2,6uA
  //PWR_PVDLevelConfig(PWR_PVDLevel_2V26); //set Programmable voltage detector threshold to 2,26V
  //PWR_GetFlagStatus(PWR_FLAG_PVDOF);  //checks whether the specified PWR flag is set or not
  
  //Configure external interrupts - BTN1 and BTN2 presses
  EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);
  //EXTI_SetPinSensitivity(EXTI_Pin_4, EXTI_Trigger_Falling_Low);
  //EXTI_SelectPort(EXTI_Port_B);
  //EXTI_SetHalfPortSelection(EXTI_HalfPort_B_MSB, ENABLE);
  
  
  
  /* SPI configuration */
  CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  SPI_Init(SPI1, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0);
  SPI_Cmd(SPI1, ENABLE);
  
  /* Output PP High - bicolor LED to GND */
  GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);

  /* Input FL IT - onboard Button, external pull-up */
  GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
  
  /* nRF24L01+ pins */
  GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF_ON_PORT,   NRF_ON_PIN,   GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
  GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  GPIO_Mode_In_FL_No_IT);

  NRF_OFF;
  NRF_CE(0);
  NRF_CSN(0);
  //NRF_SCK(0);
  //NRF_MOSI(0);
}

uint8_t spi_transfer(uint8_t tx)
{
  SPI1->DR = tx;
  while(!(SPI1->SR & SPI_FLAG_RXNE));
  return ((uint8_t)SPI1->DR);
}