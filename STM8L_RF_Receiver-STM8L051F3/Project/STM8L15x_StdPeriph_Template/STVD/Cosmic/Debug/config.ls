   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  61                     ; 3 void Config()
  61                     ; 4 {
  63                     .text:	section	.text,new
  64  0000               _Config:
  68                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  70  0000 ae0201        	ldw	x,#513
  71  0003 cd0000        	call	_CLK_PeripheralClockConfig
  73                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  75  0006 ae047d        	ldw	x,#1149
  76  0009 cd0000        	call	_TIM4_TimeBaseInit
  78                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  80  000c ae0001        	ldw	x,#1
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
 101                     ; 29   CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
 103  0028 ae0401        	ldw	x,#1025
 104  002b cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 30   SPI_Init(SPI1, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0);
 108  002e 4b00          	push	#0
 109  0030 4b02          	push	#2
 110  0032 4b00          	push	#0
 111  0034 4b00          	push	#0
 112  0036 4b00          	push	#0
 113  0038 4b04          	push	#4
 114  003a 4b00          	push	#0
 115  003c 4b00          	push	#0
 116  003e ae5200        	ldw	x,#20992
 117  0041 cd0000        	call	_SPI_Init
 119  0044 5b08          	addw	sp,#8
 120                     ; 31   SPI_Cmd(SPI1, ENABLE);
 122  0046 4b01          	push	#1
 123  0048 ae5200        	ldw	x,#20992
 124  004b cd0000        	call	_SPI_Cmd
 126  004e 84            	pop	a
 127                     ; 34   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 129  004f 4bc0          	push	#192
 130  0051 4b20          	push	#32
 131  0053 ae500a        	ldw	x,#20490
 132  0056 cd0000        	call	_GPIO_Init
 134  0059 85            	popw	x
 135                     ; 35   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 137  005a 4bc0          	push	#192
 138  005c 4b40          	push	#64
 139  005e ae500a        	ldw	x,#20490
 140  0061 cd0000        	call	_GPIO_Init
 142  0064 85            	popw	x
 143                     ; 38   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 145  0065 4b00          	push	#0
 146  0067 4b04          	push	#4
 147  0069 ae5000        	ldw	x,#20480
 148  006c cd0000        	call	_GPIO_Init
 150  006f 85            	popw	x
 151                     ; 41   GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
 153  0070 4be0          	push	#224
 154  0072 4b08          	push	#8
 155  0074 ae5005        	ldw	x,#20485
 156  0077 cd0000        	call	_GPIO_Init
 158  007a 85            	popw	x
 159                     ; 42   GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 161  007b 4be0          	push	#224
 162  007d 4b02          	push	#2
 163  007f ae5005        	ldw	x,#20485
 164  0082 cd0000        	call	_GPIO_Init
 166  0085 85            	popw	x
 167                     ; 43   GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 169  0086 4be0          	push	#224
 170  0088 4b20          	push	#32
 171  008a ae5005        	ldw	x,#20485
 172  008d cd0000        	call	_GPIO_Init
 174  0090 85            	popw	x
 175                     ; 44   GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
 177  0091 4be0          	push	#224
 178  0093 4b40          	push	#64
 179  0095 ae5005        	ldw	x,#20485
 180  0098 cd0000        	call	_GPIO_Init
 182  009b 85            	popw	x
 183                     ; 45   GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
 185  009c 4b00          	push	#0
 186  009e 4b80          	push	#128
 187  00a0 ae5005        	ldw	x,#20485
 188  00a3 cd0000        	call	_GPIO_Init
 190  00a6 85            	popw	x
 191                     ; 46   GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  /*GPIO_Mode_In_PU_IT*/GPIO_Mode_In_PU_No_IT);
 193  00a7 4b40          	push	#64
 194  00a9 4b10          	push	#16
 195  00ab ae5005        	ldw	x,#20485
 196  00ae cd0000        	call	_GPIO_Init
 198  00b1 85            	popw	x
 199                     ; 49   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 201  00b2 4bf0          	push	#240
 202  00b4 4b01          	push	#1
 203  00b6 ae500f        	ldw	x,#20495
 204  00b9 cd0000        	call	_GPIO_Init
 206  00bc 85            	popw	x
 207                     ; 50   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 209  00bd 4bf0          	push	#240
 210  00bf 4b04          	push	#4
 211  00c1 ae5005        	ldw	x,#20485
 212  00c4 cd0000        	call	_GPIO_Init
 214  00c7 85            	popw	x
 215                     ; 51   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 217  00c8 4be0          	push	#224
 218  00ca 4b01          	push	#1
 219  00cc ae5005        	ldw	x,#20485
 220  00cf cd0000        	call	_GPIO_Init
 222  00d2 85            	popw	x
 223                     ; 52   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 225  00d3 4be0          	push	#224
 226  00d5 4b10          	push	#16
 227  00d7 ae500a        	ldw	x,#20490
 228  00da cd0000        	call	_GPIO_Init
 230  00dd 72175005      	bres	20485,#3
 231  00e1 a655          	ld	a,#85
 232  00e3 72135005      	bres	20485,#1
 233  00e7 85            	popw	x
 234                     ; 54   NRF_CE(0);
 236                     ; 55   NRF_CSN(0);
 238                     ; 57   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 240  00e8 cd0000        	call	_IWDG_WriteAccessCmd
 242                     ; 58   IWDG_SetPrescaler(IWDG_Prescaler_16);  /* 107.78ms for RL[7:0]= 0xFF */
 244  00eb a602          	ld	a,#2
 245  00ed cd0000        	call	_IWDG_SetPrescaler
 247                     ; 59   IWDG_SetReload(0xFF);
 249  00f0 a6ff          	ld	a,#255
 250  00f2 cd0000        	call	_IWDG_SetReload
 252                     ; 60   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 254  00f5 4f            	clr	a
 255  00f6 cd0000        	call	_IWDG_WriteAccessCmd
 257                     ; 61   IWDG_ReloadCounter();
 260                     ; 62 }
 263  00f9 cc0000        	jp	_IWDG_ReloadCounter
 297                     ; 64 uint8_t spi_transfer(uint8_t tx)
 297                     ; 65 {
 298                     .text:	section	.text,new
 299  0000               _spi_transfer:
 303                     ; 66   SPI1->DR = tx;
 305  0000 c75204        	ld	20996,a
 307  0003               L34:
 308                     ; 67   while(!(SPI1->SR & SPI_FLAG_RXNE));
 310  0003 72015203fb    	btjf	20995,#0,L34
 311                     ; 68   return ((uint8_t)SPI1->DR);
 313  0008 c65204        	ld	a,20996
 316  000b 81            	ret	
 329                     	xdef	_spi_transfer
 330                     	xdef	_Config
 331                     	xref	_TIM4_TimeBaseInit
 332                     	xref	_TIM2_ITConfig
 333                     	xref	_TIM2_Cmd
 334                     	xref	_TIM2_TimeBaseInit
 335                     	xref	_SPI_Cmd
 336                     	xref	_SPI_Init
 337                     	xref	_IWDG_ReloadCounter
 338                     	xref	_IWDG_SetReload
 339                     	xref	_IWDG_SetPrescaler
 340                     	xref	_IWDG_WriteAccessCmd
 341                     	xref	_GPIO_Init
 342                     	xref	_CLK_PeripheralClockConfig
 361                     	end
