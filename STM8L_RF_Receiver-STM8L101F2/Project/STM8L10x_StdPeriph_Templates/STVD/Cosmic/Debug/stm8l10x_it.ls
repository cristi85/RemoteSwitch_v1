   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .bit:	section	.data,bit
  22  0000               _FLAG_250ms:
  23  0000 00            	dc.b	0
  24                     	bsct
  25  0000               _cnt_flag_250ms:
  26  0000 0000          	dc.w	0
  27                     	switch	.bit
  28  0001               _FLAG_500ms:
  29  0001 00            	dc.b	0
  30                     	bsct
  31  0002               _cnt_flag_500ms:
  32  0002 0000          	dc.w	0
  33                     	switch	.bit
  34  0002               _FLAG_1000ms:
  35  0002 00            	dc.b	0
  36                     	bsct
  37  0004               _cnt_flag_1000ms:
  38  0004 0000          	dc.w	0
  39  0006               _btn1_0_cnt:
  40  0006 00            	dc.b	0
  41  0007               _btn1_1_cnt:
  42  0007 00            	dc.b	0
  43  0008               _BTN1_DEB_STATE:
  44  0008 00            	dc.b	0
  45                     	switch	.bit
  46  0003               _BTN1_DELAY_FLAG:
  47  0003 00            	dc.b	0
  48                     	bsct
  49  0009               _btn1_delay_cnt:
  50  0009 00            	dc.b	0
  51  000a               _BTN1_press_timer:
  52  000a 0000          	dc.w	0
  53  000c               _cnt_state_redLED:
  54  000c 0000          	dc.w	0
  55  000e               _cnt_state_greenLED:
  56  000e 0000          	dc.w	0
  57  0010               _cnt_blink_redLED:
  58  0010 00            	dc.b	0
  59  0011               _cnt_blink_greenLED:
  60  0011 00            	dc.b	0
  61  0012               _blink_redLED_times:
  62  0012 00            	dc.b	0
  63  0013               _blink_greenLED_times:
  64  0013 00            	dc.b	0
  65                     	switch	.bit
  66  0004               _flag_blink_on_off:
  67  0004 01            	dc.b	1
  68  0005               _flag_blink_redLED:
  69  0005 00            	dc.b	0
  70  0006               _flag_blink_greenLED:
  71  0006 00            	dc.b	0
  72  0007               _flag_blink_unlimited:
  73  0007 01            	dc.b	1
 103                     ; 93 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 103                     ; 94 {
 104                     .text:	section	.text,new
 105  0000               f_NonHandledInterrupt:
 109                     ; 98 }
 112  0000 80            	iret	
 134                     ; 106 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 134                     ; 107 {
 135                     .text:	section	.text,new
 136  0000               f_TRAP_IRQHandler:
 140                     ; 111 }
 143  0000 80            	iret	
 165                     ; 118 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 165                     ; 119 {
 166                     .text:	section	.text,new
 167  0000               f_FLASH_IRQHandler:
 171                     ; 123 }
 174  0000 80            	iret	
 196                     ; 130 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 196                     ; 131 {
 197                     .text:	section	.text,new
 198  0000               f_AWU_IRQHandler:
 202                     ; 135 }
 205  0000 80            	iret	
 227                     ; 142 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 227                     ; 143 {
 228                     .text:	section	.text,new
 229  0000               f_EXTIB_IRQHandler:
 233                     ; 147 }
 236  0000 80            	iret	
 258                     ; 154 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 258                     ; 155 {
 259                     .text:	section	.text,new
 260  0000               f_EXTID_IRQHandler:
 264                     ; 159 }
 267  0000 80            	iret	
 289                     ; 166 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 289                     ; 167 {
 290                     .text:	section	.text,new
 291  0000               f_EXTI0_IRQHandler:
 295                     ; 171 }
 298  0000 80            	iret	
 320                     ; 178 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 320                     ; 179 {
 321                     .text:	section	.text,new
 322  0000               f_EXTI1_IRQHandler:
 326                     ; 183 }
 329  0000 80            	iret	
 351                     ; 190 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 351                     ; 191 {
 352                     .text:	section	.text,new
 353  0000               f_EXTI2_IRQHandler:
 357                     ; 195 }
 360  0000 80            	iret	
 382                     ; 202 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 382                     ; 203 {
 383                     .text:	section	.text,new
 384  0000               f_EXTI3_IRQHandler:
 388                     ; 207 }
 391  0000 80            	iret	
 413                     ; 214 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 413                     ; 215 {
 414                     .text:	section	.text,new
 415  0000               f_EXTI4_IRQHandler:
 419                     ; 219 }
 422  0000 80            	iret	
 444                     ; 226 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 444                     ; 227 {
 445                     .text:	section	.text,new
 446  0000               f_EXTI5_IRQHandler:
 450                     ; 231 }
 453  0000 80            	iret	
 475                     ; 238 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 475                     ; 239 
 475                     ; 240 {
 476                     .text:	section	.text,new
 477  0000               f_EXTI6_IRQHandler:
 481                     ; 244 }
 484  0000 80            	iret	
 506                     ; 251 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 506                     ; 252 {
 507                     .text:	section	.text,new
 508  0000               f_EXTI7_IRQHandler:
 512                     ; 256 }
 515  0000 80            	iret	
 537                     ; 263 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 537                     ; 264 {
 538                     .text:	section	.text,new
 539  0000               f_COMP_IRQHandler:
 543                     ; 268 }
 546  0000 80            	iret	
 600                     ; 275 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 600                     ; 276 {
 601                     .text:	section	.text,new
 602  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 604  0000 8a            	push	cc
 605  0001 84            	pop	a
 606  0002 a4bf          	and	a,#191
 607  0004 88            	push	a
 608  0005 86            	pop	cc
 609  0006 3b0002        	push	c_x+2
 610  0009 be00          	ldw	x,c_x
 611  000b 89            	pushw	x
 612  000c 3b0002        	push	c_y+2
 613  000f be00          	ldw	x,c_y
 614  0011 89            	pushw	x
 617                     ; 280   interrupt_status = 1;
 619  0012 35010000      	mov	L3_interrupt_status,#1
 620                     ; 281   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
 622  0016 a601          	ld	a,#1
 623  0018 cd0000        	call	_TIM2_GetITStatus
 625  001b 4d            	tnz	a
 626  001c 2604ac8a018a  	jreq	L312
 627                     ; 284     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
 629  0022 be00          	ldw	x,_cnt_flag_250ms
 630  0024 a3ffff        	cpw	x,#65535
 631  0027 2403          	jruge	L512
 634  0029 5c            	incw	x
 635  002a bf00          	ldw	_cnt_flag_250ms,x
 636  002c               L512:
 637                     ; 285     if(cnt_flag_250ms >= CNTVAL_250MS) 
 639  002c a300fa        	cpw	x,#250
 640  002f 2507          	jrult	L712
 641                     ; 287       cnt_flag_250ms = 0;
 643  0031 5f            	clrw	x
 644  0032 bf00          	ldw	_cnt_flag_250ms,x
 645                     ; 288       FLAG_250ms = TRUE;
 647  0034 72100000      	bset	_FLAG_250ms
 648  0038               L712:
 649                     ; 290     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
 651  0038 be02          	ldw	x,_cnt_flag_500ms
 652  003a a3ffff        	cpw	x,#65535
 653  003d 2403          	jruge	L122
 656  003f 5c            	incw	x
 657  0040 bf02          	ldw	_cnt_flag_500ms,x
 658  0042               L122:
 659                     ; 291     if(cnt_flag_500ms >= CNTVAL_500MS) 
 661  0042 a301f4        	cpw	x,#500
 662  0045 2507          	jrult	L322
 663                     ; 293       cnt_flag_500ms = 0;
 665  0047 5f            	clrw	x
 666  0048 bf02          	ldw	_cnt_flag_500ms,x
 667                     ; 294       FLAG_500ms = TRUE;
 669  004a 72100001      	bset	_FLAG_500ms
 670  004e               L322:
 671                     ; 296     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
 673  004e be04          	ldw	x,_cnt_flag_1000ms
 674  0050 a3ffff        	cpw	x,#65535
 675  0053 2403          	jruge	L522
 678  0055 5c            	incw	x
 679  0056 bf04          	ldw	_cnt_flag_1000ms,x
 680  0058               L522:
 681                     ; 297     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
 683  0058 a303e8        	cpw	x,#1000
 684  005b 2507          	jrult	L722
 685                     ; 299       cnt_flag_1000ms = 0;
 687  005d 5f            	clrw	x
 688  005e bf04          	ldw	_cnt_flag_1000ms,x
 689                     ; 300       FLAG_1000ms = TRUE;
 691  0060 72100002      	bset	_FLAG_1000ms
 692  0064               L722:
 693                     ; 303     if(!Timeout_istout1)
 695  0064 720000000d    	btjt	_Timeout_istout1,L132
 696                     ; 305       Timeout_toutcnt1++;
 698  0069 be00          	ldw	x,_Timeout_toutcnt1
 699  006b 5c            	incw	x
 700  006c bf00          	ldw	_Timeout_toutcnt1,x
 701                     ; 306       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 703  006e b300          	cpw	x,_Timeout_tout1
 704  0070 2504          	jrult	L132
 707  0072 72100000      	bset	_Timeout_istout1
 708  0076               L132:
 709                     ; 308     if(!Timeout_istout2)
 711  0076 720000000d    	btjt	_Timeout_istout2,L532
 712                     ; 310       Timeout_toutcnt2++;
 714  007b be00          	ldw	x,_Timeout_toutcnt2
 715  007d 5c            	incw	x
 716  007e bf00          	ldw	_Timeout_toutcnt2,x
 717                     ; 311       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
 719  0080 b300          	cpw	x,_Timeout_tout2
 720  0082 2504          	jrult	L532
 723  0084 72100000      	bset	_Timeout_istout2
 724  0088               L532:
 725                     ; 315     if(!BTN1_STATE)
 727  0088 7204500116    	btjt	20481,#2,L142
 728                     ; 317       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
 730  008d b606          	ld	a,_btn1_0_cnt
 731  008f a1ff          	cp	a,#255
 732  0091 2402          	jruge	L342
 735  0093 3c06          	inc	_btn1_0_cnt
 736  0095               L342:
 737                     ; 318       btn1_1_cnt = 0;
 739  0095 3f07          	clr	_btn1_1_cnt
 740                     ; 319       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
 742  0097 b606          	ld	a,_btn1_0_cnt
 743  0099 a11e          	cp	a,#30
 744  009b 2518          	jrult	L742
 745                     ; 321         BTN1_DEB_STATE = BTN_PRESSED;
 747  009d 35010008      	mov	_BTN1_DEB_STATE,#1
 748  00a1 2012          	jra	L742
 749  00a3               L142:
 750                     ; 326       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
 752  00a3 b607          	ld	a,_btn1_1_cnt
 753  00a5 a1ff          	cp	a,#255
 754  00a7 2402          	jruge	L152
 757  00a9 3c07          	inc	_btn1_1_cnt
 758  00ab               L152:
 759                     ; 327       btn1_0_cnt = 0;
 761  00ab 3f06          	clr	_btn1_0_cnt
 762                     ; 328       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
 764  00ad b607          	ld	a,_btn1_1_cnt
 765  00af a11e          	cp	a,#30
 766  00b1 2502          	jrult	L742
 767                     ; 330         BTN1_DEB_STATE = BTN_DEPRESSED;
 769  00b3 3f08          	clr	_BTN1_DEB_STATE
 770  00b5               L742:
 771                     ; 336     if(BTN1_DEB_STATE == BTN_PRESSED)
 773  00b5 b608          	ld	a,_BTN1_DEB_STATE
 774  00b7 4a            	dec	a
 775  00b8 260a          	jrne	L552
 776                     ; 338       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
 778  00ba be0a          	ldw	x,_BTN1_press_timer
 779  00bc a3ffff        	cpw	x,#65535
 780  00bf 2403          	jruge	L552
 783  00c1 5c            	incw	x
 784  00c2 bf0a          	ldw	_BTN1_press_timer,x
 785  00c4               L552:
 786                     ; 341     if(!BTN1_DELAY_FLAG)
 788  00c4 720000030e    	btjt	_BTN1_DELAY_FLAG,L162
 789                     ; 343       btn1_delay_cnt++;
 791  00c9 3c09          	inc	_btn1_delay_cnt
 792                     ; 344       if(btn1_delay_cnt == BTN_DELAY)
 794  00cb b609          	ld	a,_btn1_delay_cnt
 795  00cd a196          	cp	a,#150
 796  00cf 2606          	jrne	L162
 797                     ; 346         btn1_delay_cnt = 0;
 799  00d1 3f09          	clr	_btn1_delay_cnt
 800                     ; 347         BTN1_DELAY_FLAG = TRUE;
 802  00d3 72100003      	bset	_BTN1_DELAY_FLAG
 803  00d7               L162:
 804                     ; 353     if(flag_blink_redLED)
 806  00d7 7201000550    	btjf	_flag_blink_redLED,L562
 807                     ; 355       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
 809  00dc be0c          	ldw	x,_cnt_state_redLED
 810  00de a3ffff        	cpw	x,#65535
 811  00e1 2403          	jruge	L762
 814  00e3 5c            	incw	x
 815  00e4 bf0c          	ldw	_cnt_state_redLED,x
 816  00e6               L762:
 817                     ; 356       if(flag_blink_on_off)
 819  00e6 7201000412    	btjf	_flag_blink_on_off,L172
 820                     ; 358         if(cnt_state_redLED >= LEDBLINK_ONTIME)
 822  00eb a30032        	cpw	x,#50
 823  00ee 253c          	jrult	L562
 824                     ; 360           flag_blink_on_off = FALSE;
 826  00f0 72110004      	bres	_flag_blink_on_off
 827                     ; 361           cnt_state_redLED = 0;
 829  00f4 5f            	clrw	x
 830  00f5 bf0c          	ldw	_cnt_state_redLED,x
 831                     ; 362           LED_OFF;
 833  00f7 7217500a      	bres	20490,#3
 836  00fb 202b          	jpf	LC001
 837  00fd               L172:
 838                     ; 367         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
 840  00fd a300c8        	cpw	x,#200
 841  0100 252a          	jrult	L562
 842                     ; 369           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
 844  0102 b610          	ld	a,_cnt_blink_redLED
 845  0104 a1ff          	cp	a,#255
 846  0106 2402          	jruge	L103
 849  0108 3c10          	inc	_cnt_blink_redLED
 850  010a               L103:
 851                     ; 370           flag_blink_on_off = TRUE;
 853  010a 72100004      	bset	_flag_blink_on_off
 854                     ; 371           cnt_state_redLED = 0;
 856  010e 5f            	clrw	x
 857  010f bf0c          	ldw	_cnt_state_redLED,x
 858                     ; 372           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
 860  0111 b610          	ld	a,_cnt_blink_redLED
 861  0113 b112          	cp	a,_blink_redLED_times
 862  0115 250d          	jrult	L303
 864  0117 7200000708    	btjt	_flag_blink_unlimited,L303
 865                     ; 374             flag_blink_redLED = FALSE;
 867  011c 72110005      	bres	_flag_blink_redLED
 868                     ; 375             cnt_blink_redLED = 0;
 870  0120 3f10          	clr	_cnt_blink_redLED
 872  0122 2008          	jra	L562
 873  0124               L303:
 874                     ; 379             LED_RED_ON;
 876  0124 7216500a      	bset	20490,#3
 879  0128               LC001:
 881  0128 7219500a      	bres	20490,#4
 883  012c               L562:
 884                     ; 384     if(flag_blink_greenLED)
 886  012c 7201000654    	btjf	_flag_blink_greenLED,L703
 887                     ; 386       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
 889  0131 be0e          	ldw	x,_cnt_state_greenLED
 890  0133 a3ffff        	cpw	x,#65535
 891  0136 2403          	jruge	L113
 894  0138 5c            	incw	x
 895  0139 bf0e          	ldw	_cnt_state_greenLED,x
 896  013b               L113:
 897                     ; 387       if(flag_blink_on_off)
 899  013b 7201000416    	btjf	_flag_blink_on_off,L313
 900                     ; 389         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
 902  0140 a30032        	cpw	x,#50
 903  0143 2540          	jrult	L703
 904                     ; 391           flag_blink_on_off = FALSE;
 906  0145 72110004      	bres	_flag_blink_on_off
 907                     ; 392           cnt_state_greenLED = 0;
 909  0149 5f            	clrw	x
 910  014a bf0e          	ldw	_cnt_state_greenLED,x
 911                     ; 393           LED_OFF;
 913  014c 7217500a      	bres	20490,#3
 916  0150 7219500a      	bres	20490,#4
 918  0154 202f          	jra	L703
 919  0156               L313:
 920                     ; 398         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
 922  0156 a300c8        	cpw	x,#200
 923  0159 252a          	jrult	L703
 924                     ; 400           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
 926  015b b611          	ld	a,_cnt_blink_greenLED
 927  015d a1ff          	cp	a,#255
 928  015f 2402          	jruge	L323
 931  0161 3c11          	inc	_cnt_blink_greenLED
 932  0163               L323:
 933                     ; 401           flag_blink_on_off = TRUE;
 935  0163 72100004      	bset	_flag_blink_on_off
 936                     ; 402           cnt_state_greenLED = 0;
 938  0167 5f            	clrw	x
 939  0168 bf0e          	ldw	_cnt_state_greenLED,x
 940                     ; 403           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
 942  016a b611          	ld	a,_cnt_blink_greenLED
 943  016c b113          	cp	a,_blink_greenLED_times
 944  016e 250d          	jrult	L523
 946  0170 7200000708    	btjt	_flag_blink_unlimited,L523
 947                     ; 405             flag_blink_greenLED = FALSE;
 949  0175 72110006      	bres	_flag_blink_greenLED
 950                     ; 406             cnt_blink_greenLED = 0;
 952  0179 3f11          	clr	_cnt_blink_greenLED
 954  017b 2008          	jra	L703
 955  017d               L523:
 956                     ; 410             LED_GREEN_ON;
 958  017d 7217500a      	bres	20490,#3
 961  0181 7218500a      	bset	20490,#4
 963  0185               L703:
 964                     ; 416     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
 966  0185 a601          	ld	a,#1
 967  0187 cd0000        	call	_TIM2_ClearITPendingBit
 969  018a               L312:
 970                     ; 418   interrupt_status = 0;
 972  018a 3f00          	clr	L3_interrupt_status
 973                     ; 419 }
 976  018c 85            	popw	x
 977  018d bf00          	ldw	c_y,x
 978  018f 320002        	pop	c_y+2
 979  0192 85            	popw	x
 980  0193 bf00          	ldw	c_x,x
 981  0195 320002        	pop	c_x+2
 982  0198 80            	iret	
1005                     ; 426 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1005                     ; 427 {
1006                     .text:	section	.text,new
1007  0000               f_TIM2_CAP_IRQHandler:
1011                     ; 431 }
1014  0000 80            	iret	
1037                     ; 439 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1037                     ; 440 {
1038                     .text:	section	.text,new
1039  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1043                     ; 444 }
1046  0000 80            	iret	
1069                     ; 450 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
1069                     ; 451 {
1070                     .text:	section	.text,new
1071  0000               f_TIM3_CAP_IRQHandler:
1075                     ; 455 }
1078  0000 80            	iret	
1101                     ; 461 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1101                     ; 462 {
1102                     .text:	section	.text,new
1103  0000               f_TIM4_UPD_OVF_IRQHandler:
1107                     ; 466 }
1110  0000 80            	iret	
1132                     ; 473 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1132                     ; 474 {
1133                     .text:	section	.text,new
1134  0000               f_SPI_IRQHandler:
1138                     ; 478 }
1141  0000 80            	iret	
1164                     ; 484 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1164                     ; 485 {
1165                     .text:	section	.text,new
1166  0000               f_USART_TX_IRQHandler:
1170                     ; 489 }
1173  0000 80            	iret	
1196                     ; 496 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1196                     ; 497 {
1197                     .text:	section	.text,new
1198  0000               f_USART_RX_IRQHandler:
1202                     ; 501 }
1205  0000 80            	iret	
1227                     ; 509 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1227                     ; 510 {
1228                     .text:	section	.text,new
1229  0000               f_I2C_IRQHandler:
1233                     ; 514 }
1236  0000 80            	iret	
1468                     	xdef	_cnt_blink_greenLED
1469                     	xdef	_cnt_blink_redLED
1470                     	switch	.ubsct
1471  0000               L3_interrupt_status:
1472  0000 00            	ds.b	1
1473                     	xref.b	_Timeout_tout2
1474                     	xref.b	_Timeout_tout1
1475                     	xref.b	_Timeout_toutcnt2
1476                     	xref.b	_Timeout_toutcnt1
1477                     	xbit	_Timeout_istout2
1478                     	xbit	_Timeout_istout1
1479                     	xdef	_btn1_delay_cnt
1480                     	xdef	_btn1_1_cnt
1481                     	xdef	_btn1_0_cnt
1482                     	xdef	_cnt_flag_1000ms
1483                     	xdef	_cnt_flag_500ms
1484                     	xdef	_cnt_flag_250ms
1485                     	xdef	f_I2C_IRQHandler
1486                     	xdef	f_USART_RX_IRQHandler
1487                     	xdef	f_USART_TX_IRQHandler
1488                     	xdef	f_SPI_IRQHandler
1489                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1490                     	xdef	f_TIM3_CAP_IRQHandler
1491                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1492                     	xdef	f_TIM2_CAP_IRQHandler
1493                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1494                     	xdef	f_COMP_IRQHandler
1495                     	xdef	f_EXTI7_IRQHandler
1496                     	xdef	f_EXTI6_IRQHandler
1497                     	xdef	f_EXTI5_IRQHandler
1498                     	xdef	f_EXTI4_IRQHandler
1499                     	xdef	f_EXTI3_IRQHandler
1500                     	xdef	f_EXTI2_IRQHandler
1501                     	xdef	f_EXTI1_IRQHandler
1502                     	xdef	f_EXTI0_IRQHandler
1503                     	xdef	f_EXTID_IRQHandler
1504                     	xdef	f_EXTIB_IRQHandler
1505                     	xdef	f_AWU_IRQHandler
1506                     	xdef	f_FLASH_IRQHandler
1507                     	xdef	f_TRAP_IRQHandler
1508                     	xdef	f_NonHandledInterrupt
1509                     	xdef	_flag_blink_unlimited
1510                     	xdef	_flag_blink_greenLED
1511                     	xdef	_flag_blink_redLED
1512                     	xdef	_flag_blink_on_off
1513                     	xdef	_cnt_state_greenLED
1514                     	xdef	_cnt_state_redLED
1515                     	xdef	_blink_greenLED_times
1516                     	xdef	_blink_redLED_times
1517                     	xdef	_FLAG_1000ms
1518                     	xdef	_FLAG_500ms
1519                     	xdef	_FLAG_250ms
1520                     	xdef	_BTN1_press_timer
1521                     	xdef	_BTN1_DELAY_FLAG
1522                     	xdef	_BTN1_DEB_STATE
1523                     	xref	_TIM2_ClearITPendingBit
1524                     	xref	_TIM2_GetITStatus
1525                     	xref.b	c_x
1526                     	xref.b	c_y
1546                     	end
