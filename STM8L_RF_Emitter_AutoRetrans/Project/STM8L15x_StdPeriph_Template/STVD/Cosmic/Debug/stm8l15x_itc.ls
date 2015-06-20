   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  50                     ; 53 uint8_t ITC_GetCPUCC(void)
  50                     ; 54 {
  52                     .text:	section	.text,new
  53  0000               _ITC_GetCPUCC:
  57                     ; 56   _asm("push cc");
  60  0000 8a            	push	cc
  62                     ; 57   _asm("pop a");
  65  0001 84            	pop	a
  67                     ; 58   return; /* Ignore compiler warning, the returned value is in A register */
  70  0002 81            	ret	
  93                     ; 84 void ITC_DeInit(void)
  93                     ; 85 {
  94                     .text:	section	.text,new
  95  0000               _ITC_DeInit:
  99                     ; 86   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 101  0000 35ff7f70      	mov	32624,#255
 102                     ; 87   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 104  0004 35ff7f71      	mov	32625,#255
 105                     ; 88   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 107  0008 35ff7f72      	mov	32626,#255
 108                     ; 89   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 110  000c 35ff7f73      	mov	32627,#255
 111                     ; 90   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 113  0010 35ff7f74      	mov	32628,#255
 114                     ; 91   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 116  0014 35ff7f75      	mov	32629,#255
 117                     ; 92   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 119  0018 35ff7f76      	mov	32630,#255
 120                     ; 93   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 122  001c 35ff7f77      	mov	32631,#255
 123                     ; 94 }
 126  0020 81            	ret	
 151                     ; 101 uint8_t ITC_GetSoftIntStatus(void)
 151                     ; 102 {
 152                     .text:	section	.text,new
 153  0000               _ITC_GetSoftIntStatus:
 157                     ; 103   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 159  0000 cd0000        	call	_ITC_GetCPUCC
 161  0003 a428          	and	a,#40
 164  0005 81            	ret	
 450                     .const:	section	.text
 451  0000               L42:
 452  0000 0022          	dc.w	L14
 453  0002 0022          	dc.w	L14
 454  0004 0022          	dc.w	L14
 455  0006 0027          	dc.w	L34
 456  0008 0027          	dc.w	L34
 457  000a 0027          	dc.w	L34
 458  000c 0027          	dc.w	L34
 459  000e 002c          	dc.w	L54
 460  0010 002c          	dc.w	L54
 461  0012 002c          	dc.w	L54
 462  0014 002c          	dc.w	L54
 463  0016 0031          	dc.w	L74
 464  0018 0031          	dc.w	L74
 465  001a 0031          	dc.w	L74
 466  001c 0031          	dc.w	L74
 467  001e 004c          	dc.w	L712
 468  0020 0036          	dc.w	L15
 469  0022 0036          	dc.w	L15
 470  0024 0036          	dc.w	L15
 471  0026 003b          	dc.w	L35
 472  0028 003b          	dc.w	L35
 473  002a 003b          	dc.w	L35
 474  002c 004c          	dc.w	L712
 475  002e 004c          	dc.w	L712
 476  0030 0040          	dc.w	L55
 477  0032 0040          	dc.w	L55
 478  0034 0040          	dc.w	L55
 479  0036 0045          	dc.w	L75
 480  0038 0045          	dc.w	L75
 481                     ; 111 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 481                     ; 112 {
 482                     .text:	section	.text,new
 483  0000               _ITC_GetSoftwarePriority:
 485  0000 88            	push	a
 486  0001 89            	pushw	x
 487       00000002      OFST:	set	2
 490                     ; 113   uint8_t Value = 0;
 492  0002 0f02          	clr	(OFST+0,sp)
 493                     ; 114   uint8_t Mask = 0;
 495                     ; 117   assert_param(IS_ITC_IRQ(IRQn));
 497                     ; 120   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 499  0004 a403          	and	a,#3
 500  0006 48            	sll	a
 501  0007 5f            	clrw	x
 502  0008 97            	ld	xl,a
 503  0009 a603          	ld	a,#3
 504  000b 5d            	tnzw	x
 505  000c 2704          	jreq	L61
 506  000e               L02:
 507  000e 48            	sll	a
 508  000f 5a            	decw	x
 509  0010 26fc          	jrne	L02
 510  0012               L61:
 511  0012 6b01          	ld	(OFST-1,sp),a
 512                     ; 122   switch (IRQn)
 514  0014 7b03          	ld	a,(OFST+1,sp)
 516                     ; 220     default:
 516                     ; 221       break;
 517  0016 4a            	dec	a
 518  0017 a11d          	cp	a,#29
 519  0019 2431          	jruge	L712
 520  001b 5f            	clrw	x
 521  001c 97            	ld	xl,a
 522  001d 58            	sllw	x
 523  001e de0000        	ldw	x,(L42,x)
 524  0021 fc            	jp	(x)
 525  0022               L14:
 526                     ; 124     case FLASH_IRQn:
 526                     ; 125     case DMA1_CHANNEL0_1_IRQn:
 526                     ; 126     case DMA1_CHANNEL2_3_IRQn:
 526                     ; 127       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 528  0022 c67f70        	ld	a,32624
 529                     ; 128       break;
 531  0025 2021          	jp	LC001
 532  0027               L34:
 533                     ; 130     case EXTIE_F_PVD_IRQn:
 533                     ; 131 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 533                     ; 132     case RTC_IRQn:
 533                     ; 133     case EXTIB_IRQn:
 533                     ; 134     case EXTID_IRQn:
 533                     ; 135 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 533                     ; 136     case RTC_CSSLSE_IRQn:
 533                     ; 137     case EXTIB_IRQn:
 533                     ; 138     case EXTID_IRQn:
 533                     ; 139 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 533                     ; 140     case RTC_CSSLSE_IRQn:
 533                     ; 141     case EXTIB_G_IRQn:
 533                     ; 142     case EXTID_H_IRQn:
 533                     ; 143 #endif  /* STM8L15X_MD */
 533                     ; 144       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 535  0027 c67f71        	ld	a,32625
 536                     ; 145       break;
 538  002a 201c          	jp	LC001
 539  002c               L54:
 540                     ; 147     case EXTI0_IRQn:
 540                     ; 148     case EXTI1_IRQn:
 540                     ; 149     case EXTI2_IRQn:
 540                     ; 150     case EXTI3_IRQn:
 540                     ; 151       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 542  002c c67f72        	ld	a,32626
 543                     ; 152       break;
 545  002f 2017          	jp	LC001
 546  0031               L74:
 547                     ; 154     case EXTI4_IRQn:
 547                     ; 155     case EXTI5_IRQn:
 547                     ; 156     case EXTI6_IRQn:
 547                     ; 157     case EXTI7_IRQn:
 547                     ; 158       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 549  0031 c67f73        	ld	a,32627
 550                     ; 159       break;
 552  0034 2012          	jp	LC001
 553  0036               L15:
 554                     ; 162     case SWITCH_CSS_IRQn:
 554                     ; 163 #else
 554                     ; 164     case SWITCH_CSS_BREAK_DAC_IRQn:
 554                     ; 165 #endif /* STM8L15X_LD */		
 554                     ; 166     case ADC1_COMP_IRQn:
 554                     ; 167 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 554                     ; 168     case LCD_IRQn:
 554                     ; 169     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 554                     ; 170 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 554                     ; 171     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 554                     ; 172 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 554                     ; 173     case LCD_AES_IRQn:
 554                     ; 174     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 554                     ; 175 #endif  /* STM8L15X_MD */
 554                     ; 176       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 556  0036 c67f74        	ld	a,32628
 557                     ; 177       break;
 559  0039 200d          	jp	LC001
 560  003b               L35:
 561                     ; 184     case TIM2_CC_IRQn:
 561                     ; 185     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 561                     ; 186     case TIM3_CC_IRQn:
 561                     ; 187 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 561                     ; 188     case TIM2_CC_USART2_RX_IRQn:
 561                     ; 189     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 561                     ; 190     case TIM3_CC_USART3_RX_IRQn:
 561                     ; 191 #endif  /* STM8L15X_MD */
 561                     ; 192       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 563  003b c67f75        	ld	a,32629
 564                     ; 193       break;
 566  003e 2008          	jp	LC001
 567  0040               L55:
 568                     ; 198     case TIM4_UPD_OVF_TRG_IRQn:
 568                     ; 199     case SPI1_IRQn:
 568                     ; 200 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 568                     ; 201  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 568                     ; 202     case USART1_TX_IRQn:
 568                     ; 203 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 568                     ; 204     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 568                     ; 205 #endif  /* STM8L15X_MD || STM8L15X_LD */
 568                     ; 206       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 570  0040 c67f76        	ld	a,32630
 571                     ; 207       break;
 573  0043 2003          	jp	LC001
 574  0045               L75:
 575                     ; 211     case USART1_RX_IRQn:
 575                     ; 212     case I2C1_IRQn:
 575                     ; 213 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 575                     ; 214     case USART1_RX_TIM5_CC_IRQn:
 575                     ; 215     case I2C1_SPI2_IRQn:
 575                     ; 216 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 575                     ; 217       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 577  0045 c67f77        	ld	a,32631
 578  0048               LC001:
 579  0048 1401          	and	a,(OFST-1,sp)
 580  004a 6b02          	ld	(OFST+0,sp),a
 581                     ; 218       break;
 583                     ; 220     default:
 583                     ; 221       break;
 585  004c               L712:
 586                     ; 224   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 588  004c 7b03          	ld	a,(OFST+1,sp)
 589  004e a403          	and	a,#3
 590  0050 48            	sll	a
 591  0051 5f            	clrw	x
 592  0052 97            	ld	xl,a
 593  0053 7b02          	ld	a,(OFST+0,sp)
 594  0055 5d            	tnzw	x
 595  0056 2704          	jreq	L62
 596  0058               L03:
 597  0058 44            	srl	a
 598  0059 5a            	decw	x
 599  005a 26fc          	jrne	L03
 600  005c               L62:
 601                     ; 226   return((ITC_PriorityLevel_TypeDef)Value);
 605  005c 5b03          	addw	sp,#3
 606  005e 81            	ret	
 670                     	switch	.const
 671  003a               L64:
 672  003a 0037          	dc.w	L122
 673  003c 0037          	dc.w	L122
 674  003e 0037          	dc.w	L122
 675  0040 0049          	dc.w	L322
 676  0042 0049          	dc.w	L322
 677  0044 0049          	dc.w	L322
 678  0046 0049          	dc.w	L322
 679  0048 005b          	dc.w	L522
 680  004a 005b          	dc.w	L522
 681  004c 005b          	dc.w	L522
 682  004e 005b          	dc.w	L522
 683  0050 006d          	dc.w	L722
 684  0052 006d          	dc.w	L722
 685  0054 006d          	dc.w	L722
 686  0056 006d          	dc.w	L722
 687  0058 00c5          	dc.w	L772
 688  005a 007f          	dc.w	L132
 689  005c 007f          	dc.w	L132
 690  005e 007f          	dc.w	L132
 691  0060 0091          	dc.w	L332
 692  0062 0091          	dc.w	L332
 693  0064 0091          	dc.w	L332
 694  0066 00c5          	dc.w	L772
 695  0068 00c5          	dc.w	L772
 696  006a 00a3          	dc.w	L532
 697  006c 00a3          	dc.w	L532
 698  006e 00a3          	dc.w	L532
 699  0070 00b5          	dc.w	L732
 700  0072 00b5          	dc.w	L732
 701                     ; 247 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 701                     ; 248 {
 702                     .text:	section	.text,new
 703  0000               _ITC_SetSoftwarePriority:
 705  0000 89            	pushw	x
 706  0001 89            	pushw	x
 707       00000002      OFST:	set	2
 710                     ; 249   uint8_t Mask = 0;
 712                     ; 250   uint8_t NewPriority = 0;
 714                     ; 253   assert_param(IS_ITC_IRQ(IRQn));
 716                     ; 254   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 718                     ; 257   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 720                     ; 261   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 722  0002 9e            	ld	a,xh
 723  0003 a403          	and	a,#3
 724  0005 48            	sll	a
 725  0006 5f            	clrw	x
 726  0007 97            	ld	xl,a
 727  0008 a603          	ld	a,#3
 728  000a 5d            	tnzw	x
 729  000b 2704          	jreq	L43
 730  000d               L63:
 731  000d 48            	sll	a
 732  000e 5a            	decw	x
 733  000f 26fc          	jrne	L63
 734  0011               L43:
 735  0011 43            	cpl	a
 736  0012 6b01          	ld	(OFST-1,sp),a
 737                     ; 263   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 739  0014 7b03          	ld	a,(OFST+1,sp)
 740  0016 a403          	and	a,#3
 741  0018 48            	sll	a
 742  0019 5f            	clrw	x
 743  001a 97            	ld	xl,a
 744  001b 7b04          	ld	a,(OFST+2,sp)
 745  001d 5d            	tnzw	x
 746  001e 2704          	jreq	L04
 747  0020               L24:
 748  0020 48            	sll	a
 749  0021 5a            	decw	x
 750  0022 26fc          	jrne	L24
 751  0024               L04:
 752  0024 6b02          	ld	(OFST+0,sp),a
 753                     ; 265   switch (IRQn)
 755  0026 7b03          	ld	a,(OFST+1,sp)
 757                     ; 369     default:
 757                     ; 370       break;
 758  0028 4a            	dec	a
 759  0029 a11d          	cp	a,#29
 760  002b 2503cc00c5    	jruge	L772
 761  0030 5f            	clrw	x
 762  0031 97            	ld	xl,a
 763  0032 58            	sllw	x
 764  0033 de003a        	ldw	x,(L64,x)
 765  0036 fc            	jp	(x)
 766  0037               L122:
 767                     ; 267     case FLASH_IRQn:
 767                     ; 268     case DMA1_CHANNEL0_1_IRQn:
 767                     ; 269     case DMA1_CHANNEL2_3_IRQn:
 767                     ; 270       ITC->ISPR1 &= Mask;
 769  0037 c67f70        	ld	a,32624
 770  003a 1401          	and	a,(OFST-1,sp)
 771  003c c77f70        	ld	32624,a
 772                     ; 271       ITC->ISPR1 |= NewPriority;
 774  003f c67f70        	ld	a,32624
 775  0042 1a02          	or	a,(OFST+0,sp)
 776  0044 c77f70        	ld	32624,a
 777                     ; 272       break;
 779  0047 207c          	jra	L772
 780  0049               L322:
 781                     ; 274     case EXTIE_F_PVD_IRQn:
 781                     ; 275 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 781                     ; 276     case RTC_IRQn:
 781                     ; 277     case EXTIB_IRQn:
 781                     ; 278     case EXTID_IRQn:
 781                     ; 279 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 781                     ; 280     case RTC_CSSLSE_IRQn:
 781                     ; 281     case EXTIB_IRQn:
 781                     ; 282     case EXTID_IRQn:
 781                     ; 283 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 781                     ; 284     case RTC_CSSLSE_IRQn:
 781                     ; 285     case EXTIB_G_IRQn:
 781                     ; 286     case EXTID_H_IRQn:
 781                     ; 287 #endif  /* STM8L15X_MD */
 781                     ; 288       ITC->ISPR2 &= Mask;
 783  0049 c67f71        	ld	a,32625
 784  004c 1401          	and	a,(OFST-1,sp)
 785  004e c77f71        	ld	32625,a
 786                     ; 289       ITC->ISPR2 |= NewPriority;
 788  0051 c67f71        	ld	a,32625
 789  0054 1a02          	or	a,(OFST+0,sp)
 790  0056 c77f71        	ld	32625,a
 791                     ; 290       break;
 793  0059 206a          	jra	L772
 794  005b               L522:
 795                     ; 292     case EXTI0_IRQn:
 795                     ; 293     case EXTI1_IRQn:
 795                     ; 294     case EXTI2_IRQn:
 795                     ; 295     case EXTI3_IRQn:
 795                     ; 296       ITC->ISPR3 &= Mask;
 797  005b c67f72        	ld	a,32626
 798  005e 1401          	and	a,(OFST-1,sp)
 799  0060 c77f72        	ld	32626,a
 800                     ; 297       ITC->ISPR3 |= NewPriority;
 802  0063 c67f72        	ld	a,32626
 803  0066 1a02          	or	a,(OFST+0,sp)
 804  0068 c77f72        	ld	32626,a
 805                     ; 298       break;
 807  006b 2058          	jra	L772
 808  006d               L722:
 809                     ; 300     case EXTI4_IRQn:
 809                     ; 301     case EXTI5_IRQn:
 809                     ; 302     case EXTI6_IRQn:
 809                     ; 303     case EXTI7_IRQn:
 809                     ; 304       ITC->ISPR4 &= Mask;
 811  006d c67f73        	ld	a,32627
 812  0070 1401          	and	a,(OFST-1,sp)
 813  0072 c77f73        	ld	32627,a
 814                     ; 305       ITC->ISPR4 |= NewPriority;
 816  0075 c67f73        	ld	a,32627
 817  0078 1a02          	or	a,(OFST+0,sp)
 818  007a c77f73        	ld	32627,a
 819                     ; 306       break;
 821  007d 2046          	jra	L772
 822  007f               L132:
 823                     ; 310     case SWITCH_CSS_IRQn:
 823                     ; 311 #endif /*	STM8L15X_LD	*/
 823                     ; 312     case ADC1_COMP_IRQn:
 823                     ; 313 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 823                     ; 314     case LCD_IRQn:
 823                     ; 315     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 823                     ; 316 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 823                     ; 317     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 823                     ; 318 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 823                     ; 319     case LCD_AES_IRQn:
 823                     ; 320     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 823                     ; 321 #endif  /* STM8L15X_MD */
 823                     ; 322       ITC->ISPR5 &= Mask;
 825  007f c67f74        	ld	a,32628
 826  0082 1401          	and	a,(OFST-1,sp)
 827  0084 c77f74        	ld	32628,a
 828                     ; 323       ITC->ISPR5 |= NewPriority;
 830  0087 c67f74        	ld	a,32628
 831  008a 1a02          	or	a,(OFST+0,sp)
 832  008c c77f74        	ld	32628,a
 833                     ; 324       break;
 835  008f 2034          	jra	L772
 836  0091               L332:
 837                     ; 330     case TIM2_CC_IRQn:
 837                     ; 331     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 837                     ; 332     case TIM3_CC_IRQn:
 837                     ; 333 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 837                     ; 334     case TIM2_CC_USART2_RX_IRQn:
 837                     ; 335     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 837                     ; 336     case TIM3_CC_USART3_RX_IRQn:
 837                     ; 337 #endif  /* STM8L15X_MD */
 837                     ; 338       ITC->ISPR6 &= Mask;
 839  0091 c67f75        	ld	a,32629
 840  0094 1401          	and	a,(OFST-1,sp)
 841  0096 c77f75        	ld	32629,a
 842                     ; 339       ITC->ISPR6 |= NewPriority;
 844  0099 c67f75        	ld	a,32629
 845  009c 1a02          	or	a,(OFST+0,sp)
 846  009e c77f75        	ld	32629,a
 847                     ; 340       break;
 849  00a1 2022          	jra	L772
 850  00a3               L532:
 851                     ; 345     case TIM4_UPD_OVF_TRG_IRQn:
 851                     ; 346     case SPI1_IRQn:
 851                     ; 347 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 851                     ; 348  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 851                     ; 349     case USART1_TX_IRQn:
 851                     ; 350 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 851                     ; 351     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 851                     ; 352 #endif  /* STM8L15X_MD */
 851                     ; 353       ITC->ISPR7 &= Mask;
 853  00a3 c67f76        	ld	a,32630
 854  00a6 1401          	and	a,(OFST-1,sp)
 855  00a8 c77f76        	ld	32630,a
 856                     ; 354       ITC->ISPR7 |= NewPriority;
 858  00ab c67f76        	ld	a,32630
 859  00ae 1a02          	or	a,(OFST+0,sp)
 860  00b0 c77f76        	ld	32630,a
 861                     ; 355       break;
 863  00b3 2010          	jra	L772
 864  00b5               L732:
 865                     ; 359     case USART1_RX_IRQn:
 865                     ; 360     case I2C1_IRQn:
 865                     ; 361 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 865                     ; 362     case USART1_RX_TIM5_CC_IRQn:
 865                     ; 363     case I2C1_SPI2_IRQn:
 865                     ; 364 #endif  /* STM8L15X_MD */
 865                     ; 365       ITC->ISPR8 &= Mask;
 867  00b5 c67f77        	ld	a,32631
 868  00b8 1401          	and	a,(OFST-1,sp)
 869  00ba c77f77        	ld	32631,a
 870                     ; 366       ITC->ISPR8 |= NewPriority;
 872  00bd c67f77        	ld	a,32631
 873  00c0 1a02          	or	a,(OFST+0,sp)
 874  00c2 c77f77        	ld	32631,a
 875                     ; 367       break;
 877                     ; 369     default:
 877                     ; 370       break;
 879  00c5               L772:
 880                     ; 372 }
 883  00c5 5b04          	addw	sp,#4
 884  00c7 81            	ret	
 897                     	xdef	_ITC_GetSoftwarePriority
 898                     	xdef	_ITC_SetSoftwarePriority
 899                     	xdef	_ITC_GetSoftIntStatus
 900                     	xdef	_ITC_GetCPUCC
 901                     	xdef	_ITC_DeInit
 920                     	end
