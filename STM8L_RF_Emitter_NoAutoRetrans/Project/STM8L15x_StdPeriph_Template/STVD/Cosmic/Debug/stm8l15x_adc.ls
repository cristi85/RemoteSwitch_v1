   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 180                     ; 132 void ADC_DeInit(ADC_TypeDef* ADCx)
 180                     ; 133 {
 182                     .text:	section	.text,new
 183  0000               _ADC_DeInit:
 187                     ; 135   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 189  0000 7f            	clr	(x)
 190                     ; 136   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 192  0001 6f01          	clr	(1,x)
 193                     ; 137   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 195  0003 a61f          	ld	a,#31
 196  0005 e702          	ld	(2,x),a
 197                     ; 140   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 199  0007 a6ff          	ld	a,#255
 200  0009 e703          	ld	(3,x),a
 201                     ; 143   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 203  000b a60f          	ld	a,#15
 204  000d e706          	ld	(6,x),a
 205                     ; 144   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 207  000f a6ff          	ld	a,#255
 208  0011 e707          	ld	(7,x),a
 209                     ; 147   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 211  0013 6f08          	clr	(8,x)
 212                     ; 148   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 214  0015 6f09          	clr	(9,x)
 215                     ; 151   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 217  0017 6f0a          	clr	(10,x)
 218                     ; 152   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 220  0019 6f0b          	clr	(11,x)
 221                     ; 153   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 223  001b 6f0c          	clr	(12,x)
 224                     ; 154   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 226  001d 6f0d          	clr	(13,x)
 227                     ; 157   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 229  001f 6f0e          	clr	(14,x)
 230                     ; 158   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 232  0021 6f0f          	clr	(15,x)
 233                     ; 159   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 235  0023 6f10          	clr	(16,x)
 236                     ; 160   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 238  0025 6f11          	clr	(17,x)
 239                     ; 161 }
 242  0027 81            	ret	
 389                     ; 183 void ADC_Init(ADC_TypeDef* ADCx,
 389                     ; 184               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 389                     ; 185               ADC_Resolution_TypeDef ADC_Resolution,
 389                     ; 186               ADC_Prescaler_TypeDef ADC_Prescaler)
 389                     ; 187 {
 390                     .text:	section	.text,new
 391  0000               _ADC_Init:
 393  0000 89            	pushw	x
 394       00000000      OFST:	set	0
 397                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 399                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 401                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 403                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 405  0001 f6            	ld	a,(x)
 406  0002 a49b          	and	a,#155
 407  0004 f7            	ld	(x),a
 408                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 410  0005 7b05          	ld	a,(OFST+5,sp)
 411  0007 1a06          	or	a,(OFST+6,sp)
 412  0009 fa            	or	a,(x)
 413  000a f7            	ld	(x),a
 414                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 416  000b e601          	ld	a,(1,x)
 417  000d a47f          	and	a,#127
 418  000f e701          	ld	(1,x),a
 419                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 421  0011 e601          	ld	a,(1,x)
 422  0013 1a07          	or	a,(OFST+7,sp)
 423  0015 e701          	ld	(1,x),a
 424                     ; 204 }
 427  0017 85            	popw	x
 428  0018 81            	ret	
 495                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 495                     ; 214              FunctionalState NewState)
 495                     ; 215 {
 496                     .text:	section	.text,new
 497  0000               _ADC_Cmd:
 499  0000 89            	pushw	x
 500       00000000      OFST:	set	0
 503                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 505                     ; 219   if (NewState != DISABLE)
 507  0001 7b05          	ld	a,(OFST+5,sp)
 508  0003 2705          	jreq	L142
 509                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 511  0005 f6            	ld	a,(x)
 512  0006 aa01          	or	a,#1
 514  0008 2005          	jra	L342
 515  000a               L142:
 516                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 518  000a 1e01          	ldw	x,(OFST+1,sp)
 519  000c f6            	ld	a,(x)
 520  000d a4fe          	and	a,#254
 521  000f               L342:
 522  000f f7            	ld	(x),a
 523                     ; 229 }
 526  0010 85            	popw	x
 527  0011 81            	ret	
 565                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 565                     ; 237 {
 566                     .text:	section	.text,new
 567  0000               _ADC_SoftwareStartConv:
 571                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 573  0000 f6            	ld	a,(x)
 574  0001 aa02          	or	a,#2
 575  0003 f7            	ld	(x),a
 576                     ; 240 }
 579  0004 81            	ret	
 707                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 707                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 707                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 707                     ; 261 {
 708                     .text:	section	.text,new
 709  0000               _ADC_ExternalTrigConfig:
 711  0000 89            	pushw	x
 712       00000000      OFST:	set	0
 715                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 717                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 719                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 721  0001 e601          	ld	a,(1,x)
 722  0003 a487          	and	a,#135
 723  0005 e701          	ld	(1,x),a
 724                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 724                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 726  0007 7b06          	ld	a,(OFST+6,sp)
 727  0009 1a05          	or	a,(OFST+5,sp)
 728  000b ea01          	or	a,(1,x)
 729  000d e701          	ld	(1,x),a
 730                     ; 273 }
 733  000f 85            	popw	x
 734  0010 81            	ret	
1048                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1048                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1048                     ; 338 {
1049                     .text:	section	.text,new
1050  0000               _ADC_AnalogWatchdogChannelSelect:
1052  0000 89            	pushw	x
1053       00000000      OFST:	set	0
1056                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1058                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1060  0001 e602          	ld	a,(2,x)
1061  0003 a4e0          	and	a,#224
1062  0005 e702          	ld	(2,x),a
1063                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1065  0007 e602          	ld	a,(2,x)
1066  0009 1a05          	or	a,(OFST+5,sp)
1067  000b e702          	ld	(2,x),a
1068                     ; 347 }
1071  000d 85            	popw	x
1072  000e 81            	ret	
1128                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1128                     ; 359 {
1129                     .text:	section	.text,new
1130  0000               _ADC_AnalogWatchdogThresholdsConfig:
1132  0000 89            	pushw	x
1133       00000000      OFST:	set	0
1136                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1138                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1140                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1142  0001 7b05          	ld	a,(OFST+5,sp)
1143  0003 1e01          	ldw	x,(OFST+1,sp)
1144  0005 e706          	ld	(6,x),a
1145                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1147  0007 7b06          	ld	a,(OFST+6,sp)
1148  0009 e707          	ld	(7,x),a
1149                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1151  000b 7b07          	ld	a,(OFST+7,sp)
1152  000d e708          	ld	(8,x),a
1153                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1155  000f 7b08          	ld	a,(OFST+8,sp)
1156  0011 e709          	ld	(9,x),a
1157                     ; 371 }
1160  0013 85            	popw	x
1161  0014 81            	ret	
1228                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1228                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1228                     ; 411                               uint16_t HighThreshold,
1228                     ; 412                               uint16_t LowThreshold)
1228                     ; 413 {
1229                     .text:	section	.text,new
1230  0000               _ADC_AnalogWatchdogConfig:
1232  0000 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1238                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1240                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1242                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1244  0001 e602          	ld	a,(2,x)
1245  0003 a4e0          	and	a,#224
1246  0005 e702          	ld	(2,x),a
1247                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1249  0007 e602          	ld	a,(2,x)
1250  0009 1a05          	or	a,(OFST+5,sp)
1251  000b e702          	ld	(2,x),a
1252                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1254  000d 7b06          	ld	a,(OFST+6,sp)
1255  000f 1e01          	ldw	x,(OFST+1,sp)
1256  0011 e706          	ld	(6,x),a
1257                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1259  0013 7b07          	ld	a,(OFST+7,sp)
1260  0015 e707          	ld	(7,x),a
1261                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1263  0017 7b08          	ld	a,(OFST+8,sp)
1264  0019 e708          	ld	(8,x),a
1265                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1267  001b 7b09          	ld	a,(OFST+9,sp)
1268  001d e709          	ld	(9,x),a
1269                     ; 432 }
1272  001f 85            	popw	x
1273  0020 81            	ret	
1308                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1308                     ; 472 {
1309                     .text:	section	.text,new
1310  0000               _ADC_TempSensorCmd:
1314                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1316                     ; 476   if (NewState != DISABLE)
1318  0000 4d            	tnz	a
1319  0001 2705          	jreq	L175
1320                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1322  0003 721a534e      	bset	21326,#5
1325  0007 81            	ret	
1326  0008               L175:
1327                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1329  0008 721b534e      	bres	21326,#5
1330                     ; 486 }
1333  000c 81            	ret	
1368                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1368                     ; 495 {
1369                     .text:	section	.text,new
1370  0000               _ADC_VrefintCmd:
1374                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1376                     ; 499   if (NewState != DISABLE)
1378  0000 4d            	tnz	a
1379  0001 2705          	jreq	L316
1380                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1382  0003 7218534e      	bset	21326,#4
1385  0007 81            	ret	
1386  0008               L316:
1387                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1389  0008 7219534e      	bres	21326,#4
1390                     ; 509 }
1393  000c 81            	ret	
1705                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1705                     ; 581 {
1706                     .text:	section	.text,new
1707  0000               _ADC_ChannelCmd:
1709  0000 89            	pushw	x
1710  0001 88            	push	a
1711       00000001      OFST:	set	1
1714                     ; 582   uint8_t regindex = 0;
1716                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1718                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1720  0002 7b06          	ld	a,(OFST+5,sp)
1721  0004 6b01          	ld	(OFST+0,sp),a
1722                     ; 588   if (NewState != DISABLE)
1724  0006 0d08          	tnz	(OFST+7,sp)
1725  0008 270d          	jreq	L367
1726                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1728  000a 01            	rrwa	x,a
1729  000b 1b01          	add	a,(OFST+0,sp)
1730  000d 2401          	jrnc	L23
1731  000f 5c            	incw	x
1732  0010               L23:
1733  0010 02            	rlwa	x,a
1734  0011 e60a          	ld	a,(10,x)
1735  0013 1a07          	or	a,(OFST+6,sp)
1737  0015 2010          	jra	L567
1738  0017               L367:
1739                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1741  0017 7b02          	ld	a,(OFST+1,sp)
1742  0019 97            	ld	xl,a
1743  001a 7b03          	ld	a,(OFST+2,sp)
1744  001c 1b01          	add	a,(OFST+0,sp)
1745  001e 2401          	jrnc	L43
1746  0020 5c            	incw	x
1747  0021               L43:
1748  0021 02            	rlwa	x,a
1749  0022 7b07          	ld	a,(OFST+6,sp)
1750  0024 43            	cpl	a
1751  0025 e40a          	and	a,(10,x)
1752  0027               L567:
1753  0027 e70a          	ld	(10,x),a
1754                     ; 598 }
1757  0029 5b03          	addw	sp,#3
1758  002b 81            	ret	
1908                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1908                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1908                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1908                     ; 625 {
1909                     .text:	section	.text,new
1910  0000               _ADC_SamplingTimeConfig:
1912  0000 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1918                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1920                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1922  0001 7b05          	ld	a,(OFST+5,sp)
1923  0003 2712          	jreq	L3501
1924                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1926  0005 e602          	ld	a,(2,x)
1927  0007 a41f          	and	a,#31
1928  0009 e702          	ld	(2,x),a
1929                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1931  000b 7b06          	ld	a,(OFST+6,sp)
1932  000d 4e            	swap	a
1933  000e 48            	sll	a
1934  000f a4e0          	and	a,#224
1935  0011 ea02          	or	a,(2,x)
1936  0013 e702          	ld	(2,x),a
1938  0015 200e          	jra	L5501
1939  0017               L3501:
1940                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1942  0017 1e01          	ldw	x,(OFST+1,sp)
1943  0019 e601          	ld	a,(1,x)
1944  001b a4f8          	and	a,#248
1945  001d e701          	ld	(1,x),a
1946                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1948  001f e601          	ld	a,(1,x)
1949  0021 1a06          	or	a,(OFST+6,sp)
1950  0023 e701          	ld	(1,x),a
1951  0025               L5501:
1952                     ; 642 }
1955  0025 85            	popw	x
1956  0026 81            	ret	
2023                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2023                     ; 689                               FunctionalState NewState)
2023                     ; 690 {
2024                     .text:	section	.text,new
2025  0000               _ADC_SchmittTriggerConfig:
2027  0000 89            	pushw	x
2028  0001 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 691   uint8_t regindex = 0;
2034                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2036                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2038  0002 7b06          	ld	a,(OFST+5,sp)
2039  0004 6b01          	ld	(OFST+0,sp),a
2040                     ; 697   if (NewState != DISABLE)
2042  0006 0d08          	tnz	(OFST+7,sp)
2043  0008 270e          	jreq	L3111
2044                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2046  000a 01            	rrwa	x,a
2047  000b 1b01          	add	a,(OFST+0,sp)
2048  000d 2401          	jrnc	L24
2049  000f 5c            	incw	x
2050  0010               L24:
2051  0010 02            	rlwa	x,a
2052  0011 7b07          	ld	a,(OFST+6,sp)
2053  0013 43            	cpl	a
2054  0014 e40e          	and	a,(14,x)
2056  0016 200f          	jra	L5111
2057  0018               L3111:
2058                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2060  0018 7b02          	ld	a,(OFST+1,sp)
2061  001a 97            	ld	xl,a
2062  001b 7b03          	ld	a,(OFST+2,sp)
2063  001d 1b01          	add	a,(OFST+0,sp)
2064  001f 2401          	jrnc	L44
2065  0021 5c            	incw	x
2066  0022               L44:
2067  0022 02            	rlwa	x,a
2068  0023 e60e          	ld	a,(14,x)
2069  0025 1a07          	or	a,(OFST+6,sp)
2070  0027               L5111:
2071  0027 e70e          	ld	(14,x),a
2072                     ; 707 }
2075  0029 5b03          	addw	sp,#3
2076  002b 81            	ret	
2123                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2123                     ; 715 {
2124                     .text:	section	.text,new
2125  0000               _ADC_GetConversionValue:
2127  0000 89            	pushw	x
2128  0001 89            	pushw	x
2129       00000002      OFST:	set	2
2132                     ; 716   uint16_t tmpreg = 0;
2134                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2136  0002 e604          	ld	a,(4,x)
2137  0004 97            	ld	xl,a
2138                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2140  0005 1603          	ldw	y,(OFST+1,sp)
2141  0007 90e605        	ld	a,(5,y)
2142  000a 02            	rlwa	x,a
2143                     ; 723   return (uint16_t)(tmpreg) ;
2147  000b 5b04          	addw	sp,#4
2148  000d 81            	ret	
2195                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2195                     ; 758 {
2196                     .text:	section	.text,new
2197  0000               _ADC_DMACmd:
2199  0000 89            	pushw	x
2200       00000000      OFST:	set	0
2203                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2205                     ; 762   if (NewState != DISABLE)
2207  0001 7b05          	ld	a,(OFST+5,sp)
2208  0003 2706          	jreq	L7611
2209                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2211  0005 e60a          	ld	a,(10,x)
2212  0007 a47f          	and	a,#127
2214  0009 2006          	jra	L1711
2215  000b               L7611:
2216                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2218  000b 1e01          	ldw	x,(OFST+1,sp)
2219  000d e60a          	ld	a,(10,x)
2220  000f aa80          	or	a,#128
2221  0011               L1711:
2222  0011 e70a          	ld	(10,x),a
2223                     ; 772 }
2226  0013 85            	popw	x
2227  0014 81            	ret	
2311                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2311                     ; 829 {
2312                     .text:	section	.text,new
2313  0000               _ADC_ITConfig:
2315  0000 89            	pushw	x
2316       00000000      OFST:	set	0
2319                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2321                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2323                     ; 834   if (NewState != DISABLE)
2325  0001 7b06          	ld	a,(OFST+6,sp)
2326  0003 2705          	jreq	L5321
2327                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2329  0005 f6            	ld	a,(x)
2330  0006 1a05          	or	a,(OFST+5,sp)
2332  0008 2006          	jra	L7321
2333  000a               L5321:
2334                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2336  000a 1e01          	ldw	x,(OFST+1,sp)
2337  000c 7b05          	ld	a,(OFST+5,sp)
2338  000e 43            	cpl	a
2339  000f f4            	and	a,(x)
2340  0010               L7321:
2341  0010 f7            	ld	(x),a
2342                     ; 844 }
2345  0011 85            	popw	x
2346  0012 81            	ret	
2451                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2451                     ; 857 {
2452                     .text:	section	.text,new
2453  0000               _ADC_GetFlagStatus:
2455  0000 89            	pushw	x
2456  0001 88            	push	a
2457       00000001      OFST:	set	1
2460                     ; 858   FlagStatus flagstatus = RESET;
2462                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2464                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2466  0002 e603          	ld	a,(3,x)
2467  0004 1506          	bcp	a,(OFST+5,sp)
2468  0006 2704          	jreq	L3131
2469                     ; 867     flagstatus = SET;
2471  0008 a601          	ld	a,#1
2473  000a 2001          	jra	L5131
2474  000c               L3131:
2475                     ; 872     flagstatus = RESET;
2477  000c 4f            	clr	a
2478  000d               L5131:
2479                     ; 876   return  flagstatus;
2483  000d 5b03          	addw	sp,#3
2484  000f 81            	ret	
2531                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2531                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2531                     ; 891 {
2532                     .text:	section	.text,new
2533  0000               _ADC_ClearFlag:
2535  0000 89            	pushw	x
2536       00000000      OFST:	set	0
2539                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2541                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2543  0001 7b05          	ld	a,(OFST+5,sp)
2544  0003 43            	cpl	a
2545  0004 1e01          	ldw	x,(OFST+1,sp)
2546  0006 e703          	ld	(3,x),a
2547                     ; 897 }
2550  0008 85            	popw	x
2551  0009 81            	ret	
2627                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2627                     ; 910                          ADC_IT_TypeDef ADC_IT)
2627                     ; 911 {
2628                     .text:	section	.text,new
2629  0000               _ADC_GetITStatus:
2631  0000 89            	pushw	x
2632  0001 5203          	subw	sp,#3
2633       00000003      OFST:	set	3
2636                     ; 912   ITStatus itstatus = RESET;
2638                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2642                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2644                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2646  0003 7b08          	ld	a,(OFST+5,sp)
2647  0005 44            	srl	a
2648  0006 44            	srl	a
2649  0007 44            	srl	a
2650  0008 6b03          	ld	(OFST+0,sp),a
2651                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2651                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2653  000a a403          	and	a,#3
2654  000c 6b01          	ld	(OFST-2,sp),a
2655  000e 7b03          	ld	a,(OFST+0,sp)
2656  0010 a410          	and	a,#16
2657  0012 44            	srl	a
2658  0013 44            	srl	a
2659  0014 1a01          	or	a,(OFST-2,sp)
2660  0016 6b03          	ld	(OFST+0,sp),a
2661                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2663  0018 f6            	ld	a,(x)
2664  0019 1408          	and	a,(OFST+5,sp)
2665  001b 6b02          	ld	(OFST-1,sp),a
2666                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2668  001d e603          	ld	a,(3,x)
2669  001f 1503          	bcp	a,(OFST+0,sp)
2670  0021 2708          	jreq	L3041
2672  0023 7b02          	ld	a,(OFST-1,sp)
2673  0025 2704          	jreq	L3041
2674                     ; 930     itstatus = SET;
2676  0027 a601          	ld	a,#1
2678  0029 2001          	jra	L5041
2679  002b               L3041:
2680                     ; 935     itstatus = RESET;
2682  002b 4f            	clr	a
2683  002c               L5041:
2684                     ; 939   return  itstatus;
2688  002c 5b05          	addw	sp,#5
2689  002e 81            	ret	
2746                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2746                     ; 953                            ADC_IT_TypeDef ADC_IT)
2746                     ; 954 {
2747                     .text:	section	.text,new
2748  0000               _ADC_ClearITPendingBit:
2750  0000 89            	pushw	x
2751  0001 89            	pushw	x
2752       00000002      OFST:	set	2
2755                     ; 955   uint8_t itmask = 0;
2757                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2759                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2761  0002 7b07          	ld	a,(OFST+5,sp)
2762  0004 44            	srl	a
2763  0005 44            	srl	a
2764  0006 44            	srl	a
2765  0007 6b02          	ld	(OFST+0,sp),a
2766                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2766                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2768  0009 a403          	and	a,#3
2769  000b 6b01          	ld	(OFST-1,sp),a
2770  000d 7b02          	ld	a,(OFST+0,sp)
2771  000f a410          	and	a,#16
2772  0011 44            	srl	a
2773  0012 44            	srl	a
2774  0013 1a01          	or	a,(OFST-1,sp)
2775  0015 6b02          	ld	(OFST+0,sp),a
2776                     ; 966   ADCx->SR = (uint8_t)~itmask;
2778  0017 43            	cpl	a
2779  0018 1e03          	ldw	x,(OFST+1,sp)
2780  001a e703          	ld	(3,x),a
2781                     ; 967 }
2784  001c 5b04          	addw	sp,#4
2785  001e 81            	ret	
2798                     	xdef	_ADC_ClearITPendingBit
2799                     	xdef	_ADC_GetITStatus
2800                     	xdef	_ADC_ClearFlag
2801                     	xdef	_ADC_GetFlagStatus
2802                     	xdef	_ADC_ITConfig
2803                     	xdef	_ADC_DMACmd
2804                     	xdef	_ADC_GetConversionValue
2805                     	xdef	_ADC_SchmittTriggerConfig
2806                     	xdef	_ADC_SamplingTimeConfig
2807                     	xdef	_ADC_ChannelCmd
2808                     	xdef	_ADC_VrefintCmd
2809                     	xdef	_ADC_TempSensorCmd
2810                     	xdef	_ADC_AnalogWatchdogConfig
2811                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2812                     	xdef	_ADC_AnalogWatchdogChannelSelect
2813                     	xdef	_ADC_ExternalTrigConfig
2814                     	xdef	_ADC_SoftwareStartConv
2815                     	xdef	_ADC_Cmd
2816                     	xdef	_ADC_Init
2817                     	xdef	_ADC_DeInit
2836                     	end
