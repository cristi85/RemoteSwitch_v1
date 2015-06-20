   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               _btn_pressed:
  23  0000 00            	dc.b	0
  53                     ; 51 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  53                     ; 52 {
  54                     .text:	section	.text,new
  55  0000               f_NonHandledInterrupt:
  59                     ; 56 }
  62  0000 80            	iret	
  84                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  84                     ; 67 {
  85                     .text:	section	.text,new
  86  0000               f_TRAP_IRQHandler:
  90                     ; 71 }
  93  0000 80            	iret	
 115                     ; 77 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 115                     ; 78 {
 116                     .text:	section	.text,new
 117  0000               f_FLASH_IRQHandler:
 121                     ; 82 }
 124  0000 80            	iret	
 147                     ; 88 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 147                     ; 89 {
 148                     .text:	section	.text,new
 149  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 153                     ; 93 }
 156  0000 80            	iret	
 179                     ; 99 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 179                     ; 100 {
 180                     .text:	section	.text,new
 181  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 185                     ; 104 }
 188  0000 80            	iret	
 211                     ; 110 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 211                     ; 111 {
 212                     .text:	section	.text,new
 213  0000               f_RTC_CSSLSE_IRQHandler:
 217                     ; 115 }
 220  0000 80            	iret	
 243                     ; 121 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 243                     ; 122 {
 244                     .text:	section	.text,new
 245  0000               f_EXTIE_F_PVD_IRQHandler:
 249                     ; 126 }
 252  0000 80            	iret	
 274                     ; 133 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 274                     ; 134 {
 275                     .text:	section	.text,new
 276  0000               f_EXTIB_G_IRQHandler:
 280                     ; 138 }
 283  0000 80            	iret	
 305                     ; 145 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 305                     ; 146 {
 306                     .text:	section	.text,new
 307  0000               f_EXTID_H_IRQHandler:
 311                     ; 150 }
 314  0000 80            	iret	
 338                     ; 157 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 338                     ; 158 {
 339                     .text:	section	.text,new
 340  0000               f_EXTI0_IRQHandler:
 342  0000 8a            	push	cc
 343  0001 84            	pop	a
 344  0002 a4bf          	and	a,#191
 345  0004 88            	push	a
 346  0005 86            	pop	cc
 347  0006 3b0002        	push	c_x+2
 348  0009 be00          	ldw	x,c_x
 349  000b 89            	pushw	x
 350  000c 3b0002        	push	c_y+2
 351  000f be00          	ldw	x,c_y
 352  0011 89            	pushw	x
 355                     ; 162   NRF_ON;
 357  0012 72175005      	bres	20485,#3
 358                     ; 163   DELAY200MS_START;
 360  0016 ae0201        	ldw	x,#513
 361  0019 cd0000        	call	_CLK_PeripheralClockConfig
 365  001c 350b52e8      	mov	21224,#11
 368  0020 35c352e9      	mov	21225,#195
 371  0024 725f52e7      	clr	21223
 374  0028 721152e5      	bres	21221,#0
 377  002c 721052e0      	bset	21216,#0
 378                     ; 164   if(!BTN1_STATE)
 381  0030 7200500609    	btjt	20486,#0,L131
 382                     ; 166     btn_pressed = BUTTON1;
 384  0035 35010000      	mov	_btn_pressed,#1
 386  0039               L731:
 387                     ; 167     while(!BTN1_STATE);
 389  0039 72015006fb    	btjf	20486,#0,L731
 390  003e               L131:
 391                     ; 169   if(!BTN2_STATE)
 393  003e 7200501009    	btjt	20496,#0,L341
 394                     ; 171     btn_pressed = BUTTON2;
 396  0043 35020000      	mov	_btn_pressed,#2
 398  0047               L151:
 399                     ; 172     while(!BTN2_STATE);
 401  0047 72015010fb    	btjf	20496,#0,L151
 402  004c               L341:
 403                     ; 174   EXTI->SR1 |= BTN2_PIN;  //clear interrupt flag
 405  004c 721050a3      	bset	20643,#0
 406                     ; 175 }
 409  0050 85            	popw	x
 410  0051 bf00          	ldw	c_y,x
 411  0053 320002        	pop	c_y+2
 412  0056 85            	popw	x
 413  0057 bf00          	ldw	c_x,x
 414  0059 320002        	pop	c_x+2
 415  005c 80            	iret	
 437                     ; 182 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 437                     ; 183 {
 438                     .text:	section	.text,new
 439  0000               f_EXTI1_IRQHandler:
 443                     ; 187 }
 446  0000 80            	iret	
 468                     ; 194 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 468                     ; 195 {
 469                     .text:	section	.text,new
 470  0000               f_EXTI2_IRQHandler:
 474                     ; 199 }
 477  0000 80            	iret	
 499                     ; 206 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 499                     ; 207 {
 500                     .text:	section	.text,new
 501  0000               f_EXTI3_IRQHandler:
 505                     ; 211 }
 508  0000 80            	iret	
 530                     ; 218 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 530                     ; 219 {
 531                     .text:	section	.text,new
 532  0000               f_EXTI4_IRQHandler:
 536                     ; 223 }
 539  0000 80            	iret	
 561                     ; 230 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 561                     ; 231 {
 562                     .text:	section	.text,new
 563  0000               f_EXTI5_IRQHandler:
 567                     ; 235 }
 570  0000 80            	iret	
 592                     ; 242 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 592                     ; 243 {
 593                     .text:	section	.text,new
 594  0000               f_EXTI6_IRQHandler:
 598                     ; 247 }
 601  0000 80            	iret	
 623                     ; 254 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 623                     ; 255 {
 624                     .text:	section	.text,new
 625  0000               f_EXTI7_IRQHandler:
 629                     ; 259 }
 632  0000 80            	iret	
 654                     ; 265 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 654                     ; 266 {
 655                     .text:	section	.text,new
 656  0000               f_LCD_AES_IRQHandler:
 660                     ; 270 }
 663  0000 80            	iret	
 686                     ; 276 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 686                     ; 277 {
 687                     .text:	section	.text,new
 688  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 692                     ; 281 }
 695  0000 80            	iret	
 718                     ; 288 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 718                     ; 289 {
 719                     .text:	section	.text,new
 720  0000               f_ADC1_COMP_IRQHandler:
 724                     ; 293 }
 727  0000 80            	iret	
 751                     ; 300 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 751                     ; 301 {
 752                     .text:	section	.text,new
 753  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 757                     ; 305 }
 760  0000 80            	iret	
 783                     ; 312 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 783                     ; 313 {
 784                     .text:	section	.text,new
 785  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 789                     ; 317 }
 792  0000 80            	iret	
 816                     ; 325 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 816                     ; 326 {
 817                     .text:	section	.text,new
 818  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 822                     ; 330 }
 825  0000 80            	iret	
 848                     ; 336 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 848                     ; 337 {
 849                     .text:	section	.text,new
 850  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 854                     ; 341 }
 857  0000 80            	iret	
 880                     ; 347 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 880                     ; 348 {
 881                     .text:	section	.text,new
 882  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 886                     ; 352 }
 889  0000 80            	iret	
 911                     ; 358 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 911                     ; 359 {
 912                     .text:	section	.text,new
 913  0000               f_TIM1_CC_IRQHandler:
 917                     ; 363 }
 920  0000 80            	iret	
 943                     ; 370 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 943                     ; 371 {
 944                     .text:	section	.text,new
 945  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 949                     ; 375 }
 952  0000 80            	iret	
 974                     ; 381 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 974                     ; 382 {
 975                     .text:	section	.text,new
 976  0000               f_SPI1_IRQHandler:
 980                     ; 386 }
 983  0000 80            	iret	
1007                     ; 393 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1007                     ; 394 {
1008                     .text:	section	.text,new
1009  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1013                     ; 398 }
1016  0000 80            	iret	
1039                     ; 405 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1039                     ; 406 {
1040                     .text:	section	.text,new
1041  0000               f_USART1_RX_TIM5_CC_IRQHandler:
1045                     ; 410 }
1048  0000 80            	iret	
1071                     ; 417 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1071                     ; 418 {
1072                     .text:	section	.text,new
1073  0000               f_I2C1_SPI2_IRQHandler:
1077                     ; 422 }
1080  0000 80            	iret	
1103                     	xdef	f_I2C1_SPI2_IRQHandler
1104                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1105                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1106                     	xdef	f_SPI1_IRQHandler
1107                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1108                     	xdef	f_TIM1_CC_IRQHandler
1109                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1110                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1111                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1112                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1113                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1114                     	xdef	f_ADC1_COMP_IRQHandler
1115                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1116                     	xdef	f_LCD_AES_IRQHandler
1117                     	xdef	f_EXTI7_IRQHandler
1118                     	xdef	f_EXTI6_IRQHandler
1119                     	xdef	f_EXTI5_IRQHandler
1120                     	xdef	f_EXTI4_IRQHandler
1121                     	xdef	f_EXTI3_IRQHandler
1122                     	xdef	f_EXTI2_IRQHandler
1123                     	xdef	f_EXTI1_IRQHandler
1124                     	xdef	f_EXTI0_IRQHandler
1125                     	xdef	f_EXTID_H_IRQHandler
1126                     	xdef	f_EXTIB_G_IRQHandler
1127                     	xdef	f_EXTIE_F_PVD_IRQHandler
1128                     	xdef	f_RTC_CSSLSE_IRQHandler
1129                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1130                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1131                     	xdef	f_FLASH_IRQHandler
1132                     	xdef	f_TRAP_IRQHandler
1133                     	xdef	f_NonHandledInterrupt
1134                     	xdef	_btn_pressed
1135                     	xref	_CLK_PeripheralClockConfig
1136                     	xref.b	c_x
1137                     	xref.b	c_y
1156                     	end
