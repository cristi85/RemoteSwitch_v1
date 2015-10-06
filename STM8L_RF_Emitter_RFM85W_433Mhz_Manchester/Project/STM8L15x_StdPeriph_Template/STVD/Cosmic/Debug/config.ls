   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  51                     ; 3 void Config()
  51                     ; 4 {
  53                     .text:	section	.text,new
  54  0000               _Config:
  58                     ; 12   EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);
  60  0000 5f            	clrw	x
  61  0001 cd0000        	call	_EXTI_SetPinSensitivity
  63                     ; 18   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  65  0004 4b20          	push	#32
  66  0006 4b01          	push	#1
  67  0008 ae5005        	ldw	x,#20485
  68  000b cd0000        	call	_GPIO_Init
  70  000e 85            	popw	x
  71                     ; 19   GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
  73  000f 4b20          	push	#32
  74  0011 4b01          	push	#1
  75  0013 ae500f        	ldw	x,#20495
  76  0016 cd0000        	call	_GPIO_Init
  78  0019 85            	popw	x
  79                     ; 35   GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_Out_PP_Low_Fast);
  81  001a 4be0          	push	#224
  82  001c 4b02          	push	#2
  83  001e ae5005        	ldw	x,#20485
  84  0021 cd0000        	call	_GPIO_Init
  86  0024 85            	popw	x
  87                     ; 36   GPIO_Init(RFM_ON_PORT,   RFM_ON_PIN,   GPIO_Mode_Out_PP_Low_Fast);
  89  0025 4be0          	push	#224
  90  0027 4b08          	push	#8
  91  0029 ae5005        	ldw	x,#20485
  92  002c cd0000        	call	_GPIO_Init
  94  002f 85            	popw	x
  95                     ; 39   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  97  0030 4bc0          	push	#192
  98  0032 4b20          	push	#32
  99  0034 ae500a        	ldw	x,#20490
 100  0037 cd0000        	call	_GPIO_Init
 102  003a 85            	popw	x
 103                     ; 40   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 105  003b 4bc0          	push	#192
 106  003d 4b40          	push	#64
 107  003f ae500a        	ldw	x,#20490
 108  0042 cd0000        	call	_GPIO_Init
 110  0045 72165005      	bset	20485,#3
 111  0049 72135005      	bres	20485,#1
 112  004d 85            	popw	x
 113                     ; 42   RFM_OFF;
 115                     ; 43   RFM_DATA(0);
 117                     ; 44 }
 120  004e 81            	ret	
 133                     	xdef	_Config
 134                     	xref	_GPIO_Init
 135                     	xref	_EXTI_SetPinSensitivity
 154                     	end
