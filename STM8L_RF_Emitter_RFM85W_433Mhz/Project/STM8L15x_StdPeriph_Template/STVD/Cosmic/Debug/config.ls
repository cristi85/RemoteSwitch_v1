   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  58                     ; 3 void Config()
  58                     ; 4 {
  60                     .text:	section	.text,new
  61  0000               _Config:
  65                     ; 12   EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);
  67  0000 5f            	clrw	x
  68  0001 cd0000        	call	_EXTI_SetPinSensitivity
  70                     ; 18   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  72  0004 4b20          	push	#32
  73  0006 4b01          	push	#1
  74  0008 ae5005        	ldw	x,#20485
  75  000b cd0000        	call	_GPIO_Init
  77  000e 85            	popw	x
  78                     ; 19   GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
  80  000f 4b20          	push	#32
  81  0011 4b01          	push	#1
  82  0013 ae500f        	ldw	x,#20495
  83  0016 cd0000        	call	_GPIO_Init
  85  0019 85            	popw	x
  86                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  88  001a ae0101        	ldw	x,#257
  89  001d cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 23   TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 700); // 1MHz timer clock
  93  0020 ae02bc        	ldw	x,#700
  94  0023 89            	pushw	x
  95  0024 ae0100        	ldw	x,#256
  96  0027 cd0000        	call	_TIM3_TimeBaseInit
  98  002a 85            	popw	x
  99                     ; 24   TIM3_OC1Init(TIM3_OCMode_PWM1,
  99                     ; 25                TIM3_OutputState_Enable,
  99                     ; 26                350,
  99                     ; 27                TIM3_OCPolarity_Low,
  99                     ; 28                TIM3_OCIdleState_Reset);
 101  002b 4b00          	push	#0
 102  002d 4b01          	push	#1
 103  002f ae015e        	ldw	x,#350
 104  0032 89            	pushw	x
 105  0033 ae6001        	ldw	x,#24577
 106  0036 cd0000        	call	_TIM3_OC1Init
 108  0039 5b04          	addw	sp,#4
 109                     ; 29   TIM3_ARRPreloadConfig(ENABLE);
 111  003b a601          	ld	a,#1
 112  003d cd0000        	call	_TIM3_ARRPreloadConfig
 114                     ; 30   TIM3_OC1PreloadConfig(ENABLE);
 116  0040 a601          	ld	a,#1
 117  0042 cd0000        	call	_TIM3_OC1PreloadConfig
 119                     ; 31   TIM3_CtrlPWMOutputs(ENABLE);
 121  0045 a601          	ld	a,#1
 122  0047 cd0000        	call	_TIM3_CtrlPWMOutputs
 124                     ; 32   TIM3_Cmd(DISABLE);
 126  004a 4f            	clr	a
 127  004b cd0000        	call	_TIM3_Cmd
 129                     ; 35   GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_Out_PP_Low_Fast);
 131  004e 4be0          	push	#224
 132  0050 4b02          	push	#2
 133  0052 ae5005        	ldw	x,#20485
 134  0055 cd0000        	call	_GPIO_Init
 136  0058 85            	popw	x
 137                     ; 36   GPIO_Init(RFM_ON_PORT,   RFM_ON_PIN,   GPIO_Mode_Out_PP_Low_Fast);
 139  0059 4be0          	push	#224
 140  005b 4b08          	push	#8
 141  005d ae5005        	ldw	x,#20485
 142  0060 cd0000        	call	_GPIO_Init
 144  0063 85            	popw	x
 145                     ; 39   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 147  0064 4bc0          	push	#192
 148  0066 4b20          	push	#32
 149  0068 ae500a        	ldw	x,#20490
 150  006b cd0000        	call	_GPIO_Init
 152  006e 85            	popw	x
 153                     ; 40   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 155  006f 4bc0          	push	#192
 156  0071 4b40          	push	#64
 157  0073 ae500a        	ldw	x,#20490
 158  0076 cd0000        	call	_GPIO_Init
 160  0079 72165005      	bset	20485,#3
 161  007d 85            	popw	x
 162                     ; 42   RFM_OFF;
 164                     ; 44 }
 167  007e 81            	ret	
 180                     	xdef	_Config
 181                     	xref	_TIM3_OC1PreloadConfig
 182                     	xref	_TIM3_CtrlPWMOutputs
 183                     	xref	_TIM3_OC1Init
 184                     	xref	_TIM3_Cmd
 185                     	xref	_TIM3_ARRPreloadConfig
 186                     	xref	_TIM3_TimeBaseInit
 187                     	xref	_GPIO_Init
 188                     	xref	_EXTI_SetPinSensitivity
 189                     	xref	_CLK_PeripheralClockConfig
 208                     	end
