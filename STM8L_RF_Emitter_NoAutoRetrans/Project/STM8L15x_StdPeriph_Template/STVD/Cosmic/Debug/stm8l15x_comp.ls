   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  50                     ; 108 void COMP_DeInit(void)
  50                     ; 109 {
  52                     .text:	section	.text,new
  53  0000               _COMP_DeInit:
  57                     ; 111   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  59  0000 725f5440      	clr	21568
  60                     ; 114   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  62  0004 725f5441      	clr	21569
  63                     ; 117   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  65  0008 35c05442      	mov	21570,#192
  66                     ; 120   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  68  000c 725f5443      	clr	21571
  69                     ; 123   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  71  0010 725f5444      	clr	21572
  72                     ; 124 }
  75  0014 81            	ret	
 251                     ; 150 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 251                     ; 151                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 251                     ; 152 {
 252                     .text:	section	.text,new
 253  0000               _COMP_Init:
 255  0000 89            	pushw	x
 256       00000000      OFST:	set	0
 259                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 261                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 263                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 265                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 267  0001 c65442        	ld	a,21570
 268  0004 a4c7          	and	a,#199
 269  0006 c75442        	ld	21570,a
 270                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 272  0009 9e            	ld	a,xh
 273  000a ca5442        	or	a,21570
 274  000d c75442        	ld	21570,a
 275                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 277  0010 c65442        	ld	a,21570
 278  0013 a43f          	and	a,#63
 279  0015 c75442        	ld	21570,a
 280                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 282  0018 9f            	ld	a,xl
 283  0019 ca5442        	or	a,21570
 284  001c c75442        	ld	21570,a
 285                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 287  001f 72155441      	bres	21569,#2
 288                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 290  0023 c65441        	ld	a,21569
 291  0026 1a05          	or	a,(OFST+5,sp)
 292  0028 c75441        	ld	21569,a
 293                     ; 172 }
 296  002b 85            	popw	x
 297  002c 81            	ret	
 353                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 353                     ; 181 {
 354                     .text:	section	.text,new
 355  0000               _COMP_VrefintToCOMP1Connect:
 359                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 361                     ; 185   if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2705          	jreq	L341
 365                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 367  0003 72145442      	bset	21570,#2
 370  0007 81            	ret	
 371  0008               L341:
 372                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 374  0008 72155442      	bres	21570,#2
 375                     ; 195 }
 378  000c 81            	ret	
 473                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 473                     ; 210 {
 474                     .text:	section	.text,new
 475  0000               _COMP_EdgeConfig:
 477  0000 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 483                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 485                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 487  0001 9e            	ld	a,xh
 488  0002 4a            	dec	a
 489  0003 2611          	jrne	L312
 490                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 492  0005 c65440        	ld	a,21568
 493  0008 a4fc          	and	a,#252
 494  000a c75440        	ld	21568,a
 495                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 497  000d 9f            	ld	a,xl
 498  000e ca5440        	or	a,21568
 499  0011 c75440        	ld	21568,a
 501  0014 2010          	jra	L512
 502  0016               L312:
 503                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 505  0016 c65441        	ld	a,21569
 506  0019 a4fc          	and	a,#252
 507  001b c75441        	ld	21569,a
 508                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 510  001e c65441        	ld	a,21569
 511  0021 1a02          	or	a,(OFST+2,sp)
 512  0023 c75441        	ld	21569,a
 513  0026               L512:
 514                     ; 233 }
 517  0026 85            	popw	x
 518  0027 81            	ret	
 586                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 586                     ; 249 {
 587                     .text:	section	.text,new
 588  0000               _COMP_GetOutputLevel:
 590  0000 88            	push	a
 591       00000001      OFST:	set	1
 594                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 596                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 598  0001 4a            	dec	a
 599  0002 2609          	jrne	L152
 600                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 602  0004 7207544002    	btjf	21568,#3,L352
 603                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 605  0009 2007          	jp	LC002
 606  000b               L352:
 607                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 608  000b 2009          	jp	L162
 609  000d               L152:
 610                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 612  000d 7207544104    	btjf	21569,#3,L162
 613                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 615  0012               LC002:
 617  0012 a601          	ld	a,#1
 619  0014 2001          	jra	L752
 620  0016               L162:
 621                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 624  0016 4f            	clr	a
 625  0017               L752:
 626                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 630  0017 5b01          	addw	sp,#1
 631  0019 81            	ret	
 666                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 666                     ; 322 {
 667                     .text:	section	.text,new
 668  0000               _COMP_WindowCmd:
 672                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 674                     ; 326   if (NewState != DISABLE)
 676  0000 4d            	tnz	a
 677  0001 2705          	jreq	L303
 678                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 680  0003 72125442      	bset	21570,#1
 683  0007 81            	ret	
 684  0008               L303:
 685                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 687  0008 72135442      	bres	21570,#1
 688                     ; 336 }
 691  000c 81            	ret	
 727                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 727                     ; 360 {
 728                     .text:	section	.text,new
 729  0000               _COMP_VrefintOutputCmd:
 733                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 735                     ; 364   if (NewState != DISABLE)
 737  0000 4d            	tnz	a
 738  0001 2705          	jreq	L523
 739                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 741  0003 72105442      	bset	21570,#0
 744  0007 81            	ret	
 745  0008               L523:
 746                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 748  0008 72115442      	bres	21570,#0
 749                     ; 374 }
 752  000c 81            	ret	
 788                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 788                     ; 399 {
 789                     .text:	section	.text,new
 790  0000               _COMP_SchmittTriggerCmd:
 794                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 796                     ; 403   if (NewState != DISABLE)
 798  0000 4d            	tnz	a
 799  0001 2705          	jreq	L743
 800                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 802  0003 72145440      	bset	21568,#2
 805  0007 81            	ret	
 806  0008               L743:
 807                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 809  0008 72155440      	bres	21568,#2
 810                     ; 413 }
 813  000c 81            	ret	
 933                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 933                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 933                     ; 434                         FunctionalState NewState)
 933                     ; 435 {
 934                     .text:	section	.text,new
 935  0000               _COMP_TriggerConfig:
 937  0000 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 943                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 945                     ; 440   switch (COMP_TriggerGroup)
 947  0001 9e            	ld	a,xh
 949                     ; 487     default:
 949                     ; 488       break;
 950  0002 4a            	dec	a
 951  0003 270b          	jreq	L353
 952  0005 4a            	dec	a
 953  0006 2717          	jreq	L553
 954  0008 4a            	dec	a
 955  0009 2730          	jreq	L753
 956  000b 4a            	dec	a
 957  000c 2740          	jreq	L163
 958  000e 2058          	jra	L344
 959  0010               L353:
 960                     ; 442     case COMP_TriggerGroup_InvertingInput:
 960                     ; 443 
 960                     ; 444       if (NewState != DISABLE)
 962  0010 7b05          	ld	a,(OFST+5,sp)
 963  0012 2704          	jreq	L544
 964                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 966  0014 7b02          	ld	a,(OFST+2,sp)
 968  0016 2010          	jp	LC005
 969  0018               L544:
 970                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 972  0018 c65443        	ld	a,21571
 973  001b 1a02          	or	a,(OFST+2,sp)
 974  001d 2017          	jp	LC004
 975  001f               L553:
 976                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 976                     ; 455       if (NewState != DISABLE)
 978  001f 7b05          	ld	a,(OFST+5,sp)
 979  0021 270b          	jreq	L154
 980                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 982  0023 7b02          	ld	a,(OFST+2,sp)
 983  0025 48            	sll	a
 984  0026 48            	sll	a
 985  0027 48            	sll	a
 986  0028               LC005:
 987  0028 43            	cpl	a
 988  0029 c45443        	and	a,21571
 990  002c 2008          	jp	LC004
 991  002e               L154:
 992                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 994  002e 7b02          	ld	a,(OFST+2,sp)
 995  0030 48            	sll	a
 996  0031 48            	sll	a
 997  0032 48            	sll	a
 998  0033 ca5443        	or	a,21571
 999  0036               LC004:
1000  0036 c75443        	ld	21571,a
1001  0039 202d          	jra	L344
1002  003b               L753:
1003                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
1003                     ; 466       if (NewState != DISABLE)
1005  003b 7b05          	ld	a,(OFST+5,sp)
1006  003d 2708          	jreq	L554
1007                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1009  003f 7b02          	ld	a,(OFST+2,sp)
1010  0041 43            	cpl	a
1011  0042 c45444        	and	a,21572
1013  0045 201e          	jp	LC003
1014  0047               L554:
1015                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1017  0047 c65444        	ld	a,21572
1018  004a 1a02          	or	a,(OFST+2,sp)
1019  004c 2017          	jp	LC003
1020  004e               L163:
1021                     ; 476     case COMP_TriggerGroup_DACOutput:
1021                     ; 477       if (NewState != DISABLE)
1023  004e 7b05          	ld	a,(OFST+5,sp)
1024  0050 270b          	jreq	L164
1025                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1027  0052 7b02          	ld	a,(OFST+2,sp)
1028  0054 48            	sll	a
1029  0055 48            	sll	a
1030  0056 48            	sll	a
1031  0057 43            	cpl	a
1032  0058 c45444        	and	a,21572
1034  005b 2008          	jp	LC003
1035  005d               L164:
1036                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1038  005d 7b02          	ld	a,(OFST+2,sp)
1039  005f 48            	sll	a
1040  0060 48            	sll	a
1041  0061 48            	sll	a
1042  0062 ca5444        	or	a,21572
1043  0065               LC003:
1044  0065 c75444        	ld	21572,a
1045                     ; 487     default:
1045                     ; 488       break;
1047  0068               L344:
1048                     ; 490 }
1051  0068 85            	popw	x
1052  0069 81            	ret	
1097                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1097                     ; 519 {
1098                     .text:	section	.text,new
1099  0000               _COMP_ITConfig:
1101  0000 89            	pushw	x
1102       00000000      OFST:	set	0
1105                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1107                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1109                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1111  0001 9e            	ld	a,xh
1112  0002 4a            	dec	a
1113  0003 2610          	jrne	L705
1114                     ; 527     if (NewState != DISABLE)
1116  0005 9f            	ld	a,xl
1117  0006 4d            	tnz	a
1118  0007 2706          	jreq	L115
1119                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1121  0009 721a5440      	bset	21568,#5
1123  000d 2014          	jra	L515
1124  000f               L115:
1125                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1127  000f 721b5440      	bres	21568,#5
1128  0013 200e          	jra	L515
1129  0015               L705:
1130                     ; 540     if (NewState != DISABLE)
1132  0015 7b02          	ld	a,(OFST+2,sp)
1133  0017 2706          	jreq	L715
1134                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1136  0019 721a5441      	bset	21569,#5
1138  001d 2004          	jra	L515
1139  001f               L715:
1140                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1142  001f 721b5441      	bres	21569,#5
1143  0023               L515:
1144                     ; 551 }
1147  0023 85            	popw	x
1148  0024 81            	ret	
1214                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1214                     ; 562 {
1215                     .text:	section	.text,new
1216  0000               _COMP_GetFlagStatus:
1218  0000 88            	push	a
1219       00000001      OFST:	set	1
1222                     ; 563   FlagStatus bitstatus = RESET;
1224                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1226                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1228  0001 4a            	dec	a
1229  0002 2609          	jrne	L555
1230                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1232  0004 7209544002    	btjf	21568,#4,L755
1233                     ; 574       bitstatus = SET;
1235  0009 2007          	jp	LC007
1236  000b               L755:
1237                     ; 579       bitstatus = RESET;
1238  000b 2009          	jp	L565
1239  000d               L555:
1240                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1242  000d 7209544104    	btjf	21569,#4,L565
1243                     ; 587       bitstatus = SET;
1245  0012               LC007:
1247  0012 a601          	ld	a,#1
1249  0014 2001          	jra	L365
1250  0016               L565:
1251                     ; 592       bitstatus = RESET;
1254  0016 4f            	clr	a
1255  0017               L365:
1256                     ; 597   return (FlagStatus)(bitstatus);
1260  0017 5b01          	addw	sp,#1
1261  0019 81            	ret	
1296                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1296                     ; 609 {
1297                     .text:	section	.text,new
1298  0000               _COMP_ClearFlag:
1302                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1304                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1306  0000 4a            	dec	a
1307  0001 2605          	jrne	L706
1308                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1310  0003 72195440      	bres	21568,#4
1313  0007 81            	ret	
1314  0008               L706:
1315                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1317  0008 72195441      	bres	21569,#4
1318                     ; 623 }
1321  000c 81            	ret	
1385                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1385                     ; 634 {
1386                     .text:	section	.text,new
1387  0000               _COMP_GetITStatus:
1389  0000 89            	pushw	x
1390       00000002      OFST:	set	2
1393                     ; 635   ITStatus bitstatus = RESET;
1395                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1399                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1401                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1403  0001 4a            	dec	a
1404  0002 2618          	jrne	L546
1405                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1407  0004 c65440        	ld	a,21568
1408  0007 a410          	and	a,#16
1409  0009 6b01          	ld	(OFST-1,sp),a
1410                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1412  000b c65440        	ld	a,21568
1413  000e a420          	and	a,#32
1414  0010 6b02          	ld	(OFST+0,sp),a
1415                     ; 649     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1417  0012 7b01          	ld	a,(OFST-1,sp)
1418  0014 2720          	jreq	L556
1420  0016 7b02          	ld	a,(OFST+0,sp)
1421  0018 271c          	jreq	L556
1422                     ; 652       bitstatus = SET;
1424  001a 2016          	jp	LC009
1425                     ; 657       bitstatus = RESET;
1426  001c               L546:
1427                     ; 663     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1429  001c c65441        	ld	a,21569
1430  001f a410          	and	a,#16
1431  0021 6b01          	ld	(OFST-1,sp),a
1432                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1434  0023 c65441        	ld	a,21569
1435  0026 a420          	and	a,#32
1436  0028 6b02          	ld	(OFST+0,sp),a
1437                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1439  002a 7b01          	ld	a,(OFST-1,sp)
1440  002c 2708          	jreq	L556
1442  002e 7b02          	ld	a,(OFST+0,sp)
1443  0030 2704          	jreq	L556
1444                     ; 671       bitstatus = SET;
1446  0032               LC009:
1448  0032 a601          	ld	a,#1
1450  0034 2001          	jra	L356
1451  0036               L556:
1452                     ; 676       bitstatus = RESET;
1455  0036 4f            	clr	a
1456  0037               L356:
1457                     ; 681   return (ITStatus) bitstatus;
1461  0037 85            	popw	x
1462  0038 81            	ret	
1498                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1498                     ; 693 {
1499                     .text:	section	.text,new
1500  0000               _COMP_ClearITPendingBit:
1504                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1506                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1508  0000 4a            	dec	a
1509  0001 2605          	jrne	L776
1510                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1512  0003 72195440      	bres	21568,#4
1515  0007 81            	ret	
1516  0008               L776:
1517                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1519  0008 72195441      	bres	21569,#4
1520                     ; 707 }
1523  000c 81            	ret	
1536                     	xdef	_COMP_ClearITPendingBit
1537                     	xdef	_COMP_GetITStatus
1538                     	xdef	_COMP_ClearFlag
1539                     	xdef	_COMP_GetFlagStatus
1540                     	xdef	_COMP_ITConfig
1541                     	xdef	_COMP_TriggerConfig
1542                     	xdef	_COMP_SchmittTriggerCmd
1543                     	xdef	_COMP_VrefintOutputCmd
1544                     	xdef	_COMP_WindowCmd
1545                     	xdef	_COMP_GetOutputLevel
1546                     	xdef	_COMP_EdgeConfig
1547                     	xdef	_COMP_VrefintToCOMP1Connect
1548                     	xdef	_COMP_Init
1549                     	xdef	_COMP_DeInit
1568                     	end
