   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  49                     ; 92 void WFE_DeInit(void)
  49                     ; 93 {
  51                     .text:	section	.text,new
  52  0000               _WFE_DeInit:
  56                     ; 94   WFE->CR1 = WFE_CRX_RESET_VALUE;
  58  0000 725f50a6      	clr	20646
  59                     ; 95   WFE->CR2 = WFE_CRX_RESET_VALUE;
  61  0004 725f50a7      	clr	20647
  62                     ; 96   WFE->CR3 = WFE_CRX_RESET_VALUE;
  64  0008 725f50a8      	clr	20648
  65                     ; 97   WFE->CR4 = WFE_CRX_RESET_VALUE;
  67  000c 725f50a9      	clr	20649
  68                     ; 98 }
  71  0010 81            	ret	
 395                     ; 138 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 395                     ; 139 {
 396                     .text:	section	.text,new
 397  0000               _WFE_WakeUpSourceEventCmd:
 399  0000 89            	pushw	x
 400  0001 88            	push	a
 401       00000001      OFST:	set	1
 404                     ; 140   uint8_t register_index = 0;
 406                     ; 142   assert_param(IS_WFE_SOURCE(WFE_Source));
 408                     ; 143   assert_param(IS_FUNCTIONAL_STATE(NewState));
 410                     ; 146   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 412  0002 9e            	ld	a,xh
 413  0003 6b01          	ld	(OFST+0,sp),a
 414                     ; 148   if (NewState != DISABLE)
 416  0005 0d06          	tnz	(OFST+5,sp)
 417  0007 2730          	jreq	L502
 418                     ; 150     switch (register_index)
 421                     ; 168       default:
 421                     ; 169         break;
 422  0009 4a            	dec	a
 423  000a 270b          	jreq	L12
 424  000c 4a            	dec	a
 425  000d 270f          	jreq	L32
 426  000f 4a            	dec	a
 427  0010 2716          	jreq	L52
 428  0012 4a            	dec	a
 429  0013 271d          	jreq	L72
 430  0015 2039          	jra	L312
 431  0017               L12:
 432                     ; 152       case 1:
 432                     ; 153         WFE->CR1 |= (uint8_t)WFE_Source;
 434  0017 c650a6        	ld	a,20646
 435  001a 1a03          	or	a,(OFST+2,sp)
 436                     ; 154         break;
 438  001c 202f          	jp	LC001
 439  001e               L32:
 440                     ; 156       case 2:
 440                     ; 157         WFE->CR2 |= (uint8_t)WFE_Source;
 442  001e c650a7        	ld	a,20647
 443  0021 1a03          	or	a,(OFST+2,sp)
 444  0023 c750a7        	ld	20647,a
 445                     ; 158         break;
 447  0026 2028          	jra	L312
 448  0028               L52:
 449                     ; 160       case 3:
 449                     ; 161         WFE->CR3 |= (uint8_t)WFE_Source;
 451  0028 c650a8        	ld	a,20648
 452  002b 1a03          	or	a,(OFST+2,sp)
 453  002d c750a8        	ld	20648,a
 454                     ; 162         break;
 456  0030 201e          	jra	L312
 457  0032               L72:
 458                     ; 164       case 4:
 458                     ; 165         WFE->CR4 |= (uint8_t)WFE_Source;
 460  0032 c650a9        	ld	a,20649
 461  0035 1a03          	or	a,(OFST+2,sp)
 462                     ; 166         break;
 464  0037 2036          	jp	LC002
 465                     ; 168       default:
 465                     ; 169         break;
 468  0039               L502:
 469                     ; 174     switch (register_index)
 472                     ; 192       default:
 472                     ; 193         break;
 473  0039 4a            	dec	a
 474  003a 270b          	jreq	L33
 475  003c 4a            	dec	a
 476  003d 2714          	jreq	L53
 477  003f 4a            	dec	a
 478  0040 271c          	jreq	L73
 479  0042 4a            	dec	a
 480  0043 2724          	jreq	L14
 481  0045 2009          	jra	L312
 482  0047               L33:
 483                     ; 176       case 1:
 483                     ; 177         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 485  0047 7b03          	ld	a,(OFST+2,sp)
 486  0049 43            	cpl	a
 487  004a c450a6        	and	a,20646
 488  004d               LC001:
 489  004d c750a6        	ld	20646,a
 490                     ; 178         break;
 491  0050               L312:
 492                     ; 196 }
 495  0050 5b03          	addw	sp,#3
 496  0052 81            	ret	
 497  0053               L53:
 498                     ; 180       case 2:
 498                     ; 181         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 500  0053 7b03          	ld	a,(OFST+2,sp)
 501  0055 43            	cpl	a
 502  0056 c450a7        	and	a,20647
 503  0059 c750a7        	ld	20647,a
 504                     ; 182         break;
 506  005c 20f2          	jra	L312
 507  005e               L73:
 508                     ; 184       case 3:
 508                     ; 185         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 510  005e 7b03          	ld	a,(OFST+2,sp)
 511  0060 43            	cpl	a
 512  0061 c450a8        	and	a,20648
 513  0064 c750a8        	ld	20648,a
 514                     ; 186         break;
 516  0067 20e7          	jra	L312
 517  0069               L14:
 518                     ; 188       case 4:
 518                     ; 189         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 520  0069 7b03          	ld	a,(OFST+2,sp)
 521  006b 43            	cpl	a
 522  006c c450a9        	and	a,20649
 523  006f               LC002:
 524  006f c750a9        	ld	20649,a
 525                     ; 190         break;
 527  0072 20dc          	jra	L312
 528                     ; 192       default:
 528                     ; 193         break;
 576                     ; 234 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 576                     ; 235 {
 577                     .text:	section	.text,new
 578  0000               _WFE_GetWakeUpSourceEventStatus:
 580  0000 89            	pushw	x
 581  0001 88            	push	a
 582       00000001      OFST:	set	1
 585                     ; 236   FunctionalState status = DISABLE;
 587  0002 0f01          	clr	(OFST+0,sp)
 588                     ; 238   assert_param(IS_WFE_SOURCE(WFE_Source));
 590                     ; 240   switch (WFE_Source)
 593                     ; 323     default:
 593                     ; 324       break;
 594  0004 1d0101        	subw	x,#257
 595  0007 2603cc009c    	jreq	L122
 596  000c 5a            	decw	x
 597  000d 27fa          	jreq	L122
 598  000f 1d0002        	subw	x,#2
 599  0012 27f5          	jreq	L122
 600  0014 1d0004        	subw	x,#4
 601  0017 27f0          	jreq	L122
 602  0019 1d0008        	subw	x,#8
 603  001c 277e          	jreq	L122
 604  001e 1d0010        	subw	x,#16
 605  0021 2779          	jreq	L122
 606  0023 1d0020        	subw	x,#32
 607  0026 2774          	jreq	L122
 608  0028 1d0040        	subw	x,#64
 609  002b 276f          	jreq	L122
 610  002d 1d0081        	subw	x,#129
 611  0030 276f          	jreq	L322
 612  0032 5a            	decw	x
 613  0033 276c          	jreq	L322
 614  0035 1d0002        	subw	x,#2
 615  0038 2767          	jreq	L322
 616  003a 1d0004        	subw	x,#4
 617  003d 2762          	jreq	L322
 618  003f 1d0008        	subw	x,#8
 619  0042 275d          	jreq	L322
 620  0044 1d0010        	subw	x,#16
 621  0047 2758          	jreq	L322
 622  0049 1d0020        	subw	x,#32
 623  004c 2753          	jreq	L322
 624  004e 1d0040        	subw	x,#64
 625  0051 274e          	jreq	L322
 626  0053 1d0081        	subw	x,#129
 627  0056 274e          	jreq	L522
 628  0058 5a            	decw	x
 629  0059 274b          	jreq	L522
 630  005b 1d0002        	subw	x,#2
 631  005e 2746          	jreq	L522
 632  0060 1d0004        	subw	x,#4
 633  0063 2741          	jreq	L522
 634  0065 1d0008        	subw	x,#8
 635  0068 273c          	jreq	L522
 636  006a 1d0010        	subw	x,#16
 637  006d 2737          	jreq	L522
 638  006f 1d0020        	subw	x,#32
 639  0072 2732          	jreq	L522
 640  0074 1d0040        	subw	x,#64
 641  0077 272d          	jreq	L522
 642  0079 1d0081        	subw	x,#129
 643  007c 2735          	jreq	L722
 644  007e 5a            	decw	x
 645  007f 2732          	jreq	L722
 646  0081 1d0002        	subw	x,#2
 647  0084 272d          	jreq	L722
 648  0086 1d0004        	subw	x,#4
 649  0089 2728          	jreq	L722
 650  008b 1d0008        	subw	x,#8
 651  008e 2723          	jreq	L722
 652  0090 1d0010        	subw	x,#16
 653  0093 271e          	jreq	L722
 654  0095 1d0020        	subw	x,#32
 655  0098 2719          	jreq	L722
 656  009a 2020          	jra	L752
 657  009c               L122:
 658                     ; 242     case WFE_Source_TIM2_EV0:
 658                     ; 243     case WFE_Source_TIM2_EV1:
 658                     ; 244     case WFE_Source_TIM1_EV0:
 658                     ; 245     case WFE_Source_TIM1_EV1:
 658                     ; 246     case WFE_Source_EXTI_EV0:
 658                     ; 247     case WFE_Source_EXTI_EV1:
 658                     ; 248     case WFE_Source_EXTI_EV2:
 658                     ; 249     case WFE_Source_EXTI_EV3:
 658                     ; 250 
 658                     ; 251       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 660  009c c650a6        	ld	a,20646
 661                     ; 254         status = ENABLE;
 663  009f 2008          	jp	LC005
 664                     ; 259         status = DISABLE;
 665  00a1               L322:
 666                     ; 263     case WFE_Source_EXTI_EV4:
 666                     ; 264     case WFE_Source_EXTI_EV5:
 666                     ; 265     case WFE_Source_EXTI_EV6:
 666                     ; 266     case WFE_Source_EXTI_EV7:
 666                     ; 267     case WFE_Source_EXTI_EVB_G:
 666                     ; 268     case WFE_Source_EXTI_EVD_H:
 666                     ; 269     case WFE_Source_EXTI_EVE_F:
 666                     ; 270     case WFE_Source_ADC1_COMP_EV:
 666                     ; 271 
 666                     ; 272       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 668  00a1 c650a7        	ld	a,20647
 669                     ; 275         status = ENABLE;
 671  00a4 2003          	jp	LC005
 672                     ; 280         status = DISABLE;
 673  00a6               L522:
 674                     ; 283     case WFE_Source_TIM3_EV0:
 674                     ; 284     case WFE_Source_TIM3_EV1:
 674                     ; 285     case WFE_Source_TIM4_EV:
 674                     ; 286     case WFE_Source_SPI1_EV:
 674                     ; 287     case WFE_Source_I2C1_EV:
 674                     ; 288     case WFE_Source_USART1_EV:
 674                     ; 289     case WFE_Source_DMA1CH01_EV:
 674                     ; 290     case WFE_Source_DMA1CH23_EV:
 674                     ; 291 
 674                     ; 292       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 676  00a6 c650a8        	ld	a,20648
 677  00a9               LC005:
 678  00a9 1503          	bcp	a,(OFST+2,sp)
 679  00ab 270d          	jreq	L572
 680                     ; 295         status = ENABLE;
 682  00ad               LC004:
 686  00ad a601          	ld	a,#1
 687  00af 6b01          	ld	(OFST+0,sp),a
 689  00b1 2009          	jra	L752
 690                     ; 300         status = DISABLE;
 691  00b3               L722:
 692                     ; 304     case WFE_Source_TIM5_EV0:
 692                     ; 305     case WFE_Source_TIM5_EV1:
 692                     ; 306     case WFE_Source_AES_EV:
 692                     ; 307     case WFE_Source_SPI2_EV:
 692                     ; 308     case WFE_Source_USART2_EV:
 692                     ; 309     case WFE_Source_USART3_EV:
 692                     ; 310     case WFE_Source_RTC_CSS_EV:
 692                     ; 311 
 692                     ; 312       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 694  00b3 c650a9        	ld	a,20649
 695  00b6 1503          	bcp	a,(OFST+2,sp)
 696                     ; 315         status = ENABLE;
 698  00b8 26f3          	jrne	LC004
 699  00ba               L572:
 700                     ; 320         status = DISABLE;
 705  00ba 0f01          	clr	(OFST+0,sp)
 706                     ; 323     default:
 706                     ; 324       break;
 708  00bc               L752:
 709                     ; 326   return status;
 711  00bc 7b01          	ld	a,(OFST+0,sp)
 714  00be 5b03          	addw	sp,#3
 715  00c0 81            	ret	
 728                     	xdef	_WFE_GetWakeUpSourceEventStatus
 729                     	xdef	_WFE_WakeUpSourceEventCmd
 730                     	xdef	_WFE_DeInit
 749                     	end
