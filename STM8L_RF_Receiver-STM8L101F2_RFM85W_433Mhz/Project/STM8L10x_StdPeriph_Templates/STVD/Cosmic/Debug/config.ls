   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  63                     ; 3 void Config()
  63                     ; 4 {
  65                     .text:	section	.text,new
  66  0000               _Config:
  70                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  72  0000 ae0401        	ldw	x,#1025
  73  0003 cd0000        	call	_CLK_PeripheralClockConfig
  75                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  77  0006 ae047d        	ldw	x,#1149
  78  0009 cd0000        	call	_TIM4_TimeBaseInit
  80                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  82  000c ae0101        	ldw	x,#257
  83  000f cd0000        	call	_CLK_PeripheralClockConfig
  85                     ; 23   TIM2_TimeBaseInit(TIM2_Prescaler_16, TIM2_CounterMode_Up, 125); // timebase of 1ms, 2MHz/16/125
  87  0012 ae007d        	ldw	x,#125
  88  0015 89            	pushw	x
  89  0016 ae0400        	ldw	x,#1024
  90  0019 cd0000        	call	_TIM2_TimeBaseInit
  92  001c 85            	popw	x
  93                     ; 24   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  95  001d ae0101        	ldw	x,#257
  96  0020 cd0000        	call	_TIM2_ITConfig
  98                     ; 25   TIM2_Cmd(ENABLE);
 100  0023 a601          	ld	a,#1
 101  0025 cd0000        	call	_TIM2_Cmd
 103                     ; 28   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 105  0028 ae0201        	ldw	x,#513
 106  002b cd0000        	call	_CLK_PeripheralClockConfig
 108                     ; 29   TIM3_DeInit();
 110  002e cd0000        	call	_TIM3_DeInit
 112                     ; 30   TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 0xFFFF);  // 16bit: RF DATA signal period measurement
 114  0031 aeffff        	ldw	x,#65535
 115  0034 89            	pushw	x
 116  0035 ae0100        	ldw	x,#256
 117  0038 cd0000        	call	_TIM3_TimeBaseInit
 119  003b 85            	popw	x
 120                     ; 31   TIM3_ICInit(TIM3_Channel_1,
 120                     ; 32               TIM3_ICPolarity_Falling,
 120                     ; 33               TIM3_ICSelection_DirectTI,
 120                     ; 34               TIM3_ICPSC_Div1,
 120                     ; 35               0x00);
 122  003c 4b00          	push	#0
 123  003e 4b00          	push	#0
 124  0040 4b01          	push	#1
 125  0042 ae0001        	ldw	x,#1
 126  0045 cd0000        	call	_TIM3_ICInit
 128  0048 5b03          	addw	sp,#3
 129                     ; 41   TIM3_SelectInputTrigger(TIM3_TRGSelection_TI1FP1);
 131  004a a650          	ld	a,#80
 132  004c cd0000        	call	_TIM3_SelectInputTrigger
 134                     ; 42   TIM3_SelectSlaveMode(TIM3_SlaveMode_Reset);
 136  004f a604          	ld	a,#4
 137  0051 cd0000        	call	_TIM3_SelectSlaveMode
 139                     ; 43   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 141  0054 a602          	ld	a,#2
 142  0056 cd0000        	call	_TIM3_ClearITPendingBit
 144                     ; 44   TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
 146  0059 ae0201        	ldw	x,#513
 147  005c cd0000        	call	_TIM3_ITConfig
 149                     ; 45   TIM3_Cmd(ENABLE);
 151  005f a601          	ld	a,#1
 152  0061 cd0000        	call	_TIM3_Cmd
 154                     ; 48   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 156  0064 4bc0          	push	#192
 157  0066 4b08          	push	#8
 158  0068 ae500a        	ldw	x,#20490
 159  006b cd0000        	call	_GPIO_Init
 161  006e 85            	popw	x
 162                     ; 49   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 164  006f 4bc0          	push	#192
 165  0071 4b10          	push	#16
 166  0073 ae500a        	ldw	x,#20490
 167  0076 cd0000        	call	_GPIO_Init
 169  0079 85            	popw	x
 170                     ; 52   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 172  007a 4b00          	push	#0
 173  007c 4b04          	push	#4
 174  007e ae5000        	ldw	x,#20480
 175  0081 cd0000        	call	_GPIO_Init
 177  0084 85            	popw	x
 178                     ; 55   GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_In_PU_No_IT);
 180  0085 4b40          	push	#64
 181  0087 4b02          	push	#2
 182  0089 ae5005        	ldw	x,#20485
 183  008c cd0000        	call	_GPIO_Init
 185  008f 85            	popw	x
 186                     ; 58   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 188  0090 4bf0          	push	#240
 189  0092 4b01          	push	#1
 190  0094 ae500f        	ldw	x,#20495
 191  0097 cd0000        	call	_GPIO_Init
 193  009a 85            	popw	x
 194                     ; 59   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 196  009b 4bf0          	push	#240
 197  009d 4b04          	push	#4
 198  009f ae5005        	ldw	x,#20485
 199  00a2 cd0000        	call	_GPIO_Init
 201  00a5 85            	popw	x
 202                     ; 60   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 204  00a6 4be0          	push	#224
 205  00a8 4b01          	push	#1
 206  00aa ae5005        	ldw	x,#20485
 207  00ad cd0000        	call	_GPIO_Init
 209  00b0 85            	popw	x
 210                     ; 61   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 212  00b1 4be0          	push	#224
 213  00b3 4b04          	push	#4
 214  00b5 ae500a        	ldw	x,#20490
 215  00b8 cd0000        	call	_GPIO_Init
 217  00bb 85            	popw	x
 218                     ; 62 }
 221  00bc 81            	ret	
 234                     	xdef	_Config
 235                     	xref	_TIM4_TimeBaseInit
 236                     	xref	_TIM3_ClearITPendingBit
 237                     	xref	_TIM3_SelectSlaveMode
 238                     	xref	_TIM3_SelectInputTrigger
 239                     	xref	_TIM3_ITConfig
 240                     	xref	_TIM3_Cmd
 241                     	xref	_TIM3_ICInit
 242                     	xref	_TIM3_TimeBaseInit
 243                     	xref	_TIM3_DeInit
 244                     	xref	_TIM2_ITConfig
 245                     	xref	_TIM2_Cmd
 246                     	xref	_TIM2_TimeBaseInit
 247                     	xref	_GPIO_Init
 248                     	xref	_CLK_PeripheralClockConfig
 267                     	end
