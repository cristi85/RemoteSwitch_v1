   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
 142                     ; 125 void SPI_DeInit(SPI_TypeDef* SPIx)
 142                     ; 126 {
 144                     .text:	section	.text,new
 145  0000               _SPI_DeInit:
 149                     ; 127   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 151  0000 7f            	clr	(x)
 152                     ; 128   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 154  0001 6f01          	clr	(1,x)
 155                     ; 129   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 157  0003 6f02          	clr	(2,x)
 158                     ; 130   SPIx->SR     = SPI_SR_RESET_VALUE;
 160  0005 a602          	ld	a,#2
 161  0007 e703          	ld	(3,x),a
 162                     ; 131   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 164  0009 a607          	ld	a,#7
 165  000b e705          	ld	(5,x),a
 166                     ; 132 }
 169  000d 81            	ret	
 495                     ; 174 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 495                     ; 175               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 495                     ; 176               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 495                     ; 177               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 495                     ; 178               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 495                     ; 179 {
 496                     .text:	section	.text,new
 497  0000               _SPI_Init:
 499  0000 89            	pushw	x
 500  0001 88            	push	a
 501       00000001      OFST:	set	1
 504                     ; 181   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 506                     ; 182   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 508                     ; 183   assert_param(IS_SPI_MODE(SPI_Mode));
 510                     ; 184   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 512                     ; 185   assert_param(IS_SPI_PHASE(SPI_CPHA));
 514                     ; 186   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 516                     ; 187   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 518                     ; 188   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 520                     ; 191   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 520                     ; 192                                   (uint8_t)SPI_BaudRatePrescaler) |
 520                     ; 193                         (uint8_t)((uint8_t)SPI_CPOL |
 520                     ; 194                                   SPI_CPHA));
 522  0002 7b09          	ld	a,(OFST+8,sp)
 523  0004 1a0a          	or	a,(OFST+9,sp)
 524  0006 6b01          	ld	(OFST+0,sp),a
 525  0008 7b06          	ld	a,(OFST+5,sp)
 526  000a 1a07          	or	a,(OFST+6,sp)
 527  000c 1e02          	ldw	x,(OFST+1,sp)
 528  000e 1a01          	or	a,(OFST+0,sp)
 529  0010 f7            	ld	(x),a
 530                     ; 197   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 532  0011 7b0b          	ld	a,(OFST+10,sp)
 533  0013 1a0c          	or	a,(OFST+11,sp)
 534  0015 e701          	ld	(1,x),a
 535                     ; 199   if (SPI_Mode == SPI_Mode_Master)
 537  0017 7b08          	ld	a,(OFST+7,sp)
 538  0019 a104          	cp	a,#4
 539  001b 2606          	jrne	L562
 540                     ; 201     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 542  001d e601          	ld	a,(1,x)
 543  001f aa01          	or	a,#1
 545  0021 2004          	jra	L762
 546  0023               L562:
 547                     ; 205     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 549  0023 e601          	ld	a,(1,x)
 550  0025 a4fe          	and	a,#254
 551  0027               L762:
 552  0027 e701          	ld	(1,x),a
 553                     ; 209   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 555  0029 f6            	ld	a,(x)
 556  002a 1a08          	or	a,(OFST+7,sp)
 557  002c f7            	ld	(x),a
 558                     ; 212   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  002d 7b0d          	ld	a,(OFST+12,sp)
 561  002f e705          	ld	(5,x),a
 562                     ; 213 }
 565  0031 5b03          	addw	sp,#3
 566  0033 81            	ret	
 633                     ; 222 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 633                     ; 223 {
 634                     .text:	section	.text,new
 635  0000               _SPI_Cmd:
 637  0000 89            	pushw	x
 638       00000000      OFST:	set	0
 641                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 643                     ; 227   if (NewState != DISABLE)
 645  0001 7b05          	ld	a,(OFST+5,sp)
 646  0003 2705          	jreq	L523
 647                     ; 229     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 649  0005 f6            	ld	a,(x)
 650  0006 aa40          	or	a,#64
 652  0008 2005          	jra	L723
 653  000a               L523:
 654                     ; 233     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 656  000a 1e01          	ldw	x,(OFST+1,sp)
 657  000c f6            	ld	a,(x)
 658  000d a4bf          	and	a,#191
 659  000f               L723:
 660  000f f7            	ld	(x),a
 661                     ; 235 }
 664  0010 85            	popw	x
 665  0011 81            	ret	
 713                     ; 244 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 713                     ; 245 {
 714                     .text:	section	.text,new
 715  0000               _SPI_NSSInternalSoftwareCmd:
 717  0000 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 247   assert_param(IS_FUNCTIONAL_STATE(NewState));
 723                     ; 249   if (NewState != DISABLE)
 725  0001 7b05          	ld	a,(OFST+5,sp)
 726  0003 2706          	jreq	L553
 727                     ; 251     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 729  0005 e601          	ld	a,(1,x)
 730  0007 aa01          	or	a,#1
 732  0009 2006          	jra	L753
 733  000b               L553:
 734                     ; 255     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 736  000b 1e01          	ldw	x,(OFST+1,sp)
 737  000d e601          	ld	a,(1,x)
 738  000f a4fe          	and	a,#254
 739  0011               L753:
 740  0011 e701          	ld	(1,x),a
 741                     ; 257 }
 744  0013 85            	popw	x
 745  0014 81            	ret	
 813                     ; 268 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 813                     ; 269 {
 814                     .text:	section	.text,new
 815  0000               _SPI_BiDirectionalLineConfig:
 817  0000 89            	pushw	x
 818       00000000      OFST:	set	0
 821                     ; 271   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 823                     ; 273   if (SPI_Direction != SPI_Direction_Rx)
 825  0001 7b05          	ld	a,(OFST+5,sp)
 826  0003 2706          	jreq	L514
 827                     ; 275     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 829  0005 e601          	ld	a,(1,x)
 830  0007 aa40          	or	a,#64
 832  0009 2006          	jra	L714
 833  000b               L514:
 834                     ; 279     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 836  000b 1e01          	ldw	x,(OFST+1,sp)
 837  000d e601          	ld	a,(1,x)
 838  000f a4bf          	and	a,#191
 839  0011               L714:
 840  0011 e701          	ld	(1,x),a
 841                     ; 281 }
 844  0013 85            	popw	x
 845  0014 81            	ret	
 891                     ; 316 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 891                     ; 317 {
 892                     .text:	section	.text,new
 893  0000               _SPI_SendData:
 895  0000 89            	pushw	x
 896       00000000      OFST:	set	0
 899                     ; 318   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 901  0001 1e01          	ldw	x,(OFST+1,sp)
 902  0003 7b05          	ld	a,(OFST+5,sp)
 903  0005 e704          	ld	(4,x),a
 904                     ; 319 }
 907  0007 85            	popw	x
 908  0008 81            	ret	
 945                     ; 326 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 945                     ; 327 {
 946                     .text:	section	.text,new
 947  0000               _SPI_ReceiveData:
 951                     ; 328   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 953  0000 e604          	ld	a,(4,x)
 956  0002 81            	ret	
 993                     ; 411 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 993                     ; 412 {
 994                     .text:	section	.text,new
 995  0000               _SPI_TransmitCRC:
 999                     ; 413   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1001  0000 e601          	ld	a,(1,x)
1002  0002 aa10          	or	a,#16
1003  0004 e701          	ld	(1,x),a
1004                     ; 414 }
1007  0006 81            	ret	
1056                     ; 423 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1056                     ; 424 {
1057                     .text:	section	.text,new
1058  0000               _SPI_CalculateCRCCmd:
1060  0000 89            	pushw	x
1061       00000000      OFST:	set	0
1064                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
1066                     ; 429   SPI_Cmd(SPI1, DISABLE);
1068  0001 4b00          	push	#0
1069  0003 ae5200        	ldw	x,#20992
1070  0006 cd0000        	call	_SPI_Cmd
1072  0009 84            	pop	a
1073                     ; 431   if (NewState != DISABLE)
1075  000a 7b05          	ld	a,(OFST+5,sp)
1076  000c 2708          	jreq	L135
1077                     ; 433     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1079  000e 1e01          	ldw	x,(OFST+1,sp)
1080  0010 e601          	ld	a,(1,x)
1081  0012 aa20          	or	a,#32
1083  0014 2006          	jra	L335
1084  0016               L135:
1085                     ; 437     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1087  0016 1e01          	ldw	x,(OFST+1,sp)
1088  0018 e601          	ld	a,(1,x)
1089  001a a4df          	and	a,#223
1090  001c               L335:
1091  001c e701          	ld	(1,x),a
1092                     ; 439 }
1095  001e 85            	popw	x
1096  001f 81            	ret	
1172                     ; 450 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1172                     ; 451 {
1173                     .text:	section	.text,new
1174  0000               _SPI_GetCRC:
1176  0000 89            	pushw	x
1177  0001 88            	push	a
1178       00000001      OFST:	set	1
1181                     ; 452   uint8_t crcreg = 0;
1183                     ; 455   assert_param(IS_SPI_CRC(SPI_CRC));
1185                     ; 457   if (SPI_CRC != SPI_CRC_RX)
1187  0002 7b06          	ld	a,(OFST+5,sp)
1188  0004 2704          	jreq	L575
1189                     ; 459     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1191  0006 e607          	ld	a,(7,x)
1193  0008 2004          	jra	L775
1194  000a               L575:
1195                     ; 463     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1197  000a 1e02          	ldw	x,(OFST+1,sp)
1198  000c e606          	ld	a,(6,x)
1199  000e               L775:
1200                     ; 467   return crcreg;
1204  000e 5b03          	addw	sp,#3
1205  0010 81            	ret	
1244                     ; 475 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1244                     ; 476 {
1245                     .text:	section	.text,new
1246  0000               _SPI_ResetCRC:
1248  0000 89            	pushw	x
1249       00000000      OFST:	set	0
1252                     ; 479   SPI_CalculateCRCCmd(SPIx, ENABLE);
1254  0001 4b01          	push	#1
1255  0003 cd0000        	call	_SPI_CalculateCRCCmd
1257  0006 84            	pop	a
1258                     ; 482   SPI_Cmd(SPIx, ENABLE);
1260  0007 4b01          	push	#1
1261  0009 1e02          	ldw	x,(OFST+2,sp)
1262  000b cd0000        	call	_SPI_Cmd
1264  000e 84            	pop	a
1265                     ; 483 }
1268  000f 85            	popw	x
1269  0010 81            	ret	
1307                     ; 490 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1307                     ; 491 {
1308                     .text:	section	.text,new
1309  0000               _SPI_GetCRCPolynomial:
1313                     ; 492   return SPIx->CRCPR; /* Return the CRC polynomial register */
1315  0000 e605          	ld	a,(5,x)
1318  0002 81            	ret	
1395                     ; 522 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1395                     ; 523 {
1396                     .text:	section	.text,new
1397  0000               _SPI_DMACmd:
1399  0000 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1405                     ; 526   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1407                     ; 528   if (NewState != DISABLE)
1409  0001 7b06          	ld	a,(OFST+6,sp)
1410  0003 2706          	jreq	L107
1411                     ; 531     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1413  0005 e602          	ld	a,(2,x)
1414  0007 1a05          	or	a,(OFST+5,sp)
1416  0009 2007          	jra	L307
1417  000b               L107:
1418                     ; 536     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1420  000b 1e01          	ldw	x,(OFST+1,sp)
1421  000d 7b05          	ld	a,(OFST+5,sp)
1422  000f 43            	cpl	a
1423  0010 e402          	and	a,(2,x)
1424  0012               L307:
1425  0012 e702          	ld	(2,x),a
1426                     ; 538 }
1429  0014 85            	popw	x
1430  0015 81            	ret	
1551                     ; 623 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1551                     ; 624 {
1552                     .text:	section	.text,new
1553  0000               _SPI_ITConfig:
1555  0000 89            	pushw	x
1556  0001 88            	push	a
1557       00000001      OFST:	set	1
1560                     ; 625   uint8_t itpos = 0;
1562                     ; 627   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1564                     ; 628   assert_param(IS_FUNCTIONAL_STATE(NewState));
1566                     ; 631   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1568  0002 7b06          	ld	a,(OFST+5,sp)
1569  0004 a40f          	and	a,#15
1570  0006 5f            	clrw	x
1571  0007 97            	ld	xl,a
1572  0008 a601          	ld	a,#1
1573  000a 5d            	tnzw	x
1574  000b 2704          	jreq	L64
1575  000d               L05:
1576  000d 48            	sll	a
1577  000e 5a            	decw	x
1578  000f 26fc          	jrne	L05
1579  0011               L64:
1580  0011 6b01          	ld	(OFST+0,sp),a
1581                     ; 633   if (NewState != DISABLE)
1583  0013 0d07          	tnz	(OFST+6,sp)
1584  0015 2708          	jreq	L367
1585                     ; 635     SPIx->CR3 |= itpos; /* Enable interrupt*/
1587  0017 1e02          	ldw	x,(OFST+1,sp)
1588  0019 e602          	ld	a,(2,x)
1589  001b 1a01          	or	a,(OFST+0,sp)
1591  001d 2005          	jra	L567
1592  001f               L367:
1593                     ; 639     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1595  001f 1e02          	ldw	x,(OFST+1,sp)
1596  0021 43            	cpl	a
1597  0022 e402          	and	a,(2,x)
1598  0024               L567:
1599  0024 e702          	ld	(2,x),a
1600                     ; 641 }
1603  0026 5b03          	addw	sp,#3
1604  0028 81            	ret	
1737                     ; 658 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1737                     ; 659 {
1738                     .text:	section	.text,new
1739  0000               _SPI_GetFlagStatus:
1741  0000 89            	pushw	x
1742  0001 88            	push	a
1743       00000001      OFST:	set	1
1746                     ; 660   FlagStatus status = RESET;
1748                     ; 662   assert_param(IS_SPI_FLAG(SPI_FLAG));
1750                     ; 665   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1752  0002 e603          	ld	a,(3,x)
1753  0004 1506          	bcp	a,(OFST+5,sp)
1754  0006 2704          	jreq	L1501
1755                     ; 667     status = SET; /* SPI_FLAG is set */
1757  0008 a601          	ld	a,#1
1759  000a 2001          	jra	L3501
1760  000c               L1501:
1761                     ; 671     status = RESET; /* SPI_FLAG is reset*/
1763  000c 4f            	clr	a
1764  000d               L3501:
1765                     ; 675   return status;
1769  000d 5b03          	addw	sp,#3
1770  000f 81            	ret	
1817                     ; 693 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1817                     ; 694 {
1818                     .text:	section	.text,new
1819  0000               _SPI_ClearFlag:
1821  0000 89            	pushw	x
1822       00000000      OFST:	set	0
1825                     ; 695   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1827                     ; 697   SPIx->SR = (uint8_t)(~SPI_FLAG);
1829  0001 7b05          	ld	a,(OFST+5,sp)
1830  0003 1e01          	ldw	x,(OFST+1,sp)
1831  0005 43            	cpl	a
1832  0006 e703          	ld	(3,x),a
1833                     ; 698 }
1836  0008 85            	popw	x
1837  0009 81            	ret	
1931                     ; 714 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1931                     ; 715 {
1932                     .text:	section	.text,new
1933  0000               _SPI_GetITStatus:
1935  0000 89            	pushw	x
1936  0001 5203          	subw	sp,#3
1937       00000003      OFST:	set	3
1940                     ; 716   ITStatus pendingbitstatus = RESET;
1942                     ; 717   uint8_t itpos = 0;
1944                     ; 718   uint8_t itmask1 = 0;
1946                     ; 719   uint8_t itmask2 = 0;
1948                     ; 720   __IO uint8_t enablestatus = 0;
1950  0003 0f02          	clr	(OFST-1,sp)
1951                     ; 721   assert_param(IS_SPI_GET_IT(SPI_IT));
1953                     ; 723   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1955  0005 7b08          	ld	a,(OFST+5,sp)
1956  0007 a40f          	and	a,#15
1957  0009 5f            	clrw	x
1958  000a 97            	ld	xl,a
1959  000b a601          	ld	a,#1
1960  000d 5d            	tnzw	x
1961  000e 2704          	jreq	L06
1962  0010               L26:
1963  0010 48            	sll	a
1964  0011 5a            	decw	x
1965  0012 26fc          	jrne	L26
1966  0014               L06:
1967  0014 6b01          	ld	(OFST-2,sp),a
1968                     ; 726   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1970  0016 7b08          	ld	a,(OFST+5,sp)
1971  0018 4e            	swap	a
1972  0019 a40f          	and	a,#15
1973  001b 6b03          	ld	(OFST+0,sp),a
1974                     ; 728   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1976  001d 5f            	clrw	x
1977  001e 97            	ld	xl,a
1978  001f a601          	ld	a,#1
1979  0021 5d            	tnzw	x
1980  0022 2704          	jreq	L46
1981  0024               L66:
1982  0024 48            	sll	a
1983  0025 5a            	decw	x
1984  0026 26fc          	jrne	L66
1985  0028               L46:
1986  0028 6b03          	ld	(OFST+0,sp),a
1987                     ; 730   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1989  002a 1e04          	ldw	x,(OFST+1,sp)
1990  002c e603          	ld	a,(3,x)
1991  002e 1403          	and	a,(OFST+0,sp)
1992  0030 6b02          	ld	(OFST-1,sp),a
1993                     ; 732   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1995  0032 e602          	ld	a,(2,x)
1996  0034 1501          	bcp	a,(OFST-2,sp)
1997  0036 2708          	jreq	L1511
1999  0038 0d02          	tnz	(OFST-1,sp)
2000  003a 2704          	jreq	L1511
2001                     ; 735     pendingbitstatus = SET;
2003  003c a601          	ld	a,#1
2005  003e 2001          	jra	L3511
2006  0040               L1511:
2007                     ; 740     pendingbitstatus = RESET;
2009  0040 4f            	clr	a
2010  0041               L3511:
2011                     ; 743   return  pendingbitstatus;
2015  0041 5b05          	addw	sp,#5
2016  0043 81            	ret	
2073                     ; 761 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2073                     ; 762 {
2074                     .text:	section	.text,new
2075  0000               _SPI_ClearITPendingBit:
2077  0000 89            	pushw	x
2078  0001 88            	push	a
2079       00000001      OFST:	set	1
2082                     ; 763   uint8_t itpos = 0;
2084                     ; 764   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2086                     ; 769   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2088  0002 7b06          	ld	a,(OFST+5,sp)
2089  0004 4e            	swap	a
2090  0005 a40f          	and	a,#15
2091  0007 5f            	clrw	x
2092  0008 97            	ld	xl,a
2093  0009 a601          	ld	a,#1
2094  000b 5d            	tnzw	x
2095  000c 2704          	jreq	L27
2096  000e               L47:
2097  000e 48            	sll	a
2098  000f 5a            	decw	x
2099  0010 26fc          	jrne	L47
2100  0012               L27:
2101  0012 6b01          	ld	(OFST+0,sp),a
2102                     ; 771   SPIx->SR = (uint8_t)(~itpos);
2104  0014 1e02          	ldw	x,(OFST+1,sp)
2105  0016 43            	cpl	a
2106  0017 e703          	ld	(3,x),a
2107                     ; 773 }
2110  0019 5b03          	addw	sp,#3
2111  001b 81            	ret	
2124                     	xdef	_SPI_ClearITPendingBit
2125                     	xdef	_SPI_GetITStatus
2126                     	xdef	_SPI_ClearFlag
2127                     	xdef	_SPI_GetFlagStatus
2128                     	xdef	_SPI_ITConfig
2129                     	xdef	_SPI_DMACmd
2130                     	xdef	_SPI_GetCRCPolynomial
2131                     	xdef	_SPI_ResetCRC
2132                     	xdef	_SPI_GetCRC
2133                     	xdef	_SPI_CalculateCRCCmd
2134                     	xdef	_SPI_TransmitCRC
2135                     	xdef	_SPI_ReceiveData
2136                     	xdef	_SPI_SendData
2137                     	xdef	_SPI_BiDirectionalLineConfig
2138                     	xdef	_SPI_NSSInternalSoftwareCmd
2139                     	xdef	_SPI_Cmd
2140                     	xdef	_SPI_Init
2141                     	xdef	_SPI_DeInit
2160                     	end
