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
  53  000c               _debug:
  54  000c 00            	dc.b	0
  55  000d               _cnt_state_redLED:
  56  000d 0000          	dc.w	0
  57  000f               _cnt_state_greenLED:
  58  000f 0000          	dc.w	0
  59  0011               _cnt_blink_redLED:
  60  0011 00            	dc.b	0
  61  0012               _cnt_blink_greenLED:
  62  0012 00            	dc.b	0
  63  0013               _blink_redLED_times:
  64  0013 00            	dc.b	0
  65  0014               _blink_greenLED_times:
  66  0014 00            	dc.b	0
  67                     	switch	.bit
  68  0004               _flag_blink_on_off:
  69  0004 01            	dc.b	1
  70  0005               _flag_blink_redLED:
  71  0005 00            	dc.b	0
  72  0006               _flag_blink_greenLED:
  73  0006 00            	dc.b	0
  74  0007               _flag_blink_unlimited:
  75  0007 01            	dc.b	1
  76                     	bsct
  77  0015               L11_FLAG_rise_edge:
  78  0015 00            	dc.b	0
  79  0016               L31_FLAG_fall_edge:
  80  0016 00            	dc.b	0
  81  0017               L51_FLAG_CC_Error:
  82  0017 00            	dc.b	0
  83  0018               L71_rf_bittime:
  84  0018 0000          	dc.w	0
  85  001a               L12_rf_halfbittime:
  86  001a 0000          	dc.w	0
  87  001c               L32_rf_low_time:
  88  001c 0000          	dc.w	0
  89  001e               L52_rf_high_time:
  90  001e 0000          	dc.w	0
  91  0020               L72_rf_offset:
  92  0020 0000          	dc.w	0
  93  0022               _idx:
  94  0022 00            	dc.b	0
  95  0023               _RFbytesReady:
  96  0023 00            	dc.b	0
  97  0024               L33_RFrcvTimeoutcnt:
  98  0024 00            	dc.b	0
  99  0025               L53_RF_bits:
 100  0025 00            	dc.b	0
 101  0026               L73_RF_bytes:
 102  0026 00            	dc.b	0
 103  0027               L14_RF_data:
 104  0027 00            	dc.b	0
 105  0028               L54_idx_temp2:
 106  0028 00            	dc.b	0
 107                     	switch	.bit
 108  0008               L74_flag_RF_StartRec:
 109  0008 01            	dc.b	1
 110                     	bsct
 111  0029               L15_RF_rcvState:
 112  0029 00            	dc.b	0
 113                     	switch	.bit
 114  0009               _FLAG_UART_cmd_rcv:
 115  0009 00            	dc.b	0
 145                     ; 132 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 145                     ; 133 {
 146                     .text:	section	.text,new
 147  0000               f_NonHandledInterrupt:
 151                     ; 137 }
 154  0000 80            	iret	
 177                     ; 145 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 177                     ; 146 {
 178                     .text:	section	.text,new
 179  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 183                     ; 150 }
 186  0000 80            	iret	
 255                     ; 156 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 255                     ; 157 {
 256                     .text:	section	.text,new
 257  0000               f_TIM3_CAP_IRQHandler:
 259  0000 8a            	push	cc
 260  0001 84            	pop	a
 261  0002 a4bf          	and	a,#191
 262  0004 88            	push	a
 263  0005 86            	pop	cc
 264       00000001      OFST:	set	1
 265  0006 3b0002        	push	c_x+2
 266  0009 be00          	ldw	x,c_x
 267  000b 89            	pushw	x
 268  000c 3b0002        	push	c_y+2
 269  000f be00          	ldw	x,c_y
 270  0011 89            	pushw	x
 271  0012 88            	push	a
 274                     ; 165   if(TIM3_GetITStatus(TIM3_IT_CC1) == SET) {
 276  0013 a602          	ld	a,#2
 277  0015 cd0000        	call	_TIM3_GetITStatus
 279  0018 4a            	dec	a
 280  0019 260b          	jrne	L131
 281                     ; 166     cap_rise = TIM3_GetCapture1();
 283  001b cd0000        	call	_TIM3_GetCapture1
 285  001e bf99          	ldw	L5_cap_rise,x
 286                     ; 167     FLAG_rise_edge = TRUE;
 288  0020 35010015      	mov	L11_FLAG_rise_edge,#1
 290  0024 2002          	jra	L331
 291  0026               L131:
 292                     ; 169   else FLAG_rise_edge = FALSE;
 294  0026 3f15          	clr	L11_FLAG_rise_edge
 295  0028               L331:
 296                     ; 170   if(TIM3_GetITStatus(TIM3_IT_CC2) == SET) {
 298  0028 a604          	ld	a,#4
 299  002a cd0000        	call	_TIM3_GetITStatus
 301  002d 4a            	dec	a
 302  002e 260b          	jrne	L531
 303                     ; 171     cap_fall = TIM3_GetCapture2();
 305  0030 cd0000        	call	_TIM3_GetCapture2
 307  0033 bf97          	ldw	L7_cap_fall,x
 308                     ; 172     FLAG_fall_edge = TRUE;
 310  0035 35010016      	mov	L31_FLAG_fall_edge,#1
 312  0039 2002          	jra	L731
 313  003b               L531:
 314                     ; 174   else FLAG_fall_edge = FALSE;
 316  003b 3f16          	clr	L31_FLAG_fall_edge
 317  003d               L731:
 318                     ; 175   if(FLAG_rise_edge && FLAG_fall_edge) {
 320  003d b615          	ld	a,L11_FLAG_rise_edge
 321  003f 2708          	jreq	L141
 323  0041 b616          	ld	a,L31_FLAG_fall_edge
 324  0043 2704          	jreq	L141
 325                     ; 176     FLAG_CC_Error = TRUE;
 327  0045 35010017      	mov	L51_FLAG_CC_Error,#1
 328  0049               L141:
 329                     ; 179   if(idx < 75)
 331  0049 b622          	ld	a,_idx
 332  004b a14b          	cp	a,#75
 333  004d 2429          	jruge	L341
 334                     ; 181     if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
 336  004f b615          	ld	a,L11_FLAG_rise_edge
 337  0051 2715          	jreq	L541
 340  0053 be99          	ldw	x,L5_cap_rise
 341  0055 72b00097      	subw	x,L7_cap_fall
 342  0059 b622          	ld	a,_idx
 343  005b 3c22          	inc	_idx
 344  005d 905f          	clrw	y
 345  005f 9097          	ld	yl,a
 346  0061 9058          	sllw	y
 347  0063 90ef01        	ldw	(_rcv_buff,y),x
 349  0066 2010          	jra	L341
 350  0068               L541:
 351                     ; 182     else if(FLAG_fall_edge) rcv_buff[idx++] = cap_fall;
 353  0068 b616          	ld	a,L31_FLAG_fall_edge
 354  006a 270c          	jreq	L341
 357  006c b622          	ld	a,_idx
 358  006e 3c22          	inc	_idx
 359  0070 5f            	clrw	x
 360  0071 97            	ld	xl,a
 361  0072 58            	sllw	x
 362  0073 90be97        	ldw	y,L7_cap_fall
 363  0076 ef01          	ldw	(_rcv_buff,x),y
 364  0078               L341:
 365                     ; 184   RFrcvTimeoutcnt = 0;
 367  0078 3f24          	clr	L33_RFrcvTimeoutcnt
 368                     ; 185   switch(RF_rcvState)
 370  007a b629          	ld	a,L15_RF_rcvState
 372                     ; 328     default: break;
 373  007c 2707          	jreq	L101
 374  007e 4a            	dec	a
 375  007f 2727          	jreq	L301
 376  0081 acb901b9      	jra	L551
 377  0085               L101:
 378                     ; 189       if(FLAG_fall_edge)
 380  0085 3d16          	tnz	L31_FLAG_fall_edge
 381  0087 27f8          	jreq	L551
 382                     ; 191         if(cap_fall >= 500 - RF_EDGES_JITTER && cap_fall <= 500 + RF_EDGES_JITTER)
 384  0089 be97          	ldw	x,L7_cap_fall
 385  008b a301c2        	cpw	x,#450
 386  008e 25f1          	jrult	L551
 388  0090 a30227        	cpw	x,#551
 389  0093 24ec          	jruge	L551
 390                     ; 193           rf_bittime = cap_fall;
 392  0095 bf18          	ldw	L71_rf_bittime,x
 393                     ; 194           rf_halfbittime = rf_bittime >> 1;
 395  0097 54            	srlw	x
 396  0098 bf1a          	ldw	L12_rf_halfbittime,x
 397                     ; 195           RF_bits = 0;
 399  009a b725          	ld	L53_RF_bits,a
 400                     ; 196           RF_bytes = 0;
 402  009c b726          	ld	L73_RF_bytes,a
 403                     ; 197           RF_data = 0;
 405  009e b727          	ld	L14_RF_data,a
 406                     ; 199           RF_rcvState = RF_RCVSTATE_RECBITS;
 408  00a0 35010029      	mov	L15_RF_rcvState,#1
 409  00a4 acb901b9      	jra	L551
 410  00a8               L301:
 411                     ; 215       if(FLAG_rise_edge)
 413  00a8 b615          	ld	a,L11_FLAG_rise_edge
 414  00aa 2604ac2f012f  	jreq	L361
 415                     ; 217         rf_high_time = cap_fall;
 417  00b0 be97          	ldw	x,L7_cap_fall
 418  00b2 bf1e          	ldw	L52_rf_high_time,x
 419                     ; 218         if(rf_high_time+rf_offset <= rf_bittime+RF_EDGES_JITTER && rf_high_time+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 421  00b4 8de401e4      	callf	LC007
 422  00b8 225b          	jrugt	L561
 424  00ba 8df501f5      	callf	LC008
 425  00be 2555          	jrult	L561
 426                     ; 221           RF_data |= 0x01;
 428  00c0 72100027      	bset	L14_RF_data,#0
 429                     ; 222           RF_bits++;
 431  00c4 3c25          	inc	L53_RF_bits
 432                     ; 223           if(RF_bits < 8) RF_data <<= 1;
 434  00c6 b625          	ld	a,L53_RF_bits
 435  00c8 a108          	cp	a,#8
 436  00ca 2402          	jruge	L761
 439  00cc 3827          	sll	L14_RF_data
 440  00ce               L761:
 441                     ; 224           if(RF_bits == 8)
 443  00ce a108          	cp	a,#8
 444  00d0 2704ac9c019c  	jrne	L132
 445                     ; 227             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 447  00d6 8dd101d1      	callf	LC006
 448  00da 2612          	jrne	L371
 449                     ; 232               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 451  00dc be9c          	ldw	x,_RcvRFmsg
 452  00de 2708          	jreq	L571
 453                     ; 235                 flag_RF_StartRec = FALSE;
 455  00e0 72110008      	bres	L74_flag_RF_StartRec
 456                     ; 236                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 458  00e4 3f29          	clr	L15_RF_rcvState
 460  00e6 2006          	jra	L371
 461  00e8               L571:
 462                     ; 240                 flag_RF_StartRec = TRUE;
 464  00e8 72100008      	bset	L74_flag_RF_StartRec
 465                     ; 241                 idx_temp2 = 0;
 467  00ec 3f28          	clr	L54_idx_temp2
 468  00ee               L371:
 469                     ; 244             if(RF_bytes == RFSEND_DATALEN) 
 471  00ee a105          	cp	a,#5
 472  00f0 26e0          	jrne	L132
 473                     ; 246               RFrcvChksum = 0;
 475  00f2 3f00          	clr	L13_RFrcvChksum
 476                     ; 247               for(i=0;i<RFSEND_DATALEN-1;i++)
 478  00f4 4f            	clr	a
 479  00f5 6b01          	ld	(OFST+0,sp),a
 480  00f7               L302:
 481                     ; 249                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 483  00f7 5f            	clrw	x
 484  00f8 97            	ld	xl,a
 485  00f9 b600          	ld	a,L13_RFrcvChksum
 486  00fb eb9c          	add	a,(_RcvRFmsg,x)
 487  00fd b700          	ld	L13_RFrcvChksum,a
 488                     ; 247               for(i=0;i<RFSEND_DATALEN-1;i++)
 490  00ff 0c01          	inc	(OFST+0,sp)
 493  0101 7b01          	ld	a,(OFST+0,sp)
 494  0103 a104          	cp	a,#4
 495  0105 25f0          	jrult	L302
 496                     ; 251               RFrcvChksum = (u8)(~RFrcvChksum);
 498  0107 3300          	cpl	L13_RFrcvChksum
 499                     ; 252               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 501  0109 b6a0          	ld	a,_RcvRFmsg+4
 502  010b b100          	cp	a,L13_RFrcvChksum
 503  010d 2704ac960196  	jrne	L152
 504                     ; 254                 RFbytesReady = TRUE;  // set new RF data available flag
 505                     ; 256               flag_RF_StartRec = FALSE;
 506                     ; 257               RF_rcvState = RF_RCVSTATE_WAITSTART;
 507                     ; 260           rf_offset = 0;
 509  0113 207d          	jpf	LC005
 510  0115               L561:
 511                     ; 262         else if(rf_high_time <= rf_halfbittime+RF_EDGES_JITTER && rf_high_time >= rf_halfbittime-RF_EDGES_JITTER)
 513  0115 be1a          	ldw	x,L12_rf_halfbittime
 514  0117 1c0032        	addw	x,#50
 515  011a b31e          	cpw	x,L52_rf_high_time
 516  011c 2404acb701b7  	jrult	L552
 518  0122 be1a          	ldw	x,L12_rf_halfbittime
 519  0124 1d0032        	subw	x,#50
 520  0127 b31e          	cpw	x,L52_rf_high_time
 521  0129 22f3          	jrugt	L552
 522                     ; 264           rf_offset = rf_high_time;
 524  012b be1e          	ldw	x,L52_rf_high_time
 526  012d 206e          	jpf	LC002
 527                     ; 268           RF_rcvState = RF_RCVSTATE_WAITSTART;
 528  012f               L361:
 529                     ; 271       else if(FLAG_fall_edge)
 531  012f b616          	ld	a,L31_FLAG_fall_edge
 532  0131 2604acb901b9  	jreq	L551
 533                     ; 273         rf_low_time = cap_rise-cap_fall;
 535  0137 be99          	ldw	x,L5_cap_rise
 536  0139 72b00097      	subw	x,L7_cap_fall
 537  013d bf1c          	ldw	L32_rf_low_time,x
 538                     ; 274         if(rf_low_time+rf_offset <= rf_bittime+RF_EDGES_JITTER && rf_low_time+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 540  013f 8de401e4      	callf	LC007
 541  0143 225c          	jrugt	L522
 543  0145 8df501f5      	callf	LC008
 544  0149 2556          	jrult	L522
 545                     ; 277           RF_bits++;
 547  014b 3c25          	inc	L53_RF_bits
 548                     ; 278           if(RF_bits < 8) RF_data <<= 1;
 550  014d b625          	ld	a,L53_RF_bits
 551  014f a108          	cp	a,#8
 552  0151 2402          	jruge	L722
 555  0153 3827          	sll	L14_RF_data
 556  0155               L722:
 557                     ; 279           if(RF_bits == 8)
 559  0155 a108          	cp	a,#8
 560  0157 2643          	jrne	L132
 561                     ; 282             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 563  0159 8dd101d1      	callf	LC006
 564  015d 2612          	jrne	L332
 565                     ; 287               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 567  015f be9c          	ldw	x,_RcvRFmsg
 568  0161 2708          	jreq	L532
 569                     ; 290                 flag_RF_StartRec = FALSE;
 571  0163 72110008      	bres	L74_flag_RF_StartRec
 572                     ; 291                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 574  0167 3f29          	clr	L15_RF_rcvState
 576  0169 2006          	jra	L332
 577  016b               L532:
 578                     ; 295                 flag_RF_StartRec = TRUE;
 580  016b 72100008      	bset	L74_flag_RF_StartRec
 581                     ; 296                 idx_temp2 = 0;
 583  016f 3f28          	clr	L54_idx_temp2
 584  0171               L332:
 585                     ; 299             if(RF_bytes == RFSEND_DATALEN) 
 587  0171 a105          	cp	a,#5
 588  0173 2627          	jrne	L132
 589                     ; 301               RFrcvChksum = 0;
 591  0175 3f00          	clr	L13_RFrcvChksum
 592                     ; 302               for(i=0;i<RFSEND_DATALEN-1;i++)
 594  0177 4f            	clr	a
 595  0178 6b01          	ld	(OFST+0,sp),a
 596  017a               L342:
 597                     ; 304                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 599  017a 5f            	clrw	x
 600  017b 97            	ld	xl,a
 601  017c b600          	ld	a,L13_RFrcvChksum
 602  017e eb9c          	add	a,(_RcvRFmsg,x)
 603  0180 b700          	ld	L13_RFrcvChksum,a
 604                     ; 302               for(i=0;i<RFSEND_DATALEN-1;i++)
 606  0182 0c01          	inc	(OFST+0,sp)
 609  0184 7b01          	ld	a,(OFST+0,sp)
 610  0186 a104          	cp	a,#4
 611  0188 25f0          	jrult	L342
 612                     ; 306               RFrcvChksum = (u8)(~RFrcvChksum);
 614  018a 3300          	cpl	L13_RFrcvChksum
 615                     ; 307               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 617  018c b6a0          	ld	a,_RcvRFmsg+4
 618  018e b100          	cp	a,L13_RFrcvChksum
 619  0190 2604          	jrne	L152
 620                     ; 309                 RFbytesReady = TRUE;  // set new RF data available flag
 622  0192               LC005:
 624  0192 35010023      	mov	_RFbytesReady,#1
 625  0196               L152:
 626                     ; 311               flag_RF_StartRec = FALSE;
 628                     ; 312               RF_rcvState = RF_RCVSTATE_WAITSTART;
 631  0196 72110008      	bres	L74_flag_RF_StartRec
 633  019a 3f29          	clr	L15_RF_rcvState
 634  019c               L132:
 635                     ; 315           rf_offset = 0;
 638  019c 5f            	clrw	x
 639  019d               LC002:
 640  019d bf20          	ldw	L72_rf_offset,x
 642  019f 2018          	jra	L551
 643  01a1               L522:
 644                     ; 317         else if(rf_low_time <= rf_halfbittime+RF_EDGES_JITTER && rf_low_time >= rf_halfbittime-RF_EDGES_JITTER)
 646  01a1 be1a          	ldw	x,L12_rf_halfbittime
 647  01a3 1c0032        	addw	x,#50
 648  01a6 b31c          	cpw	x,L32_rf_low_time
 649  01a8 250d          	jrult	L552
 651  01aa be1a          	ldw	x,L12_rf_halfbittime
 652  01ac 1d0032        	subw	x,#50
 653  01af b31c          	cpw	x,L32_rf_low_time
 654  01b1 2204          	jrugt	L552
 655                     ; 319           rf_offset = rf_low_time;
 657  01b3 be1c          	ldw	x,L32_rf_low_time
 659  01b5 20e6          	jpf	LC002
 660  01b7               L552:
 661                     ; 323           RF_rcvState = RF_RCVSTATE_WAITSTART;
 664  01b7 3f29          	clr	L15_RF_rcvState
 665                     ; 328     default: break;
 667  01b9               L551:
 668                     ; 330   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 670  01b9 a602          	ld	a,#2
 671  01bb cd0000        	call	_TIM3_ClearITPendingBit
 673                     ; 331   TIM3_ClearITPendingBit(TIM3_IT_CC2);
 675  01be a604          	ld	a,#4
 676  01c0 cd0000        	call	_TIM3_ClearITPendingBit
 678                     ; 332 }
 681  01c3 84            	pop	a
 682  01c4 85            	popw	x
 683  01c5 bf00          	ldw	c_y,x
 684  01c7 320002        	pop	c_y+2
 685  01ca 85            	popw	x
 686  01cb bf00          	ldw	c_x,x
 687  01cd 320002        	pop	c_x+2
 688  01d0 80            	iret	
 689  01d1               LC006:
 690  01d1 b626          	ld	a,L73_RF_bytes
 691  01d3 3c26          	inc	L73_RF_bytes
 692  01d5 5f            	clrw	x
 693  01d6 97            	ld	xl,a
 694  01d7 b627          	ld	a,L14_RF_data
 695  01d9 e79c          	ld	(_RcvRFmsg,x),a
 696                     ; 228             RF_bits = 0;
 698  01db 3f25          	clr	L53_RF_bits
 699                     ; 229             RF_data = 0;
 701  01dd 3f27          	clr	L14_RF_data
 702                     ; 230             if(RF_bytes == 2)
 704  01df b626          	ld	a,L73_RF_bytes
 705  01e1 a102          	cp	a,#2
 706  01e3 87            	retf	
 707  01e4               LC007:
 708  01e4 90be18        	ldw	y,L71_rf_bittime
 709  01e7 72bb0020      	addw	x,L72_rf_offset
 710  01eb 72a90032      	addw	y,#50
 711  01ef 90bf00        	ldw	c_y,y
 712  01f2 b300          	cpw	x,c_y
 713  01f4 87            	retf	
 714  01f5               LC008:
 715  01f5 90be18        	ldw	y,L71_rf_bittime
 716  01f8 72a20032      	subw	y,#50
 717  01fc 90bf00        	ldw	c_y,y
 718  01ff b300          	cpw	x,c_y
 719  0201 87            	retf	
 741                     ; 339 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 741                     ; 340 {
 742                     .text:	section	.text,new
 743  0000               f_TRAP_IRQHandler:
 747                     ; 344 }
 750  0000 80            	iret	
 772                     ; 351 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 772                     ; 352 {
 773                     .text:	section	.text,new
 774  0000               f_FLASH_IRQHandler:
 778                     ; 356 }
 781  0000 80            	iret	
 803                     ; 363 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 803                     ; 364 {
 804                     .text:	section	.text,new
 805  0000               f_AWU_IRQHandler:
 809                     ; 368 }
 812  0000 80            	iret	
 834                     ; 375 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 834                     ; 376 {
 835                     .text:	section	.text,new
 836  0000               f_EXTIB_IRQHandler:
 840                     ; 380 }
 843  0000 80            	iret	
 865                     ; 387 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 865                     ; 388 {
 866                     .text:	section	.text,new
 867  0000               f_EXTID_IRQHandler:
 871                     ; 392 }
 874  0000 80            	iret	
 896                     ; 399 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 896                     ; 400 {
 897                     .text:	section	.text,new
 898  0000               f_EXTI0_IRQHandler:
 902                     ; 404 }
 905  0000 80            	iret	
 927                     ; 411 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 927                     ; 412 {
 928                     .text:	section	.text,new
 929  0000               f_EXTI1_IRQHandler:
 933                     ; 416 }
 936  0000 80            	iret	
 958                     ; 423 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 958                     ; 424 {
 959                     .text:	section	.text,new
 960  0000               f_EXTI2_IRQHandler:
 964                     ; 428 }
 967  0000 80            	iret	
 989                     ; 435 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 989                     ; 436 {
 990                     .text:	section	.text,new
 991  0000               f_EXTI3_IRQHandler:
 995                     ; 440 }
 998  0000 80            	iret	
1020                     ; 447 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1020                     ; 448 {
1021                     .text:	section	.text,new
1022  0000               f_EXTI4_IRQHandler:
1026                     ; 452 }
1029  0000 80            	iret	
1051                     ; 459 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1051                     ; 460 {
1052                     .text:	section	.text,new
1053  0000               f_EXTI5_IRQHandler:
1057                     ; 464 }
1060  0000 80            	iret	
1082                     ; 471 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1082                     ; 472 {
1083                     .text:	section	.text,new
1084  0000               f_EXTI6_IRQHandler:
1088                     ; 476 }
1091  0000 80            	iret	
1113                     ; 483 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1113                     ; 484 {
1114                     .text:	section	.text,new
1115  0000               f_EXTI7_IRQHandler:
1119                     ; 488 }
1122  0000 80            	iret	
1144                     ; 495 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1144                     ; 496 {
1145                     .text:	section	.text,new
1146  0000               f_COMP_IRQHandler:
1150                     ; 500 }
1153  0000 80            	iret	
1211                     ; 507 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
1211                     ; 508 {
1212                     .text:	section	.text,new
1213  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
1215  0000 8a            	push	cc
1216  0001 84            	pop	a
1217  0002 a4bf          	and	a,#191
1218  0004 88            	push	a
1219  0005 86            	pop	cc
1220  0006 3b0002        	push	c_x+2
1221  0009 be00          	ldw	x,c_x
1222  000b 89            	pushw	x
1223  000c 3b0002        	push	c_y+2
1224  000f be00          	ldw	x,c_y
1225  0011 89            	pushw	x
1228                     ; 512   interrupt_status = 1;
1230  0012 3501009b      	mov	L3_interrupt_status,#1
1231                     ; 513   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
1233  0016 a601          	ld	a,#1
1234  0018 cd0000        	call	_TIM2_GetITStatus
1236  001b 4d            	tnz	a
1237  001c 2604aca401a4  	jreq	L154
1238                     ; 516     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
1240  0022 be00          	ldw	x,_cnt_flag_250ms
1241  0024 a3ffff        	cpw	x,#65535
1242  0027 2403          	jruge	L354
1245  0029 5c            	incw	x
1246  002a bf00          	ldw	_cnt_flag_250ms,x
1247  002c               L354:
1248                     ; 517     if(cnt_flag_250ms >= CNTVAL_250MS) 
1250  002c a300fa        	cpw	x,#250
1251  002f 2507          	jrult	L554
1252                     ; 519       cnt_flag_250ms = 0;
1254  0031 5f            	clrw	x
1255  0032 bf00          	ldw	_cnt_flag_250ms,x
1256                     ; 520       FLAG_250ms = TRUE;
1258  0034 72100000      	bset	_FLAG_250ms
1259  0038               L554:
1260                     ; 522     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
1262  0038 be02          	ldw	x,_cnt_flag_500ms
1263  003a a3ffff        	cpw	x,#65535
1264  003d 2403          	jruge	L754
1267  003f 5c            	incw	x
1268  0040 bf02          	ldw	_cnt_flag_500ms,x
1269  0042               L754:
1270                     ; 523     if(cnt_flag_500ms >= CNTVAL_500MS) 
1272  0042 a301f4        	cpw	x,#500
1273  0045 2507          	jrult	L164
1274                     ; 525       cnt_flag_500ms = 0;
1276  0047 5f            	clrw	x
1277  0048 bf02          	ldw	_cnt_flag_500ms,x
1278                     ; 526       FLAG_500ms = TRUE;
1280  004a 72100001      	bset	_FLAG_500ms
1281  004e               L164:
1282                     ; 528     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
1284  004e be04          	ldw	x,_cnt_flag_1000ms
1285  0050 a3ffff        	cpw	x,#65535
1286  0053 2403          	jruge	L364
1289  0055 5c            	incw	x
1290  0056 bf04          	ldw	_cnt_flag_1000ms,x
1291  0058               L364:
1292                     ; 529     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
1294  0058 a303e8        	cpw	x,#1000
1295  005b 2507          	jrult	L564
1296                     ; 531       cnt_flag_1000ms = 0;
1298  005d 5f            	clrw	x
1299  005e bf04          	ldw	_cnt_flag_1000ms,x
1300                     ; 532       FLAG_1000ms = TRUE;
1302  0060 72100002      	bset	_FLAG_1000ms
1303  0064               L564:
1304                     ; 535     if(!Timeout_istout1)
1306  0064 720000000d    	btjt	_Timeout_istout1,L764
1307                     ; 537       Timeout_toutcnt1++;
1309  0069 be00          	ldw	x,_Timeout_toutcnt1
1310  006b 5c            	incw	x
1311  006c bf00          	ldw	_Timeout_toutcnt1,x
1312                     ; 538       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
1314  006e b300          	cpw	x,_Timeout_tout1
1315  0070 2504          	jrult	L764
1318  0072 72100000      	bset	_Timeout_istout1
1319  0076               L764:
1320                     ; 540     if(!Timeout_istout2)
1322  0076 720000000d    	btjt	_Timeout_istout2,L374
1323                     ; 542       Timeout_toutcnt2++;
1325  007b be00          	ldw	x,_Timeout_toutcnt2
1326  007d 5c            	incw	x
1327  007e bf00          	ldw	_Timeout_toutcnt2,x
1328                     ; 543       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1330  0080 b300          	cpw	x,_Timeout_tout2
1331  0082 2504          	jrult	L374
1334  0084 72100000      	bset	_Timeout_istout2
1335  0088               L374:
1336                     ; 545     if(!Timeout_istout3)
1338  0088 720000000d    	btjt	_Timeout_istout3,L774
1339                     ; 547       Timeout_toutcnt3++;
1341  008d be00          	ldw	x,_Timeout_toutcnt3
1342  008f 5c            	incw	x
1343  0090 bf00          	ldw	_Timeout_toutcnt3,x
1344                     ; 548       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1346  0092 b300          	cpw	x,_Timeout_tout3
1347  0094 2504          	jrult	L774
1350  0096 72100000      	bset	_Timeout_istout3
1351  009a               L774:
1352                     ; 551     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
1354  009a b624          	ld	a,L33_RFrcvTimeoutcnt
1355  009c a1ff          	cp	a,#255
1356  009e 2402          	jruge	L305
1359  00a0 3c24          	inc	L33_RFrcvTimeoutcnt
1360  00a2               L305:
1361                     ; 552     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1363                     ; 558     if(!BTN1_STATE)
1365  00a2 7204500116    	btjt	20481,#2,L705
1366                     ; 560       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1368  00a7 b606          	ld	a,_btn1_0_cnt
1369  00a9 a1ff          	cp	a,#255
1370  00ab 2402          	jruge	L115
1373  00ad 3c06          	inc	_btn1_0_cnt
1374  00af               L115:
1375                     ; 561       btn1_1_cnt = 0;
1377  00af 3f07          	clr	_btn1_1_cnt
1378                     ; 562       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1380  00b1 b606          	ld	a,_btn1_0_cnt
1381  00b3 a11e          	cp	a,#30
1382  00b5 2518          	jrult	L515
1383                     ; 564         BTN1_DEB_STATE = BTN_PRESSED;
1385  00b7 35010008      	mov	_BTN1_DEB_STATE,#1
1386  00bb 2012          	jra	L515
1387  00bd               L705:
1388                     ; 569       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1390  00bd b607          	ld	a,_btn1_1_cnt
1391  00bf a1ff          	cp	a,#255
1392  00c1 2402          	jruge	L715
1395  00c3 3c07          	inc	_btn1_1_cnt
1396  00c5               L715:
1397                     ; 570       btn1_0_cnt = 0;
1399  00c5 3f06          	clr	_btn1_0_cnt
1400                     ; 571       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1402  00c7 b607          	ld	a,_btn1_1_cnt
1403  00c9 a11e          	cp	a,#30
1404  00cb 2502          	jrult	L515
1405                     ; 573         BTN1_DEB_STATE = BTN_DEPRESSED;
1407  00cd 3f08          	clr	_BTN1_DEB_STATE
1408  00cf               L515:
1409                     ; 579     if(BTN1_DEB_STATE == BTN_PRESSED)
1411  00cf b608          	ld	a,_BTN1_DEB_STATE
1412  00d1 4a            	dec	a
1413  00d2 260a          	jrne	L325
1414                     ; 581       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1416  00d4 be0a          	ldw	x,_BTN1_press_timer
1417  00d6 a3ffff        	cpw	x,#65535
1418  00d9 2403          	jruge	L325
1421  00db 5c            	incw	x
1422  00dc bf0a          	ldw	_BTN1_press_timer,x
1423  00de               L325:
1424                     ; 584     if(!BTN1_DELAY_FLAG)
1426  00de 720000030e    	btjt	_BTN1_DELAY_FLAG,L725
1427                     ; 586       btn1_delay_cnt++;
1429  00e3 3c09          	inc	_btn1_delay_cnt
1430                     ; 587       if(btn1_delay_cnt == BTN_DELAY)
1432  00e5 b609          	ld	a,_btn1_delay_cnt
1433  00e7 a196          	cp	a,#150
1434  00e9 2606          	jrne	L725
1435                     ; 589         btn1_delay_cnt = 0;
1437  00eb 3f09          	clr	_btn1_delay_cnt
1438                     ; 590         BTN1_DELAY_FLAG = TRUE;
1440  00ed 72100003      	bset	_BTN1_DELAY_FLAG
1441  00f1               L725:
1442                     ; 596     if(flag_blink_redLED)
1444  00f1 7201000550    	btjf	_flag_blink_redLED,L335
1445                     ; 598       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1447  00f6 be0d          	ldw	x,_cnt_state_redLED
1448  00f8 a3ffff        	cpw	x,#65535
1449  00fb 2403          	jruge	L535
1452  00fd 5c            	incw	x
1453  00fe bf0d          	ldw	_cnt_state_redLED,x
1454  0100               L535:
1455                     ; 599       if(flag_blink_on_off)
1457  0100 7201000412    	btjf	_flag_blink_on_off,L735
1458                     ; 601         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1460  0105 a30032        	cpw	x,#50
1461  0108 253c          	jrult	L335
1462                     ; 603           flag_blink_on_off = FALSE;
1464  010a 72110004      	bres	_flag_blink_on_off
1465                     ; 604           cnt_state_redLED = 0;
1467  010e 5f            	clrw	x
1468  010f bf0d          	ldw	_cnt_state_redLED,x
1469                     ; 605           LED_OFF;
1471  0111 7217500a      	bres	20490,#3
1474  0115 202b          	jpf	LC009
1475  0117               L735:
1476                     ; 610         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1478  0117 a300c8        	cpw	x,#200
1479  011a 252a          	jrult	L335
1480                     ; 612           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1482  011c b611          	ld	a,_cnt_blink_redLED
1483  011e a1ff          	cp	a,#255
1484  0120 2402          	jruge	L745
1487  0122 3c11          	inc	_cnt_blink_redLED
1488  0124               L745:
1489                     ; 613           flag_blink_on_off = TRUE;
1491  0124 72100004      	bset	_flag_blink_on_off
1492                     ; 614           cnt_state_redLED = 0;
1494  0128 5f            	clrw	x
1495  0129 bf0d          	ldw	_cnt_state_redLED,x
1496                     ; 615           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1498  012b b611          	ld	a,_cnt_blink_redLED
1499  012d b113          	cp	a,_blink_redLED_times
1500  012f 250d          	jrult	L155
1502  0131 7200000708    	btjt	_flag_blink_unlimited,L155
1503                     ; 617             flag_blink_redLED = FALSE;
1505  0136 72110005      	bres	_flag_blink_redLED
1506                     ; 618             cnt_blink_redLED = 0;
1508  013a 3f11          	clr	_cnt_blink_redLED
1510  013c 2008          	jra	L335
1511  013e               L155:
1512                     ; 622             LED_RED_ON;
1514  013e 7216500a      	bset	20490,#3
1517  0142               LC009:
1519  0142 7219500a      	bres	20490,#4
1521  0146               L335:
1522                     ; 627     if(flag_blink_greenLED)
1524  0146 7201000654    	btjf	_flag_blink_greenLED,L555
1525                     ; 629       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1527  014b be0f          	ldw	x,_cnt_state_greenLED
1528  014d a3ffff        	cpw	x,#65535
1529  0150 2403          	jruge	L755
1532  0152 5c            	incw	x
1533  0153 bf0f          	ldw	_cnt_state_greenLED,x
1534  0155               L755:
1535                     ; 630       if(flag_blink_on_off)
1537  0155 7201000416    	btjf	_flag_blink_on_off,L165
1538                     ; 632         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1540  015a a30032        	cpw	x,#50
1541  015d 2540          	jrult	L555
1542                     ; 634           flag_blink_on_off = FALSE;
1544  015f 72110004      	bres	_flag_blink_on_off
1545                     ; 635           cnt_state_greenLED = 0;
1547  0163 5f            	clrw	x
1548  0164 bf0f          	ldw	_cnt_state_greenLED,x
1549                     ; 636           LED_OFF;
1551  0166 7217500a      	bres	20490,#3
1554  016a 7219500a      	bres	20490,#4
1556  016e 202f          	jra	L555
1557  0170               L165:
1558                     ; 641         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1560  0170 a300c8        	cpw	x,#200
1561  0173 252a          	jrult	L555
1562                     ; 643           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1564  0175 b612          	ld	a,_cnt_blink_greenLED
1565  0177 a1ff          	cp	a,#255
1566  0179 2402          	jruge	L175
1569  017b 3c12          	inc	_cnt_blink_greenLED
1570  017d               L175:
1571                     ; 644           flag_blink_on_off = TRUE;
1573  017d 72100004      	bset	_flag_blink_on_off
1574                     ; 645           cnt_state_greenLED = 0;
1576  0181 5f            	clrw	x
1577  0182 bf0f          	ldw	_cnt_state_greenLED,x
1578                     ; 646           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1580  0184 b612          	ld	a,_cnt_blink_greenLED
1581  0186 b114          	cp	a,_blink_greenLED_times
1582  0188 250d          	jrult	L375
1584  018a 7200000708    	btjt	_flag_blink_unlimited,L375
1585                     ; 648             flag_blink_greenLED = FALSE;
1587  018f 72110006      	bres	_flag_blink_greenLED
1588                     ; 649             cnt_blink_greenLED = 0;
1590  0193 3f12          	clr	_cnt_blink_greenLED
1592  0195 2008          	jra	L555
1593  0197               L375:
1594                     ; 653             LED_GREEN_ON;
1596  0197 7217500a      	bres	20490,#3
1599  019b 7218500a      	bset	20490,#4
1601  019f               L555:
1602                     ; 659     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
1604  019f a601          	ld	a,#1
1605  01a1 cd0000        	call	_TIM2_ClearITPendingBit
1607  01a4               L154:
1608                     ; 661   interrupt_status = 0;
1610  01a4 3f9b          	clr	L3_interrupt_status
1611                     ; 662 }
1614  01a6 85            	popw	x
1615  01a7 bf00          	ldw	c_y,x
1616  01a9 320002        	pop	c_y+2
1617  01ac 85            	popw	x
1618  01ad bf00          	ldw	c_x,x
1619  01af 320002        	pop	c_x+2
1620  01b2 80            	iret	
1643                     ; 669 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1643                     ; 670 {
1644                     .text:	section	.text,new
1645  0000               f_TIM2_CAP_IRQHandler:
1649                     ; 674 }
1652  0000 80            	iret	
1675                     ; 681 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1675                     ; 682 {
1676                     .text:	section	.text,new
1677  0000               f_TIM4_UPD_OVF_IRQHandler:
1681                     ; 686 }
1684  0000 80            	iret	
1706                     ; 693 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1706                     ; 694 {
1707                     .text:	section	.text,new
1708  0000               f_SPI_IRQHandler:
1712                     ; 698 }
1715  0000 80            	iret	
1738                     ; 704 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1738                     ; 705 {
1739                     .text:	section	.text,new
1740  0000               f_USART_TX_IRQHandler:
1744                     ; 709 }
1747  0000 80            	iret	
1770                     ; 716 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1770                     ; 717 {
1771                     .text:	section	.text,new
1772  0000               f_USART_RX_IRQHandler:
1776                     ; 721 }
1779  0000 80            	iret	
1801                     ; 729 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1801                     ; 730 {
1802                     .text:	section	.text,new
1803  0000               f_I2C_IRQHandler:
1807                     ; 734 }
1810  0000 80            	iret	
2347                     	xdef	_FLAG_UART_cmd_rcv
2348                     	switch	.ubsct
2349  0000               L13_RFrcvChksum:
2350  0000 00            	ds.b	1
2351                     	xdef	_idx
2352  0001               _rcv_buff:
2353  0001 000000000000  	ds.b	150
2354                     	xdef	_rcv_buff
2355  0097               L7_cap_fall:
2356  0097 0000          	ds.b	2
2357  0099               L5_cap_rise:
2358  0099 0000          	ds.b	2
2359                     	xdef	_cnt_blink_greenLED
2360                     	xdef	_cnt_blink_redLED
2361                     	xdef	_debug
2362  009b               L3_interrupt_status:
2363  009b 00            	ds.b	1
2364                     	xref.b	_Timeout_tout3
2365                     	xref.b	_Timeout_tout2
2366                     	xref.b	_Timeout_tout1
2367                     	xref.b	_Timeout_toutcnt3
2368                     	xref.b	_Timeout_toutcnt2
2369                     	xref.b	_Timeout_toutcnt1
2370                     	xbit	_Timeout_istout3
2371                     	xbit	_Timeout_istout2
2372                     	xbit	_Timeout_istout1
2373                     	xdef	_btn1_delay_cnt
2374                     	xdef	_btn1_1_cnt
2375                     	xdef	_btn1_0_cnt
2376                     	xdef	_cnt_flag_1000ms
2377                     	xdef	_cnt_flag_500ms
2378                     	xdef	_cnt_flag_250ms
2379                     	xdef	f_I2C_IRQHandler
2380                     	xdef	f_USART_RX_IRQHandler
2381                     	xdef	f_USART_TX_IRQHandler
2382                     	xdef	f_SPI_IRQHandler
2383                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2384                     	xdef	f_TIM3_CAP_IRQHandler
2385                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2386                     	xdef	f_TIM2_CAP_IRQHandler
2387                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2388                     	xdef	f_COMP_IRQHandler
2389                     	xdef	f_EXTI7_IRQHandler
2390                     	xdef	f_EXTI6_IRQHandler
2391                     	xdef	f_EXTI5_IRQHandler
2392                     	xdef	f_EXTI4_IRQHandler
2393                     	xdef	f_EXTI3_IRQHandler
2394                     	xdef	f_EXTI2_IRQHandler
2395                     	xdef	f_EXTI1_IRQHandler
2396                     	xdef	f_EXTI0_IRQHandler
2397                     	xdef	f_EXTID_IRQHandler
2398                     	xdef	f_EXTIB_IRQHandler
2399                     	xdef	f_AWU_IRQHandler
2400                     	xdef	f_FLASH_IRQHandler
2401                     	xdef	f_TRAP_IRQHandler
2402                     	xdef	f_NonHandledInterrupt
2403                     	xdef	_RFbytesReady
2404  009c               _RcvRFmsg:
2405  009c 0000000000    	ds.b	5
2406                     	xdef	_RcvRFmsg
2407                     	xdef	_flag_blink_unlimited
2408                     	xdef	_flag_blink_greenLED
2409                     	xdef	_flag_blink_redLED
2410                     	xdef	_flag_blink_on_off
2411                     	xdef	_cnt_state_greenLED
2412                     	xdef	_cnt_state_redLED
2413                     	xdef	_blink_greenLED_times
2414                     	xdef	_blink_redLED_times
2415                     	xdef	_FLAG_1000ms
2416                     	xdef	_FLAG_500ms
2417                     	xdef	_FLAG_250ms
2418                     	xdef	_BTN1_press_timer
2419                     	xdef	_BTN1_DELAY_FLAG
2420                     	xdef	_BTN1_DEB_STATE
2421                     	xref	_TIM3_ClearITPendingBit
2422                     	xref	_TIM3_GetITStatus
2423                     	xref	_TIM3_GetCapture2
2424                     	xref	_TIM3_GetCapture1
2425                     	xref	_TIM2_ClearITPendingBit
2426                     	xref	_TIM2_GetITStatus
2427                     	xref.b	c_x
2428                     	xref.b	c_y
2448                     	end
