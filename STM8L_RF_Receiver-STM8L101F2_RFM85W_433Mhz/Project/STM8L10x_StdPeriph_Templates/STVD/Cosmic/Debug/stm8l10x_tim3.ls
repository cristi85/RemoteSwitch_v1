   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 64 void TIM3_DeInit(void)
  49                     ; 65 {
  51                     .text:	section	.text,new
  52  0000               _TIM3_DeInit:
  56                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5280      	clr	21120
  59                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5281      	clr	21121
  62                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5282      	clr	21122
  65                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5283      	clr	21123
  68                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5284      	clr	21124
  71                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5286      	clr	21126
  74                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f528a      	clr	21130
  77                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  79  001c 35015288      	mov	21128,#1
  80                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  82  0020 35015289      	mov	21129,#1
  83                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f528a      	clr	21130
  86                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5288      	clr	21128
  89                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f5289      	clr	21129
  92                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f528b      	clr	21131
  95                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f528c      	clr	21132
  98                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f528d      	clr	21133
 101                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff528e      	mov	21134,#255
 104                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff528f      	mov	21135,#255
 107                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5290      	clr	21136
 110                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5291      	clr	21137
 113                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5292      	clr	21138
 116                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5293      	clr	21139
 119                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5295      	clr	21141
 122                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 124  0058 35015287      	mov	21127,#1
 125                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5294      	clr	21140
 128                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5285      	clr	21125
 131                     ; 102 }
 134  0064 81            	ret	
 296                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 296                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 296                     ; 129                        uint16_t TIM3_Period)
 296                     ; 130 {
 297                     .text:	section	.text,new
 298  0000               _TIM3_TimeBaseInit:
 300  0000 89            	pushw	x
 301       00000000      OFST:	set	0
 304                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 306                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 308                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 310  0001 7b05          	ld	a,(OFST+5,sp)
 311  0003 c7528e        	ld	21134,a
 312                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 314  0006 7b06          	ld	a,(OFST+6,sp)
 315  0008 c7528f        	ld	21135,a
 316                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 318  000b 9e            	ld	a,xh
 319  000c c7528d        	ld	21133,a
 320                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 322  000f c65280        	ld	a,21120
 323  0012 a48f          	and	a,#143
 324  0014 c75280        	ld	21120,a
 325                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 327  0017 9f            	ld	a,xl
 328  0018 ca5280        	or	a,21120
 329  001b c75280        	ld	21120,a
 330                     ; 147 }
 333  001e 85            	popw	x
 334  001f 81            	ret	
 532                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 532                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 532                     ; 176                   uint16_t TIM3_Pulse,
 532                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 532                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 532                     ; 179 {
 533                     .text:	section	.text,new
 534  0000               _TIM3_OC1Init:
 536  0000 89            	pushw	x
 537  0001 88            	push	a
 538       00000001      OFST:	set	1
 541                     ; 180   uint8_t tmpccmr1 = 0;
 543                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 545                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 547                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 549                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 551                     ; 188   tmpccmr1 = TIM3->CCMR1;
 553  0002 c65288        	ld	a,21128
 554  0005 6b01          	ld	(OFST+0,sp),a
 555                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 557  0007 7211528a      	bres	21130,#0
 558                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 560  000b a48f          	and	a,#143
 561  000d 6b01          	ld	(OFST+0,sp),a
 562                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 564  000f 9e            	ld	a,xh
 565  0010 1a01          	or	a,(OFST+0,sp)
 566  0012 6b01          	ld	(OFST+0,sp),a
 567                     ; 198   TIM3->CCMR1 = tmpccmr1;
 569  0014 c75288        	ld	21128,a
 570                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 572  0017 9f            	ld	a,xl
 573  0018 4a            	dec	a
 574  0019 2606          	jrne	L722
 575                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 577  001b 7210528a      	bset	21130,#0
 579  001f 2004          	jra	L132
 580  0021               L722:
 581                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 583  0021 7211528a      	bres	21130,#0
 584  0025               L132:
 585                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 587  0025 7b08          	ld	a,(OFST+7,sp)
 588  0027 4a            	dec	a
 589  0028 2606          	jrne	L332
 590                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 592  002a 7212528a      	bset	21130,#1
 594  002e 2004          	jra	L532
 595  0030               L332:
 596                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 598  0030 7213528a      	bres	21130,#1
 599  0034               L532:
 600                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 602  0034 7b09          	ld	a,(OFST+8,sp)
 603  0036 4a            	dec	a
 604  0037 2606          	jrne	L732
 605                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 607  0039 72105295      	bset	21141,#0
 609  003d 2004          	jra	L142
 610  003f               L732:
 611                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 613  003f 72115295      	bres	21141,#0
 614  0043               L142:
 615                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 617  0043 7b06          	ld	a,(OFST+5,sp)
 618  0045 c75290        	ld	21136,a
 619                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 621  0048 7b07          	ld	a,(OFST+6,sp)
 622  004a c75291        	ld	21137,a
 623                     ; 233 }
 626  004d 5b03          	addw	sp,#3
 627  004f 81            	ret	
 710                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 710                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 710                     ; 262                   uint16_t TIM3_Pulse,
 710                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 710                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 710                     ; 265 {
 711                     .text:	section	.text,new
 712  0000               _TIM3_OC2Init:
 714  0000 89            	pushw	x
 715  0001 88            	push	a
 716       00000001      OFST:	set	1
 719                     ; 266   uint8_t tmpccmr2 = 0;
 721                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 723                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 725                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 727                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 729                     ; 274   tmpccmr2 = TIM3->CCMR2;
 731  0002 c65289        	ld	a,21129
 732  0005 6b01          	ld	(OFST+0,sp),a
 733                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 735  0007 7219528a      	bres	21130,#4
 736                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 738  000b a48f          	and	a,#143
 739  000d 6b01          	ld	(OFST+0,sp),a
 740                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 742  000f 9e            	ld	a,xh
 743  0010 1a01          	or	a,(OFST+0,sp)
 744  0012 6b01          	ld	(OFST+0,sp),a
 745                     ; 285   TIM3->CCMR2 = tmpccmr2;
 747  0014 c75289        	ld	21129,a
 748                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 750  0017 9f            	ld	a,xl
 751  0018 4a            	dec	a
 752  0019 2606          	jrne	L503
 753                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 755  001b 7218528a      	bset	21130,#4
 757  001f 2004          	jra	L703
 758  0021               L503:
 759                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 761  0021 7219528a      	bres	21130,#4
 762  0025               L703:
 763                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 765  0025 7b08          	ld	a,(OFST+7,sp)
 766  0027 4a            	dec	a
 767  0028 2606          	jrne	L113
 768                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 770  002a 721a528a      	bset	21130,#5
 772  002e 2004          	jra	L313
 773  0030               L113:
 774                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 776  0030 721b528a      	bres	21130,#5
 777  0034               L313:
 778                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 780  0034 7b09          	ld	a,(OFST+8,sp)
 781  0036 4a            	dec	a
 782  0037 2606          	jrne	L513
 783                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 785  0039 72145295      	bset	21141,#2
 787  003d 2004          	jra	L713
 788  003f               L513:
 789                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 791  003f 72155295      	bres	21141,#2
 792  0043               L713:
 793                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 795  0043 7b06          	ld	a,(OFST+5,sp)
 796  0045 c75292        	ld	21138,a
 797                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 799  0048 7b07          	ld	a,(OFST+6,sp)
 800  004a c75293        	ld	21139,a
 801                     ; 321 }
 804  004d 5b03          	addw	sp,#3
 805  004f 81            	ret	
1003                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1003                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1003                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1003                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1003                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1003                     ; 355 
1003                     ; 356 {
1004                     .text:	section	.text,new
1005  0000               _TIM3_BKRConfig:
1007  0000 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1013                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1015                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1017                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1019                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1021                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1021                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1021                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1023  0001 9f            	ld	a,xl
1024  0002 1a01          	or	a,(OFST+1,sp)
1025  0004 1a05          	or	a,(OFST+5,sp)
1026  0006 1a06          	or	a,(OFST+6,sp)
1027  0008 1a07          	or	a,(OFST+7,sp)
1028  000a c75294        	ld	21140,a
1029                     ; 372 }
1032  000d 85            	popw	x
1033  000e 81            	ret	
1217                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1217                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1217                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1217                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1217                     ; 402                  uint8_t TIM3_ICFilter)
1217                     ; 403 {
1218                     .text:	section	.text,new
1219  0000               _TIM3_ICInit:
1221  0000 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1227                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1229  0001 9e            	ld	a,xh
1230  0002 4d            	tnz	a
1231  0003 2614          	jrne	L735
1232                     ; 410     TI1_Config(TIM3_ICPolarity,
1232                     ; 411                TIM3_ICSelection,
1232                     ; 412                TIM3_ICFilter);
1234  0005 7b07          	ld	a,(OFST+7,sp)
1235  0007 88            	push	a
1236  0008 7b06          	ld	a,(OFST+6,sp)
1237  000a 97            	ld	xl,a
1238  000b 7b03          	ld	a,(OFST+3,sp)
1239  000d 95            	ld	xh,a
1240  000e cd0000        	call	L3_TI1_Config
1242  0011 84            	pop	a
1243                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1245  0012 7b06          	ld	a,(OFST+6,sp)
1246  0014 cd0000        	call	_TIM3_SetIC1Prescaler
1249  0017 2012          	jra	L145
1250  0019               L735:
1251                     ; 420     TI2_Config(TIM3_ICPolarity,
1251                     ; 421                TIM3_ICSelection,
1251                     ; 422                TIM3_ICFilter);
1253  0019 7b07          	ld	a,(OFST+7,sp)
1254  001b 88            	push	a
1255  001c 7b06          	ld	a,(OFST+6,sp)
1256  001e 97            	ld	xl,a
1257  001f 7b03          	ld	a,(OFST+3,sp)
1258  0021 95            	ld	xh,a
1259  0022 cd0000        	call	L5_TI2_Config
1261  0025 84            	pop	a
1262                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1264  0026 7b06          	ld	a,(OFST+6,sp)
1265  0028 cd0000        	call	_TIM3_SetIC2Prescaler
1267  002b               L145:
1268                     ; 426 }
1271  002b 85            	popw	x
1272  002c 81            	ret	
1368                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1368                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1368                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1368                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1368                     ; 456                      uint8_t TIM3_ICFilter)
1368                     ; 457 {
1369                     .text:	section	.text,new
1370  0000               _TIM3_PWMIConfig:
1372  0000 89            	pushw	x
1373  0001 89            	pushw	x
1374       00000002      OFST:	set	2
1377                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1379                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1381                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1383                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1385  0002 9f            	ld	a,xl
1386  0003 4d            	tnz	a
1387  0004 2605          	jrne	L116
1388                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1390  0006 4c            	inc	a
1391  0007 6b01          	ld	(OFST-1,sp),a
1393  0009 2002          	jra	L316
1394  000b               L116:
1395                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1397  000b 0f01          	clr	(OFST-1,sp)
1398  000d               L316:
1399                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1401  000d 7b07          	ld	a,(OFST+5,sp)
1402  000f 4a            	dec	a
1403  0010 2604          	jrne	L516
1404                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1406  0012 a602          	ld	a,#2
1408  0014 2002          	jra	L716
1409  0016               L516:
1410                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1412  0016 a601          	ld	a,#1
1413  0018               L716:
1414  0018 6b02          	ld	(OFST+0,sp),a
1415                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1417  001a 7b03          	ld	a,(OFST+1,sp)
1418  001c 2626          	jrne	L126
1419                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1419                     ; 488                TIM3_ICFilter);
1421  001e 7b09          	ld	a,(OFST+7,sp)
1422  0020 88            	push	a
1423  0021 7b08          	ld	a,(OFST+6,sp)
1424  0023 97            	ld	xl,a
1425  0024 7b05          	ld	a,(OFST+3,sp)
1426  0026 95            	ld	xh,a
1427  0027 cd0000        	call	L3_TI1_Config
1429  002a 84            	pop	a
1430                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1432  002b 7b08          	ld	a,(OFST+6,sp)
1433  002d cd0000        	call	_TIM3_SetIC1Prescaler
1435                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1437  0030 7b09          	ld	a,(OFST+7,sp)
1438  0032 88            	push	a
1439  0033 7b03          	ld	a,(OFST+1,sp)
1440  0035 97            	ld	xl,a
1441  0036 7b02          	ld	a,(OFST+0,sp)
1442  0038 95            	ld	xh,a
1443  0039 cd0000        	call	L5_TI2_Config
1445  003c 84            	pop	a
1446                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1448  003d 7b08          	ld	a,(OFST+6,sp)
1449  003f cd0000        	call	_TIM3_SetIC2Prescaler
1452  0042 2024          	jra	L326
1453  0044               L126:
1454                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1454                     ; 503                TIM3_ICFilter);
1456  0044 7b09          	ld	a,(OFST+7,sp)
1457  0046 88            	push	a
1458  0047 7b08          	ld	a,(OFST+6,sp)
1459  0049 97            	ld	xl,a
1460  004a 7b05          	ld	a,(OFST+3,sp)
1461  004c 95            	ld	xh,a
1462  004d cd0000        	call	L5_TI2_Config
1464  0050 84            	pop	a
1465                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1467  0051 7b08          	ld	a,(OFST+6,sp)
1468  0053 cd0000        	call	_TIM3_SetIC2Prescaler
1470                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1472  0056 7b09          	ld	a,(OFST+7,sp)
1473  0058 88            	push	a
1474  0059 7b03          	ld	a,(OFST+1,sp)
1475  005b 97            	ld	xl,a
1476  005c 7b02          	ld	a,(OFST+0,sp)
1477  005e 95            	ld	xh,a
1478  005f cd0000        	call	L3_TI1_Config
1480  0062 84            	pop	a
1481                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1483  0063 7b08          	ld	a,(OFST+6,sp)
1484  0065 cd0000        	call	_TIM3_SetIC1Prescaler
1486  0068               L326:
1487                     ; 514 }
1490  0068 5b04          	addw	sp,#4
1491  006a 81            	ret	
1546                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1546                     ; 523 {
1547                     .text:	section	.text,new
1548  0000               _TIM3_Cmd:
1552                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1554                     ; 528   if (NewState != DISABLE)
1556  0000 4d            	tnz	a
1557  0001 2705          	jreq	L356
1558                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1560  0003 72105280      	bset	21120,#0
1563  0007 81            	ret	
1564  0008               L356:
1565                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1567  0008 72115280      	bres	21120,#0
1568                     ; 536 }
1571  000c 81            	ret	
1607                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1607                     ; 545 {
1608                     .text:	section	.text,new
1609  0000               _TIM3_CtrlPWMOutputs:
1613                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1615                     ; 551   if (NewState != DISABLE)
1617  0000 4d            	tnz	a
1618  0001 2705          	jreq	L576
1619                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1621  0003 721e5294      	bset	21140,#7
1624  0007 81            	ret	
1625  0008               L576:
1626                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1628  0008 721f5294      	bres	21140,#7
1629                     ; 559 }
1632  000c 81            	ret	
1718                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1718                     ; 575 {
1719                     .text:	section	.text,new
1720  0000               _TIM3_ITConfig:
1722  0000 89            	pushw	x
1723       00000000      OFST:	set	0
1726                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1728                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1730                     ; 580   if (NewState != DISABLE)
1732  0001 9f            	ld	a,xl
1733  0002 4d            	tnz	a
1734  0003 2706          	jreq	L147
1735                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1737  0005 9e            	ld	a,xh
1738  0006 ca5284        	or	a,21124
1740  0009 2006          	jra	L347
1741  000b               L147:
1742                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1744  000b 7b01          	ld	a,(OFST+1,sp)
1745  000d 43            	cpl	a
1746  000e c45284        	and	a,21124
1747  0011               L347:
1748  0011 c75284        	ld	21124,a
1749                     ; 590 }
1752  0014 85            	popw	x
1753  0015 81            	ret	
1777                     ; 597 void TIM3_InternalClockConfig(void)
1777                     ; 598 {
1778                     .text:	section	.text,new
1779  0000               _TIM3_InternalClockConfig:
1783                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1785  0000 c65282        	ld	a,21122
1786  0003 a4f8          	and	a,#248
1787  0005 c75282        	ld	21122,a
1788                     ; 601 }
1791  0008 81            	ret	
1908                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1908                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1908                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1908                     ; 622 {
1909                     .text:	section	.text,new
1910  0000               _TIM3_ETRClockMode1Config:
1912  0000 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1918  0001 7b05          	ld	a,(OFST+5,sp)
1919  0003 88            	push	a
1920  0004 7b02          	ld	a,(OFST+2,sp)
1921  0006 95            	ld	xh,a
1922  0007 cd0000        	call	_TIM3_ETRConfig
1924  000a 84            	pop	a
1925                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1927  000b c65282        	ld	a,21122
1928  000e a4f8          	and	a,#248
1929  0010 c75282        	ld	21122,a
1930                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1932  0013 c65282        	ld	a,21122
1933  0016 aa07          	or	a,#7
1934  0018 c75282        	ld	21122,a
1935                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1937  001b c65282        	ld	a,21122
1938  001e a48f          	and	a,#143
1939  0020 c75282        	ld	21122,a
1940                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1942  0023 c65282        	ld	a,21122
1943  0026 aa70          	or	a,#112
1944  0028 c75282        	ld	21122,a
1945                     ; 633 }
1948  002b 85            	popw	x
1949  002c 81            	ret	
2007                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2007                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2007                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2007                     ; 654 {
2008                     .text:	section	.text,new
2009  0000               _TIM3_ETRClockMode2Config:
2011  0000 89            	pushw	x
2012       00000000      OFST:	set	0
2015                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2017  0001 7b05          	ld	a,(OFST+5,sp)
2018  0003 88            	push	a
2019  0004 7b02          	ld	a,(OFST+2,sp)
2020  0006 95            	ld	xh,a
2021  0007 cd0000        	call	_TIM3_ETRConfig
2023  000a 721c5283      	bset	21123,#6
2024  000e 84            	pop	a
2025                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2027                     ; 660 }
2030  000f 85            	popw	x
2031  0010 81            	ret	
2087                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2087                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2087                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2087                     ; 681 {
2088                     .text:	section	.text,new
2089  0000               _TIM3_ETRConfig:
2091  0000 89            	pushw	x
2092       00000000      OFST:	set	0
2095                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2097                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2099                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2101                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2103  0001 9f            	ld	a,xl
2104  0002 1a01          	or	a,(OFST+1,sp)
2105  0004 1a05          	or	a,(OFST+5,sp)
2106  0006 ca5283        	or	a,21123
2107  0009 c75283        	ld	21123,a
2108                     ; 688 }
2111  000c 85            	popw	x
2112  000d 81            	ret	
2201                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2201                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2201                     ; 707                                  uint8_t TIM3_ICFilter)
2201                     ; 708 {
2202                     .text:	section	.text,new
2203  0000               _TIM3_TIxExternalClockConfig:
2205  0000 89            	pushw	x
2206       00000000      OFST:	set	0
2209                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2211                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2213                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2215                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2217  0001 9e            	ld	a,xh
2218  0002 a160          	cp	a,#96
2219  0004 260e          	jrne	L3411
2220                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2222  0006 7b05          	ld	a,(OFST+5,sp)
2223  0008 88            	push	a
2224  0009 ae0001        	ldw	x,#1
2225  000c 7b03          	ld	a,(OFST+3,sp)
2226  000e 95            	ld	xh,a
2227  000f cd0000        	call	L5_TI2_Config
2230  0012 200c          	jra	L5411
2231  0014               L3411:
2232                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2234  0014 7b05          	ld	a,(OFST+5,sp)
2235  0016 88            	push	a
2236  0017 ae0001        	ldw	x,#1
2237  001a 7b03          	ld	a,(OFST+3,sp)
2238  001c 95            	ld	xh,a
2239  001d cd0000        	call	L3_TI1_Config
2241  0020               L5411:
2242  0020 84            	pop	a
2243                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2245  0021 7b01          	ld	a,(OFST+1,sp)
2246  0023 cd0000        	call	_TIM3_SelectInputTrigger
2248                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2250  0026 c65282        	ld	a,21122
2251  0029 aa07          	or	a,#7
2252  002b c75282        	ld	21122,a
2253                     ; 729 }
2256  002e 85            	popw	x
2257  002f 81            	ret	
2357                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2357                     ; 746 {
2358                     .text:	section	.text,new
2359  0000               _TIM3_SelectInputTrigger:
2361  0000 88            	push	a
2362  0001 88            	push	a
2363       00000001      OFST:	set	1
2366                     ; 747   uint8_t tmpsmcr = 0;
2368                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2370                     ; 752   tmpsmcr = TIM3->SMCR;
2372  0002 c65282        	ld	a,21122
2373                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2375  0005 a48f          	and	a,#143
2376                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2378  0007 1a02          	or	a,(OFST+1,sp)
2379                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2381  0009 c75282        	ld	21122,a
2382                     ; 759 }
2385  000c 85            	popw	x
2386  000d 81            	ret	
2422                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2422                     ; 768 {
2423                     .text:	section	.text,new
2424  0000               _TIM3_UpdateDisableConfig:
2428                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2430                     ; 773   if (NewState != DISABLE)
2432  0000 4d            	tnz	a
2433  0001 2705          	jreq	L7221
2434                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2436  0003 72125280      	bset	21120,#1
2439  0007 81            	ret	
2440  0008               L7221:
2441                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2443  0008 72135280      	bres	21120,#1
2444                     ; 781 }
2447  000c 81            	ret	
2505                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2505                     ; 792 {
2506                     .text:	section	.text,new
2507  0000               _TIM3_UpdateRequestConfig:
2511                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2513                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2515  0000 4a            	dec	a
2516  0001 2605          	jrne	L1621
2517                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2519  0003 72145280      	bset	21120,#2
2522  0007 81            	ret	
2523  0008               L1621:
2524                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2526  0008 72155280      	bres	21120,#2
2527                     ; 805 }
2530  000c 81            	ret	
2566                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2566                     ; 814 {
2567                     .text:	section	.text,new
2568  0000               _TIM3_SelectHallSensor:
2572                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2574                     ; 819   if (NewState != DISABLE)
2576  0000 4d            	tnz	a
2577  0001 2705          	jreq	L3031
2578                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2580  0003 721e5281      	bset	21121,#7
2583  0007 81            	ret	
2584  0008               L3031:
2585                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2587  0008 721f5281      	bres	21121,#7
2588                     ; 827 }
2591  000c 81            	ret	
2648                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2648                     ; 838 {
2649                     .text:	section	.text,new
2650  0000               _TIM3_SelectOnePulseMode:
2654                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2656                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2658  0000 4a            	dec	a
2659  0001 2605          	jrne	L5331
2660                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2662  0003 72165280      	bset	21120,#3
2665  0007 81            	ret	
2666  0008               L5331:
2667                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2669  0008 72175280      	bres	21120,#3
2670                     ; 851 }
2673  000c 81            	ret	
2772                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2772                     ; 866 {
2773                     .text:	section	.text,new
2774  0000               _TIM3_SelectOutputTrigger:
2776  0000 88            	push	a
2777  0001 88            	push	a
2778       00000001      OFST:	set	1
2781                     ; 867   uint8_t tmpcr2 = 0;
2783                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2785                     ; 872   tmpcr2 = TIM3->CR2;
2787  0002 c65281        	ld	a,21121
2788                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2790  0005 a48f          	and	a,#143
2791                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2793  0007 1a02          	or	a,(OFST+1,sp)
2794                     ; 880   TIM3->CR2 = tmpcr2;
2796  0009 c75281        	ld	21121,a
2797                     ; 881 }
2800  000c 85            	popw	x
2801  000d 81            	ret	
2884                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2884                     ; 894 {
2885                     .text:	section	.text,new
2886  0000               _TIM3_SelectSlaveMode:
2888  0000 88            	push	a
2889  0001 88            	push	a
2890       00000001      OFST:	set	1
2893                     ; 895   uint8_t tmpsmcr = 0;
2895                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2897                     ; 900   tmpsmcr = TIM3->SMCR;
2899  0002 c65282        	ld	a,21122
2900                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2902  0005 a4f8          	and	a,#248
2903                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2905  0007 1a02          	or	a,(OFST+1,sp)
2906                     ; 908   TIM3->SMCR = tmpsmcr;
2908  0009 c75282        	ld	21122,a
2909                     ; 909 }
2912  000c 85            	popw	x
2913  000d 81            	ret	
2949                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2949                     ; 918 {
2950                     .text:	section	.text,new
2951  0000               _TIM3_SelectMasterSlaveMode:
2955                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2957                     ; 923   if (NewState != DISABLE)
2959  0000 4d            	tnz	a
2960  0001 2705          	jreq	L7541
2961                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
2963  0003 721e5282      	bset	21122,#7
2966  0007 81            	ret	
2967  0008               L7541:
2968                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2970  0008 721f5282      	bres	21122,#7
2971                     ; 931 }
2974  000c 81            	ret	
3087                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3087                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3087                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3087                     ; 953 {
3088                     .text:	section	.text,new
3089  0000               _TIM3_EncoderInterfaceConfig:
3091  0000 89            	pushw	x
3092  0001 5203          	subw	sp,#3
3093       00000003      OFST:	set	3
3096                     ; 954   uint8_t tmpsmcr = 0;
3098                     ; 955   uint8_t tmpccmr1 = 0;
3100                     ; 956   uint8_t tmpccmr2 = 0;
3102                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3104                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3106                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3108                     ; 963   tmpsmcr = TIM3->SMCR;
3110  0003 c65282        	ld	a,21122
3111  0006 6b01          	ld	(OFST-2,sp),a
3112                     ; 964   tmpccmr1 = TIM3->CCMR1;
3114  0008 c65288        	ld	a,21128
3115  000b 6b02          	ld	(OFST-1,sp),a
3116                     ; 965   tmpccmr2 = TIM3->CCMR2;
3118  000d c65289        	ld	a,21129
3119  0010 6b03          	ld	(OFST+0,sp),a
3120                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3122  0012 7b01          	ld	a,(OFST-2,sp)
3123  0014 a4f0          	and	a,#240
3124  0016 6b01          	ld	(OFST-2,sp),a
3125                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3127  0018 9e            	ld	a,xh
3128  0019 1a01          	or	a,(OFST-2,sp)
3129  001b 6b01          	ld	(OFST-2,sp),a
3130                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3132  001d 7b02          	ld	a,(OFST-1,sp)
3133  001f a4fc          	and	a,#252
3134  0021 6b02          	ld	(OFST-1,sp),a
3135                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3137  0023 7b03          	ld	a,(OFST+0,sp)
3138  0025 a4fc          	and	a,#252
3139  0027 6b03          	ld	(OFST+0,sp),a
3140                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3142  0029 7b02          	ld	a,(OFST-1,sp)
3143  002b aa01          	or	a,#1
3144  002d 6b02          	ld	(OFST-1,sp),a
3145                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3147  002f 7b03          	ld	a,(OFST+0,sp)
3148  0031 aa01          	or	a,#1
3149  0033 6b03          	ld	(OFST+0,sp),a
3150                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3152  0035 9f            	ld	a,xl
3153  0036 4a            	dec	a
3154  0037 2606          	jrne	L7351
3155                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3157  0039 7212528a      	bset	21130,#1
3159  003d 2004          	jra	L1451
3160  003f               L7351:
3161                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3163  003f 7213528a      	bres	21130,#1
3164  0043               L1451:
3165                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3167  0043 7b08          	ld	a,(OFST+5,sp)
3168  0045 4a            	dec	a
3169  0046 2606          	jrne	L3451
3170                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3172  0048 721a528a      	bset	21130,#5
3174  004c 2004          	jra	L5451
3175  004e               L3451:
3176                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3178  004e 721b528a      	bres	21130,#5
3179  0052               L5451:
3180                     ; 996   TIM3->SMCR = tmpsmcr;
3182  0052 7b01          	ld	a,(OFST-2,sp)
3183  0054 c75282        	ld	21122,a
3184                     ; 997   TIM3->CCMR1 = tmpccmr1;
3186  0057 7b02          	ld	a,(OFST-1,sp)
3187  0059 c75288        	ld	21128,a
3188                     ; 998   TIM3->CCMR2 = tmpccmr2;
3190  005c 7b03          	ld	a,(OFST+0,sp)
3191  005e c75289        	ld	21129,a
3192                     ; 999 }
3195  0061 5b05          	addw	sp,#5
3196  0063 81            	ret	
3264                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3264                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3264                     ; 1021 {
3265                     .text:	section	.text,new
3266  0000               _TIM3_PrescalerConfig:
3270                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3272                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3274                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3276  0000 9e            	ld	a,xh
3277  0001 c7528d        	ld	21133,a
3278                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3280  0004 9f            	ld	a,xl
3281  0005 4a            	dec	a
3282  0006 2605          	jrne	L1061
3283                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3285  0008 72105287      	bset	21127,#0
3288  000c 81            	ret	
3289  000d               L1061:
3290                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3292  000d 72115287      	bres	21127,#0
3293                     ; 1039 }
3296  0011 81            	ret	
3341                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3341                     ; 1053 {
3342                     .text:	section	.text,new
3343  0000               _TIM3_CounterModeConfig:
3345  0000 88            	push	a
3346  0001 88            	push	a
3347       00000001      OFST:	set	1
3350                     ; 1054   uint8_t tmpcr1 = 0;
3352                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3354                     ; 1059   tmpcr1 = TIM3->CR1;
3356  0002 c65280        	ld	a,21120
3357                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3359  0005 a48f          	and	a,#143
3360                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3362  0007 1a02          	or	a,(OFST+1,sp)
3363                     ; 1067   TIM3->CR1 = tmpcr1;
3365  0009 c75280        	ld	21120,a
3366                     ; 1068 }
3369  000c 85            	popw	x
3370  000d 81            	ret	
3437                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3437                     ; 1079 {
3438                     .text:	section	.text,new
3439  0000               _TIM3_ForcedOC1Config:
3441  0000 88            	push	a
3442  0001 88            	push	a
3443       00000001      OFST:	set	1
3446                     ; 1080   uint8_t tmpccmr1 = 0;
3448                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3450                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3452  0002 c65288        	ld	a,21128
3453                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3455  0005 a48f          	and	a,#143
3456                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3458  0007 1a02          	or	a,(OFST+1,sp)
3459                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3461  0009 c75288        	ld	21128,a
3462                     ; 1094 }
3465  000c 85            	popw	x
3466  000d 81            	ret	
3511                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3511                     ; 1105 {
3512                     .text:	section	.text,new
3513  0000               _TIM3_ForcedOC2Config:
3515  0000 88            	push	a
3516  0001 88            	push	a
3517       00000001      OFST:	set	1
3520                     ; 1106   uint8_t tmpccmr2 = 0;
3522                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3524                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3526  0002 c65289        	ld	a,21129
3527                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3529  0005 a48f          	and	a,#143
3530                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3532  0007 1a02          	or	a,(OFST+1,sp)
3533                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3535  0009 c75289        	ld	21129,a
3536                     ; 1120 }
3539  000c 85            	popw	x
3540  000d 81            	ret	
3576                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3576                     ; 1129 {
3577                     .text:	section	.text,new
3578  0000               _TIM3_ARRPreloadConfig:
3582                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3584                     ; 1134   if (NewState != DISABLE)
3586  0000 4d            	tnz	a
3587  0001 2705          	jreq	L1271
3588                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3590  0003 721e5280      	bset	21120,#7
3593  0007 81            	ret	
3594  0008               L1271:
3595                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3597  0008 721f5280      	bres	21120,#7
3598                     ; 1142 }
3601  000c 81            	ret	
3637                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3637                     ; 1151 {
3638                     .text:	section	.text,new
3639  0000               _TIM3_OC1PreloadConfig:
3643                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3645                     ; 1156   if (NewState != DISABLE)
3647  0000 4d            	tnz	a
3648  0001 2705          	jreq	L3471
3649                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3651  0003 72165288      	bset	21128,#3
3654  0007 81            	ret	
3655  0008               L3471:
3656                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3658  0008 72175288      	bres	21128,#3
3659                     ; 1164 }
3662  000c 81            	ret	
3698                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3698                     ; 1173 {
3699                     .text:	section	.text,new
3700  0000               _TIM3_OC2PreloadConfig:
3704                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3706                     ; 1178   if (NewState != DISABLE)
3708  0000 4d            	tnz	a
3709  0001 2705          	jreq	L5671
3710                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3712  0003 72165289      	bset	21129,#3
3715  0007 81            	ret	
3716  0008               L5671:
3717                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3719  0008 72175289      	bres	21129,#3
3720                     ; 1186 }
3723  000c 81            	ret	
3758                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3758                     ; 1195 {
3759                     .text:	section	.text,new
3760  0000               _TIM3_OC1FastCmd:
3764                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3766                     ; 1200   if (NewState != DISABLE)
3768  0000 4d            	tnz	a
3769  0001 2705          	jreq	L7002
3770                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3772  0003 72145288      	bset	21128,#2
3775  0007 81            	ret	
3776  0008               L7002:
3777                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3779  0008 72155288      	bres	21128,#2
3780                     ; 1208 }
3783  000c 81            	ret	
3818                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3818                     ; 1217 {
3819                     .text:	section	.text,new
3820  0000               _TIM3_OC2FastCmd:
3824                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3826                     ; 1222   if (NewState != DISABLE)
3828  0000 4d            	tnz	a
3829  0001 2705          	jreq	L1302
3830                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3832  0003 72145289      	bset	21129,#2
3835  0007 81            	ret	
3836  0008               L1302:
3837                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3839  0008 72155289      	bres	21129,#2
3840                     ; 1230 }
3843  000c 81            	ret	
3924                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3924                     ; 1244 {
3925                     .text:	section	.text,new
3926  0000               _TIM3_GenerateEvent:
3930                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3932                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3934  0000 ca5287        	or	a,21127
3935  0003 c75287        	ld	21127,a
3936                     ; 1250 }
3939  0006 81            	ret	
3975                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
3975                     ; 1261 {
3976                     .text:	section	.text,new
3977  0000               _TIM3_OC1PolarityConfig:
3981                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
3983                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
3985  0000 4a            	dec	a
3986  0001 2605          	jrne	L7012
3987                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3989  0003 7212528a      	bset	21130,#1
3992  0007 81            	ret	
3993  0008               L7012:
3994                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3996  0008 7213528a      	bres	21130,#1
3997                     ; 1274 }
4000  000c 81            	ret	
4036                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4036                     ; 1285 {
4037                     .text:	section	.text,new
4038  0000               _TIM3_OC2PolarityConfig:
4042                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4044                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4046  0000 4a            	dec	a
4047  0001 2605          	jrne	L1312
4048                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4050  0003 721a528a      	bset	21130,#5
4053  0007 81            	ret	
4054  0008               L1312:
4055                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4057  0008 721b528a      	bres	21130,#5
4058                     ; 1298 }
4061  000c 81            	ret	
4106                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4106                     ; 1311                  FunctionalState NewState)
4106                     ; 1312 {
4107                     .text:	section	.text,new
4108  0000               _TIM3_CCxCmd:
4110  0000 89            	pushw	x
4111       00000000      OFST:	set	0
4114                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4116                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4118                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4120  0001 9e            	ld	a,xh
4121  0002 4d            	tnz	a
4122  0003 2610          	jrne	L7512
4123                     ; 1320     if (NewState != DISABLE)
4125  0005 9f            	ld	a,xl
4126  0006 4d            	tnz	a
4127  0007 2706          	jreq	L1612
4128                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4130  0009 7210528a      	bset	21130,#0
4132  000d 2014          	jra	L5612
4133  000f               L1612:
4134                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4136  000f 7211528a      	bres	21130,#0
4137  0013 200e          	jra	L5612
4138  0015               L7512:
4139                     ; 1333     if (NewState != DISABLE)
4141  0015 7b02          	ld	a,(OFST+2,sp)
4142  0017 2706          	jreq	L7612
4143                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4145  0019 7218528a      	bset	21130,#4
4147  001d 2004          	jra	L5612
4148  001f               L7612:
4149                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4151  001f 7219528a      	bres	21130,#4
4152  0023               L5612:
4153                     ; 1343 }
4156  0023 85            	popw	x
4157  0024 81            	ret	
4202                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4202                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4202                     ; 1364 {
4203                     .text:	section	.text,new
4204  0000               _TIM3_SelectOCxM:
4206  0000 89            	pushw	x
4207       00000000      OFST:	set	0
4210                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4212                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4214                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4216  0001 9e            	ld	a,xh
4217  0002 4d            	tnz	a
4218  0003 2615          	jrne	L5122
4219                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4221  0005 7211528a      	bres	21130,#0
4222                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4224  0009 c65288        	ld	a,21128
4225  000c a48f          	and	a,#143
4226  000e c75288        	ld	21128,a
4227                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4229  0011 9f            	ld	a,xl
4230  0012 ca5288        	or	a,21128
4231  0015 c75288        	ld	21128,a
4233  0018 2014          	jra	L7122
4234  001a               L5122:
4235                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4237  001a 7219528a      	bres	21130,#4
4238                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4240  001e c65289        	ld	a,21129
4241  0021 a48f          	and	a,#143
4242  0023 c75289        	ld	21129,a
4243                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4245  0026 c65289        	ld	a,21129
4246  0029 1a02          	or	a,(OFST+2,sp)
4247  002b c75289        	ld	21129,a
4248  002e               L7122:
4249                     ; 1391 }
4252  002e 85            	popw	x
4253  002f 81            	ret	
4287                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4287                     ; 1400 {
4288                     .text:	section	.text,new
4289  0000               _TIM3_SetCounter:
4293                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4295  0000 9e            	ld	a,xh
4296  0001 c7528b        	ld	21131,a
4297                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4299  0004 9f            	ld	a,xl
4300  0005 c7528c        	ld	21132,a
4301                     ; 1405 }
4304  0008 81            	ret	
4338                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4338                     ; 1414 {
4339                     .text:	section	.text,new
4340  0000               _TIM3_SetAutoreload:
4344                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4346  0000 9e            	ld	a,xh
4347  0001 c7528e        	ld	21134,a
4348                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4350  0004 9f            	ld	a,xl
4351  0005 c7528f        	ld	21135,a
4352                     ; 1418 }
4355  0008 81            	ret	
4389                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4389                     ; 1427 {
4390                     .text:	section	.text,new
4391  0000               _TIM3_SetCompare1:
4395                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4397  0000 9e            	ld	a,xh
4398  0001 c75290        	ld	21136,a
4399                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4401  0004 9f            	ld	a,xl
4402  0005 c75291        	ld	21137,a
4403                     ; 1431 }
4406  0008 81            	ret	
4440                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4440                     ; 1440 {
4441                     .text:	section	.text,new
4442  0000               _TIM3_SetCompare2:
4446                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4448  0000 9e            	ld	a,xh
4449  0001 c75292        	ld	21138,a
4450                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4452  0004 9f            	ld	a,xl
4453  0005 c75293        	ld	21139,a
4454                     ; 1444 }
4457  0008 81            	ret	
4502                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4502                     ; 1457 {
4503                     .text:	section	.text,new
4504  0000               _TIM3_SetIC1Prescaler:
4506  0000 88            	push	a
4507  0001 88            	push	a
4508       00000001      OFST:	set	1
4511                     ; 1458   uint8_t tmpccmr1 = 0;
4513                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4515                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4517  0002 c65288        	ld	a,21128
4518                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4520  0005 a4f3          	and	a,#243
4521                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4523  0007 1a02          	or	a,(OFST+1,sp)
4524                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4526  0009 c75288        	ld	21128,a
4527                     ; 1472 }
4530  000c 85            	popw	x
4531  000d 81            	ret	
4576                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4576                     ; 1485 {
4577                     .text:	section	.text,new
4578  0000               _TIM3_SetIC2Prescaler:
4580  0000 88            	push	a
4581  0001 88            	push	a
4582       00000001      OFST:	set	1
4585                     ; 1486   uint8_t tmpccmr2 = 0;
4587                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4589                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4591  0002 c65289        	ld	a,21129
4592                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4594  0005 a4f3          	and	a,#243
4595                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4597  0007 1a02          	or	a,(OFST+1,sp)
4598                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4600  0009 c75289        	ld	21129,a
4601                     ; 1500 }
4604  000c 85            	popw	x
4605  000d 81            	ret	
4657                     ; 1507 uint16_t TIM3_GetCapture1(void)
4657                     ; 1508 {
4658                     .text:	section	.text,new
4659  0000               _TIM3_GetCapture1:
4661  0000 5204          	subw	sp,#4
4662       00000004      OFST:	set	4
4665                     ; 1509   uint16_t tmpccr1 = 0;
4667                     ; 1512   tmpccr1h = TIM3->CCR1H;
4669  0002 c65290        	ld	a,21136
4670  0005 6b02          	ld	(OFST-2,sp),a
4671                     ; 1513   tmpccr1l = TIM3->CCR1L;
4673  0007 c65291        	ld	a,21137
4674  000a 6b01          	ld	(OFST-3,sp),a
4675                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4677  000c 5f            	clrw	x
4678  000d 97            	ld	xl,a
4679  000e 1f03          	ldw	(OFST-1,sp),x
4680                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4682  0010 5f            	clrw	x
4683  0011 7b02          	ld	a,(OFST-2,sp)
4684  0013 97            	ld	xl,a
4685  0014 7b04          	ld	a,(OFST+0,sp)
4686  0016 01            	rrwa	x,a
4687  0017 1a03          	or	a,(OFST-1,sp)
4688  0019 01            	rrwa	x,a
4689                     ; 1518   return ((uint16_t)tmpccr1);
4693  001a 5b04          	addw	sp,#4
4694  001c 81            	ret	
4746                     ; 1526 uint16_t TIM3_GetCapture2(void)
4746                     ; 1527 {
4747                     .text:	section	.text,new
4748  0000               _TIM3_GetCapture2:
4750  0000 5204          	subw	sp,#4
4751       00000004      OFST:	set	4
4754                     ; 1528   uint16_t tmpccr2 = 0;
4756                     ; 1531   tmpccr2h = TIM3->CCR2H;
4758  0002 c65292        	ld	a,21138
4759  0005 6b02          	ld	(OFST-2,sp),a
4760                     ; 1532   tmpccr2l = TIM3->CCR2L;
4762  0007 c65293        	ld	a,21139
4763  000a 6b01          	ld	(OFST-3,sp),a
4764                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4766  000c 5f            	clrw	x
4767  000d 97            	ld	xl,a
4768  000e 1f03          	ldw	(OFST-1,sp),x
4769                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4771  0010 5f            	clrw	x
4772  0011 7b02          	ld	a,(OFST-2,sp)
4773  0013 97            	ld	xl,a
4774  0014 7b04          	ld	a,(OFST+0,sp)
4775  0016 01            	rrwa	x,a
4776  0017 1a03          	or	a,(OFST-1,sp)
4777  0019 01            	rrwa	x,a
4778                     ; 1537   return ((uint16_t)tmpccr2);
4782  001a 5b04          	addw	sp,#4
4783  001c 81            	ret	
4835                     ; 1545 uint16_t TIM3_GetCounter(void)
4835                     ; 1546 {
4836                     .text:	section	.text,new
4837  0000               _TIM3_GetCounter:
4839  0000 5204          	subw	sp,#4
4840       00000004      OFST:	set	4
4843                     ; 1547   uint16_t tmpcnt = 0;
4845                     ; 1550   tmpcntrh = TIM3->CNTRH;
4847  0002 c6528b        	ld	a,21131
4848  0005 6b02          	ld	(OFST-2,sp),a
4849                     ; 1551   tmpcntrl = TIM3->CNTRL;
4851  0007 c6528c        	ld	a,21132
4852  000a 6b01          	ld	(OFST-3,sp),a
4853                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4855  000c 5f            	clrw	x
4856  000d 97            	ld	xl,a
4857  000e 1f03          	ldw	(OFST-1,sp),x
4858                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4860  0010 5f            	clrw	x
4861  0011 7b02          	ld	a,(OFST-2,sp)
4862  0013 97            	ld	xl,a
4863  0014 7b04          	ld	a,(OFST+0,sp)
4864  0016 01            	rrwa	x,a
4865  0017 1a03          	or	a,(OFST-1,sp)
4866  0019 01            	rrwa	x,a
4867                     ; 1556   return ((uint16_t)tmpcnt);
4871  001a 5b04          	addw	sp,#4
4872  001c 81            	ret	
4896                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4896                     ; 1573 {
4897                     .text:	section	.text,new
4898  0000               _TIM3_GetPrescaler:
4902                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4904  0000 c6528d        	ld	a,21133
4907  0003 81            	ret	
5046                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5046                     ; 1592 {
5047                     .text:	section	.text,new
5048  0000               _TIM3_GetFlagStatus:
5050  0000 89            	pushw	x
5051  0001 89            	pushw	x
5052       00000002      OFST:	set	2
5055                     ; 1593   FlagStatus bitstatus = RESET;
5057                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5059                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5061  0002 9f            	ld	a,xl
5062  0003 c45285        	and	a,21125
5063  0006 6b01          	ld	(OFST-1,sp),a
5064                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5066  0008 c65286        	ld	a,21126
5067  000b 1403          	and	a,(OFST+1,sp)
5068  000d 6b02          	ld	(OFST+0,sp),a
5069                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5071  000f 1a01          	or	a,(OFST-1,sp)
5072  0011 2702          	jreq	L3552
5073                     ; 1604     bitstatus = SET;
5075  0013 a601          	ld	a,#1
5077  0015               L3552:
5078                     ; 1608     bitstatus = RESET;
5080                     ; 1610   return ((FlagStatus)bitstatus);
5084  0015 5b04          	addw	sp,#4
5085  0017 81            	ret	
5120                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5120                     ; 1625 {
5121                     .text:	section	.text,new
5122  0000               _TIM3_ClearFlag:
5124  0000 89            	pushw	x
5125       00000000      OFST:	set	0
5128                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5130                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5132  0001 9f            	ld	a,xl
5133  0002 43            	cpl	a
5134  0003 c75285        	ld	21125,a
5135                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5137  0006 7b01          	ld	a,(OFST+1,sp)
5138  0008 43            	cpl	a
5139  0009 c75286        	ld	21126,a
5140                     ; 1631 }
5143  000c 85            	popw	x
5144  000d 81            	ret	
5208                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5208                     ; 1645 {
5209                     .text:	section	.text,new
5210  0000               _TIM3_GetITStatus:
5212  0000 88            	push	a
5213  0001 5203          	subw	sp,#3
5214       00000003      OFST:	set	3
5217                     ; 1646   __IO ITStatus bitstatus = RESET;
5219  0003 0f03          	clr	(OFST+0,sp)
5220                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5222  0005 0f01          	clr	(OFST-2,sp)
5225  0007 0f02          	clr	(OFST-1,sp)
5226                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5228                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5230  0009 c45285        	and	a,21125
5231  000c 6b01          	ld	(OFST-2,sp),a
5232                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5234  000e c65284        	ld	a,21124
5235  0011 1404          	and	a,(OFST+1,sp)
5236  0013 6b02          	ld	(OFST-1,sp),a
5237                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5239  0015 0d01          	tnz	(OFST-2,sp)
5240  0017 270a          	jreq	L7262
5242  0019 0d02          	tnz	(OFST-1,sp)
5243  001b 2706          	jreq	L7262
5244                     ; 1659     bitstatus = (ITStatus)SET;
5246  001d a601          	ld	a,#1
5247  001f 6b03          	ld	(OFST+0,sp),a
5249  0021 2002          	jra	L1362
5250  0023               L7262:
5251                     ; 1663     bitstatus = (ITStatus)RESET;
5253  0023 0f03          	clr	(OFST+0,sp)
5254  0025               L1362:
5255                     ; 1665   return ((ITStatus)bitstatus);
5257  0025 7b03          	ld	a,(OFST+0,sp)
5260  0027 5b04          	addw	sp,#4
5261  0029 81            	ret	
5297                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5297                     ; 1680 {
5298                     .text:	section	.text,new
5299  0000               _TIM3_ClearITPendingBit:
5303                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5305                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5307  0000 43            	cpl	a
5308  0001 c75285        	ld	21125,a
5309                     ; 1686 }
5312  0004 81            	ret	
5384                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5384                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5384                     ; 1705                        uint8_t TIM3_ICFilter)
5384                     ; 1706 {
5385                     .text:	section	.text,new
5386  0000               L3_TI1_Config:
5388  0000 89            	pushw	x
5389  0001 89            	pushw	x
5390       00000002      OFST:	set	2
5393                     ; 1707   uint8_t tmpccmr1 = 0;
5395                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5397  0002 9e            	ld	a,xh
5398  0003 6b01          	ld	(OFST-1,sp),a
5399                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5401  0005 c65288        	ld	a,21128
5402  0008 6b02          	ld	(OFST+0,sp),a
5403                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5405                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5407                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5409                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5411  000a 7211528a      	bres	21130,#0
5412                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5414  000e a40c          	and	a,#12
5415  0010 6b02          	ld	(OFST+0,sp),a
5416                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5418  0012 7b07          	ld	a,(OFST+5,sp)
5419  0014 97            	ld	xl,a
5420  0015 a610          	ld	a,#16
5421  0017 42            	mul	x,a
5422  0018 9f            	ld	a,xl
5423  0019 1a04          	or	a,(OFST+2,sp)
5424  001b 1a02          	or	a,(OFST+0,sp)
5425  001d 6b02          	ld	(OFST+0,sp),a
5426                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5428  001f c75288        	ld	21128,a
5429                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5431  0022 7b01          	ld	a,(OFST-1,sp)
5432  0024 4a            	dec	a
5433  0025 2606          	jrne	L7072
5434                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5436  0027 7212528a      	bset	21130,#1
5438  002b 2004          	jra	L1172
5439  002d               L7072:
5440                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5442  002d 7213528a      	bres	21130,#1
5443  0031               L1172:
5444                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5446  0031 7210528a      	bset	21130,#0
5447                     ; 1737 }
5450  0035 5b04          	addw	sp,#4
5451  0037 81            	ret	
5523                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5523                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5523                     ; 1756                        uint8_t TIM3_ICFilter)
5523                     ; 1757 {
5524                     .text:	section	.text,new
5525  0000               L5_TI2_Config:
5527  0000 89            	pushw	x
5528  0001 89            	pushw	x
5529       00000002      OFST:	set	2
5532                     ; 1758   uint8_t tmpccmr2 = 0;
5534                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5536  0002 9e            	ld	a,xh
5537  0003 6b01          	ld	(OFST-1,sp),a
5538                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5540                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5542                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5544                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5546  0005 c65289        	ld	a,21129
5547  0008 6b02          	ld	(OFST+0,sp),a
5548                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5550  000a 7219528a      	bres	21130,#4
5551                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5553  000e a40c          	and	a,#12
5554  0010 6b02          	ld	(OFST+0,sp),a
5555                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5557  0012 7b07          	ld	a,(OFST+5,sp)
5558  0014 97            	ld	xl,a
5559  0015 a610          	ld	a,#16
5560  0017 42            	mul	x,a
5561  0018 9f            	ld	a,xl
5562  0019 1a04          	or	a,(OFST+2,sp)
5563  001b 1a02          	or	a,(OFST+0,sp)
5564  001d 6b02          	ld	(OFST+0,sp),a
5565                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5567  001f c75289        	ld	21129,a
5568                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5570  0022 7b01          	ld	a,(OFST-1,sp)
5571  0024 4a            	dec	a
5572  0025 2606          	jrne	L1572
5573                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5575  0027 721a528a      	bset	21130,#5
5577  002b 2004          	jra	L3572
5578  002d               L1572:
5579                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5581  002d 721b528a      	bres	21130,#5
5582  0031               L3572:
5583                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5585  0031 7218528a      	bset	21130,#4
5586                     ; 1789 }
5589  0035 5b04          	addw	sp,#4
5590  0037 81            	ret	
5614                     ; 1797 FunctionalState TIM3_GetStatus(void)
5614                     ; 1798 {
5615                     .text:	section	.text,new
5616  0000               _TIM3_GetStatus:
5620                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5622  0000 c65280        	ld	a,21120
5623  0003 a401          	and	a,#1
5626  0005 81            	ret	
5639                     	xdef	_TIM3_ClearITPendingBit
5640                     	xdef	_TIM3_GetITStatus
5641                     	xdef	_TIM3_ClearFlag
5642                     	xdef	_TIM3_GetFlagStatus
5643                     	xdef	_TIM3_GetPrescaler
5644                     	xdef	_TIM3_GetCounter
5645                     	xdef	_TIM3_GetCapture2
5646                     	xdef	_TIM3_GetCapture1
5647                     	xdef	_TIM3_SetIC2Prescaler
5648                     	xdef	_TIM3_SetIC1Prescaler
5649                     	xdef	_TIM3_SetCompare2
5650                     	xdef	_TIM3_SetCompare1
5651                     	xdef	_TIM3_SetAutoreload
5652                     	xdef	_TIM3_SetCounter
5653                     	xdef	_TIM3_SelectOCxM
5654                     	xdef	_TIM3_CCxCmd
5655                     	xdef	_TIM3_OC2PolarityConfig
5656                     	xdef	_TIM3_OC1PolarityConfig
5657                     	xdef	_TIM3_GenerateEvent
5658                     	xdef	_TIM3_OC2FastCmd
5659                     	xdef	_TIM3_OC1FastCmd
5660                     	xdef	_TIM3_OC2PreloadConfig
5661                     	xdef	_TIM3_OC1PreloadConfig
5662                     	xdef	_TIM3_ARRPreloadConfig
5663                     	xdef	_TIM3_ForcedOC2Config
5664                     	xdef	_TIM3_ForcedOC1Config
5665                     	xdef	_TIM3_CounterModeConfig
5666                     	xdef	_TIM3_PrescalerConfig
5667                     	xdef	_TIM3_EncoderInterfaceConfig
5668                     	xdef	_TIM3_SelectMasterSlaveMode
5669                     	xdef	_TIM3_SelectSlaveMode
5670                     	xdef	_TIM3_SelectOutputTrigger
5671                     	xdef	_TIM3_SelectOnePulseMode
5672                     	xdef	_TIM3_SelectHallSensor
5673                     	xdef	_TIM3_UpdateRequestConfig
5674                     	xdef	_TIM3_UpdateDisableConfig
5675                     	xdef	_TIM3_SelectInputTrigger
5676                     	xdef	_TIM3_TIxExternalClockConfig
5677                     	xdef	_TIM3_ETRConfig
5678                     	xdef	_TIM3_ETRClockMode2Config
5679                     	xdef	_TIM3_ETRClockMode1Config
5680                     	xdef	_TIM3_InternalClockConfig
5681                     	xdef	_TIM3_ITConfig
5682                     	xdef	_TIM3_CtrlPWMOutputs
5683                     	xdef	_TIM3_GetStatus
5684                     	xdef	_TIM3_Cmd
5685                     	xdef	_TIM3_PWMIConfig
5686                     	xdef	_TIM3_ICInit
5687                     	xdef	_TIM3_BKRConfig
5688                     	xdef	_TIM3_OC2Init
5689                     	xdef	_TIM3_OC1Init
5690                     	xdef	_TIM3_TimeBaseInit
5691                     	xdef	_TIM3_DeInit
5710                     	end
