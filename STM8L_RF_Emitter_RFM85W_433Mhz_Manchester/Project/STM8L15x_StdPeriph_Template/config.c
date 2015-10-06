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

  /* Input FL IT - onboard Button, external pull-up */
  GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);

  // Timer 3 Configuration
  //CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  //TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 700); // 1MHz timer clock
  //TIM3_OC1Init(TIM3_OCMode_PWM1,
  //             TIM3_OutputState_Enable,
  //             350,
  //             TIM3_OCPolarity_Low,
  //             TIM3_OCIdleState_Reset);
  //TIM3_ARRPreloadConfig(ENABLE);
  //TIM3_OC1PreloadConfig(ENABLE);
  //TIM3_CtrlPWMOutputs(ENABLE);
  //TIM3_Cmd(DISABLE);
  
  /* RFM85W pins */
  GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(RFM_ON_PORT,   RFM_ON_PIN,   GPIO_Mode_Out_PP_Low_Fast);
  
  /* Output PP High - bicolor LED to GND */
  GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);

  RFM_OFF;
  RFM_DATA(0);
}