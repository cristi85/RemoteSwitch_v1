   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  61                     ; 3 void Config()
  61                     ; 4 {
  63                     .text:	section	.text,new
  64  0000               _Config:
  68                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  70  0000 ae0401        	ldw	x,#1025
  71  0003 cd0000        	call	_CLK_PeripheralClockConfig
  73                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  75  0006 ae047d        	ldw	x,#1149
  76  0009 cd0000        	call	_TIM4_TimeBaseInit
  78                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  80  000c ae0101        	ldw	x,#257
  81  000f cd0000        	call	_CLK_PeripheralClockConfig
  83                     ; 23   TIM2_TimeBaseInit(TIM2_Prescaler_16, TIM2_CounterMode_Up, 125); // timebase of 1ms, 2MHz/16/125
  85  0012 ae007d        	ldw	x,#125
  86  0015 89            	pushw	x
  87  0016 ae0400        	ldw	x,#1024
  88  0019 cd0000        	call	_TIM2_TimeBaseInit
  90  001c 85            	popw	x
  91                     ; 24   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  93  001d ae0101        	ldw	x,#257
  94  0020 cd0000        	call	_TIM2_ITConfig
  96                     ; 25   TIM2_Cmd(ENABLE);
  98  0023 a601          	ld	a,#1
  99  0025 cd0000        	call	_TIM2_Cmd
 101                     ; 43   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 103  0028 ae0201        	ldw	x,#513
 104  002b cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 44   TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 0xFFFF);  // 1us timebase @ 2MHz system clock
 108  002e aeffff        	ldw	x,#65535
 109  0031 89            	pushw	x
 110  0032 ae0100        	ldw	x,#256
 111  0035 cd0000        	call	_TIM3_TimeBaseInit
 113  0038 85            	popw	x
 114                     ; 45   TIM3_ICInit(TIM3_Channel_2,
 114                     ; 46               TIM3_ICPolarity_Falling,
 114                     ; 47               TIM3_ICSelection_IndirectTI,
 114                     ; 48               TIM3_ICPSC_Div1,
 114                     ; 49               0);
 116  0039 4b00          	push	#0
 117  003b 4b00          	push	#0
 118  003d 4b02          	push	#2
 119  003f ae0101        	ldw	x,#257
 120  0042 cd0000        	call	_TIM3_ICInit
 122  0045 5b03          	addw	sp,#3
 123                     ; 50   TIM3_ICInit(TIM3_Channel_1,
 123                     ; 51               TIM3_ICPolarity_Rising,
 123                     ; 52               TIM3_ICSelection_DirectTI,
 123                     ; 53               TIM3_ICPSC_Div1,
 123                     ; 54               0);
 125  0047 4b00          	push	#0
 126  0049 4b00          	push	#0
 127  004b 4b01          	push	#1
 128  004d 5f            	clrw	x
 129  004e cd0000        	call	_TIM3_ICInit
 131  0051 5b03          	addw	sp,#3
 132                     ; 55   TIM3_SelectInputTrigger(TIM3_TRGSelection_TI1FP1);
 134  0053 a650          	ld	a,#80
 135  0055 cd0000        	call	_TIM3_SelectInputTrigger
 137                     ; 56   TIM3_SelectSlaveMode(TIM3_SlaveMode_Reset);  // Reset timer on selected trigger signal
 139  0058 a604          	ld	a,#4
 140  005a cd0000        	call	_TIM3_SelectSlaveMode
 142                     ; 57   TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
 144  005d ae0201        	ldw	x,#513
 145  0060 cd0000        	call	_TIM3_ITConfig
 147                     ; 58   TIM3_ITConfig(TIM3_IT_CC2, ENABLE);
 149  0063 ae0401        	ldw	x,#1025
 150  0066 cd0000        	call	_TIM3_ITConfig
 152                     ; 59   TIM3_Cmd(ENABLE);
 154  0069 a601          	ld	a,#1
 155  006b cd0000        	call	_TIM3_Cmd
 157                     ; 62   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 159  006e 4bc0          	push	#192
 160  0070 4b08          	push	#8
 161  0072 ae500a        	ldw	x,#20490
 162  0075 cd0000        	call	_GPIO_Init
 164  0078 85            	popw	x
 165                     ; 63   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 167  0079 4bc0          	push	#192
 168  007b 4b10          	push	#16
 169  007d ae500a        	ldw	x,#20490
 170  0080 cd0000        	call	_GPIO_Init
 172  0083 85            	popw	x
 173                     ; 66   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 175  0084 4b00          	push	#0
 176  0086 4b04          	push	#4
 177  0088 ae5000        	ldw	x,#20480
 178  008b cd0000        	call	_GPIO_Init
 180  008e 85            	popw	x
 181                     ; 69   GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_In_PU_No_IT);
 183  008f 4b40          	push	#64
 184  0091 4b02          	push	#2
 185  0093 ae5005        	ldw	x,#20485
 186  0096 cd0000        	call	_GPIO_Init
 188  0099 85            	popw	x
 189                     ; 72   GPIO_Init(DEBUG_PIN_PORT, DEBUG_PIN_PIN, GPIO_Mode_Out_PP_Low_Fast);
 191  009a 4be0          	push	#224
 192  009c 4b08          	push	#8
 193  009e ae5005        	ldw	x,#20485
 194  00a1 cd0000        	call	_GPIO_Init
 196  00a4 85            	popw	x
 197                     ; 75   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 199  00a5 4bf0          	push	#240
 200  00a7 4b01          	push	#1
 201  00a9 ae500f        	ldw	x,#20495
 202  00ac cd0000        	call	_GPIO_Init
 204  00af 85            	popw	x
 205                     ; 76   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 207  00b0 4bf0          	push	#240
 208  00b2 4b04          	push	#4
 209  00b4 ae5005        	ldw	x,#20485
 210  00b7 cd0000        	call	_GPIO_Init
 212  00ba 85            	popw	x
 213                     ; 77   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 215  00bb 4be0          	push	#224
 216  00bd 4b01          	push	#1
 217  00bf ae5005        	ldw	x,#20485
 218  00c2 cd0000        	call	_GPIO_Init
 220  00c5 85            	popw	x
 221                     ; 78   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 223  00c6 4be0          	push	#224
 224  00c8 4b04          	push	#4
 225  00ca ae500a        	ldw	x,#20490
 226  00cd cd0000        	call	_GPIO_Init
 228  00d0 85            	popw	x
 229                     ; 79 }
 232  00d1 81            	ret	
 245                     	xdef	_Config
 246                     	xref	_TIM4_TimeBaseInit
 247                     	xref	_TIM3_SelectSlaveMode
 248                     	xref	_TIM3_SelectInputTrigger
 249                     	xref	_TIM3_ITConfig
 250                     	xref	_TIM3_Cmd
 251                     	xref	_TIM3_ICInit
 252                     	xref	_TIM3_TimeBaseInit
 253                     	xref	_TIM2_ITConfig
 254                     	xref	_TIM2_Cmd
 255                     	xref	_TIM2_TimeBaseInit
 256                     	xref	_GPIO_Init
 257                     	xref	_CLK_PeripheralClockConfig
 276                     	end
