   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  50                     ; 165 void TIM5_DeInit(void)
  50                     ; 166 {
  52                     .text:	section	.text,new
  53  0000               _TIM5_DeInit:
  57                     ; 167   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  59  0000 725f5300      	clr	21248
  60                     ; 168   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  62  0004 725f5301      	clr	21249
  63                     ; 169   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  65  0008 725f5302      	clr	21250
  66                     ; 170   TIM5->ETR = TIM_ETR_RESET_VALUE;
  68  000c 725f5303      	clr	21251
  69                     ; 171   TIM5->IER = TIM_IER_RESET_VALUE;
  71  0010 725f5305      	clr	21253
  72                     ; 172   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  74  0014 725f5307      	clr	21255
  75                     ; 175   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  77  0018 725f530b      	clr	21259
  78                     ; 177   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  80  001c 35015309      	mov	21257,#1
  81                     ; 178   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  83  0020 3501530a      	mov	21258,#1
  84                     ; 181   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  86  0024 725f530b      	clr	21259
  87                     ; 182   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  89  0028 725f5309      	clr	21257
  90                     ; 183   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  92  002c 725f530a      	clr	21258
  93                     ; 185   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  95  0030 725f530c      	clr	21260
  96                     ; 186   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  98  0034 725f530d      	clr	21261
  99                     ; 188   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
 101  0038 725f530e      	clr	21262
 102                     ; 190   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
 104  003c 35ff530f      	mov	21263,#255
 105                     ; 191   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 107  0040 35ff5310      	mov	21264,#255
 108                     ; 193   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 110  0044 725f5311      	clr	21265
 111                     ; 194   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 113  0048 725f5312      	clr	21266
 114                     ; 195   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 116  004c 725f5313      	clr	21267
 117                     ; 196   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 119  0050 725f5314      	clr	21268
 120                     ; 199   TIM5->OISR = TIM_OISR_RESET_VALUE;
 122  0054 725f5316      	clr	21270
 123                     ; 200   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 125  0058 35015308      	mov	21256,#1
 126                     ; 201   TIM5->BKR = TIM_BKR_RESET_VALUE;
 128  005c 725f5315      	clr	21269
 129                     ; 202   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 131  0060 725f5306      	clr	21254
 132                     ; 203 }
 135  0064 81            	ret	
 297                     ; 228 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 297                     ; 229                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 297                     ; 230                        uint16_t TIM5_Period)
 297                     ; 231 {
 298                     .text:	section	.text,new
 299  0000               _TIM5_TimeBaseInit:
 301  0000 89            	pushw	x
 302       00000000      OFST:	set	0
 305                     ; 233   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 307                     ; 234   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 309                     ; 239   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 311  0001 7b05          	ld	a,(OFST+5,sp)
 312  0003 c7530f        	ld	21263,a
 313                     ; 240   TIM5->ARRL = (uint8_t)(TIM5_Period);
 315  0006 7b06          	ld	a,(OFST+6,sp)
 316  0008 c75310        	ld	21264,a
 317                     ; 243   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 319  000b 9e            	ld	a,xh
 320  000c c7530e        	ld	21262,a
 321                     ; 246   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 323  000f c65300        	ld	a,21248
 324  0012 a48f          	and	a,#143
 325  0014 c75300        	ld	21248,a
 326                     ; 247   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 328  0017 9f            	ld	a,xl
 329  0018 ca5300        	or	a,21248
 330  001b c75300        	ld	21248,a
 331                     ; 250   TIM5->EGR = TIM5_EventSource_Update;
 333  001e 35015308      	mov	21256,#1
 334                     ; 251 }
 337  0022 85            	popw	x
 338  0023 81            	ret	
 406                     ; 271 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 406                     ; 272                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 406                     ; 273 {
 407                     .text:	section	.text,new
 408  0000               _TIM5_PrescalerConfig:
 412                     ; 275   assert_param(IS_TIM5_PRESCALER(Prescaler));
 414                     ; 276   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 416                     ; 279   TIM5->PSCR = (uint8_t)(Prescaler);
 418  0000 9e            	ld	a,xh
 419  0001 c7530e        	ld	21262,a
 420                     ; 282   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 422  0004 9f            	ld	a,xl
 423  0005 4a            	dec	a
 424  0006 2605          	jrne	L741
 425                     ; 284     TIM5->EGR |= TIM_EGR_UG ;
 427  0008 72105308      	bset	21256,#0
 430  000c 81            	ret	
 431  000d               L741:
 432                     ; 288     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 434  000d 72115308      	bres	21256,#0
 435                     ; 290 }
 438  0011 81            	ret	
 483                     ; 303 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 483                     ; 304 {
 484                     .text:	section	.text,new
 485  0000               _TIM5_CounterModeConfig:
 487  0000 88            	push	a
 488  0001 88            	push	a
 489       00000001      OFST:	set	1
 492                     ; 305   uint8_t tmpcr1 = 0;
 494                     ; 308   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 496                     ; 310   tmpcr1 = TIM5->CR1;
 498  0002 c65300        	ld	a,21248
 499                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 501  0005 a48f          	and	a,#143
 502                     ; 316   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 504  0007 1a02          	or	a,(OFST+1,sp)
 505                     ; 318   TIM5->CR1 = tmpcr1;
 507  0009 c75300        	ld	21248,a
 508                     ; 319 }
 511  000c 85            	popw	x
 512  000d 81            	ret	
 546                     ; 327 void TIM5_SetCounter(uint16_t Counter)
 546                     ; 328 {
 547                     .text:	section	.text,new
 548  0000               _TIM5_SetCounter:
 552                     ; 331   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 554  0000 9e            	ld	a,xh
 555  0001 c7530c        	ld	21260,a
 556                     ; 332   TIM5->CNTRL = (uint8_t)(Counter);
 558  0004 9f            	ld	a,xl
 559  0005 c7530d        	ld	21261,a
 560                     ; 333 }
 563  0008 81            	ret	
 597                     ; 341 void TIM5_SetAutoreload(uint16_t Autoreload)
 597                     ; 342 {
 598                     .text:	section	.text,new
 599  0000               _TIM5_SetAutoreload:
 603                     ; 344   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 605  0000 9e            	ld	a,xh
 606  0001 c7530f        	ld	21263,a
 607                     ; 345   TIM5->ARRL = (uint8_t)(Autoreload);
 609  0004 9f            	ld	a,xl
 610  0005 c75310        	ld	21264,a
 611                     ; 346 }
 614  0008 81            	ret	
 666                     ; 353 uint16_t TIM5_GetCounter(void)
 666                     ; 354 {
 667                     .text:	section	.text,new
 668  0000               _TIM5_GetCounter:
 670  0000 5204          	subw	sp,#4
 671       00000004      OFST:	set	4
 674                     ; 355   uint16_t tmpcnt = 0;
 676                     ; 358   tmpcntrh = TIM5->CNTRH;
 678  0002 c6530c        	ld	a,21260
 679  0005 6b02          	ld	(OFST-2,sp),a
 680                     ; 359   tmpcntrl = TIM5->CNTRL;
 682  0007 c6530d        	ld	a,21261
 683  000a 6b01          	ld	(OFST-3,sp),a
 684                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 686  000c 5f            	clrw	x
 687  000d 97            	ld	xl,a
 688  000e 1f03          	ldw	(OFST-1,sp),x
 689                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 691  0010 5f            	clrw	x
 692  0011 7b02          	ld	a,(OFST-2,sp)
 693  0013 97            	ld	xl,a
 694  0014 7b04          	ld	a,(OFST+0,sp)
 695  0016 01            	rrwa	x,a
 696  0017 1a03          	or	a,(OFST-1,sp)
 697  0019 01            	rrwa	x,a
 698                     ; 364   return ((uint16_t)tmpcnt);
 702  001a 5b04          	addw	sp,#4
 703  001c 81            	ret	
 727                     ; 380 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 727                     ; 381 {
 728                     .text:	section	.text,new
 729  0000               _TIM5_GetPrescaler:
 733                     ; 383   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 735  0000 c6530e        	ld	a,21262
 738  0003 81            	ret	
 794                     ; 393 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 794                     ; 394 {
 795                     .text:	section	.text,new
 796  0000               _TIM5_UpdateDisableConfig:
 800                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 802                     ; 399   if (NewState != DISABLE)
 804  0000 4d            	tnz	a
 805  0001 2705          	jreq	L513
 806                     ; 401     TIM5->CR1 |= TIM_CR1_UDIS;
 808  0003 72125300      	bset	21248,#1
 811  0007 81            	ret	
 812  0008               L513:
 813                     ; 405     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 815  0008 72135300      	bres	21248,#1
 816                     ; 407 }
 819  000c 81            	ret	
 877                     ; 417 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 877                     ; 418 {
 878                     .text:	section	.text,new
 879  0000               _TIM5_UpdateRequestConfig:
 883                     ; 420   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 885                     ; 423   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 887  0000 4a            	dec	a
 888  0001 2605          	jrne	L743
 889                     ; 425     TIM5->CR1 |= TIM_CR1_URS ;
 891  0003 72145300      	bset	21248,#2
 894  0007 81            	ret	
 895  0008               L743:
 896                     ; 429     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 898  0008 72155300      	bres	21248,#2
 899                     ; 431 }
 902  000c 81            	ret	
 938                     ; 439 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 938                     ; 440 {
 939                     .text:	section	.text,new
 940  0000               _TIM5_ARRPreloadConfig:
 944                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 946                     ; 445   if (NewState != DISABLE)
 948  0000 4d            	tnz	a
 949  0001 2705          	jreq	L173
 950                     ; 447     TIM5->CR1 |= TIM_CR1_ARPE;
 952  0003 721e5300      	bset	21248,#7
 955  0007 81            	ret	
 956  0008               L173:
 957                     ; 451     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 959  0008 721f5300      	bres	21248,#7
 960                     ; 453 }
 963  000c 81            	ret	
1020                     ; 463 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1020                     ; 464 {
1021                     .text:	section	.text,new
1022  0000               _TIM5_SelectOnePulseMode:
1026                     ; 466   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1028                     ; 469   if (TIM5_OPMode == TIM5_OPMode_Single)
1030  0000 4a            	dec	a
1031  0001 2605          	jrne	L324
1032                     ; 471     TIM5->CR1 |= TIM_CR1_OPM ;
1034  0003 72165300      	bset	21248,#3
1037  0007 81            	ret	
1038  0008               L324:
1039                     ; 475     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1041  0008 72175300      	bres	21248,#3
1042                     ; 477 }
1045  000c 81            	ret	
1080                     ; 485 void TIM5_Cmd(FunctionalState NewState)
1080                     ; 486 {
1081                     .text:	section	.text,new
1082  0000               _TIM5_Cmd:
1086                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1088                     ; 491   if (NewState != DISABLE)
1090  0000 4d            	tnz	a
1091  0001 2705          	jreq	L544
1092                     ; 493     TIM5->CR1 |= TIM_CR1_CEN;
1094  0003 72105300      	bset	21248,#0
1097  0007 81            	ret	
1098  0008               L544:
1099                     ; 497     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1101  0008 72115300      	bres	21248,#0
1102                     ; 499 }
1105  000c 81            	ret	
1303                     ; 575 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1303                     ; 576                   TIM5_OutputState_TypeDef TIM5_OutputState,
1303                     ; 577                   uint16_t TIM5_Pulse,
1303                     ; 578                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1303                     ; 579                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1303                     ; 580 {
1304                     .text:	section	.text,new
1305  0000               _TIM5_OC1Init:
1307  0000 89            	pushw	x
1308  0001 88            	push	a
1309       00000001      OFST:	set	1
1312                     ; 581   uint8_t tmpccmr1 = 0;
1314                     ; 584   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1316                     ; 585   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1318                     ; 586   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1320                     ; 587   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1322                     ; 589   tmpccmr1 = TIM5->CCMR1;
1324  0002 c65309        	ld	a,21257
1325  0005 6b01          	ld	(OFST+0,sp),a
1326                     ; 592   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1328                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1330  0007 a48f          	and	a,#143
1331  0009 7211530b      	bres	21259,#0
1332  000d 6b01          	ld	(OFST+0,sp),a
1333                     ; 597   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1335  000f 9e            	ld	a,xh
1336  0010 1a01          	or	a,(OFST+0,sp)
1337  0012 6b01          	ld	(OFST+0,sp),a
1338                     ; 599   TIM5->CCMR1 = tmpccmr1;
1340  0014 c75309        	ld	21257,a
1341                     ; 602   if (TIM5_OutputState == TIM5_OutputState_Enable)
1343  0017 9f            	ld	a,xl
1344  0018 4a            	dec	a
1345  0019 2606          	jrne	L365
1346                     ; 604     TIM5->CCER1 |= TIM_CCER1_CC1E;
1348  001b 7210530b      	bset	21259,#0
1350  001f 2004          	jra	L565
1351  0021               L365:
1352                     ; 608     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1354  0021 7211530b      	bres	21259,#0
1355  0025               L565:
1356                     ; 612   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1358  0025 7b08          	ld	a,(OFST+7,sp)
1359  0027 4a            	dec	a
1360  0028 2606          	jrne	L765
1361                     ; 614     TIM5->CCER1 |= TIM_CCER1_CC1P;
1363  002a 7212530b      	bset	21259,#1
1365  002e 2004          	jra	L175
1366  0030               L765:
1367                     ; 618     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1369  0030 7213530b      	bres	21259,#1
1370  0034               L175:
1371                     ; 622   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1373  0034 7b09          	ld	a,(OFST+8,sp)
1374  0036 4a            	dec	a
1375  0037 2606          	jrne	L375
1376                     ; 624     TIM5->OISR |= TIM_OISR_OIS1;
1378  0039 72105316      	bset	21270,#0
1380  003d 2004          	jra	L575
1381  003f               L375:
1382                     ; 628     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1384  003f 72115316      	bres	21270,#0
1385  0043               L575:
1386                     ; 632   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1388  0043 7b06          	ld	a,(OFST+5,sp)
1389  0045 c75311        	ld	21265,a
1390                     ; 633   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1392  0048 7b07          	ld	a,(OFST+6,sp)
1393  004a c75312        	ld	21266,a
1394                     ; 634 }
1397  004d 5b03          	addw	sp,#3
1398  004f 81            	ret	
1481                     ; 661 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1481                     ; 662                   TIM5_OutputState_TypeDef TIM5_OutputState,
1481                     ; 663                   uint16_t TIM5_Pulse,
1481                     ; 664                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1481                     ; 665                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1481                     ; 666 {
1482                     .text:	section	.text,new
1483  0000               _TIM5_OC2Init:
1485  0000 89            	pushw	x
1486  0001 88            	push	a
1487       00000001      OFST:	set	1
1490                     ; 667   uint8_t tmpccmr2 = 0;
1492                     ; 670   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1494                     ; 671   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1496                     ; 672   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1498                     ; 673   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1500                     ; 675   tmpccmr2 = TIM5->CCMR2;
1502  0002 c6530a        	ld	a,21258
1503  0005 6b01          	ld	(OFST+0,sp),a
1504                     ; 678   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1506                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1508  0007 a48f          	and	a,#143
1509  0009 7219530b      	bres	21259,#4
1510  000d 6b01          	ld	(OFST+0,sp),a
1511                     ; 684   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1513  000f 9e            	ld	a,xh
1514  0010 1a01          	or	a,(OFST+0,sp)
1515  0012 6b01          	ld	(OFST+0,sp),a
1516                     ; 686   TIM5->CCMR2 = tmpccmr2;
1518  0014 c7530a        	ld	21258,a
1519                     ; 689   if (TIM5_OutputState == TIM5_OutputState_Enable)
1521  0017 9f            	ld	a,xl
1522  0018 4a            	dec	a
1523  0019 2606          	jrne	L146
1524                     ; 691     TIM5->CCER1 |= TIM_CCER1_CC2E;
1526  001b 7218530b      	bset	21259,#4
1528  001f 2004          	jra	L346
1529  0021               L146:
1530                     ; 695     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1532  0021 7219530b      	bres	21259,#4
1533  0025               L346:
1534                     ; 699   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1536  0025 7b08          	ld	a,(OFST+7,sp)
1537  0027 4a            	dec	a
1538  0028 2606          	jrne	L546
1539                     ; 701     TIM5->CCER1 |= TIM_CCER1_CC2P;
1541  002a 721a530b      	bset	21259,#5
1543  002e 2004          	jra	L746
1544  0030               L546:
1545                     ; 705     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1547  0030 721b530b      	bres	21259,#5
1548  0034               L746:
1549                     ; 710   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1551  0034 7b09          	ld	a,(OFST+8,sp)
1552  0036 4a            	dec	a
1553  0037 2606          	jrne	L156
1554                     ; 712     TIM5->OISR |= TIM_OISR_OIS2;
1556  0039 72145316      	bset	21270,#2
1558  003d 2004          	jra	L356
1559  003f               L156:
1560                     ; 716     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1562  003f 72155316      	bres	21270,#2
1563  0043               L356:
1564                     ; 720   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1566  0043 7b06          	ld	a,(OFST+5,sp)
1567  0045 c75313        	ld	21267,a
1568                     ; 721   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1570  0048 7b07          	ld	a,(OFST+6,sp)
1571  004a c75314        	ld	21268,a
1572                     ; 722 }
1575  004d 5b03          	addw	sp,#3
1576  004f 81            	ret	
1774                     ; 751 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1774                     ; 752                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1774                     ; 753                     TIM5_BreakState_TypeDef TIM5_BreakState,
1774                     ; 754                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1774                     ; 755                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1774                     ; 756 
1774                     ; 757 {
1775                     .text:	section	.text,new
1776  0000               _TIM5_BKRConfig:
1778  0000 89            	pushw	x
1779  0001 88            	push	a
1780       00000001      OFST:	set	1
1783                     ; 759   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1785                     ; 760   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1787                     ; 761   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1789                     ; 762   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1791                     ; 763   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1793                     ; 769   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1793                     ; 770                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1793                     ; 771                                   TIM5_AutomaticOutput));
1795  0002 7b06          	ld	a,(OFST+5,sp)
1796  0004 1a07          	or	a,(OFST+6,sp)
1797  0006 6b01          	ld	(OFST+0,sp),a
1798  0008 9f            	ld	a,xl
1799  0009 1a02          	or	a,(OFST+1,sp)
1800  000b 1a01          	or	a,(OFST+0,sp)
1801  000d 1a08          	or	a,(OFST+7,sp)
1802  000f c75315        	ld	21269,a
1803                     ; 772 }
1806  0012 5b03          	addw	sp,#3
1807  0014 81            	ret	
1843                     ; 780 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1843                     ; 781 {
1844                     .text:	section	.text,new
1845  0000               _TIM5_CtrlPWMOutputs:
1849                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1851                     ; 787   if (NewState != DISABLE)
1853  0000 4d            	tnz	a
1854  0001 2705          	jreq	L5001
1855                     ; 789     TIM5->BKR |= TIM_BKR_MOE ;
1857  0003 721e5315      	bset	21269,#7
1860  0007 81            	ret	
1861  0008               L5001:
1862                     ; 793     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1864  0008 721f5315      	bres	21269,#7
1865                     ; 795 }
1868  000c 81            	ret	
1933                     ; 815 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1933                     ; 816                      TIM5_OCMode_TypeDef TIM5_OCMode)
1933                     ; 817 {
1934                     .text:	section	.text,new
1935  0000               _TIM5_SelectOCxM:
1937  0000 89            	pushw	x
1938       00000000      OFST:	set	0
1941                     ; 819   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1943                     ; 820   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1945                     ; 822   if (TIM5_Channel == TIM5_Channel_1)
1947  0001 9e            	ld	a,xh
1948  0002 4d            	tnz	a
1949  0003 2615          	jrne	L3401
1950                     ; 825     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1952  0005 7211530b      	bres	21259,#0
1953                     ; 828     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1955  0009 c65309        	ld	a,21257
1956  000c a48f          	and	a,#143
1957  000e c75309        	ld	21257,a
1958                     ; 831     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1960  0011 9f            	ld	a,xl
1961  0012 ca5309        	or	a,21257
1962  0015 c75309        	ld	21257,a
1964  0018 2014          	jra	L5401
1965  001a               L3401:
1966                     ; 836     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1968  001a 7219530b      	bres	21259,#4
1969                     ; 839     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1971  001e c6530a        	ld	a,21258
1972  0021 a48f          	and	a,#143
1973  0023 c7530a        	ld	21258,a
1974                     ; 842     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1976  0026 c6530a        	ld	a,21258
1977  0029 1a02          	or	a,(OFST+2,sp)
1978  002b c7530a        	ld	21258,a
1979  002e               L5401:
1980                     ; 844 }
1983  002e 85            	popw	x
1984  002f 81            	ret	
2018                     ; 852 void TIM5_SetCompare1(uint16_t Compare)
2018                     ; 853 {
2019                     .text:	section	.text,new
2020  0000               _TIM5_SetCompare1:
2024                     ; 855   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2026  0000 9e            	ld	a,xh
2027  0001 c75311        	ld	21265,a
2028                     ; 856   TIM5->CCR1L = (uint8_t)(Compare);
2030  0004 9f            	ld	a,xl
2031  0005 c75312        	ld	21266,a
2032                     ; 857 }
2035  0008 81            	ret	
2069                     ; 865 void TIM5_SetCompare2(uint16_t Compare)
2069                     ; 866 {
2070                     .text:	section	.text,new
2071  0000               _TIM5_SetCompare2:
2075                     ; 868   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2077  0000 9e            	ld	a,xh
2078  0001 c75313        	ld	21267,a
2079                     ; 869   TIM5->CCR2L = (uint8_t)(Compare);
2081  0004 9f            	ld	a,xl
2082  0005 c75314        	ld	21268,a
2083                     ; 870 }
2086  0008 81            	ret	
2153                     ; 880 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2153                     ; 881 {
2154                     .text:	section	.text,new
2155  0000               _TIM5_ForcedOC1Config:
2157  0000 88            	push	a
2158  0001 88            	push	a
2159       00000001      OFST:	set	1
2162                     ; 882   uint8_t tmpccmr1 = 0;
2164                     ; 885   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2166                     ; 887   tmpccmr1 = TIM5->CCMR1;
2168  0002 c65309        	ld	a,21257
2169                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2171  0005 a48f          	and	a,#143
2172                     ; 893   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2174  0007 1a02          	or	a,(OFST+1,sp)
2175                     ; 895   TIM5->CCMR1 = tmpccmr1;
2177  0009 c75309        	ld	21257,a
2178                     ; 896 }
2181  000c 85            	popw	x
2182  000d 81            	ret	
2227                     ; 906 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2227                     ; 907 {
2228                     .text:	section	.text,new
2229  0000               _TIM5_ForcedOC2Config:
2231  0000 88            	push	a
2232  0001 88            	push	a
2233       00000001      OFST:	set	1
2236                     ; 908   uint8_t tmpccmr2 = 0;
2238                     ; 911   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2240                     ; 913   tmpccmr2 = TIM5->CCMR2;
2242  0002 c6530a        	ld	a,21258
2243                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2245  0005 a48f          	and	a,#143
2246                     ; 919   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2248  0007 1a02          	or	a,(OFST+1,sp)
2249                     ; 921   TIM5->CCMR2 = tmpccmr2;
2251  0009 c7530a        	ld	21258,a
2252                     ; 922 }
2255  000c 85            	popw	x
2256  000d 81            	ret	
2292                     ; 930 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2292                     ; 931 {
2293                     .text:	section	.text,new
2294  0000               _TIM5_OC1PreloadConfig:
2298                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2300                     ; 936   if (NewState != DISABLE)
2302  0000 4d            	tnz	a
2303  0001 2705          	jreq	L5711
2304                     ; 938     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2306  0003 72165309      	bset	21257,#3
2309  0007 81            	ret	
2310  0008               L5711:
2311                     ; 942     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2313  0008 72175309      	bres	21257,#3
2314                     ; 944 }
2317  000c 81            	ret	
2353                     ; 952 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2353                     ; 953 {
2354                     .text:	section	.text,new
2355  0000               _TIM5_OC2PreloadConfig:
2359                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2361                     ; 958   if (NewState != DISABLE)
2363  0000 4d            	tnz	a
2364  0001 2705          	jreq	L7121
2365                     ; 960     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2367  0003 7216530a      	bset	21258,#3
2370  0007 81            	ret	
2371  0008               L7121:
2372                     ; 964     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2374  0008 7217530a      	bres	21258,#3
2375                     ; 966 }
2378  000c 81            	ret	
2413                     ; 974 void TIM5_OC1FastConfig(FunctionalState NewState)
2413                     ; 975 {
2414                     .text:	section	.text,new
2415  0000               _TIM5_OC1FastConfig:
2419                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2421                     ; 980   if (NewState != DISABLE)
2423  0000 4d            	tnz	a
2424  0001 2705          	jreq	L1421
2425                     ; 982     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2427  0003 72145309      	bset	21257,#2
2430  0007 81            	ret	
2431  0008               L1421:
2432                     ; 986     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2434  0008 72155309      	bres	21257,#2
2435                     ; 988 }
2438  000c 81            	ret	
2473                     ; 997 void TIM5_OC2FastConfig(FunctionalState NewState)
2473                     ; 998 {
2474                     .text:	section	.text,new
2475  0000               _TIM5_OC2FastConfig:
2479                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2481                     ; 1003   if (NewState != DISABLE)
2483  0000 4d            	tnz	a
2484  0001 2705          	jreq	L3621
2485                     ; 1005     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2487  0003 7214530a      	bset	21258,#2
2490  0007 81            	ret	
2491  0008               L3621:
2492                     ; 1009     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2494  0008 7215530a      	bres	21258,#2
2495                     ; 1011 }
2498  000c 81            	ret	
2534                     ; 1021 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2534                     ; 1022 {
2535                     .text:	section	.text,new
2536  0000               _TIM5_OC1PolarityConfig:
2540                     ; 1024   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2542                     ; 1027   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2544  0000 4a            	dec	a
2545  0001 2605          	jrne	L5031
2546                     ; 1029     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2548  0003 7212530b      	bset	21259,#1
2551  0007 81            	ret	
2552  0008               L5031:
2553                     ; 1033     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2555  0008 7213530b      	bres	21259,#1
2556                     ; 1035 }
2559  000c 81            	ret	
2595                     ; 1045 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2595                     ; 1046 {
2596                     .text:	section	.text,new
2597  0000               _TIM5_OC2PolarityConfig:
2601                     ; 1048   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2603                     ; 1051   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2605  0000 4a            	dec	a
2606  0001 2605          	jrne	L7231
2607                     ; 1053     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2609  0003 721a530b      	bset	21259,#5
2612  0007 81            	ret	
2613  0008               L7231:
2614                     ; 1057     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2616  0008 721b530b      	bres	21259,#5
2617                     ; 1059 }
2620  000c 81            	ret	
2665                     ; 1071 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2665                     ; 1072                  FunctionalState NewState)
2665                     ; 1073 {
2666                     .text:	section	.text,new
2667  0000               _TIM5_CCxCmd:
2669  0000 89            	pushw	x
2670       00000000      OFST:	set	0
2673                     ; 1075   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2675                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2677                     ; 1078   if (TIM5_Channel == TIM5_Channel_1)
2679  0001 9e            	ld	a,xh
2680  0002 4d            	tnz	a
2681  0003 2610          	jrne	L5531
2682                     ; 1081     if (NewState != DISABLE)
2684  0005 9f            	ld	a,xl
2685  0006 4d            	tnz	a
2686  0007 2706          	jreq	L7531
2687                     ; 1083       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2689  0009 7210530b      	bset	21259,#0
2691  000d 2014          	jra	L3631
2692  000f               L7531:
2693                     ; 1087       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2695  000f 7211530b      	bres	21259,#0
2696  0013 200e          	jra	L3631
2697  0015               L5531:
2698                     ; 1094     if (NewState != DISABLE)
2700  0015 7b02          	ld	a,(OFST+2,sp)
2701  0017 2706          	jreq	L5631
2702                     ; 1096       TIM5->CCER1 |= TIM_CCER1_CC2E;
2704  0019 7218530b      	bset	21259,#4
2706  001d 2004          	jra	L3631
2707  001f               L5631:
2708                     ; 1100       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2710  001f 7219530b      	bres	21259,#4
2711  0023               L3631:
2712                     ; 1103 }
2715  0023 85            	popw	x
2716  0024 81            	ret	
2880                     ; 1181 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2880                     ; 1182                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2880                     ; 1183                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2880                     ; 1184                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2880                     ; 1185                  uint8_t TIM5_ICFilter)
2880                     ; 1186 {
2881                     .text:	section	.text,new
2882  0000               _TIM5_ICInit:
2884  0000 89            	pushw	x
2885       00000000      OFST:	set	0
2888                     ; 1188   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2890                     ; 1190   if (TIM5_Channel == TIM5_Channel_1)
2892  0001 9e            	ld	a,xh
2893  0002 4d            	tnz	a
2894  0003 2614          	jrne	L5641
2895                     ; 1193     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2897  0005 7b07          	ld	a,(OFST+7,sp)
2898  0007 88            	push	a
2899  0008 7b06          	ld	a,(OFST+6,sp)
2900  000a 97            	ld	xl,a
2901  000b 7b03          	ld	a,(OFST+3,sp)
2902  000d 95            	ld	xh,a
2903  000e cd0000        	call	L3_TI1_Config
2905  0011 84            	pop	a
2906                     ; 1196     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2908  0012 7b06          	ld	a,(OFST+6,sp)
2909  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2912  0017 2012          	jra	L7641
2913  0019               L5641:
2914                     ; 1201     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2916  0019 7b07          	ld	a,(OFST+7,sp)
2917  001b 88            	push	a
2918  001c 7b06          	ld	a,(OFST+6,sp)
2919  001e 97            	ld	xl,a
2920  001f 7b03          	ld	a,(OFST+3,sp)
2921  0021 95            	ld	xh,a
2922  0022 cd0000        	call	L5_TI2_Config
2924  0025 84            	pop	a
2925                     ; 1204     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2927  0026 7b06          	ld	a,(OFST+6,sp)
2928  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2930  002b               L7641:
2931                     ; 1206 }
2934  002b 85            	popw	x
2935  002c 81            	ret	
3031                     ; 1232 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3031                     ; 1233                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3031                     ; 1234                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3031                     ; 1235                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3031                     ; 1236                      uint8_t TIM5_ICFilter)
3031                     ; 1237 {
3032                     .text:	section	.text,new
3033  0000               _TIM5_PWMIConfig:
3035  0000 89            	pushw	x
3036  0001 89            	pushw	x
3037       00000002      OFST:	set	2
3040                     ; 1238   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3042                     ; 1239   uint8_t icselection = TIM5_ICSelection_DirectTI;
3044                     ; 1242   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3046                     ; 1245   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3048  0002 9f            	ld	a,xl
3049  0003 4d            	tnz	a
3050  0004 2605          	jrne	L7351
3051                     ; 1247     icpolarity = TIM5_ICPolarity_Falling;
3053  0006 4c            	inc	a
3054  0007 6b01          	ld	(OFST-1,sp),a
3056  0009 2002          	jra	L1451
3057  000b               L7351:
3058                     ; 1251     icpolarity = TIM5_ICPolarity_Rising;
3060  000b 0f01          	clr	(OFST-1,sp)
3061  000d               L1451:
3062                     ; 1255   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3064  000d 7b07          	ld	a,(OFST+5,sp)
3065  000f 4a            	dec	a
3066  0010 2604          	jrne	L3451
3067                     ; 1257     icselection = TIM5_ICSelection_IndirectTI;
3069  0012 a602          	ld	a,#2
3071  0014 2002          	jra	L5451
3072  0016               L3451:
3073                     ; 1261     icselection = TIM5_ICSelection_DirectTI;
3075  0016 a601          	ld	a,#1
3076  0018               L5451:
3077  0018 6b02          	ld	(OFST+0,sp),a
3078                     ; 1264   if (TIM5_Channel == TIM5_Channel_1)
3080  001a 7b03          	ld	a,(OFST+1,sp)
3081  001c 2626          	jrne	L7451
3082                     ; 1267     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3082                     ; 1268                TIM5_ICFilter);
3084  001e 7b09          	ld	a,(OFST+7,sp)
3085  0020 88            	push	a
3086  0021 7b08          	ld	a,(OFST+6,sp)
3087  0023 97            	ld	xl,a
3088  0024 7b05          	ld	a,(OFST+3,sp)
3089  0026 95            	ld	xh,a
3090  0027 cd0000        	call	L3_TI1_Config
3092  002a 84            	pop	a
3093                     ; 1271     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3095  002b 7b08          	ld	a,(OFST+6,sp)
3096  002d cd0000        	call	_TIM5_SetIC1Prescaler
3098                     ; 1274     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3100  0030 7b09          	ld	a,(OFST+7,sp)
3101  0032 88            	push	a
3102  0033 7b03          	ld	a,(OFST+1,sp)
3103  0035 97            	ld	xl,a
3104  0036 7b02          	ld	a,(OFST+0,sp)
3105  0038 95            	ld	xh,a
3106  0039 cd0000        	call	L5_TI2_Config
3108  003c 84            	pop	a
3109                     ; 1277     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3111  003d 7b08          	ld	a,(OFST+6,sp)
3112  003f cd0000        	call	_TIM5_SetIC2Prescaler
3115  0042 2024          	jra	L1551
3116  0044               L7451:
3117                     ; 1282     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3117                     ; 1283                TIM5_ICFilter);
3119  0044 7b09          	ld	a,(OFST+7,sp)
3120  0046 88            	push	a
3121  0047 7b08          	ld	a,(OFST+6,sp)
3122  0049 97            	ld	xl,a
3123  004a 7b05          	ld	a,(OFST+3,sp)
3124  004c 95            	ld	xh,a
3125  004d cd0000        	call	L5_TI2_Config
3127  0050 84            	pop	a
3128                     ; 1286     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3130  0051 7b08          	ld	a,(OFST+6,sp)
3131  0053 cd0000        	call	_TIM5_SetIC2Prescaler
3133                     ; 1289     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3135  0056 7b09          	ld	a,(OFST+7,sp)
3136  0058 88            	push	a
3137  0059 7b03          	ld	a,(OFST+1,sp)
3138  005b 97            	ld	xl,a
3139  005c 7b02          	ld	a,(OFST+0,sp)
3140  005e 95            	ld	xh,a
3141  005f cd0000        	call	L3_TI1_Config
3143  0062 84            	pop	a
3144                     ; 1292     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3146  0063 7b08          	ld	a,(OFST+6,sp)
3147  0065 cd0000        	call	_TIM5_SetIC1Prescaler
3149  0068               L1551:
3150                     ; 1294 }
3153  0068 5b04          	addw	sp,#4
3154  006a 81            	ret	
3206                     ; 1301 uint16_t TIM5_GetCapture1(void)
3206                     ; 1302 {
3207                     .text:	section	.text,new
3208  0000               _TIM5_GetCapture1:
3210  0000 5204          	subw	sp,#4
3211       00000004      OFST:	set	4
3214                     ; 1303   uint16_t tmpccr1 = 0;
3216                     ; 1306   tmpccr1h = TIM5->CCR1H;
3218  0002 c65311        	ld	a,21265
3219  0005 6b02          	ld	(OFST-2,sp),a
3220                     ; 1307   tmpccr1l = TIM5->CCR1L;
3222  0007 c65312        	ld	a,21266
3223  000a 6b01          	ld	(OFST-3,sp),a
3224                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3226  000c 5f            	clrw	x
3227  000d 97            	ld	xl,a
3228  000e 1f03          	ldw	(OFST-1,sp),x
3229                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3231  0010 5f            	clrw	x
3232  0011 7b02          	ld	a,(OFST-2,sp)
3233  0013 97            	ld	xl,a
3234  0014 7b04          	ld	a,(OFST+0,sp)
3235  0016 01            	rrwa	x,a
3236  0017 1a03          	or	a,(OFST-1,sp)
3237  0019 01            	rrwa	x,a
3238                     ; 1312   return ((uint16_t)tmpccr1);
3242  001a 5b04          	addw	sp,#4
3243  001c 81            	ret	
3295                     ; 1320 uint16_t TIM5_GetCapture2(void)
3295                     ; 1321 {
3296                     .text:	section	.text,new
3297  0000               _TIM5_GetCapture2:
3299  0000 5204          	subw	sp,#4
3300       00000004      OFST:	set	4
3303                     ; 1322   uint16_t tmpccr2 = 0;
3305                     ; 1325   tmpccr2h = TIM5->CCR2H;
3307  0002 c65313        	ld	a,21267
3308  0005 6b02          	ld	(OFST-2,sp),a
3309                     ; 1326   tmpccr2l = TIM5->CCR2L;
3311  0007 c65314        	ld	a,21268
3312  000a 6b01          	ld	(OFST-3,sp),a
3313                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3315  000c 5f            	clrw	x
3316  000d 97            	ld	xl,a
3317  000e 1f03          	ldw	(OFST-1,sp),x
3318                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3320  0010 5f            	clrw	x
3321  0011 7b02          	ld	a,(OFST-2,sp)
3322  0013 97            	ld	xl,a
3323  0014 7b04          	ld	a,(OFST+0,sp)
3324  0016 01            	rrwa	x,a
3325  0017 1a03          	or	a,(OFST-1,sp)
3326  0019 01            	rrwa	x,a
3327                     ; 1331   return ((uint16_t)tmpccr2);
3331  001a 5b04          	addw	sp,#4
3332  001c 81            	ret	
3377                     ; 1344 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3377                     ; 1345 {
3378                     .text:	section	.text,new
3379  0000               _TIM5_SetIC1Prescaler:
3381  0000 88            	push	a
3382  0001 88            	push	a
3383       00000001      OFST:	set	1
3386                     ; 1346   uint8_t tmpccmr1 = 0;
3388                     ; 1349   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3390                     ; 1351   tmpccmr1 = TIM5->CCMR1;
3392  0002 c65309        	ld	a,21257
3393                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3395  0005 a4f3          	and	a,#243
3396                     ; 1357   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3398  0007 1a02          	or	a,(OFST+1,sp)
3399                     ; 1359   TIM5->CCMR1 = tmpccmr1;
3401  0009 c75309        	ld	21257,a
3402                     ; 1360 }
3405  000c 85            	popw	x
3406  000d 81            	ret	
3451                     ; 1372 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3451                     ; 1373 {
3452                     .text:	section	.text,new
3453  0000               _TIM5_SetIC2Prescaler:
3455  0000 88            	push	a
3456  0001 88            	push	a
3457       00000001      OFST:	set	1
3460                     ; 1374   uint8_t tmpccmr2 = 0;
3462                     ; 1377   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3464                     ; 1379   tmpccmr2 = TIM5->CCMR2;
3466  0002 c6530a        	ld	a,21258
3467                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3469  0005 a4f3          	and	a,#243
3470                     ; 1385   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3472  0007 1a02          	or	a,(OFST+1,sp)
3473                     ; 1387   TIM5->CCMR2 = tmpccmr2;
3475  0009 c7530a        	ld	21258,a
3476                     ; 1388 }
3479  000c 85            	popw	x
3480  000d 81            	ret	
3566                     ; 1419 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3566                     ; 1420 {
3567                     .text:	section	.text,new
3568  0000               _TIM5_ITConfig:
3570  0000 89            	pushw	x
3571       00000000      OFST:	set	0
3574                     ; 1422   assert_param(IS_TIM5_IT(TIM5_IT));
3576                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3578                     ; 1425   if (NewState != DISABLE)
3580  0001 9f            	ld	a,xl
3581  0002 4d            	tnz	a
3582  0003 2706          	jreq	L3371
3583                     ; 1428     TIM5->IER |= (uint8_t)TIM5_IT;
3585  0005 9e            	ld	a,xh
3586  0006 ca5305        	or	a,21253
3588  0009 2006          	jra	L5371
3589  000b               L3371:
3590                     ; 1433     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3592  000b 7b01          	ld	a,(OFST+1,sp)
3593  000d 43            	cpl	a
3594  000e c45305        	and	a,21253
3595  0011               L5371:
3596  0011 c75305        	ld	21253,a
3597                     ; 1435 }
3600  0014 85            	popw	x
3601  0015 81            	ret	
3682                     ; 1448 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3682                     ; 1449 {
3683                     .text:	section	.text,new
3684  0000               _TIM5_GenerateEvent:
3688                     ; 1451   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3690                     ; 1454   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3692  0000 ca5308        	or	a,21256
3693  0003 c75308        	ld	21256,a
3694                     ; 1455 }
3697  0006 81            	ret	
3836                     ; 1470 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3836                     ; 1471 {
3837                     .text:	section	.text,new
3838  0000               _TIM5_GetFlagStatus:
3840  0000 89            	pushw	x
3841  0001 89            	pushw	x
3842       00000002      OFST:	set	2
3845                     ; 1472   FlagStatus bitstatus = RESET;
3847                     ; 1473   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3851                     ; 1476   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3853                     ; 1478   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3855  0002 9f            	ld	a,xl
3856  0003 c45306        	and	a,21254
3857  0006 6b01          	ld	(OFST-1,sp),a
3858                     ; 1479   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3860  0008 c65307        	ld	a,21255
3861  000b 1403          	and	a,(OFST+1,sp)
3862  000d 6b02          	ld	(OFST+0,sp),a
3863                     ; 1481   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3865  000f 1a01          	or	a,(OFST-1,sp)
3866  0011 2702          	jreq	L7502
3867                     ; 1483     bitstatus = SET;
3869  0013 a601          	ld	a,#1
3871  0015               L7502:
3872                     ; 1487     bitstatus = RESET;
3874                     ; 1489   return ((FlagStatus)bitstatus);
3878  0015 5b04          	addw	sp,#4
3879  0017 81            	ret	
3914                     ; 1503 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3914                     ; 1504 {
3915                     .text:	section	.text,new
3916  0000               _TIM5_ClearFlag:
3918  0000 89            	pushw	x
3919       00000000      OFST:	set	0
3922                     ; 1506   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3924                     ; 1508   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3926  0001 9f            	ld	a,xl
3927  0002 43            	cpl	a
3928  0003 c75306        	ld	21254,a
3929                     ; 1509   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3931  0006 7b01          	ld	a,(OFST+1,sp)
3932  0008 43            	cpl	a
3933  0009 c75307        	ld	21255,a
3934                     ; 1510 }
3937  000c 85            	popw	x
3938  000d 81            	ret	
4002                     ; 1523 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4002                     ; 1524 {
4003                     .text:	section	.text,new
4004  0000               _TIM5_GetITStatus:
4006  0000 88            	push	a
4007  0001 89            	pushw	x
4008       00000002      OFST:	set	2
4011                     ; 1525   ITStatus bitstatus = RESET;
4013                     ; 1527   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4017                     ; 1530   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4019                     ; 1532   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4021  0002 c45306        	and	a,21254
4022  0005 6b01          	ld	(OFST-1,sp),a
4023                     ; 1534   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4025  0007 c65305        	ld	a,21253
4026  000a 1403          	and	a,(OFST+1,sp)
4027  000c 6b02          	ld	(OFST+0,sp),a
4028                     ; 1536   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4030  000e 7b01          	ld	a,(OFST-1,sp)
4031  0010 2708          	jreq	L3312
4033  0012 7b02          	ld	a,(OFST+0,sp)
4034  0014 2704          	jreq	L3312
4035                     ; 1538     bitstatus = (ITStatus)SET;
4037  0016 a601          	ld	a,#1
4039  0018 2001          	jra	L5312
4040  001a               L3312:
4041                     ; 1542     bitstatus = (ITStatus)RESET;
4043  001a 4f            	clr	a
4044  001b               L5312:
4045                     ; 1544   return ((ITStatus)bitstatus);
4049  001b 5b03          	addw	sp,#3
4050  001d 81            	ret	
4086                     ; 1558 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4086                     ; 1559 {
4087                     .text:	section	.text,new
4088  0000               _TIM5_ClearITPendingBit:
4092                     ; 1561   assert_param(IS_TIM5_IT(TIM5_IT));
4094                     ; 1564   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4096  0000 43            	cpl	a
4097  0001 c75306        	ld	21254,a
4098                     ; 1565 }
4101  0004 81            	ret	
4174                     ; 1578 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4174                     ; 1579 {
4175                     .text:	section	.text,new
4176  0000               _TIM5_DMACmd:
4178  0000 89            	pushw	x
4179       00000000      OFST:	set	0
4182                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4184                     ; 1582   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4186                     ; 1584   if (NewState != DISABLE)
4188  0001 9f            	ld	a,xl
4189  0002 4d            	tnz	a
4190  0003 2706          	jreq	L1122
4191                     ; 1587     TIM5->DER |= TIM5_DMASource;
4193  0005 9e            	ld	a,xh
4194  0006 ca5304        	or	a,21252
4196  0009 2006          	jra	L3122
4197  000b               L1122:
4198                     ; 1592     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4200  000b 7b01          	ld	a,(OFST+1,sp)
4201  000d 43            	cpl	a
4202  000e c45304        	and	a,21252
4203  0011               L3122:
4204  0011 c75304        	ld	21252,a
4205                     ; 1594 }
4208  0014 85            	popw	x
4209  0015 81            	ret	
4244                     ; 1602 void TIM5_SelectCCDMA(FunctionalState NewState)
4244                     ; 1603 {
4245                     .text:	section	.text,new
4246  0000               _TIM5_SelectCCDMA:
4250                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4252                     ; 1607   if (NewState != DISABLE)
4254  0000 4d            	tnz	a
4255  0001 2705          	jreq	L3322
4256                     ; 1610     TIM5->CR2 |= TIM_CR2_CCDS;
4258  0003 72165301      	bset	21249,#3
4261  0007 81            	ret	
4262  0008               L3322:
4263                     ; 1615     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4265  0008 72175301      	bres	21249,#3
4266                     ; 1617 }
4269  000c 81            	ret	
4293                     ; 1641 void TIM5_InternalClockConfig(void)
4293                     ; 1642 {
4294                     .text:	section	.text,new
4295  0000               _TIM5_InternalClockConfig:
4299                     ; 1644   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4301  0000 c65302        	ld	a,21250
4302  0003 a4f8          	and	a,#248
4303  0005 c75302        	ld	21250,a
4304                     ; 1645 }
4307  0008 81            	ret	
4396                     ; 1662 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4396                     ; 1663                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4396                     ; 1664                                  uint8_t ICFilter)
4396                     ; 1665 {
4397                     .text:	section	.text,new
4398  0000               _TIM5_TIxExternalClockConfig:
4400  0000 89            	pushw	x
4401       00000000      OFST:	set	0
4404                     ; 1667   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4406                     ; 1668   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4408                     ; 1669   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4410                     ; 1672   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4412  0001 9e            	ld	a,xh
4413  0002 a160          	cp	a,#96
4414  0004 260e          	jrne	L7032
4415                     ; 1674     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4417  0006 7b05          	ld	a,(OFST+5,sp)
4418  0008 88            	push	a
4419  0009 ae0001        	ldw	x,#1
4420  000c 7b03          	ld	a,(OFST+3,sp)
4421  000e 95            	ld	xh,a
4422  000f cd0000        	call	L5_TI2_Config
4425  0012 200c          	jra	L1132
4426  0014               L7032:
4427                     ; 1678     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4429  0014 7b05          	ld	a,(OFST+5,sp)
4430  0016 88            	push	a
4431  0017 ae0001        	ldw	x,#1
4432  001a 7b03          	ld	a,(OFST+3,sp)
4433  001c 95            	ld	xh,a
4434  001d cd0000        	call	L3_TI1_Config
4436  0020               L1132:
4437  0020 84            	pop	a
4438                     ; 1682   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4440  0021 7b01          	ld	a,(OFST+1,sp)
4441  0023 cd0000        	call	_TIM5_SelectInputTrigger
4443                     ; 1685   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4445  0026 c65302        	ld	a,21250
4446  0029 aa07          	or	a,#7
4447  002b c75302        	ld	21250,a
4448                     ; 1686 }
4451  002e 85            	popw	x
4452  002f 81            	ret	
4569                     ; 1704 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4569                     ; 1705                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4569                     ; 1706                               uint8_t ExtTRGFilter)
4569                     ; 1707 {
4570                     .text:	section	.text,new
4571  0000               _TIM5_ETRClockMode1Config:
4573  0000 89            	pushw	x
4574       00000000      OFST:	set	0
4577                     ; 1709   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4579  0001 7b05          	ld	a,(OFST+5,sp)
4580  0003 88            	push	a
4581  0004 7b02          	ld	a,(OFST+2,sp)
4582  0006 95            	ld	xh,a
4583  0007 cd0000        	call	_TIM5_ETRConfig
4585  000a 84            	pop	a
4586                     ; 1712   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4588  000b c65302        	ld	a,21250
4589  000e a4f8          	and	a,#248
4590  0010 c75302        	ld	21250,a
4591                     ; 1713   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4593  0013 c65302        	ld	a,21250
4594  0016 aa07          	or	a,#7
4595  0018 c75302        	ld	21250,a
4596                     ; 1716   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4598  001b c65302        	ld	a,21250
4599  001e a48f          	and	a,#143
4600  0020 c75302        	ld	21250,a
4601                     ; 1717   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4603  0023 c65302        	ld	a,21250
4604  0026 aa70          	or	a,#112
4605  0028 c75302        	ld	21250,a
4606                     ; 1718 }
4609  002b 85            	popw	x
4610  002c 81            	ret	
4668                     ; 1736 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4668                     ; 1737                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4668                     ; 1738                               uint8_t ExtTRGFilter)
4668                     ; 1739 {
4669                     .text:	section	.text,new
4670  0000               _TIM5_ETRClockMode2Config:
4672  0000 89            	pushw	x
4673       00000000      OFST:	set	0
4676                     ; 1741   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4678  0001 7b05          	ld	a,(OFST+5,sp)
4679  0003 88            	push	a
4680  0004 7b02          	ld	a,(OFST+2,sp)
4681  0006 95            	ld	xh,a
4682  0007 cd0000        	call	_TIM5_ETRConfig
4684  000a 721c5303      	bset	21251,#6
4685  000e 84            	pop	a
4686                     ; 1744   TIM5->ETR |= TIM_ETR_ECE ;
4688                     ; 1745 }
4691  000f 85            	popw	x
4692  0010 81            	ret	
4808                     ; 1796 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4808                     ; 1797 {
4809                     .text:	section	.text,new
4810  0000               _TIM5_SelectInputTrigger:
4812  0000 88            	push	a
4813  0001 88            	push	a
4814       00000001      OFST:	set	1
4817                     ; 1798   uint8_t tmpsmcr = 0;
4819                     ; 1801   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4821                     ; 1803   tmpsmcr = TIM5->SMCR;
4823  0002 c65302        	ld	a,21250
4824                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4826  0005 a48f          	and	a,#143
4827                     ; 1807   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4829  0007 1a02          	or	a,(OFST+1,sp)
4830                     ; 1809   TIM5->SMCR = (uint8_t)tmpsmcr;
4832  0009 c75302        	ld	21250,a
4833                     ; 1810 }
4836  000c 85            	popw	x
4837  000d 81            	ret	
4936                     ; 1824 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4936                     ; 1825 {
4937                     .text:	section	.text,new
4938  0000               _TIM5_SelectOutputTrigger:
4940  0000 88            	push	a
4941  0001 88            	push	a
4942       00000001      OFST:	set	1
4945                     ; 1826   uint8_t tmpcr2 = 0;
4947                     ; 1829   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4949                     ; 1831   tmpcr2 = TIM5->CR2;
4951  0002 c65301        	ld	a,21249
4952                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4954  0005 a48f          	and	a,#143
4955                     ; 1837   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4957  0007 1a02          	or	a,(OFST+1,sp)
4958                     ; 1839   TIM5->CR2 = tmpcr2;
4960  0009 c75301        	ld	21249,a
4961                     ; 1840 }
4964  000c 85            	popw	x
4965  000d 81            	ret	
5048                     ; 1852 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5048                     ; 1853 {
5049                     .text:	section	.text,new
5050  0000               _TIM5_SelectSlaveMode:
5052  0000 88            	push	a
5053  0001 88            	push	a
5054       00000001      OFST:	set	1
5057                     ; 1854   uint8_t tmpsmcr = 0;
5059                     ; 1857   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5061                     ; 1859   tmpsmcr = TIM5->SMCR;
5063  0002 c65302        	ld	a,21250
5064                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5066  0005 a4f8          	and	a,#248
5067                     ; 1865   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5069  0007 1a02          	or	a,(OFST+1,sp)
5070                     ; 1867   TIM5->SMCR = tmpsmcr;
5072  0009 c75302        	ld	21250,a
5073                     ; 1868 }
5076  000c 85            	popw	x
5077  000d 81            	ret	
5113                     ; 1876 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5113                     ; 1877 {
5114                     .text:	section	.text,new
5115  0000               _TIM5_SelectMasterSlaveMode:
5119                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
5121                     ; 1882   if (NewState != DISABLE)
5123  0000 4d            	tnz	a
5124  0001 2705          	jreq	L7752
5125                     ; 1884     TIM5->SMCR |= TIM_SMCR_MSM;
5127  0003 721e5302      	bset	21250,#7
5130  0007 81            	ret	
5131  0008               L7752:
5132                     ; 1888     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5134  0008 721f5302      	bres	21250,#7
5135                     ; 1890 }
5138  000c 81            	ret	
5194                     ; 1908 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5194                     ; 1909                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5194                     ; 1910                     uint8_t ExtTRGFilter)
5194                     ; 1911 {
5195                     .text:	section	.text,new
5196  0000               _TIM5_ETRConfig:
5198  0000 89            	pushw	x
5199       00000000      OFST:	set	0
5202                     ; 1913   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5204                     ; 1914   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5206                     ; 1915   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5208                     ; 1918   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5208                     ; 1919                          | (uint8_t)ExtTRGFilter);
5210  0001 9f            	ld	a,xl
5211  0002 1a01          	or	a,(OFST+1,sp)
5212  0004 1a05          	or	a,(OFST+5,sp)
5213  0006 ca5303        	or	a,21251
5214  0009 c75303        	ld	21251,a
5215                     ; 1920 }
5218  000c 85            	popw	x
5219  000d 81            	ret	
5332                     ; 1955 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5332                     ; 1956                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5332                     ; 1957                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5332                     ; 1958 {
5333                     .text:	section	.text,new
5334  0000               _TIM5_EncoderInterfaceConfig:
5336  0000 89            	pushw	x
5337  0001 5203          	subw	sp,#3
5338       00000003      OFST:	set	3
5341                     ; 1959   uint8_t tmpsmcr = 0;
5343                     ; 1960   uint8_t tmpccmr1 = 0;
5345                     ; 1961   uint8_t tmpccmr2 = 0;
5347                     ; 1964   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5349                     ; 1965   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5351                     ; 1966   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5353                     ; 1968   tmpsmcr = TIM5->SMCR;
5355  0003 c65302        	ld	a,21250
5356  0006 6b01          	ld	(OFST-2,sp),a
5357                     ; 1969   tmpccmr1 = TIM5->CCMR1;
5359  0008 c65309        	ld	a,21257
5360  000b 6b02          	ld	(OFST-1,sp),a
5361                     ; 1970   tmpccmr2 = TIM5->CCMR2;
5363  000d c6530a        	ld	a,21258
5364  0010 6b03          	ld	(OFST+0,sp),a
5365                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5367  0012 7b01          	ld	a,(OFST-2,sp)
5368  0014 a4f0          	and	a,#240
5369  0016 6b01          	ld	(OFST-2,sp),a
5370                     ; 1974   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5372  0018 9e            	ld	a,xh
5373  0019 1a01          	or	a,(OFST-2,sp)
5374  001b 6b01          	ld	(OFST-2,sp),a
5375                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5377  001d 7b02          	ld	a,(OFST-1,sp)
5378  001f a4fc          	and	a,#252
5379  0021 6b02          	ld	(OFST-1,sp),a
5380                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5382  0023 7b03          	ld	a,(OFST+0,sp)
5383  0025 a4fc          	and	a,#252
5384  0027 6b03          	ld	(OFST+0,sp),a
5385                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5387  0029 7b02          	ld	a,(OFST-1,sp)
5388  002b aa01          	or	a,#1
5389  002d 6b02          	ld	(OFST-1,sp),a
5390                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5392  002f 7b03          	ld	a,(OFST+0,sp)
5393  0031 aa01          	or	a,#1
5394  0033 6b03          	ld	(OFST+0,sp),a
5395                     ; 1983   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5397  0035 9f            	ld	a,xl
5398  0036 4a            	dec	a
5399  0037 2606          	jrne	L5072
5400                     ; 1985     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5402  0039 7212530b      	bset	21259,#1
5404  003d 2004          	jra	L7072
5405  003f               L5072:
5406                     ; 1989     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5408  003f 7213530b      	bres	21259,#1
5409  0043               L7072:
5410                     ; 1992   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5412  0043 7b08          	ld	a,(OFST+5,sp)
5413  0045 4a            	dec	a
5414  0046 2606          	jrne	L1172
5415                     ; 1994     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5417  0048 721a530b      	bset	21259,#5
5419  004c 2004          	jra	L3172
5420  004e               L1172:
5421                     ; 1998     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5423  004e 721b530b      	bres	21259,#5
5424  0052               L3172:
5425                     ; 2001   TIM5->SMCR = tmpsmcr;
5427  0052 7b01          	ld	a,(OFST-2,sp)
5428  0054 c75302        	ld	21250,a
5429                     ; 2002   TIM5->CCMR1 = tmpccmr1;
5431  0057 7b02          	ld	a,(OFST-1,sp)
5432  0059 c75309        	ld	21257,a
5433                     ; 2003   TIM5->CCMR2 = tmpccmr2;
5435  005c 7b03          	ld	a,(OFST+0,sp)
5436  005e c7530a        	ld	21258,a
5437                     ; 2004 }
5440  0061 5b05          	addw	sp,#5
5441  0063 81            	ret	
5477                     ; 2012 void TIM5_SelectHallSensor(FunctionalState NewState)
5477                     ; 2013 {
5478                     .text:	section	.text,new
5479  0000               _TIM5_SelectHallSensor:
5483                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5485                     ; 2018   if (NewState != DISABLE)
5487  0000 4d            	tnz	a
5488  0001 2705          	jreq	L3372
5489                     ; 2020     TIM5->CR2 |= TIM_CR2_TI1S;
5491  0003 721e5301      	bset	21249,#7
5494  0007 81            	ret	
5495  0008               L3372:
5496                     ; 2024     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5498  0008 721f5301      	bres	21249,#7
5499                     ; 2026 }
5502  000c 81            	ret	
5574                     ; 2047 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5574                     ; 2048                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5574                     ; 2049                        uint8_t TIM5_ICFilter)
5574                     ; 2050 {
5575                     .text:	section	.text,new
5576  0000               L3_TI1_Config:
5578  0000 89            	pushw	x
5579  0001 89            	pushw	x
5580       00000002      OFST:	set	2
5583                     ; 2051   uint8_t tmpccmr1 = 0;
5585                     ; 2052   uint8_t tmpicpolarity = TIM5_ICPolarity;
5587  0002 9e            	ld	a,xh
5588  0003 6b01          	ld	(OFST-1,sp),a
5589                     ; 2053   tmpccmr1 = TIM5->CCMR1;
5591  0005 c65309        	ld	a,21257
5592  0008 6b02          	ld	(OFST+0,sp),a
5593                     ; 2056   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5595                     ; 2057   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5597                     ; 2058   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5599                     ; 2061   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5601                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5603  000a a40c          	and	a,#12
5604  000c 7211530b      	bres	21259,#0
5605  0010 6b02          	ld	(OFST+0,sp),a
5606                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5608  0012 7b07          	ld	a,(OFST+5,sp)
5609  0014 97            	ld	xl,a
5610  0015 a610          	ld	a,#16
5611  0017 42            	mul	x,a
5612  0018 9f            	ld	a,xl
5613  0019 1a04          	or	a,(OFST+2,sp)
5614  001b 1a02          	or	a,(OFST+0,sp)
5615  001d 6b02          	ld	(OFST+0,sp),a
5616                     ; 2067   TIM5->CCMR1 = tmpccmr1;
5618  001f c75309        	ld	21257,a
5619                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5621  0022 7b01          	ld	a,(OFST-1,sp)
5622  0024 4a            	dec	a
5623  0025 2606          	jrne	L5772
5624                     ; 2072     TIM5->CCER1 |= TIM_CCER1_CC1P;
5626  0027 7212530b      	bset	21259,#1
5628  002b 2004          	jra	L7772
5629  002d               L5772:
5630                     ; 2076     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5632  002d 7213530b      	bres	21259,#1
5633  0031               L7772:
5634                     ; 2080   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5636  0031 7210530b      	bset	21259,#0
5637                     ; 2081 }
5640  0035 5b04          	addw	sp,#4
5641  0037 81            	ret	
5713                     ; 2098 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5713                     ; 2099                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5713                     ; 2100                        uint8_t TIM5_ICFilter)
5713                     ; 2101 {
5714                     .text:	section	.text,new
5715  0000               L5_TI2_Config:
5717  0000 89            	pushw	x
5718  0001 89            	pushw	x
5719       00000002      OFST:	set	2
5722                     ; 2102   uint8_t tmpccmr2 = 0;
5724                     ; 2103   uint8_t tmpicpolarity = TIM5_ICPolarity;
5726  0002 9e            	ld	a,xh
5727  0003 6b01          	ld	(OFST-1,sp),a
5728                     ; 2106   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5730                     ; 2107   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5732                     ; 2108   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5734                     ; 2110   tmpccmr2 = TIM5->CCMR2;
5736  0005 c6530a        	ld	a,21258
5737  0008 6b02          	ld	(OFST+0,sp),a
5738                     ; 2113   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5740                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5742  000a a40c          	and	a,#12
5743  000c 7219530b      	bres	21259,#4
5744  0010 6b02          	ld	(OFST+0,sp),a
5745                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5747  0012 7b07          	ld	a,(OFST+5,sp)
5748  0014 97            	ld	xl,a
5749  0015 a610          	ld	a,#16
5750  0017 42            	mul	x,a
5751  0018 9f            	ld	a,xl
5752  0019 1a04          	or	a,(OFST+2,sp)
5753  001b 1a02          	or	a,(OFST+0,sp)
5754  001d 6b02          	ld	(OFST+0,sp),a
5755                     ; 2119   TIM5->CCMR2 = tmpccmr2;
5757  001f c7530a        	ld	21258,a
5758                     ; 2122   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5760  0022 7b01          	ld	a,(OFST-1,sp)
5761  0024 4a            	dec	a
5762  0025 2606          	jrne	L7303
5763                     ; 2124     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5765  0027 721a530b      	bset	21259,#5
5767  002b 2004          	jra	L1403
5768  002d               L7303:
5769                     ; 2128     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5771  002d 721b530b      	bres	21259,#5
5772  0031               L1403:
5773                     ; 2132   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5775  0031 7218530b      	bset	21259,#4
5776                     ; 2133 }
5779  0035 5b04          	addw	sp,#4
5780  0037 81            	ret	
5793                     	xdef	_TIM5_SelectHallSensor
5794                     	xdef	_TIM5_EncoderInterfaceConfig
5795                     	xdef	_TIM5_ETRConfig
5796                     	xdef	_TIM5_SelectMasterSlaveMode
5797                     	xdef	_TIM5_SelectSlaveMode
5798                     	xdef	_TIM5_SelectOutputTrigger
5799                     	xdef	_TIM5_SelectInputTrigger
5800                     	xdef	_TIM5_ETRClockMode2Config
5801                     	xdef	_TIM5_ETRClockMode1Config
5802                     	xdef	_TIM5_TIxExternalClockConfig
5803                     	xdef	_TIM5_InternalClockConfig
5804                     	xdef	_TIM5_SelectCCDMA
5805                     	xdef	_TIM5_DMACmd
5806                     	xdef	_TIM5_ClearITPendingBit
5807                     	xdef	_TIM5_GetITStatus
5808                     	xdef	_TIM5_ClearFlag
5809                     	xdef	_TIM5_GetFlagStatus
5810                     	xdef	_TIM5_GenerateEvent
5811                     	xdef	_TIM5_ITConfig
5812                     	xdef	_TIM5_SetIC2Prescaler
5813                     	xdef	_TIM5_SetIC1Prescaler
5814                     	xdef	_TIM5_GetCapture2
5815                     	xdef	_TIM5_GetCapture1
5816                     	xdef	_TIM5_PWMIConfig
5817                     	xdef	_TIM5_ICInit
5818                     	xdef	_TIM5_CCxCmd
5819                     	xdef	_TIM5_OC2PolarityConfig
5820                     	xdef	_TIM5_OC1PolarityConfig
5821                     	xdef	_TIM5_OC2FastConfig
5822                     	xdef	_TIM5_OC1FastConfig
5823                     	xdef	_TIM5_OC2PreloadConfig
5824                     	xdef	_TIM5_OC1PreloadConfig
5825                     	xdef	_TIM5_ForcedOC2Config
5826                     	xdef	_TIM5_ForcedOC1Config
5827                     	xdef	_TIM5_SetCompare2
5828                     	xdef	_TIM5_SetCompare1
5829                     	xdef	_TIM5_SelectOCxM
5830                     	xdef	_TIM5_CtrlPWMOutputs
5831                     	xdef	_TIM5_BKRConfig
5832                     	xdef	_TIM5_OC2Init
5833                     	xdef	_TIM5_OC1Init
5834                     	xdef	_TIM5_Cmd
5835                     	xdef	_TIM5_SelectOnePulseMode
5836                     	xdef	_TIM5_ARRPreloadConfig
5837                     	xdef	_TIM5_UpdateRequestConfig
5838                     	xdef	_TIM5_UpdateDisableConfig
5839                     	xdef	_TIM5_GetPrescaler
5840                     	xdef	_TIM5_GetCounter
5841                     	xdef	_TIM5_SetAutoreload
5842                     	xdef	_TIM5_SetCounter
5843                     	xdef	_TIM5_CounterModeConfig
5844                     	xdef	_TIM5_PrescalerConfig
5845                     	xdef	_TIM5_TimeBaseInit
5846                     	xdef	_TIM5_DeInit
5865                     	end
