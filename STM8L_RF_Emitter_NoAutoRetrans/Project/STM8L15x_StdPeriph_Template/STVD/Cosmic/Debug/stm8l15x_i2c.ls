   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
 206                     ; 138 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 139 {
 208                     .text:	section	.text,new
 209  0000               _I2C_DeInit:
 213                     ; 140   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 215  0000 7f            	clr	(x)
 216                     ; 141   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 218  0001 6f01          	clr	(1,x)
 219                     ; 142   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 221  0003 6f02          	clr	(2,x)
 222                     ; 143   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 224  0005 6f03          	clr	(3,x)
 225                     ; 144   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 227  0007 6f04          	clr	(4,x)
 228                     ; 145   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 230  0009 6f05          	clr	(5,x)
 231                     ; 146   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 233  000b 6f0a          	clr	(10,x)
 234                     ; 147   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 236  000d 6f0b          	clr	(11,x)
 237                     ; 148   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 239  000f 6f0c          	clr	(12,x)
 240                     ; 149   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 242  0011 a602          	ld	a,#2
 243  0013 e70d          	ld	(13,x),a
 244                     ; 150 }
 247  0015 81            	ret	
 471                     .const:	section	.text
 472  0000               L21:
 473  0000 000f4240      	dc.l	1000000
 474  0004               L41:
 475  0004 000186a1      	dc.l	100001
 476  0008               L61:
 477  0008 00000004      	dc.l	4
 478                     ; 181 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 478                     ; 182               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 478                     ; 183               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 478                     ; 184 {
 479                     .text:	section	.text,new
 480  0000               _I2C_Init:
 482  0000 89            	pushw	x
 483  0001 520c          	subw	sp,#12
 484       0000000c      OFST:	set	12
 487                     ; 185   uint32_t result = 0x0004;
 489                     ; 186   uint16_t tmpval = 0;
 491                     ; 187   uint8_t tmpccrh = 0;
 493  0003 0f07          	clr	(OFST-5,sp)
 494                     ; 188   uint8_t input_clock = 0;
 496                     ; 191   assert_param(IS_I2C_MODE(I2C_Mode));
 498                     ; 192   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 500                     ; 193   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 502                     ; 194   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 504                     ; 195   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 506                     ; 196   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 508                     ; 200   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 510  0005 cd0000        	call	_CLK_GetClockFreq
 512  0008 ae0000        	ldw	x,#L21
 513  000b cd0000        	call	c_ludv
 515  000e b603          	ld	a,c_lreg+3
 516  0010 6b08          	ld	(OFST-4,sp),a
 517                     ; 204   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 519  0012 1e0d          	ldw	x,(OFST+1,sp)
 520  0014 e602          	ld	a,(2,x)
 521  0016 a4c0          	and	a,#192
 522  0018 e702          	ld	(2,x),a
 523                     ; 206   I2Cx->FREQR |= input_clock;
 525  001a e602          	ld	a,(2,x)
 526  001c 1a08          	or	a,(OFST-4,sp)
 527  001e e702          	ld	(2,x),a
 528                     ; 210   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 530  0020 f6            	ld	a,(x)
 531  0021 a4fe          	and	a,#254
 532  0023 f7            	ld	(x),a
 533                     ; 213   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 535  0024 e60c          	ld	a,(12,x)
 536  0026 a430          	and	a,#48
 537  0028 e70c          	ld	(12,x),a
 538                     ; 214   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 540  002a 6f0b          	clr	(11,x)
 541                     ; 217   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 543  002c 96            	ldw	x,sp
 544  002d 1c0011        	addw	x,#OFST+5
 545  0030 cd0000        	call	c_ltor
 547  0033 ae0004        	ldw	x,#L41
 548  0036 cd0000        	call	c_lcmp
 550  0039 2576          	jrult	L362
 551                     ; 220     tmpccrh = I2C_CCRH_FS;
 553  003b a680          	ld	a,#128
 554  003d 6b07          	ld	(OFST-5,sp),a
 555                     ; 222     if (I2C_DutyCycle == I2C_DutyCycle_2)
 557  003f 96            	ldw	x,sp
 558  0040 0d18          	tnz	(OFST+12,sp)
 559  0042 2623          	jrne	L562
 560                     ; 225       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 562  0044 1c0011        	addw	x,#OFST+5
 563  0047 cd0000        	call	c_ltor
 565  004a a603          	ld	a,#3
 566  004c cd0000        	call	c_smul
 568  004f 96            	ldw	x,sp
 569  0050 5c            	incw	x
 570  0051 cd0000        	call	c_rtol
 572  0054 7b08          	ld	a,(OFST-4,sp)
 573  0056 cd012e        	call	LC001
 575  0059 96            	ldw	x,sp
 576  005a 5c            	incw	x
 577  005b cd0000        	call	c_ludv
 579  005e 96            	ldw	x,sp
 580  005f 1c0009        	addw	x,#OFST-3
 581  0062 cd0000        	call	c_rtol
 584  0065 2027          	jra	L762
 585  0067               L562:
 586                     ; 230       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 588  0067 1c0011        	addw	x,#OFST+5
 589  006a cd0000        	call	c_ltor
 591  006d a619          	ld	a,#25
 592  006f cd0000        	call	c_smul
 594  0072 96            	ldw	x,sp
 595  0073 5c            	incw	x
 596  0074 cd0000        	call	c_rtol
 598  0077 7b08          	ld	a,(OFST-4,sp)
 599  0079 cd012e        	call	LC001
 601  007c 96            	ldw	x,sp
 602  007d 5c            	incw	x
 603  007e cd0000        	call	c_ludv
 605  0081 96            	ldw	x,sp
 606  0082 1c0009        	addw	x,#OFST-3
 607  0085 cd0000        	call	c_rtol
 609                     ; 232       tmpccrh |= I2C_CCRH_DUTY;
 611  0088 7b07          	ld	a,(OFST-5,sp)
 612  008a aa40          	or	a,#64
 613  008c 6b07          	ld	(OFST-5,sp),a
 614  008e               L762:
 615                     ; 236     if (result < (uint16_t)0x01)
 617  008e 96            	ldw	x,sp
 618  008f 1c0009        	addw	x,#OFST-3
 619  0092 cd0000        	call	c_lzmp
 621  0095 2608          	jrne	L172
 622                     ; 239       result = (uint16_t)0x0001;
 624  0097 ae0001        	ldw	x,#1
 625  009a 1f0b          	ldw	(OFST-1,sp),x
 626  009c 5f            	clrw	x
 627  009d 1f09          	ldw	(OFST-3,sp),x
 628  009f               L172:
 629                     ; 245     tmpval = ((input_clock * 3) / 10) + 1;
 631  009f 7b08          	ld	a,(OFST-4,sp)
 632  00a1 97            	ld	xl,a
 633  00a2 a603          	ld	a,#3
 634  00a4 42            	mul	x,a
 635  00a5 a60a          	ld	a,#10
 636  00a7 cd0000        	call	c_sdivx
 638  00aa 5c            	incw	x
 639  00ab 1f05          	ldw	(OFST-7,sp),x
 640                     ; 246     I2Cx->TRISER = (uint8_t)tmpval;
 642  00ad 7b06          	ld	a,(OFST-6,sp)
 644  00af 2046          	jra	L372
 645  00b1               L362:
 646                     ; 253     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 648  00b1 96            	ldw	x,sp
 649  00b2 1c0011        	addw	x,#OFST+5
 650  00b5 cd0000        	call	c_ltor
 652  00b8 3803          	sll	c_lreg+3
 653  00ba 3902          	rlc	c_lreg+2
 654  00bc 3901          	rlc	c_lreg+1
 655  00be 96            	ldw	x,sp
 656  00bf 3900          	rlc	c_lreg
 657  00c1 5c            	incw	x
 658  00c2 cd0000        	call	c_rtol
 660  00c5 7b08          	ld	a,(OFST-4,sp)
 661  00c7 ad65          	call	LC001
 663  00c9 96            	ldw	x,sp
 664  00ca 5c            	incw	x
 665  00cb cd0000        	call	c_ludv
 667  00ce b602          	ld	a,c_lreg+2
 668  00d0 97            	ld	xl,a
 669  00d1 b603          	ld	a,c_lreg+3
 670  00d3 cd0000        	call	c_uitol
 672  00d6 96            	ldw	x,sp
 673  00d7 1c0009        	addw	x,#OFST-3
 674  00da cd0000        	call	c_rtol
 676                     ; 256     if (result < (uint16_t)0x0004)
 678  00dd 96            	ldw	x,sp
 679  00de 1c0009        	addw	x,#OFST-3
 680  00e1 cd0000        	call	c_ltor
 682  00e4 ae0008        	ldw	x,#L61
 683  00e7 cd0000        	call	c_lcmp
 685  00ea 2408          	jruge	L572
 686                     ; 259       result = (uint16_t)0x0004;
 688  00ec ae0004        	ldw	x,#4
 689  00ef 1f0b          	ldw	(OFST-1,sp),x
 690  00f1 5f            	clrw	x
 691  00f2 1f09          	ldw	(OFST-3,sp),x
 692  00f4               L572:
 693                     ; 265     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 695  00f4 7b08          	ld	a,(OFST-4,sp)
 696  00f6 4c            	inc	a
 697  00f7               L372:
 698  00f7 1e0d          	ldw	x,(OFST+1,sp)
 699  00f9 e70d          	ld	(13,x),a
 700                     ; 270   I2Cx->CCRL = (uint8_t)result;
 702  00fb 7b0c          	ld	a,(OFST+0,sp)
 703  00fd e70b          	ld	(11,x),a
 704                     ; 271   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 706  00ff 7b07          	ld	a,(OFST-5,sp)
 707  0101 e70c          	ld	(12,x),a
 708                     ; 274   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 710  0103 7b17          	ld	a,(OFST+11,sp)
 711  0105 aa01          	or	a,#1
 712  0107 fa            	or	a,(x)
 713  0108 f7            	ld	(x),a
 714                     ; 277   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 716  0109 e601          	ld	a,(1,x)
 717  010b 1a19          	or	a,(OFST+13,sp)
 718  010d e701          	ld	(1,x),a
 719                     ; 280   I2Cx->OARL = (uint8_t)(OwnAddress);
 721  010f 7b16          	ld	a,(OFST+10,sp)
 722  0111 e703          	ld	(3,x),a
 723                     ; 281   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 723                     ; 282                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 725  0113 7b15          	ld	a,(OFST+9,sp)
 726  0115 a403          	and	a,#3
 727  0117 97            	ld	xl,a
 728  0118 4f            	clr	a
 729  0119 02            	rlwa	x,a
 730  011a 4f            	clr	a
 731  011b 01            	rrwa	x,a
 732  011c 48            	sll	a
 733  011d 59            	rlcw	x
 734  011e 9f            	ld	a,xl
 735  011f 6b04          	ld	(OFST-8,sp),a
 736  0121 7b1a          	ld	a,(OFST+14,sp)
 737  0123 aa40          	or	a,#64
 738  0125 1e0d          	ldw	x,(OFST+1,sp)
 739  0127 1a04          	or	a,(OFST-8,sp)
 740  0129 e704          	ld	(4,x),a
 741                     ; 283 }
 744  012b 5b0e          	addw	sp,#14
 745  012d 81            	ret	
 746  012e               LC001:
 747  012e b703          	ld	c_lreg+3,a
 748  0130 3f02          	clr	c_lreg+2
 749  0132 3f01          	clr	c_lreg+1
 750  0134 3f00          	clr	c_lreg
 751  0136 ae0000        	ldw	x,#L21
 752  0139 cc0000        	jp	c_lmul
 819                     ; 292 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 819                     ; 293 {
 820                     .text:	section	.text,new
 821  0000               _I2C_Cmd:
 823  0000 89            	pushw	x
 824       00000000      OFST:	set	0
 827                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 829                     ; 298   if (NewState != DISABLE)
 831  0001 7b05          	ld	a,(OFST+5,sp)
 832  0003 2705          	jreq	L333
 833                     ; 301     I2Cx->CR1 |= I2C_CR1_PE;
 835  0005 f6            	ld	a,(x)
 836  0006 aa01          	or	a,#1
 838  0008 2005          	jra	L533
 839  000a               L333:
 840                     ; 306     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 842  000a 1e01          	ldw	x,(OFST+1,sp)
 843  000c f6            	ld	a,(x)
 844  000d a4fe          	and	a,#254
 845  000f               L533:
 846  000f f7            	ld	(x),a
 847                     ; 308 }
 850  0010 85            	popw	x
 851  0011 81            	ret	
 898                     ; 317 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 898                     ; 318 {
 899                     .text:	section	.text,new
 900  0000               _I2C_GeneralCallCmd:
 902  0000 89            	pushw	x
 903       00000000      OFST:	set	0
 906                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 908                     ; 323   if (NewState != DISABLE)
 910  0001 7b05          	ld	a,(OFST+5,sp)
 911  0003 2705          	jreq	L363
 912                     ; 326     I2Cx->CR1 |= I2C_CR1_ENGC;
 914  0005 f6            	ld	a,(x)
 915  0006 aa40          	or	a,#64
 917  0008 2005          	jra	L563
 918  000a               L363:
 919                     ; 331     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 921  000a 1e01          	ldw	x,(OFST+1,sp)
 922  000c f6            	ld	a,(x)
 923  000d a4bf          	and	a,#191
 924  000f               L563:
 925  000f f7            	ld	(x),a
 926                     ; 333 }
 929  0010 85            	popw	x
 930  0011 81            	ret	
 977                     ; 344 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 977                     ; 345 {
 978                     .text:	section	.text,new
 979  0000               _I2C_GenerateSTART:
 981  0000 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 987                     ; 350   if (NewState != DISABLE)
 989  0001 7b05          	ld	a,(OFST+5,sp)
 990  0003 2706          	jreq	L314
 991                     ; 353     I2Cx->CR2 |= I2C_CR2_START;
 993  0005 e601          	ld	a,(1,x)
 994  0007 aa01          	or	a,#1
 996  0009 2006          	jra	L514
 997  000b               L314:
 998                     ; 358     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1000  000b 1e01          	ldw	x,(OFST+1,sp)
1001  000d e601          	ld	a,(1,x)
1002  000f a4fe          	and	a,#254
1003  0011               L514:
1004  0011 e701          	ld	(1,x),a
1005                     ; 360 }
1008  0013 85            	popw	x
1009  0014 81            	ret	
1056                     ; 369 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1056                     ; 370 {
1057                     .text:	section	.text,new
1058  0000               _I2C_GenerateSTOP:
1060  0000 89            	pushw	x
1061       00000000      OFST:	set	0
1064                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1066                     ; 375   if (NewState != DISABLE)
1068  0001 7b05          	ld	a,(OFST+5,sp)
1069  0003 2706          	jreq	L344
1070                     ; 378     I2Cx->CR2 |= I2C_CR2_STOP;
1072  0005 e601          	ld	a,(1,x)
1073  0007 aa02          	or	a,#2
1075  0009 2006          	jra	L544
1076  000b               L344:
1077                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1079  000b 1e01          	ldw	x,(OFST+1,sp)
1080  000d e601          	ld	a,(1,x)
1081  000f a4fd          	and	a,#253
1082  0011               L544:
1083  0011 e701          	ld	(1,x),a
1084                     ; 385 }
1087  0013 85            	popw	x
1088  0014 81            	ret	
1136                     ; 394 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1136                     ; 395 {
1137                     .text:	section	.text,new
1138  0000               _I2C_SoftwareResetCmd:
1140  0000 89            	pushw	x
1141       00000000      OFST:	set	0
1144                     ; 397   assert_param(IS_FUNCTIONAL_STATE(NewState));
1146                     ; 399   if (NewState != DISABLE)
1148  0001 7b05          	ld	a,(OFST+5,sp)
1149  0003 2706          	jreq	L374
1150                     ; 402     I2Cx->CR2 |= I2C_CR2_SWRST;
1152  0005 e601          	ld	a,(1,x)
1153  0007 aa80          	or	a,#128
1155  0009 2006          	jra	L574
1156  000b               L374:
1157                     ; 407     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1159  000b 1e01          	ldw	x,(OFST+1,sp)
1160  000d e601          	ld	a,(1,x)
1161  000f a47f          	and	a,#127
1162  0011               L574:
1163  0011 e701          	ld	(1,x),a
1164                     ; 409 }
1167  0013 85            	popw	x
1168  0014 81            	ret	
1216                     ; 418 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1216                     ; 419 {
1217                     .text:	section	.text,new
1218  0000               _I2C_StretchClockCmd:
1220  0000 89            	pushw	x
1221       00000000      OFST:	set	0
1224                     ; 421   assert_param(IS_FUNCTIONAL_STATE(NewState));
1226                     ; 423   if (NewState != DISABLE)
1228  0001 7b05          	ld	a,(OFST+5,sp)
1229  0003 2705          	jreq	L325
1230                     ; 426     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1232  0005 f6            	ld	a,(x)
1233  0006 a47f          	and	a,#127
1235  0008 2005          	jra	L525
1236  000a               L325:
1237                     ; 432     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1239  000a 1e01          	ldw	x,(OFST+1,sp)
1240  000c f6            	ld	a,(x)
1241  000d aa80          	or	a,#128
1242  000f               L525:
1243  000f f7            	ld	(x),a
1244                     ; 434 }
1247  0010 85            	popw	x
1248  0011 81            	ret	
1295                     ; 443 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1295                     ; 444 {
1296                     .text:	section	.text,new
1297  0000               _I2C_ARPCmd:
1299  0000 89            	pushw	x
1300       00000000      OFST:	set	0
1303                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1305                     ; 448   if (NewState != DISABLE)
1307  0001 7b05          	ld	a,(OFST+5,sp)
1308  0003 2705          	jreq	L355
1309                     ; 451     I2Cx->CR1 |= I2C_CR1_ARP;
1311  0005 f6            	ld	a,(x)
1312  0006 aa10          	or	a,#16
1314  0008 2005          	jra	L555
1315  000a               L355:
1316                     ; 457     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1318  000a 1e01          	ldw	x,(OFST+1,sp)
1319  000c f6            	ld	a,(x)
1320  000d a4ef          	and	a,#239
1321  000f               L555:
1322  000f f7            	ld	(x),a
1323                     ; 459 }
1326  0010 85            	popw	x
1327  0011 81            	ret	
1375                     ; 468 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1375                     ; 469 {
1376                     .text:	section	.text,new
1377  0000               _I2C_AcknowledgeConfig:
1379  0000 89            	pushw	x
1380       00000000      OFST:	set	0
1383                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1385                     ; 473   if (NewState != DISABLE)
1387  0001 7b05          	ld	a,(OFST+5,sp)
1388  0003 2706          	jreq	L306
1389                     ; 476     I2Cx->CR2 |= I2C_CR2_ACK;
1391  0005 e601          	ld	a,(1,x)
1392  0007 aa04          	or	a,#4
1394  0009 2006          	jra	L506
1395  000b               L306:
1396                     ; 481     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1398  000b 1e01          	ldw	x,(OFST+1,sp)
1399  000d e601          	ld	a,(1,x)
1400  000f a4fb          	and	a,#251
1401  0011               L506:
1402  0011 e701          	ld	(1,x),a
1403                     ; 483 }
1406  0013 85            	popw	x
1407  0014 81            	ret	
1463                     ; 491 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1463                     ; 492 {
1464                     .text:	section	.text,new
1465  0000               _I2C_OwnAddress2Config:
1467  0000 89            	pushw	x
1468  0001 88            	push	a
1469       00000001      OFST:	set	1
1472                     ; 493   uint8_t tmpreg = 0;
1474                     ; 496   tmpreg = I2Cx->OAR2;
1476  0002 e605          	ld	a,(5,x)
1477                     ; 499   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1479  0004 a401          	and	a,#1
1480  0006 6b01          	ld	(OFST+0,sp),a
1481                     ; 502   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1483  0008 7b06          	ld	a,(OFST+5,sp)
1484  000a a4fe          	and	a,#254
1485  000c 1a01          	or	a,(OFST+0,sp)
1486  000e 6b01          	ld	(OFST+0,sp),a
1487                     ; 505   I2Cx->OAR2 = tmpreg;
1489  0010 1e02          	ldw	x,(OFST+1,sp)
1490  0012 e705          	ld	(5,x),a
1491                     ; 506 }
1494  0014 5b03          	addw	sp,#3
1495  0016 81            	ret	
1542                     ; 515 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1542                     ; 516 {
1543                     .text:	section	.text,new
1544  0000               _I2C_DualAddressCmd:
1546  0000 89            	pushw	x
1547       00000000      OFST:	set	0
1550                     ; 518   assert_param(IS_FUNCTIONAL_STATE(NewState));
1552                     ; 520   if (NewState != DISABLE)
1554  0001 7b05          	ld	a,(OFST+5,sp)
1555  0003 2706          	jreq	L366
1556                     ; 523     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1558  0005 e605          	ld	a,(5,x)
1559  0007 aa01          	or	a,#1
1561  0009 2006          	jra	L566
1562  000b               L366:
1563                     ; 528     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1565  000b 1e01          	ldw	x,(OFST+1,sp)
1566  000d e605          	ld	a,(5,x)
1567  000f a4fe          	and	a,#254
1568  0011               L566:
1569  0011 e705          	ld	(5,x),a
1570                     ; 530 }
1573  0013 85            	popw	x
1574  0014 81            	ret	
1644                     ; 542 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1644                     ; 543 {
1645                     .text:	section	.text,new
1646  0000               _I2C_AckPositionConfig:
1648  0000 89            	pushw	x
1649       00000000      OFST:	set	0
1652                     ; 545   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1654                     ; 548   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1656  0001 e601          	ld	a,(1,x)
1657  0003 a4f7          	and	a,#247
1658  0005 e701          	ld	(1,x),a
1659                     ; 550   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1661  0007 e601          	ld	a,(1,x)
1662  0009 1a05          	or	a,(OFST+5,sp)
1663  000b e701          	ld	(1,x),a
1664                     ; 551 }
1667  000d 85            	popw	x
1668  000e 81            	ret	
1737                     ; 562 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1737                     ; 563 {
1738                     .text:	section	.text,new
1739  0000               _I2C_SMBusAlertConfig:
1741  0000 89            	pushw	x
1742       00000000      OFST:	set	0
1745                     ; 566   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1747                     ; 568   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1749  0001 7b05          	ld	a,(OFST+5,sp)
1750  0003 2706          	jreq	L757
1751                     ; 571     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1753  0005 e601          	ld	a,(1,x)
1754  0007 aa20          	or	a,#32
1756  0009 2006          	jra	L167
1757  000b               L757:
1758                     ; 576     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1760  000b 1e01          	ldw	x,(OFST+1,sp)
1761  000d e601          	ld	a,(1,x)
1762  000f a4df          	and	a,#223
1763  0011               L167:
1764  0011 e701          	ld	(1,x),a
1765                     ; 578 }
1768  0013 85            	popw	x
1769  0014 81            	ret	
1817                     ; 589 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1817                     ; 590 {
1818                     .text:	section	.text,new
1819  0000               _I2C_FastModeDutyCycleConfig:
1821  0000 89            	pushw	x
1822       00000000      OFST:	set	0
1825                     ; 593   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1827                     ; 595   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1829  0001 7b05          	ld	a,(OFST+5,sp)
1830  0003 a140          	cp	a,#64
1831  0005 2606          	jrne	L7001
1832                     ; 598     I2Cx->CCRH |= I2C_CCRH_DUTY;
1834  0007 e60c          	ld	a,(12,x)
1835  0009 aa40          	or	a,#64
1837  000b 2006          	jra	L1101
1838  000d               L7001:
1839                     ; 603     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1841  000d 1e01          	ldw	x,(OFST+1,sp)
1842  000f e60c          	ld	a,(12,x)
1843  0011 a4bf          	and	a,#191
1844  0013               L1101:
1845  0013 e70c          	ld	(12,x),a
1846                     ; 605 }
1849  0015 85            	popw	x
1850  0016 81            	ret	
1929                     ; 618 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1929                     ; 619 {
1930                     .text:	section	.text,new
1931  0000               _I2C_Send7bitAddress:
1933  0000 89            	pushw	x
1934       00000000      OFST:	set	0
1937                     ; 621   assert_param(IS_I2C_ADDRESS(Address));
1939                     ; 622   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1941                     ; 625   if (I2C_Direction != I2C_Direction_Transmitter)
1943  0001 7b06          	ld	a,(OFST+6,sp)
1944  0003 2706          	jreq	L3501
1945                     ; 628     Address |= OAR1_ADD0_Set;
1947  0005 7b05          	ld	a,(OFST+5,sp)
1948  0007 aa01          	or	a,#1
1950  0009 2004          	jra	L5501
1951  000b               L3501:
1952                     ; 633     Address &= OAR1_ADD0_Reset;
1954  000b 7b05          	ld	a,(OFST+5,sp)
1955  000d a4fe          	and	a,#254
1956  000f               L5501:
1957  000f 6b05          	ld	(OFST+5,sp),a
1958                     ; 636   I2Cx->DR = Address;
1960  0011 1e01          	ldw	x,(OFST+1,sp)
1961  0013 e706          	ld	(6,x),a
1962                     ; 637 }
1965  0015 85            	popw	x
1966  0016 81            	ret	
2012                     ; 661 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2012                     ; 662 {
2013                     .text:	section	.text,new
2014  0000               _I2C_SendData:
2016  0000 89            	pushw	x
2017       00000000      OFST:	set	0
2020                     ; 664   I2Cx->DR = Data;
2022  0001 1e01          	ldw	x,(OFST+1,sp)
2023  0003 7b05          	ld	a,(OFST+5,sp)
2024  0005 e706          	ld	(6,x),a
2025                     ; 665 }
2028  0007 85            	popw	x
2029  0008 81            	ret	
2066                     ; 673 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2066                     ; 674 {
2067                     .text:	section	.text,new
2068  0000               _I2C_ReceiveData:
2072                     ; 676   return ((uint8_t)I2Cx->DR);
2074  0000 e606          	ld	a,(6,x)
2077  0002 81            	ret	
2124                     ; 702 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2124                     ; 703 {
2125                     .text:	section	.text,new
2126  0000               _I2C_TransmitPEC:
2128  0000 89            	pushw	x
2129       00000000      OFST:	set	0
2132                     ; 705   assert_param(IS_FUNCTIONAL_STATE(NewState));
2134                     ; 707   if (NewState != DISABLE)
2136  0001 7b05          	ld	a,(OFST+5,sp)
2137  0003 2706          	jreq	L7411
2138                     ; 710     I2Cx->CR2 |= I2C_CR2_PEC;
2140  0005 e601          	ld	a,(1,x)
2141  0007 aa10          	or	a,#16
2143  0009 2006          	jra	L1511
2144  000b               L7411:
2145                     ; 715     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2147  000b 1e01          	ldw	x,(OFST+1,sp)
2148  000d e601          	ld	a,(1,x)
2149  000f a4ef          	and	a,#239
2150  0011               L1511:
2151  0011 e701          	ld	(1,x),a
2152                     ; 717 }
2155  0013 85            	popw	x
2156  0014 81            	ret	
2203                     ; 726 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2203                     ; 727 {
2204                     .text:	section	.text,new
2205  0000               _I2C_CalculatePEC:
2207  0000 89            	pushw	x
2208       00000000      OFST:	set	0
2211                     ; 729   assert_param(IS_FUNCTIONAL_STATE(NewState));
2213                     ; 731   if (NewState != DISABLE)
2215  0001 7b05          	ld	a,(OFST+5,sp)
2216  0003 2705          	jreq	L7711
2217                     ; 734     I2Cx->CR1 |= I2C_CR1_ENPEC;
2219  0005 f6            	ld	a,(x)
2220  0006 aa20          	or	a,#32
2222  0008 2005          	jra	L1021
2223  000a               L7711:
2224                     ; 739     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2226  000a 1e01          	ldw	x,(OFST+1,sp)
2227  000c f6            	ld	a,(x)
2228  000d a4df          	and	a,#223
2229  000f               L1021:
2230  000f f7            	ld	(x),a
2231                     ; 741 }
2234  0010 85            	popw	x
2235  0011 81            	ret	
2305                     ; 752 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2305                     ; 753 {
2306                     .text:	section	.text,new
2307  0000               _I2C_PECPositionConfig:
2309  0000 89            	pushw	x
2310       00000000      OFST:	set	0
2313                     ; 755   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2315                     ; 758   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2317  0001 e601          	ld	a,(1,x)
2318  0003 a4f7          	and	a,#247
2319  0005 e701          	ld	(1,x),a
2320                     ; 760   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2322  0007 e601          	ld	a,(1,x)
2323  0009 1a05          	or	a,(OFST+5,sp)
2324  000b e701          	ld	(1,x),a
2325                     ; 761 }
2328  000d 85            	popw	x
2329  000e 81            	ret	
2366                     ; 769 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2366                     ; 770 {
2367                     .text:	section	.text,new
2368  0000               _I2C_GetPEC:
2372                     ; 772   return (I2Cx->PECR);
2374  0000 e60e          	ld	a,(14,x)
2377  0002 81            	ret	
2424                     ; 800 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2424                     ; 801 {
2425                     .text:	section	.text,new
2426  0000               _I2C_DMACmd:
2428  0000 89            	pushw	x
2429       00000000      OFST:	set	0
2432                     ; 803   assert_param(IS_FUNCTIONAL_STATE(NewState));
2434                     ; 805   if (NewState != DISABLE)
2436  0001 7b05          	ld	a,(OFST+5,sp)
2437  0003 2706          	jreq	L3031
2438                     ; 808     I2Cx->ITR |= I2C_ITR_DMAEN;
2440  0005 e60a          	ld	a,(10,x)
2441  0007 aa08          	or	a,#8
2443  0009 2006          	jra	L5031
2444  000b               L3031:
2445                     ; 813     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2447  000b 1e01          	ldw	x,(OFST+1,sp)
2448  000d e60a          	ld	a,(10,x)
2449  000f a4f7          	and	a,#247
2450  0011               L5031:
2451  0011 e70a          	ld	(10,x),a
2452                     ; 815 }
2455  0013 85            	popw	x
2456  0014 81            	ret	
2504                     ; 824 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2504                     ; 825 {
2505                     .text:	section	.text,new
2506  0000               _I2C_DMALastTransferCmd:
2508  0000 89            	pushw	x
2509       00000000      OFST:	set	0
2512                     ; 827   assert_param(IS_FUNCTIONAL_STATE(NewState));
2514                     ; 829   if (NewState != DISABLE)
2516  0001 7b05          	ld	a,(OFST+5,sp)
2517  0003 2706          	jreq	L3331
2518                     ; 832     I2Cx->ITR |= I2C_ITR_LAST;
2520  0005 e60a          	ld	a,(10,x)
2521  0007 aa10          	or	a,#16
2523  0009 2006          	jra	L5331
2524  000b               L3331:
2525                     ; 837     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2527  000b 1e01          	ldw	x,(OFST+1,sp)
2528  000d e60a          	ld	a,(10,x)
2529  000f a4ef          	and	a,#239
2530  0011               L5331:
2531  0011 e70a          	ld	(10,x),a
2532                     ; 839 }
2535  0013 85            	popw	x
2536  0014 81            	ret	
2725                     ; 951 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2725                     ; 952 {
2726                     .text:	section	.text,new
2727  0000               _I2C_ITConfig:
2729  0000 89            	pushw	x
2730       00000000      OFST:	set	0
2733                     ; 954   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2735                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2737                     ; 957   if (NewState != DISABLE)
2739  0001 7b07          	ld	a,(OFST+7,sp)
2740  0003 2706          	jreq	L7341
2741                     ; 960     I2Cx->ITR |= (uint8_t)I2C_IT;
2743  0005 e60a          	ld	a,(10,x)
2744  0007 1a06          	or	a,(OFST+6,sp)
2746  0009 2007          	jra	L1441
2747  000b               L7341:
2748                     ; 965     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2750  000b 1e01          	ldw	x,(OFST+1,sp)
2751  000d 7b06          	ld	a,(OFST+6,sp)
2752  000f 43            	cpl	a
2753  0010 e40a          	and	a,(10,x)
2754  0012               L1441:
2755  0012 e70a          	ld	(10,x),a
2756                     ; 967 }
2759  0014 85            	popw	x
2760  0015 81            	ret	
2921                     ; 991 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2921                     ; 992 {
2922                     .text:	section	.text,new
2923  0000               _I2C_ReadRegister:
2925  0000 89            	pushw	x
2926  0001 5204          	subw	sp,#4
2927       00000004      OFST:	set	4
2930                     ; 993   __IO uint16_t tmp = 0;
2932  0003 5f            	clrw	x
2933  0004 1f03          	ldw	(OFST-1,sp),x
2934                     ; 995   assert_param(IS_I2C_REGISTER(I2C_Register));
2936                     ; 997   tmp = (uint16_t) I2Cx;
2938  0006 1e05          	ldw	x,(OFST+1,sp)
2939  0008 1f03          	ldw	(OFST-1,sp),x
2940                     ; 998   tmp += I2C_Register;
2942  000a 5f            	clrw	x
2943  000b 7b09          	ld	a,(OFST+5,sp)
2944  000d 97            	ld	xl,a
2945  000e 1f01          	ldw	(OFST-3,sp),x
2946  0010 1e03          	ldw	x,(OFST-1,sp)
2947  0012 72fb01        	addw	x,(OFST-3,sp)
2948  0015 1f03          	ldw	(OFST-1,sp),x
2949                     ; 1001   return (*(__IO uint8_t *) tmp);
2951  0017 1e03          	ldw	x,(OFST-1,sp)
2952  0019 f6            	ld	a,(x)
2955  001a 5b06          	addw	sp,#6
2956  001c 81            	ret	
3210                     ; 1041 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3210                     ; 1042 {
3211                     .text:	section	.text,new
3212  0000               _I2C_CheckEvent:
3214  0000 89            	pushw	x
3215  0001 5206          	subw	sp,#6
3216       00000006      OFST:	set	6
3219                     ; 1043   __IO uint16_t lastevent = 0x00;
3221  0003 5f            	clrw	x
3222  0004 1f04          	ldw	(OFST-2,sp),x
3223                     ; 1044   uint8_t flag1 = 0x00 ;
3225                     ; 1045   uint8_t flag2 = 0x00;
3227                     ; 1046   ErrorStatus status = ERROR;
3229                     ; 1049   assert_param(IS_I2C_EVENT(I2C_Event));
3231                     ; 1051   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3233  0006 1e0b          	ldw	x,(OFST+5,sp)
3234  0008 a30004        	cpw	x,#4
3235  000b 260a          	jrne	L5561
3236                     ; 1053     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3238  000d 1e07          	ldw	x,(OFST+1,sp)
3239  000f e608          	ld	a,(8,x)
3240  0011 a404          	and	a,#4
3241  0013 5f            	clrw	x
3242  0014 97            	ld	xl,a
3244  0015 201a          	jra	L7561
3245  0017               L5561:
3246                     ; 1057     flag1 = I2Cx->SR1;
3248  0017 1e07          	ldw	x,(OFST+1,sp)
3249  0019 e607          	ld	a,(7,x)
3250  001b 6b03          	ld	(OFST-3,sp),a
3251                     ; 1058     flag2 = I2Cx->SR3;
3253  001d e609          	ld	a,(9,x)
3254  001f 6b06          	ld	(OFST+0,sp),a
3255                     ; 1059     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3257  0021 5f            	clrw	x
3258  0022 7b03          	ld	a,(OFST-3,sp)
3259  0024 97            	ld	xl,a
3260  0025 1f01          	ldw	(OFST-5,sp),x
3261  0027 5f            	clrw	x
3262  0028 7b06          	ld	a,(OFST+0,sp)
3263  002a 97            	ld	xl,a
3264  002b 7b02          	ld	a,(OFST-4,sp)
3265  002d 01            	rrwa	x,a
3266  002e 1a01          	or	a,(OFST-5,sp)
3267  0030 01            	rrwa	x,a
3268  0031               L7561:
3269  0031 1f04          	ldw	(OFST-2,sp),x
3270                     ; 1062   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3272  0033 1e04          	ldw	x,(OFST-2,sp)
3273  0035 01            	rrwa	x,a
3274  0036 140c          	and	a,(OFST+6,sp)
3275  0038 01            	rrwa	x,a
3276  0039 140b          	and	a,(OFST+5,sp)
3277  003b 01            	rrwa	x,a
3278  003c 130b          	cpw	x,(OFST+5,sp)
3279  003e 2604          	jrne	L1661
3280                     ; 1065     status = SUCCESS;
3282  0040 a601          	ld	a,#1
3284  0042 2001          	jra	L3661
3285  0044               L1661:
3286                     ; 1070     status = ERROR;
3288  0044 4f            	clr	a
3289  0045               L3661:
3290                     ; 1074   return status;
3294  0045 5b08          	addw	sp,#8
3295  0047 81            	ret	
3360                     ; 1092 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3360                     ; 1093 {
3361                     .text:	section	.text,new
3362  0000               _I2C_GetLastEvent:
3364  0000 89            	pushw	x
3365  0001 5206          	subw	sp,#6
3366       00000006      OFST:	set	6
3369                     ; 1094   __IO uint16_t lastevent = 0;
3371  0003 5f            	clrw	x
3372  0004 1f05          	ldw	(OFST-1,sp),x
3373                     ; 1095   uint16_t flag1 = 0;
3375                     ; 1096   uint16_t flag2 = 0;
3377                     ; 1098   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3379  0006 1e07          	ldw	x,(OFST+1,sp)
3380  0008 e608          	ld	a,(8,x)
3381  000a a504          	bcp	a,#4
3382  000c 2705          	jreq	L1271
3383                     ; 1100     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3385  000e ae0004        	ldw	x,#4
3387  0011 2014          	jra	L3271
3388  0013               L1271:
3389                     ; 1105     flag1 = I2Cx->SR1;
3391  0013 e607          	ld	a,(7,x)
3392  0015 5f            	clrw	x
3393  0016 97            	ld	xl,a
3394  0017 1f01          	ldw	(OFST-5,sp),x
3395                     ; 1106     flag2 = I2Cx->SR3;
3397  0019 1e07          	ldw	x,(OFST+1,sp)
3398  001b e609          	ld	a,(9,x)
3399  001d 5f            	clrw	x
3400  001e 97            	ld	xl,a
3401  001f 1f03          	ldw	(OFST-3,sp),x
3402                     ; 1109     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3404  0021 7b02          	ld	a,(OFST-4,sp)
3405  0023 01            	rrwa	x,a
3406  0024 1a01          	or	a,(OFST-5,sp)
3407  0026 01            	rrwa	x,a
3408  0027               L3271:
3409  0027 1f05          	ldw	(OFST-1,sp),x
3410                     ; 1112   return (I2C_Event_TypeDef)lastevent;
3412  0029 1e05          	ldw	x,(OFST-1,sp)
3415  002b 5b08          	addw	sp,#8
3416  002d 81            	ret	
3673                     ; 1149 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3673                     ; 1150 {
3674                     .text:	section	.text,new
3675  0000               _I2C_GetFlagStatus:
3677  0000 89            	pushw	x
3678  0001 89            	pushw	x
3679       00000002      OFST:	set	2
3682                     ; 1151   uint8_t tempreg = 0;
3684  0002 0f02          	clr	(OFST+0,sp)
3685                     ; 1152   uint8_t regindex = 0;
3687                     ; 1153   FlagStatus bitstatus = RESET;
3689                     ; 1156   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3691                     ; 1159   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3693  0004 7b07          	ld	a,(OFST+5,sp)
3694  0006 6b01          	ld	(OFST-1,sp),a
3695                     ; 1161   switch (regindex)
3698                     ; 1178     default:
3698                     ; 1179       break;
3699  0008 4a            	dec	a
3700  0009 2708          	jreq	L5271
3701  000b 4a            	dec	a
3702  000c 270b          	jreq	L7271
3703  000e 4a            	dec	a
3704  000f 270e          	jreq	L1371
3705  0011 2012          	jra	L7602
3706  0013               L5271:
3707                     ; 1164     case 0x01:
3707                     ; 1165       tempreg = (uint8_t)I2Cx->SR1;
3709  0013 1e03          	ldw	x,(OFST+1,sp)
3710  0015 e607          	ld	a,(7,x)
3711                     ; 1166       break;
3713  0017 200a          	jp	LC002
3714  0019               L7271:
3715                     ; 1169     case 0x02:
3715                     ; 1170       tempreg = (uint8_t)I2Cx->SR2;
3717  0019 1e03          	ldw	x,(OFST+1,sp)
3718  001b e608          	ld	a,(8,x)
3719                     ; 1171       break;
3721  001d 2004          	jp	LC002
3722  001f               L1371:
3723                     ; 1174     case 0x03:
3723                     ; 1175       tempreg = (uint8_t)I2Cx->SR3;
3725  001f 1e03          	ldw	x,(OFST+1,sp)
3726  0021 e609          	ld	a,(9,x)
3727  0023               LC002:
3728  0023 6b02          	ld	(OFST+0,sp),a
3729                     ; 1176       break;
3731                     ; 1178     default:
3731                     ; 1179       break;
3733  0025               L7602:
3734                     ; 1183   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3736  0025 7b08          	ld	a,(OFST+6,sp)
3737  0027 1502          	bcp	a,(OFST+0,sp)
3738  0029 2704          	jreq	L1702
3739                     ; 1186     bitstatus = SET;
3741  002b a601          	ld	a,#1
3743  002d 2001          	jra	L3702
3744  002f               L1702:
3745                     ; 1191     bitstatus = RESET;
3747  002f 4f            	clr	a
3748  0030               L3702:
3749                     ; 1194   return bitstatus;
3753  0030 5b04          	addw	sp,#4
3754  0032 81            	ret	
3810                     ; 1226 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3810                     ; 1227 {
3811                     .text:	section	.text,new
3812  0000               _I2C_ClearFlag:
3814  0000 89            	pushw	x
3815  0001 89            	pushw	x
3816       00000002      OFST:	set	2
3819                     ; 1228   uint16_t flagpos = 0;
3821                     ; 1230   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3823                     ; 1233   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3825  0002 7b08          	ld	a,(OFST+6,sp)
3826  0004 5f            	clrw	x
3827  0005 02            	rlwa	x,a
3828  0006 1f01          	ldw	(OFST-1,sp),x
3829                     ; 1235   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3831  0008 7b02          	ld	a,(OFST+0,sp)
3832  000a 1e03          	ldw	x,(OFST+1,sp)
3833  000c 43            	cpl	a
3834  000d e708          	ld	(8,x),a
3835                     ; 1236 }
3838  000f 5b04          	addw	sp,#4
3839  0011 81            	ret	
3915                     ; 1261 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3915                     ; 1262 {
3916                     .text:	section	.text,new
3917  0000               _I2C_GetITStatus:
3919  0000 89            	pushw	x
3920  0001 5204          	subw	sp,#4
3921       00000004      OFST:	set	4
3924                     ; 1263   ITStatus bitstatus = RESET;
3926                     ; 1264   __IO uint8_t enablestatus = 0;
3928  0003 0f03          	clr	(OFST-1,sp)
3929                     ; 1265   uint16_t tempregister = 0;
3931                     ; 1268   assert_param(IS_I2C_GET_IT(I2C_IT));
3933                     ; 1270   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3935  0005 7b09          	ld	a,(OFST+5,sp)
3936  0007 a407          	and	a,#7
3937  0009 97            	ld	xl,a
3938  000a 4f            	clr	a
3939  000b 02            	rlwa	x,a
3940  000c 4f            	clr	a
3941  000d 01            	rrwa	x,a
3942  000e 9f            	ld	a,xl
3943  000f 5f            	clrw	x
3944  0010 97            	ld	xl,a
3945  0011 1f01          	ldw	(OFST-3,sp),x
3946                     ; 1273   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3948  0013 1e05          	ldw	x,(OFST+1,sp)
3949  0015 e60a          	ld	a,(10,x)
3950  0017 1402          	and	a,(OFST-2,sp)
3951  0019 6b03          	ld	(OFST-1,sp),a
3952                     ; 1275   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3954  001b 7b09          	ld	a,(OFST+5,sp)
3955  001d a430          	and	a,#48
3956  001f 97            	ld	xl,a
3957  0020 4f            	clr	a
3958  0021 02            	rlwa	x,a
3959  0022 a30100        	cpw	x,#256
3960  0025 260e          	jrne	L5612
3961                     ; 1278     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3963  0027 1e05          	ldw	x,(OFST+1,sp)
3964  0029 e607          	ld	a,(7,x)
3965  002b 150a          	bcp	a,(OFST+6,sp)
3966  002d 2716          	jreq	L5712
3968  002f 0d03          	tnz	(OFST-1,sp)
3969  0031 2712          	jreq	L5712
3970                     ; 1281       bitstatus = SET;
3972  0033 200c          	jp	LC004
3973                     ; 1286       bitstatus = RESET;
3974  0035               L5612:
3975                     ; 1292     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3977  0035 1e05          	ldw	x,(OFST+1,sp)
3978  0037 e608          	ld	a,(8,x)
3979  0039 150a          	bcp	a,(OFST+6,sp)
3980  003b 2708          	jreq	L5712
3982  003d 0d03          	tnz	(OFST-1,sp)
3983  003f 2704          	jreq	L5712
3984                     ; 1295       bitstatus = SET;
3986  0041               LC004:
3988  0041 a601          	ld	a,#1
3990  0043 2001          	jra	L3712
3991  0045               L5712:
3992                     ; 1300       bitstatus = RESET;
3995  0045 4f            	clr	a
3996  0046               L3712:
3997                     ; 1304   return  bitstatus;
4001  0046 5b06          	addw	sp,#6
4002  0048 81            	ret	
4059                     ; 1337 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4059                     ; 1338 {
4060                     .text:	section	.text,new
4061  0000               _I2C_ClearITPendingBit:
4063  0000 89            	pushw	x
4064  0001 89            	pushw	x
4065       00000002      OFST:	set	2
4068                     ; 1339   uint16_t flagpos = 0;
4070                     ; 1342   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4072                     ; 1345   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4074  0002 7b08          	ld	a,(OFST+6,sp)
4075  0004 5f            	clrw	x
4076  0005 02            	rlwa	x,a
4077  0006 1f01          	ldw	(OFST-1,sp),x
4078                     ; 1348   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4080  0008 7b02          	ld	a,(OFST+0,sp)
4081  000a 1e03          	ldw	x,(OFST+1,sp)
4082  000c 43            	cpl	a
4083  000d e708          	ld	(8,x),a
4084                     ; 1349 }
4087  000f 5b04          	addw	sp,#4
4088  0011 81            	ret	
4101                     	xdef	_I2C_ClearITPendingBit
4102                     	xdef	_I2C_GetITStatus
4103                     	xdef	_I2C_ClearFlag
4104                     	xdef	_I2C_GetFlagStatus
4105                     	xdef	_I2C_GetLastEvent
4106                     	xdef	_I2C_CheckEvent
4107                     	xdef	_I2C_ReadRegister
4108                     	xdef	_I2C_ITConfig
4109                     	xdef	_I2C_DMALastTransferCmd
4110                     	xdef	_I2C_DMACmd
4111                     	xdef	_I2C_CalculatePEC
4112                     	xdef	_I2C_TransmitPEC
4113                     	xdef	_I2C_GetPEC
4114                     	xdef	_I2C_PECPositionConfig
4115                     	xdef	_I2C_ReceiveData
4116                     	xdef	_I2C_SendData
4117                     	xdef	_I2C_Send7bitAddress
4118                     	xdef	_I2C_SMBusAlertConfig
4119                     	xdef	_I2C_FastModeDutyCycleConfig
4120                     	xdef	_I2C_AckPositionConfig
4121                     	xdef	_I2C_DualAddressCmd
4122                     	xdef	_I2C_OwnAddress2Config
4123                     	xdef	_I2C_AcknowledgeConfig
4124                     	xdef	_I2C_GenerateSTOP
4125                     	xdef	_I2C_GenerateSTART
4126                     	xdef	_I2C_ARPCmd
4127                     	xdef	_I2C_StretchClockCmd
4128                     	xdef	_I2C_SoftwareResetCmd
4129                     	xdef	_I2C_GeneralCallCmd
4130                     	xdef	_I2C_Cmd
4131                     	xdef	_I2C_Init
4132                     	xdef	_I2C_DeInit
4133                     	xref	_CLK_GetClockFreq
4134                     	xref.b	c_lreg
4135                     	xref.b	c_x
4154                     	xref	c_uitol
4155                     	xref	c_sdivx
4156                     	xref	c_lzmp
4157                     	xref	c_rtol
4158                     	xref	c_smul
4159                     	xref	c_lmul
4160                     	xref	c_lcmp
4161                     	xref	c_ltor
4162                     	xref	c_ludv
4163                     	end
