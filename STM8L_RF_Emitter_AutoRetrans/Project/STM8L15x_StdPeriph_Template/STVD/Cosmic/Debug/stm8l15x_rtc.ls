   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
 103                     ; 229 ErrorStatus RTC_DeInit(void)
 103                     ; 230 {
 105                     .text:	section	.text,new
 106  0000               _RTC_DeInit:
 108  0000 5205          	subw	sp,#5
 109       00000005      OFST:	set	5
 112                     ; 231   ErrorStatus status = ERROR;
 114                     ; 232   uint16_t wutwfcount = 0;
 116  0002 5f            	clrw	x
 117  0003 1f02          	ldw	(OFST-3,sp),x
 118                     ; 233   uint16_t recalpfcount = 0;
 120  0005 1f04          	ldw	(OFST-1,sp),x
 121                     ; 236   RTC->WPR = 0xCA;
 123  0007 35ca5159      	mov	20825,#202
 124                     ; 237   RTC->WPR = 0x53;
 126  000b 35535159      	mov	20825,#83
 127                     ; 240   if (RTC_EnterInitMode() == ERROR)
 129  000f cd0000        	call	_RTC_EnterInitMode
 131  0012 4d            	tnz	a
 132  0013 260b          	jrne	L35
 133                     ; 242     status = ERROR;
 135  0015               LC002:
 137  0015 6b01          	ld	(OFST-4,sp),a
 138                     ; 244     RTC->WPR = 0xFF; 
 141  0017               L55:
 144  0017 35ff5159      	mov	20825,#255
 145                     ; 340   return (ErrorStatus)status;
 147  001b 7b01          	ld	a,(OFST-4,sp)
 150  001d 5b05          	addw	sp,#5
 151  001f 81            	ret	
 152  0020               L35:
 153                     ; 249     RTC->TR1 = RTC_TR1_RESET_VALUE;
 155  0020 725f5140      	clr	20800
 156                     ; 250     RTC->TR2 = RTC_TR2_RESET_VALUE;
 158  0024 725f5141      	clr	20801
 159                     ; 251     RTC->TR3 = RTC_TR3_RESET_VALUE;
 161  0028 725f5142      	clr	20802
 162                     ; 254     RTC->DR1 = RTC_DR1_RESET_VALUE;
 164  002c 35015144      	mov	20804,#1
 165                     ; 255     RTC->DR2 = RTC_DR2_RESET_VALUE;
 167  0030 35215145      	mov	20805,#33
 168                     ; 256     RTC->DR3 = RTC_DR3_RESET_VALUE;
 170  0034 725f5146      	clr	20806
 171                     ; 259     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 173  0038 725f5150      	clr	20816
 174                     ; 260     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 176  003c 35ff5151      	mov	20817,#255
 177                     ; 261     RTC->APRER  = RTC_APRER_RESET_VALUE;
 179  0040 357f5152      	mov	20818,#127
 180                     ; 263     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 182  0044 725f516c      	clr	20844
 183                     ; 264     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 185  0048 725f516d      	clr	20845
 186                     ; 268     RTC->CR1 = RTC_CR1_RESET_VALUE;
 188  004c 725f5148      	clr	20808
 189                     ; 269     RTC->CR2 = RTC_CR2_RESET_VALUE;
 191  0050 725f5149      	clr	20809
 192                     ; 270     RTC->CR3 = RTC_CR3_RESET_VALUE;
 194  0054 725f514a      	clr	20810
 196  0058 2007          	jra	L36
 197  005a               L75:
 198                     ; 275       wutwfcount++;
 200  005a 5c            	incw	x
 201  005b 1f02          	ldw	(OFST-3,sp),x
 202                     ; 276       RTC->ISR1 = 0;
 204  005d 725f514c      	clr	20812
 205  0061               L36:
 206                     ; 273     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 208  0061 7204514c07    	btjt	20812,#2,L76
 210  0066 1e02          	ldw	x,(OFST-3,sp)
 211  0068 a3ffff        	cpw	x,#65535
 212  006b 26ed          	jrne	L75
 213  006d               L76:
 214                     ; 279     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 216  006d 7204514c02    	btjt	20812,#2,L17
 217                     ; 281       status = ERROR;
 218                     ; 283       RTC->WPR = 0xFF; 
 220  0072 2061          	jp	L701
 221  0074               L17:
 222                     ; 288       RTC->CR1 = RTC_CR1_RESET_VALUE;
 224  0074 725f5148      	clr	20808
 225                     ; 291       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 227  0078 35ff5154      	mov	20820,#255
 228                     ; 292       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 230  007c 35ff5155      	mov	20821,#255
 231                     ; 295       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 233  0080 725f515c      	clr	20828
 234                     ; 296       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 236  0084 725f515d      	clr	20829
 237                     ; 297       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 239  0088 725f515e      	clr	20830
 240                     ; 298       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 242  008c 725f515f      	clr	20831
 243                     ; 300       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 245  0090 725f5164      	clr	20836
 246                     ; 301       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 248  0094 725f5165      	clr	20837
 249                     ; 302       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 251  0098 725f5166      	clr	20838
 252                     ; 305       RTC->ISR1 = (uint8_t)0x00;
 254  009c 725f514c      	clr	20812
 255                     ; 306       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 257  00a0 725f514d      	clr	20813
 258                     ; 308       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 260  00a4 7203514c11    	btjf	20812,#1,L57
 262  00a9 2003          	jra	L101
 263  00ab               L77:
 264                     ; 312           recalpfcount++;
 266  00ab 5c            	incw	x
 267  00ac 1f04          	ldw	(OFST-1,sp),x
 268  00ae               L101:
 269                     ; 310         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 271  00ae 7203514c07    	btjf	20812,#1,L57
 273  00b3 1e04          	ldw	x,(OFST-1,sp)
 274  00b5 a3ffff        	cpw	x,#65535
 275  00b8 26f1          	jrne	L77
 276  00ba               L57:
 277                     ; 315       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 279  00ba 7202514c16    	btjt	20812,#1,L701
 280                     ; 317         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 282  00bf 725f516a      	clr	20842
 283                     ; 318         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 285  00c3 725f516b      	clr	20843
 286                     ; 320         if (RTC_WaitForSynchro() == ERROR)
 288  00c7 cd0000        	call	_RTC_WaitForSynchro
 290  00ca 4d            	tnz	a
 291                     ; 322           status = ERROR;
 293  00cb 2603cc0015    	jreq	LC002
 294                     ; 326           status = SUCCESS;
 296  00d0 a601          	ld	a,#1
 297  00d2 cc0015        	jp	LC002
 298  00d5               L701:
 299                     ; 331         status = ERROR;
 302  00d5 0f01          	clr	(OFST-4,sp)
 303                     ; 335       RTC->WPR = 0xFF; 
 304  00d7 cc0017        	jra	L55
 404                     ; 356 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 404                     ; 357 {
 405                     .text:	section	.text,new
 406  0000               _RTC_Init:
 408  0000 89            	pushw	x
 409  0001 88            	push	a
 410       00000001      OFST:	set	1
 413                     ; 358   ErrorStatus status = ERROR;
 415                     ; 361   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 417                     ; 362   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 419                     ; 363   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 421                     ; 366   RTC->WPR = 0xCA;
 423  0002 35ca5159      	mov	20825,#202
 424                     ; 367   RTC->WPR = 0x53;
 426  0006 35535159      	mov	20825,#83
 427                     ; 370   if (RTC_EnterInitMode() == ERROR)
 429  000a cd0000        	call	_RTC_EnterInitMode
 431  000d 4d            	tnz	a
 432                     ; 372     status = ERROR;
 435  000e 2727          	jreq	L171
 436                     ; 377     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 438  0010 721d5148      	bres	20808,#6
 439                     ; 380     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 441  0014 1e02          	ldw	x,(OFST+1,sp)
 442  0016 c65148        	ld	a,20808
 443  0019 fa            	or	a,(x)
 444  001a c75148        	ld	20808,a
 445                     ; 383     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 447  001d 4f            	clr	a
 448  001e ee02          	ldw	x,(2,x)
 449  0020 01            	rrwa	x,a
 450  0021 9f            	ld	a,xl
 451  0022 c75150        	ld	20816,a
 452                     ; 384     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 454  0025 1e02          	ldw	x,(OFST+1,sp)
 455  0027 e603          	ld	a,(3,x)
 456  0029 c75151        	ld	20817,a
 457                     ; 385     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 459  002c e601          	ld	a,(1,x)
 460  002e c75152        	ld	20818,a
 461                     ; 388     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 463                     ; 390     status = SUCCESS;
 465  0031 a601          	ld	a,#1
 466  0033 721f514c      	bres	20812,#7
 467  0037               L171:
 468                     ; 394   RTC->WPR = 0xFF; 
 470  0037 35ff5159      	mov	20825,#255
 471                     ; 397   return (ErrorStatus)(status);
 475  003b 5b03          	addw	sp,#3
 476  003d 81            	ret	
 513                     ; 407 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 513                     ; 408 {
 514                     .text:	section	.text,new
 515  0000               _RTC_StructInit:
 519                     ; 410   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 521  0000 7f            	clr	(x)
 522                     ; 413   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 524  0001 a67f          	ld	a,#127
 525  0003 e701          	ld	(1,x),a
 526                     ; 416   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 528  0005 90ae00ff      	ldw	y,#255
 529  0009 ef02          	ldw	(2,x),y
 530                     ; 417 }
 533  000b 81            	ret	
 589                     ; 427 void RTC_WriteProtectionCmd(FunctionalState NewState)
 589                     ; 428 {
 590                     .text:	section	.text,new
 591  0000               _RTC_WriteProtectionCmd:
 595                     ; 430   assert_param(IS_FUNCTIONAL_STATE(NewState));
 597                     ; 432   if (NewState != DISABLE)
 599  0000 4d            	tnz	a
 600  0001 2705          	jreq	L142
 601                     ; 435     RTC->WPR = RTC_WPR_EnableKey;
 603  0003 35ff5159      	mov	20825,#255
 606  0007 81            	ret	
 607  0008               L142:
 608                     ; 440     RTC->WPR = RTC_WPR_DisableKey1;
 610  0008 35ca5159      	mov	20825,#202
 611                     ; 441     RTC->WPR = RTC_WPR_DisableKey2;
 613  000c 35535159      	mov	20825,#83
 614                     ; 443 }
 617  0010 81            	ret	
 662                     ; 455 ErrorStatus RTC_EnterInitMode(void)
 662                     ; 456 {
 663                     .text:	section	.text,new
 664  0000               _RTC_EnterInitMode:
 666  0000 5203          	subw	sp,#3
 667       00000003      OFST:	set	3
 670                     ; 457   ErrorStatus status = ERROR;
 672                     ; 458   uint16_t initfcount = 0;
 674  0002 5f            	clrw	x
 675  0003 1f02          	ldw	(OFST-1,sp),x
 676                     ; 461   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 678  0005 720c514c13    	btjt	20812,#6,L762
 679                     ; 464     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 681  000a 3580514c      	mov	20812,#128
 683  000e 2003          	jra	L572
 684  0010               L172:
 685                     ; 469       initfcount++;
 687  0010 5c            	incw	x
 688  0011 1f02          	ldw	(OFST-1,sp),x
 689  0013               L572:
 690                     ; 467     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 692  0013 720c514c05    	btjt	20812,#6,L762
 694  0018 a3ffff        	cpw	x,#65535
 695  001b 26f3          	jrne	L172
 696  001d               L762:
 697                     ; 473   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 699  001d 720c514c03    	btjt	20812,#6,L303
 700                     ; 475     status = ERROR;
 702  0022 4f            	clr	a
 704  0023 2002          	jra	L503
 705  0025               L303:
 706                     ; 479     status = SUCCESS;
 708  0025 a601          	ld	a,#1
 709  0027               L503:
 710                     ; 482   return (ErrorStatus)status;
 714  0027 5b03          	addw	sp,#3
 715  0029 81            	ret	
 738                     ; 495 void RTC_ExitInitMode(void)
 738                     ; 496 {
 739                     .text:	section	.text,new
 740  0000               _RTC_ExitInitMode:
 744                     ; 498   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 746  0000 721f514c      	bres	20812,#7
 747                     ; 499 }
 750  0004 81            	ret	
 795                     ; 524 ErrorStatus RTC_WaitForSynchro(void)
 795                     ; 525 {
 796                     .text:	section	.text,new
 797  0000               _RTC_WaitForSynchro:
 799  0000 5203          	subw	sp,#3
 800       00000003      OFST:	set	3
 803                     ; 526   uint16_t rsfcount = 0;
 805  0002 5f            	clrw	x
 806  0003 1f02          	ldw	(OFST-1,sp),x
 807                     ; 527   ErrorStatus status = ERROR;
 809                     ; 530   RTC->WPR = 0xCA;
 811  0005 35ca5159      	mov	20825,#202
 812                     ; 531   RTC->WPR = 0x53;
 814  0009 35535159      	mov	20825,#83
 815                     ; 534   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 817  000d c6514c        	ld	a,20812
 818  0010 a45f          	and	a,#95
 819  0012 c7514c        	ld	20812,a
 821  0015 2003          	jra	L343
 822  0017               L143:
 823                     ; 539     rsfcount++;
 825  0017 5c            	incw	x
 826  0018 1f02          	ldw	(OFST-1,sp),x
 827  001a               L343:
 828                     ; 537   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 830  001a 720a514c05    	btjt	20812,#5,L743
 832  001f a3ffff        	cpw	x,#65535
 833  0022 26f3          	jrne	L143
 834  0024               L743:
 835                     ; 543   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 837  0024 720b514c06    	btjf	20812,#5,L153
 838                     ; 545     status = SUCCESS;
 840  0029 a601          	ld	a,#1
 841  002b 6b01          	ld	(OFST-2,sp),a
 843  002d 2002          	jra	L353
 844  002f               L153:
 845                     ; 549     status = ERROR;
 847  002f 0f01          	clr	(OFST-2,sp)
 848  0031               L353:
 849                     ; 553   RTC->WPR = 0xFF; 
 851  0031 35ff5159      	mov	20825,#255
 852                     ; 555   return (ErrorStatus)status;
 854  0035 7b01          	ld	a,(OFST-2,sp)
 857  0037 5b03          	addw	sp,#3
 858  0039 81            	ret	
 893                     ; 565 void RTC_RatioCmd(FunctionalState NewState)
 893                     ; 566 {
 894                     .text:	section	.text,new
 895  0000               _RTC_RatioCmd:
 899                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 901                     ; 571   RTC->WPR = 0xCA;
 903  0000 35ca5159      	mov	20825,#202
 904                     ; 572   RTC->WPR = 0x53;
 906  0004 35535159      	mov	20825,#83
 907                     ; 574   if (NewState != DISABLE)
 909  0008 4d            	tnz	a
 910  0009 2706          	jreq	L373
 911                     ; 577     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 913  000b 721a5148      	bset	20808,#5
 915  000f 2004          	jra	L573
 916  0011               L373:
 917                     ; 582     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 919  0011 721b5148      	bres	20808,#5
 920  0015               L573:
 921                     ; 586   RTC->WPR = 0xFF; 
 923  0015 35ff5159      	mov	20825,#255
 924                     ; 587 }
 927  0019 81            	ret	
 963                     ; 595 void RTC_BypassShadowCmd(FunctionalState NewState)
 963                     ; 596 {
 964                     .text:	section	.text,new
 965  0000               _RTC_BypassShadowCmd:
 969                     ; 598   assert_param(IS_FUNCTIONAL_STATE(NewState));
 971                     ; 601   RTC->WPR = 0xCA;
 973  0000 35ca5159      	mov	20825,#202
 974                     ; 602   RTC->WPR = 0x53;
 976  0004 35535159      	mov	20825,#83
 977                     ; 604   if (NewState != DISABLE)
 979  0008 4d            	tnz	a
 980  0009 2706          	jreq	L514
 981                     ; 607     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 983  000b 72185148      	bset	20808,#4
 985  000f 2004          	jra	L714
 986  0011               L514:
 987                     ; 612     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 989  0011 72195148      	bres	20808,#4
 990  0015               L714:
 991                     ; 616   RTC->WPR = 0xFF; 
 993  0015 35ff5159      	mov	20825,#255
 994                     ; 617 }
 997  0019 81            	ret	
1145                     ; 656 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1145                     ; 657                         RTC_TimeTypeDef* RTC_TimeStruct)
1145                     ; 658 {
1146                     .text:	section	.text,new
1147  0000               _RTC_SetTime:
1149  0000 88            	push	a
1150  0001 88            	push	a
1151       00000001      OFST:	set	1
1154                     ; 659   ErrorStatus status = ERROR;
1156                     ; 660   uint8_t temp = 0;
1158                     ; 663   assert_param(IS_RTC_FORMAT(RTC_Format));
1160                     ; 665   if (RTC_Format == RTC_Format_BIN)
1162                     ; 668     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1163                     ; 670       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1165                     ; 671       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1168                     ; 675       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1170                     ; 677     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1172                     ; 678     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1175                     ; 683     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1177                     ; 685       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1179                     ; 686       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1183  0002 c65148        	ld	a,20808
1184                     ; 690       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1186                     ; 692     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1188                     ; 693     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1190                     ; 698   RTC->WPR = 0xCA;
1192  0005 35ca5159      	mov	20825,#202
1193                     ; 699   RTC->WPR = 0x53;
1195  0009 35535159      	mov	20825,#83
1196                     ; 702   if (RTC_EnterInitMode() == ERROR)
1198  000d cd0000        	call	_RTC_EnterInitMode
1200  0010 4d            	tnz	a
1201  0011 2606          	jrne	L725
1202                     ; 704     status = ERROR;
1204                     ; 706     RTC->WPR = 0xFF; 
1206  0013 35ff5159      	mov	20825,#255
1208  0017 2059          	jra	L135
1209  0019               L725:
1210                     ; 711     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1212  0019 720d514808    	btjf	20808,#6,L335
1213                     ; 713       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1215                     ; 714       temp = RTC_TimeStruct->RTC_H12;
1217  001e 1e05          	ldw	x,(OFST+4,sp)
1218  0020 e603          	ld	a,(3,x)
1219  0022 6b01          	ld	(OFST+0,sp),a
1221  0024 2002          	jra	L535
1222  0026               L335:
1223                     ; 718       temp = 0;
1225  0026 0f01          	clr	(OFST+0,sp)
1226  0028               L535:
1227                     ; 721     if (RTC_Format != RTC_Format_BIN)
1229  0028 7b02          	ld	a,(OFST+1,sp)
1230  002a 270f          	jreq	L735
1231                     ; 723       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1233  002c 1e05          	ldw	x,(OFST+4,sp)
1234  002e e602          	ld	a,(2,x)
1235  0030 c75140        	ld	20800,a
1236                     ; 724       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1238  0033 e601          	ld	a,(1,x)
1239  0035 c75141        	ld	20801,a
1240                     ; 725       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1242  0038 f6            	ld	a,(x)
1244  0039 201a          	jra	L145
1245  003b               L735:
1246                     ; 729       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1248  003b 1e05          	ldw	x,(OFST+4,sp)
1249  003d e602          	ld	a,(2,x)
1250  003f cd0000        	call	L3_ByteToBcd2
1252  0042 c75140        	ld	20800,a
1253                     ; 730       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1255  0045 1e05          	ldw	x,(OFST+4,sp)
1256  0047 e601          	ld	a,(1,x)
1257  0049 cd0000        	call	L3_ByteToBcd2
1259  004c c75141        	ld	20801,a
1260                     ; 731       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1262  004f 1e05          	ldw	x,(OFST+4,sp)
1263  0051 f6            	ld	a,(x)
1264  0052 cd0000        	call	L3_ByteToBcd2
1266  0055               L145:
1267  0055 1a01          	or	a,(OFST+0,sp)
1268  0057 c75142        	ld	20802,a
1269                     ; 734     (void)(RTC->DR3);
1271  005a c65146        	ld	a,20806
1272                     ; 737     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1274  005d 721f514c      	bres	20812,#7
1275                     ; 740     RTC->WPR = 0xFF; 
1277  0061 35ff5159      	mov	20825,#255
1278                     ; 743     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1280  0065 7208514806    	btjt	20808,#4,L345
1281                     ; 745       if (RTC_WaitForSynchro() == ERROR)
1283  006a cd0000        	call	_RTC_WaitForSynchro
1285  006d 4d            	tnz	a
1286                     ; 747         status = ERROR;
1289  006e 2702          	jreq	L135
1290                     ; 751         status = SUCCESS;
1291  0070               L345:
1292                     ; 756       status = SUCCESS;
1295  0070 a601          	ld	a,#1
1296  0072               L135:
1297                     ; 760   return (ErrorStatus)status;
1301  0072 85            	popw	x
1302  0073 81            	ret	
1339                     ; 772 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1339                     ; 773 {
1340                     .text:	section	.text,new
1341  0000               _RTC_TimeStructInit:
1345                     ; 775   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1347  0000 6f03          	clr	(3,x)
1348                     ; 776   RTC_TimeStruct->RTC_Hours = 0;
1350  0002 7f            	clr	(x)
1351                     ; 777   RTC_TimeStruct->RTC_Minutes = 0;
1353  0003 6f01          	clr	(1,x)
1354                     ; 778   RTC_TimeStruct->RTC_Seconds = 0;
1356  0005 6f02          	clr	(2,x)
1357                     ; 779 }
1360  0007 81            	ret	
1417                     ; 795 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1417                     ; 796                  RTC_TimeTypeDef* RTC_TimeStruct)
1417                     ; 797 {
1418                     .text:	section	.text,new
1419  0000               _RTC_GetTime:
1421  0000 88            	push	a
1422  0001 88            	push	a
1423       00000001      OFST:	set	1
1426                     ; 798   uint8_t  tmpreg = 0;
1428                     ; 801   assert_param(IS_RTC_FORMAT(RTC_Format));
1430                     ; 805   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1432  0002 1e05          	ldw	x,(OFST+4,sp)
1433  0004 c65140        	ld	a,20800
1434  0007 e702          	ld	(2,x),a
1435                     ; 808   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1437  0009 c65141        	ld	a,20801
1438  000c e701          	ld	(1,x),a
1439                     ; 811   tmpreg = (uint8_t)RTC->TR3;
1441  000e c65142        	ld	a,20802
1442  0011 6b01          	ld	(OFST+0,sp),a
1443                     ; 814   (void) (RTC->DR3) ;
1445  0013 c65146        	ld	a,20806
1446                     ; 818   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1448  0016 7b01          	ld	a,(OFST+0,sp)
1449  0018 a4bf          	and	a,#191
1450  001a f7            	ld	(x),a
1451                     ; 821   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1453  001b 7b01          	ld	a,(OFST+0,sp)
1454  001d a440          	and	a,#64
1455  001f e703          	ld	(3,x),a
1456                     ; 824   if (RTC_Format == RTC_Format_BIN)
1458  0021 7b02          	ld	a,(OFST+1,sp)
1459  0023 2619          	jrne	L326
1460                     ; 827     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1462  0025 f6            	ld	a,(x)
1463  0026 cd0000        	call	L5_Bcd2ToByte
1465  0029 1e05          	ldw	x,(OFST+4,sp)
1466  002b f7            	ld	(x),a
1467                     ; 828     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1469  002c e601          	ld	a,(1,x)
1470  002e cd0000        	call	L5_Bcd2ToByte
1472  0031 1e05          	ldw	x,(OFST+4,sp)
1473  0033 e701          	ld	(1,x),a
1474                     ; 829     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1476  0035 e602          	ld	a,(2,x)
1477  0037 cd0000        	call	L5_Bcd2ToByte
1479  003a 1e05          	ldw	x,(OFST+4,sp)
1480  003c e702          	ld	(2,x),a
1481  003e               L326:
1482                     ; 831 }
1485  003e 85            	popw	x
1486  003f 81            	ret	
1538                     ; 842 uint16_t RTC_GetSubSecond(void)
1538                     ; 843 {
1539                     .text:	section	.text,new
1540  0000               _RTC_GetSubSecond:
1542  0000 5206          	subw	sp,#6
1543       00000006      OFST:	set	6
1546                     ; 844   uint8_t ssrhreg = 0, ssrlreg = 0;
1550                     ; 845   uint16_t ssrreg = 0;
1552                     ; 848   ssrhreg = RTC->SSRH;
1554  0002 c65157        	ld	a,20823
1555  0005 6b03          	ld	(OFST-3,sp),a
1556                     ; 849   ssrlreg = RTC->SSRL;
1558  0007 c65158        	ld	a,20824
1559  000a 6b04          	ld	(OFST-2,sp),a
1560                     ; 852   (void) (RTC->DR3);
1562  000c c65146        	ld	a,20806
1563                     ; 855   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1565  000f 7b04          	ld	a,(OFST-2,sp)
1566  0011 5f            	clrw	x
1567  0012 97            	ld	xl,a
1568  0013 1f01          	ldw	(OFST-5,sp),x
1569  0015 5f            	clrw	x
1570  0016 7b03          	ld	a,(OFST-3,sp)
1571  0018 97            	ld	xl,a
1572  0019 7b02          	ld	a,(OFST-4,sp)
1573  001b 01            	rrwa	x,a
1574  001c 1a01          	or	a,(OFST-5,sp)
1575  001e 01            	rrwa	x,a
1576                     ; 856   return (uint16_t)(ssrreg);
1580  001f 5b06          	addw	sp,#6
1581  0021 81            	ret	
1833                     ; 873 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1833                     ; 874                         RTC_DateTypeDef* RTC_DateStruct)
1833                     ; 875 {
1834                     .text:	section	.text,new
1835  0000               _RTC_SetDate:
1837  0000 88            	push	a
1838  0001 89            	pushw	x
1839       00000002      OFST:	set	2
1842                     ; 876   ErrorStatus status = ERROR;
1844                     ; 878   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1846  0002 4d            	tnz	a
1847  0003 2610          	jrne	L1001
1849  0005 1e06          	ldw	x,(OFST+4,sp)
1850  0007 e601          	ld	a,(1,x)
1851  0009 a410          	and	a,#16
1852  000b 2708          	jreq	L1001
1853                     ; 880     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1855  000d e601          	ld	a,(1,x)
1856  000f a4ef          	and	a,#239
1857  0011 ab0a          	add	a,#10
1858  0013 e701          	ld	(1,x),a
1859  0015               L1001:
1860                     ; 884   assert_param(IS_RTC_FORMAT(RTC_Format));
1862                     ; 885   if (RTC_Format == RTC_Format_BIN)
1864                     ; 887     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1866                     ; 888     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1868                     ; 889     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1870                     ; 890     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1872                     ; 891     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1875                     ; 895     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1877                     ; 896     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1879                     ; 897     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1881                     ; 898     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1883                     ; 899     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1885                     ; 901   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1887                     ; 904   RTC->WPR = 0xCA;
1889  0015 35ca5159      	mov	20825,#202
1890                     ; 905   RTC->WPR = 0x53;
1892  0019 35535159      	mov	20825,#83
1893                     ; 908   if (RTC_EnterInitMode() == ERROR)
1895  001d cd0000        	call	_RTC_EnterInitMode
1897  0020 4d            	tnz	a
1898  0021 2606          	jrne	L7001
1899                     ; 910     status = ERROR;
1901                     ; 912     RTC->WPR = 0xFF; 
1903  0023 35ff5159      	mov	20825,#255
1905  0027 205e          	jra	L1101
1906  0029               L7001:
1907                     ; 916     (void)(RTC->TR1);
1909  0029 c65140        	ld	a,20800
1910                     ; 919     if (RTC_Format != RTC_Format_BIN)
1912  002c 7b03          	ld	a,(OFST+1,sp)
1913  002e 2718          	jreq	L3101
1914                     ; 921       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1916  0030 1e06          	ldw	x,(OFST+4,sp)
1917  0032 e602          	ld	a,(2,x)
1918  0034 c75144        	ld	20804,a
1919                     ; 922       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1921  0037 f6            	ld	a,(x)
1922  0038 97            	ld	xl,a
1923  0039 a620          	ld	a,#32
1924  003b 42            	mul	x,a
1925  003c 9f            	ld	a,xl
1926  003d 1e06          	ldw	x,(OFST+4,sp)
1927  003f ea01          	or	a,(1,x)
1928  0041 c75145        	ld	20805,a
1929                     ; 923       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1931  0044 e603          	ld	a,(3,x)
1933  0046 2027          	jra	L5101
1934  0048               L3101:
1935                     ; 927       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1937  0048 1e06          	ldw	x,(OFST+4,sp)
1938  004a e602          	ld	a,(2,x)
1939  004c cd0000        	call	L3_ByteToBcd2
1941  004f c75144        	ld	20804,a
1942                     ; 928       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1944  0052 1e06          	ldw	x,(OFST+4,sp)
1945  0054 f6            	ld	a,(x)
1946  0055 97            	ld	xl,a
1947  0056 a620          	ld	a,#32
1948  0058 42            	mul	x,a
1949  0059 9f            	ld	a,xl
1950  005a 6b01          	ld	(OFST-1,sp),a
1951  005c 1e06          	ldw	x,(OFST+4,sp)
1952  005e e601          	ld	a,(1,x)
1953  0060 cd0000        	call	L3_ByteToBcd2
1955  0063 1a01          	or	a,(OFST-1,sp)
1956  0065 c75145        	ld	20805,a
1957                     ; 929       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1959  0068 1e06          	ldw	x,(OFST+4,sp)
1960  006a e603          	ld	a,(3,x)
1961  006c cd0000        	call	L3_ByteToBcd2
1963  006f               L5101:
1964  006f c75146        	ld	20806,a
1965                     ; 933     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1967  0072 721f514c      	bres	20812,#7
1968                     ; 936     RTC->WPR = 0xFF; 
1970  0076 35ff5159      	mov	20825,#255
1971                     ; 939     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1973  007a 7208514806    	btjt	20808,#4,L7101
1974                     ; 941       if (RTC_WaitForSynchro() == ERROR)
1976  007f cd0000        	call	_RTC_WaitForSynchro
1978  0082 4d            	tnz	a
1979                     ; 943         status = ERROR;
1982  0083 2702          	jreq	L1101
1983                     ; 947         status = SUCCESS;
1984  0085               L7101:
1985                     ; 952       status = SUCCESS;
1988  0085 a601          	ld	a,#1
1989  0087               L1101:
1990                     ; 956   return (ErrorStatus)status;
1994  0087 5b03          	addw	sp,#3
1995  0089 81            	ret	
2032                     ; 965 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2032                     ; 966 {
2033                     .text:	section	.text,new
2034  0000               _RTC_DateStructInit:
2038                     ; 968   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2040  0000 a601          	ld	a,#1
2041  0002 f7            	ld	(x),a
2042                     ; 969   RTC_DateStruct->RTC_Date = 1;
2044  0003 e702          	ld	(2,x),a
2045                     ; 970   RTC_DateStruct->RTC_Month = RTC_Month_January;
2047  0005 e701          	ld	(1,x),a
2048                     ; 971   RTC_DateStruct->RTC_Year = 0;
2050  0007 6f03          	clr	(3,x)
2051                     ; 972 }
2054  0009 81            	ret	
2111                     ; 985 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2111                     ; 986                  RTC_DateTypeDef* RTC_DateStruct)
2111                     ; 987 {
2112                     .text:	section	.text,new
2113  0000               _RTC_GetDate:
2115  0000 88            	push	a
2116  0001 88            	push	a
2117       00000001      OFST:	set	1
2120                     ; 988   uint8_t tmpreg = 0;
2122                     ; 991   assert_param(IS_RTC_FORMAT(RTC_Format));
2124                     ; 994   (void) (RTC->TR1) ;
2126  0002 c65140        	ld	a,20800
2127                     ; 995   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2129  0005 1e05          	ldw	x,(OFST+4,sp)
2130  0007 c65144        	ld	a,20804
2131  000a e702          	ld	(2,x),a
2132                     ; 996   tmpreg = (uint8_t)RTC->DR2;
2134  000c c65145        	ld	a,20805
2135  000f 6b01          	ld	(OFST+0,sp),a
2136                     ; 997   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2138  0011 c65146        	ld	a,20806
2139  0014 e703          	ld	(3,x),a
2140                     ; 1000   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2142  0016 7b01          	ld	a,(OFST+0,sp)
2143  0018 a41f          	and	a,#31
2144  001a e701          	ld	(1,x),a
2145                     ; 1001   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2147  001c 7b01          	ld	a,(OFST+0,sp)
2148  001e 4e            	swap	a
2149  001f a40e          	and	a,#14
2150  0021 44            	srl	a
2151  0022 f7            	ld	(x),a
2152                     ; 1004   if (RTC_Format == RTC_Format_BIN)
2154  0023 7b02          	ld	a,(OFST+1,sp)
2155  0025 261b          	jrne	L7701
2156                     ; 1007     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2158  0027 e603          	ld	a,(3,x)
2159  0029 cd0000        	call	L5_Bcd2ToByte
2161  002c 1e05          	ldw	x,(OFST+4,sp)
2162  002e e703          	ld	(3,x),a
2163                     ; 1008     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2165  0030 e601          	ld	a,(1,x)
2166  0032 cd0000        	call	L5_Bcd2ToByte
2168  0035 1e05          	ldw	x,(OFST+4,sp)
2169  0037 e701          	ld	(1,x),a
2170                     ; 1009     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2172  0039 e602          	ld	a,(2,x)
2173  003b cd0000        	call	L5_Bcd2ToByte
2175  003e 1e05          	ldw	x,(OFST+4,sp)
2176  0040 e702          	ld	(2,x),a
2177  0042               L7701:
2178                     ; 1011 }
2181  0042 85            	popw	x
2182  0043 81            	ret	
2331                     ; 1041 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2331                     ; 1042                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2331                     ; 1043 {
2332                     .text:	section	.text,new
2333  0000               _RTC_SetAlarm:
2335  0000 88            	push	a
2336  0001 5205          	subw	sp,#5
2337       00000005      OFST:	set	5
2340                     ; 1044   uint8_t tmpreg1 = 0;
2342                     ; 1045   uint8_t tmpreg2 = 0;
2344                     ; 1046   uint8_t tmpreg3 = 0;
2346                     ; 1047   uint8_t tmpreg4 = 0;
2348                     ; 1050   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2350                     ; 1051   assert_param(IS_RTC_FORMAT(RTC_Format));
2352                     ; 1052   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2354                     ; 1053   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2356                     ; 1056   if (RTC_Format == RTC_Format_BIN)
2358                     ; 1059     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2359                     ; 1061       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2361                     ; 1062       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2364                     ; 1066       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2366                     ; 1068     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2368                     ; 1069     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2371                     ; 1074     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2373                     ; 1076       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2375                     ; 1077       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2379  0003 c65148        	ld	a,20808
2380                     ; 1081       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2382                     ; 1084     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2384                     ; 1086     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2386                     ; 1091   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2388                     ; 1093     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2390                     ; 1095       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2393                     ; 1099       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2395                     ; 1100       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2397                     ; 1105   RTC->WPR = 0xCA;
2399  0006 35ca5159      	mov	20825,#202
2400                     ; 1106   RTC->WPR = 0x53;
2402  000a 35535159      	mov	20825,#83
2403                     ; 1110   if (RTC_Format != RTC_Format_BIN)
2405  000e 7b06          	ld	a,(OFST+1,sp)
2406  0010 272d          	jreq	L7121
2407                     ; 1112     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2407                     ; 1113                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2409  0012 1e09          	ldw	x,(OFST+4,sp)
2410  0014 e604          	ld	a,(4,x)
2411  0016 a480          	and	a,#128
2412  0018 ea02          	or	a,(2,x)
2413  001a 6b02          	ld	(OFST-3,sp),a
2414                     ; 1115     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2414                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2416  001c e604          	ld	a,(4,x)
2417  001e 48            	sll	a
2418  001f a480          	and	a,#128
2419  0021 ea01          	or	a,(1,x)
2420  0023 6b03          	ld	(OFST-2,sp),a
2421                     ; 1118     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2421                     ; 1119                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2421                     ; 1120                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2423  0025 ad7e          	call	LC006
2424  0027 a480          	and	a,#128
2425  0029 6b01          	ld	(OFST-4,sp),a
2426  002b e603          	ld	a,(3,x)
2427  002d fa            	or	a,(x)
2428  002e 1a01          	or	a,(OFST-4,sp)
2429  0030 6b04          	ld	(OFST-1,sp),a
2430                     ; 1122     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2430                     ; 1123                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2430                     ; 1124                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2432  0032 ad71          	call	LC006
2433  0034 48            	sll	a
2434  0035 a480          	and	a,#128
2435  0037 6b01          	ld	(OFST-4,sp),a
2436  0039 e605          	ld	a,(5,x)
2437  003b ea06          	or	a,(6,x)
2439  003d 2047          	jra	L1221
2440  003f               L7121:
2441                     ; 1129     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2441                     ; 1130                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2443  003f 1e09          	ldw	x,(OFST+4,sp)
2444  0041 e604          	ld	a,(4,x)
2445  0043 a480          	and	a,#128
2446  0045 6b01          	ld	(OFST-4,sp),a
2447  0047 e602          	ld	a,(2,x)
2448  0049 cd0000        	call	L3_ByteToBcd2
2450  004c 1a01          	or	a,(OFST-4,sp)
2451  004e 6b02          	ld	(OFST-3,sp),a
2452                     ; 1132     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2452                     ; 1133                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2454  0050 1e09          	ldw	x,(OFST+4,sp)
2455  0052 e604          	ld	a,(4,x)
2456  0054 48            	sll	a
2457  0055 a480          	and	a,#128
2458  0057 6b01          	ld	(OFST-4,sp),a
2459  0059 e601          	ld	a,(1,x)
2460  005b cd0000        	call	L3_ByteToBcd2
2462  005e 1a01          	or	a,(OFST-4,sp)
2463  0060 6b03          	ld	(OFST-2,sp),a
2464                     ; 1135     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2464                     ; 1136                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2464                     ; 1137                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2466  0062 1e09          	ldw	x,(OFST+4,sp)
2467  0064 ad3f          	call	LC006
2468  0066 a480          	and	a,#128
2469  0068 6b01          	ld	(OFST-4,sp),a
2470  006a f6            	ld	a,(x)
2471  006b cd0000        	call	L3_ByteToBcd2
2473  006e 1e09          	ldw	x,(OFST+4,sp)
2474  0070 ea03          	or	a,(3,x)
2475  0072 1a01          	or	a,(OFST-4,sp)
2476  0074 6b04          	ld	(OFST-1,sp),a
2477                     ; 1139     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2477                     ; 1140                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2477                     ; 1141                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2479  0076 ad2d          	call	LC006
2480  0078 48            	sll	a
2481  0079 a480          	and	a,#128
2482  007b 6b01          	ld	(OFST-4,sp),a
2483  007d e606          	ld	a,(6,x)
2484  007f cd0000        	call	L3_ByteToBcd2
2486  0082 1e09          	ldw	x,(OFST+4,sp)
2487  0084 ea05          	or	a,(5,x)
2488  0086               L1221:
2489  0086 1a01          	or	a,(OFST-4,sp)
2490  0088 6b05          	ld	(OFST+0,sp),a
2491                     ; 1145   RTC->ALRMAR1 = tmpreg1;
2493  008a 7b02          	ld	a,(OFST-3,sp)
2494  008c c7515c        	ld	20828,a
2495                     ; 1146   RTC->ALRMAR2 = tmpreg2;
2497  008f 7b03          	ld	a,(OFST-2,sp)
2498  0091 c7515d        	ld	20829,a
2499                     ; 1147   RTC->ALRMAR3 = tmpreg3;
2501  0094 7b04          	ld	a,(OFST-1,sp)
2502  0096 c7515e        	ld	20830,a
2503                     ; 1148   RTC->ALRMAR4 = tmpreg4;
2505  0099 7b05          	ld	a,(OFST+0,sp)
2506  009b c7515f        	ld	20831,a
2507                     ; 1151   RTC->WPR = 0xFF; 
2509  009e 35ff5159      	mov	20825,#255
2510                     ; 1152 }
2513  00a2 5b06          	addw	sp,#6
2514  00a4 81            	ret	
2515  00a5               LC006:
2516  00a5 e604          	ld	a,(4,x)
2517  00a7 48            	sll	a
2518  00a8 48            	sll	a
2519  00a9 81            	ret	
2557                     ; 1162 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2557                     ; 1163 {
2558                     .text:	section	.text,new
2559  0000               _RTC_AlarmStructInit:
2563                     ; 1165   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2565  0000 6f03          	clr	(3,x)
2566                     ; 1166   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2568  0002 7f            	clr	(x)
2569                     ; 1167   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2571  0003 6f01          	clr	(1,x)
2572                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2574  0005 6f02          	clr	(2,x)
2575                     ; 1171   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2577  0007 6f05          	clr	(5,x)
2578                     ; 1172   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2580  0009 a601          	ld	a,#1
2581  000b e706          	ld	(6,x),a
2582                     ; 1175   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2584  000d a6f0          	ld	a,#240
2585  000f e704          	ld	(4,x),a
2586                     ; 1176 }
2589  0011 81            	ret	
2682                     ; 1185 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2682                     ; 1186                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2682                     ; 1187 {
2683                     .text:	section	.text,new
2684  0000               _RTC_GetAlarm:
2686  0000 88            	push	a
2687  0001 5204          	subw	sp,#4
2688       00000004      OFST:	set	4
2691                     ; 1188   uint8_t tmpreg1 = 0;
2693                     ; 1189   uint8_t tmpreg2 = 0;
2695                     ; 1190   uint8_t tmpreg3 = 0;
2697                     ; 1191   uint8_t tmpreg4 = 0;
2699                     ; 1192   uint8_t alarmmask = 0;
2701                     ; 1195   assert_param(IS_RTC_FORMAT(RTC_Format));
2703                     ; 1198   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2705  0003 c6515c        	ld	a,20828
2706  0006 6b04          	ld	(OFST+0,sp),a
2707                     ; 1199   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2709  0008 c6515d        	ld	a,20829
2710  000b 6b01          	ld	(OFST-3,sp),a
2711                     ; 1200   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2713  000d c6515e        	ld	a,20830
2714  0010 6b02          	ld	(OFST-2,sp),a
2715                     ; 1201   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2717  0012 c6515f        	ld	a,20831
2718  0015 6b03          	ld	(OFST-1,sp),a
2719                     ; 1204   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2721  0017 7b04          	ld	a,(OFST+0,sp)
2722  0019 1e08          	ldw	x,(OFST+4,sp)
2723  001b a47f          	and	a,#127
2724  001d e702          	ld	(2,x),a
2725                     ; 1205   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2727  001f 7b04          	ld	a,(OFST+0,sp)
2728  0021 a480          	and	a,#128
2729  0023 6b04          	ld	(OFST+0,sp),a
2730                     ; 1208   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2732  0025 7b01          	ld	a,(OFST-3,sp)
2733  0027 a47f          	and	a,#127
2734  0029 e701          	ld	(1,x),a
2735                     ; 1209   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2737  002b 7b01          	ld	a,(OFST-3,sp)
2738  002d a480          	and	a,#128
2739  002f 44            	srl	a
2740  0030 1a04          	or	a,(OFST+0,sp)
2741  0032 6b04          	ld	(OFST+0,sp),a
2742                     ; 1212   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2744  0034 7b02          	ld	a,(OFST-2,sp)
2745  0036 a43f          	and	a,#63
2746  0038 f7            	ld	(x),a
2747                     ; 1213   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2749  0039 7b02          	ld	a,(OFST-2,sp)
2750  003b a440          	and	a,#64
2751  003d e703          	ld	(3,x),a
2752                     ; 1214   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2754  003f 7b02          	ld	a,(OFST-2,sp)
2755  0041 a480          	and	a,#128
2756  0043 44            	srl	a
2757  0044 44            	srl	a
2758  0045 1a04          	or	a,(OFST+0,sp)
2759  0047 6b04          	ld	(OFST+0,sp),a
2760                     ; 1217   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2762  0049 7b03          	ld	a,(OFST-1,sp)
2763  004b a43f          	and	a,#63
2764  004d e706          	ld	(6,x),a
2765                     ; 1218   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2767  004f 7b03          	ld	a,(OFST-1,sp)
2768  0051 a440          	and	a,#64
2769  0053 e705          	ld	(5,x),a
2770                     ; 1219   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2772  0055 7b03          	ld	a,(OFST-1,sp)
2773  0057 a480          	and	a,#128
2774  0059 44            	srl	a
2775  005a 44            	srl	a
2776  005b 44            	srl	a
2777  005c 1a04          	or	a,(OFST+0,sp)
2778  005e 6b04          	ld	(OFST+0,sp),a
2779                     ; 1221   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2781  0060 e704          	ld	(4,x),a
2782                     ; 1223   if (RTC_Format == RTC_Format_BIN)
2784  0062 7b05          	ld	a,(OFST+1,sp)
2785  0064 2622          	jrne	L3131
2786                     ; 1225     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2788  0066 f6            	ld	a,(x)
2789  0067 cd0000        	call	L5_Bcd2ToByte
2791  006a 1e08          	ldw	x,(OFST+4,sp)
2792  006c f7            	ld	(x),a
2793                     ; 1226     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2795  006d e601          	ld	a,(1,x)
2796  006f cd0000        	call	L5_Bcd2ToByte
2798  0072 1e08          	ldw	x,(OFST+4,sp)
2799  0074 e701          	ld	(1,x),a
2800                     ; 1227     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2802  0076 e602          	ld	a,(2,x)
2803  0078 cd0000        	call	L5_Bcd2ToByte
2805  007b 1e08          	ldw	x,(OFST+4,sp)
2806  007d e702          	ld	(2,x),a
2807                     ; 1228     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2809  007f e606          	ld	a,(6,x)
2810  0081 cd0000        	call	L5_Bcd2ToByte
2812  0084 1e08          	ldw	x,(OFST+4,sp)
2813  0086 e706          	ld	(6,x),a
2814  0088               L3131:
2815                     ; 1230 }
2818  0088 5b05          	addw	sp,#5
2819  008a 81            	ret	
2883                     ; 1239 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2883                     ; 1240 {
2884                     .text:	section	.text,new
2885  0000               _RTC_AlarmCmd:
2887  0000 5203          	subw	sp,#3
2888       00000003      OFST:	set	3
2891                     ; 1241   __IO uint16_t alrawfcount = 0;
2893  0002 5f            	clrw	x
2894  0003 1f01          	ldw	(OFST-2,sp),x
2895                     ; 1242   ErrorStatus status = ERROR;
2897                     ; 1243   uint8_t temp1 = 0;
2899                     ; 1246   assert_param(IS_FUNCTIONAL_STATE(NewState));
2901                     ; 1249   RTC->WPR = 0xCA;
2903  0005 35ca5159      	mov	20825,#202
2904                     ; 1250   RTC->WPR = 0x53;
2906  0009 35535159      	mov	20825,#83
2907                     ; 1253   if (NewState != DISABLE)
2909  000d 4d            	tnz	a
2910  000e 2711          	jreq	L7431
2911                     ; 1255     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2913  0010 72105149      	bset	20809,#0
2914                     ; 1256     status = SUCCESS;
2916  0014               LC007:
2918  0014 a601          	ld	a,#1
2919  0016 6b03          	ld	(OFST+0,sp),a
2921  0018               L1531:
2922                     ; 1280   RTC->WPR = 0xFF; 
2924  0018 35ff5159      	mov	20825,#255
2925                     ; 1283   return (ErrorStatus)status;
2927  001c 7b03          	ld	a,(OFST+0,sp)
2930  001e 5b03          	addw	sp,#3
2931  0020 81            	ret	
2932  0021               L7431:
2933                     ; 1260     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2935  0021 72115149      	bres	20809,#0
2936                     ; 1263     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2938  0025 c6514c        	ld	a,20812
2939  0028 a401          	and	a,#1
2940  002a 6b03          	ld	(OFST+0,sp),a
2942  002c 2005          	jra	L7531
2943  002e               L3531:
2944                     ; 1266       alrawfcount++;
2946  002e 1e01          	ldw	x,(OFST-2,sp)
2947  0030 5c            	incw	x
2948  0031 1f01          	ldw	(OFST-2,sp),x
2949  0033               L7531:
2950                     ; 1264     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2952  0033 1e01          	ldw	x,(OFST-2,sp)
2953  0035 5c            	incw	x
2954  0036 2704          	jreq	L3631
2956  0038 7b03          	ld	a,(OFST+0,sp)
2957  003a 27f2          	jreq	L3531
2958  003c               L3631:
2959                     ; 1269     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2961  003c 7200514c04    	btjt	20812,#0,L5631
2962                     ; 1271       status = ERROR;
2964  0041 0f03          	clr	(OFST+0,sp)
2966  0043 20d3          	jra	L1531
2967  0045               L5631:
2968                     ; 1275       status = SUCCESS;
2969  0045 20cd          	jp	LC007
3170                     ; 1295 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3170                     ; 1296                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3170                     ; 1297 {
3171                     .text:	section	.text,new
3172  0000               _RTC_AlarmSubSecondConfig:
3174  0000 89            	pushw	x
3175  0001 88            	push	a
3176       00000001      OFST:	set	1
3179                     ; 1298   uint8_t alarmstatus = 0;
3181                     ; 1299   ErrorStatus status = ERROR;
3183                     ; 1302   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3185                     ; 1303   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3187                     ; 1306   RTC->WPR = 0xCA;
3189  0002 35ca5159      	mov	20825,#202
3190                     ; 1307   RTC->WPR = 0x53;
3192  0006 35535159      	mov	20825,#83
3193                     ; 1310   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3195  000a 720c514c26    	btjt	20812,#6,L7641
3196                     ; 1313     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3198  000f c65149        	ld	a,20809
3199  0012 aa01          	or	a,#1
3200  0014 6b01          	ld	(OFST+0,sp),a
3201                     ; 1316     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3203                     ; 1319     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3205  0016 9e            	ld	a,xh
3206  0017 72115149      	bres	20809,#0
3207  001b c75164        	ld	20836,a
3208                     ; 1320     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3210  001e 9f            	ld	a,xl
3211  001f c75165        	ld	20837,a
3212                     ; 1321     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3214  0022 7b06          	ld	a,(OFST+5,sp)
3215  0024 c75166        	ld	20838,a
3216                     ; 1324     RTC->CR2 |= alarmstatus;
3218  0027 c65149        	ld	a,20809
3219  002a 1a01          	or	a,(OFST+0,sp)
3220  002c c75149        	ld	20809,a
3221                     ; 1326     status = SUCCESS;
3223  002f a601          	ld	a,#1
3224  0031 6b01          	ld	(OFST+0,sp),a
3226  0033 2002          	jra	L1741
3227  0035               L7641:
3228                     ; 1330     status = ERROR;
3230  0035 0f01          	clr	(OFST+0,sp)
3231  0037               L1741:
3232                     ; 1334   RTC->WPR = 0xFF; 
3234  0037 35ff5159      	mov	20825,#255
3235                     ; 1336   return (ErrorStatus)status;
3237  003b 7b01          	ld	a,(OFST+0,sp)
3240  003d 5b03          	addw	sp,#3
3241  003f 81            	ret	
3331                     ; 1366 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3331                     ; 1367 {
3332                     .text:	section	.text,new
3333  0000               _RTC_WakeUpClockConfig:
3335  0000 88            	push	a
3336       00000000      OFST:	set	0
3339                     ; 1370   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3341                     ; 1373   RTC->WPR = 0xCA;
3343  0001 35ca5159      	mov	20825,#202
3344                     ; 1374   RTC->WPR = 0x53;
3346  0005 35535159      	mov	20825,#83
3347                     ; 1377   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3349  0009 72155149      	bres	20809,#2
3350                     ; 1380   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3352  000d c65148        	ld	a,20808
3353  0010 a4f8          	and	a,#248
3354  0012 c75148        	ld	20808,a
3355                     ; 1383   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3357  0015 c65148        	ld	a,20808
3358  0018 1a01          	or	a,(OFST+1,sp)
3359  001a c75148        	ld	20808,a
3360                     ; 1386   RTC->WPR = 0xFF; 
3362  001d 35ff5159      	mov	20825,#255
3363                     ; 1387 }
3366  0021 84            	pop	a
3367  0022 81            	ret	
3402                     ; 1397 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3402                     ; 1398 {
3403                     .text:	section	.text,new
3404  0000               _RTC_SetWakeUpCounter:
3408                     ; 1400   RTC->WPR = 0xCA;
3410  0000 35ca5159      	mov	20825,#202
3411                     ; 1401   RTC->WPR = 0x53;
3413  0004 35535159      	mov	20825,#83
3414                     ; 1405   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3416  0008 9e            	ld	a,xh
3417  0009 c75154        	ld	20820,a
3418                     ; 1406   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3420  000c 9f            	ld	a,xl
3421  000d c75155        	ld	20821,a
3422                     ; 1409   RTC->WPR = 0xFF; 
3424  0010 35ff5159      	mov	20825,#255
3425                     ; 1410 }
3428  0014 81            	ret	
3463                     ; 1417 uint16_t RTC_GetWakeUpCounter(void)
3463                     ; 1418 {
3464                     .text:	section	.text,new
3465  0000               _RTC_GetWakeUpCounter:
3467  0000 89            	pushw	x
3468       00000002      OFST:	set	2
3471                     ; 1419   uint16_t tmpreg = 0;
3473                     ; 1422   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3475  0001 c65154        	ld	a,20820
3476  0004 97            	ld	xl,a
3477  0005 4f            	clr	a
3478  0006 02            	rlwa	x,a
3479  0007 1f01          	ldw	(OFST-1,sp),x
3480                     ; 1423   tmpreg |= RTC->WUTRL;
3482  0009 5f            	clrw	x
3483  000a c65155        	ld	a,20821
3484  000d 97            	ld	xl,a
3485  000e 01            	rrwa	x,a
3486  000f 1a02          	or	a,(OFST+0,sp)
3487  0011 01            	rrwa	x,a
3488  0012 1a01          	or	a,(OFST-1,sp)
3489  0014 01            	rrwa	x,a
3490                     ; 1426   return (uint16_t)tmpreg;
3494  0015 5b02          	addw	sp,#2
3495  0017 81            	ret	
3550                     ; 1437 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3550                     ; 1438 {
3551                     .text:	section	.text,new
3552  0000               _RTC_WakeUpCmd:
3554  0000 5203          	subw	sp,#3
3555       00000003      OFST:	set	3
3558                     ; 1439   ErrorStatus status = ERROR;
3560                     ; 1440   uint16_t wutwfcount = 0;
3562  0002 5f            	clrw	x
3563  0003 1f02          	ldw	(OFST-1,sp),x
3564                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3566                     ; 1446   RTC->WPR = 0xCA;
3568  0005 35ca5159      	mov	20825,#202
3569                     ; 1447   RTC->WPR = 0x53;
3571  0009 35535159      	mov	20825,#83
3572                     ; 1449   if (NewState != DISABLE)
3574  000d 4d            	tnz	a
3575  000e 2711          	jreq	L3161
3576                     ; 1452     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3578  0010 72145149      	bset	20809,#2
3579                     ; 1454     status = SUCCESS;
3581  0014               LC008:
3583  0014 a601          	ld	a,#1
3584  0016 6b01          	ld	(OFST-2,sp),a
3586  0018               L5161:
3587                     ; 1479   RTC->WPR = 0xFF; 
3589  0018 35ff5159      	mov	20825,#255
3590                     ; 1482   return (ErrorStatus)status;
3592  001c 7b01          	ld	a,(OFST-2,sp)
3595  001e 5b03          	addw	sp,#3
3596  0020 81            	ret	
3597  0021               L3161:
3598                     ; 1459     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3600  0021 72155149      	bres	20809,#2
3602  0025 2003          	jra	L1261
3603  0027               L7161:
3604                     ; 1464       wutwfcount++;
3606  0027 5c            	incw	x
3607  0028 1f02          	ldw	(OFST-1,sp),x
3608  002a               L1261:
3609                     ; 1462     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3611  002a 7204514c05    	btjt	20812,#2,L5261
3613  002f a3ffff        	cpw	x,#65535
3614  0032 26f3          	jrne	L7161
3615  0034               L5261:
3616                     ; 1468     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3618  0034 7204514c04    	btjt	20812,#2,L7261
3619                     ; 1470       status = ERROR;
3621  0039 0f01          	clr	(OFST-2,sp)
3623  003b 20db          	jra	L5161
3624  003d               L7261:
3625                     ; 1474       status = SUCCESS;
3626  003d 20d5          	jp	LC008
3716                     ; 1519 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3716                     ; 1520                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3716                     ; 1521 {
3717                     .text:	section	.text,new
3718  0000               _RTC_DayLightSavingConfig:
3720  0000 89            	pushw	x
3721       00000000      OFST:	set	0
3724                     ; 1523   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3726                     ; 1524   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3728                     ; 1527   RTC->WPR = 0xCA;
3730  0001 35ca5159      	mov	20825,#202
3731                     ; 1528   RTC->WPR = 0x53;
3733  0005 35535159      	mov	20825,#83
3734                     ; 1531   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3736                     ; 1534   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3738  0009 7215514a      	bres	20810,#2
3739  000d 9f            	ld	a,xl
3740  000e 1a01          	or	a,(OFST+1,sp)
3741  0010 ca514a        	or	a,20810
3742  0013 c7514a        	ld	20810,a
3743                     ; 1537   RTC->WPR = 0xFF; 
3745  0016 35ff5159      	mov	20825,#255
3746                     ; 1538 }
3749  001a 85            	popw	x
3750  001b 81            	ret	
3775                     ; 1546 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3775                     ; 1547 {
3776                     .text:	section	.text,new
3777  0000               _RTC_GetStoreOperation:
3781                     ; 1549   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3783  0000 c6514a        	ld	a,20810
3784  0003 a404          	and	a,#4
3787  0005 81            	ret	
3881                     ; 1584 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3881                     ; 1585                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3881                     ; 1586 {
3882                     .text:	section	.text,new
3883  0000               _RTC_OutputConfig:
3885  0000 89            	pushw	x
3886       00000000      OFST:	set	0
3889                     ; 1588   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3891                     ; 1589   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3893                     ; 1592   RTC->WPR = 0xCA;
3895  0001 35ca5159      	mov	20825,#202
3896                     ; 1593   RTC->WPR = 0x53;
3898  0005 35535159      	mov	20825,#83
3899                     ; 1596   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3901  0009 c6514a        	ld	a,20810
3902  000c a48f          	and	a,#143
3903  000e c7514a        	ld	20810,a
3904                     ; 1599   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3906  0011 9f            	ld	a,xl
3907  0012 1a01          	or	a,(OFST+1,sp)
3908  0014 ca514a        	or	a,20810
3909  0017 c7514a        	ld	20810,a
3910                     ; 1602   RTC->WPR = 0xFF; 
3912  001a 35ff5159      	mov	20825,#255
3913                     ; 1603 }
3916  001e 85            	popw	x
3917  001f 81            	ret	
4012                     ; 1636 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4012                     ; 1637                                    uint16_t RTC_ShiftSubFS)
4012                     ; 1638 {
4013                     .text:	section	.text,new
4014  0000               _RTC_SynchroShiftConfig:
4016  0000 88            	push	a
4017  0001 5203          	subw	sp,#3
4018       00000003      OFST:	set	3
4021                     ; 1639   uint8_t shiftrhreg = 0;
4023                     ; 1640   ErrorStatus status = ERROR;
4025                     ; 1641   uint16_t shpfcount = 0;
4027  0003 5f            	clrw	x
4028  0004 1f02          	ldw	(OFST-1,sp),x
4029                     ; 1644   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4031                     ; 1645   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4033                     ; 1648   RTC->WPR = 0xCA;
4035  0006 35ca5159      	mov	20825,#202
4036                     ; 1649   RTC->WPR = 0x53;
4038  000a 35535159      	mov	20825,#83
4039                     ; 1652   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4041  000e 7207514c0f    	btjf	20812,#3,L7102
4043  0013 2003          	jra	L3202
4044  0015               L1202:
4045                     ; 1657       shpfcount++;
4047  0015 5c            	incw	x
4048  0016 1f02          	ldw	(OFST-1,sp),x
4049  0018               L3202:
4050                     ; 1655     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4052  0018 7207514c05    	btjf	20812,#3,L7102
4054  001d a3ffff        	cpw	x,#65535
4055  0020 26f3          	jrne	L1202
4056  0022               L7102:
4057                     ; 1662   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4059  0022 7206514c12    	btjt	20812,#3,L1302
4060                     ; 1665     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4062  0027 7b07          	ld	a,(OFST+4,sp)
4063  0029 1a04          	or	a,(OFST+1,sp)
4064                     ; 1666     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4066  002b c7515a        	ld	20826,a
4067                     ; 1667     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4069  002e 7b08          	ld	a,(OFST+5,sp)
4070  0030 c7515b        	ld	20827,a
4071                     ; 1669     status = SUCCESS;
4073  0033 a601          	ld	a,#1
4074  0035 6b01          	ld	(OFST-2,sp),a
4076  0037 2002          	jra	L3302
4077  0039               L1302:
4078                     ; 1673     status = ERROR;
4080  0039 0f01          	clr	(OFST-2,sp)
4081  003b               L3302:
4082                     ; 1677   RTC->WPR = 0xFF; 
4084  003b 35ff5159      	mov	20825,#255
4085                     ; 1679   return (ErrorStatus)(status);
4087  003f 7b01          	ld	a,(OFST-2,sp)
4090  0041 5b04          	addw	sp,#4
4091  0043 81            	ret	
4221                     ; 1715 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4221                     ; 1716                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4221                     ; 1717                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4221                     ; 1718 {
4222                     .text:	section	.text,new
4223  0000               _RTC_SmoothCalibConfig:
4225  0000 89            	pushw	x
4226  0001 5203          	subw	sp,#3
4227       00000003      OFST:	set	3
4230                     ; 1719   ErrorStatus status = ERROR;
4232                     ; 1720   uint16_t recalpfcount = 0;
4234  0003 5f            	clrw	x
4235  0004 1f02          	ldw	(OFST-1,sp),x
4236                     ; 1723   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4238                     ; 1724   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4240                     ; 1725   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4242                     ; 1728   RTC->WPR = 0xCA;
4244  0006 35ca5159      	mov	20825,#202
4245                     ; 1729   RTC->WPR = 0x53;
4247  000a 35535159      	mov	20825,#83
4248                     ; 1732   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4250  000e 7203514c0f    	btjf	20812,#1,L5112
4252  0013 2003          	jra	L1212
4253  0015               L7112:
4254                     ; 1737       recalpfcount++;
4256  0015 5c            	incw	x
4257  0016 1f02          	ldw	(OFST-1,sp),x
4258  0018               L1212:
4259                     ; 1735     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4261  0018 7203514c05    	btjf	20812,#1,L5112
4263  001d a3ffff        	cpw	x,#65535
4264  0020 26f3          	jrne	L7112
4265  0022               L5112:
4266                     ; 1743   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4268  0022 7202514c14    	btjt	20812,#1,L7212
4269                     ; 1746     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4269                     ; 1747                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4269                     ; 1748                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4271  0027 7b04          	ld	a,(OFST+1,sp)
4272  0029 1a05          	or	a,(OFST+2,sp)
4273  002b 1a08          	or	a,(OFST+5,sp)
4274  002d c7516a        	ld	20842,a
4275                     ; 1749     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4277  0030 7b09          	ld	a,(OFST+6,sp)
4278  0032 c7516b        	ld	20843,a
4279                     ; 1751     status = SUCCESS;
4281  0035 a601          	ld	a,#1
4282  0037 6b01          	ld	(OFST-2,sp),a
4284  0039 2002          	jra	L1312
4285  003b               L7212:
4286                     ; 1755     status = ERROR;
4288  003b 0f01          	clr	(OFST-2,sp)
4289  003d               L1312:
4290                     ; 1759   RTC->WPR = 0xFF; 
4292  003d 35ff5159      	mov	20825,#255
4293                     ; 1761   return (ErrorStatus)(status);
4295  0041 7b01          	ld	a,(OFST-2,sp)
4298  0043 5b05          	addw	sp,#5
4299  0045 81            	ret	
4357                     ; 1787 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4357                     ; 1788 {
4358                     .text:	section	.text,new
4359  0000               _RTC_CalibOutputConfig:
4363                     ; 1790   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4365                     ; 1793   RTC->WPR = 0xCA;
4367  0000 35ca5159      	mov	20825,#202
4368                     ; 1794   RTC->WPR = 0x53;
4370  0004 35535159      	mov	20825,#83
4371                     ; 1796   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4373  0008 4d            	tnz	a
4374  0009 2706          	jreq	L1612
4375                     ; 1799     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4377  000b 7216514a      	bset	20810,#3
4379  000f 2004          	jra	L3612
4380  0011               L1612:
4381                     ; 1804     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4383  0011 7217514a      	bres	20810,#3
4384  0015               L3612:
4385                     ; 1808   RTC->WPR = 0xFF; 
4387  0015 35ff5159      	mov	20825,#255
4388                     ; 1809 }
4391  0019 81            	ret	
4426                     ; 1817 void RTC_CalibOutputCmd(FunctionalState NewState)
4426                     ; 1818 {
4427                     .text:	section	.text,new
4428  0000               _RTC_CalibOutputCmd:
4432                     ; 1820   assert_param(IS_FUNCTIONAL_STATE(NewState));
4434                     ; 1823   RTC->WPR = 0xCA;
4436  0000 35ca5159      	mov	20825,#202
4437                     ; 1824   RTC->WPR = 0x53;
4439  0004 35535159      	mov	20825,#83
4440                     ; 1826   if (NewState != DISABLE)
4442  0008 4d            	tnz	a
4443  0009 2706          	jreq	L3022
4444                     ; 1829     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4446  000b 721e514a      	bset	20810,#7
4448  000f 2004          	jra	L5022
4449  0011               L3022:
4450                     ; 1834     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4452  0011 721f514a      	bres	20810,#7
4453  0015               L5022:
4454                     ; 1838   RTC->WPR = 0xFF; 
4456  0015 35ff5159      	mov	20825,#255
4457                     ; 1839 }
4460  0019 81            	ret	
4555                     ; 1868 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4555                     ; 1869                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4555                     ; 1870 {
4556                     .text:	section	.text,new
4557  0000               _RTC_TamperLevelConfig:
4559  0000 89            	pushw	x
4560       00000000      OFST:	set	0
4563                     ; 1872   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4565                     ; 1873   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4567                     ; 1876   RTC->WPR = 0xCA;
4569  0001 35ca5159      	mov	20825,#202
4570                     ; 1877   RTC->WPR = 0x53;
4572  0005 35535159      	mov	20825,#83
4573                     ; 1879   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4575  0009 9f            	ld	a,xl
4576  000a 4d            	tnz	a
4577  000b 2707          	jreq	L3522
4578                     ; 1882     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4580  000d 9e            	ld	a,xh
4581  000e 48            	sll	a
4582  000f ca516c        	or	a,20844
4584  0012 2007          	jra	L5522
4585  0014               L3522:
4586                     ; 1887     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4588  0014 7b01          	ld	a,(OFST+1,sp)
4589  0016 48            	sll	a
4590  0017 43            	cpl	a
4591  0018 c4516c        	and	a,20844
4592  001b               L5522:
4593  001b c7516c        	ld	20844,a
4594                     ; 1891   RTC->WPR = 0xFF; 
4596  001e 35ff5159      	mov	20825,#255
4597                     ; 1892 }
4600  0022 85            	popw	x
4601  0023 81            	ret	
4675                     ; 1900 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4675                     ; 1901 {
4676                     .text:	section	.text,new
4677  0000               _RTC_TamperFilterConfig:
4679  0000 88            	push	a
4680       00000000      OFST:	set	0
4683                     ; 1904   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4685                     ; 1907   RTC->WPR = 0xCA;
4687  0001 35ca5159      	mov	20825,#202
4688                     ; 1908   RTC->WPR = 0x53;
4690  0005 35535159      	mov	20825,#83
4691                     ; 1911   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4693  0009 c6516d        	ld	a,20845
4694  000c a4e7          	and	a,#231
4695  000e c7516d        	ld	20845,a
4696                     ; 1914   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4698  0011 c6516d        	ld	a,20845
4699  0014 1a01          	or	a,(OFST+1,sp)
4700  0016 c7516d        	ld	20845,a
4701                     ; 1917   RTC->WPR = 0xFF; 
4703  0019 35ff5159      	mov	20825,#255
4704                     ; 1919 }
4707  001d 84            	pop	a
4708  001e 81            	ret	
4821                     ; 1928 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4821                     ; 1929 {
4822                     .text:	section	.text,new
4823  0000               _RTC_TamperSamplingFreqConfig:
4825  0000 88            	push	a
4826       00000000      OFST:	set	0
4829                     ; 1931   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4831                     ; 1934   RTC->WPR = 0xCA;
4833  0001 35ca5159      	mov	20825,#202
4834                     ; 1935   RTC->WPR = 0x53;
4836  0005 35535159      	mov	20825,#83
4837                     ; 1938   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4839  0009 c6516d        	ld	a,20845
4840  000c a4f8          	and	a,#248
4841  000e c7516d        	ld	20845,a
4842                     ; 1941   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4844  0011 c6516d        	ld	a,20845
4845  0014 1a01          	or	a,(OFST+1,sp)
4846  0016 c7516d        	ld	20845,a
4847                     ; 1944   RTC->WPR = 0xFF; 
4849  0019 35ff5159      	mov	20825,#255
4850                     ; 1945 }
4853  001d 84            	pop	a
4854  001e 81            	ret	
4937                     ; 1955 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4937                     ; 1956 {
4938                     .text:	section	.text,new
4939  0000               _RTC_TamperPinsPrechargeDuration:
4941  0000 88            	push	a
4942       00000000      OFST:	set	0
4945                     ; 1958   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4947                     ; 1961   RTC->WPR = 0xCA;
4949  0001 35ca5159      	mov	20825,#202
4950                     ; 1962   RTC->WPR = 0x53;
4952  0005 35535159      	mov	20825,#83
4953                     ; 1965   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4955  0009 c6516d        	ld	a,20845
4956  000c a41f          	and	a,#31
4957  000e c7516d        	ld	20845,a
4958                     ; 1968   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4960  0011 c6516d        	ld	a,20845
4961  0014 1a01          	or	a,(OFST+1,sp)
4962  0016 c7516d        	ld	20845,a
4963                     ; 1971   RTC->WPR = 0xFF; 
4965  0019 35ff5159      	mov	20825,#255
4966                     ; 1972 }
4969  001d 84            	pop	a
4970  001e 81            	ret	
5015                     ; 1984 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5015                     ; 1985                    FunctionalState NewState)
5015                     ; 1986 {
5016                     .text:	section	.text,new
5017  0000               _RTC_TamperCmd:
5019  0000 89            	pushw	x
5020       00000000      OFST:	set	0
5023                     ; 1989   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5025                     ; 1990   assert_param(IS_FUNCTIONAL_STATE(NewState));
5027                     ; 1993   RTC->WPR = 0xCA;
5029  0001 35ca5159      	mov	20825,#202
5030                     ; 1994   RTC->WPR = 0x53;
5032  0005 35535159      	mov	20825,#83
5033                     ; 1997   if (NewState != DISABLE)
5035  0009 9f            	ld	a,xl
5036  000a 4d            	tnz	a
5037  000b 2706          	jreq	L1342
5038                     ; 2000     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5040  000d 9e            	ld	a,xh
5041  000e ca516c        	or	a,20844
5043  0011 2006          	jra	L3342
5044  0013               L1342:
5045                     ; 2005     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5047  0013 7b01          	ld	a,(OFST+1,sp)
5048  0015 43            	cpl	a
5049  0016 c4516c        	and	a,20844
5050  0019               L3342:
5051  0019 c7516c        	ld	20844,a
5052                     ; 2010   RTC->WPR = 0xFF; 
5054  001c 35ff5159      	mov	20825,#255
5055                     ; 2011 }
5058  0020 85            	popw	x
5059  0021 81            	ret	
5131                     ; 2055 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5131                     ; 2056 {
5132                     .text:	section	.text,new
5133  0000               _RTC_ITConfig:
5135  0000 89            	pushw	x
5136       00000000      OFST:	set	0
5139                     ; 2058   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5141                     ; 2059   assert_param(IS_FUNCTIONAL_STATE(NewState));
5143                     ; 2062   RTC->WPR = 0xCA;
5145  0001 35ca5159      	mov	20825,#202
5146                     ; 2063   RTC->WPR = 0x53;
5148  0005 35535159      	mov	20825,#83
5149                     ; 2065   if (NewState != DISABLE)
5151  0009 7b05          	ld	a,(OFST+5,sp)
5152  000b 2712          	jreq	L1742
5153                     ; 2068     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5155  000d 9f            	ld	a,xl
5156  000e a4f0          	and	a,#240
5157  0010 ca5149        	or	a,20809
5158  0013 c75149        	ld	20809,a
5159                     ; 2069     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5161  0016 7b02          	ld	a,(OFST+2,sp)
5162  0018 a401          	and	a,#1
5163  001a ca516c        	or	a,20844
5165  001d 2013          	jra	L3742
5166  001f               L1742:
5167                     ; 2074     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5169  001f 7b02          	ld	a,(OFST+2,sp)
5170  0021 a4f0          	and	a,#240
5171  0023 43            	cpl	a
5172  0024 c45149        	and	a,20809
5173  0027 c75149        	ld	20809,a
5174                     ; 2075     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5176  002a 7b02          	ld	a,(OFST+2,sp)
5177  002c a401          	and	a,#1
5178  002e 43            	cpl	a
5179  002f c4516c        	and	a,20844
5180  0032               L3742:
5181  0032 c7516c        	ld	20844,a
5182                     ; 2079   RTC->WPR = 0xFF; 
5184  0035 35ff5159      	mov	20825,#255
5185                     ; 2080 }
5188  0039 85            	popw	x
5189  003a 81            	ret	
5363                     ; 2087 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5363                     ; 2088 {
5364                     .text:	section	.text,new
5365  0000               _RTC_GetFlagStatus:
5367  0000 89            	pushw	x
5368  0001 5203          	subw	sp,#3
5369       00000003      OFST:	set	3
5372                     ; 2089   FlagStatus flagstatus = RESET;
5374                     ; 2090   uint16_t tmpreg1 = 0;
5376                     ; 2091   uint16_t tmpreg2 = 0;
5378                     ; 2094   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5380                     ; 2097   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5382  0003 c6514c        	ld	a,20812
5383  0006 97            	ld	xl,a
5384  0007 4f            	clr	a
5385  0008 02            	rlwa	x,a
5386  0009 1f02          	ldw	(OFST-1,sp),x
5387                     ; 2098   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5389  000b 5f            	clrw	x
5390  000c c6514d        	ld	a,20813
5391  000f 97            	ld	xl,a
5392  0010 01            	rrwa	x,a
5393  0011 1a03          	or	a,(OFST+0,sp)
5394  0013 01            	rrwa	x,a
5395  0014 1a02          	or	a,(OFST-1,sp)
5396  0016 01            	rrwa	x,a
5397  0017 1f02          	ldw	(OFST-1,sp),x
5398                     ; 2101   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5400  0019 01            	rrwa	x,a
5401  001a 1405          	and	a,(OFST+2,sp)
5402  001c 01            	rrwa	x,a
5403  001d 1404          	and	a,(OFST+1,sp)
5404  001f 01            	rrwa	x,a
5405  0020 5d            	tnzw	x
5406  0021 2704          	jreq	L3752
5407                     ; 2103     flagstatus = SET;
5409  0023 a601          	ld	a,#1
5411  0025 2001          	jra	L5752
5412  0027               L3752:
5413                     ; 2107     flagstatus = RESET;
5415  0027 4f            	clr	a
5416  0028               L5752:
5417                     ; 2109   return (FlagStatus)flagstatus;
5421  0028 5b05          	addw	sp,#5
5422  002a 81            	ret	
5457                     ; 2119 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5457                     ; 2120 {
5458                     .text:	section	.text,new
5459  0000               _RTC_ClearFlag:
5461  0000 89            	pushw	x
5462       00000000      OFST:	set	0
5465                     ; 2122   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5467                     ; 2125   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5469  0001 9f            	ld	a,xl
5470  0002 43            	cpl	a
5471  0003 c7514d        	ld	20813,a
5472                     ; 2126   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5474  0006 7b01          	ld	a,(OFST+1,sp)
5475  0008 43            	cpl	a
5476  0009 a47f          	and	a,#127
5477  000b c7514c        	ld	20812,a
5478                     ; 2127 }
5481  000e 85            	popw	x
5482  000f 81            	ret	
5546                     ; 2135 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5546                     ; 2136 {
5547                     .text:	section	.text,new
5548  0000               _RTC_GetITStatus:
5550  0000 89            	pushw	x
5551  0001 89            	pushw	x
5552       00000002      OFST:	set	2
5555                     ; 2137   ITStatus itstatus = RESET;
5557                     ; 2138   uint8_t enablestatus = 0, tmpreg = 0;
5561                     ; 2141   assert_param(IS_RTC_GET_IT(RTC_IT));
5563                     ; 2144   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5565  0002 9f            	ld	a,xl
5566  0003 c45149        	and	a,20809
5567  0006 6b01          	ld	(OFST-1,sp),a
5568                     ; 2147   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5570  0008 1e03          	ldw	x,(OFST+1,sp)
5571  000a 54            	srlw	x
5572  000b 54            	srlw	x
5573  000c 54            	srlw	x
5574  000d 54            	srlw	x
5575  000e 9f            	ld	a,xl
5576  000f c4514d        	and	a,20813
5577  0012 6b02          	ld	(OFST+0,sp),a
5578                     ; 2150   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5580  0014 7b01          	ld	a,(OFST-1,sp)
5581  0016 2708          	jreq	L7462
5583  0018 7b02          	ld	a,(OFST+0,sp)
5584  001a 2704          	jreq	L7462
5585                     ; 2152     itstatus = SET;
5587  001c a601          	ld	a,#1
5589  001e 2001          	jra	L1562
5590  0020               L7462:
5591                     ; 2156     itstatus = RESET;
5593  0020 4f            	clr	a
5594  0021               L1562:
5595                     ; 2159   return (ITStatus)itstatus;
5599  0021 5b04          	addw	sp,#4
5600  0023 81            	ret	
5636                     ; 2169 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5636                     ; 2170 {
5637                     .text:	section	.text,new
5638  0000               _RTC_ClearITPendingBit:
5642                     ; 2172   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5644                     ; 2175   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5646  0000 54            	srlw	x
5647  0001 54            	srlw	x
5648  0002 54            	srlw	x
5649  0003 54            	srlw	x
5650  0004 9f            	ld	a,xl
5651  0005 43            	cpl	a
5652  0006 c7514d        	ld	20813,a
5653                     ; 2176 }
5656  0009 81            	ret	
5699                     ; 2199 static uint8_t ByteToBcd2(uint8_t Value)
5699                     ; 2200 {
5700                     .text:	section	.text,new
5701  0000               L3_ByteToBcd2:
5703  0000 88            	push	a
5704  0001 88            	push	a
5705       00000001      OFST:	set	1
5708                     ; 2201   uint8_t bcdhigh = 0;
5710  0002 0f01          	clr	(OFST+0,sp)
5712  0004 7b02          	ld	a,(OFST+1,sp)
5713  0006 2006          	jra	L7172
5714  0008               L3172:
5715                     ; 2205     bcdhigh++;
5717  0008 0c01          	inc	(OFST+0,sp)
5718                     ; 2206     Value -= 10;
5720  000a a00a          	sub	a,#10
5721  000c 6b02          	ld	(OFST+1,sp),a
5722  000e               L7172:
5723                     ; 2203   while (Value >= 10)
5725  000e a10a          	cp	a,#10
5726  0010 24f6          	jruge	L3172
5727                     ; 2209   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5729  0012 7b01          	ld	a,(OFST+0,sp)
5730  0014 97            	ld	xl,a
5731  0015 a610          	ld	a,#16
5732  0017 42            	mul	x,a
5733  0018 9f            	ld	a,xl
5734  0019 1a02          	or	a,(OFST+1,sp)
5737  001b 85            	popw	x
5738  001c 81            	ret	
5781                     ; 2217 static uint8_t Bcd2ToByte(uint8_t Value)
5781                     ; 2218 {
5782                     .text:	section	.text,new
5783  0000               L5_Bcd2ToByte:
5785  0000 88            	push	a
5786  0001 88            	push	a
5787       00000001      OFST:	set	1
5790                     ; 2219   uint8_t tmp = 0;
5792                     ; 2221   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5794  0002 4e            	swap	a
5795  0003 a40f          	and	a,#15
5796  0005 97            	ld	xl,a
5797  0006 a60a          	ld	a,#10
5798  0008 42            	mul	x,a
5799  0009 9f            	ld	a,xl
5800  000a 6b01          	ld	(OFST+0,sp),a
5801                     ; 2223   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5803  000c 7b02          	ld	a,(OFST+1,sp)
5804  000e a40f          	and	a,#15
5805  0010 1b01          	add	a,(OFST+0,sp)
5808  0012 85            	popw	x
5809  0013 81            	ret	
5822                     	xdef	_RTC_ClearITPendingBit
5823                     	xdef	_RTC_GetITStatus
5824                     	xdef	_RTC_ClearFlag
5825                     	xdef	_RTC_GetFlagStatus
5826                     	xdef	_RTC_ITConfig
5827                     	xdef	_RTC_TamperCmd
5828                     	xdef	_RTC_TamperPinsPrechargeDuration
5829                     	xdef	_RTC_TamperSamplingFreqConfig
5830                     	xdef	_RTC_TamperFilterConfig
5831                     	xdef	_RTC_TamperLevelConfig
5832                     	xdef	_RTC_CalibOutputCmd
5833                     	xdef	_RTC_CalibOutputConfig
5834                     	xdef	_RTC_SmoothCalibConfig
5835                     	xdef	_RTC_SynchroShiftConfig
5836                     	xdef	_RTC_OutputConfig
5837                     	xdef	_RTC_GetStoreOperation
5838                     	xdef	_RTC_DayLightSavingConfig
5839                     	xdef	_RTC_WakeUpCmd
5840                     	xdef	_RTC_GetWakeUpCounter
5841                     	xdef	_RTC_SetWakeUpCounter
5842                     	xdef	_RTC_WakeUpClockConfig
5843                     	xdef	_RTC_AlarmSubSecondConfig
5844                     	xdef	_RTC_AlarmCmd
5845                     	xdef	_RTC_GetAlarm
5846                     	xdef	_RTC_AlarmStructInit
5847                     	xdef	_RTC_SetAlarm
5848                     	xdef	_RTC_GetDate
5849                     	xdef	_RTC_DateStructInit
5850                     	xdef	_RTC_SetDate
5851                     	xdef	_RTC_GetSubSecond
5852                     	xdef	_RTC_GetTime
5853                     	xdef	_RTC_TimeStructInit
5854                     	xdef	_RTC_SetTime
5855                     	xdef	_RTC_BypassShadowCmd
5856                     	xdef	_RTC_RatioCmd
5857                     	xdef	_RTC_WaitForSynchro
5858                     	xdef	_RTC_ExitInitMode
5859                     	xdef	_RTC_EnterInitMode
5860                     	xdef	_RTC_WriteProtectionCmd
5861                     	xdef	_RTC_StructInit
5862                     	xdef	_RTC_Init
5863                     	xdef	_RTC_DeInit
5882                     	end
