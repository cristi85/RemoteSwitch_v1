   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  57                     ; 3 void Config()
  57                     ; 4 {
  59                     .text:	section	.text,new
  60  0000               _Config:
  64                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  66  0000 ae0401        	ldw	x,#1025
  67  0003 cd0000        	call	_CLK_PeripheralClockConfig
  69                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  71  0006 ae047d        	ldw	x,#1149
  72  0009 cd0000        	call	_TIM4_TimeBaseInit
  74                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  76  000c ae0101        	ldw	x,#257
  77  000f cd0000        	call	_CLK_PeripheralClockConfig
  79                     ; 23   TIM2_TimeBaseInit(TIM2_Prescaler_16, TIM2_CounterMode_Up, 125); // timebase of 1ms, 2MHz/16/125
  81  0012 ae007d        	ldw	x,#125
  82  0015 89            	pushw	x
  83  0016 ae0400        	ldw	x,#1024
  84  0019 cd0000        	call	_TIM2_TimeBaseInit
  86  001c 85            	popw	x
  87                     ; 24   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  89  001d ae0101        	ldw	x,#257
  90  0020 cd0000        	call	_TIM2_ITConfig
  92                     ; 25   TIM2_Cmd(ENABLE);
  94  0023 a601          	ld	a,#1
  95  0025 cd0000        	call	_TIM2_Cmd
  97                     ; 28   CLK_PeripheralClockConfig(CLK_Peripheral_SPI, ENABLE);
  99  0028 ae1001        	ldw	x,#4097
 100  002b cd0000        	call	_CLK_PeripheralClockConfig
 102                     ; 29   SPI_Init(SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft);
 104  002e 4b02          	push	#2
 105  0030 4b00          	push	#0
 106  0032 4b00          	push	#0
 107  0034 4b00          	push	#0
 108  0036 4b04          	push	#4
 109  0038 5f            	clrw	x
 110  0039 cd0000        	call	_SPI_Init
 112  003c 5b05          	addw	sp,#5
 113                     ; 30   SPI_Cmd(ENABLE);
 115  003e a601          	ld	a,#1
 116  0040 cd0000        	call	_SPI_Cmd
 118                     ; 33   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
 120  0043 4bc0          	push	#192
 121  0045 4b08          	push	#8
 122  0047 ae500a        	ldw	x,#20490
 123  004a cd0000        	call	_GPIO_Init
 125  004d 85            	popw	x
 126                     ; 34   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 128  004e 4bc0          	push	#192
 129  0050 4b10          	push	#16
 130  0052 ae500a        	ldw	x,#20490
 131  0055 cd0000        	call	_GPIO_Init
 133  0058 85            	popw	x
 134                     ; 37   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 136  0059 4b00          	push	#0
 137  005b 4b04          	push	#4
 138  005d ae5000        	ldw	x,#20480
 139  0060 cd0000        	call	_GPIO_Init
 141  0063 85            	popw	x
 142                     ; 40   GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
 144  0064 4be0          	push	#224
 145  0066 4b08          	push	#8
 146  0068 ae5005        	ldw	x,#20485
 147  006b cd0000        	call	_GPIO_Init
 149  006e 85            	popw	x
 150                     ; 41   GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 152  006f 4be0          	push	#224
 153  0071 4b02          	push	#2
 154  0073 ae5005        	ldw	x,#20485
 155  0076 cd0000        	call	_GPIO_Init
 157  0079 85            	popw	x
 158                     ; 42   GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 160  007a 4be0          	push	#224
 161  007c 4b20          	push	#32
 162  007e ae5005        	ldw	x,#20485
 163  0081 cd0000        	call	_GPIO_Init
 165  0084 85            	popw	x
 166                     ; 43   GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
 168  0085 4be0          	push	#224
 169  0087 4b40          	push	#64
 170  0089 ae5005        	ldw	x,#20485
 171  008c cd0000        	call	_GPIO_Init
 173  008f 85            	popw	x
 174                     ; 44   GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
 176  0090 4b00          	push	#0
 177  0092 4b80          	push	#128
 178  0094 ae5005        	ldw	x,#20485
 179  0097 cd0000        	call	_GPIO_Init
 181  009a 85            	popw	x
 182                     ; 45   GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  /*GPIO_Mode_In_PU_IT*/GPIO_Mode_In_PU_No_IT);
 184  009b 4b40          	push	#64
 185  009d 4b10          	push	#16
 186  009f ae5005        	ldw	x,#20485
 187  00a2 cd0000        	call	_GPIO_Init
 189  00a5 85            	popw	x
 190                     ; 48   GPIO_Init(PMOS_L_PORT,  PMOS_L_PIN,    GPIO_Mode_Out_PP_High_Fast);
 192  00a6 4bf0          	push	#240
 193  00a8 4b01          	push	#1
 194  00aa ae500f        	ldw	x,#20495
 195  00ad cd0000        	call	_GPIO_Init
 197  00b0 85            	popw	x
 198                     ; 49   GPIO_Init(PMOS_R_PORT,  PMOS_R_PIN,    GPIO_Mode_Out_PP_High_Fast);
 200  00b1 4bf0          	push	#240
 201  00b3 4b04          	push	#4
 202  00b5 ae5005        	ldw	x,#20485
 203  00b8 cd0000        	call	_GPIO_Init
 205  00bb 85            	popw	x
 206                     ; 50   GPIO_Init(NMOS_L_PORT,  NMOS_L_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 208  00bc 4be0          	push	#224
 209  00be 4b01          	push	#1
 210  00c0 ae5005        	ldw	x,#20485
 211  00c3 cd0000        	call	_GPIO_Init
 213  00c6 85            	popw	x
 214                     ; 51   GPIO_Init(NMOS_R_PORT,  NMOS_R_PIN,    GPIO_Mode_Out_PP_Low_Fast);
 216  00c7 4be0          	push	#224
 217  00c9 4b04          	push	#4
 218  00cb ae500a        	ldw	x,#20490
 219  00ce cd0000        	call	_GPIO_Init
 221  00d1 72175005      	bres	20485,#3
 222  00d5 72135005      	bres	20485,#1
 223  00d9 85            	popw	x
 224                     ; 53   NRF_CE(0);
 226                     ; 54   NRF_CSN(0);
 228                     ; 55 }
 231  00da 81            	ret	
 265                     ; 57 uint8_t spi_transfer(uint8_t tx)
 265                     ; 58 {
 266                     .text:	section	.text,new
 267  0000               _spi_transfer:
 271                     ; 59   SPI->DR = tx;
 273  0000 c75204        	ld	20996,a
 275  0003               L34:
 276                     ; 60   while(!(SPI->SR & SPI_FLAG_RXNE));
 278  0003 72015203fb    	btjf	20995,#0,L34
 279                     ; 61   return ((uint8_t)SPI->DR);
 281  0008 c65204        	ld	a,20996
 284  000b 81            	ret	
 297                     	xdef	_spi_transfer
 298                     	xdef	_Config
 299                     	xref	_TIM4_TimeBaseInit
 300                     	xref	_TIM2_ITConfig
 301                     	xref	_TIM2_Cmd
 302                     	xref	_TIM2_TimeBaseInit
 303                     	xref	_SPI_Cmd
 304                     	xref	_SPI_Init
 305                     	xref	_GPIO_Init
 306                     	xref	_CLK_PeripheralClockConfig
 325                     	end
