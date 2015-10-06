   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 120 void EXTI_DeInit(void)
  49                     ; 121 {
  51                     .text:	section	.text,new
  52  0000               _EXTI_DeInit:
  56                     ; 122   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 123   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 124   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  64  0008 725f50a2      	clr	20642
  65                     ; 125   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  67  000c 725f50aa      	clr	20650
  68                     ; 126   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  70  0010 35ff50a3      	mov	20643,#255
  71                     ; 127   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  73  0014 35ff50a4      	mov	20644,#255
  74                     ; 128   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  76  0018 725f50a5      	clr	20645
  77                     ; 129   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  79  001c 725f50ab      	clr	20651
  80                     ; 130 }
  83  0020 81            	ret	
 229                     ; 157 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 229                     ; 158 {
 230                     .text:	section	.text,new
 231  0000               _EXTI_SetPinSensitivity:
 233  0000 89            	pushw	x
 234       00000000      OFST:	set	0
 237                     ; 161   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 239                     ; 162   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 241                     ; 165   switch (EXTI_Pin)
 243  0001 9e            	ld	a,xh
 245                     ; 199     default:
 245                     ; 200       break;
 246  0002 4d            	tnz	a
 247  0003 2728          	jreq	L12
 248  0005 a002          	sub	a,#2
 249  0007 273b          	jreq	L32
 250  0009 a002          	sub	a,#2
 251  000b 274e          	jreq	L52
 252  000d a002          	sub	a,#2
 253  000f 2761          	jreq	L72
 254  0011 a00a          	sub	a,#10
 255  0013 277a          	jreq	L13
 256  0015 a002          	sub	a,#2
 257  0017 2603cc00a8    	jreq	L33
 258  001c a002          	sub	a,#2
 259  001e 2603cc00c1    	jreq	L53
 260  0023 a002          	sub	a,#2
 261  0025 2603cc00da    	jreq	L73
 262  002a cc00f7        	jra	L721
 263  002d               L12:
 264                     ; 167     case EXTI_Pin_0:
 264                     ; 168       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 266  002d c650a0        	ld	a,20640
 267  0030 a4fc          	and	a,#252
 268  0032 c750a0        	ld	20640,a
 269                     ; 169       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 271  0035 7b01          	ld	a,(OFST+1,sp)
 272  0037 5f            	clrw	x
 273  0038 97            	ld	xl,a
 274  0039 7b02          	ld	a,(OFST+2,sp)
 275  003b 5d            	tnzw	x
 276  003c 2749          	jreq	L42
 277  003e               L21:
 278  003e 48            	sll	a
 279  003f 5a            	decw	x
 280  0040 26fc          	jrne	L21
 281                     ; 170       break;
 283  0042 2043          	jp	L42
 284  0044               L32:
 285                     ; 171     case EXTI_Pin_1:
 285                     ; 172       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 287  0044 c650a0        	ld	a,20640
 288  0047 a4f3          	and	a,#243
 289  0049 c750a0        	ld	20640,a
 290                     ; 173       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 292  004c 7b01          	ld	a,(OFST+1,sp)
 293  004e 5f            	clrw	x
 294  004f 97            	ld	xl,a
 295  0050 7b02          	ld	a,(OFST+2,sp)
 296  0052 5d            	tnzw	x
 297  0053 2732          	jreq	L42
 298  0055               L61:
 299  0055 48            	sll	a
 300  0056 5a            	decw	x
 301  0057 26fc          	jrne	L61
 302                     ; 174       break;
 304  0059 202c          	jp	L42
 305  005b               L52:
 306                     ; 175     case EXTI_Pin_2:
 306                     ; 176       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 308  005b c650a0        	ld	a,20640
 309  005e a4cf          	and	a,#207
 310  0060 c750a0        	ld	20640,a
 311                     ; 177       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 313  0063 7b01          	ld	a,(OFST+1,sp)
 314  0065 5f            	clrw	x
 315  0066 97            	ld	xl,a
 316  0067 7b02          	ld	a,(OFST+2,sp)
 317  0069 5d            	tnzw	x
 318  006a 271b          	jreq	L42
 319  006c               L22:
 320  006c 48            	sll	a
 321  006d 5a            	decw	x
 322  006e 26fc          	jrne	L22
 323                     ; 178       break;
 325  0070 2015          	jp	L42
 326  0072               L72:
 327                     ; 179     case EXTI_Pin_3:
 327                     ; 180       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 329  0072 c650a0        	ld	a,20640
 330  0075 a43f          	and	a,#63
 331  0077 c750a0        	ld	20640,a
 332                     ; 181       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 334  007a 7b01          	ld	a,(OFST+1,sp)
 335  007c 5f            	clrw	x
 336  007d 97            	ld	xl,a
 337  007e 7b02          	ld	a,(OFST+2,sp)
 338  0080 5d            	tnzw	x
 339  0081 2704          	jreq	L42
 340  0083               L62:
 341  0083 48            	sll	a
 342  0084 5a            	decw	x
 343  0085 26fc          	jrne	L62
 344  0087               L42:
 345  0087 ca50a0        	or	a,20640
 346  008a c750a0        	ld	20640,a
 347                     ; 182       break;
 349  008d 2068          	jra	L721
 350  008f               L13:
 351                     ; 183     case EXTI_Pin_4:
 351                     ; 184       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 353  008f c650a1        	ld	a,20641
 354  0092 a4fc          	and	a,#252
 355  0094 c750a1        	ld	20641,a
 356                     ; 185       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 358  0097 7b01          	ld	a,(OFST+1,sp)
 359  0099 a4ef          	and	a,#239
 360  009b 5f            	clrw	x
 361  009c 97            	ld	xl,a
 362  009d 7b02          	ld	a,(OFST+2,sp)
 363  009f 5d            	tnzw	x
 364  00a0 274f          	jreq	L44
 365  00a2               L23:
 366  00a2 48            	sll	a
 367  00a3 5a            	decw	x
 368  00a4 26fc          	jrne	L23
 369                     ; 186       break;
 371  00a6 2049          	jp	L44
 372  00a8               L33:
 373                     ; 187     case EXTI_Pin_5:
 373                     ; 188       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 375  00a8 c650a1        	ld	a,20641
 376  00ab a4f3          	and	a,#243
 377  00ad c750a1        	ld	20641,a
 378                     ; 189       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 380  00b0 7b01          	ld	a,(OFST+1,sp)
 381  00b2 a4ef          	and	a,#239
 382  00b4 5f            	clrw	x
 383  00b5 97            	ld	xl,a
 384  00b6 7b02          	ld	a,(OFST+2,sp)
 385  00b8 5d            	tnzw	x
 386  00b9 2736          	jreq	L44
 387  00bb               L63:
 388  00bb 48            	sll	a
 389  00bc 5a            	decw	x
 390  00bd 26fc          	jrne	L63
 391                     ; 190       break;
 393  00bf 2030          	jp	L44
 394  00c1               L53:
 395                     ; 191     case EXTI_Pin_6:
 395                     ; 192       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 397  00c1 c650a1        	ld	a,20641
 398  00c4 a4cf          	and	a,#207
 399  00c6 c750a1        	ld	20641,a
 400                     ; 193       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 402  00c9 7b01          	ld	a,(OFST+1,sp)
 403  00cb a4ef          	and	a,#239
 404  00cd 5f            	clrw	x
 405  00ce 97            	ld	xl,a
 406  00cf 7b02          	ld	a,(OFST+2,sp)
 407  00d1 5d            	tnzw	x
 408  00d2 271d          	jreq	L44
 409  00d4               L24:
 410  00d4 48            	sll	a
 411  00d5 5a            	decw	x
 412  00d6 26fc          	jrne	L24
 413                     ; 194       break;
 415  00d8 2017          	jp	L44
 416  00da               L73:
 417                     ; 195     case EXTI_Pin_7:
 417                     ; 196       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 419  00da c650a1        	ld	a,20641
 420  00dd a43f          	and	a,#63
 421  00df c750a1        	ld	20641,a
 422                     ; 197       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 424  00e2 7b01          	ld	a,(OFST+1,sp)
 425  00e4 a4ef          	and	a,#239
 426  00e6 5f            	clrw	x
 427  00e7 97            	ld	xl,a
 428  00e8 7b02          	ld	a,(OFST+2,sp)
 429  00ea 5d            	tnzw	x
 430  00eb 2704          	jreq	L44
 431  00ed               L64:
 432  00ed 48            	sll	a
 433  00ee 5a            	decw	x
 434  00ef 26fc          	jrne	L64
 435  00f1               L44:
 436  00f1 ca50a1        	or	a,20641
 437  00f4 c750a1        	ld	20641,a
 438                     ; 198       break;
 440                     ; 199     default:
 440                     ; 200       break;
 442  00f7               L721:
 443                     ; 202 }
 446  00f7 85            	popw	x
 447  00f8 81            	ret	
 530                     ; 216 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 530                     ; 217 {
 531                     .text:	section	.text,new
 532  0000               _EXTI_SelectPort:
 534  0000 88            	push	a
 535       00000000      OFST:	set	0
 538                     ; 219   assert_param(IS_EXTI_PORT(EXTI_Port));
 540                     ; 221   if (EXTI_Port == EXTI_Port_B)
 542  0001 4d            	tnz	a
 543  0002 2606          	jrne	L761
 544                     ; 224     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 546  0004 721b50ab      	bres	20651,#5
 548  0008 202e          	jra	L171
 549  000a               L761:
 550                     ; 226   else if (EXTI_Port == EXTI_Port_D)
 552  000a 7b01          	ld	a,(OFST+1,sp)
 553  000c a102          	cp	a,#2
 554  000e 2606          	jrne	L371
 555                     ; 229     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 557  0010 721d50ab      	bres	20651,#6
 559  0014 2022          	jra	L171
 560  0016               L371:
 561                     ; 231   else if (EXTI_Port == EXTI_Port_E)
 563  0016 a104          	cp	a,#4
 564  0018 2606          	jrne	L771
 565                     ; 234     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 567  001a 721f50a5      	bres	20645,#7
 569  001e 2018          	jra	L171
 570  0020               L771:
 571                     ; 236   else if (EXTI_Port == EXTI_Port_F)
 573  0020 a106          	cp	a,#6
 574  0022 2606          	jrne	L302
 575                     ; 239     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 577  0024 721e50a5      	bset	20645,#7
 579  0028 200e          	jra	L171
 580  002a               L302:
 581                     ; 241   else if (EXTI_Port == EXTI_Port_G)
 583  002a a110          	cp	a,#16
 584  002c 2606          	jrne	L702
 585                     ; 244     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 587  002e 721a50ab      	bset	20651,#5
 589  0032 2004          	jra	L171
 590  0034               L702:
 591                     ; 249     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 593  0034 721c50ab      	bset	20651,#6
 594  0038               L171:
 595                     ; 251 }
 598  0038 84            	pop	a
 599  0039 81            	ret	
 767                     ; 277 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 767                     ; 278                                FunctionalState NewState)
 767                     ; 279 {
 768                     .text:	section	.text,new
 769  0000               _EXTI_SetHalfPortSelection:
 771  0000 89            	pushw	x
 772       00000000      OFST:	set	0
 775                     ; 281   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 777                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 779                     ; 284   if ((EXTI_HalfPort & 0x80) == 0x00)
 781  0001 9e            	ld	a,xh
 782  0002 a580          	bcp	a,#128
 783  0004 2616          	jrne	L103
 784                     ; 286     if (NewState != DISABLE)
 786  0006 7b02          	ld	a,(OFST+2,sp)
 787  0008 2707          	jreq	L303
 788                     ; 289       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 790  000a c650a5        	ld	a,20645
 791  000d 1a01          	or	a,(OFST+1,sp)
 793  000f 2006          	jp	LC004
 794  0011               L303:
 795                     ; 294       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 797  0011 7b01          	ld	a,(OFST+1,sp)
 798  0013 43            	cpl	a
 799  0014 c450a5        	and	a,20645
 800  0017               LC004:
 801  0017 c750a5        	ld	20645,a
 802  001a 2018          	jra	L703
 803  001c               L103:
 804                     ; 299     if (NewState != DISABLE)
 806  001c 7b02          	ld	a,(OFST+2,sp)
 807  001e 2709          	jreq	L113
 808                     ; 302       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 810  0020 7b01          	ld	a,(OFST+1,sp)
 811  0022 a47f          	and	a,#127
 812  0024 ca50ab        	or	a,20651
 814  0027 2008          	jp	LC003
 815  0029               L113:
 816                     ; 307       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 818  0029 7b01          	ld	a,(OFST+1,sp)
 819  002b a47f          	and	a,#127
 820  002d 43            	cpl	a
 821  002e c450ab        	and	a,20651
 822  0031               LC003:
 823  0031 c750ab        	ld	20651,a
 824  0034               L703:
 825                     ; 310 }
 828  0034 85            	popw	x
 829  0035 81            	ret	
 875                     ; 335 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 875                     ; 336                              EXTI_Trigger_TypeDef EXTI_Trigger)
 875                     ; 337 {
 876                     .text:	section	.text,new
 877  0000               _EXTI_SetPortSensitivity:
 879  0000 89            	pushw	x
 880       00000000      OFST:	set	0
 883                     ; 339   assert_param(IS_EXTI_PORT(EXTI_Port));
 885                     ; 340   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 887                     ; 343   if ((EXTI_Port & 0xF0) == 0x00)
 889  0001 9e            	ld	a,xh
 890  0002 a5f0          	bcp	a,#240
 891  0004 2629          	jrne	L733
 892                     ; 346     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 894  0006 7b01          	ld	a,(OFST+1,sp)
 895  0008 5f            	clrw	x
 896  0009 97            	ld	xl,a
 897  000a a603          	ld	a,#3
 898  000c 5d            	tnzw	x
 899  000d 2704          	jreq	L65
 900  000f               L06:
 901  000f 48            	sll	a
 902  0010 5a            	decw	x
 903  0011 26fc          	jrne	L06
 904  0013               L65:
 905  0013 43            	cpl	a
 906  0014 c450a2        	and	a,20642
 907  0017 c750a2        	ld	20642,a
 908                     ; 348     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 910  001a 7b01          	ld	a,(OFST+1,sp)
 911  001c 5f            	clrw	x
 912  001d 97            	ld	xl,a
 913  001e 7b02          	ld	a,(OFST+2,sp)
 914  0020 5d            	tnzw	x
 915  0021 2704          	jreq	L26
 916  0023               L46:
 917  0023 48            	sll	a
 918  0024 5a            	decw	x
 919  0025 26fc          	jrne	L46
 920  0027               L26:
 921  0027 ca50a2        	or	a,20642
 922  002a c750a2        	ld	20642,a
 924  002d 202b          	jra	L143
 925  002f               L733:
 926                     ; 353     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 928  002f 7b01          	ld	a,(OFST+1,sp)
 929  0031 a40f          	and	a,#15
 930  0033 5f            	clrw	x
 931  0034 97            	ld	xl,a
 932  0035 a603          	ld	a,#3
 933  0037 5d            	tnzw	x
 934  0038 2704          	jreq	L66
 935  003a               L07:
 936  003a 48            	sll	a
 937  003b 5a            	decw	x
 938  003c 26fc          	jrne	L07
 939  003e               L66:
 940  003e 43            	cpl	a
 941  003f c450aa        	and	a,20650
 942  0042 c750aa        	ld	20650,a
 943                     ; 355     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 945  0045 7b01          	ld	a,(OFST+1,sp)
 946  0047 a40f          	and	a,#15
 947  0049 5f            	clrw	x
 948  004a 97            	ld	xl,a
 949  004b 7b02          	ld	a,(OFST+2,sp)
 950  004d 5d            	tnzw	x
 951  004e 2704          	jreq	L27
 952  0050               L47:
 953  0050 48            	sll	a
 954  0051 5a            	decw	x
 955  0052 26fc          	jrne	L47
 956  0054               L27:
 957  0054 ca50aa        	or	a,20650
 958  0057 c750aa        	ld	20650,a
 959  005a               L143:
 960                     ; 357 }
 963  005a 85            	popw	x
 964  005b 81            	ret	
1010                     ; 373 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1010                     ; 374 {
1011                     .text:	section	.text,new
1012  0000               _EXTI_GetPinSensitivity:
1014  0000 88            	push	a
1015       00000001      OFST:	set	1
1018                     ; 375   uint8_t value = 0;
1020  0001 0f01          	clr	(OFST+0,sp)
1021                     ; 378   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1023                     ; 380   switch (EXTI_Pin)
1026                     ; 406     default:
1026                     ; 407       break;
1027  0003 4d            	tnz	a
1028  0004 2720          	jreq	L343
1029  0006 a002          	sub	a,#2
1030  0008 2721          	jreq	L543
1031  000a a002          	sub	a,#2
1032  000c 2722          	jreq	L743
1033  000e a002          	sub	a,#2
1034  0010 2724          	jreq	L153
1035  0012 a00a          	sub	a,#10
1036  0014 2725          	jreq	L353
1037  0016 a002          	sub	a,#2
1038  0018 2726          	jreq	L553
1039  001a a002          	sub	a,#2
1040  001c 272b          	jreq	L753
1041  001e a002          	sub	a,#2
1042  0020 272d          	jreq	L163
1043  0022 7b01          	ld	a,(OFST+0,sp)
1044  0024 2033          	jra	LC005
1045  0026               L343:
1046                     ; 382     case EXTI_Pin_0:
1046                     ; 383       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1048  0026 c650a0        	ld	a,20640
1049                     ; 384       break;
1051  0029 202c          	jp	LC006
1052  002b               L543:
1053                     ; 385     case EXTI_Pin_1:
1053                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1055  002b c650a0        	ld	a,20640
1056                     ; 387       break;
1058  002e 2013          	jp	LC008
1059  0030               L743:
1060                     ; 388     case EXTI_Pin_2:
1060                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1062  0030 c650a0        	ld	a,20640
1063  0033 4e            	swap	a
1064                     ; 390       break;
1066  0034 2021          	jp	LC006
1067  0036               L153:
1068                     ; 391     case EXTI_Pin_3:
1068                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1070  0036 c650a0        	ld	a,20640
1071                     ; 393       break;
1073  0039 2017          	jp	LC007
1074  003b               L353:
1075                     ; 394     case EXTI_Pin_4:
1075                     ; 395       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1077  003b c650a1        	ld	a,20641
1078                     ; 396       break;
1080  003e 2017          	jp	LC006
1081  0040               L553:
1082                     ; 397     case EXTI_Pin_5:
1082                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1084  0040 c650a1        	ld	a,20641
1085  0043               LC008:
1086  0043 a40c          	and	a,#12
1087  0045 44            	srl	a
1088  0046 44            	srl	a
1089                     ; 399       break;
1091  0047 2010          	jp	LC005
1092  0049               L753:
1093                     ; 400     case EXTI_Pin_6:
1093                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1095  0049 c650a1        	ld	a,20641
1096  004c 4e            	swap	a
1097                     ; 402       break;
1099  004d 2008          	jp	LC006
1100  004f               L163:
1101                     ; 403     case EXTI_Pin_7:
1101                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1103  004f c650a1        	ld	a,20641
1104  0052               LC007:
1105  0052 4e            	swap	a
1106  0053 a40c          	and	a,#12
1107  0055 44            	srl	a
1108  0056 44            	srl	a
1109  0057               LC006:
1110  0057 a403          	and	a,#3
1111  0059               LC005:
1112                     ; 405       break;
1114                     ; 406     default:
1114                     ; 407       break;
1116                     ; 409   return((EXTI_Trigger_TypeDef)value);
1120  0059 5b01          	addw	sp,#1
1121  005b 81            	ret	
1167                     ; 424 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1167                     ; 425 {
1168                     .text:	section	.text,new
1169  0000               _EXTI_GetPortSensitivity:
1171  0000 88            	push	a
1172  0001 88            	push	a
1173       00000001      OFST:	set	1
1176                     ; 426   uint8_t portsensitivity = 0;
1178                     ; 429   assert_param(IS_EXTI_PORT(EXTI_Port));
1180                     ; 432   if ((EXTI_Port & 0xF0) == 0x00)
1182  0002 a5f0          	bcp	a,#240
1183  0004 2610          	jrne	L534
1184                     ; 435     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1186  0006 7b02          	ld	a,(OFST+1,sp)
1187  0008 5f            	clrw	x
1188  0009 97            	ld	xl,a
1189  000a c650a2        	ld	a,20642
1190  000d 5d            	tnzw	x
1191  000e 2716          	jreq	L601
1192  0010               L401:
1193  0010 44            	srl	a
1194  0011 5a            	decw	x
1195  0012 26fc          	jrne	L401
1197  0014 2010          	jra	L601
1198  0016               L534:
1199                     ; 441     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1201  0016 7b02          	ld	a,(OFST+1,sp)
1202  0018 a40f          	and	a,#15
1203  001a 5f            	clrw	x
1204  001b 97            	ld	xl,a
1205  001c c650aa        	ld	a,20650
1206  001f 5d            	tnzw	x
1207  0020 2704          	jreq	L601
1208  0022               L011:
1209  0022 44            	srl	a
1210  0023 5a            	decw	x
1211  0024 26fc          	jrne	L011
1212  0026               L601:
1213  0026 a403          	and	a,#3
1214                     ; 444   return((EXTI_Trigger_TypeDef)portsensitivity);
1218  0028 85            	popw	x
1219  0029 81            	ret	
1389                     ; 484 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1389                     ; 485 {
1390                     .text:	section	.text,new
1391  0000               _EXTI_GetITStatus:
1393  0000 89            	pushw	x
1394  0001 88            	push	a
1395       00000001      OFST:	set	1
1398                     ; 486   ITStatus status = RESET;
1400                     ; 488   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1402                     ; 490   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1404  0002 01            	rrwa	x,a
1405  0003 4f            	clr	a
1406  0004 02            	rlwa	x,a
1407  0005 a30100        	cpw	x,#256
1408  0008 2607          	jrne	L335
1409                     ; 492     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1411  000a 7b03          	ld	a,(OFST+2,sp)
1412  000c c450a4        	and	a,20644
1414  000f 2005          	jra	L535
1415  0011               L335:
1416                     ; 496     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1418  0011 7b03          	ld	a,(OFST+2,sp)
1419  0013 c450a3        	and	a,20643
1420  0016               L535:
1421                     ; 498   return((ITStatus)status);
1425  0016 5b03          	addw	sp,#3
1426  0018 81            	ret	
1471                     ; 521 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1471                     ; 522 {
1472                     .text:	section	.text,new
1473  0000               _EXTI_ClearITPendingBit:
1475  0000 89            	pushw	x
1476  0001 89            	pushw	x
1477       00000002      OFST:	set	2
1480                     ; 523   uint16_t tempvalue = 0;
1482                     ; 526   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1484                     ; 528   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1486  0002 01            	rrwa	x,a
1487  0003 4f            	clr	a
1488  0004 02            	rlwa	x,a
1489  0005 1f01          	ldw	(OFST-1,sp),x
1490                     ; 530   if ( tempvalue == 0x0100)
1492  0007 a30100        	cpw	x,#256
1493  000a 2607          	jrne	L165
1494                     ; 532     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1496  000c 7b04          	ld	a,(OFST+2,sp)
1497  000e c750a4        	ld	20644,a
1499  0011 2005          	jra	L365
1500  0013               L165:
1501                     ; 536     EXTI->SR1 = (uint8_t) (EXTI_IT);
1503  0013 7b04          	ld	a,(OFST+2,sp)
1504  0015 c750a3        	ld	20643,a
1505  0018               L365:
1506                     ; 538 }
1509  0018 5b04          	addw	sp,#4
1510  001a 81            	ret	
1523                     	xdef	_EXTI_ClearITPendingBit
1524                     	xdef	_EXTI_GetITStatus
1525                     	xdef	_EXTI_GetPortSensitivity
1526                     	xdef	_EXTI_GetPinSensitivity
1527                     	xdef	_EXTI_SetPortSensitivity
1528                     	xdef	_EXTI_SetHalfPortSelection
1529                     	xdef	_EXTI_SelectPort
1530                     	xdef	_EXTI_SetPinSensitivity
1531                     	xdef	_EXTI_DeInit
1550                     	end
