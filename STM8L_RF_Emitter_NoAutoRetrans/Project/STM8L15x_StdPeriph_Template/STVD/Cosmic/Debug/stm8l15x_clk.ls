   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .const:	section	.text
  22  0000               _SYSDivFactor:
  23  0000 01            	dc.b	1
  24  0001 02            	dc.b	2
  25  0002 04            	dc.b	4
  26  0003 08            	dc.b	8
  27  0004 10            	dc.b	16
  56                     ; 117 void CLK_DeInit(void)
  56                     ; 118 {
  58                     .text:	section	.text,new
  59  0000               _CLK_DeInit:
  63                     ; 119   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  65  0000 351150c2      	mov	20674,#17
  66                     ; 120   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  68  0004 725f50c6      	clr	20678
  69                     ; 121   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  71  0008 725f50c1      	clr	20673
  72                     ; 122   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  74  000c 725f50cb      	clr	20683
  75                     ; 123   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0010 350150c8      	mov	20680,#1
  78                     ; 124   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  0014 725f50c9      	clr	20681
  81                     ; 125   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0018 350350c0      	mov	20672,#3
  84                     ; 126   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  001c 725f50c3      	clr	20675
  87                     ; 127   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0020 358050c4      	mov	20676,#128
  90                     ; 128   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  92  0024 725f50d0      	clr	20688
  93                     ; 129   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  95  0028 725f50ca      	clr	20682
  96                     ; 130   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  98  002c 725f50c5      	clr	20677
  99                     ; 131   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 101  0030 725f50cd      	clr	20685
 102                     ; 132   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 104  0034 725f50cc      	clr	20684
 105                     ; 133   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 107  0038 725f50ce      	clr	20686
 108                     ; 134   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 110  003c 35b950cf      	mov	20687,#185
 111                     ; 135 }
 114  0040 81            	ret	
 169                     ; 157 void CLK_HSICmd(FunctionalState NewState)
 169                     ; 158 {
 170                     .text:	section	.text,new
 171  0000               _CLK_HSICmd:
 175                     ; 160   assert_param(IS_FUNCTIONAL_STATE(NewState));
 177                     ; 162   if (NewState != DISABLE)
 179  0000 4d            	tnz	a
 180  0001 2705          	jreq	L74
 181                     ; 165     CLK->ICKCR |= CLK_ICKCR_HSION;
 183  0003 721050c2      	bset	20674,#0
 186  0007 81            	ret	
 187  0008               L74:
 188                     ; 170     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 190  0008 721150c2      	bres	20674,#0
 191                     ; 172 }
 194  000c 81            	ret	
 230                     ; 185 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 230                     ; 186 {
 231                     .text:	section	.text,new
 232  0000               _CLK_AdjustHSICalibrationValue:
 236                     ; 188   CLK->HSIUNLCKR = 0xAC;
 238  0000 35ac50ce      	mov	20686,#172
 239                     ; 189   CLK->HSIUNLCKR = 0x35;
 241  0004 353550ce      	mov	20686,#53
 242                     ; 192   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 244  0008 c750cd        	ld	20685,a
 245                     ; 193 }
 248  000b 81            	ret	
 283                     ; 209 void CLK_LSICmd(FunctionalState NewState)
 283                     ; 210 {
 284                     .text:	section	.text,new
 285  0000               _CLK_LSICmd:
 289                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 291                     ; 215   if (NewState != DISABLE)
 293  0000 4d            	tnz	a
 294  0001 2705          	jreq	L701
 295                     ; 218     CLK->ICKCR |= CLK_ICKCR_LSION;
 297  0003 721450c2      	bset	20674,#2
 300  0007 81            	ret	
 301  0008               L701:
 302                     ; 223     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 304  0008 721550c2      	bres	20674,#2
 305                     ; 225 }
 308  000c 81            	ret	
 370                     ; 246 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 370                     ; 247 {
 371                     .text:	section	.text,new
 372  0000               _CLK_HSEConfig:
 376                     ; 249   assert_param(IS_CLK_HSE(CLK_HSE));
 378                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 380  0000 721150c6      	bres	20678,#0
 381                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 383  0004 721950c6      	bres	20678,#4
 384                     ; 259   CLK->ECKCR |= (uint8_t)CLK_HSE;
 386  0008 ca50c6        	or	a,20678
 387  000b c750c6        	ld	20678,a
 388                     ; 260 }
 391  000e 81            	ret	
 453                     ; 277 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 453                     ; 278 {
 454                     .text:	section	.text,new
 455  0000               _CLK_LSEConfig:
 459                     ; 280   assert_param(IS_CLK_LSE(CLK_LSE));
 461                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 463  0000 721550c6      	bres	20678,#2
 464                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 466  0004 721b50c6      	bres	20678,#5
 467                     ; 290   CLK->ECKCR |= (uint8_t)CLK_LSE;
 469  0008 ca50c6        	or	a,20678
 470  000b c750c6        	ld	20678,a
 471                     ; 292 }
 474  000e 81            	ret	
 498                     ; 303 void CLK_ClockSecuritySystemEnable(void)
 498                     ; 304 {
 499                     .text:	section	.text,new
 500  0000               _CLK_ClockSecuritySystemEnable:
 504                     ; 306   CLK->CSSR |= CLK_CSSR_CSSEN;
 506  0000 721050ca      	bset	20682,#0
 507                     ; 307 }
 510  0004 81            	ret	
 546                     ; 314 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 546                     ; 315 {
 547                     .text:	section	.text,new
 548  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 552                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 554                     ; 319   if (NewState != DISABLE)
 556  0000 4d            	tnz	a
 557  0001 2705          	jreq	L122
 558                     ; 322     CLK->CSSR |= CLK_CSSR_CSSDGON;
 560  0003 721850ca      	bset	20682,#4
 563  0007 81            	ret	
 564  0008               L122:
 565                     ; 327     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 567  0008 721950ca      	bres	20682,#4
 568                     ; 329 }
 571  000c 81            	ret	
 712                     ; 353 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 712                     ; 354 {
 713                     .text:	section	.text,new
 714  0000               _CLK_CCOConfig:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 356   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 722                     ; 357   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 724                     ; 360   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 726  0001 9f            	ld	a,xl
 727  0002 1a01          	or	a,(OFST+1,sp)
 728  0004 c750c5        	ld	20677,a
 729                     ; 361 }
 732  0007 85            	popw	x
 733  0008 81            	ret	
 807                     ; 413 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 807                     ; 414 {
 808                     .text:	section	.text,new
 809  0000               _CLK_SYSCLKSourceConfig:
 813                     ; 416   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 815                     ; 419   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 817  0000 c750c8        	ld	20680,a
 818                     ; 420 }
 821  0003 81            	ret	
 846                     ; 432 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 846                     ; 433 {
 847                     .text:	section	.text,new
 848  0000               _CLK_GetSYSCLKSource:
 852                     ; 434   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 854  0000 c650c7        	ld	a,20679
 857  0003 81            	ret	
 929                     ; 475 uint32_t CLK_GetClockFreq(void)
 929                     ; 476 {
 930                     .text:	section	.text,new
 931  0000               _CLK_GetClockFreq:
 933  0000 5209          	subw	sp,#9
 934       00000009      OFST:	set	9
 937                     ; 477   uint32_t clockfrequency = 0;
 939                     ; 478   uint32_t sourcefrequency = 0;
 941  0002 5f            	clrw	x
 942  0003 1f07          	ldw	(OFST-2,sp),x
 943  0005 1f05          	ldw	(OFST-4,sp),x
 944                     ; 479   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 946                     ; 480   uint8_t tmp = 0, presc = 0;
 950                     ; 483   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 952  0007 c650c7        	ld	a,20679
 953  000a 6b09          	ld	(OFST+0,sp),a
 954                     ; 485   if ( clocksource == CLK_SYSCLKSource_HSI)
 956  000c a101          	cp	a,#1
 957                     ; 487     sourcefrequency = HSI_VALUE;
 959  000e 2710          	jreq	LC002
 960                     ; 489   else if ( clocksource == CLK_SYSCLKSource_LSI)
 962  0010 a102          	cp	a,#2
 963  0012 2608          	jrne	L314
 964                     ; 491     sourcefrequency = LSI_VALUE;
 966  0014 ae9470        	ldw	x,#38000
 967  0017 1f07          	ldw	(OFST-2,sp),x
 968  0019 5f            	clrw	x
 970  001a 200c          	jp	LC001
 971  001c               L314:
 972                     ; 493   else if ( clocksource == CLK_SYSCLKSource_HSE)
 974  001c a104          	cp	a,#4
 975  001e 260a          	jrne	L714
 976                     ; 495     sourcefrequency = HSE_VALUE;
 978  0020               LC002:
 980  0020 ae2400        	ldw	x,#9216
 981  0023 1f07          	ldw	(OFST-2,sp),x
 982  0025 ae00f4        	ldw	x,#244
 983  0028               LC001:
 984  0028 1f05          	ldw	(OFST-4,sp),x
 986  002a               L714:
 987                     ; 499     clockfrequency = LSE_VALUE;
 989                     ; 503   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 991  002a c650c0        	ld	a,20672
 992  002d a407          	and	a,#7
 993                     ; 504   presc = SYSDivFactor[tmp];
 995  002f 5f            	clrw	x
 996  0030 97            	ld	xl,a
 997  0031 d60000        	ld	a,(_SYSDivFactor,x)
 998  0034 6b09          	ld	(OFST+0,sp),a
 999                     ; 507   clockfrequency = sourcefrequency / presc;
1001  0036 b703          	ld	c_lreg+3,a
1002  0038 3f02          	clr	c_lreg+2
1003  003a 3f01          	clr	c_lreg+1
1004  003c 3f00          	clr	c_lreg
1005  003e 96            	ldw	x,sp
1006  003f 5c            	incw	x
1007  0040 cd0000        	call	c_rtol
1009  0043 96            	ldw	x,sp
1010  0044 1c0005        	addw	x,#OFST-4
1011  0047 cd0000        	call	c_ltor
1013  004a 96            	ldw	x,sp
1014  004b 5c            	incw	x
1015  004c cd0000        	call	c_ludv
1017  004f 96            	ldw	x,sp
1018  0050 1c0005        	addw	x,#OFST-4
1019  0053 cd0000        	call	c_rtol
1021                     ; 509   return((uint32_t)clockfrequency);
1023  0056 96            	ldw	x,sp
1024  0057 1c0005        	addw	x,#OFST-4
1025  005a cd0000        	call	c_ltor
1029  005d 5b09          	addw	sp,#9
1030  005f 81            	ret	
1128                     ; 525 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1128                     ; 526 {
1129                     .text:	section	.text,new
1130  0000               _CLK_SYSCLKDivConfig:
1134                     ; 528   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1136                     ; 530   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1138  0000 c750c0        	ld	20672,a
1139                     ; 531 }
1142  0003 81            	ret	
1178                     ; 538 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1178                     ; 539 {
1179                     .text:	section	.text,new
1180  0000               _CLK_SYSCLKSourceSwitchCmd:
1184                     ; 541   assert_param(IS_FUNCTIONAL_STATE(NewState));
1186                     ; 543   if (NewState != DISABLE)
1188  0000 4d            	tnz	a
1189  0001 2705          	jreq	L305
1190                     ; 546     CLK->SWCR |= CLK_SWCR_SWEN;
1192  0003 721250c9      	bset	20681,#1
1195  0007 81            	ret	
1196  0008               L305:
1197                     ; 551     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1199  0008 721350c9      	bres	20681,#1
1200                     ; 553 }
1203  000c 81            	ret	
1349                     ; 613 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1349                     ; 614 {
1350                     .text:	section	.text,new
1351  0000               _CLK_RTCClockConfig:
1353  0000 89            	pushw	x
1354       00000000      OFST:	set	0
1357                     ; 616   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1359                     ; 617   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1361                     ; 620   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1363  0001 9f            	ld	a,xl
1364  0002 1a01          	or	a,(OFST+1,sp)
1365  0004 c750c1        	ld	20673,a
1366                     ; 621 }
1369  0007 85            	popw	x
1370  0008 81            	ret	
1436                     ; 632 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1436                     ; 633 {
1437                     .text:	section	.text,new
1438  0000               _CLK_BEEPClockConfig:
1442                     ; 635   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1444                     ; 638   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1446  0000 c750cb        	ld	20683,a
1447                     ; 640 }
1450  0003 81            	ret	
1675                     ; 674 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1675                     ; 675 {
1676                     .text:	section	.text,new
1677  0000               _CLK_PeripheralClockConfig:
1679  0000 89            	pushw	x
1680  0001 88            	push	a
1681       00000001      OFST:	set	1
1684                     ; 676   uint8_t reg = 0;
1686                     ; 679   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1688                     ; 680   assert_param(IS_FUNCTIONAL_STATE(NewState));
1690                     ; 683   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1692  0002 9e            	ld	a,xh
1693  0003 a4f0          	and	a,#240
1694  0005 6b01          	ld	(OFST+0,sp),a
1695                     ; 685   if ( reg == 0x00)
1697  0007 2633          	jrne	L527
1698                     ; 687     if (NewState != DISABLE)
1700  0009 7b03          	ld	a,(OFST+2,sp)
1701  000b 2717          	jreq	L727
1702                     ; 690       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1704  000d 7b02          	ld	a,(OFST+1,sp)
1705  000f a40f          	and	a,#15
1706  0011 5f            	clrw	x
1707  0012 97            	ld	xl,a
1708  0013 a601          	ld	a,#1
1709  0015 5d            	tnzw	x
1710  0016 2704          	jreq	L64
1711  0018               L05:
1712  0018 48            	sll	a
1713  0019 5a            	decw	x
1714  001a 26fc          	jrne	L05
1715  001c               L64:
1716  001c ca50c3        	or	a,20675
1717  001f c750c3        	ld	20675,a
1719  0022 207a          	jra	L337
1720  0024               L727:
1721                     ; 695       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1723  0024 7b02          	ld	a,(OFST+1,sp)
1724  0026 a40f          	and	a,#15
1725  0028 5f            	clrw	x
1726  0029 97            	ld	xl,a
1727  002a a601          	ld	a,#1
1728  002c 5d            	tnzw	x
1729  002d 2704          	jreq	L25
1730  002f               L45:
1731  002f 48            	sll	a
1732  0030 5a            	decw	x
1733  0031 26fc          	jrne	L45
1734  0033               L25:
1735  0033 43            	cpl	a
1736  0034 c450c3        	and	a,20675
1737  0037 c750c3        	ld	20675,a
1738  003a 2062          	jra	L337
1739  003c               L527:
1740                     ; 698   else if (reg == 0x10)
1742  003c a110          	cp	a,#16
1743  003e 2630          	jrne	L537
1744                     ; 700     if (NewState != DISABLE)
1746  0040 7b03          	ld	a,(OFST+2,sp)
1747  0042 2714          	jreq	L737
1748                     ; 703       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1750  0044 7b02          	ld	a,(OFST+1,sp)
1751  0046 a40f          	and	a,#15
1752  0048 5f            	clrw	x
1753  0049 97            	ld	xl,a
1754  004a a601          	ld	a,#1
1755  004c 5d            	tnzw	x
1756  004d 2704          	jreq	L65
1757  004f               L06:
1758  004f 48            	sll	a
1759  0050 5a            	decw	x
1760  0051 26fc          	jrne	L06
1761  0053               L65:
1762  0053 ca50c4        	or	a,20676
1764  0056 2013          	jp	LC004
1765  0058               L737:
1766                     ; 708       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1768  0058 7b02          	ld	a,(OFST+1,sp)
1769  005a a40f          	and	a,#15
1770  005c 5f            	clrw	x
1771  005d 97            	ld	xl,a
1772  005e a601          	ld	a,#1
1773  0060 5d            	tnzw	x
1774  0061 2704          	jreq	L26
1775  0063               L46:
1776  0063 48            	sll	a
1777  0064 5a            	decw	x
1778  0065 26fc          	jrne	L46
1779  0067               L26:
1780  0067 43            	cpl	a
1781  0068 c450c4        	and	a,20676
1782  006b               LC004:
1783  006b c750c4        	ld	20676,a
1784  006e 202e          	jra	L337
1785  0070               L537:
1786                     ; 713     if (NewState != DISABLE)
1788  0070 7b03          	ld	a,(OFST+2,sp)
1789  0072 2714          	jreq	L547
1790                     ; 716       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1792  0074 7b02          	ld	a,(OFST+1,sp)
1793  0076 a40f          	and	a,#15
1794  0078 5f            	clrw	x
1795  0079 97            	ld	xl,a
1796  007a a601          	ld	a,#1
1797  007c 5d            	tnzw	x
1798  007d 2704          	jreq	L66
1799  007f               L07:
1800  007f 48            	sll	a
1801  0080 5a            	decw	x
1802  0081 26fc          	jrne	L07
1803  0083               L66:
1804  0083 ca50d0        	or	a,20688
1806  0086 2013          	jp	LC003
1807  0088               L547:
1808                     ; 721       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1810  0088 7b02          	ld	a,(OFST+1,sp)
1811  008a a40f          	and	a,#15
1812  008c 5f            	clrw	x
1813  008d 97            	ld	xl,a
1814  008e a601          	ld	a,#1
1815  0090 5d            	tnzw	x
1816  0091 2704          	jreq	L27
1817  0093               L47:
1818  0093 48            	sll	a
1819  0094 5a            	decw	x
1820  0095 26fc          	jrne	L47
1821  0097               L27:
1822  0097 43            	cpl	a
1823  0098 c450d0        	and	a,20688
1824  009b               LC003:
1825  009b c750d0        	ld	20688,a
1826  009e               L337:
1827                     ; 724 }
1830  009e 5b03          	addw	sp,#3
1831  00a0 81            	ret	
1855                     ; 762 void CLK_LSEClockSecuritySystemEnable(void)
1855                     ; 763 {
1856                     .text:	section	.text,new
1857  0000               _CLK_LSEClockSecuritySystemEnable:
1861                     ; 765   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1863  0000 72105190      	bset	20880,#0
1864                     ; 766 }
1867  0004 81            	ret	
1891                     ; 774 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1891                     ; 775 {
1892                     .text:	section	.text,new
1893  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1897                     ; 777   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1899  0000 72125190      	bset	20880,#1
1900                     ; 778 }
1903  0004 81            	ret	
1978                     ; 804 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1978                     ; 805 {
1979                     .text:	section	.text,new
1980  0000               _CLK_HaltConfig:
1982  0000 89            	pushw	x
1983       00000000      OFST:	set	0
1986                     ; 807   assert_param(IS_CLK_HALT(CLK_Halt));
1988                     ; 808   assert_param(IS_FUNCTIONAL_STATE(NewState));
1990                     ; 810   if (NewState != DISABLE)
1992  0001 9f            	ld	a,xl
1993  0002 4d            	tnz	a
1994  0003 2706          	jreq	L5201
1995                     ; 812     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1997  0005 9e            	ld	a,xh
1998  0006 ca50c2        	or	a,20674
2000  0009 2006          	jra	L7201
2001  000b               L5201:
2002                     ; 816     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2004  000b 7b01          	ld	a,(OFST+1,sp)
2005  000d 43            	cpl	a
2006  000e c450c2        	and	a,20674
2007  0011               L7201:
2008  0011 c750c2        	ld	20674,a
2009                     ; 818 }
2012  0014 85            	popw	x
2013  0015 81            	ret	
2049                     ; 828 void CLK_MainRegulatorCmd(FunctionalState NewState)
2049                     ; 829 {
2050                     .text:	section	.text,new
2051  0000               _CLK_MainRegulatorCmd:
2055                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2057                     ; 833   if (NewState != DISABLE)
2059  0000 4d            	tnz	a
2060  0001 2705          	jreq	L7401
2061                     ; 836     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2063  0003 721350cf      	bres	20687,#1
2066  0007 81            	ret	
2067  0008               L7401:
2068                     ; 841     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2070  0008 721250cf      	bset	20687,#1
2071                     ; 843 }
2074  000c 81            	ret	
2146                     ; 872 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2146                     ; 873 {
2147                     .text:	section	.text,new
2148  0000               _CLK_ITConfig:
2150  0000 89            	pushw	x
2151       00000000      OFST:	set	0
2154                     ; 876   assert_param(IS_CLK_IT(CLK_IT));
2156                     ; 877   assert_param(IS_FUNCTIONAL_STATE(NewState));
2158                     ; 879   if (NewState != DISABLE)
2160  0001 9f            	ld	a,xl
2161  0002 4d            	tnz	a
2162  0003 271d          	jreq	L7011
2163                     ; 881     if (CLK_IT == CLK_IT_SWIF)
2165  0005 9e            	ld	a,xh
2166  0006 a11c          	cp	a,#28
2167  0008 2606          	jrne	L1111
2168                     ; 884       CLK->SWCR |= CLK_SWCR_SWIEN;
2170  000a 721450c9      	bset	20681,#2
2172  000e 202c          	jra	L1211
2173  0010               L1111:
2174                     ; 886     else if (CLK_IT == CLK_IT_LSECSSF)
2176  0010 7b01          	ld	a,(OFST+1,sp)
2177  0012 a12c          	cp	a,#44
2178  0014 2606          	jrne	L5111
2179                     ; 889       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2181  0016 72145190      	bset	20880,#2
2183  001a 2020          	jra	L1211
2184  001c               L5111:
2185                     ; 894       CLK->CSSR |= CLK_CSSR_CSSDIE;
2187  001c 721450ca      	bset	20682,#2
2188  0020 201a          	jra	L1211
2189  0022               L7011:
2190                     ; 899     if (CLK_IT == CLK_IT_SWIF)
2192  0022 7b01          	ld	a,(OFST+1,sp)
2193  0024 a11c          	cp	a,#28
2194  0026 2606          	jrne	L3211
2195                     ; 902       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2197  0028 721550c9      	bres	20681,#2
2199  002c 200e          	jra	L1211
2200  002e               L3211:
2201                     ; 904     else if (CLK_IT == CLK_IT_LSECSSF)
2203  002e a12c          	cp	a,#44
2204  0030 2606          	jrne	L7211
2205                     ; 907       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2207  0032 72155190      	bres	20880,#2
2209  0036 2004          	jra	L1211
2210  0038               L7211:
2211                     ; 912       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2213  0038 721550ca      	bres	20682,#2
2214  003c               L1211:
2215                     ; 915 }
2218  003c 85            	popw	x
2219  003d 81            	ret	
2442                     ; 942 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2442                     ; 943 {
2443                     .text:	section	.text,new
2444  0000               _CLK_GetFlagStatus:
2446  0000 88            	push	a
2447  0001 89            	pushw	x
2448       00000002      OFST:	set	2
2451                     ; 944   uint8_t reg = 0;
2453                     ; 945   uint8_t pos = 0;
2455                     ; 946   FlagStatus bitstatus = RESET;
2457                     ; 949   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2459                     ; 952   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2461  0002 a4f0          	and	a,#240
2462  0004 6b02          	ld	(OFST+0,sp),a
2463                     ; 955   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2465  0006 7b03          	ld	a,(OFST+1,sp)
2466  0008 a40f          	and	a,#15
2467  000a 6b01          	ld	(OFST-1,sp),a
2468                     ; 957   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2470  000c 7b02          	ld	a,(OFST+0,sp)
2471  000e 2605          	jrne	L7421
2472                     ; 959     reg = CLK->CRTCR;
2474  0010 c650c1        	ld	a,20673
2476  0013 2042          	jra	L1521
2477  0015               L7421:
2478                     ; 961   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2480  0015 a110          	cp	a,#16
2481  0017 2605          	jrne	L3521
2482                     ; 963     reg = CLK->ICKCR;
2484  0019 c650c2        	ld	a,20674
2486  001c 2039          	jra	L1521
2487  001e               L3521:
2488                     ; 965   else if (reg == 0x20) /* The flag to check is in CCOR register */
2490  001e a120          	cp	a,#32
2491  0020 2605          	jrne	L7521
2492                     ; 967     reg = CLK->CCOR;
2494  0022 c650c5        	ld	a,20677
2496  0025 2030          	jra	L1521
2497  0027               L7521:
2498                     ; 969   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2500  0027 a130          	cp	a,#48
2501  0029 2605          	jrne	L3621
2502                     ; 971     reg = CLK->ECKCR;
2504  002b c650c6        	ld	a,20678
2506  002e 2027          	jra	L1521
2507  0030               L3621:
2508                     ; 973   else if (reg == 0x40) /* The flag to check is in SWCR register */
2510  0030 a140          	cp	a,#64
2511  0032 2605          	jrne	L7621
2512                     ; 975     reg = CLK->SWCR;
2514  0034 c650c9        	ld	a,20681
2516  0037 201e          	jra	L1521
2517  0039               L7621:
2518                     ; 977   else if (reg == 0x50) /* The flag to check is in CSSR register */
2520  0039 a150          	cp	a,#80
2521  003b 2605          	jrne	L3721
2522                     ; 979     reg = CLK->CSSR;
2524  003d c650ca        	ld	a,20682
2526  0040 2015          	jra	L1521
2527  0042               L3721:
2528                     ; 981   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2530  0042 a170          	cp	a,#112
2531  0044 2605          	jrne	L7721
2532                     ; 983     reg = CLK->REGCSR;
2534  0046 c650cf        	ld	a,20687
2536  0049 200c          	jra	L1521
2537  004b               L7721:
2538                     ; 985   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2540  004b a180          	cp	a,#128
2541  004d 2605          	jrne	L3031
2542                     ; 987     reg = CSSLSE->CSR;
2544  004f c65190        	ld	a,20880
2546  0052 2003          	jra	L1521
2547  0054               L3031:
2548                     ; 991     reg = CLK->CBEEPR;
2550  0054 c650cb        	ld	a,20683
2551  0057               L1521:
2552  0057 6b02          	ld	(OFST+0,sp),a
2553                     ; 995   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2555  0059 5f            	clrw	x
2556  005a 7b01          	ld	a,(OFST-1,sp)
2557  005c 97            	ld	xl,a
2558  005d a601          	ld	a,#1
2559  005f 5d            	tnzw	x
2560  0060 2704          	jreq	L211
2561  0062               L411:
2562  0062 48            	sll	a
2563  0063 5a            	decw	x
2564  0064 26fc          	jrne	L411
2565  0066               L211:
2566  0066 1402          	and	a,(OFST+0,sp)
2567  0068 2702          	jreq	L7031
2568                     ; 997     bitstatus = SET;
2570  006a a601          	ld	a,#1
2572  006c               L7031:
2573                     ; 1001     bitstatus = RESET;
2575                     ; 1005   return((FlagStatus)bitstatus);
2579  006c 5b03          	addw	sp,#3
2580  006e 81            	ret	
2603                     ; 1013 void CLK_ClearFlag(void)
2603                     ; 1014 {
2604                     .text:	section	.text,new
2605  0000               _CLK_ClearFlag:
2609                     ; 1017   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2611  0000 72175190      	bres	20880,#3
2612                     ; 1018 }
2615  0004 81            	ret	
2661                     ; 1029 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2661                     ; 1030 {
2662                     .text:	section	.text,new
2663  0000               _CLK_GetITStatus:
2665  0000 88            	push	a
2666  0001 88            	push	a
2667       00000001      OFST:	set	1
2670                     ; 1032   ITStatus bitstatus = RESET;
2672                     ; 1035   assert_param(IS_CLK_IT(CLK_IT));
2674                     ; 1037   if (CLK_IT == CLK_IT_SWIF)
2676  0002 a11c          	cp	a,#28
2677  0004 2605          	jrne	L5431
2678                     ; 1040     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2680  0006 c450c9        	and	a,20681
2681                     ; 1042       bitstatus = SET;
2683  0009 200b          	jp	LC007
2684                     ; 1046       bitstatus = RESET;
2685  000b               L5431:
2686                     ; 1049   else if (CLK_IT == CLK_IT_LSECSSF)
2688  000b 7b02          	ld	a,(OFST+1,sp)
2689  000d a12c          	cp	a,#44
2690  000f 260d          	jrne	L5531
2691                     ; 1052     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2693  0011 c65190        	ld	a,20880
2694  0014 1402          	and	a,(OFST+1,sp)
2695  0016               LC007:
2696  0016 a10c          	cp	a,#12
2697  0018 260d          	jrne	L5631
2698                     ; 1054       bitstatus = SET;
2700  001a               LC006:
2703  001a a601          	ld	a,#1
2705  001c 200a          	jra	L3531
2706                     ; 1058       bitstatus = RESET;
2707  001e               L5531:
2708                     ; 1064     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2710  001e c650ca        	ld	a,20682
2711  0021 1402          	and	a,(OFST+1,sp)
2712  0023 a10c          	cp	a,#12
2713                     ; 1066       bitstatus = SET;
2715  0025 27f3          	jreq	LC006
2716  0027               L5631:
2717                     ; 1070       bitstatus = RESET;
2721  0027 4f            	clr	a
2722  0028               L3531:
2723                     ; 1075   return bitstatus;
2727  0028 85            	popw	x
2728  0029 81            	ret	
2764                     ; 1086 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2764                     ; 1087 {
2765                     .text:	section	.text,new
2766  0000               _CLK_ClearITPendingBit:
2770                     ; 1090   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2772                     ; 1092   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2774  0000 a4f0          	and	a,#240
2775  0002 a120          	cp	a,#32
2776  0004 2605          	jrne	L7041
2777                     ; 1095     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2779  0006 72175190      	bres	20880,#3
2782  000a 81            	ret	
2783  000b               L7041:
2784                     ; 1100     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2786  000b 721750c9      	bres	20681,#3
2787                     ; 1102 }
2790  000f 81            	ret	
2815                     	xdef	_SYSDivFactor
2816                     	xdef	_CLK_ClearITPendingBit
2817                     	xdef	_CLK_GetITStatus
2818                     	xdef	_CLK_ClearFlag
2819                     	xdef	_CLK_GetFlagStatus
2820                     	xdef	_CLK_ITConfig
2821                     	xdef	_CLK_MainRegulatorCmd
2822                     	xdef	_CLK_HaltConfig
2823                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2824                     	xdef	_CLK_LSEClockSecuritySystemEnable
2825                     	xdef	_CLK_PeripheralClockConfig
2826                     	xdef	_CLK_BEEPClockConfig
2827                     	xdef	_CLK_RTCClockConfig
2828                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2829                     	xdef	_CLK_SYSCLKDivConfig
2830                     	xdef	_CLK_GetClockFreq
2831                     	xdef	_CLK_GetSYSCLKSource
2832                     	xdef	_CLK_SYSCLKSourceConfig
2833                     	xdef	_CLK_CCOConfig
2834                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2835                     	xdef	_CLK_ClockSecuritySystemEnable
2836                     	xdef	_CLK_LSEConfig
2837                     	xdef	_CLK_HSEConfig
2838                     	xdef	_CLK_LSICmd
2839                     	xdef	_CLK_AdjustHSICalibrationValue
2840                     	xdef	_CLK_HSICmd
2841                     	xdef	_CLK_DeInit
2842                     	xref.b	c_lreg
2843                     	xref.b	c_x
2862                     	xref	c_ludv
2863                     	xref	c_rtol
2864                     	xref	c_ltor
2865                     	end
