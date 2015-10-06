   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 116 void SYSCFG_RIDeInit(void)
  49                     ; 117 {
  51                     .text:	section	.text,new
  52  0000               _SYSCFG_RIDeInit:
  56                     ; 118   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  58  0000 725f5431      	clr	21553
  59                     ; 119   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  61  0004 725f5432      	clr	21554
  62                     ; 120   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  64  0008 725f5439      	clr	21561
  65                     ; 121   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  67  000c 725f543a      	clr	21562
  68                     ; 122   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  70  0010 725f543b      	clr	21563
  71                     ; 123   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  73  0014 725f5457      	clr	21591
  74                     ; 124   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  76  0018 725f543d      	clr	21565
  77                     ; 125   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  79  001c 725f543e      	clr	21566
  80                     ; 126   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  82  0020 725f543f      	clr	21567
  83                     ; 127 }
  86  0024 81            	ret	
 345                     ; 139 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 345                     ; 140                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 345                     ; 141 {
 346                     .text:	section	.text,new
 347  0000               _SYSCFG_RITIMInputCaptureConfig:
 349  0000 89            	pushw	x
 350       00000000      OFST:	set	0
 353                     ; 143   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 355                     ; 144   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 357                     ; 147   if (RI_InputCapture == RI_InputCapture_IC2)
 359  0001 9e            	ld	a,xh
 360  0002 a102          	cp	a,#2
 361  0004 2606          	jrne	L531
 362                     ; 150     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 364  0006 9f            	ld	a,xl
 365  0007 c75431        	ld	21553,a
 367  000a 2005          	jra	L731
 368  000c               L531:
 369                     ; 156     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 371  000c 7b02          	ld	a,(OFST+2,sp)
 372  000e c75432        	ld	21554,a
 373  0011               L731:
 374                     ; 158 }
 377  0011 85            	popw	x
 378  0012 81            	ret	
 560                     ; 181 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 560                     ; 182                                  FunctionalState NewState)
 560                     ; 183 {
 561                     .text:	section	.text,new
 562  0000               _SYSCFG_RIAnalogSwitchConfig:
 564  0000 89            	pushw	x
 565  0001 89            	pushw	x
 566       00000002      OFST:	set	2
 569                     ; 184   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 571                     ; 187   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 573                     ; 188   assert_param(IS_FUNCTIONAL_STATE(NewState));
 575                     ; 191   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 577  0002 9e            	ld	a,xh
 578  0003 a4f0          	and	a,#240
 579  0005 6b01          	ld	(OFST-1,sp),a
 580                     ; 194   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 582  0007 7b03          	ld	a,(OFST+1,sp)
 583  0009 a40f          	and	a,#15
 584  000b 6b02          	ld	(OFST+0,sp),a
 585                     ; 196   if (NewState != DISABLE)
 587  000d 7b04          	ld	a,(OFST+2,sp)
 588  000f 272a          	jreq	L142
 589                     ; 198     if (AnalogSwitchRegister == (uint8_t) 0x10)
 591  0011 7b01          	ld	a,(OFST-1,sp)
 592  0013 a110          	cp	a,#16
 593  0015 2612          	jrne	L342
 594                     ; 201       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 596  0017 7b02          	ld	a,(OFST+0,sp)
 597  0019 5f            	clrw	x
 598  001a 97            	ld	xl,a
 599  001b a601          	ld	a,#1
 600  001d 5d            	tnzw	x
 601  001e 2704          	jreq	L21
 602  0020               L41:
 603  0020 48            	sll	a
 604  0021 5a            	decw	x
 605  0022 26fc          	jrne	L41
 606  0024               L21:
 607  0024 ca543d        	or	a,21565
 609  0027 2029          	jp	LC002
 610  0029               L342:
 611                     ; 206       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 613  0029 7b02          	ld	a,(OFST+0,sp)
 614  002b 5f            	clrw	x
 615  002c 97            	ld	xl,a
 616  002d a601          	ld	a,#1
 617  002f 5d            	tnzw	x
 618  0030 2704          	jreq	L61
 619  0032               L02:
 620  0032 48            	sll	a
 621  0033 5a            	decw	x
 622  0034 26fc          	jrne	L02
 623  0036               L61:
 624  0036 ca543e        	or	a,21566
 625  0039 202d          	jp	LC001
 626  003b               L142:
 627                     ; 211     if (AnalogSwitchRegister == (uint8_t) 0x10)
 629  003b 7b01          	ld	a,(OFST-1,sp)
 630  003d a110          	cp	a,#16
 631  003f 2616          	jrne	L152
 632                     ; 214       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 634  0041 7b02          	ld	a,(OFST+0,sp)
 635  0043 5f            	clrw	x
 636  0044 97            	ld	xl,a
 637  0045 a601          	ld	a,#1
 638  0047 5d            	tnzw	x
 639  0048 2704          	jreq	L22
 640  004a               L42:
 641  004a 48            	sll	a
 642  004b 5a            	decw	x
 643  004c 26fc          	jrne	L42
 644  004e               L22:
 645  004e 43            	cpl	a
 646  004f c4543d        	and	a,21565
 647  0052               LC002:
 648  0052 c7543d        	ld	21565,a
 650  0055 2014          	jra	L742
 651  0057               L152:
 652                     ; 219       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 654  0057 7b02          	ld	a,(OFST+0,sp)
 655  0059 5f            	clrw	x
 656  005a 97            	ld	xl,a
 657  005b a601          	ld	a,#1
 658  005d 5d            	tnzw	x
 659  005e 2704          	jreq	L62
 660  0060               L03:
 661  0060 48            	sll	a
 662  0061 5a            	decw	x
 663  0062 26fc          	jrne	L03
 664  0064               L62:
 665  0064 43            	cpl	a
 666  0065 c4543e        	and	a,21566
 667  0068               LC001:
 668  0068 c7543e        	ld	21566,a
 669  006b               L742:
 670                     ; 222 }
 673  006b 5b04          	addw	sp,#4
 674  006d 81            	ret	
 940                     ; 231 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 940                     ; 232                              FunctionalState NewState)
 940                     ; 233 {
 941                     .text:	section	.text,new
 942  0000               _SYSCFG_RIIOSwitchConfig:
 944  0000 89            	pushw	x
 945  0001 89            	pushw	x
 946       00000002      OFST:	set	2
 949                     ; 234   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 951                     ; 237   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 953                     ; 238   assert_param(IS_FUNCTIONAL_STATE(NewState));
 955                     ; 241   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 957  0002 9e            	ld	a,xh
 958  0003 a40f          	and	a,#15
 959  0005 6b02          	ld	(OFST+0,sp),a
 960                     ; 244   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 962  0007 7b03          	ld	a,(OFST+1,sp)
 963  0009 a4f0          	and	a,#240
 964  000b 6b01          	ld	(OFST-1,sp),a
 965                     ; 247   if (IOSwitchRegsiter == (uint8_t) 0x10)
 967  000d a110          	cp	a,#16
 968  000f 2631          	jrne	L304
 969                     ; 249     if (NewState != DISABLE)
 971  0011 7b04          	ld	a,(OFST+2,sp)
 972  0013 2716          	jreq	L504
 973                     ; 252       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 975  0015 7b02          	ld	a,(OFST+0,sp)
 976  0017 5f            	clrw	x
 977  0018 97            	ld	xl,a
 978  0019 a601          	ld	a,#1
 979  001b 5d            	tnzw	x
 980  001c 2704          	jreq	L43
 981  001e               L63:
 982  001e 48            	sll	a
 983  001f 5a            	decw	x
 984  0020 26fc          	jrne	L63
 985  0022               L43:
 986  0022 ca5439        	or	a,21561
 987  0025 c75439        	ld	21561,a
 989  0028 cc00cf        	jra	L114
 990  002b               L504:
 991                     ; 257       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 993  002b 7b02          	ld	a,(OFST+0,sp)
 994  002d 5f            	clrw	x
 995  002e 97            	ld	xl,a
 996  002f a601          	ld	a,#1
 997  0031 5d            	tnzw	x
 998  0032 2704          	jreq	L04
 999  0034               L24:
1000  0034 48            	sll	a
1001  0035 5a            	decw	x
1002  0036 26fc          	jrne	L24
1003  0038               L04:
1004  0038 43            	cpl	a
1005  0039 c45439        	and	a,21561
1006  003c c75439        	ld	21561,a
1007  003f cc00cf        	jra	L114
1008  0042               L304:
1009                     ; 262   else if (IOSwitchRegsiter == (uint8_t) 0x20)
1011  0042 a120          	cp	a,#32
1012  0044 262f          	jrne	L314
1013                     ; 264     if (NewState != DISABLE)
1015  0046 7b04          	ld	a,(OFST+2,sp)
1016  0048 2715          	jreq	L514
1017                     ; 267       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1019  004a 7b02          	ld	a,(OFST+0,sp)
1020  004c 5f            	clrw	x
1021  004d 97            	ld	xl,a
1022  004e a601          	ld	a,#1
1023  0050 5d            	tnzw	x
1024  0051 2704          	jreq	L44
1025  0053               L64:
1026  0053 48            	sll	a
1027  0054 5a            	decw	x
1028  0055 26fc          	jrne	L64
1029  0057               L44:
1030  0057 ca543a        	or	a,21562
1031  005a c7543a        	ld	21562,a
1033  005d 2070          	jra	L114
1034  005f               L514:
1035                     ; 272       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1037  005f 7b02          	ld	a,(OFST+0,sp)
1038  0061 5f            	clrw	x
1039  0062 97            	ld	xl,a
1040  0063 a601          	ld	a,#1
1041  0065 5d            	tnzw	x
1042  0066 2704          	jreq	L05
1043  0068               L25:
1044  0068 48            	sll	a
1045  0069 5a            	decw	x
1046  006a 26fc          	jrne	L25
1047  006c               L05:
1048  006c 43            	cpl	a
1049  006d c4543a        	and	a,21562
1050  0070 c7543a        	ld	21562,a
1051  0073 205a          	jra	L114
1052  0075               L314:
1053                     ; 277   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1055  0075 a130          	cp	a,#48
1056  0077 262c          	jrne	L324
1057                     ; 279     if (NewState != DISABLE)
1059  0079 7b04          	ld	a,(OFST+2,sp)
1060  007b 2712          	jreq	L524
1061                     ; 282       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1063  007d 7b02          	ld	a,(OFST+0,sp)
1064  007f 5f            	clrw	x
1065  0080 97            	ld	xl,a
1066  0081 a601          	ld	a,#1
1067  0083 5d            	tnzw	x
1068  0084 2704          	jreq	L45
1069  0086               L65:
1070  0086 48            	sll	a
1071  0087 5a            	decw	x
1072  0088 26fc          	jrne	L65
1073  008a               L45:
1074  008a ca543b        	or	a,21563
1076  008d 2011          	jp	LC004
1077  008f               L524:
1078                     ; 287       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1080  008f 7b02          	ld	a,(OFST+0,sp)
1081  0091 5f            	clrw	x
1082  0092 97            	ld	xl,a
1083  0093 a601          	ld	a,#1
1084  0095 5d            	tnzw	x
1085  0096 2704          	jreq	L06
1086  0098               L26:
1087  0098 48            	sll	a
1088  0099 5a            	decw	x
1089  009a 26fc          	jrne	L26
1090  009c               L06:
1091  009c 43            	cpl	a
1092  009d c4543b        	and	a,21563
1093  00a0               LC004:
1094  00a0 c7543b        	ld	21563,a
1095  00a3 202a          	jra	L114
1096  00a5               L324:
1097                     ; 294     if (NewState != DISABLE)
1099  00a5 7b04          	ld	a,(OFST+2,sp)
1100  00a7 2712          	jreq	L334
1101                     ; 297       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1103  00a9 7b02          	ld	a,(OFST+0,sp)
1104  00ab 5f            	clrw	x
1105  00ac 97            	ld	xl,a
1106  00ad a601          	ld	a,#1
1107  00af 5d            	tnzw	x
1108  00b0 2704          	jreq	L46
1109  00b2               L66:
1110  00b2 48            	sll	a
1111  00b3 5a            	decw	x
1112  00b4 26fc          	jrne	L66
1113  00b6               L46:
1114  00b6 ca5457        	or	a,21591
1116  00b9 2011          	jp	LC003
1117  00bb               L334:
1118                     ; 302       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1120  00bb 7b02          	ld	a,(OFST+0,sp)
1121  00bd 5f            	clrw	x
1122  00be 97            	ld	xl,a
1123  00bf a601          	ld	a,#1
1124  00c1 5d            	tnzw	x
1125  00c2 2704          	jreq	L07
1126  00c4               L27:
1127  00c4 48            	sll	a
1128  00c5 5a            	decw	x
1129  00c6 26fc          	jrne	L27
1130  00c8               L07:
1131  00c8 43            	cpl	a
1132  00c9 c45457        	and	a,21591
1133  00cc               LC003:
1134  00cc c75457        	ld	21591,a
1135  00cf               L114:
1136                     ; 305 }
1139  00cf 5b04          	addw	sp,#4
1140  00d1 81            	ret	
1220                     ; 317 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1220                     ; 318 {
1221                     .text:	section	.text,new
1222  0000               _SYSCFG_RIResistorConfig:
1224  0000 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 320   assert_param(IS_RI_RESISTOR(RI_Resistor));
1230                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1232                     ; 323   if (NewState != DISABLE)
1234  0001 9f            	ld	a,xl
1235  0002 4d            	tnz	a
1236  0003 2706          	jreq	L574
1237                     ; 326     RI->RCR |= (uint8_t) RI_Resistor;
1239  0005 9e            	ld	a,xh
1240  0006 ca543f        	or	a,21567
1242  0009 2006          	jra	L774
1243  000b               L574:
1244                     ; 331     RI->RCR &= (uint8_t) (~RI_Resistor);
1246  000b 7b01          	ld	a,(OFST+1,sp)
1247  000d 43            	cpl	a
1248  000e c4543f        	and	a,21567
1249  0011               L774:
1250  0011 c7543f        	ld	21567,a
1251                     ; 333 }
1254  0014 85            	popw	x
1255  0015 81            	ret	
1278                     ; 365 void SYSCFG_REMAPDeInit(void)
1278                     ; 366 {
1279                     .text:	section	.text,new
1280  0000               _SYSCFG_REMAPDeInit:
1284                     ; 368   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1286  0000 350c509e      	mov	20638,#12
1287                     ; 371   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1289  0004 725f509f      	clr	20639
1290                     ; 374   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1292  0008 725f509d      	clr	20637
1293                     ; 375 }
1296  000c 81            	ret	
1514                     ; 408 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1514                     ; 409 {
1515                     .text:	section	.text,new
1516  0000               _SYSCFG_REMAPPinConfig:
1518  0000 89            	pushw	x
1519  0001 88            	push	a
1520       00000001      OFST:	set	1
1523                     ; 410   uint8_t regindex = 0;
1525                     ; 412   assert_param(IS_REMAP_PIN(REMAP_Pin));
1527                     ; 413   assert_param(IS_FUNCTIONAL_STATE(NewState));
1529                     ; 416   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1531  0002 9e            	ld	a,xh
1532  0003 6b01          	ld	(OFST+0,sp),a
1533                     ; 419   if (regindex == 0x01)
1535  0005 a101          	cp	a,#1
1536  0007 261c          	jrne	L316
1537                     ; 421     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1539  0009 a610          	ld	a,#16
1540  000b 42            	mul	x,a
1541  000c 9f            	ld	a,xl
1542  000d aa0f          	or	a,#15
1543  000f c4509e        	and	a,20638
1544  0012 c7509e        	ld	20638,a
1545                     ; 422     if (NewState != DISABLE)
1547  0015 7b06          	ld	a,(OFST+5,sp)
1548  0017 273a          	jreq	L716
1549                     ; 424       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1551  0019 7b03          	ld	a,(OFST+2,sp)
1552  001b a4f0          	and	a,#240
1553  001d ca509e        	or	a,20638
1554  0020 c7509e        	ld	20638,a
1555  0023 202e          	jra	L716
1556  0025               L316:
1557                     ; 428   else if (regindex == 0x02)
1559  0025 a102          	cp	a,#2
1560  0027 2616          	jrne	L126
1561                     ; 430     if (NewState != DISABLE)
1563  0029 7b06          	ld	a,(OFST+5,sp)
1564  002b 2707          	jreq	L326
1565                     ; 432       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1567  002d c6509f        	ld	a,20639
1568  0030 1a03          	or	a,(OFST+2,sp)
1570  0032 2006          	jp	LC006
1571  0034               L326:
1572                     ; 436       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1574  0034 7b03          	ld	a,(OFST+2,sp)
1575  0036 43            	cpl	a
1576  0037 c4509f        	and	a,20639
1577  003a               LC006:
1578  003a c7509f        	ld	20639,a
1579  003d 2014          	jra	L716
1580  003f               L126:
1581                     ; 442     if (NewState != DISABLE)
1583  003f 7b06          	ld	a,(OFST+5,sp)
1584  0041 2707          	jreq	L136
1585                     ; 444       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1587  0043 c6509d        	ld	a,20637
1588  0046 1a03          	or	a,(OFST+2,sp)
1590  0048 2006          	jp	LC005
1591  004a               L136:
1592                     ; 448       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1594  004a 7b03          	ld	a,(OFST+2,sp)
1595  004c 43            	cpl	a
1596  004d c4509d        	and	a,20637
1597  0050               LC005:
1598  0050 c7509d        	ld	20637,a
1599  0053               L716:
1600                     ; 451 }
1603  0053 5b03          	addw	sp,#3
1604  0055 81            	ret	
1710                     ; 467 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1710                     ; 468 {
1711                     .text:	section	.text,new
1712  0000               _SYSCFG_REMAPDMAChannelConfig:
1714  0000 88            	push	a
1715       00000000      OFST:	set	0
1718                     ; 470   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1720                     ; 473   if ((REMAP_DMAChannel & 0xF0) != RESET)
1722  0001 a5f0          	bcp	a,#240
1723  0003 2707          	jreq	L776
1724                     ; 476     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1726  0005 c6509e        	ld	a,20638
1727  0008 a4f3          	and	a,#243
1729  000a 2005          	jra	L107
1730  000c               L776:
1731                     ; 482     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1733  000c c6509e        	ld	a,20638
1734  000f a4fc          	and	a,#252
1735  0011               L107:
1736  0011 c7509e        	ld	20638,a
1737                     ; 485   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1739  0014 7b01          	ld	a,(OFST+1,sp)
1740  0016 a40f          	and	a,#15
1741  0018 ca509e        	or	a,20638
1742  001b c7509e        	ld	20638,a
1743                     ; 486 }
1746  001e 84            	pop	a
1747  001f 81            	ret	
1760                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1761                     	xdef	_SYSCFG_REMAPPinConfig
1762                     	xdef	_SYSCFG_REMAPDeInit
1763                     	xdef	_SYSCFG_RIResistorConfig
1764                     	xdef	_SYSCFG_RIIOSwitchConfig
1765                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1766                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1767                     	xdef	_SYSCFG_RIDeInit
1786                     	end
