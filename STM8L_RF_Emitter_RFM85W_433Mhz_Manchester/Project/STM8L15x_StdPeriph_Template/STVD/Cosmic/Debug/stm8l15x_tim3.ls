   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 165 void TIM3_DeInit(void)
  49                     ; 166 {
  51                     .text:	section	.text,new
  52  0000               _TIM3_DeInit:
  56                     ; 167   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5280      	clr	21120
  59                     ; 168   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5281      	clr	21121
  62                     ; 169   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5282      	clr	21122
  65                     ; 170   TIM3->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5283      	clr	21123
  68                     ; 171   TIM3->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5285      	clr	21125
  71                     ; 172   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5287      	clr	21127
  74                     ; 175   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f528b      	clr	21131
  77                     ; 177   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  79  001c 35015289      	mov	21129,#1
  80                     ; 178   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  82  0020 3501528a      	mov	21130,#1
  83                     ; 181   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f528b      	clr	21131
  86                     ; 182   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5289      	clr	21129
  89                     ; 183   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f528a      	clr	21130
  92                     ; 185   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f528c      	clr	21132
  95                     ; 186   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f528d      	clr	21133
  98                     ; 188   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f528e      	clr	21134
 101                     ; 190   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff528f      	mov	21135,#255
 104                     ; 191   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff5290      	mov	21136,#255
 107                     ; 193   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5291      	clr	21137
 110                     ; 194   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5292      	clr	21138
 113                     ; 195   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5293      	clr	21139
 116                     ; 196   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5294      	clr	21140
 119                     ; 199   TIM3->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5296      	clr	21142
 122                     ; 200   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 124  0058 35015288      	mov	21128,#1
 125                     ; 201   TIM3->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5295      	clr	21141
 128                     ; 202   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5286      	clr	21126
 131                     ; 203 }
 134  0064 81            	ret	
 296                     ; 228 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 296                     ; 229                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 296                     ; 230                        uint16_t TIM3_Period)
 296                     ; 231 {
 297                     .text:	section	.text,new
 298  0000               _TIM3_TimeBaseInit:
 300  0000 89            	pushw	x
 301       00000000      OFST:	set	0
 304                     ; 233   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 306                     ; 234   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 308                     ; 239   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 310  0001 7b05          	ld	a,(OFST+5,sp)
 311  0003 c7528f        	ld	21135,a
 312                     ; 240   TIM3->ARRL = (uint8_t)(TIM3_Period);
 314  0006 7b06          	ld	a,(OFST+6,sp)
 315  0008 c75290        	ld	21136,a
 316                     ; 243   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 318  000b 9e            	ld	a,xh
 319  000c c7528e        	ld	21134,a
 320                     ; 246   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 322  000f c65280        	ld	a,21120
 323  0012 a48f          	and	a,#143
 324  0014 c75280        	ld	21120,a
 325                     ; 247   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 327  0017 9f            	ld	a,xl
 328  0018 ca5280        	or	a,21120
 329  001b c75280        	ld	21120,a
 330                     ; 250   TIM3->EGR = TIM3_EventSource_Update;
 332  001e 35015288      	mov	21128,#1
 333                     ; 251 }
 336  0022 85            	popw	x
 337  0023 81            	ret	
 405                     ; 271 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 405                     ; 272                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 405                     ; 273 {
 406                     .text:	section	.text,new
 407  0000               _TIM3_PrescalerConfig:
 411                     ; 275   assert_param(IS_TIM3_PRESCALER(Prescaler));
 413                     ; 276   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 415                     ; 279   TIM3->PSCR = (uint8_t)(Prescaler);
 417  0000 9e            	ld	a,xh
 418  0001 c7528e        	ld	21134,a
 419                     ; 282   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 421  0004 9f            	ld	a,xl
 422  0005 4a            	dec	a
 423  0006 2605          	jrne	L741
 424                     ; 284     TIM3->EGR |= TIM_EGR_UG ;
 426  0008 72105288      	bset	21128,#0
 429  000c 81            	ret	
 430  000d               L741:
 431                     ; 288     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 433  000d 72115288      	bres	21128,#0
 434                     ; 290 }
 437  0011 81            	ret	
 482                     ; 303 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 482                     ; 304 {
 483                     .text:	section	.text,new
 484  0000               _TIM3_CounterModeConfig:
 486  0000 88            	push	a
 487  0001 88            	push	a
 488       00000001      OFST:	set	1
 491                     ; 305   uint8_t tmpcr1 = 0;
 493                     ; 308   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 495                     ; 310   tmpcr1 = TIM3->CR1;
 497  0002 c65280        	ld	a,21120
 498                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 500  0005 a48f          	and	a,#143
 501                     ; 316   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 503  0007 1a02          	or	a,(OFST+1,sp)
 504                     ; 318   TIM3->CR1 = tmpcr1;
 506  0009 c75280        	ld	21120,a
 507                     ; 319 }
 510  000c 85            	popw	x
 511  000d 81            	ret	
 545                     ; 327 void TIM3_SetCounter(uint16_t Counter)
 545                     ; 328 {
 546                     .text:	section	.text,new
 547  0000               _TIM3_SetCounter:
 551                     ; 331   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 553  0000 9e            	ld	a,xh
 554  0001 c7528c        	ld	21132,a
 555                     ; 332   TIM3->CNTRL = (uint8_t)(Counter);
 557  0004 9f            	ld	a,xl
 558  0005 c7528d        	ld	21133,a
 559                     ; 333 }
 562  0008 81            	ret	
 596                     ; 341 void TIM3_SetAutoreload(uint16_t Autoreload)
 596                     ; 342 {
 597                     .text:	section	.text,new
 598  0000               _TIM3_SetAutoreload:
 602                     ; 344   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 604  0000 9e            	ld	a,xh
 605  0001 c7528f        	ld	21135,a
 606                     ; 345   TIM3->ARRL = (uint8_t)(Autoreload);
 608  0004 9f            	ld	a,xl
 609  0005 c75290        	ld	21136,a
 610                     ; 346 }
 613  0008 81            	ret	
 665                     ; 353 uint16_t TIM3_GetCounter(void)
 665                     ; 354 {
 666                     .text:	section	.text,new
 667  0000               _TIM3_GetCounter:
 669  0000 5204          	subw	sp,#4
 670       00000004      OFST:	set	4
 673                     ; 355   uint16_t tmpcnt = 0;
 675                     ; 358   tmpcntrh = TIM3->CNTRH;
 677  0002 c6528c        	ld	a,21132
 678  0005 6b02          	ld	(OFST-2,sp),a
 679                     ; 359   tmpcntrl = TIM3->CNTRL;
 681  0007 c6528d        	ld	a,21133
 682  000a 6b01          	ld	(OFST-3,sp),a
 683                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 685  000c 5f            	clrw	x
 686  000d 97            	ld	xl,a
 687  000e 1f03          	ldw	(OFST-1,sp),x
 688                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 690  0010 5f            	clrw	x
 691  0011 7b02          	ld	a,(OFST-2,sp)
 692  0013 97            	ld	xl,a
 693  0014 7b04          	ld	a,(OFST+0,sp)
 694  0016 01            	rrwa	x,a
 695  0017 1a03          	or	a,(OFST-1,sp)
 696  0019 01            	rrwa	x,a
 697                     ; 364   return ((uint16_t)tmpcnt);
 701  001a 5b04          	addw	sp,#4
 702  001c 81            	ret	
 726                     ; 380 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 726                     ; 381 {
 727                     .text:	section	.text,new
 728  0000               _TIM3_GetPrescaler:
 732                     ; 383   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 734  0000 c6528e        	ld	a,21134
 737  0003 81            	ret	
 793                     ; 393 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 793                     ; 394 {
 794                     .text:	section	.text,new
 795  0000               _TIM3_UpdateDisableConfig:
 799                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 801                     ; 399   if (NewState != DISABLE)
 803  0000 4d            	tnz	a
 804  0001 2705          	jreq	L513
 805                     ; 401     TIM3->CR1 |= TIM_CR1_UDIS;
 807  0003 72125280      	bset	21120,#1
 810  0007 81            	ret	
 811  0008               L513:
 812                     ; 405     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 814  0008 72135280      	bres	21120,#1
 815                     ; 407 }
 818  000c 81            	ret	
 876                     ; 417 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 876                     ; 418 {
 877                     .text:	section	.text,new
 878  0000               _TIM3_UpdateRequestConfig:
 882                     ; 420   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 884                     ; 423   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 886  0000 4a            	dec	a
 887  0001 2605          	jrne	L743
 888                     ; 425     TIM3->CR1 |= TIM_CR1_URS ;
 890  0003 72145280      	bset	21120,#2
 893  0007 81            	ret	
 894  0008               L743:
 895                     ; 429     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 897  0008 72155280      	bres	21120,#2
 898                     ; 431 }
 901  000c 81            	ret	
 937                     ; 439 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 937                     ; 440 {
 938                     .text:	section	.text,new
 939  0000               _TIM3_ARRPreloadConfig:
 943                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 945                     ; 445   if (NewState != DISABLE)
 947  0000 4d            	tnz	a
 948  0001 2705          	jreq	L173
 949                     ; 447     TIM3->CR1 |= TIM_CR1_ARPE;
 951  0003 721e5280      	bset	21120,#7
 954  0007 81            	ret	
 955  0008               L173:
 956                     ; 451     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 958  0008 721f5280      	bres	21120,#7
 959                     ; 453 }
 962  000c 81            	ret	
1019                     ; 463 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1019                     ; 464 {
1020                     .text:	section	.text,new
1021  0000               _TIM3_SelectOnePulseMode:
1025                     ; 466   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
1027                     ; 469   if (TIM3_OPMode == TIM3_OPMode_Single)
1029  0000 4a            	dec	a
1030  0001 2605          	jrne	L324
1031                     ; 471     TIM3->CR1 |= TIM_CR1_OPM ;
1033  0003 72165280      	bset	21120,#3
1036  0007 81            	ret	
1037  0008               L324:
1038                     ; 475     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1040  0008 72175280      	bres	21120,#3
1041                     ; 477 }
1044  000c 81            	ret	
1079                     ; 485 void TIM3_Cmd(FunctionalState NewState)
1079                     ; 486 {
1080                     .text:	section	.text,new
1081  0000               _TIM3_Cmd:
1085                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1087                     ; 491   if (NewState != DISABLE)
1089  0000 4d            	tnz	a
1090  0001 2705          	jreq	L544
1091                     ; 493     TIM3->CR1 |= TIM_CR1_CEN;
1093  0003 72105280      	bset	21120,#0
1096  0007 81            	ret	
1097  0008               L544:
1098                     ; 497     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1100  0008 72115280      	bres	21120,#0
1101                     ; 499 }
1104  000c 81            	ret	
1302                     ; 575 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1302                     ; 576                   TIM3_OutputState_TypeDef TIM3_OutputState,
1302                     ; 577                   uint16_t TIM3_Pulse,
1302                     ; 578                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1302                     ; 579                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1302                     ; 580 {
1303                     .text:	section	.text,new
1304  0000               _TIM3_OC1Init:
1306  0000 89            	pushw	x
1307  0001 88            	push	a
1308       00000001      OFST:	set	1
1311                     ; 581   uint8_t tmpccmr1 = 0;
1313                     ; 584   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1315                     ; 585   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1317                     ; 586   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1319                     ; 587   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1321                     ; 589   tmpccmr1 = TIM3->CCMR1;
1323  0002 c65289        	ld	a,21129
1324  0005 6b01          	ld	(OFST+0,sp),a
1325                     ; 592   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1327  0007 7211528b      	bres	21131,#0
1328                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1330  000b a48f          	and	a,#143
1331  000d 6b01          	ld	(OFST+0,sp),a
1332                     ; 597   tmpccmr1 |= (uint8_t)TIM3_OCMode;
1334  000f 9e            	ld	a,xh
1335  0010 1a01          	or	a,(OFST+0,sp)
1336  0012 6b01          	ld	(OFST+0,sp),a
1337                     ; 599   TIM3->CCMR1 = tmpccmr1;
1339  0014 c75289        	ld	21129,a
1340                     ; 602   if (TIM3_OutputState == TIM3_OutputState_Enable)
1342  0017 9f            	ld	a,xl
1343  0018 4a            	dec	a
1344  0019 2606          	jrne	L365
1345                     ; 604     TIM3->CCER1 |= TIM_CCER1_CC1E;
1347  001b 7210528b      	bset	21131,#0
1349  001f 2004          	jra	L565
1350  0021               L365:
1351                     ; 608     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1353  0021 7211528b      	bres	21131,#0
1354  0025               L565:
1355                     ; 612   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1357  0025 7b08          	ld	a,(OFST+7,sp)
1358  0027 4a            	dec	a
1359  0028 2606          	jrne	L765
1360                     ; 614     TIM3->CCER1 |= TIM_CCER1_CC1P;
1362  002a 7212528b      	bset	21131,#1
1364  002e 2004          	jra	L175
1365  0030               L765:
1366                     ; 618     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1368  0030 7213528b      	bres	21131,#1
1369  0034               L175:
1370                     ; 622   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1372  0034 7b09          	ld	a,(OFST+8,sp)
1373  0036 4a            	dec	a
1374  0037 2606          	jrne	L375
1375                     ; 624     TIM3->OISR |= TIM_OISR_OIS1;
1377  0039 72105296      	bset	21142,#0
1379  003d 2004          	jra	L575
1380  003f               L375:
1381                     ; 628     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1383  003f 72115296      	bres	21142,#0
1384  0043               L575:
1385                     ; 632   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
1387  0043 7b06          	ld	a,(OFST+5,sp)
1388  0045 c75291        	ld	21137,a
1389                     ; 633   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
1391  0048 7b07          	ld	a,(OFST+6,sp)
1392  004a c75292        	ld	21138,a
1393                     ; 634 }
1396  004d 5b03          	addw	sp,#3
1397  004f 81            	ret	
1480                     ; 661 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1480                     ; 662                   TIM3_OutputState_TypeDef TIM3_OutputState,
1480                     ; 663                   uint16_t TIM3_Pulse,
1480                     ; 664                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1480                     ; 665                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1480                     ; 666 {
1481                     .text:	section	.text,new
1482  0000               _TIM3_OC2Init:
1484  0000 89            	pushw	x
1485  0001 88            	push	a
1486       00000001      OFST:	set	1
1489                     ; 667   uint8_t tmpccmr2 = 0;
1491                     ; 670   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1493                     ; 671   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1495                     ; 672   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1497                     ; 673   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1499                     ; 675   tmpccmr2 = TIM3->CCMR2;
1501  0002 c6528a        	ld	a,21130
1502  0005 6b01          	ld	(OFST+0,sp),a
1503                     ; 678   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1505  0007 7219528b      	bres	21131,#4
1506                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1508  000b a48f          	and	a,#143
1509  000d 6b01          	ld	(OFST+0,sp),a
1510                     ; 684   tmpccmr2 |= (uint8_t)TIM3_OCMode;
1512  000f 9e            	ld	a,xh
1513  0010 1a01          	or	a,(OFST+0,sp)
1514  0012 6b01          	ld	(OFST+0,sp),a
1515                     ; 686   TIM3->CCMR2 = tmpccmr2;
1517  0014 c7528a        	ld	21130,a
1518                     ; 689   if (TIM3_OutputState == TIM3_OutputState_Enable)
1520  0017 9f            	ld	a,xl
1521  0018 4a            	dec	a
1522  0019 2606          	jrne	L146
1523                     ; 691     TIM3->CCER1 |= TIM_CCER1_CC2E;
1525  001b 7218528b      	bset	21131,#4
1527  001f 2004          	jra	L346
1528  0021               L146:
1529                     ; 695     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1531  0021 7219528b      	bres	21131,#4
1532  0025               L346:
1533                     ; 699   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1535  0025 7b08          	ld	a,(OFST+7,sp)
1536  0027 4a            	dec	a
1537  0028 2606          	jrne	L546
1538                     ; 701     TIM3->CCER1 |= TIM_CCER1_CC2P;
1540  002a 721a528b      	bset	21131,#5
1542  002e 2004          	jra	L746
1543  0030               L546:
1544                     ; 705     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1546  0030 721b528b      	bres	21131,#5
1547  0034               L746:
1548                     ; 710   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1550  0034 7b09          	ld	a,(OFST+8,sp)
1551  0036 4a            	dec	a
1552  0037 2606          	jrne	L156
1553                     ; 712     TIM3->OISR |= TIM_OISR_OIS2;
1555  0039 72145296      	bset	21142,#2
1557  003d 2004          	jra	L356
1558  003f               L156:
1559                     ; 716     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1561  003f 72155296      	bres	21142,#2
1562  0043               L356:
1563                     ; 720   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
1565  0043 7b06          	ld	a,(OFST+5,sp)
1566  0045 c75293        	ld	21139,a
1567                     ; 721   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
1569  0048 7b07          	ld	a,(OFST+6,sp)
1570  004a c75294        	ld	21140,a
1571                     ; 722 }
1574  004d 5b03          	addw	sp,#3
1575  004f 81            	ret	
1773                     ; 751 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1773                     ; 752                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1773                     ; 753                     TIM3_BreakState_TypeDef TIM3_BreakState,
1773                     ; 754                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1773                     ; 755                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1773                     ; 756 
1773                     ; 757 {
1774                     .text:	section	.text,new
1775  0000               _TIM3_BKRConfig:
1777  0000 89            	pushw	x
1778  0001 88            	push	a
1779       00000001      OFST:	set	1
1782                     ; 759   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1784                     ; 760   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1786                     ; 761   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1788                     ; 762   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1790                     ; 763   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1792                     ; 769   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1792                     ; 770                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1792                     ; 771                                   TIM3_AutomaticOutput));
1794  0002 7b06          	ld	a,(OFST+5,sp)
1795  0004 1a07          	or	a,(OFST+6,sp)
1796  0006 6b01          	ld	(OFST+0,sp),a
1797  0008 9f            	ld	a,xl
1798  0009 1a02          	or	a,(OFST+1,sp)
1799  000b 1a01          	or	a,(OFST+0,sp)
1800  000d 1a08          	or	a,(OFST+7,sp)
1801  000f c75295        	ld	21141,a
1802                     ; 772 }
1805  0012 5b03          	addw	sp,#3
1806  0014 81            	ret	
1842                     ; 780 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1842                     ; 781 {
1843                     .text:	section	.text,new
1844  0000               _TIM3_CtrlPWMOutputs:
1848                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1850                     ; 787   if (NewState != DISABLE)
1852  0000 4d            	tnz	a
1853  0001 2705          	jreq	L5001
1854                     ; 789     TIM3->BKR |= TIM_BKR_MOE ;
1856  0003 721e5295      	bset	21141,#7
1859  0007 81            	ret	
1860  0008               L5001:
1861                     ; 793     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1863  0008 721f5295      	bres	21141,#7
1864                     ; 795 }
1867  000c 81            	ret	
1932                     ; 815 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
1932                     ; 816                      TIM3_OCMode_TypeDef TIM3_OCMode)
1932                     ; 817 {
1933                     .text:	section	.text,new
1934  0000               _TIM3_SelectOCxM:
1936  0000 89            	pushw	x
1937       00000000      OFST:	set	0
1940                     ; 819   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1942                     ; 820   assert_param(IS_TIM3_OCM(TIM3_OCMode));
1944                     ; 822   if (TIM3_Channel == TIM3_Channel_1)
1946  0001 9e            	ld	a,xh
1947  0002 4d            	tnz	a
1948  0003 2615          	jrne	L3401
1949                     ; 825     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1951  0005 7211528b      	bres	21131,#0
1952                     ; 828     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1954  0009 c65289        	ld	a,21129
1955  000c a48f          	and	a,#143
1956  000e c75289        	ld	21129,a
1957                     ; 831     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
1959  0011 9f            	ld	a,xl
1960  0012 ca5289        	or	a,21129
1961  0015 c75289        	ld	21129,a
1963  0018 2014          	jra	L5401
1964  001a               L3401:
1965                     ; 836     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1967  001a 7219528b      	bres	21131,#4
1968                     ; 839     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1970  001e c6528a        	ld	a,21130
1971  0021 a48f          	and	a,#143
1972  0023 c7528a        	ld	21130,a
1973                     ; 842     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
1975  0026 c6528a        	ld	a,21130
1976  0029 1a02          	or	a,(OFST+2,sp)
1977  002b c7528a        	ld	21130,a
1978  002e               L5401:
1979                     ; 844 }
1982  002e 85            	popw	x
1983  002f 81            	ret	
2017                     ; 852 void TIM3_SetCompare1(uint16_t Compare)
2017                     ; 853 {
2018                     .text:	section	.text,new
2019  0000               _TIM3_SetCompare1:
2023                     ; 855   TIM3->CCR1H = (uint8_t)(Compare >> 8);
2025  0000 9e            	ld	a,xh
2026  0001 c75291        	ld	21137,a
2027                     ; 856   TIM3->CCR1L = (uint8_t)(Compare);
2029  0004 9f            	ld	a,xl
2030  0005 c75292        	ld	21138,a
2031                     ; 857 }
2034  0008 81            	ret	
2068                     ; 865 void TIM3_SetCompare2(uint16_t Compare)
2068                     ; 866 {
2069                     .text:	section	.text,new
2070  0000               _TIM3_SetCompare2:
2074                     ; 868   TIM3->CCR2H = (uint8_t)(Compare >> 8);
2076  0000 9e            	ld	a,xh
2077  0001 c75293        	ld	21139,a
2078                     ; 869   TIM3->CCR2L = (uint8_t)(Compare);
2080  0004 9f            	ld	a,xl
2081  0005 c75294        	ld	21140,a
2082                     ; 870 }
2085  0008 81            	ret	
2152                     ; 880 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2152                     ; 881 {
2153                     .text:	section	.text,new
2154  0000               _TIM3_ForcedOC1Config:
2156  0000 88            	push	a
2157  0001 88            	push	a
2158       00000001      OFST:	set	1
2161                     ; 882   uint8_t tmpccmr1 = 0;
2163                     ; 885   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2165                     ; 887   tmpccmr1 = TIM3->CCMR1;
2167  0002 c65289        	ld	a,21129
2168                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2170  0005 a48f          	and	a,#143
2171                     ; 893   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
2173  0007 1a02          	or	a,(OFST+1,sp)
2174                     ; 895   TIM3->CCMR1 = tmpccmr1;
2176  0009 c75289        	ld	21129,a
2177                     ; 896 }
2180  000c 85            	popw	x
2181  000d 81            	ret	
2226                     ; 906 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2226                     ; 907 {
2227                     .text:	section	.text,new
2228  0000               _TIM3_ForcedOC2Config:
2230  0000 88            	push	a
2231  0001 88            	push	a
2232       00000001      OFST:	set	1
2235                     ; 908   uint8_t tmpccmr2 = 0;
2237                     ; 911   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2239                     ; 913   tmpccmr2 = TIM3->CCMR2;
2241  0002 c6528a        	ld	a,21130
2242                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2244  0005 a48f          	and	a,#143
2245                     ; 919   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
2247  0007 1a02          	or	a,(OFST+1,sp)
2248                     ; 921   TIM3->CCMR2 = tmpccmr2;
2250  0009 c7528a        	ld	21130,a
2251                     ; 922 }
2254  000c 85            	popw	x
2255  000d 81            	ret	
2291                     ; 930 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2291                     ; 931 {
2292                     .text:	section	.text,new
2293  0000               _TIM3_OC1PreloadConfig:
2297                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2299                     ; 936   if (NewState != DISABLE)
2301  0000 4d            	tnz	a
2302  0001 2705          	jreq	L5711
2303                     ; 938     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
2305  0003 72165289      	bset	21129,#3
2308  0007 81            	ret	
2309  0008               L5711:
2310                     ; 942     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2312  0008 72175289      	bres	21129,#3
2313                     ; 944 }
2316  000c 81            	ret	
2352                     ; 952 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2352                     ; 953 {
2353                     .text:	section	.text,new
2354  0000               _TIM3_OC2PreloadConfig:
2358                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2360                     ; 958   if (NewState != DISABLE)
2362  0000 4d            	tnz	a
2363  0001 2705          	jreq	L7121
2364                     ; 960     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
2366  0003 7216528a      	bset	21130,#3
2369  0007 81            	ret	
2370  0008               L7121:
2371                     ; 964     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2373  0008 7217528a      	bres	21130,#3
2374                     ; 966 }
2377  000c 81            	ret	
2412                     ; 974 void TIM3_OC1FastConfig(FunctionalState NewState)
2412                     ; 975 {
2413                     .text:	section	.text,new
2414  0000               _TIM3_OC1FastConfig:
2418                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2420                     ; 980   if (NewState != DISABLE)
2422  0000 4d            	tnz	a
2423  0001 2705          	jreq	L1421
2424                     ; 982     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
2426  0003 72145289      	bset	21129,#2
2429  0007 81            	ret	
2430  0008               L1421:
2431                     ; 986     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2433  0008 72155289      	bres	21129,#2
2434                     ; 988 }
2437  000c 81            	ret	
2472                     ; 997 void TIM3_OC2FastConfig(FunctionalState NewState)
2472                     ; 998 {
2473                     .text:	section	.text,new
2474  0000               _TIM3_OC2FastConfig:
2478                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2480                     ; 1003   if (NewState != DISABLE)
2482  0000 4d            	tnz	a
2483  0001 2705          	jreq	L3621
2484                     ; 1005     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
2486  0003 7214528a      	bset	21130,#2
2489  0007 81            	ret	
2490  0008               L3621:
2491                     ; 1009     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2493  0008 7215528a      	bres	21130,#2
2494                     ; 1011 }
2497  000c 81            	ret	
2533                     ; 1021 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2533                     ; 1022 {
2534                     .text:	section	.text,new
2535  0000               _TIM3_OC1PolarityConfig:
2539                     ; 1024   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2541                     ; 1027   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2543  0000 4a            	dec	a
2544  0001 2605          	jrne	L5031
2545                     ; 1029     TIM3->CCER1 |= TIM_CCER1_CC1P ;
2547  0003 7212528b      	bset	21131,#1
2550  0007 81            	ret	
2551  0008               L5031:
2552                     ; 1033     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2554  0008 7213528b      	bres	21131,#1
2555                     ; 1035 }
2558  000c 81            	ret	
2594                     ; 1045 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2594                     ; 1046 {
2595                     .text:	section	.text,new
2596  0000               _TIM3_OC2PolarityConfig:
2600                     ; 1048   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2602                     ; 1051   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2604  0000 4a            	dec	a
2605  0001 2605          	jrne	L7231
2606                     ; 1053     TIM3->CCER1 |= TIM_CCER1_CC2P ;
2608  0003 721a528b      	bset	21131,#5
2611  0007 81            	ret	
2612  0008               L7231:
2613                     ; 1057     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2615  0008 721b528b      	bres	21131,#5
2616                     ; 1059 }
2619  000c 81            	ret	
2664                     ; 1071 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
2664                     ; 1072                  FunctionalState NewState)
2664                     ; 1073 {
2665                     .text:	section	.text,new
2666  0000               _TIM3_CCxCmd:
2668  0000 89            	pushw	x
2669       00000000      OFST:	set	0
2672                     ; 1075   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2674                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2676                     ; 1078   if (TIM3_Channel == TIM3_Channel_1)
2678  0001 9e            	ld	a,xh
2679  0002 4d            	tnz	a
2680  0003 2610          	jrne	L5531
2681                     ; 1081     if (NewState != DISABLE)
2683  0005 9f            	ld	a,xl
2684  0006 4d            	tnz	a
2685  0007 2706          	jreq	L7531
2686                     ; 1083       TIM3->CCER1 |= TIM_CCER1_CC1E ;
2688  0009 7210528b      	bset	21131,#0
2690  000d 2014          	jra	L3631
2691  000f               L7531:
2692                     ; 1087       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2694  000f 7211528b      	bres	21131,#0
2695  0013 200e          	jra	L3631
2696  0015               L5531:
2697                     ; 1094     if (NewState != DISABLE)
2699  0015 7b02          	ld	a,(OFST+2,sp)
2700  0017 2706          	jreq	L5631
2701                     ; 1096       TIM3->CCER1 |= TIM_CCER1_CC2E;
2703  0019 7218528b      	bset	21131,#4
2705  001d 2004          	jra	L3631
2706  001f               L5631:
2707                     ; 1100       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2709  001f 7219528b      	bres	21131,#4
2710  0023               L3631:
2711                     ; 1103 }
2714  0023 85            	popw	x
2715  0024 81            	ret	
2879                     ; 1181 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
2879                     ; 1182                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2879                     ; 1183                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
2879                     ; 1184                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2879                     ; 1185                  uint8_t TIM3_ICFilter)
2879                     ; 1186 {
2880                     .text:	section	.text,new
2881  0000               _TIM3_ICInit:
2883  0000 89            	pushw	x
2884       00000000      OFST:	set	0
2887                     ; 1188   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2889                     ; 1190   if (TIM3_Channel == TIM3_Channel_1)
2891  0001 9e            	ld	a,xh
2892  0002 4d            	tnz	a
2893  0003 2614          	jrne	L5641
2894                     ; 1193     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2896  0005 7b07          	ld	a,(OFST+7,sp)
2897  0007 88            	push	a
2898  0008 7b06          	ld	a,(OFST+6,sp)
2899  000a 97            	ld	xl,a
2900  000b 7b03          	ld	a,(OFST+3,sp)
2901  000d 95            	ld	xh,a
2902  000e cd0000        	call	L3_TI1_Config
2904  0011 84            	pop	a
2905                     ; 1196     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
2907  0012 7b06          	ld	a,(OFST+6,sp)
2908  0014 cd0000        	call	_TIM3_SetIC1Prescaler
2911  0017 2012          	jra	L7641
2912  0019               L5641:
2913                     ; 1201     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2915  0019 7b07          	ld	a,(OFST+7,sp)
2916  001b 88            	push	a
2917  001c 7b06          	ld	a,(OFST+6,sp)
2918  001e 97            	ld	xl,a
2919  001f 7b03          	ld	a,(OFST+3,sp)
2920  0021 95            	ld	xh,a
2921  0022 cd0000        	call	L5_TI2_Config
2923  0025 84            	pop	a
2924                     ; 1204     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
2926  0026 7b06          	ld	a,(OFST+6,sp)
2927  0028 cd0000        	call	_TIM3_SetIC2Prescaler
2929  002b               L7641:
2930                     ; 1206 }
2933  002b 85            	popw	x
2934  002c 81            	ret	
3030                     ; 1232 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
3030                     ; 1233                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
3030                     ; 1234                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
3030                     ; 1235                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
3030                     ; 1236                      uint8_t TIM3_ICFilter)
3030                     ; 1237 {
3031                     .text:	section	.text,new
3032  0000               _TIM3_PWMIConfig:
3034  0000 89            	pushw	x
3035  0001 89            	pushw	x
3036       00000002      OFST:	set	2
3039                     ; 1238   uint8_t icpolarity = TIM3_ICPolarity_Rising;
3041                     ; 1239   uint8_t icselection = TIM3_ICSelection_DirectTI;
3043                     ; 1242   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
3045                     ; 1245   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
3047  0002 9f            	ld	a,xl
3048  0003 4d            	tnz	a
3049  0004 2605          	jrne	L7351
3050                     ; 1247     icpolarity = TIM3_ICPolarity_Falling;
3052  0006 4c            	inc	a
3053  0007 6b01          	ld	(OFST-1,sp),a
3055  0009 2002          	jra	L1451
3056  000b               L7351:
3057                     ; 1251     icpolarity = TIM3_ICPolarity_Rising;
3059  000b 0f01          	clr	(OFST-1,sp)
3060  000d               L1451:
3061                     ; 1255   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
3063  000d 7b07          	ld	a,(OFST+5,sp)
3064  000f 4a            	dec	a
3065  0010 2604          	jrne	L3451
3066                     ; 1257     icselection = TIM3_ICSelection_IndirectTI;
3068  0012 a602          	ld	a,#2
3070  0014 2002          	jra	L5451
3071  0016               L3451:
3072                     ; 1261     icselection = TIM3_ICSelection_DirectTI;
3074  0016 a601          	ld	a,#1
3075  0018               L5451:
3076  0018 6b02          	ld	(OFST+0,sp),a
3077                     ; 1264   if (TIM3_Channel == TIM3_Channel_1)
3079  001a 7b03          	ld	a,(OFST+1,sp)
3080  001c 2626          	jrne	L7451
3081                     ; 1267     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
3081                     ; 1268                TIM3_ICFilter);
3083  001e 7b09          	ld	a,(OFST+7,sp)
3084  0020 88            	push	a
3085  0021 7b08          	ld	a,(OFST+6,sp)
3086  0023 97            	ld	xl,a
3087  0024 7b05          	ld	a,(OFST+3,sp)
3088  0026 95            	ld	xh,a
3089  0027 cd0000        	call	L3_TI1_Config
3091  002a 84            	pop	a
3092                     ; 1271     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3094  002b 7b08          	ld	a,(OFST+6,sp)
3095  002d cd0000        	call	_TIM3_SetIC1Prescaler
3097                     ; 1274     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3099  0030 7b09          	ld	a,(OFST+7,sp)
3100  0032 88            	push	a
3101  0033 7b03          	ld	a,(OFST+1,sp)
3102  0035 97            	ld	xl,a
3103  0036 7b02          	ld	a,(OFST+0,sp)
3104  0038 95            	ld	xh,a
3105  0039 cd0000        	call	L5_TI2_Config
3107  003c 84            	pop	a
3108                     ; 1277     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3110  003d 7b08          	ld	a,(OFST+6,sp)
3111  003f cd0000        	call	_TIM3_SetIC2Prescaler
3114  0042 2024          	jra	L1551
3115  0044               L7451:
3116                     ; 1282     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
3116                     ; 1283                TIM3_ICFilter);
3118  0044 7b09          	ld	a,(OFST+7,sp)
3119  0046 88            	push	a
3120  0047 7b08          	ld	a,(OFST+6,sp)
3121  0049 97            	ld	xl,a
3122  004a 7b05          	ld	a,(OFST+3,sp)
3123  004c 95            	ld	xh,a
3124  004d cd0000        	call	L5_TI2_Config
3126  0050 84            	pop	a
3127                     ; 1286     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3129  0051 7b08          	ld	a,(OFST+6,sp)
3130  0053 cd0000        	call	_TIM3_SetIC2Prescaler
3132                     ; 1289     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3134  0056 7b09          	ld	a,(OFST+7,sp)
3135  0058 88            	push	a
3136  0059 7b03          	ld	a,(OFST+1,sp)
3137  005b 97            	ld	xl,a
3138  005c 7b02          	ld	a,(OFST+0,sp)
3139  005e 95            	ld	xh,a
3140  005f cd0000        	call	L3_TI1_Config
3142  0062 84            	pop	a
3143                     ; 1292     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3145  0063 7b08          	ld	a,(OFST+6,sp)
3146  0065 cd0000        	call	_TIM3_SetIC1Prescaler
3148  0068               L1551:
3149                     ; 1294 }
3152  0068 5b04          	addw	sp,#4
3153  006a 81            	ret	
3205                     ; 1301 uint16_t TIM3_GetCapture1(void)
3205                     ; 1302 {
3206                     .text:	section	.text,new
3207  0000               _TIM3_GetCapture1:
3209  0000 5204          	subw	sp,#4
3210       00000004      OFST:	set	4
3213                     ; 1303   uint16_t tmpccr1 = 0;
3215                     ; 1306   tmpccr1h = TIM3->CCR1H;
3217  0002 c65291        	ld	a,21137
3218  0005 6b02          	ld	(OFST-2,sp),a
3219                     ; 1307   tmpccr1l = TIM3->CCR1L;
3221  0007 c65292        	ld	a,21138
3222  000a 6b01          	ld	(OFST-3,sp),a
3223                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3225  000c 5f            	clrw	x
3226  000d 97            	ld	xl,a
3227  000e 1f03          	ldw	(OFST-1,sp),x
3228                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3230  0010 5f            	clrw	x
3231  0011 7b02          	ld	a,(OFST-2,sp)
3232  0013 97            	ld	xl,a
3233  0014 7b04          	ld	a,(OFST+0,sp)
3234  0016 01            	rrwa	x,a
3235  0017 1a03          	or	a,(OFST-1,sp)
3236  0019 01            	rrwa	x,a
3237                     ; 1312   return ((uint16_t)tmpccr1);
3241  001a 5b04          	addw	sp,#4
3242  001c 81            	ret	
3294                     ; 1320 uint16_t TIM3_GetCapture2(void)
3294                     ; 1321 {
3295                     .text:	section	.text,new
3296  0000               _TIM3_GetCapture2:
3298  0000 5204          	subw	sp,#4
3299       00000004      OFST:	set	4
3302                     ; 1322   uint16_t tmpccr2 = 0;
3304                     ; 1325   tmpccr2h = TIM3->CCR2H;
3306  0002 c65293        	ld	a,21139
3307  0005 6b02          	ld	(OFST-2,sp),a
3308                     ; 1326   tmpccr2l = TIM3->CCR2L;
3310  0007 c65294        	ld	a,21140
3311  000a 6b01          	ld	(OFST-3,sp),a
3312                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3314  000c 5f            	clrw	x
3315  000d 97            	ld	xl,a
3316  000e 1f03          	ldw	(OFST-1,sp),x
3317                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3319  0010 5f            	clrw	x
3320  0011 7b02          	ld	a,(OFST-2,sp)
3321  0013 97            	ld	xl,a
3322  0014 7b04          	ld	a,(OFST+0,sp)
3323  0016 01            	rrwa	x,a
3324  0017 1a03          	or	a,(OFST-1,sp)
3325  0019 01            	rrwa	x,a
3326                     ; 1331   return ((uint16_t)tmpccr2);
3330  001a 5b04          	addw	sp,#4
3331  001c 81            	ret	
3376                     ; 1344 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3376                     ; 1345 {
3377                     .text:	section	.text,new
3378  0000               _TIM3_SetIC1Prescaler:
3380  0000 88            	push	a
3381  0001 88            	push	a
3382       00000001      OFST:	set	1
3385                     ; 1346   uint8_t tmpccmr1 = 0;
3387                     ; 1349   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
3389                     ; 1351   tmpccmr1 = TIM3->CCMR1;
3391  0002 c65289        	ld	a,21129
3392                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3394  0005 a4f3          	and	a,#243
3395                     ; 1357   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
3397  0007 1a02          	or	a,(OFST+1,sp)
3398                     ; 1359   TIM3->CCMR1 = tmpccmr1;
3400  0009 c75289        	ld	21129,a
3401                     ; 1360 }
3404  000c 85            	popw	x
3405  000d 81            	ret	
3450                     ; 1372 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3450                     ; 1373 {
3451                     .text:	section	.text,new
3452  0000               _TIM3_SetIC2Prescaler:
3454  0000 88            	push	a
3455  0001 88            	push	a
3456       00000001      OFST:	set	1
3459                     ; 1374   uint8_t tmpccmr2 = 0;
3461                     ; 1377   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
3463                     ; 1379   tmpccmr2 = TIM3->CCMR2;
3465  0002 c6528a        	ld	a,21130
3466                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3468  0005 a4f3          	and	a,#243
3469                     ; 1385   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
3471  0007 1a02          	or	a,(OFST+1,sp)
3472                     ; 1387   TIM3->CCMR2 = tmpccmr2;
3474  0009 c7528a        	ld	21130,a
3475                     ; 1388 }
3478  000c 85            	popw	x
3479  000d 81            	ret	
3565                     ; 1419 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
3565                     ; 1420 {
3566                     .text:	section	.text,new
3567  0000               _TIM3_ITConfig:
3569  0000 89            	pushw	x
3570       00000000      OFST:	set	0
3573                     ; 1422   assert_param(IS_TIM3_IT(TIM3_IT));
3575                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3577                     ; 1425   if (NewState != DISABLE)
3579  0001 9f            	ld	a,xl
3580  0002 4d            	tnz	a
3581  0003 2706          	jreq	L3371
3582                     ; 1428     TIM3->IER |= (uint8_t)TIM3_IT;
3584  0005 9e            	ld	a,xh
3585  0006 ca5285        	or	a,21125
3587  0009 2006          	jra	L5371
3588  000b               L3371:
3589                     ; 1433     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
3591  000b 7b01          	ld	a,(OFST+1,sp)
3592  000d 43            	cpl	a
3593  000e c45285        	and	a,21125
3594  0011               L5371:
3595  0011 c75285        	ld	21125,a
3596                     ; 1435 }
3599  0014 85            	popw	x
3600  0015 81            	ret	
3681                     ; 1448 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3681                     ; 1449 {
3682                     .text:	section	.text,new
3683  0000               _TIM3_GenerateEvent:
3687                     ; 1451   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3689                     ; 1454   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3691  0000 ca5288        	or	a,21128
3692  0003 c75288        	ld	21128,a
3693                     ; 1455 }
3696  0006 81            	ret	
3835                     ; 1470 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3835                     ; 1471 {
3836                     .text:	section	.text,new
3837  0000               _TIM3_GetFlagStatus:
3839  0000 89            	pushw	x
3840  0001 89            	pushw	x
3841       00000002      OFST:	set	2
3844                     ; 1472   FlagStatus bitstatus = RESET;
3846                     ; 1473   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3850                     ; 1476   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
3852                     ; 1478   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
3854  0002 9f            	ld	a,xl
3855  0003 c45286        	and	a,21126
3856  0006 6b01          	ld	(OFST-1,sp),a
3857                     ; 1479   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
3859  0008 c65287        	ld	a,21127
3860  000b 1403          	and	a,(OFST+1,sp)
3861  000d 6b02          	ld	(OFST+0,sp),a
3862                     ; 1481   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
3864  000f 1a01          	or	a,(OFST-1,sp)
3865  0011 2702          	jreq	L7502
3866                     ; 1483     bitstatus = SET;
3868  0013 a601          	ld	a,#1
3870  0015               L7502:
3871                     ; 1487     bitstatus = RESET;
3873                     ; 1489   return ((FlagStatus)bitstatus);
3877  0015 5b04          	addw	sp,#4
3878  0017 81            	ret	
3913                     ; 1503 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3913                     ; 1504 {
3914                     .text:	section	.text,new
3915  0000               _TIM3_ClearFlag:
3917  0000 89            	pushw	x
3918       00000000      OFST:	set	0
3921                     ; 1506   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
3923                     ; 1508   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
3925  0001 9f            	ld	a,xl
3926  0002 43            	cpl	a
3927  0003 c75286        	ld	21126,a
3928                     ; 1509   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
3930  0006 7b01          	ld	a,(OFST+1,sp)
3931  0008 43            	cpl	a
3932  0009 c75287        	ld	21127,a
3933                     ; 1510 }
3936  000c 85            	popw	x
3937  000d 81            	ret	
4001                     ; 1523 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4001                     ; 1524 {
4002                     .text:	section	.text,new
4003  0000               _TIM3_GetITStatus:
4005  0000 88            	push	a
4006  0001 89            	pushw	x
4007       00000002      OFST:	set	2
4010                     ; 1525   ITStatus bitstatus = RESET;
4012                     ; 1527   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
4016                     ; 1530   assert_param(IS_TIM3_GET_IT(TIM3_IT));
4018                     ; 1532   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
4020  0002 c45286        	and	a,21126
4021  0005 6b01          	ld	(OFST-1,sp),a
4022                     ; 1534   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
4024  0007 c65285        	ld	a,21125
4025  000a 1403          	and	a,(OFST+1,sp)
4026  000c 6b02          	ld	(OFST+0,sp),a
4027                     ; 1536   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
4029  000e 7b01          	ld	a,(OFST-1,sp)
4030  0010 2708          	jreq	L3312
4032  0012 7b02          	ld	a,(OFST+0,sp)
4033  0014 2704          	jreq	L3312
4034                     ; 1538     bitstatus = (ITStatus)SET;
4036  0016 a601          	ld	a,#1
4038  0018 2001          	jra	L5312
4039  001a               L3312:
4040                     ; 1542     bitstatus = (ITStatus)RESET;
4042  001a 4f            	clr	a
4043  001b               L5312:
4044                     ; 1544   return ((ITStatus)bitstatus);
4048  001b 5b03          	addw	sp,#3
4049  001d 81            	ret	
4085                     ; 1558 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4085                     ; 1559 {
4086                     .text:	section	.text,new
4087  0000               _TIM3_ClearITPendingBit:
4091                     ; 1561   assert_param(IS_TIM3_IT(TIM3_IT));
4093                     ; 1564   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
4095  0000 43            	cpl	a
4096  0001 c75286        	ld	21126,a
4097                     ; 1565 }
4100  0004 81            	ret	
4173                     ; 1578 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
4173                     ; 1579 {
4174                     .text:	section	.text,new
4175  0000               _TIM3_DMACmd:
4177  0000 89            	pushw	x
4178       00000000      OFST:	set	0
4181                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4183                     ; 1582   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
4185                     ; 1584   if (NewState != DISABLE)
4187  0001 9f            	ld	a,xl
4188  0002 4d            	tnz	a
4189  0003 2706          	jreq	L1122
4190                     ; 1587     TIM3->DER |= TIM3_DMASource;
4192  0005 9e            	ld	a,xh
4193  0006 ca5284        	or	a,21124
4195  0009 2006          	jra	L3122
4196  000b               L1122:
4197                     ; 1592     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
4199  000b 7b01          	ld	a,(OFST+1,sp)
4200  000d 43            	cpl	a
4201  000e c45284        	and	a,21124
4202  0011               L3122:
4203  0011 c75284        	ld	21124,a
4204                     ; 1594 }
4207  0014 85            	popw	x
4208  0015 81            	ret	
4243                     ; 1602 void TIM3_SelectCCDMA(FunctionalState NewState)
4243                     ; 1603 {
4244                     .text:	section	.text,new
4245  0000               _TIM3_SelectCCDMA:
4249                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4251                     ; 1607   if (NewState != DISABLE)
4253  0000 4d            	tnz	a
4254  0001 2705          	jreq	L3322
4255                     ; 1610     TIM3->CR2 |= TIM_CR2_CCDS;
4257  0003 72165281      	bset	21121,#3
4260  0007 81            	ret	
4261  0008               L3322:
4262                     ; 1615     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4264  0008 72175281      	bres	21121,#3
4265                     ; 1617 }
4268  000c 81            	ret	
4292                     ; 1641 void TIM3_InternalClockConfig(void)
4292                     ; 1642 {
4293                     .text:	section	.text,new
4294  0000               _TIM3_InternalClockConfig:
4298                     ; 1644   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4300  0000 c65282        	ld	a,21122
4301  0003 a4f8          	and	a,#248
4302  0005 c75282        	ld	21122,a
4303                     ; 1645 }
4306  0008 81            	ret	
4395                     ; 1662 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
4395                     ; 1663                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
4395                     ; 1664                                  uint8_t ICFilter)
4395                     ; 1665 {
4396                     .text:	section	.text,new
4397  0000               _TIM3_TIxExternalClockConfig:
4399  0000 89            	pushw	x
4400       00000000      OFST:	set	0
4403                     ; 1667   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
4405                     ; 1668   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
4407                     ; 1669   assert_param(IS_TIM3_IC_FILTER(ICFilter));
4409                     ; 1672   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
4411  0001 9e            	ld	a,xh
4412  0002 a160          	cp	a,#96
4413  0004 260e          	jrne	L7032
4414                     ; 1674     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4416  0006 7b05          	ld	a,(OFST+5,sp)
4417  0008 88            	push	a
4418  0009 ae0001        	ldw	x,#1
4419  000c 7b03          	ld	a,(OFST+3,sp)
4420  000e 95            	ld	xh,a
4421  000f cd0000        	call	L5_TI2_Config
4424  0012 200c          	jra	L1132
4425  0014               L7032:
4426                     ; 1678     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4428  0014 7b05          	ld	a,(OFST+5,sp)
4429  0016 88            	push	a
4430  0017 ae0001        	ldw	x,#1
4431  001a 7b03          	ld	a,(OFST+3,sp)
4432  001c 95            	ld	xh,a
4433  001d cd0000        	call	L3_TI1_Config
4435  0020               L1132:
4436  0020 84            	pop	a
4437                     ; 1682   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
4439  0021 7b01          	ld	a,(OFST+1,sp)
4440  0023 cd0000        	call	_TIM3_SelectInputTrigger
4442                     ; 1685   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4444  0026 c65282        	ld	a,21122
4445  0029 aa07          	or	a,#7
4446  002b c75282        	ld	21122,a
4447                     ; 1686 }
4450  002e 85            	popw	x
4451  002f 81            	ret	
4568                     ; 1704 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4568                     ; 1705                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4568                     ; 1706                               uint8_t ExtTRGFilter)
4568                     ; 1707 {
4569                     .text:	section	.text,new
4570  0000               _TIM3_ETRClockMode1Config:
4572  0000 89            	pushw	x
4573       00000000      OFST:	set	0
4576                     ; 1709   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4578  0001 7b05          	ld	a,(OFST+5,sp)
4579  0003 88            	push	a
4580  0004 7b02          	ld	a,(OFST+2,sp)
4581  0006 95            	ld	xh,a
4582  0007 cd0000        	call	_TIM3_ETRConfig
4584  000a 84            	pop	a
4585                     ; 1712   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4587  000b c65282        	ld	a,21122
4588  000e a4f8          	and	a,#248
4589  0010 c75282        	ld	21122,a
4590                     ; 1713   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4592  0013 c65282        	ld	a,21122
4593  0016 aa07          	or	a,#7
4594  0018 c75282        	ld	21122,a
4595                     ; 1716   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4597  001b c65282        	ld	a,21122
4598  001e a48f          	and	a,#143
4599  0020 c75282        	ld	21122,a
4600                     ; 1717   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
4602  0023 c65282        	ld	a,21122
4603  0026 aa70          	or	a,#112
4604  0028 c75282        	ld	21122,a
4605                     ; 1718 }
4608  002b 85            	popw	x
4609  002c 81            	ret	
4667                     ; 1736 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4667                     ; 1737                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4667                     ; 1738                               uint8_t ExtTRGFilter)
4667                     ; 1739 {
4668                     .text:	section	.text,new
4669  0000               _TIM3_ETRClockMode2Config:
4671  0000 89            	pushw	x
4672       00000000      OFST:	set	0
4675                     ; 1741   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4677  0001 7b05          	ld	a,(OFST+5,sp)
4678  0003 88            	push	a
4679  0004 7b02          	ld	a,(OFST+2,sp)
4680  0006 95            	ld	xh,a
4681  0007 cd0000        	call	_TIM3_ETRConfig
4683  000a 721c5283      	bset	21123,#6
4684  000e 84            	pop	a
4685                     ; 1744   TIM3->ETR |= TIM_ETR_ECE ;
4687                     ; 1745 }
4690  000f 85            	popw	x
4691  0010 81            	ret	
4807                     ; 1796 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
4807                     ; 1797 {
4808                     .text:	section	.text,new
4809  0000               _TIM3_SelectInputTrigger:
4811  0000 88            	push	a
4812  0001 88            	push	a
4813       00000001      OFST:	set	1
4816                     ; 1798   uint8_t tmpsmcr = 0;
4818                     ; 1801   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
4820                     ; 1803   tmpsmcr = TIM3->SMCR;
4822  0002 c65282        	ld	a,21122
4823                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4825  0005 a48f          	and	a,#143
4826                     ; 1807   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
4828  0007 1a02          	or	a,(OFST+1,sp)
4829                     ; 1809   TIM3->SMCR = (uint8_t)tmpsmcr;
4831  0009 c75282        	ld	21122,a
4832                     ; 1810 }
4835  000c 85            	popw	x
4836  000d 81            	ret	
4935                     ; 1824 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
4935                     ; 1825 {
4936                     .text:	section	.text,new
4937  0000               _TIM3_SelectOutputTrigger:
4939  0000 88            	push	a
4940  0001 88            	push	a
4941       00000001      OFST:	set	1
4944                     ; 1826   uint8_t tmpcr2 = 0;
4946                     ; 1829   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
4948                     ; 1831   tmpcr2 = TIM3->CR2;
4950  0002 c65281        	ld	a,21121
4951                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4953  0005 a48f          	and	a,#143
4954                     ; 1837   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
4956  0007 1a02          	or	a,(OFST+1,sp)
4957                     ; 1839   TIM3->CR2 = tmpcr2;
4959  0009 c75281        	ld	21121,a
4960                     ; 1840 }
4963  000c 85            	popw	x
4964  000d 81            	ret	
5047                     ; 1852 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
5047                     ; 1853 {
5048                     .text:	section	.text,new
5049  0000               _TIM3_SelectSlaveMode:
5051  0000 88            	push	a
5052  0001 88            	push	a
5053       00000001      OFST:	set	1
5056                     ; 1854   uint8_t tmpsmcr = 0;
5058                     ; 1857   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
5060                     ; 1859   tmpsmcr = TIM3->SMCR;
5062  0002 c65282        	ld	a,21122
5063                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5065  0005 a4f8          	and	a,#248
5066                     ; 1865   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
5068  0007 1a02          	or	a,(OFST+1,sp)
5069                     ; 1867   TIM3->SMCR = tmpsmcr;
5071  0009 c75282        	ld	21122,a
5072                     ; 1868 }
5075  000c 85            	popw	x
5076  000d 81            	ret	
5112                     ; 1876 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
5112                     ; 1877 {
5113                     .text:	section	.text,new
5114  0000               _TIM3_SelectMasterSlaveMode:
5118                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
5120                     ; 1882   if (NewState != DISABLE)
5122  0000 4d            	tnz	a
5123  0001 2705          	jreq	L7752
5124                     ; 1884     TIM3->SMCR |= TIM_SMCR_MSM;
5126  0003 721e5282      	bset	21122,#7
5129  0007 81            	ret	
5130  0008               L7752:
5131                     ; 1888     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5133  0008 721f5282      	bres	21122,#7
5134                     ; 1890 }
5137  000c 81            	ret	
5193                     ; 1908 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
5193                     ; 1909                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
5193                     ; 1910                     uint8_t ExtTRGFilter)
5193                     ; 1911 {
5194                     .text:	section	.text,new
5195  0000               _TIM3_ETRConfig:
5197  0000 89            	pushw	x
5198       00000000      OFST:	set	0
5201                     ; 1913   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
5203                     ; 1914   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
5205                     ; 1915   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
5207                     ; 1918   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
5207                     ; 1919                          | (uint8_t)ExtTRGFilter);
5209  0001 9f            	ld	a,xl
5210  0002 1a01          	or	a,(OFST+1,sp)
5211  0004 1a05          	or	a,(OFST+5,sp)
5212  0006 ca5283        	or	a,21123
5213  0009 c75283        	ld	21123,a
5214                     ; 1920 }
5217  000c 85            	popw	x
5218  000d 81            	ret	
5331                     ; 1955 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
5331                     ; 1956                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
5331                     ; 1957                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
5331                     ; 1958 {
5332                     .text:	section	.text,new
5333  0000               _TIM3_EncoderInterfaceConfig:
5335  0000 89            	pushw	x
5336  0001 5203          	subw	sp,#3
5337       00000003      OFST:	set	3
5340                     ; 1959   uint8_t tmpsmcr = 0;
5342                     ; 1960   uint8_t tmpccmr1 = 0;
5344                     ; 1961   uint8_t tmpccmr2 = 0;
5346                     ; 1964   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
5348                     ; 1965   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
5350                     ; 1966   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
5352                     ; 1968   tmpsmcr = TIM3->SMCR;
5354  0003 c65282        	ld	a,21122
5355  0006 6b01          	ld	(OFST-2,sp),a
5356                     ; 1969   tmpccmr1 = TIM3->CCMR1;
5358  0008 c65289        	ld	a,21129
5359  000b 6b02          	ld	(OFST-1,sp),a
5360                     ; 1970   tmpccmr2 = TIM3->CCMR2;
5362  000d c6528a        	ld	a,21130
5363  0010 6b03          	ld	(OFST+0,sp),a
5364                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5366  0012 7b01          	ld	a,(OFST-2,sp)
5367  0014 a4f0          	and	a,#240
5368  0016 6b01          	ld	(OFST-2,sp),a
5369                     ; 1974   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
5371  0018 9e            	ld	a,xh
5372  0019 1a01          	or	a,(OFST-2,sp)
5373  001b 6b01          	ld	(OFST-2,sp),a
5374                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5376  001d 7b02          	ld	a,(OFST-1,sp)
5377  001f a4fc          	and	a,#252
5378  0021 6b02          	ld	(OFST-1,sp),a
5379                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5381  0023 7b03          	ld	a,(OFST+0,sp)
5382  0025 a4fc          	and	a,#252
5383  0027 6b03          	ld	(OFST+0,sp),a
5384                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5386  0029 7b02          	ld	a,(OFST-1,sp)
5387  002b aa01          	or	a,#1
5388  002d 6b02          	ld	(OFST-1,sp),a
5389                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5391  002f 7b03          	ld	a,(OFST+0,sp)
5392  0031 aa01          	or	a,#1
5393  0033 6b03          	ld	(OFST+0,sp),a
5394                     ; 1983   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
5396  0035 9f            	ld	a,xl
5397  0036 4a            	dec	a
5398  0037 2606          	jrne	L5072
5399                     ; 1985     TIM3->CCER1 |= TIM_CCER1_CC1P ;
5401  0039 7212528b      	bset	21131,#1
5403  003d 2004          	jra	L7072
5404  003f               L5072:
5405                     ; 1989     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5407  003f 7213528b      	bres	21131,#1
5408  0043               L7072:
5409                     ; 1992   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
5411  0043 7b08          	ld	a,(OFST+5,sp)
5412  0045 4a            	dec	a
5413  0046 2606          	jrne	L1172
5414                     ; 1994     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5416  0048 721a528b      	bset	21131,#5
5418  004c 2004          	jra	L3172
5419  004e               L1172:
5420                     ; 1998     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5422  004e 721b528b      	bres	21131,#5
5423  0052               L3172:
5424                     ; 2001   TIM3->SMCR = tmpsmcr;
5426  0052 7b01          	ld	a,(OFST-2,sp)
5427  0054 c75282        	ld	21122,a
5428                     ; 2002   TIM3->CCMR1 = tmpccmr1;
5430  0057 7b02          	ld	a,(OFST-1,sp)
5431  0059 c75289        	ld	21129,a
5432                     ; 2003   TIM3->CCMR2 = tmpccmr2;
5434  005c 7b03          	ld	a,(OFST+0,sp)
5435  005e c7528a        	ld	21130,a
5436                     ; 2004 }
5439  0061 5b05          	addw	sp,#5
5440  0063 81            	ret	
5476                     ; 2012 void TIM3_SelectHallSensor(FunctionalState NewState)
5476                     ; 2013 {
5477                     .text:	section	.text,new
5478  0000               _TIM3_SelectHallSensor:
5482                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5484                     ; 2018   if (NewState != DISABLE)
5486  0000 4d            	tnz	a
5487  0001 2705          	jreq	L3372
5488                     ; 2020     TIM3->CR2 |= TIM_CR2_TI1S;
5490  0003 721e5281      	bset	21121,#7
5493  0007 81            	ret	
5494  0008               L3372:
5495                     ; 2024     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5497  0008 721f5281      	bres	21121,#7
5498                     ; 2026 }
5501  000c 81            	ret	
5573                     ; 2047 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
5573                     ; 2048                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
5573                     ; 2049                        uint8_t TIM3_ICFilter)
5573                     ; 2050 {
5574                     .text:	section	.text,new
5575  0000               L3_TI1_Config:
5577  0000 89            	pushw	x
5578  0001 89            	pushw	x
5579       00000002      OFST:	set	2
5582                     ; 2051   uint8_t tmpccmr1 = 0;
5584                     ; 2052   uint8_t tmpicpolarity = TIM3_ICPolarity;
5586  0002 9e            	ld	a,xh
5587  0003 6b01          	ld	(OFST-1,sp),a
5588                     ; 2053   tmpccmr1 = TIM3->CCMR1;
5590  0005 c65289        	ld	a,21129
5591  0008 6b02          	ld	(OFST+0,sp),a
5592                     ; 2056   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5594                     ; 2057   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5596                     ; 2058   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5598                     ; 2061   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5600  000a 7211528b      	bres	21131,#0
5601                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5603  000e a40c          	and	a,#12
5604  0010 6b02          	ld	(OFST+0,sp),a
5605                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5607  0012 7b07          	ld	a,(OFST+5,sp)
5608  0014 97            	ld	xl,a
5609  0015 a610          	ld	a,#16
5610  0017 42            	mul	x,a
5611  0018 9f            	ld	a,xl
5612  0019 1a04          	or	a,(OFST+2,sp)
5613  001b 1a02          	or	a,(OFST+0,sp)
5614  001d 6b02          	ld	(OFST+0,sp),a
5615                     ; 2067   TIM3->CCMR1 = tmpccmr1;
5617  001f c75289        	ld	21129,a
5618                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5620  0022 7b01          	ld	a,(OFST-1,sp)
5621  0024 4a            	dec	a
5622  0025 2606          	jrne	L5772
5623                     ; 2072     TIM3->CCER1 |= TIM_CCER1_CC1P;
5625  0027 7212528b      	bset	21131,#1
5627  002b 2004          	jra	L7772
5628  002d               L5772:
5629                     ; 2076     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5631  002d 7213528b      	bres	21131,#1
5632  0031               L7772:
5633                     ; 2080   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5635  0031 7210528b      	bset	21131,#0
5636                     ; 2081 }
5639  0035 5b04          	addw	sp,#4
5640  0037 81            	ret	
5712                     ; 2098 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5712                     ; 2099                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5712                     ; 2100                        uint8_t TIM3_ICFilter)
5712                     ; 2101 {
5713                     .text:	section	.text,new
5714  0000               L5_TI2_Config:
5716  0000 89            	pushw	x
5717  0001 89            	pushw	x
5718       00000002      OFST:	set	2
5721                     ; 2102   uint8_t tmpccmr2 = 0;
5723                     ; 2103   uint8_t tmpicpolarity = TIM3_ICPolarity;
5725  0002 9e            	ld	a,xh
5726  0003 6b01          	ld	(OFST-1,sp),a
5727                     ; 2106   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5729                     ; 2107   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5731                     ; 2108   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5733                     ; 2110   tmpccmr2 = TIM3->CCMR2;
5735  0005 c6528a        	ld	a,21130
5736  0008 6b02          	ld	(OFST+0,sp),a
5737                     ; 2113   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5739  000a 7219528b      	bres	21131,#4
5740                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5742  000e a40c          	and	a,#12
5743  0010 6b02          	ld	(OFST+0,sp),a
5744                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5746  0012 7b07          	ld	a,(OFST+5,sp)
5747  0014 97            	ld	xl,a
5748  0015 a610          	ld	a,#16
5749  0017 42            	mul	x,a
5750  0018 9f            	ld	a,xl
5751  0019 1a04          	or	a,(OFST+2,sp)
5752  001b 1a02          	or	a,(OFST+0,sp)
5753  001d 6b02          	ld	(OFST+0,sp),a
5754                     ; 2119   TIM3->CCMR2 = tmpccmr2;
5756  001f c7528a        	ld	21130,a
5757                     ; 2122   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5759  0022 7b01          	ld	a,(OFST-1,sp)
5760  0024 4a            	dec	a
5761  0025 2606          	jrne	L7303
5762                     ; 2124     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5764  0027 721a528b      	bset	21131,#5
5766  002b 2004          	jra	L1403
5767  002d               L7303:
5768                     ; 2128     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5770  002d 721b528b      	bres	21131,#5
5771  0031               L1403:
5772                     ; 2132   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5774  0031 7218528b      	bset	21131,#4
5775                     ; 2133 }
5778  0035 5b04          	addw	sp,#4
5779  0037 81            	ret	
5792                     	xdef	_TIM3_SelectHallSensor
5793                     	xdef	_TIM3_EncoderInterfaceConfig
5794                     	xdef	_TIM3_ETRConfig
5795                     	xdef	_TIM3_SelectMasterSlaveMode
5796                     	xdef	_TIM3_SelectSlaveMode
5797                     	xdef	_TIM3_SelectOutputTrigger
5798                     	xdef	_TIM3_SelectInputTrigger
5799                     	xdef	_TIM3_ETRClockMode2Config
5800                     	xdef	_TIM3_ETRClockMode1Config
5801                     	xdef	_TIM3_TIxExternalClockConfig
5802                     	xdef	_TIM3_InternalClockConfig
5803                     	xdef	_TIM3_SelectCCDMA
5804                     	xdef	_TIM3_DMACmd
5805                     	xdef	_TIM3_ClearITPendingBit
5806                     	xdef	_TIM3_GetITStatus
5807                     	xdef	_TIM3_ClearFlag
5808                     	xdef	_TIM3_GetFlagStatus
5809                     	xdef	_TIM3_GenerateEvent
5810                     	xdef	_TIM3_ITConfig
5811                     	xdef	_TIM3_SetIC2Prescaler
5812                     	xdef	_TIM3_SetIC1Prescaler
5813                     	xdef	_TIM3_GetCapture2
5814                     	xdef	_TIM3_GetCapture1
5815                     	xdef	_TIM3_PWMIConfig
5816                     	xdef	_TIM3_ICInit
5817                     	xdef	_TIM3_CCxCmd
5818                     	xdef	_TIM3_OC2PolarityConfig
5819                     	xdef	_TIM3_OC1PolarityConfig
5820                     	xdef	_TIM3_OC2FastConfig
5821                     	xdef	_TIM3_OC1FastConfig
5822                     	xdef	_TIM3_OC2PreloadConfig
5823                     	xdef	_TIM3_OC1PreloadConfig
5824                     	xdef	_TIM3_ForcedOC2Config
5825                     	xdef	_TIM3_ForcedOC1Config
5826                     	xdef	_TIM3_SetCompare2
5827                     	xdef	_TIM3_SetCompare1
5828                     	xdef	_TIM3_SelectOCxM
5829                     	xdef	_TIM3_CtrlPWMOutputs
5830                     	xdef	_TIM3_BKRConfig
5831                     	xdef	_TIM3_OC2Init
5832                     	xdef	_TIM3_OC1Init
5833                     	xdef	_TIM3_Cmd
5834                     	xdef	_TIM3_SelectOnePulseMode
5835                     	xdef	_TIM3_ARRPreloadConfig
5836                     	xdef	_TIM3_UpdateRequestConfig
5837                     	xdef	_TIM3_UpdateDisableConfig
5838                     	xdef	_TIM3_GetPrescaler
5839                     	xdef	_TIM3_GetCounter
5840                     	xdef	_TIM3_SetAutoreload
5841                     	xdef	_TIM3_SetCounter
5842                     	xdef	_TIM3_CounterModeConfig
5843                     	xdef	_TIM3_PrescalerConfig
5844                     	xdef	_TIM3_TimeBaseInit
5845                     	xdef	_TIM3_DeInit
5864                     	end
