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
 101                     ; 28   CLK_PeripheralClockConfig(CLK_Peripheral_SPI, ENABLE);
 103  0028 ae1001        	ldw	x,#4097
 104  002b cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 29   SPI_Init(SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft);
 108  002e 4b02          	push	#2
 109  0030 4b00          	push	#0
 110  0032 4b00          	push	#0
 111  0034 4b00          	push	#0
 112  0036 4b04          	push	#4
 113  0038 5f            	clrw	x
 114  0039 cd0000        	call	_SPI_Init
 116  003c 5b05          	addw	sp,#5
 117                     ; 30   SPI_Cmd(ENABLE);
 119  003e a601          	ld	a,#1
 120  0040 cd0000        	call	_SPI_Cmd
 122                     ; 33   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 124  0043 4bc0          	push	#192
 125  0045 4b08          	push	#8
 126  0047 ae500a        	ldw	x,#20490
 127  004a cd0000        	call	_GPIO_Init
 129  004d 85            	popw	x
 130                     ; 34   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 132  004e 4bc0          	push	#192
 133  0050 4b10          	push	#16
 134  0052 ae500a        	ldw	x,#20490
 135  0055 cd0000        	call	_GPIO_Init
 137  0058 85            	popw	x
 138                     ; 37   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 140  0059 4b00          	push	#0
 141  005b 4b04          	push	#4
 142  005d ae5000        	ldw	x,#20480
 143  0060 cd0000        	call	_GPIO_Init
 145  0063 85            	popw	x
 146                     ; 40   GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
 148  0064 4be0          	push	#224
 149  0066 4b08          	push	#8
 150  0068 ae5005        	ldw	x,#20485
 151  006b cd0000        	call	_GPIO_Init
 153  006e 85            	popw	x
 154                     ; 41   GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 156  006f 4be0          	push	#224
 157  0071 4b02          	push	#2
 158  0073 ae5005        	ldw	x,#20485
 159  0076 cd0000        	call	_GPIO_Init
 161  0079 85            	popw	x
 162                     ; 42   GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 164  007a 4be0          	push	#224
 165  007c 4b20          	push	#32
 166  007e ae5005        	ldw	x,#20485
 167  0081 cd0000        	call	_GPIO_Init
 169  0084 85            	popw	x
 170                     ; 43   GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
 172  0085 4be0          	push	#224
 173  0087 4b40          	push	#64
 174  0089 ae5005        	ldw	x,#20485
 175  008c cd0000        	call	_GPIO_Init
 177  008f 85            	popw	x
 178                     ; 44   GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
 180  0090 4b00          	push	#0
 181  0092 4b80          	push	#128
 182  0094 ae5005        	ldw	x,#20485
 183  0097 cd0000        	call	_GPIO_Init
 185  009a 85            	popw	x
 186                     ; 45   GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  /*GPIO_Mode_In_PU_IT*/GPIO_Mode_In_PU_No_IT);
 188  009b 4b40          	push	#64
 189  009d 4b10          	push	#16
 190  009f ae5005        	ldw	x,#20485
 191  00a2 cd0000        	call	_GPIO_Init
 193  00a5 85            	popw	x
 194                     ; 48   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 196  00a6 4bf0          	push	#240
 197  00a8 4b01          	push	#1
 198  00aa ae500f        	ldw	x,#20495
 199  00ad cd0000        	call	_GPIO_Init
 201  00b0 85            	popw	x
 202                     ; 49   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 204  00b1 4bf0          	push	#240
 205  00b3 4b04          	push	#4
 206  00b5 ae5005        	ldw	x,#20485
 207  00b8 cd0000        	call	_GPIO_Init
 209  00bb 85            	popw	x
 210                     ; 50   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 212  00bc 4be0          	push	#224
 213  00be 4b01          	push	#1
 214  00c0 ae5005        	ldw	x,#20485
 215  00c3 cd0000        	call	_GPIO_Init
 217  00c6 85            	popw	x
 218                     ; 51   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 220  00c7 4be0          	push	#224
 221  00c9 4b04          	push	#4
 222  00cb ae500a        	ldw	x,#20490
 223  00ce cd0000        	call	_GPIO_Init
 225  00d1 72175005      	bres	20485,#3
 226  00d5 72135005      	bres	20485,#1
 227  00d9 a655          	ld	a,#85
 228  00db 85            	popw	x
 229                     ; 53   NRF_CE(0);
 231                     ; 54   NRF_CSN(0);
 233                     ; 56   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 235  00dc cd0000        	call	_IWDG_WriteAccessCmd
 237                     ; 57   IWDG_SetPrescaler(IWDG_Prescaler_16);  /* 107.78ms for RL[7:0]= 0xFF */
 239  00df a602          	ld	a,#2
 240  00e1 cd0000        	call	_IWDG_SetPrescaler
 242                     ; 58   IWDG_SetReload(0xFF);
 244  00e4 a6ff          	ld	a,#255
 245  00e6 cd0000        	call	_IWDG_SetReload
 247                     ; 59   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 249  00e9 4f            	clr	a
 250  00ea cd0000        	call	_IWDG_WriteAccessCmd
 252                     ; 60   IWDG_ReloadCounter();
 255                     ; 61 }
 258  00ed cc0000        	jp	_IWDG_ReloadCounter
 292                     ; 63 uint8_t spi_transfer(uint8_t tx)
 292                     ; 64 {
 293                     .text:	section	.text,new
 294  0000               _spi_transfer:
 298                     ; 65   SPI->DR = tx;
 300  0000 c75204        	ld	20996,a
 302  0003               L34:
 303                     ; 66   while(!(SPI->SR & SPI_FLAG_RXNE));
 305  0003 72015203fb    	btjf	20995,#0,L34
 306                     ; 67   return ((uint8_t)SPI->DR);
 308  0008 c65204        	ld	a,20996
 311  000b 81            	ret	
 324                     	xdef	_spi_transfer
 325                     	xdef	_Config
 326                     	xref	_TIM4_TimeBaseInit
 327                     	xref	_TIM2_ITConfig
 328                     	xref	_TIM2_Cmd
 329                     	xref	_TIM2_TimeBaseInit
 330                     	xref	_SPI_Cmd
 331                     	xref	_SPI_Init
 332                     	xref	_IWDG_ReloadCounter
 333                     	xref	_IWDG_SetReload
 334                     	xref	_IWDG_SetPrescaler
 335                     	xref	_IWDG_WriteAccessCmd
 336                     	xref	_GPIO_Init
 337                     	xref	_CLK_PeripheralClockConfig
 356                     	end
