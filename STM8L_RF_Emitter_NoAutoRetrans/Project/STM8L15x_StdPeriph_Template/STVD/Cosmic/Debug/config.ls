   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  54                     ; 3 void Config()
  54                     ; 4 {
  56                     .text:	section	.text,new
  57  0000               _Config:
  61                     ; 12   EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Falling_Low);
  63  0000 5f            	clrw	x
  64  0001 cd0000        	call	_EXTI_SetPinSensitivity
  66                     ; 20   CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  68  0004 ae0401        	ldw	x,#1025
  69  0007 cd0000        	call	_CLK_PeripheralClockConfig
  71                     ; 21   SPI_Init(SPI1, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2, SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge, SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0);
  73  000a 4b00          	push	#0
  74  000c 4b02          	push	#2
  75  000e 4b00          	push	#0
  76  0010 4b00          	push	#0
  77  0012 4b00          	push	#0
  78  0014 4b04          	push	#4
  79  0016 4b00          	push	#0
  80  0018 4b00          	push	#0
  81  001a ae5200        	ldw	x,#20992
  82  001d cd0000        	call	_SPI_Init
  84  0020 5b08          	addw	sp,#8
  85                     ; 22   SPI_Cmd(SPI1, ENABLE);
  87  0022 4b01          	push	#1
  88  0024 ae5200        	ldw	x,#20992
  89  0027 cd0000        	call	_SPI_Cmd
  91  002a 84            	pop	a
  92                     ; 25   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  94  002b 4bc0          	push	#192
  95  002d 4b20          	push	#32
  96  002f ae500a        	ldw	x,#20490
  97  0032 cd0000        	call	_GPIO_Init
  99  0035 85            	popw	x
 100                     ; 26   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 102  0036 4bc0          	push	#192
 103  0038 4b40          	push	#64
 104  003a ae500a        	ldw	x,#20490
 105  003d cd0000        	call	_GPIO_Init
 107  0040 85            	popw	x
 108                     ; 29   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
 110  0041 4b20          	push	#32
 111  0043 4b01          	push	#1
 112  0045 ae5005        	ldw	x,#20485
 113  0048 cd0000        	call	_GPIO_Init
 115  004b 85            	popw	x
 116                     ; 30   GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
 118  004c 4b20          	push	#32
 119  004e 4b01          	push	#1
 120  0050 ae500f        	ldw	x,#20495
 121  0053 cd0000        	call	_GPIO_Init
 123  0056 85            	popw	x
 124                     ; 33   GPIO_Init(NRF_CE_PORT,   NRF_CE_PIN,   GPIO_Mode_Out_PP_Low_Fast);
 126  0057 4be0          	push	#224
 127  0059 4b04          	push	#4
 128  005b ae5005        	ldw	x,#20485
 129  005e cd0000        	call	_GPIO_Init
 131  0061 85            	popw	x
 132                     ; 34   GPIO_Init(NRF_CSN_PORT,  NRF_CSN_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 134  0062 4be0          	push	#224
 135  0064 4b02          	push	#2
 136  0066 ae5005        	ldw	x,#20485
 137  0069 cd0000        	call	_GPIO_Init
 139  006c 85            	popw	x
 140                     ; 35   GPIO_Init(NRF_SCK_PORT,  NRF_SCK_PIN,  GPIO_Mode_Out_PP_Low_Fast);
 142  006d 4be0          	push	#224
 143  006f 4b20          	push	#32
 144  0071 ae5005        	ldw	x,#20485
 145  0074 cd0000        	call	_GPIO_Init
 147  0077 85            	popw	x
 148                     ; 36   GPIO_Init(NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_Mode_Out_PP_Low_Fast);
 150  0078 4be0          	push	#224
 151  007a 4b40          	push	#64
 152  007c ae5005        	ldw	x,#20485
 153  007f cd0000        	call	_GPIO_Init
 155  0082 85            	popw	x
 156                     ; 37   GPIO_Init(NRF_ON_PORT,   NRF_ON_PIN,   GPIO_Mode_Out_PP_High_Fast);
 158  0083 4bf0          	push	#240
 159  0085 4b08          	push	#8
 160  0087 ae5005        	ldw	x,#20485
 161  008a cd0000        	call	_GPIO_Init
 163  008d 85            	popw	x
 164                     ; 38   GPIO_Init(NRF_MISO_PORT, NRF_MISO_PIN, GPIO_Mode_In_FL_No_IT);
 166  008e 4b00          	push	#0
 167  0090 4b80          	push	#128
 168  0092 ae5005        	ldw	x,#20485
 169  0095 cd0000        	call	_GPIO_Init
 171  0098 85            	popw	x
 172                     ; 39   GPIO_Init(NRF_IRQ_PORT,  NRF_IRQ_PIN,  GPIO_Mode_In_FL_No_IT);
 174  0099 4b00          	push	#0
 175  009b 4b10          	push	#16
 176  009d ae500a        	ldw	x,#20490
 177  00a0 cd0000        	call	_GPIO_Init
 179  00a3 72165005      	bset	20485,#3
 180  00a7 72155005      	bres	20485,#2
 181  00ab 72135005      	bres	20485,#1
 182  00af 85            	popw	x
 183                     ; 41   NRF_OFF;
 185                     ; 42   NRF_CE(0);
 187                     ; 43   NRF_CSN(0);
 189                     ; 46 }
 192  00b0 81            	ret	
 226                     ; 48 uint8_t spi_transfer(uint8_t tx)
 226                     ; 49 {
 227                     .text:	section	.text,new
 228  0000               _spi_transfer:
 232                     ; 50   SPI1->DR = tx;
 234  0000 c75204        	ld	20996,a
 236  0003               L34:
 237                     ; 51   while(!(SPI1->SR & SPI_FLAG_RXNE));
 239  0003 72015203fb    	btjf	20995,#0,L34
 240                     ; 52   return ((uint8_t)SPI1->DR);
 242  0008 c65204        	ld	a,20996
 245  000b 81            	ret	
 258                     	xdef	_spi_transfer
 259                     	xdef	_Config
 260                     	xref	_SPI_Cmd
 261                     	xref	_SPI_Init
 262                     	xref	_GPIO_Init
 263                     	xref	_EXTI_SetPinSensitivity
 264                     	xref	_CLK_PeripheralClockConfig
 283                     	end
