   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
 170                     ; 145 void USART_DeInit(USART_TypeDef* USARTx)
 170                     ; 146 {
 172                     .text:	section	.text,new
 173  0000               _USART_DeInit:
 177                     ; 150   (void) USARTx->SR;
 179  0000 f6            	ld	a,(x)
 180                     ; 151   (void) USARTx->DR;
 182  0001 e601          	ld	a,(1,x)
 183                     ; 153   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 185  0003 6f03          	clr	(3,x)
 186                     ; 154   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 188  0005 6f02          	clr	(2,x)
 189                     ; 156   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 191  0007 6f04          	clr	(4,x)
 192                     ; 157   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 194  0009 6f05          	clr	(5,x)
 195                     ; 158   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 197  000b 6f06          	clr	(6,x)
 198                     ; 159   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 200  000d 6f07          	clr	(7,x)
 201                     ; 160 }
 204  000f 81            	ret	
 396                     ; 189 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 396                     ; 190                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 396                     ; 191                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 396                     ; 192 {
 397                     .text:	section	.text,new
 398  0000               _USART_Init:
 400  0000 89            	pushw	x
 401  0001 5204          	subw	sp,#4
 402       00000004      OFST:	set	4
 405                     ; 193   uint32_t BaudRate_Mantissa = 0;
 407                     ; 196   assert_param(IS_USART_BAUDRATE(BaudRate));
 409                     ; 198   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 411                     ; 200   assert_param(IS_USART_STOPBITS(USART_StopBits));
 413                     ; 202   assert_param(IS_USART_PARITY(USART_Parity));
 415                     ; 204   assert_param(IS_USART_MODE(USART_Mode));
 417                     ; 207   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 419  0003 e604          	ld	a,(4,x)
 420  0005 a4e9          	and	a,#233
 421  0007 e704          	ld	(4,x),a
 422                     ; 210   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 424  0009 7b0d          	ld	a,(OFST+9,sp)
 425  000b 1a0f          	or	a,(OFST+11,sp)
 426  000d ea04          	or	a,(4,x)
 427  000f e704          	ld	(4,x),a
 428                     ; 213   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 430  0011 e606          	ld	a,(6,x)
 431  0013 a4cf          	and	a,#207
 432  0015 e706          	ld	(6,x),a
 433                     ; 215   USARTx->CR3 |= (uint8_t)USART_StopBits;
 435  0017 e606          	ld	a,(6,x)
 436  0019 1a0e          	or	a,(OFST+10,sp)
 437  001b e706          	ld	(6,x),a
 438                     ; 218   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 440  001d 6f02          	clr	(2,x)
 441                     ; 220   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 443  001f e603          	ld	a,(3,x)
 444  0021 a40f          	and	a,#15
 445  0023 e703          	ld	(3,x),a
 446                     ; 222   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 448  0025 e603          	ld	a,(3,x)
 449  0027 a4f0          	and	a,#240
 450  0029 e703          	ld	(3,x),a
 451                     ; 224   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 453  002b cd0000        	call	_CLK_GetClockFreq
 455  002e 96            	ldw	x,sp
 456  002f 1c0009        	addw	x,#OFST+5
 457  0032 cd0000        	call	c_ludv
 459  0035 96            	ldw	x,sp
 460  0036 5c            	incw	x
 461  0037 cd0000        	call	c_rtol
 463                     ; 226   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 465  003a 7b03          	ld	a,(OFST-1,sp)
 466  003c 1e05          	ldw	x,(OFST+1,sp)
 467  003e a4f0          	and	a,#240
 468  0040 e703          	ld	(3,x),a
 469                     ; 228   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 471  0042 7b04          	ld	a,(OFST+0,sp)
 472  0044 a40f          	and	a,#15
 473  0046 ea03          	or	a,(3,x)
 474  0048 e703          	ld	(3,x),a
 475                     ; 230   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 477  004a 96            	ldw	x,sp
 478  004b 5c            	incw	x
 479  004c cd0000        	call	c_ltor
 481  004f a604          	ld	a,#4
 482  0051 cd0000        	call	c_lursh
 484  0054 1e05          	ldw	x,(OFST+1,sp)
 485  0056 b603          	ld	a,c_lreg+3
 486  0058 e702          	ld	(2,x),a
 487                     ; 233   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 489  005a e605          	ld	a,(5,x)
 490  005c a4f3          	and	a,#243
 491  005e e705          	ld	(5,x),a
 492                     ; 235   USARTx->CR2 |= (uint8_t)USART_Mode;
 494  0060 e605          	ld	a,(5,x)
 495  0062 1a10          	or	a,(OFST+12,sp)
 496  0064 e705          	ld	(5,x),a
 497                     ; 236 }
 500  0066 5b06          	addw	sp,#6
 501  0068 81            	ret	
 661                     ; 261 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 661                     ; 262                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 661                     ; 263                      USART_LastBit_TypeDef USART_LastBit)
 661                     ; 264 {
 662                     .text:	section	.text,new
 663  0000               _USART_ClockInit:
 665  0000 89            	pushw	x
 666       00000000      OFST:	set	0
 669                     ; 266   assert_param(IS_USART_CLOCK(USART_Clock));
 671                     ; 267   assert_param(IS_USART_CPOL(USART_CPOL));
 673                     ; 268   assert_param(IS_USART_CPHA(USART_CPHA));
 675                     ; 269   assert_param(IS_USART_LASTBIT(USART_LastBit));
 677                     ; 272   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 679  0001 e606          	ld	a,(6,x)
 680  0003 a4f8          	and	a,#248
 681  0005 e706          	ld	(6,x),a
 682                     ; 274   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 684  0007 7b06          	ld	a,(OFST+6,sp)
 685  0009 1a07          	or	a,(OFST+7,sp)
 686  000b 1a08          	or	a,(OFST+8,sp)
 687  000d ea06          	or	a,(6,x)
 688  000f e706          	ld	(6,x),a
 689                     ; 276   if (USART_Clock != USART_Clock_Disable)
 691  0011 7b05          	ld	a,(OFST+5,sp)
 692  0013 2706          	jreq	L523
 693                     ; 278     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 695  0015 e606          	ld	a,(6,x)
 696  0017 aa08          	or	a,#8
 698  0019 2006          	jra	L723
 699  001b               L523:
 700                     ; 282     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 702  001b 1e01          	ldw	x,(OFST+1,sp)
 703  001d e606          	ld	a,(6,x)
 704  001f a4f7          	and	a,#247
 705  0021               L723:
 706  0021 e706          	ld	(6,x),a
 707                     ; 284 }
 710  0023 85            	popw	x
 711  0024 81            	ret	
 778                     ; 293 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 778                     ; 294 {
 779                     .text:	section	.text,new
 780  0000               _USART_Cmd:
 782  0000 89            	pushw	x
 783       00000000      OFST:	set	0
 786                     ; 295   if (NewState != DISABLE)
 788  0001 7b05          	ld	a,(OFST+5,sp)
 789  0003 2706          	jreq	L563
 790                     ; 297     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 792  0005 e604          	ld	a,(4,x)
 793  0007 a4df          	and	a,#223
 795  0009 2006          	jra	L763
 796  000b               L563:
 797                     ; 301     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 799  000b 1e01          	ldw	x,(OFST+1,sp)
 800  000d e604          	ld	a,(4,x)
 801  000f aa20          	or	a,#32
 802  0011               L763:
 803  0011 e704          	ld	(4,x),a
 804                     ; 303 }
 807  0013 85            	popw	x
 808  0014 81            	ret	
 854                     ; 326 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 854                     ; 327 {
 855                     .text:	section	.text,new
 856  0000               _USART_SetPrescaler:
 858  0000 89            	pushw	x
 859       00000000      OFST:	set	0
 862                     ; 329   USARTx->PSCR = USART_Prescaler;
 864  0001 1e01          	ldw	x,(OFST+1,sp)
 865  0003 7b05          	ld	a,(OFST+5,sp)
 866  0005 e70a          	ld	(10,x),a
 867                     ; 330 }
 870  0007 85            	popw	x
 871  0008 81            	ret	
 908                     ; 337 void USART_SendBreak(USART_TypeDef* USARTx)
 908                     ; 338 {
 909                     .text:	section	.text,new
 910  0000               _USART_SendBreak:
 914                     ; 339   USARTx->CR2 |= USART_CR2_SBK;
 916  0000 e605          	ld	a,(5,x)
 917  0002 aa01          	or	a,#1
 918  0004 e705          	ld	(5,x),a
 919                     ; 340 }
 922  0006 81            	ret	
 959                     ; 379 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 959                     ; 380 {
 960                     .text:	section	.text,new
 961  0000               _USART_ReceiveData8:
 965                     ; 381   return USARTx->DR;
 967  0000 e601          	ld	a,(1,x)
 970  0002 81            	ret	
1016                     ; 389 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1016                     ; 390 {
1017                     .text:	section	.text,new
1018  0000               _USART_ReceiveData9:
1020  0000 89            	pushw	x
1021  0001 89            	pushw	x
1022       00000002      OFST:	set	2
1025                     ; 391   uint16_t temp = 0;
1027                     ; 393   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1029  0002 e604          	ld	a,(4,x)
1030  0004 a480          	and	a,#128
1031  0006 5f            	clrw	x
1032  0007 02            	rlwa	x,a
1033  0008 58            	sllw	x
1034  0009 1f01          	ldw	(OFST-1,sp),x
1035                     ; 394   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1037  000b 1e03          	ldw	x,(OFST+1,sp)
1038  000d e601          	ld	a,(1,x)
1039  000f 5f            	clrw	x
1040  0010 97            	ld	xl,a
1041  0011 01            	rrwa	x,a
1042  0012 1a02          	or	a,(OFST+0,sp)
1043  0014 01            	rrwa	x,a
1044  0015 1a01          	or	a,(OFST-1,sp)
1045  0017 a401          	and	a,#1
1046  0019 01            	rrwa	x,a
1049  001a 5b04          	addw	sp,#4
1050  001c 81            	ret	
1096                     ; 402 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1096                     ; 403 {
1097                     .text:	section	.text,new
1098  0000               _USART_SendData8:
1100  0000 89            	pushw	x
1101       00000000      OFST:	set	0
1104                     ; 405   USARTx->DR = Data;
1106  0001 1e01          	ldw	x,(OFST+1,sp)
1107  0003 7b05          	ld	a,(OFST+5,sp)
1108  0005 e701          	ld	(1,x),a
1109                     ; 406 }
1112  0007 85            	popw	x
1113  0008 81            	ret	
1159                     ; 415 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1159                     ; 416 {
1160                     .text:	section	.text,new
1161  0000               _USART_SendData9:
1163  0000 89            	pushw	x
1164       00000000      OFST:	set	0
1167                     ; 417   assert_param(IS_USART_DATA_9BITS(Data));
1169                     ; 420   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1171  0001 e604          	ld	a,(4,x)
1172  0003 a4bf          	and	a,#191
1173  0005 e704          	ld	(4,x),a
1174                     ; 423   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1176  0007 1605          	ldw	y,(OFST+5,sp)
1177  0009 9054          	srlw	y
1178  000b 9054          	srlw	y
1179  000d 909f          	ld	a,yl
1180  000f a440          	and	a,#64
1181  0011 ea04          	or	a,(4,x)
1182  0013 e704          	ld	(4,x),a
1183                     ; 426   USARTx->DR   = (uint8_t)(Data);
1185  0015 1e01          	ldw	x,(OFST+1,sp)
1186  0017 7b06          	ld	a,(OFST+6,sp)
1187  0019 e701          	ld	(1,x),a
1188                     ; 427 }
1191  001b 85            	popw	x
1192  001c 81            	ret	
1240                     ; 470 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1240                     ; 471 {
1241                     .text:	section	.text,new
1242  0000               _USART_ReceiverWakeUpCmd:
1244  0000 89            	pushw	x
1245       00000000      OFST:	set	0
1248                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1250                     ; 474   if (NewState != DISABLE)
1252  0001 7b05          	ld	a,(OFST+5,sp)
1253  0003 2706          	jreq	L575
1254                     ; 477     USARTx->CR2 |= USART_CR2_RWU;
1256  0005 e605          	ld	a,(5,x)
1257  0007 aa02          	or	a,#2
1259  0009 2006          	jra	L775
1260  000b               L575:
1261                     ; 482     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1263  000b 1e01          	ldw	x,(OFST+1,sp)
1264  000d e605          	ld	a,(5,x)
1265  000f a4fd          	and	a,#253
1266  0011               L775:
1267  0011 e705          	ld	(5,x),a
1268                     ; 484 }
1271  0013 85            	popw	x
1272  0014 81            	ret	
1318                     ; 493 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1318                     ; 494 {
1319                     .text:	section	.text,new
1320  0000               _USART_SetAddress:
1322  0000 89            	pushw	x
1323       00000000      OFST:	set	0
1326                     ; 496   assert_param(IS_USART_ADDRESS(USART_Address));
1328                     ; 499   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1330  0001 e607          	ld	a,(7,x)
1331  0003 a4f0          	and	a,#240
1332  0005 e707          	ld	(7,x),a
1333                     ; 501   USARTx->CR4 |= USART_Address;
1335  0007 e607          	ld	a,(7,x)
1336  0009 1a05          	or	a,(OFST+5,sp)
1337  000b e707          	ld	(7,x),a
1338                     ; 502 }
1341  000d 85            	popw	x
1342  000e 81            	ret	
1411                     ; 512 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1411                     ; 513 {
1412                     .text:	section	.text,new
1413  0000               _USART_WakeUpConfig:
1415  0000 89            	pushw	x
1416       00000000      OFST:	set	0
1419                     ; 514   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1421                     ; 516   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1423  0001 e604          	ld	a,(4,x)
1424  0003 a4f7          	and	a,#247
1425  0005 e704          	ld	(4,x),a
1426                     ; 517   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1428  0007 e604          	ld	a,(4,x)
1429  0009 1a05          	or	a,(OFST+5,sp)
1430  000b e704          	ld	(4,x),a
1431                     ; 518 }
1434  000d 85            	popw	x
1435  000e 81            	ret	
1483                     ; 563 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1483                     ; 564 {
1484                     .text:	section	.text,new
1485  0000               _USART_HalfDuplexCmd:
1487  0000 89            	pushw	x
1488       00000000      OFST:	set	0
1491                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1493                     ; 567   if (NewState != DISABLE)
1495  0001 7b05          	ld	a,(OFST+5,sp)
1496  0003 2706          	jreq	L507
1497                     ; 569     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1499  0005 e608          	ld	a,(8,x)
1500  0007 aa08          	or	a,#8
1502  0009 2006          	jra	L707
1503  000b               L507:
1504                     ; 573     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1506  000b 1e01          	ldw	x,(OFST+1,sp)
1507  000d e608          	ld	a,(8,x)
1508  000f a4f7          	and	a,#247
1509  0011               L707:
1510  0011 e708          	ld	(8,x),a
1511                     ; 575 }
1514  0013 85            	popw	x
1515  0014 81            	ret	
1562                     ; 641 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1562                     ; 642 {
1563                     .text:	section	.text,new
1564  0000               _USART_SmartCardCmd:
1566  0000 89            	pushw	x
1567       00000000      OFST:	set	0
1570                     ; 643   assert_param(IS_FUNCTIONAL_STATE(NewState));
1572                     ; 645   if (NewState != DISABLE)
1574  0001 7b05          	ld	a,(OFST+5,sp)
1575  0003 2706          	jreq	L537
1576                     ; 648     USARTx->CR5 |= USART_CR5_SCEN;
1578  0005 e608          	ld	a,(8,x)
1579  0007 aa20          	or	a,#32
1581  0009 2006          	jra	L737
1582  000b               L537:
1583                     ; 653     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1585  000b 1e01          	ldw	x,(OFST+1,sp)
1586  000d e608          	ld	a,(8,x)
1587  000f a4df          	and	a,#223
1588  0011               L737:
1589  0011 e708          	ld	(8,x),a
1590                     ; 655 }
1593  0013 85            	popw	x
1594  0014 81            	ret	
1642                     ; 664 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1642                     ; 665 {
1643                     .text:	section	.text,new
1644  0000               _USART_SmartCardNACKCmd:
1646  0000 89            	pushw	x
1647       00000000      OFST:	set	0
1650                     ; 666   assert_param(IS_FUNCTIONAL_STATE(NewState));
1652                     ; 668   if (NewState != DISABLE)
1654  0001 7b05          	ld	a,(OFST+5,sp)
1655  0003 2706          	jreq	L567
1656                     ; 671     USARTx->CR5 |= USART_CR5_NACK;
1658  0005 e608          	ld	a,(8,x)
1659  0007 aa10          	or	a,#16
1661  0009 2006          	jra	L767
1662  000b               L567:
1663                     ; 676     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1665  000b 1e01          	ldw	x,(OFST+1,sp)
1666  000d e608          	ld	a,(8,x)
1667  000f a4ef          	and	a,#239
1668  0011               L767:
1669  0011 e708          	ld	(8,x),a
1670                     ; 678 }
1673  0013 85            	popw	x
1674  0014 81            	ret	
1720                     ; 687 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1720                     ; 688 {
1721                     .text:	section	.text,new
1722  0000               _USART_SetGuardTime:
1724  0000 89            	pushw	x
1725       00000000      OFST:	set	0
1728                     ; 690   USARTx->GTR = USART_GuardTime;
1730  0001 1e01          	ldw	x,(OFST+1,sp)
1731  0003 7b05          	ld	a,(OFST+5,sp)
1732  0005 e709          	ld	(9,x),a
1733                     ; 691 }
1736  0007 85            	popw	x
1737  0008 81            	ret	
1806                     ; 748 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1806                     ; 749 {
1807                     .text:	section	.text,new
1808  0000               _USART_IrDAConfig:
1810  0000 89            	pushw	x
1811       00000000      OFST:	set	0
1814                     ; 750   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1816                     ; 752   if (USART_IrDAMode != USART_IrDAMode_Normal)
1818  0001 7b05          	ld	a,(OFST+5,sp)
1819  0003 2706          	jreq	L1501
1820                     ; 754     USARTx->CR5 |= USART_CR5_IRLP;
1822  0005 e608          	ld	a,(8,x)
1823  0007 aa04          	or	a,#4
1825  0009 2006          	jra	L3501
1826  000b               L1501:
1827                     ; 758     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1829  000b 1e01          	ldw	x,(OFST+1,sp)
1830  000d e608          	ld	a,(8,x)
1831  000f a4fb          	and	a,#251
1832  0011               L3501:
1833  0011 e708          	ld	(8,x),a
1834                     ; 760 }
1837  0013 85            	popw	x
1838  0014 81            	ret	
1885                     ; 769 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1885                     ; 770 {
1886                     .text:	section	.text,new
1887  0000               _USART_IrDACmd:
1889  0000 89            	pushw	x
1890       00000000      OFST:	set	0
1893                     ; 773   assert_param(IS_FUNCTIONAL_STATE(NewState));
1895                     ; 775   if (NewState != DISABLE)
1897  0001 7b05          	ld	a,(OFST+5,sp)
1898  0003 2706          	jreq	L1011
1899                     ; 778     USARTx->CR5 |= USART_CR5_IREN;
1901  0005 e608          	ld	a,(8,x)
1902  0007 aa02          	or	a,#2
1904  0009 2006          	jra	L3011
1905  000b               L1011:
1906                     ; 783     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1908  000b 1e01          	ldw	x,(OFST+1,sp)
1909  000d e608          	ld	a,(8,x)
1910  000f a4fd          	and	a,#253
1911  0011               L3011:
1912  0011 e708          	ld	(8,x),a
1913                     ; 785 }
1916  0013 85            	popw	x
1917  0014 81            	ret	
1994                     ; 815 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1994                     ; 816                   FunctionalState NewState)
1994                     ; 817 {
1995                     .text:	section	.text,new
1996  0000               _USART_DMACmd:
1998  0000 89            	pushw	x
1999       00000000      OFST:	set	0
2002                     ; 819   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2004                     ; 820   assert_param(IS_FUNCTIONAL_STATE(NewState));
2006                     ; 822   if (NewState != DISABLE)
2008  0001 7b06          	ld	a,(OFST+6,sp)
2009  0003 2706          	jreq	L5411
2010                     ; 826     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2012  0005 e608          	ld	a,(8,x)
2013  0007 1a05          	or	a,(OFST+5,sp)
2015  0009 2007          	jra	L7411
2016  000b               L5411:
2017                     ; 832     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2019  000b 1e01          	ldw	x,(OFST+1,sp)
2020  000d 7b05          	ld	a,(OFST+5,sp)
2021  000f 43            	cpl	a
2022  0010 e408          	and	a,(8,x)
2023  0012               L7411:
2024  0012 e708          	ld	(8,x),a
2025                     ; 834 }
2028  0014 85            	popw	x
2029  0015 81            	ret	
2173                     ; 936 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2173                     ; 937 {
2174                     .text:	section	.text,new
2175  0000               _USART_ITConfig:
2177  0000 89            	pushw	x
2178  0001 89            	pushw	x
2179       00000002      OFST:	set	2
2182                     ; 938   uint8_t usartreg, itpos = 0x00;
2184                     ; 939   assert_param(IS_USART_CONFIG_IT(USART_IT));
2186                     ; 940   assert_param(IS_FUNCTIONAL_STATE(NewState));
2188                     ; 943   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2190  0002 7b07          	ld	a,(OFST+5,sp)
2191  0004 6b01          	ld	(OFST-1,sp),a
2192                     ; 945   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2194  0006 7b08          	ld	a,(OFST+6,sp)
2195  0008 a40f          	and	a,#15
2196  000a 5f            	clrw	x
2197  000b 97            	ld	xl,a
2198  000c a601          	ld	a,#1
2199  000e 5d            	tnzw	x
2200  000f 2704          	jreq	L06
2201  0011               L26:
2202  0011 48            	sll	a
2203  0012 5a            	decw	x
2204  0013 26fc          	jrne	L26
2205  0015               L06:
2206  0015 6b02          	ld	(OFST+0,sp),a
2207                     ; 947   if (NewState != DISABLE)
2209  0017 7b09          	ld	a,(OFST+7,sp)
2210  0019 2722          	jreq	L7321
2211                     ; 950     if (usartreg == 0x01)
2213  001b 7b01          	ld	a,(OFST-1,sp)
2214  001d a101          	cp	a,#1
2215  001f 2608          	jrne	L1421
2216                     ; 952       USARTx->CR1 |= itpos;
2218  0021 1e03          	ldw	x,(OFST+1,sp)
2219  0023 e604          	ld	a,(4,x)
2220  0025 1a02          	or	a,(OFST+0,sp)
2222  0027 2021          	jp	LC002
2223  0029               L1421:
2224                     ; 954     else if (usartreg == 0x05)
2226  0029 a105          	cp	a,#5
2227  002b 2608          	jrne	L5421
2228                     ; 956       USARTx->CR5 |= itpos;
2230  002d 1e03          	ldw	x,(OFST+1,sp)
2231  002f e608          	ld	a,(8,x)
2232  0031 1a02          	or	a,(OFST+0,sp)
2234  0033 2024          	jp	LC003
2235  0035               L5421:
2236                     ; 961       USARTx->CR2 |= itpos;
2238  0035 1e03          	ldw	x,(OFST+1,sp)
2239  0037 e605          	ld	a,(5,x)
2240  0039 1a02          	or	a,(OFST+0,sp)
2241  003b 2027          	jp	LC001
2242  003d               L7321:
2243                     ; 967     if (usartreg == 0x01)
2245  003d 7b01          	ld	a,(OFST-1,sp)
2246  003f a101          	cp	a,#1
2247  0041 260b          	jrne	L3521
2248                     ; 969       USARTx->CR1 &= (uint8_t)(~itpos);
2250  0043 1e03          	ldw	x,(OFST+1,sp)
2251  0045 7b02          	ld	a,(OFST+0,sp)
2252  0047 43            	cpl	a
2253  0048 e404          	and	a,(4,x)
2254  004a               LC002:
2255  004a e704          	ld	(4,x),a
2257  004c 2018          	jra	L1521
2258  004e               L3521:
2259                     ; 971     else if (usartreg == 0x05)
2261  004e a105          	cp	a,#5
2262  0050 260b          	jrne	L7521
2263                     ; 973       USARTx->CR5 &= (uint8_t)(~itpos);
2265  0052 1e03          	ldw	x,(OFST+1,sp)
2266  0054 7b02          	ld	a,(OFST+0,sp)
2267  0056 43            	cpl	a
2268  0057 e408          	and	a,(8,x)
2269  0059               LC003:
2270  0059 e708          	ld	(8,x),a
2272  005b 2009          	jra	L1521
2273  005d               L7521:
2274                     ; 978       USARTx->CR2 &= (uint8_t)(~itpos);
2276  005d 1e03          	ldw	x,(OFST+1,sp)
2277  005f 7b02          	ld	a,(OFST+0,sp)
2278  0061 43            	cpl	a
2279  0062 e405          	and	a,(5,x)
2280  0064               LC001:
2281  0064 e705          	ld	(5,x),a
2282  0066               L1521:
2283                     ; 981 }
2286  0066 5b04          	addw	sp,#4
2287  0068 81            	ret	
2435                     ; 999 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2435                     ; 1000 {
2436                     .text:	section	.text,new
2437  0000               _USART_GetFlagStatus:
2439  0000 89            	pushw	x
2440  0001 88            	push	a
2441       00000001      OFST:	set	1
2444                     ; 1001   FlagStatus status = RESET;
2446                     ; 1004   assert_param(IS_USART_FLAG(USART_FLAG));
2448                     ; 1006   if (USART_FLAG == USART_FLAG_SBK)
2450  0002 1e06          	ldw	x,(OFST+5,sp)
2451  0004 a30101        	cpw	x,#257
2452  0007 260a          	jrne	L1531
2453                     ; 1008     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2455  0009 1e02          	ldw	x,(OFST+1,sp)
2456  000b e605          	ld	a,(5,x)
2457  000d 1507          	bcp	a,(OFST+6,sp)
2458  000f 270d          	jreq	L1631
2459                     ; 1011       status = SET;
2461  0011 2007          	jp	LC005
2462                     ; 1016       status = RESET;
2463  0013               L1531:
2464                     ; 1021     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2466  0013 1e02          	ldw	x,(OFST+1,sp)
2467  0015 f6            	ld	a,(x)
2468  0016 1507          	bcp	a,(OFST+6,sp)
2469  0018 2704          	jreq	L1631
2470                     ; 1024       status = SET;
2472  001a               LC005:
2474  001a a601          	ld	a,#1
2476  001c 2001          	jra	L7531
2477  001e               L1631:
2478                     ; 1029       status = RESET;
2481  001e 4f            	clr	a
2482  001f               L7531:
2483                     ; 1033   return status;
2487  001f 5b03          	addw	sp,#3
2488  0021 81            	ret	
2535                     ; 1057 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2535                     ; 1058 {
2536                     .text:	section	.text,new
2537  0000               _USART_ClearFlag:
2539  0000 89            	pushw	x
2540       00000000      OFST:	set	0
2543                     ; 1060   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2545                     ; 1062   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2547  0001 7b06          	ld	a,(OFST+6,sp)
2548  0003 1e01          	ldw	x,(OFST+1,sp)
2549  0005 43            	cpl	a
2550  0006 f7            	ld	(x),a
2551                     ; 1063 }
2554  0007 85            	popw	x
2555  0008 81            	ret	
2658                     ; 1080 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2658                     ; 1081 {
2659                     .text:	section	.text,new
2660  0000               _USART_GetITStatus:
2662  0000 89            	pushw	x
2663  0001 5203          	subw	sp,#3
2664       00000003      OFST:	set	3
2667                     ; 1082   ITStatus pendingbitstatus = RESET;
2669                     ; 1083   uint8_t temp = 0;
2671                     ; 1084   uint8_t itpos = 0;
2673                     ; 1085   uint8_t itmask1 = 0;
2675                     ; 1086   uint8_t itmask2 = 0;
2677                     ; 1087   uint8_t enablestatus = 0;
2679                     ; 1090   assert_param(IS_USART_GET_IT(USART_IT));
2681                     ; 1093   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2683  0003 7b09          	ld	a,(OFST+6,sp)
2684  0005 a40f          	and	a,#15
2685  0007 5f            	clrw	x
2686  0008 97            	ld	xl,a
2687  0009 a601          	ld	a,#1
2688  000b 5d            	tnzw	x
2689  000c 2704          	jreq	L27
2690  000e               L47:
2691  000e 48            	sll	a
2692  000f 5a            	decw	x
2693  0010 26fc          	jrne	L47
2694  0012               L27:
2695  0012 6b02          	ld	(OFST-1,sp),a
2696                     ; 1095   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2698  0014 7b09          	ld	a,(OFST+6,sp)
2699  0016 4e            	swap	a
2700  0017 a40f          	and	a,#15
2701  0019 6b03          	ld	(OFST+0,sp),a
2702                     ; 1097   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2704  001b 5f            	clrw	x
2705  001c 97            	ld	xl,a
2706  001d a601          	ld	a,#1
2707  001f 5d            	tnzw	x
2708  0020 2704          	jreq	L67
2709  0022               L001:
2710  0022 48            	sll	a
2711  0023 5a            	decw	x
2712  0024 26fc          	jrne	L001
2713  0026               L67:
2714  0026 6b03          	ld	(OFST+0,sp),a
2715                     ; 1100   if (USART_IT == USART_IT_PE)
2717  0028 1e08          	ldw	x,(OFST+5,sp)
2718  002a a30100        	cpw	x,#256
2719  002d 2611          	jrne	L5641
2720                     ; 1103     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2722  002f 1e04          	ldw	x,(OFST+1,sp)
2723  0031 e604          	ld	a,(4,x)
2724  0033 1403          	and	a,(OFST+0,sp)
2725  0035 6b03          	ld	(OFST+0,sp),a
2726                     ; 1106     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2728  0037 f6            	ld	a,(x)
2729  0038 1502          	bcp	a,(OFST-1,sp)
2730  003a 2739          	jreq	L7051
2732  003c 7b03          	ld	a,(OFST+0,sp)
2733                     ; 1109       pendingbitstatus = SET;
2735  003e 201e          	jp	LC008
2736                     ; 1114       pendingbitstatus = RESET;
2737  0040               L5641:
2738                     ; 1118   else if (USART_IT == USART_IT_OR)
2740  0040 a30235        	cpw	x,#565
2741  0043 261f          	jrne	L5741
2742                     ; 1121     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2744  0045 1e04          	ldw	x,(OFST+1,sp)
2745  0047 e605          	ld	a,(5,x)
2746  0049 1403          	and	a,(OFST+0,sp)
2747  004b 6b03          	ld	(OFST+0,sp),a
2748                     ; 1124     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2750  004d e608          	ld	a,(8,x)
2751  004f a401          	and	a,#1
2752  0051 6b01          	ld	(OFST-2,sp),a
2753                     ; 1126     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2755  0053 f6            	ld	a,(x)
2756  0054 1502          	bcp	a,(OFST-1,sp)
2757  0056 271d          	jreq	L7051
2759  0058 7b03          	ld	a,(OFST+0,sp)
2760  005a 2604          	jrne	L1051
2762  005c 7b01          	ld	a,(OFST-2,sp)
2763  005e               LC008:
2764  005e 2715          	jreq	L7051
2765  0060               L1051:
2766                     ; 1129       pendingbitstatus = SET;
2770  0060 a601          	ld	a,#1
2772  0062 2012          	jra	L3741
2773                     ; 1134       pendingbitstatus = RESET;
2774  0064               L5741:
2775                     ; 1141     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2777  0064 1e04          	ldw	x,(OFST+1,sp)
2778  0066 e605          	ld	a,(5,x)
2779  0068 1403          	and	a,(OFST+0,sp)
2780  006a 6b03          	ld	(OFST+0,sp),a
2781                     ; 1143     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2783  006c f6            	ld	a,(x)
2784  006d 1502          	bcp	a,(OFST-1,sp)
2785  006f 2704          	jreq	L7051
2787  0071 7b03          	ld	a,(OFST+0,sp)
2788                     ; 1146       pendingbitstatus = SET;
2790  0073 26eb          	jrne	L1051
2791  0075               L7051:
2792                     ; 1151       pendingbitstatus = RESET;
2796  0075 4f            	clr	a
2797  0076               L3741:
2798                     ; 1156   return  pendingbitstatus;
2802  0076 5b05          	addw	sp,#5
2803  0078 81            	ret	
2841                     ; 1180 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2841                     ; 1181 {
2842                     .text:	section	.text,new
2843  0000               _USART_ClearITPendingBit:
2847                     ; 1182   assert_param(IS_USART_CLEAR_IT(USART_IT));
2849                     ; 1185   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2851  0000 f6            	ld	a,(x)
2852  0001 a4bf          	and	a,#191
2853  0003 f7            	ld	(x),a
2854                     ; 1186 }
2857  0004 81            	ret	
2870                     	xdef	_USART_ClearITPendingBit
2871                     	xdef	_USART_GetITStatus
2872                     	xdef	_USART_ClearFlag
2873                     	xdef	_USART_GetFlagStatus
2874                     	xdef	_USART_ITConfig
2875                     	xdef	_USART_DMACmd
2876                     	xdef	_USART_IrDACmd
2877                     	xdef	_USART_IrDAConfig
2878                     	xdef	_USART_SetGuardTime
2879                     	xdef	_USART_SmartCardNACKCmd
2880                     	xdef	_USART_SmartCardCmd
2881                     	xdef	_USART_HalfDuplexCmd
2882                     	xdef	_USART_SetAddress
2883                     	xdef	_USART_ReceiverWakeUpCmd
2884                     	xdef	_USART_WakeUpConfig
2885                     	xdef	_USART_ReceiveData9
2886                     	xdef	_USART_ReceiveData8
2887                     	xdef	_USART_SendData9
2888                     	xdef	_USART_SendData8
2889                     	xdef	_USART_SendBreak
2890                     	xdef	_USART_SetPrescaler
2891                     	xdef	_USART_Cmd
2892                     	xdef	_USART_ClockInit
2893                     	xdef	_USART_Init
2894                     	xdef	_USART_DeInit
2895                     	xref	_CLK_GetClockFreq
2896                     	xref.b	c_lreg
2897                     	xref.b	c_x
2916                     	xref	c_lursh
2917                     	xref	c_ltor
2918                     	xref	c_rtol
2919                     	xref	c_ludv
2920                     	end
