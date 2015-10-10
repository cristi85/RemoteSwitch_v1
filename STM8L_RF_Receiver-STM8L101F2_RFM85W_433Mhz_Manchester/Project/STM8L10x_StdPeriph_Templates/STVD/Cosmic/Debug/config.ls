   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  62                     ; 3 void Config()
  62                     ; 4 {
  64                     .text:	section	.text,new
  65  0000               _Config:
  69                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for system periodic flags and timeouts
  71  0000 ae0401        	ldw	x,#1025
  72  0003 cd0000        	call	_CLK_PeripheralClockConfig
  74                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  76  0006 ae047d        	ldw	x,#1149
  77  0009 cd0000        	call	_TIM4_TimeBaseInit
  79                     ; 20   TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  81  000c ae0101        	ldw	x,#257
  82  000f cd0000        	call	_TIM4_ITConfig
  84                     ; 21   TIM4_Cmd(ENABLE);
  86  0012 a601          	ld	a,#1
  87  0014 cd0000        	call	_TIM4_Cmd
  89                     ; 24   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);           // 16bit: used for runtime measurement
  91  0017 ae0101        	ldw	x,#257
  92  001a cd0000        	call	_CLK_PeripheralClockConfig
  94                     ; 25   TIM2_TimeBaseInit(TIM2_Prescaler_2, TIM2_CounterMode_Up, 0xFFFF); // timebase of 1us, 2MHz/2=1M
  96  001d aeffff        	ldw	x,#65535
  97  0020 89            	pushw	x
  98  0021 ae0100        	ldw	x,#256
  99  0024 cd0000        	call	_TIM2_TimeBaseInit
 101  0027 a601          	ld	a,#1
 102  0029 85            	popw	x
 103                     ; 26   TIM2_Cmd(ENABLE);
 105  002a cd0000        	call	_TIM2_Cmd
 107                     ; 29   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 109  002d ae0201        	ldw	x,#513
 110  0030 cd0000        	call	_CLK_PeripheralClockConfig
 112                     ; 30   TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 0xFFFF);  // 1us timebase @ 2MHz system clock
 114  0033 aeffff        	ldw	x,#65535
 115  0036 89            	pushw	x
 116  0037 ae0100        	ldw	x,#256
 117  003a cd0000        	call	_TIM3_TimeBaseInit
 119  003d 85            	popw	x
 120                     ; 31   TIM3_ICInit(TIM3_Channel_2,
 120                     ; 32               TIM3_ICPolarity_Falling,
 120                     ; 33               TIM3_ICSelection_IndirectTI,
 120                     ; 34               TIM3_ICPSC_Div1,
 120                     ; 35               0);
 122  003e 4b00          	push	#0
 123  0040 4b00          	push	#0
 124  0042 4b02          	push	#2
 125  0044 ae0101        	ldw	x,#257
 126  0047 cd0000        	call	_TIM3_ICInit
 128  004a 5b03          	addw	sp,#3
 129                     ; 36   TIM3_ICInit(TIM3_Channel_1,
 129                     ; 37               TIM3_ICPolarity_Rising,
 129                     ; 38               TIM3_ICSelection_DirectTI,
 129                     ; 39               TIM3_ICPSC_Div1,
 129                     ; 40               0);
 131  004c 4b00          	push	#0
 132  004e 4b00          	push	#0
 133  0050 4b01          	push	#1
 134  0052 5f            	clrw	x
 135  0053 cd0000        	call	_TIM3_ICInit
 137  0056 5b03          	addw	sp,#3
 138                     ; 41   TIM3_SelectInputTrigger(TIM3_TRGSelection_TI1FP1);
 140  0058 a650          	ld	a,#80
 141  005a cd0000        	call	_TIM3_SelectInputTrigger
 143                     ; 42   TIM3_SelectSlaveMode(TIM3_SlaveMode_Reset);  // Reset timer on selected trigger signal
 145  005d a604          	ld	a,#4
 146  005f cd0000        	call	_TIM3_SelectSlaveMode
 148                     ; 43   TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
 150  0062 ae0201        	ldw	x,#513
 151  0065 cd0000        	call	_TIM3_ITConfig
 153                     ; 44   TIM3_ITConfig(TIM3_IT_CC2, ENABLE);
 155  0068 ae0401        	ldw	x,#1025
 156  006b cd0000        	call	_TIM3_ITConfig
 158                     ; 45   TIM3_Cmd(ENABLE);
 160  006e a601          	ld	a,#1
 161  0070 cd0000        	call	_TIM3_Cmd
 163                     ; 48   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 165  0073 4bc0          	push	#192
 166  0075 4b08          	push	#8
 167  0077 ae500a        	ldw	x,#20490
 168  007a cd0000        	call	_GPIO_Init
 170  007d 85            	popw	x
 171                     ; 49   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 173  007e 4bc0          	push	#192
 174  0080 4b10          	push	#16
 175  0082 ae500a        	ldw	x,#20490
 176  0085 cd0000        	call	_GPIO_Init
 178  0088 85            	popw	x
 179                     ; 52   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 181  0089 4b00          	push	#0
 182  008b 4b04          	push	#4
 183  008d ae5000        	ldw	x,#20480
 184  0090 cd0000        	call	_GPIO_Init
 186  0093 85            	popw	x
 187                     ; 55   GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_In_PU_No_IT);
 189  0094 4b40          	push	#64
 190  0096 4b02          	push	#2
 191  0098 ae5005        	ldw	x,#20485
 192  009b cd0000        	call	_GPIO_Init
 194  009e 85            	popw	x
 195                     ; 58   GPIO_Init(DEBUG_PIN_PORT, DEBUG_PIN_PIN, GPIO_Mode_Out_PP_Low_Fast);
 197  009f 4be0          	push	#224
 198  00a1 4b08          	push	#8
 199  00a3 ae5005        	ldw	x,#20485
 200  00a6 cd0000        	call	_GPIO_Init
 202  00a9 85            	popw	x
 203                     ; 61   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 205  00aa 4bf0          	push	#240
 206  00ac 4b01          	push	#1
 207  00ae ae500f        	ldw	x,#20495
 208  00b1 cd0000        	call	_GPIO_Init
 210  00b4 85            	popw	x
 211                     ; 62   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 213  00b5 4bf0          	push	#240
 214  00b7 4b04          	push	#4
 215  00b9 ae5005        	ldw	x,#20485
 216  00bc cd0000        	call	_GPIO_Init
 218  00bf 85            	popw	x
 219                     ; 63   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 221  00c0 4be0          	push	#224
 222  00c2 4b01          	push	#1
 223  00c4 ae5005        	ldw	x,#20485
 224  00c7 cd0000        	call	_GPIO_Init
 226  00ca 85            	popw	x
 227                     ; 64   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 229  00cb 4be0          	push	#224
 230  00cd 4b04          	push	#4
 231  00cf ae500a        	ldw	x,#20490
 232  00d2 cd0000        	call	_GPIO_Init
 234  00d5 85            	popw	x
 235                     ; 65 }
 238  00d6 81            	ret	
 251                     	xdef	_Config
 252                     	xref	_TIM4_ITConfig
 253                     	xref	_TIM4_Cmd
 254                     	xref	_TIM4_TimeBaseInit
 255                     	xref	_TIM3_SelectSlaveMode
 256                     	xref	_TIM3_SelectInputTrigger
 257                     	xref	_TIM3_ITConfig
 258                     	xref	_TIM3_Cmd
 259                     	xref	_TIM3_ICInit
 260                     	xref	_TIM3_TimeBaseInit
 261                     	xref	_TIM2_Cmd
 262                     	xref	_TIM2_TimeBaseInit
 263                     	xref	_GPIO_Init
 264                     	xref	_CLK_PeripheralClockConfig
 283                     	end
