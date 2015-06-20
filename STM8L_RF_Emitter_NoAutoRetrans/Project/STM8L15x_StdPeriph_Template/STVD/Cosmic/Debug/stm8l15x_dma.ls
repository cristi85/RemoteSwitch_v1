   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  50                     ; 137 void DMA_GlobalDeInit(void)
  50                     ; 138 {
  52                     .text:	section	.text,new
  53  0000               _DMA_GlobalDeInit:
  57                     ; 140   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  59  0000 72115070      	bres	20592,#0
  60                     ; 143   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  62  0004 35fc5070      	mov	20592,#252
  63                     ; 144 }
  66  0008 81            	ret	
 182                     ; 152 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 182                     ; 153 {
 183                     .text:	section	.text,new
 184  0000               _DMA_DeInit:
 186  0000 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 155   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 192                     ; 158   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 194  0001 f6            	ld	a,(x)
 195  0002 a4fe          	and	a,#254
 196  0004 f7            	ld	(x),a
 197                     ; 161   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 199  0005 7f            	clr	(x)
 200                     ; 164   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 202  0006 6f02          	clr	(2,x)
 203                     ; 167   if (DMA_Channelx == DMA1_Channel3)
 205  0008 a35093        	cpw	x,#20627
 206  000b 2608          	jrne	L501
 207                     ; 169     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 209  000d a640          	ld	a,#64
 210  000f e703          	ld	(3,x),a
 211                     ; 170     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 213  0011 6f05          	clr	(5,x)
 215  0013 2006          	jra	L701
 216  0015               L501:
 217                     ; 174     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 219  0015 1e01          	ldw	x,(OFST+1,sp)
 220  0017 a652          	ld	a,#82
 221  0019 e703          	ld	(3,x),a
 222  001b               L701:
 223                     ; 176   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 225  001b 1e01          	ldw	x,(OFST+1,sp)
 226                     ; 179   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 228  001d 6f06          	clr	(6,x)
 229  001f 6f04          	clr	(4,x)
 230                     ; 180   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 232  0021 6f07          	clr	(7,x)
 233                     ; 183   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 235  0023 6f01          	clr	(1,x)
 236                     ; 184 }
 239  0025 85            	popw	x
 240  0026 81            	ret	
 486                     ; 221 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 486                     ; 222               uint32_t DMA_Memory0BaseAddr,
 486                     ; 223               uint16_t DMA_PeripheralMemory1BaseAddr,
 486                     ; 224               uint8_t DMA_BufferSize,
 486                     ; 225               DMA_DIR_TypeDef DMA_DIR,
 486                     ; 226               DMA_Mode_TypeDef DMA_Mode,
 486                     ; 227               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 486                     ; 228               DMA_Priority_TypeDef DMA_Priority,
 486                     ; 229               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 486                     ; 230 {
 487                     .text:	section	.text,new
 488  0000               _DMA_Init:
 490  0000 89            	pushw	x
 491       00000000      OFST:	set	0
 494                     ; 232   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 496                     ; 233   assert_param(IS_DMA_DIR(DMA_DIR));
 498                     ; 234   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 500                     ; 235   assert_param(IS_DMA_MODE(DMA_Mode));
 502                     ; 236   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 504                     ; 237   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 506                     ; 241   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 508  0001 f6            	ld	a,(x)
 509  0002 a4fe          	and	a,#254
 510  0004 f7            	ld	(x),a
 511                     ; 244   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 513  0005 7f            	clr	(x)
 514                     ; 247   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 514                     ; 248                                            (uint8_t)DMA_Mode) | \
 514                     ; 249                                            (uint8_t)DMA_MemoryIncMode);
 516  0006 7b0c          	ld	a,(OFST+12,sp)
 517  0008 1a0d          	or	a,(OFST+13,sp)
 518  000a 1a0e          	or	a,(OFST+14,sp)
 519  000c fa            	or	a,(x)
 520  000d f7            	ld	(x),a
 521                     ; 252   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 523  000e e601          	ld	a,(1,x)
 524  0010 a4c7          	and	a,#199
 525  0012 e701          	ld	(1,x),a
 526                     ; 255   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 526                     ; 256                                   (uint8_t)DMA_MemoryDataSize);
 528  0014 7b0f          	ld	a,(OFST+15,sp)
 529  0016 1a10          	or	a,(OFST+16,sp)
 530  0018 ea01          	or	a,(1,x)
 531  001a e701          	ld	(1,x),a
 532                     ; 260   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 534  001c 1e01          	ldw	x,(OFST+1,sp)
 535  001e 7b0b          	ld	a,(OFST+11,sp)
 536  0020 e702          	ld	(2,x),a
 537                     ; 265   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 539  0022 7b09          	ld	a,(OFST+9,sp)
 540  0024 e703          	ld	(3,x),a
 541                     ; 266   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 543  0026 7b0a          	ld	a,(OFST+10,sp)
 544  0028 e704          	ld	(4,x),a
 545                     ; 270   if (DMA_Channelx == DMA1_Channel3)
 547  002a a35093        	cpw	x,#20627
 548  002d 2604          	jrne	L742
 549                     ; 272     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 551  002f 7b06          	ld	a,(OFST+6,sp)
 552  0031 e705          	ld	(5,x),a
 553  0033               L742:
 554                     ; 274   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 556  0033 7b07          	ld	a,(OFST+7,sp)
 557  0035 e706          	ld	(6,x),a
 558                     ; 275   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 560  0037 7b08          	ld	a,(OFST+8,sp)
 561  0039 e707          	ld	(7,x),a
 562                     ; 277 }
 565  003b 85            	popw	x
 566  003c 81            	ret	
 621                     ; 285 void DMA_GlobalCmd(FunctionalState NewState)
 621                     ; 286 {
 622                     .text:	section	.text,new
 623  0000               _DMA_GlobalCmd:
 627                     ; 288   assert_param(IS_FUNCTIONAL_STATE(NewState));
 629                     ; 290   if (NewState != DISABLE)
 631  0000 4d            	tnz	a
 632  0001 2705          	jreq	L772
 633                     ; 293     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 635  0003 72105070      	bset	20592,#0
 638  0007 81            	ret	
 639  0008               L772:
 640                     ; 298     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 642  0008 72115070      	bres	20592,#0
 643                     ; 300 }
 646  000c 81            	ret	
 693                     ; 311 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 693                     ; 312 {
 694                     .text:	section	.text,new
 695  0000               _DMA_Cmd:
 697  0000 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 314   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 703                     ; 315   assert_param(IS_FUNCTIONAL_STATE(NewState));
 705                     ; 317   if (NewState != DISABLE)
 707  0001 7b05          	ld	a,(OFST+5,sp)
 708  0003 2705          	jreq	L723
 709                     ; 320     DMA_Channelx->CCR |= DMA_CCR_CE;
 711  0005 f6            	ld	a,(x)
 712  0006 aa01          	or	a,#1
 714  0008 2005          	jra	L133
 715  000a               L723:
 716                     ; 325     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 718  000a 1e01          	ldw	x,(OFST+1,sp)
 719  000c f6            	ld	a,(x)
 720  000d a4fe          	and	a,#254
 721  000f               L133:
 722  000f f7            	ld	(x),a
 723                     ; 327 }
 726  0010 85            	popw	x
 727  0011 81            	ret	
 761                     ; 339 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 761                     ; 340 {
 762                     .text:	section	.text,new
 763  0000               _DMA_SetTimeOut:
 767                     ; 342   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 769                     ; 345   DMA1->GCSR = 0;
 771  0000 725f5070      	clr	20592
 772                     ; 346   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 774  0004 48            	sll	a
 775  0005 48            	sll	a
 776  0006 c75070        	ld	20592,a
 777                     ; 348 }
 780  0009 81            	ret	
 827                     ; 398 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 827                     ; 399 {
 828                     .text:	section	.text,new
 829  0000               _DMA_SetCurrDataCounter:
 831  0000 89            	pushw	x
 832       00000000      OFST:	set	0
 835                     ; 401   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 837                     ; 404   DMA_Channelx->CNBTR = DataNumber;
 839  0001 1e01          	ldw	x,(OFST+1,sp)
 840  0003 7b05          	ld	a,(OFST+5,sp)
 841  0005 e702          	ld	(2,x),a
 842                     ; 405 }
 845  0007 85            	popw	x
 846  0008 81            	ret	
 884                     ; 412 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 884                     ; 413 {
 885                     .text:	section	.text,new
 886  0000               _DMA_GetCurrDataCounter:
 890                     ; 415   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 892                     ; 418   return ((uint8_t)(DMA_Channelx->CNBTR));
 894  0000 e602          	ld	a,(2,x)
 897  0002 81            	ret	
 974                     ; 479 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 974                     ; 480                   DMA_ITx_TypeDef DMA_ITx,
 974                     ; 481                   FunctionalState NewState)
 974                     ; 482 {
 975                     .text:	section	.text,new
 976  0000               _DMA_ITConfig:
 978  0000 89            	pushw	x
 979       00000000      OFST:	set	0
 982                     ; 484   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 984                     ; 485   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 986                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
 988                     ; 488   if (NewState != DISABLE)
 990  0001 7b06          	ld	a,(OFST+6,sp)
 991  0003 2705          	jreq	L554
 992                     ; 491     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 994  0005 f6            	ld	a,(x)
 995  0006 1a05          	or	a,(OFST+5,sp)
 997  0008 2006          	jra	L754
 998  000a               L554:
 999                     ; 496     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1001  000a 1e01          	ldw	x,(OFST+1,sp)
1002  000c 7b05          	ld	a,(OFST+5,sp)
1003  000e 43            	cpl	a
1004  000f f4            	and	a,(x)
1005  0010               L754:
1006  0010 f7            	ld	(x),a
1007                     ; 498 }
1010  0011 85            	popw	x
1011  0012 81            	ret	
1260                     ; 527 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1260                     ; 528 {
1261                     .text:	section	.text,new
1262  0000               _DMA_GetFlagStatus:
1264  0000 89            	pushw	x
1265  0001 5204          	subw	sp,#4
1266       00000004      OFST:	set	4
1269                     ; 529   FlagStatus flagstatus = RESET;
1271                     ; 530   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1273                     ; 531   uint8_t tmpgir1 = 0;
1275                     ; 532   uint8_t tmpgcsr = 0;
1277                     ; 535   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1279                     ; 538   tmpgcsr = DMA1->GCSR;
1281  0003 c65070        	ld	a,20592
1282  0006 6b04          	ld	(OFST+0,sp),a
1283                     ; 539   tmpgir1 = DMA1->GIR1;
1285  0008 c65071        	ld	a,20593
1286  000b 6b01          	ld	(OFST-3,sp),a
1287                     ; 541   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1289  000d 01            	rrwa	x,a
1290  000e 9f            	ld	a,xl
1291  000f a40f          	and	a,#15
1292  0011 97            	ld	xl,a
1293  0012 4f            	clr	a
1294  0013 02            	rlwa	x,a
1295  0014 5d            	tnzw	x
1296  0015 2728          	jreq	L706
1297                     ; 544     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1299  0017 7b05          	ld	a,(OFST+1,sp)
1300  0019 a501          	bcp	a,#1
1301  001b 2705          	jreq	L116
1302                     ; 546       DMA_Channelx = DMA1_Channel0;
1304  001d ae5075        	ldw	x,#20597
1306  0020 2015          	jra	L316
1307  0022               L116:
1308                     ; 548     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1310  0022 a502          	bcp	a,#2
1311  0024 2705          	jreq	L516
1312                     ; 550       DMA_Channelx = DMA1_Channel1;
1314  0026 ae507f        	ldw	x,#20607
1316  0029 200c          	jra	L316
1317  002b               L516:
1318                     ; 552     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1320  002b a504          	bcp	a,#4
1321  002d 2705          	jreq	L126
1322                     ; 554       DMA_Channelx = DMA1_Channel2;
1324  002f ae5089        	ldw	x,#20617
1326  0032 2003          	jra	L316
1327  0034               L126:
1328                     ; 558       DMA_Channelx = DMA1_Channel3;
1330  0034 ae5093        	ldw	x,#20627
1331  0037               L316:
1332  0037 1f02          	ldw	(OFST-2,sp),x
1333                     ; 562     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1335  0039 e601          	ld	a,(1,x)
1336  003b 1406          	and	a,(OFST+2,sp)
1338  003d 2010          	jra	L526
1339  003f               L706:
1340                     ; 564   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1342  003f 7b05          	ld	a,(OFST+1,sp)
1343  0041 a510          	bcp	a,#16
1344  0043 2706          	jreq	L726
1345                     ; 567     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1347  0045 7b06          	ld	a,(OFST+2,sp)
1348  0047 1401          	and	a,(OFST-3,sp)
1350  0049 2004          	jra	L526
1351  004b               L726:
1352                     ; 572     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1354  004b 7b04          	ld	a,(OFST+0,sp)
1355  004d a402          	and	a,#2
1356  004f               L526:
1357                     ; 576   return (flagstatus);
1361  004f 5b06          	addw	sp,#6
1362  0051 81            	ret	
1409                     ; 594 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1409                     ; 595 {
1410                     .text:	section	.text,new
1411  0000               _DMA_ClearFlag:
1413  0000 89            	pushw	x
1414  0001 89            	pushw	x
1415       00000002      OFST:	set	2
1418                     ; 596   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1420                     ; 599   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1422                     ; 602   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1424  0002 01            	rrwa	x,a
1425  0003 9f            	ld	a,xl
1426  0004 a401          	and	a,#1
1427  0006 97            	ld	xl,a
1428  0007 4f            	clr	a
1429  0008 02            	rlwa	x,a
1430  0009 5d            	tnzw	x
1431  000a 2705          	jreq	L756
1432                     ; 604     DMA_Channelx = DMA1_Channel0;
1434  000c ae5075        	ldw	x,#20597
1436  000f 2017          	jra	L166
1437  0011               L756:
1438                     ; 608     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1440  0011 7b03          	ld	a,(OFST+1,sp)
1441  0013 a502          	bcp	a,#2
1442  0015 2705          	jreq	L366
1443                     ; 610       DMA_Channelx = DMA1_Channel1;
1445  0017 ae507f        	ldw	x,#20607
1447  001a 200c          	jra	L166
1448  001c               L366:
1449                     ; 614       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1451  001c a504          	bcp	a,#4
1452  001e 2705          	jreq	L766
1453                     ; 616         DMA_Channelx = DMA1_Channel2;
1455  0020 ae5089        	ldw	x,#20617
1457  0023 2003          	jra	L166
1458  0025               L766:
1459                     ; 620         DMA_Channelx = DMA1_Channel3;
1461  0025 ae5093        	ldw	x,#20627
1462  0028               L166:
1463  0028 1f01          	ldw	(OFST-1,sp),x
1464                     ; 626   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1466  002a 7b04          	ld	a,(OFST+2,sp)
1467  002c a406          	and	a,#6
1468  002e 43            	cpl	a
1469  002f e401          	and	a,(1,x)
1470  0031 e701          	ld	(1,x),a
1471                     ; 627 }
1474  0033 5b04          	addw	sp,#4
1475  0035 81            	ret	
1613                     ; 643 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1613                     ; 644 {
1614                     .text:	section	.text,new
1615  0000               _DMA_GetITStatus:
1617  0000 88            	push	a
1618  0001 5204          	subw	sp,#4
1619       00000004      OFST:	set	4
1622                     ; 645   ITStatus itstatus = RESET;
1624                     ; 646   uint8_t tmpreg = 0;
1626                     ; 647   uint8_t tmp2 = 0;
1628                     ; 648   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1630                     ; 651   assert_param(IS_DMA_GET_IT(DMA_IT));
1632                     ; 654   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1634  0003 a510          	bcp	a,#16
1635  0005 2705          	jreq	L757
1636                     ; 656     DMA_Channelx = DMA1_Channel0;
1638  0007 ae5075        	ldw	x,#20597
1640  000a 2017          	jra	L167
1641  000c               L757:
1642                     ; 660     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1644  000c 7b05          	ld	a,(OFST+1,sp)
1645  000e a520          	bcp	a,#32
1646  0010 2705          	jreq	L367
1647                     ; 662       DMA_Channelx = DMA1_Channel1;
1649  0012 ae507f        	ldw	x,#20607
1651  0015 200c          	jra	L167
1652  0017               L367:
1653                     ; 666       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1655  0017 a540          	bcp	a,#64
1656  0019 2705          	jreq	L767
1657                     ; 668         DMA_Channelx = DMA1_Channel2;
1659  001b ae5089        	ldw	x,#20617
1661  001e 2003          	jra	L167
1662  0020               L767:
1663                     ; 672         DMA_Channelx = DMA1_Channel3;
1665  0020 ae5093        	ldw	x,#20627
1666  0023               L167:
1667  0023 1f03          	ldw	(OFST-1,sp),x
1668                     ; 677   tmpreg =  DMA_Channelx->CSPR ;
1670  0025 e601          	ld	a,(1,x)
1671                     ; 678   tmpreg &= DMA_Channelx->CCR ;
1673  0027 f4            	and	a,(x)
1674  0028 6b01          	ld	(OFST-3,sp),a
1675                     ; 679   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1677  002a 7b05          	ld	a,(OFST+1,sp)
1678  002c a406          	and	a,#6
1679                     ; 680   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1681  002e 1401          	and	a,(OFST-3,sp)
1682                     ; 683   return (itstatus);
1686  0030 5b05          	addw	sp,#5
1687  0032 81            	ret	
1735                     ; 701 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1735                     ; 702 {
1736                     .text:	section	.text,new
1737  0000               _DMA_ClearITPendingBit:
1739  0000 88            	push	a
1740  0001 89            	pushw	x
1741       00000002      OFST:	set	2
1744                     ; 703   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1746                     ; 706   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1748                     ; 708   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1750  0002 a510          	bcp	a,#16
1751  0004 2705          	jreq	L7101
1752                     ; 710     DMA_Channelx = DMA1_Channel0;
1754  0006 ae5075        	ldw	x,#20597
1756  0009 2017          	jra	L1201
1757  000b               L7101:
1758                     ; 714     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1760  000b 7b03          	ld	a,(OFST+1,sp)
1761  000d a520          	bcp	a,#32
1762  000f 2705          	jreq	L3201
1763                     ; 716       DMA_Channelx = DMA1_Channel1;
1765  0011 ae507f        	ldw	x,#20607
1767  0014 200c          	jra	L1201
1768  0016               L3201:
1769                     ; 720       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1771  0016 a540          	bcp	a,#64
1772  0018 2705          	jreq	L7201
1773                     ; 722         DMA_Channelx = DMA1_Channel2;
1775  001a ae5089        	ldw	x,#20617
1777  001d 2003          	jra	L1201
1778  001f               L7201:
1779                     ; 726         DMA_Channelx = DMA1_Channel3;
1781  001f ae5093        	ldw	x,#20627
1782  0022               L1201:
1783  0022 1f01          	ldw	(OFST-1,sp),x
1784                     ; 731   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1786  0024 7b03          	ld	a,(OFST+1,sp)
1787  0026 a406          	and	a,#6
1788  0028 43            	cpl	a
1789  0029 e401          	and	a,(1,x)
1790  002b e701          	ld	(1,x),a
1791                     ; 732 }
1794  002d 5b03          	addw	sp,#3
1795  002f 81            	ret	
1808                     	xdef	_DMA_ClearITPendingBit
1809                     	xdef	_DMA_GetITStatus
1810                     	xdef	_DMA_ClearFlag
1811                     	xdef	_DMA_GetFlagStatus
1812                     	xdef	_DMA_ITConfig
1813                     	xdef	_DMA_GetCurrDataCounter
1814                     	xdef	_DMA_SetCurrDataCounter
1815                     	xdef	_DMA_SetTimeOut
1816                     	xdef	_DMA_Cmd
1817                     	xdef	_DMA_GlobalCmd
1818                     	xdef	_DMA_Init
1819                     	xdef	_DMA_DeInit
1820                     	xdef	_DMA_GlobalDeInit
1839                     	end
