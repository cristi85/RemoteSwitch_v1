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
 355                     ; 162   RFM_ON;
 357  0012 72175005      	bres	20485,#3
 358                     ; 163   LED_GREEN_ON;
 360  0016 721a500a      	bset	20490,#5
 363  001a 721d500a      	bres	20490,#6
 364                     ; 164   DELAY20MS_START;
 367  001e ae0201        	ldw	x,#513
 368  0021 cd0000        	call	_CLK_PeripheralClockConfig
 372  0024 350b52e8      	mov	21224,#11
 375  0028 351452e9      	mov	21225,#20
 378  002c 725f52e7      	clr	21223
 381  0030 721152e5      	bres	21221,#0
 384  0034 721052e0      	bset	21216,#0
 385                     ; 165   if(!BTN1_STATE)
 388  0038 7200500609    	btjt	20486,#0,L131
 389                     ; 167     btn_pressed = BUTTON1;
 391  003d 35010000      	mov	_btn_pressed,#1
 393  0041               L731:
 394                     ; 168     while(!BTN1_STATE);
 396  0041 72015006fb    	btjf	20486,#0,L731
 397  0046               L131:
 398                     ; 170   if(!BTN2_STATE)
 400  0046 7200501009    	btjt	20496,#0,L341
 401                     ; 172     btn_pressed = BUTTON2;
 403  004b 35020000      	mov	_btn_pressed,#2
 405  004f               L151:
 406                     ; 173     while(!BTN2_STATE);
 408  004f 72015010fb    	btjf	20496,#0,L151
 409  0054               L341:
 410                     ; 175   EXTI->SR1 |= BTN2_PIN;  //clear interrupt flag
 412  0054 721050a3      	bset	20643,#0
 413                     ; 176 }
 416  0058 85            	popw	x
 417  0059 bf00          	ldw	c_y,x
 418  005b 320002        	pop	c_y+2
 419  005e 85            	popw	x
 420  005f bf00          	ldw	c_x,x
 421  0061 320002        	pop	c_x+2
 422  0064 80            	iret	
 444                     ; 183 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 444                     ; 184 {
 445                     .text:	section	.text,new
 446  0000               f_EXTI1_IRQHandler:
 450                     ; 188 }
 453  0000 80            	iret	
 475                     ; 195 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 475                     ; 196 {
 476                     .text:	section	.text,new
 477  0000               f_EXTI2_IRQHandler:
 481                     ; 200 }
 484  0000 80            	iret	
 506                     ; 207 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 506                     ; 208 {
 507                     .text:	section	.text,new
 508  0000               f_EXTI3_IRQHandler:
 512                     ; 212 }
 515  0000 80            	iret	
 537                     ; 219 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 537                     ; 220 {
 538                     .text:	section	.text,new
 539  0000               f_EXTI4_IRQHandler:
 543                     ; 224 }
 546  0000 80            	iret	
 568                     ; 231 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 568                     ; 232 {
 569                     .text:	section	.text,new
 570  0000               f_EXTI5_IRQHandler:
 574                     ; 236 }
 577  0000 80            	iret	
 599                     ; 243 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 599                     ; 244 {
 600                     .text:	section	.text,new
 601  0000               f_EXTI6_IRQHandler:
 605                     ; 248 }
 608  0000 80            	iret	
 630                     ; 255 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 630                     ; 256 {
 631                     .text:	section	.text,new
 632  0000               f_EXTI7_IRQHandler:
 636                     ; 260 }
 639  0000 80            	iret	
 661                     ; 266 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 661                     ; 267 {
 662                     .text:	section	.text,new
 663  0000               f_LCD_AES_IRQHandler:
 667                     ; 271 }
 670  0000 80            	iret	
 693                     ; 277 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 693                     ; 278 {
 694                     .text:	section	.text,new
 695  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 699                     ; 282 }
 702  0000 80            	iret	
 725                     ; 289 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 725                     ; 290 {
 726                     .text:	section	.text,new
 727  0000               f_ADC1_COMP_IRQHandler:
 731                     ; 294 }
 734  0000 80            	iret	
 758                     ; 301 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 758                     ; 302 {
 759                     .text:	section	.text,new
 760  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 764                     ; 306 }
 767  0000 80            	iret	
 790                     ; 313 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 790                     ; 314 {
 791                     .text:	section	.text,new
 792  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 796                     ; 318 }
 799  0000 80            	iret	
 823                     ; 326 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 823                     ; 327 {
 824                     .text:	section	.text,new
 825  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 829                     ; 331 }
 832  0000 80            	iret	
 855                     ; 337 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 855                     ; 338 {
 856                     .text:	section	.text,new
 857  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 861                     ; 342 }
 864  0000 80            	iret	
 887                     ; 348 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 887                     ; 349 {
 888                     .text:	section	.text,new
 889  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 893                     ; 353 }
 896  0000 80            	iret	
 918                     ; 359 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 918                     ; 360 {
 919                     .text:	section	.text,new
 920  0000               f_TIM1_CC_IRQHandler:
 924                     ; 364 }
 927  0000 80            	iret	
 950                     ; 371 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 950                     ; 372 {
 951                     .text:	section	.text,new
 952  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 956                     ; 376 }
 959  0000 80            	iret	
 981                     ; 382 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 981                     ; 383 {
 982                     .text:	section	.text,new
 983  0000               f_SPI1_IRQHandler:
 987                     ; 387 }
 990  0000 80            	iret	
1014                     ; 394 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1014                     ; 395 {
1015                     .text:	section	.text,new
1016  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1020                     ; 399 }
1023  0000 80            	iret	
1046                     ; 406 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1046                     ; 407 {
1047                     .text:	section	.text,new
1048  0000               f_USART1_RX_TIM5_CC_IRQHandler:
1052                     ; 411 }
1055  0000 80            	iret	
1078                     ; 418 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1078                     ; 419 {
1079                     .text:	section	.text,new
1080  0000               f_I2C1_SPI2_IRQHandler:
1084                     ; 423 }
1087  0000 80            	iret	
1110                     	xdef	f_I2C1_SPI2_IRQHandler
1111                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1112                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1113                     	xdef	f_SPI1_IRQHandler
1114                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1115                     	xdef	f_TIM1_CC_IRQHandler
1116                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1117                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1118                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1119                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1120                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1121                     	xdef	f_ADC1_COMP_IRQHandler
1122                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1123                     	xdef	f_LCD_AES_IRQHandler
1124                     	xdef	f_EXTI7_IRQHandler
1125                     	xdef	f_EXTI6_IRQHandler
1126                     	xdef	f_EXTI5_IRQHandler
1127                     	xdef	f_EXTI4_IRQHandler
1128                     	xdef	f_EXTI3_IRQHandler
1129                     	xdef	f_EXTI2_IRQHandler
1130                     	xdef	f_EXTI1_IRQHandler
1131                     	xdef	f_EXTI0_IRQHandler
1132                     	xdef	f_EXTID_H_IRQHandler
1133                     	xdef	f_EXTIB_G_IRQHandler
1134                     	xdef	f_EXTIE_F_PVD_IRQHandler
1135                     	xdef	f_RTC_CSSLSE_IRQHandler
1136                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1137                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1138                     	xdef	f_FLASH_IRQHandler
1139                     	xdef	f_TRAP_IRQHandler
1140                     	xdef	f_NonHandledInterrupt
1141                     	xdef	_btn_pressed
1142                     	xref	_CLK_PeripheralClockConfig
1143                     	xref.b	c_x
1144                     	xref.b	c_y
1163                     	end
