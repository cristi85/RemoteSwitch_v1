   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 127 void TIM4_DeInit(void)
  49                     ; 128 {
  51                     .text:	section	.text,new
  52  0000               _TIM4_DeInit:
  56                     ; 129   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  58  0000 725f52e0      	clr	21216
  59                     ; 130   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  61  0004 725f52e1      	clr	21217
  62                     ; 131   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  64  0008 725f52e2      	clr	21218
  65                     ; 132   TIM4->IER   = TIM4_IER_RESET_VALUE;
  67  000c 725f52e4      	clr	21220
  68                     ; 133   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  70  0010 725f52e7      	clr	21223
  71                     ; 134   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  73  0014 725f52e8      	clr	21224
  74                     ; 135   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  76  0018 35ff52e9      	mov	21225,#255
  77                     ; 136   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  79  001c 725f52e5      	clr	21221
  80                     ; 137 }
  83  0020 81            	ret	
 251                     ; 162 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 251                     ; 163                        uint8_t TIM4_Period)
 251                     ; 164 {
 252                     .text:	section	.text,new
 253  0000               _TIM4_TimeBaseInit:
 257                     ; 166   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 259                     ; 168   TIM4->ARR = (uint8_t)(TIM4_Period);
 261  0000 9f            	ld	a,xl
 262  0001 c752e9        	ld	21225,a
 263                     ; 170   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 265  0004 9e            	ld	a,xh
 266  0005 c752e8        	ld	21224,a
 267                     ; 173   TIM4->EGR = TIM4_EventSource_Update;
 269  0008 350152e6      	mov	21222,#1
 270                     ; 174 }
 273  000c 81            	ret	
 341                     ; 202 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 341                     ; 203                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 341                     ; 204 {
 342                     .text:	section	.text,new
 343  0000               _TIM4_PrescalerConfig:
 347                     ; 206   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 349                     ; 207   assert_param(IS_TIM4_Prescaler(Prescaler));
 351                     ; 210   TIM4->PSCR = (uint8_t) Prescaler;
 353  0000 9e            	ld	a,xh
 354  0001 c752e8        	ld	21224,a
 355                     ; 213   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 357  0004 9f            	ld	a,xl
 358  0005 4a            	dec	a
 359  0006 2605          	jrne	L141
 360                     ; 215     TIM4->EGR |= TIM4_EGR_UG ;
 362  0008 721052e6      	bset	21222,#0
 365  000c 81            	ret	
 366  000d               L141:
 367                     ; 219     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 369  000d 721152e6      	bres	21222,#0
 370                     ; 221 }
 373  0011 81            	ret	
 407                     ; 229 void TIM4_SetCounter(uint8_t Counter)
 407                     ; 230 {
 408                     .text:	section	.text,new
 409  0000               _TIM4_SetCounter:
 413                     ; 232   TIM4->CNTR = (uint8_t)(Counter);
 415  0000 c752e7        	ld	21223,a
 416                     ; 233 }
 419  0003 81            	ret	
 453                     ; 241 void TIM4_SetAutoreload(uint8_t Autoreload)
 453                     ; 242 {
 454                     .text:	section	.text,new
 455  0000               _TIM4_SetAutoreload:
 459                     ; 244   TIM4->ARR = (uint8_t)(Autoreload);
 461  0000 c752e9        	ld	21225,a
 462                     ; 245 }
 465  0003 81            	ret	
 499                     ; 252 uint8_t TIM4_GetCounter(void)
 499                     ; 253 {
 500                     .text:	section	.text,new
 501  0000               _TIM4_GetCounter:
 503  0000 88            	push	a
 504       00000001      OFST:	set	1
 507                     ; 254   uint8_t tmpcntr = 0;
 509                     ; 255   tmpcntr = TIM4->CNTR;
 511  0001 c652e7        	ld	a,21223
 512                     ; 257   return ((uint8_t)tmpcntr);
 516  0004 5b01          	addw	sp,#1
 517  0006 81            	ret	
 541                     ; 281 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 541                     ; 282 {
 542                     .text:	section	.text,new
 543  0000               _TIM4_GetPrescaler:
 547                     ; 284   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 549  0000 c652e8        	ld	a,21224
 552  0003 81            	ret	
 608                     ; 293 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 608                     ; 294 {
 609                     .text:	section	.text,new
 610  0000               _TIM4_UpdateDisableConfig:
 614                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 616                     ; 299   if (NewState != DISABLE)
 618  0000 4d            	tnz	a
 619  0001 2705          	jreq	L552
 620                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 622  0003 721252e0      	bset	21216,#1
 625  0007 81            	ret	
 626  0008               L552:
 627                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 629  0008 721352e0      	bres	21216,#1
 630                     ; 307 }
 633  000c 81            	ret	
 691                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 691                     ; 318 {
 692                     .text:	section	.text,new
 693  0000               _TIM4_UpdateRequestConfig:
 697                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 699                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 701  0000 4a            	dec	a
 702  0001 2605          	jrne	L703
 703                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 705  0003 721452e0      	bset	21216,#2
 708  0007 81            	ret	
 709  0008               L703:
 710                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 712  0008 721552e0      	bres	21216,#2
 713                     ; 331 }
 716  000c 81            	ret	
 752                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 752                     ; 340 {
 753                     .text:	section	.text,new
 754  0000               _TIM4_ARRPreloadConfig:
 758                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 760                     ; 345   if (NewState != DISABLE)
 762  0000 4d            	tnz	a
 763  0001 2705          	jreq	L133
 764                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 766  0003 721e52e0      	bset	21216,#7
 769  0007 81            	ret	
 770  0008               L133:
 771                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 773  0008 721f52e0      	bres	21216,#7
 774                     ; 353 }
 777  000c 81            	ret	
 834                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 834                     ; 364 {
 835                     .text:	section	.text,new
 836  0000               _TIM4_SelectOnePulseMode:
 840                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 842                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 844  0000 4a            	dec	a
 845  0001 2605          	jrne	L363
 846                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 848  0003 721652e0      	bset	21216,#3
 851  0007 81            	ret	
 852  0008               L363:
 853                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 855  0008 721752e0      	bres	21216,#3
 856                     ; 377 }
 859  000c 81            	ret	
 894                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 894                     ; 386 {
 895                     .text:	section	.text,new
 896  0000               _TIM4_Cmd:
 900                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 902                     ; 391   if (NewState != DISABLE)
 904  0000 4d            	tnz	a
 905  0001 2705          	jreq	L504
 906                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 908  0003 721052e0      	bset	21216,#0
 911  0007 81            	ret	
 912  0008               L504:
 913                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 915  0008 721152e0      	bres	21216,#0
 916                     ; 399 }
 919  000c 81            	ret	
 984                     ; 427 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 984                     ; 428 {
 985                     .text:	section	.text,new
 986  0000               _TIM4_ITConfig:
 988  0000 89            	pushw	x
 989       00000000      OFST:	set	0
 992                     ; 430   assert_param(IS_TIM4_IT(TIM4_IT));
 994                     ; 431   assert_param(IS_FUNCTIONAL_STATE(NewState));
 996                     ; 433   if (NewState != DISABLE)
 998  0001 9f            	ld	a,xl
 999  0002 4d            	tnz	a
1000  0003 2706          	jreq	L344
1001                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
1003  0005 9e            	ld	a,xh
1004  0006 ca52e4        	or	a,21220
1006  0009 2006          	jra	L544
1007  000b               L344:
1008                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1010  000b 7b01          	ld	a,(OFST+1,sp)
1011  000d 43            	cpl	a
1012  000e c452e4        	and	a,21220
1013  0011               L544:
1014  0011 c752e4        	ld	21220,a
1015                     ; 443 }
1018  0014 85            	popw	x
1019  0015 81            	ret	
1076                     ; 453 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1076                     ; 454 {
1077                     .text:	section	.text,new
1078  0000               _TIM4_GenerateEvent:
1082                     ; 456   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1084                     ; 459   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1086  0000 ca52e6        	or	a,21222
1087  0003 c752e6        	ld	21222,a
1088                     ; 460 }
1091  0006 81            	ret	
1177                     ; 471 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1177                     ; 472 {
1178                     .text:	section	.text,new
1179  0000               _TIM4_GetFlagStatus:
1181  0000 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 473   FlagStatus bitstatus = RESET;
1187                     ; 476   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1189                     ; 478   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1191  0001 c452e5        	and	a,21221
1192  0004 2702          	jreq	L735
1193                     ; 480     bitstatus = SET;
1195  0006 a601          	ld	a,#1
1197  0008               L735:
1198                     ; 484     bitstatus = RESET;
1200                     ; 486   return ((FlagStatus)bitstatus);
1204  0008 5b01          	addw	sp,#1
1205  000a 81            	ret	
1240                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1240                     ; 498 {
1241                     .text:	section	.text,new
1242  0000               _TIM4_ClearFlag:
1246                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1248                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1250  0000 43            	cpl	a
1251  0001 c752e5        	ld	21221,a
1252                     ; 503 }
1255  0004 81            	ret	
1319                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1319                     ; 516 {
1320                     .text:	section	.text,new
1321  0000               _TIM4_GetITStatus:
1323  0000 88            	push	a
1324  0001 89            	pushw	x
1325       00000002      OFST:	set	2
1328                     ; 517   ITStatus bitstatus = RESET;
1330                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1334                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1336                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1338  0002 c452e5        	and	a,21221
1339  0005 6b01          	ld	(OFST-1,sp),a
1340                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1342  0007 c652e4        	ld	a,21220
1343  000a 1403          	and	a,(OFST+1,sp)
1344  000c 6b02          	ld	(OFST+0,sp),a
1345                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1347  000e 7b01          	ld	a,(OFST-1,sp)
1348  0010 2708          	jreq	L316
1350  0012 7b02          	ld	a,(OFST+0,sp)
1351  0014 2704          	jreq	L316
1352                     ; 530     bitstatus = (ITStatus)SET;
1354  0016 a601          	ld	a,#1
1356  0018 2001          	jra	L516
1357  001a               L316:
1358                     ; 534     bitstatus = (ITStatus)RESET;
1360  001a 4f            	clr	a
1361  001b               L516:
1362                     ; 536   return ((ITStatus)bitstatus);
1366  001b 5b03          	addw	sp,#3
1367  001d 81            	ret	
1403                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1403                     ; 548 {
1404                     .text:	section	.text,new
1405  0000               _TIM4_ClearITPendingBit:
1409                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1411                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1413  0000 43            	cpl	a
1414  0001 c752e5        	ld	21221,a
1415                     ; 554 }
1418  0004 81            	ret	
1477                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1477                     ; 566 {
1478                     .text:	section	.text,new
1479  0000               _TIM4_DMACmd:
1481  0000 89            	pushw	x
1482       00000000      OFST:	set	0
1485                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1487                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1489                     ; 571   if (NewState != DISABLE)
1491  0001 9f            	ld	a,xl
1492  0002 4d            	tnz	a
1493  0003 2706          	jreq	L566
1494                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1496  0005 9e            	ld	a,xh
1497  0006 ca52e3        	or	a,21219
1499  0009 2006          	jra	L766
1500  000b               L566:
1501                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1503  000b 7b01          	ld	a,(OFST+1,sp)
1504  000d 43            	cpl	a
1505  000e c452e3        	and	a,21219
1506  0011               L766:
1507  0011 c752e3        	ld	21219,a
1508                     ; 581 }
1511  0014 85            	popw	x
1512  0015 81            	ret	
1536                     ; 604 void TIM4_InternalClockConfig(void)
1536                     ; 605 {
1537                     .text:	section	.text,new
1538  0000               _TIM4_InternalClockConfig:
1542                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1544  0000 c652e2        	ld	a,21218
1545  0003 a4f8          	and	a,#248
1546  0005 c752e2        	ld	21218,a
1547                     ; 608 }
1550  0008 81            	ret	
1634                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1634                     ; 649 {
1635                     .text:	section	.text,new
1636  0000               _TIM4_SelectInputTrigger:
1638  0000 88            	push	a
1639  0001 88            	push	a
1640       00000001      OFST:	set	1
1643                     ; 650   uint8_t tmpsmcr = 0;
1645                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1647                     ; 655   tmpsmcr = TIM4->SMCR;
1649  0002 c652e2        	ld	a,21218
1650                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1652  0005 a48f          	and	a,#143
1653                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1655  0007 1a02          	or	a,(OFST+1,sp)
1656                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1658  0009 c752e2        	ld	21218,a
1659                     ; 662 }
1662  000c 85            	popw	x
1663  000d 81            	ret	
1738                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1738                     ; 674 {
1739                     .text:	section	.text,new
1740  0000               _TIM4_SelectOutputTrigger:
1742  0000 88            	push	a
1743  0001 88            	push	a
1744       00000001      OFST:	set	1
1747                     ; 675   uint8_t tmpcr2 = 0;
1749                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1751                     ; 680   tmpcr2 = TIM4->CR2;
1753  0002 c652e1        	ld	a,21217
1754                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1756  0005 a48f          	and	a,#143
1757                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1759  0007 1a02          	or	a,(OFST+1,sp)
1760                     ; 688   TIM4->CR2 = tmpcr2;
1762  0009 c752e1        	ld	21217,a
1763                     ; 689 }
1766  000c 85            	popw	x
1767  000d 81            	ret	
1858                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1858                     ; 704 {
1859                     .text:	section	.text,new
1860  0000               _TIM4_SelectSlaveMode:
1862  0000 88            	push	a
1863  0001 88            	push	a
1864       00000001      OFST:	set	1
1867                     ; 705   uint8_t tmpsmcr = 0;
1869                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1871                     ; 710   tmpsmcr = TIM4->SMCR;
1873  0002 c652e2        	ld	a,21218
1874                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1876  0005 a4f8          	and	a,#248
1877                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1879  0007 1a02          	or	a,(OFST+1,sp)
1880                     ; 718   TIM4->SMCR = tmpsmcr;
1882  0009 c752e2        	ld	21218,a
1883                     ; 719 }
1886  000c 85            	popw	x
1887  000d 81            	ret	
1923                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1923                     ; 728 {
1924                     .text:	section	.text,new
1925  0000               _TIM4_SelectMasterSlaveMode:
1929                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1931                     ; 733   if (NewState != DISABLE)
1933  0000 4d            	tnz	a
1934  0001 2705          	jreq	L1501
1935                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1937  0003 721e52e2      	bset	21218,#7
1940  0007 81            	ret	
1941  0008               L1501:
1942                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1944  0008 721f52e2      	bres	21218,#7
1945                     ; 741 }
1948  000c 81            	ret	
1961                     	xdef	_TIM4_SelectMasterSlaveMode
1962                     	xdef	_TIM4_SelectSlaveMode
1963                     	xdef	_TIM4_SelectOutputTrigger
1964                     	xdef	_TIM4_SelectInputTrigger
1965                     	xdef	_TIM4_InternalClockConfig
1966                     	xdef	_TIM4_DMACmd
1967                     	xdef	_TIM4_ClearITPendingBit
1968                     	xdef	_TIM4_GetITStatus
1969                     	xdef	_TIM4_ClearFlag
1970                     	xdef	_TIM4_GetFlagStatus
1971                     	xdef	_TIM4_GenerateEvent
1972                     	xdef	_TIM4_ITConfig
1973                     	xdef	_TIM4_Cmd
1974                     	xdef	_TIM4_SelectOnePulseMode
1975                     	xdef	_TIM4_ARRPreloadConfig
1976                     	xdef	_TIM4_UpdateRequestConfig
1977                     	xdef	_TIM4_UpdateDisableConfig
1978                     	xdef	_TIM4_GetPrescaler
1979                     	xdef	_TIM4_GetCounter
1980                     	xdef	_TIM4_SetAutoreload
1981                     	xdef	_TIM4_SetCounter
1982                     	xdef	_TIM4_PrescalerConfig
1983                     	xdef	_TIM4_TimeBaseInit
1984                     	xdef	_TIM4_DeInit
2003                     	end
