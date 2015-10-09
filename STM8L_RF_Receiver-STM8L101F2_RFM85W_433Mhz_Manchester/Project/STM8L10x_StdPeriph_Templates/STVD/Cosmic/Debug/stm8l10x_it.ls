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
  87  001c               L32_rf_edges_jitter:
  88  001c 0000          	dc.w	0
  89  001e               L52_rf_low_time:
  90  001e 0000          	dc.w	0
  91  0020               L72_rf_high_time:
  92  0020 0000          	dc.w	0
  93  0022               L13_rf_offset:
  94  0022 0000          	dc.w	0
  95  0024               _idx:
  96  0024 00            	dc.b	0
  97  0025               _RFbytesReady:
  98  0025 00            	dc.b	0
  99  0026               L53_RFrcvTimeoutcnt:
 100  0026 00            	dc.b	0
 101  0027               L73_RF_bits:
 102  0027 00            	dc.b	0
 103  0028               L14_RF_bytes:
 104  0028 00            	dc.b	0
 105  0029               L34_RF_data:
 106  0029 00            	dc.b	0
 107  002a               _RF_waitstart_substate:
 108  002a 02            	dc.b	2
 109  002b               L54_RF_rcvState:
 110  002b 00            	dc.b	0
 111                     	switch	.bit
 112  0008               _FLAG_UART_cmd_rcv:
 113  0008 00            	dc.b	0
 143                     ; 142 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 143                     ; 143 {
 144                     .text:	section	.text,new
 145  0000               f_NonHandledInterrupt:
 149                     ; 147 }
 152  0000 80            	iret	
 221                     ; 154 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 221                     ; 155 {
 222                     .text:	section	.text,new
 223  0000               f_TIM3_CAP_IRQHandler:
 225  0000 8a            	push	cc
 226  0001 84            	pop	a
 227  0002 a4bf          	and	a,#191
 228  0004 88            	push	a
 229  0005 86            	pop	cc
 230       00000001      OFST:	set	1
 231  0006 3b0002        	push	c_x+2
 232  0009 be00          	ldw	x,c_x
 233  000b 89            	pushw	x
 234  000c 3b0002        	push	c_y+2
 235  000f be00          	ldw	x,c_y
 236  0011 89            	pushw	x
 237  0012 88            	push	a
 240                     ; 163   if(TIM3_GetITStatus(TIM3_IT_CC1) == SET) {
 242  0013 a602          	ld	a,#2
 243  0015 cd0000        	call	_TIM3_GetITStatus
 245  0018 4a            	dec	a
 246  0019 260b          	jrne	L321
 247                     ; 164     cap_rise = TIM3_GetCapture1();
 249  001b cd0000        	call	_TIM3_GetCapture1
 251  001e bf9d          	ldw	L5_cap_rise,x
 252                     ; 165     FLAG_rise_edge = TRUE;
 254  0020 35010015      	mov	L11_FLAG_rise_edge,#1
 256  0024 2002          	jra	L521
 257  0026               L321:
 258                     ; 167   else FLAG_rise_edge = FALSE;
 260  0026 3f15          	clr	L11_FLAG_rise_edge
 261  0028               L521:
 262                     ; 168   if(TIM3_GetITStatus(TIM3_IT_CC2) == SET) {
 264  0028 a604          	ld	a,#4
 265  002a cd0000        	call	_TIM3_GetITStatus
 267  002d 4a            	dec	a
 268  002e 260b          	jrne	L721
 269                     ; 169     cap_fall = TIM3_GetCapture2();
 271  0030 cd0000        	call	_TIM3_GetCapture2
 273  0033 bf9b          	ldw	L7_cap_fall,x
 274                     ; 170     FLAG_fall_edge = TRUE;
 276  0035 35010016      	mov	L31_FLAG_fall_edge,#1
 278  0039 2002          	jra	L131
 279  003b               L721:
 280                     ; 172   else FLAG_fall_edge = FALSE;
 282  003b 3f16          	clr	L31_FLAG_fall_edge
 283  003d               L131:
 284                     ; 173   if(FLAG_rise_edge && FLAG_fall_edge) {
 286  003d b615          	ld	a,L11_FLAG_rise_edge
 287  003f 2708          	jreq	L331
 289  0041 b616          	ld	a,L31_FLAG_fall_edge
 290  0043 2704          	jreq	L331
 291                     ; 174     FLAG_CC_Error = TRUE;
 293  0045 35010017      	mov	L51_FLAG_CC_Error,#1
 294  0049               L331:
 295                     ; 177   RFrcvTimeoutcnt = 0;
 297  0049 3f26          	clr	L53_RFrcvTimeoutcnt
 298                     ; 178   switch(RF_rcvState)
 300  004b b62b          	ld	a,L54_RF_rcvState
 302                     ; 371     default: break;
 303  004d 270b          	jreq	L56
 304  004f 4a            	dec	a
 305  0050 2604ac020102  	jreq	L57
 306  0056 ac780278      	jra	L731
 307  005a               L56:
 308                     ; 182       switch(RF_waitstart_substate)
 310  005a b62a          	ld	a,_RF_waitstart_substate
 312                     ; 235         default: break;
 313  005c a002          	sub	a,#2
 314  005e 2707          	jreq	L76
 315  0060 4a            	dec	a
 316  0061 2734          	jreq	L17
 317  0063 ac780278      	jra	L731
 318  0067               L76:
 319                     ; 186           DEBUG_PIN_ON;
 321  0067 72165005      	bset	20485,#3
 322                     ; 187           if(FLAG_fall_edge)
 324  006b 3d16          	tnz	L31_FLAG_fall_edge
 325  006d 27f4          	jreq	L731
 326                     ; 189             if(cap_fall <= RF_STARTTIME_HIGH && cap_fall >= RF_STARTTIME_LOW)
 328  006f be9b          	ldw	x,L7_cap_fall
 329  0071 a31f41        	cpw	x,#8001
 330  0074 24ed          	jruge	L731
 332  0076 a300c8        	cpw	x,#200
 333  0079 25e8          	jrult	L731
 334                     ; 192               rf_bittime = cap_fall >> 1;            // bit time is half of start time
 336  007b 8d900290      	callf	LC006
 337                     ; 195               RF_bits = 0;
 339  007f b727          	ld	L73_RF_bits,a
 340                     ; 196               RF_bytes = 0;
 342  0081 b728          	ld	L14_RF_bytes,a
 343                     ; 197               RF_data = 0;
 345  0083 b729          	ld	L34_RF_data,a
 346                     ; 198               RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 348  0085 3503002a      	mov	_RF_waitstart_substate,#3
 349                     ; 199               if(idx < RF_REC_LEN) rcv_buff[0] = cap_fall;
 351  0089 b624          	ld	a,_idx
 352  008b a14d          	cp	a,#77
 353  008d 24d4          	jruge	L731
 356  008f be9b          	ldw	x,L7_cap_fall
 357  0091 bf01          	ldw	_rcv_buff,x
 358  0093 ac780278      	jra	L731
 359  0097               L17:
 360                     ; 206           DEBUG_PIN_ON;
 362  0097 72165005      	bset	20485,#3
 363                     ; 207           if(FLAG_rise_edge)
 365  009b b615          	ld	a,L11_FLAG_rise_edge
 366  009d 27f4          	jreq	L731
 367                     ; 209             rf_low_time = cap_rise-cap_fall;
 369  009f be9d          	ldw	x,L5_cap_rise
 370  00a1 72b0009b      	subw	x,L7_cap_fall
 371  00a5 bf1e          	ldw	L52_rf_low_time,x
 372                     ; 210             if(rf_low_time <= rf_bittime+rf_edges_jitter && rf_low_time >= rf_bittime-rf_edges_jitter)
 374  00a7 be18          	ldw	x,L71_rf_bittime
 375  00a9 72bb001c      	addw	x,L32_rf_edges_jitter
 376  00ad b31e          	cpw	x,L52_rf_low_time
 377  00af 2525          	jrult	L551
 379  00b1 be18          	ldw	x,L71_rf_bittime
 380  00b3 72b0001c      	subw	x,L32_rf_edges_jitter
 381  00b7 b31e          	cpw	x,L52_rf_low_time
 382  00b9 221b          	jrugt	L551
 383                     ; 213               RF_data |= 0x01;
 385  00bb 72100029      	bset	L34_RF_data,#0
 386                     ; 214               RF_bits++;
 388  00bf 3c27          	inc	L73_RF_bits
 389                     ; 215               RF_data <<= 1;
 391                     ; 216               rf_offset = 0;
 393  00c1 5f            	clrw	x
 394  00c2 3829          	sll	L34_RF_data
 395  00c4 bf22          	ldw	L13_rf_offset,x
 396                     ; 217               idx = 2;
 398  00c6 35020024      	mov	_idx,#2
 399                     ; 218               rcv_buff[1] = rf_low_time;
 401  00ca be1e          	ldw	x,L52_rf_low_time
 402  00cc bf03          	ldw	_rcv_buff+2,x
 403                     ; 219               RF_rcvState = RF_RCVSTATE_RECBITS;
 405  00ce 3501002b      	mov	L54_RF_rcvState,#1
 407  00d2 ac780278      	jra	L731
 408  00d6               L551:
 409                     ; 221             else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 411  00d6 be1a          	ldw	x,L12_rf_halfbittime
 412  00d8 72bb001c      	addw	x,L32_rf_edges_jitter
 413  00dc b31e          	cpw	x,L52_rf_low_time
 414  00de 251a          	jrult	L161
 416  00e0 be1a          	ldw	x,L12_rf_halfbittime
 417  00e2 72b0001c      	subw	x,L32_rf_edges_jitter
 418  00e6 b31e          	cpw	x,L52_rf_low_time
 419  00e8 2210          	jrugt	L161
 420                     ; 223               rf_offset = rf_low_time;
 422  00ea be1e          	ldw	x,L52_rf_low_time
 423  00ec bf22          	ldw	L13_rf_offset,x
 424                     ; 224               idx = 2;
 426  00ee 35020024      	mov	_idx,#2
 427                     ; 225               RF_rcvState = RF_RCVSTATE_RECBITS;
 429  00f2 3501002b      	mov	L54_RF_rcvState,#1
 431  00f6 ac780278      	jra	L731
 432  00fa               L161:
 433                     ; 230               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 435  00fa 3502002a      	mov	_RF_waitstart_substate,#2
 436  00fe ac780278      	jra	L731
 437                     ; 235         default: break;
 439                     ; 237       break;
 441  0102               L57:
 442                     ; 241       DEBUG_PIN_OFF;
 444  0102 72175005      	bres	20485,#3
 445                     ; 243       if(idx < RF_REC_LEN)
 447  0106 b624          	ld	a,_idx
 448  0108 a14d          	cp	a,#77
 449  010a 2425          	jruge	L561
 450                     ; 245         if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
 452  010c b615          	ld	a,L11_FLAG_rise_edge
 453  010e 2715          	jreq	L761
 456  0110 be9d          	ldw	x,L5_cap_rise
 457  0112 72b0009b      	subw	x,L7_cap_fall
 458  0116 b624          	ld	a,_idx
 459  0118 3c24          	inc	_idx
 460  011a 905f          	clrw	y
 461  011c 9097          	ld	yl,a
 462  011e 9058          	sllw	y
 463  0120 90ef01        	ldw	(_rcv_buff,y),x
 465  0123 200c          	jra	L561
 466  0125               L761:
 467                     ; 246         else rcv_buff[idx++] = cap_fall;
 469  0125 b624          	ld	a,_idx
 470  0127 3c24          	inc	_idx
 471  0129 5f            	clrw	x
 472  012a 97            	ld	xl,a
 473  012b 58            	sllw	x
 474  012c 90be9b        	ldw	y,L7_cap_fall
 475  012f ef01          	ldw	(_rcv_buff,x),y
 476  0131               L561:
 477                     ; 251       if(FLAG_rise_edge)
 479  0131 b615          	ld	a,L11_FLAG_rise_edge
 480  0133 2604acc701c7  	jreq	L371
 481                     ; 253         rf_low_time = cap_rise-cap_fall;
 483  0139 be9d          	ldw	x,L5_cap_rise
 484  013b 72b0009b      	subw	x,L7_cap_fall
 485  013f bf1e          	ldw	L52_rf_low_time,x
 486                     ; 254         if(rf_low_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_low_time+rf_offset >= rf_bittime-rf_edges_jitter)
 488  0141 8dad02ad      	callf	LC008
 489  0145 2260          	jrugt	L571
 491  0147 8dbe02be      	callf	LC009
 492  014b 255a          	jrult	L571
 493                     ; 256           rf_bittime = ((rf_low_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 495  014d 72bb0018      	addw	x,L71_rf_bittime
 496  0151 8d900290      	callf	LC006
 497                     ; 260           RF_data |= 0x01;
 499  0155 72100029      	bset	L34_RF_data,#0
 500                     ; 261           RF_bits++;
 502  0159 3c27          	inc	L73_RF_bits
 503                     ; 262           if(RF_bits < 8) RF_data <<= 1;
 505  015b b627          	ld	a,L73_RF_bits
 506  015d a108          	cp	a,#8
 507  015f 2402          	jruge	L771
 510  0161 3829          	sll	L34_RF_data
 511  0163               L771:
 512                     ; 263           if(RF_bits == 8)
 514  0163 a108          	cp	a,#8
 515  0165 2704ac330233  	jrne	L732
 516                     ; 266             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 518  016b 8d9a029a      	callf	LC007
 519  016f 260d          	jrne	L302
 520                     ; 271               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 522  0171 bea0          	ldw	x,_RcvRFmsg
 523  0173 a3a55a        	cpw	x,#42330
 524  0176 2706          	jreq	L302
 525                     ; 274                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 527  0178 3502002a      	mov	_RF_waitstart_substate,#2
 528                     ; 275                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 530  017c 3f2b          	clr	L54_RF_rcvState
 531  017e               L302:
 532                     ; 278             if(RF_bytes == RFSEND_DATALEN) 
 534  017e a105          	cp	a,#5
 535  0180 26e5          	jrne	L732
 536                     ; 280               RFrcvChksum = 0;
 538  0182 3f00          	clr	L33_RFrcvChksum
 539                     ; 281               for(i=0;i<RFSEND_DATALEN-1;i++)
 541  0184 4f            	clr	a
 542  0185 6b01          	ld	(OFST+0,sp),a
 543  0187               L112:
 544                     ; 283                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 546  0187 5f            	clrw	x
 547  0188 97            	ld	xl,a
 548  0189 b600          	ld	a,L33_RFrcvChksum
 549  018b eba0          	add	a,(_RcvRFmsg,x)
 550  018d b700          	ld	L33_RFrcvChksum,a
 551                     ; 281               for(i=0;i<RFSEND_DATALEN-1;i++)
 553  018f 0c01          	inc	(OFST+0,sp)
 556  0191 7b01          	ld	a,(OFST+0,sp)
 557  0193 a104          	cp	a,#4
 558  0195 25f0          	jrult	L112
 559                     ; 285               RFrcvChksum = (u8)(~RFrcvChksum);
 561  0197 3300          	cpl	L33_RFrcvChksum
 562                     ; 286               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 564  0199 b6a4          	ld	a,_RcvRFmsg+4
 565  019b b100          	cp	a,L33_RFrcvChksum
 566  019d 2704ac2d022d  	jrne	L552
 567                     ; 288                 RFbytesReady = TRUE;  // set new RF data available flag
 568                     ; 290               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 569                     ; 291               RF_rcvState = RF_RCVSTATE_WAITSTART;
 570                     ; 294           rf_offset = 0;
 572  01a3 ac290229      	jpf	LC005
 573  01a7               L571:
 574                     ; 296         else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 576  01a7 be1a          	ldw	x,L12_rf_halfbittime
 577  01a9 72bb001c      	addw	x,L32_rf_edges_jitter
 578  01ad b31e          	cpw	x,L52_rf_low_time
 579  01af 250e          	jrult	L322
 581  01b1 be1a          	ldw	x,L12_rf_halfbittime
 582  01b3 72b0001c      	subw	x,L32_rf_edges_jitter
 583  01b7 b31e          	cpw	x,L52_rf_low_time
 584  01b9 2204          	jrugt	L322
 585                     ; 298           rf_offset = rf_low_time;
 587  01bb be1e          	ldw	x,L52_rf_low_time
 589  01bd 2075          	jpf	LC002
 590  01bf               L322:
 591                     ; 302           RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 593  01bf 3502002a      	mov	_RF_waitstart_substate,#2
 594                     ; 303           RF_rcvState = RF_RCVSTATE_WAITSTART;
 595  01c3 ac760276      	jpf	LC001
 596  01c7               L371:
 597                     ; 306       else if(FLAG_fall_edge)
 599  01c7 b616          	ld	a,L31_FLAG_fall_edge
 600  01c9 2604ac780278  	jreq	L731
 601                     ; 308         rf_high_time = cap_fall;
 603  01cf be9b          	ldw	x,L7_cap_fall
 604  01d1 bf20          	ldw	L72_rf_high_time,x
 605                     ; 309         if(rf_high_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_high_time+rf_offset >= rf_bittime-rf_edges_jitter)
 607  01d3 8dad02ad      	callf	LC008
 608  01d7 225f          	jrugt	L332
 610  01d9 8dbe02be      	callf	LC009
 611  01dd 2559          	jrult	L332
 612                     ; 311           rf_bittime = ((rf_high_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 614  01df 72bb0018      	addw	x,L71_rf_bittime
 615  01e3 8d900290      	callf	LC006
 616                     ; 315           RF_bits++;
 618  01e7 3c27          	inc	L73_RF_bits
 619                     ; 316           if(RF_bits < 8) RF_data <<= 1;
 621  01e9 b627          	ld	a,L73_RF_bits
 622  01eb a108          	cp	a,#8
 623  01ed 2402          	jruge	L532
 626  01ef 3829          	sll	L34_RF_data
 627  01f1               L532:
 628                     ; 317           if(RF_bits == 8)
 630  01f1 a108          	cp	a,#8
 631  01f3 263e          	jrne	L732
 632                     ; 320             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 634  01f5 8d9a029a      	callf	LC007
 635  01f9 260d          	jrne	L142
 636                     ; 325               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 638  01fb bea0          	ldw	x,_RcvRFmsg
 639  01fd a3a55a        	cpw	x,#42330
 640  0200 2706          	jreq	L142
 641                     ; 328                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 643  0202 3502002a      	mov	_RF_waitstart_substate,#2
 644                     ; 329                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 646  0206 3f2b          	clr	L54_RF_rcvState
 647  0208               L142:
 648                     ; 332             if(RF_bytes == RFSEND_DATALEN) 
 650  0208 a105          	cp	a,#5
 651  020a 2627          	jrne	L732
 652                     ; 334               RFrcvChksum = 0;
 654  020c 3f00          	clr	L33_RFrcvChksum
 655                     ; 335               for(i=0;i<RFSEND_DATALEN-1;i++)
 657  020e 4f            	clr	a
 658  020f 6b01          	ld	(OFST+0,sp),a
 659  0211               L742:
 660                     ; 337                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 662  0211 5f            	clrw	x
 663  0212 97            	ld	xl,a
 664  0213 b600          	ld	a,L33_RFrcvChksum
 665  0215 eba0          	add	a,(_RcvRFmsg,x)
 666  0217 b700          	ld	L33_RFrcvChksum,a
 667                     ; 335               for(i=0;i<RFSEND_DATALEN-1;i++)
 669  0219 0c01          	inc	(OFST+0,sp)
 672  021b 7b01          	ld	a,(OFST+0,sp)
 673  021d a104          	cp	a,#4
 674  021f 25f0          	jrult	L742
 675                     ; 339               RFrcvChksum = (u8)(~RFrcvChksum);
 677  0221 3300          	cpl	L33_RFrcvChksum
 678                     ; 340               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 680  0223 b6a4          	ld	a,_RcvRFmsg+4
 681  0225 b100          	cp	a,L33_RFrcvChksum
 682  0227 2604          	jrne	L552
 683                     ; 342                 RFbytesReady = TRUE;  // set new RF data available flag
 685  0229               LC005:
 687  0229 35010025      	mov	_RFbytesReady,#1
 688  022d               L552:
 689                     ; 344               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 691                     ; 345               RF_rcvState = RF_RCVSTATE_WAITSTART;
 694  022d 3502002a      	mov	_RF_waitstart_substate,#2
 696  0231 3f2b          	clr	L54_RF_rcvState
 697  0233               L732:
 698                     ; 348           rf_offset = 0;
 701  0233 5f            	clrw	x
 702  0234               LC002:
 703  0234 bf22          	ldw	L13_rf_offset,x
 705  0236 2040          	jra	L731
 706  0238               L332:
 707                     ; 350         else if(rf_high_time <= rf_halfbittime+rf_edges_jitter && rf_high_time >= rf_halfbittime-rf_edges_jitter)
 709  0238 be1a          	ldw	x,L12_rf_halfbittime
 710  023a 72bb001c      	addw	x,L32_rf_edges_jitter
 711  023e b320          	cpw	x,L72_rf_high_time
 712  0240 250e          	jrult	L162
 714  0242 be1a          	ldw	x,L12_rf_halfbittime
 715  0244 72b0001c      	subw	x,L32_rf_edges_jitter
 716  0248 b320          	cpw	x,L72_rf_high_time
 717  024a 2204          	jrugt	L162
 718                     ; 352           rf_offset = rf_high_time;
 720  024c be20          	ldw	x,L72_rf_high_time
 722  024e 20e4          	jpf	LC002
 723  0250               L162:
 724                     ; 354         else if(rf_high_time <= RF_STARTTIME_HIGH && rf_high_time >= RF_STARTTIME_LOW)
 726  0250 be20          	ldw	x,L72_rf_high_time
 727  0252 a31f41        	cpw	x,#8001
 728  0255 2421          	jruge	L731
 730  0257 a300c8        	cpw	x,#200
 731  025a 251c          	jrult	L731
 732                     ; 357           rf_bittime = cap_fall >> 1;            // bit time is half of start time
 734  025c be9b          	ldw	x,L7_cap_fall
 735  025e 8d900290      	callf	LC006
 736                     ; 360           RF_bits = 0;
 738  0262 3f27          	clr	L73_RF_bits
 739                     ; 361           RF_bytes = 0;
 741  0264 3f28          	clr	L14_RF_bytes
 742                     ; 362           RF_data = 0;
 744  0266 3f29          	clr	L34_RF_data
 745                     ; 363           if(idx < RF_REC_LEN)
 747  0268 b624          	ld	a,_idx
 748  026a a14d          	cp	a,#77
 749  026c 2404          	jruge	L762
 750                     ; 364           rcv_buff[0] = cap_fall;
 752  026e be9b          	ldw	x,L7_cap_fall
 753  0270 bf01          	ldw	_rcv_buff,x
 754  0272               L762:
 755                     ; 365           RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 757  0272 3503002a      	mov	_RF_waitstart_substate,#3
 758                     ; 366           RF_rcvState = RF_RCVSTATE_WAITSTART;
 760  0276               LC001:
 762  0276 3f2b          	clr	L54_RF_rcvState
 763                     ; 371     default: break;
 765  0278               L731:
 766                     ; 373   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 768  0278 a602          	ld	a,#2
 769  027a cd0000        	call	_TIM3_ClearITPendingBit
 771                     ; 374   TIM3_ClearITPendingBit(TIM3_IT_CC2);
 773  027d a604          	ld	a,#4
 774  027f cd0000        	call	_TIM3_ClearITPendingBit
 776                     ; 375 }
 779  0282 84            	pop	a
 780  0283 85            	popw	x
 781  0284 bf00          	ldw	c_y,x
 782  0286 320002        	pop	c_y+2
 783  0289 85            	popw	x
 784  028a bf00          	ldw	c_x,x
 785  028c 320002        	pop	c_x+2
 786  028f 80            	iret	
 787  0290               LC006:
 788  0290 54            	srlw	x
 789  0291 bf18          	ldw	L71_rf_bittime,x
 790                     ; 193               rf_halfbittime = rf_bittime >> 1;      // half of bit time
 792  0293 54            	srlw	x
 793  0294 bf1a          	ldw	L12_rf_halfbittime,x
 794                     ; 194               rf_edges_jitter = rf_halfbittime >> 1; // maximum accepted edges jitter is a quarter bit time
 796  0296 54            	srlw	x
 797  0297 bf1c          	ldw	L32_rf_edges_jitter,x
 798  0299 87            	retf	
 799  029a               LC007:
 800  029a b628          	ld	a,L14_RF_bytes
 801  029c 3c28          	inc	L14_RF_bytes
 802  029e 5f            	clrw	x
 803  029f 97            	ld	xl,a
 804  02a0 b629          	ld	a,L34_RF_data
 805  02a2 e7a0          	ld	(_RcvRFmsg,x),a
 806                     ; 267             RF_bits = 0;
 808  02a4 3f27          	clr	L73_RF_bits
 809                     ; 268             RF_data = 0;
 811  02a6 3f29          	clr	L34_RF_data
 812                     ; 269             if(RF_bytes == 2)
 814  02a8 b628          	ld	a,L14_RF_bytes
 815  02aa a102          	cp	a,#2
 816  02ac 87            	retf	
 817  02ad               LC008:
 818  02ad 90be18        	ldw	y,L71_rf_bittime
 819  02b0 72bb0022      	addw	x,L13_rf_offset
 820  02b4 72b9001c      	addw	y,L32_rf_edges_jitter
 821  02b8 90bf00        	ldw	c_y,y
 822  02bb b300          	cpw	x,c_y
 823  02bd 87            	retf	
 824  02be               LC009:
 825  02be 90be18        	ldw	y,L71_rf_bittime
 826  02c1 72b2001c      	subw	y,L32_rf_edges_jitter
 827  02c5 90bf00        	ldw	c_y,y
 828  02c8 b300          	cpw	x,c_y
 829  02ca 87            	retf	
 889                     ; 382 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)  // every 1ms
 889                     ; 383 {
 890                     .text:	section	.text,new
 891  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 893  0000 8a            	push	cc
 894  0001 84            	pop	a
 895  0002 a4bf          	and	a,#191
 896  0004 88            	push	a
 897  0005 86            	pop	cc
 898  0006 3b0002        	push	c_x+2
 899  0009 be00          	ldw	x,c_x
 900  000b 89            	pushw	x
 901  000c 3b0002        	push	c_y+2
 902  000f be00          	ldw	x,c_y
 903  0011 89            	pushw	x
 906                     ; 387   interrupt_status = 1;
 908  0012 3501009f      	mov	L3_interrupt_status,#1
 909                     ; 388   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
 911  0016 a601          	ld	a,#1
 912  0018 cd0000        	call	_TIM2_GetITStatus
 914  001b 4d            	tnz	a
 915  001c 2604acb001b0  	jreq	L103
 916                     ; 391     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
 918  0022 be00          	ldw	x,_cnt_flag_250ms
 919  0024 a3ffff        	cpw	x,#65535
 920  0027 2403          	jruge	L303
 923  0029 5c            	incw	x
 924  002a bf00          	ldw	_cnt_flag_250ms,x
 925  002c               L303:
 926                     ; 392     if(cnt_flag_250ms >= CNTVAL_250MS) 
 928  002c a300fa        	cpw	x,#250
 929  002f 2507          	jrult	L503
 930                     ; 394       cnt_flag_250ms = 0;
 932  0031 5f            	clrw	x
 933  0032 bf00          	ldw	_cnt_flag_250ms,x
 934                     ; 395       FLAG_250ms = TRUE;
 936  0034 72100000      	bset	_FLAG_250ms
 937  0038               L503:
 938                     ; 397     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
 940  0038 be02          	ldw	x,_cnt_flag_500ms
 941  003a a3ffff        	cpw	x,#65535
 942  003d 2403          	jruge	L703
 945  003f 5c            	incw	x
 946  0040 bf02          	ldw	_cnt_flag_500ms,x
 947  0042               L703:
 948                     ; 398     if(cnt_flag_500ms >= CNTVAL_500MS) 
 950  0042 a301f4        	cpw	x,#500
 951  0045 2507          	jrult	L113
 952                     ; 400       cnt_flag_500ms = 0;
 954  0047 5f            	clrw	x
 955  0048 bf02          	ldw	_cnt_flag_500ms,x
 956                     ; 401       FLAG_500ms = TRUE;
 958  004a 72100001      	bset	_FLAG_500ms
 959  004e               L113:
 960                     ; 403     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
 962  004e be04          	ldw	x,_cnt_flag_1000ms
 963  0050 a3ffff        	cpw	x,#65535
 964  0053 2403          	jruge	L313
 967  0055 5c            	incw	x
 968  0056 bf04          	ldw	_cnt_flag_1000ms,x
 969  0058               L313:
 970                     ; 404     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
 972  0058 a303e8        	cpw	x,#1000
 973  005b 2507          	jrult	L513
 974                     ; 406       cnt_flag_1000ms = 0;
 976  005d 5f            	clrw	x
 977  005e bf04          	ldw	_cnt_flag_1000ms,x
 978                     ; 407       FLAG_1000ms = TRUE;
 980  0060 72100002      	bset	_FLAG_1000ms
 981  0064               L513:
 982                     ; 410     if(!Timeout_istout1)
 984  0064 720000000d    	btjt	_Timeout_istout1,L713
 985                     ; 412       Timeout_toutcnt1++;
 987  0069 be00          	ldw	x,_Timeout_toutcnt1
 988  006b 5c            	incw	x
 989  006c bf00          	ldw	_Timeout_toutcnt1,x
 990                     ; 413       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 992  006e b300          	cpw	x,_Timeout_tout1
 993  0070 2504          	jrult	L713
 996  0072 72100000      	bset	_Timeout_istout1
 997  0076               L713:
 998                     ; 415     if(!Timeout_istout2)
1000  0076 720000000d    	btjt	_Timeout_istout2,L323
1001                     ; 417       Timeout_toutcnt2++;
1003  007b be00          	ldw	x,_Timeout_toutcnt2
1004  007d 5c            	incw	x
1005  007e bf00          	ldw	_Timeout_toutcnt2,x
1006                     ; 418       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1008  0080 b300          	cpw	x,_Timeout_tout2
1009  0082 2504          	jrult	L323
1012  0084 72100000      	bset	_Timeout_istout2
1013  0088               L323:
1014                     ; 420     if(!Timeout_istout3)
1016  0088 720000000d    	btjt	_Timeout_istout3,L723
1017                     ; 422       Timeout_toutcnt3++;
1019  008d be00          	ldw	x,_Timeout_toutcnt3
1020  008f 5c            	incw	x
1021  0090 bf00          	ldw	_Timeout_toutcnt3,x
1022                     ; 423       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1024  0092 b300          	cpw	x,_Timeout_tout3
1025  0094 2504          	jrult	L723
1028  0096 72100000      	bset	_Timeout_istout3
1029  009a               L723:
1030                     ; 426     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
1032  009a b626          	ld	a,L53_RFrcvTimeoutcnt
1033  009c a1ff          	cp	a,#255
1034  009e 2404          	jruge	L333
1037  00a0 3c26          	inc	L53_RFrcvTimeoutcnt
1038  00a2 b626          	ld	a,L53_RFrcvTimeoutcnt
1039  00a4               L333:
1040                     ; 427     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1042  00a4 a164          	cp	a,#100
1043  00a6 2506          	jrult	L533
1044                     ; 429       RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
1046  00a8 3502002a      	mov	_RF_waitstart_substate,#2
1047                     ; 430       RF_rcvState = RF_RCVSTATE_WAITSTART;
1049  00ac 3f2b          	clr	L54_RF_rcvState
1050  00ae               L533:
1051                     ; 434     if(!BTN1_STATE)
1053  00ae 7204500116    	btjt	20481,#2,L733
1054                     ; 436       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1056  00b3 b606          	ld	a,_btn1_0_cnt
1057  00b5 a1ff          	cp	a,#255
1058  00b7 2402          	jruge	L143
1061  00b9 3c06          	inc	_btn1_0_cnt
1062  00bb               L143:
1063                     ; 437       btn1_1_cnt = 0;
1065  00bb 3f07          	clr	_btn1_1_cnt
1066                     ; 438       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1068  00bd b606          	ld	a,_btn1_0_cnt
1069  00bf a11e          	cp	a,#30
1070  00c1 2518          	jrult	L543
1071                     ; 440         BTN1_DEB_STATE = BTN_PRESSED;
1073  00c3 35010008      	mov	_BTN1_DEB_STATE,#1
1074  00c7 2012          	jra	L543
1075  00c9               L733:
1076                     ; 445       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1078  00c9 b607          	ld	a,_btn1_1_cnt
1079  00cb a1ff          	cp	a,#255
1080  00cd 2402          	jruge	L743
1083  00cf 3c07          	inc	_btn1_1_cnt
1084  00d1               L743:
1085                     ; 446       btn1_0_cnt = 0;
1087  00d1 3f06          	clr	_btn1_0_cnt
1088                     ; 447       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1090  00d3 b607          	ld	a,_btn1_1_cnt
1091  00d5 a11e          	cp	a,#30
1092  00d7 2502          	jrult	L543
1093                     ; 449         BTN1_DEB_STATE = BTN_DEPRESSED;
1095  00d9 3f08          	clr	_BTN1_DEB_STATE
1096  00db               L543:
1097                     ; 455     if(BTN1_DEB_STATE == BTN_PRESSED)
1099  00db b608          	ld	a,_BTN1_DEB_STATE
1100  00dd 4a            	dec	a
1101  00de 260a          	jrne	L353
1102                     ; 457       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1104  00e0 be0a          	ldw	x,_BTN1_press_timer
1105  00e2 a3ffff        	cpw	x,#65535
1106  00e5 2403          	jruge	L353
1109  00e7 5c            	incw	x
1110  00e8 bf0a          	ldw	_BTN1_press_timer,x
1111  00ea               L353:
1112                     ; 460     if(!BTN1_DELAY_FLAG)
1114  00ea 720000030e    	btjt	_BTN1_DELAY_FLAG,L753
1115                     ; 462       btn1_delay_cnt++;
1117  00ef 3c09          	inc	_btn1_delay_cnt
1118                     ; 463       if(btn1_delay_cnt == BTN_DELAY)
1120  00f1 b609          	ld	a,_btn1_delay_cnt
1121  00f3 a196          	cp	a,#150
1122  00f5 2606          	jrne	L753
1123                     ; 465         btn1_delay_cnt = 0;
1125  00f7 3f09          	clr	_btn1_delay_cnt
1126                     ; 466         BTN1_DELAY_FLAG = TRUE;
1128  00f9 72100003      	bset	_BTN1_DELAY_FLAG
1129  00fd               L753:
1130                     ; 472     if(flag_blink_redLED)
1132  00fd 7201000550    	btjf	_flag_blink_redLED,L363
1133                     ; 474       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1135  0102 be0d          	ldw	x,_cnt_state_redLED
1136  0104 a3ffff        	cpw	x,#65535
1137  0107 2403          	jruge	L563
1140  0109 5c            	incw	x
1141  010a bf0d          	ldw	_cnt_state_redLED,x
1142  010c               L563:
1143                     ; 475       if(flag_blink_on_off)
1145  010c 7201000412    	btjf	_flag_blink_on_off,L763
1146                     ; 477         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1148  0111 a30032        	cpw	x,#50
1149  0114 253c          	jrult	L363
1150                     ; 479           flag_blink_on_off = FALSE;
1152  0116 72110004      	bres	_flag_blink_on_off
1153                     ; 480           cnt_state_redLED = 0;
1155  011a 5f            	clrw	x
1156  011b bf0d          	ldw	_cnt_state_redLED,x
1157                     ; 481           LED_OFF;
1159  011d 7217500a      	bres	20490,#3
1162  0121 202b          	jpf	LC010
1163  0123               L763:
1164                     ; 486         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1166  0123 a300c8        	cpw	x,#200
1167  0126 252a          	jrult	L363
1168                     ; 488           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1170  0128 b611          	ld	a,_cnt_blink_redLED
1171  012a a1ff          	cp	a,#255
1172  012c 2402          	jruge	L773
1175  012e 3c11          	inc	_cnt_blink_redLED
1176  0130               L773:
1177                     ; 489           flag_blink_on_off = TRUE;
1179  0130 72100004      	bset	_flag_blink_on_off
1180                     ; 490           cnt_state_redLED = 0;
1182  0134 5f            	clrw	x
1183  0135 bf0d          	ldw	_cnt_state_redLED,x
1184                     ; 491           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1186  0137 b611          	ld	a,_cnt_blink_redLED
1187  0139 b113          	cp	a,_blink_redLED_times
1188  013b 250d          	jrult	L104
1190  013d 7200000708    	btjt	_flag_blink_unlimited,L104
1191                     ; 493             flag_blink_redLED = FALSE;
1193  0142 72110005      	bres	_flag_blink_redLED
1194                     ; 494             cnt_blink_redLED = 0;
1196  0146 3f11          	clr	_cnt_blink_redLED
1198  0148 2008          	jra	L363
1199  014a               L104:
1200                     ; 498             LED_RED_ON;
1202  014a 7216500a      	bset	20490,#3
1205  014e               LC010:
1207  014e 7219500a      	bres	20490,#4
1209  0152               L363:
1210                     ; 503     if(flag_blink_greenLED)
1212  0152 7201000654    	btjf	_flag_blink_greenLED,L504
1213                     ; 505       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1215  0157 be0f          	ldw	x,_cnt_state_greenLED
1216  0159 a3ffff        	cpw	x,#65535
1217  015c 2403          	jruge	L704
1220  015e 5c            	incw	x
1221  015f bf0f          	ldw	_cnt_state_greenLED,x
1222  0161               L704:
1223                     ; 506       if(flag_blink_on_off)
1225  0161 7201000416    	btjf	_flag_blink_on_off,L114
1226                     ; 508         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1228  0166 a30032        	cpw	x,#50
1229  0169 2540          	jrult	L504
1230                     ; 510           flag_blink_on_off = FALSE;
1232  016b 72110004      	bres	_flag_blink_on_off
1233                     ; 511           cnt_state_greenLED = 0;
1235  016f 5f            	clrw	x
1236  0170 bf0f          	ldw	_cnt_state_greenLED,x
1237                     ; 512           LED_OFF;
1239  0172 7217500a      	bres	20490,#3
1242  0176 7219500a      	bres	20490,#4
1244  017a 202f          	jra	L504
1245  017c               L114:
1246                     ; 517         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1248  017c a300c8        	cpw	x,#200
1249  017f 252a          	jrult	L504
1250                     ; 519           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1252  0181 b612          	ld	a,_cnt_blink_greenLED
1253  0183 a1ff          	cp	a,#255
1254  0185 2402          	jruge	L124
1257  0187 3c12          	inc	_cnt_blink_greenLED
1258  0189               L124:
1259                     ; 520           flag_blink_on_off = TRUE;
1261  0189 72100004      	bset	_flag_blink_on_off
1262                     ; 521           cnt_state_greenLED = 0;
1264  018d 5f            	clrw	x
1265  018e bf0f          	ldw	_cnt_state_greenLED,x
1266                     ; 522           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1268  0190 b612          	ld	a,_cnt_blink_greenLED
1269  0192 b114          	cp	a,_blink_greenLED_times
1270  0194 250d          	jrult	L324
1272  0196 7200000708    	btjt	_flag_blink_unlimited,L324
1273                     ; 524             flag_blink_greenLED = FALSE;
1275  019b 72110006      	bres	_flag_blink_greenLED
1276                     ; 525             cnt_blink_greenLED = 0;
1278  019f 3f12          	clr	_cnt_blink_greenLED
1280  01a1 2008          	jra	L504
1281  01a3               L324:
1282                     ; 529             LED_GREEN_ON;
1284  01a3 7217500a      	bres	20490,#3
1287  01a7 7218500a      	bset	20490,#4
1289  01ab               L504:
1290                     ; 535     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
1292  01ab a601          	ld	a,#1
1293  01ad cd0000        	call	_TIM2_ClearITPendingBit
1295  01b0               L103:
1296                     ; 537   interrupt_status = 0;
1298  01b0 3f9f          	clr	L3_interrupt_status
1299                     ; 538 }
1302  01b2 85            	popw	x
1303  01b3 bf00          	ldw	c_y,x
1304  01b5 320002        	pop	c_y+2
1305  01b8 85            	popw	x
1306  01b9 bf00          	ldw	c_x,x
1307  01bb 320002        	pop	c_x+2
1308  01be 80            	iret	
1331                     ; 545 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1331                     ; 546 {
1332                     .text:	section	.text,new
1333  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1337                     ; 550 }
1340  0000 80            	iret	
1362                     ; 557 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
1362                     ; 558 {
1363                     .text:	section	.text,new
1364  0000               f_TRAP_IRQHandler:
1368                     ; 562 }
1371  0000 80            	iret	
1393                     ; 569 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
1393                     ; 570 {
1394                     .text:	section	.text,new
1395  0000               f_FLASH_IRQHandler:
1399                     ; 574 }
1402  0000 80            	iret	
1424                     ; 581 INTERRUPT_HANDLER(AWU_IRQHandler,4)
1424                     ; 582 {
1425                     .text:	section	.text,new
1426  0000               f_AWU_IRQHandler:
1430                     ; 586 }
1433  0000 80            	iret	
1455                     ; 593 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
1455                     ; 594 {
1456                     .text:	section	.text,new
1457  0000               f_EXTIB_IRQHandler:
1461                     ; 598 }
1464  0000 80            	iret	
1486                     ; 605 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
1486                     ; 606 {
1487                     .text:	section	.text,new
1488  0000               f_EXTID_IRQHandler:
1492                     ; 610 }
1495  0000 80            	iret	
1517                     ; 617 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
1517                     ; 618 {
1518                     .text:	section	.text,new
1519  0000               f_EXTI0_IRQHandler:
1523                     ; 622 }
1526  0000 80            	iret	
1548                     ; 629 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
1548                     ; 630 {
1549                     .text:	section	.text,new
1550  0000               f_EXTI1_IRQHandler:
1554                     ; 634 }
1557  0000 80            	iret	
1579                     ; 641 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
1579                     ; 642 {
1580                     .text:	section	.text,new
1581  0000               f_EXTI2_IRQHandler:
1585                     ; 646 }
1588  0000 80            	iret	
1610                     ; 653 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
1610                     ; 654 {
1611                     .text:	section	.text,new
1612  0000               f_EXTI3_IRQHandler:
1616                     ; 658 }
1619  0000 80            	iret	
1641                     ; 665 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1641                     ; 666 {
1642                     .text:	section	.text,new
1643  0000               f_EXTI4_IRQHandler:
1647                     ; 670 }
1650  0000 80            	iret	
1672                     ; 677 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1672                     ; 678 {
1673                     .text:	section	.text,new
1674  0000               f_EXTI5_IRQHandler:
1678                     ; 682 }
1681  0000 80            	iret	
1703                     ; 689 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1703                     ; 690 {
1704                     .text:	section	.text,new
1705  0000               f_EXTI6_IRQHandler:
1709                     ; 694 }
1712  0000 80            	iret	
1734                     ; 701 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1734                     ; 702 {
1735                     .text:	section	.text,new
1736  0000               f_EXTI7_IRQHandler:
1740                     ; 706 }
1743  0000 80            	iret	
1765                     ; 713 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1765                     ; 714 {
1766                     .text:	section	.text,new
1767  0000               f_COMP_IRQHandler:
1771                     ; 718 }
1774  0000 80            	iret	
1797                     ; 725 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1797                     ; 726 {
1798                     .text:	section	.text,new
1799  0000               f_TIM2_CAP_IRQHandler:
1803                     ; 730 }
1806  0000 80            	iret	
1829                     ; 737 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1829                     ; 738 {
1830                     .text:	section	.text,new
1831  0000               f_TIM4_UPD_OVF_IRQHandler:
1835                     ; 742 }
1838  0000 80            	iret	
1860                     ; 749 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1860                     ; 750 {
1861                     .text:	section	.text,new
1862  0000               f_SPI_IRQHandler:
1866                     ; 754 }
1869  0000 80            	iret	
1892                     ; 760 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1892                     ; 761 {
1893                     .text:	section	.text,new
1894  0000               f_USART_TX_IRQHandler:
1898                     ; 765 }
1901  0000 80            	iret	
1924                     ; 772 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1924                     ; 773 {
1925                     .text:	section	.text,new
1926  0000               f_USART_RX_IRQHandler:
1930                     ; 777 }
1933  0000 80            	iret	
1955                     ; 785 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1955                     ; 786 {
1956                     .text:	section	.text,new
1957  0000               f_I2C_IRQHandler:
1961                     ; 790 }
1964  0000 80            	iret	
2524                     	xdef	_FLAG_UART_cmd_rcv
2525                     	xdef	_RF_waitstart_substate
2526                     	switch	.ubsct
2527  0000               L33_RFrcvChksum:
2528  0000 00            	ds.b	1
2529                     	xdef	_idx
2530  0001               _rcv_buff:
2531  0001 000000000000  	ds.b	154
2532                     	xdef	_rcv_buff
2533  009b               L7_cap_fall:
2534  009b 0000          	ds.b	2
2535  009d               L5_cap_rise:
2536  009d 0000          	ds.b	2
2537                     	xdef	_cnt_blink_greenLED
2538                     	xdef	_cnt_blink_redLED
2539                     	xdef	_debug
2540  009f               L3_interrupt_status:
2541  009f 00            	ds.b	1
2542                     	xref.b	_Timeout_tout3
2543                     	xref.b	_Timeout_tout2
2544                     	xref.b	_Timeout_tout1
2545                     	xref.b	_Timeout_toutcnt3
2546                     	xref.b	_Timeout_toutcnt2
2547                     	xref.b	_Timeout_toutcnt1
2548                     	xbit	_Timeout_istout3
2549                     	xbit	_Timeout_istout2
2550                     	xbit	_Timeout_istout1
2551                     	xdef	_btn1_delay_cnt
2552                     	xdef	_btn1_1_cnt
2553                     	xdef	_btn1_0_cnt
2554                     	xdef	_cnt_flag_1000ms
2555                     	xdef	_cnt_flag_500ms
2556                     	xdef	_cnt_flag_250ms
2557                     	xdef	f_I2C_IRQHandler
2558                     	xdef	f_USART_RX_IRQHandler
2559                     	xdef	f_USART_TX_IRQHandler
2560                     	xdef	f_SPI_IRQHandler
2561                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2562                     	xdef	f_TIM3_CAP_IRQHandler
2563                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2564                     	xdef	f_TIM2_CAP_IRQHandler
2565                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2566                     	xdef	f_COMP_IRQHandler
2567                     	xdef	f_EXTI7_IRQHandler
2568                     	xdef	f_EXTI6_IRQHandler
2569                     	xdef	f_EXTI5_IRQHandler
2570                     	xdef	f_EXTI4_IRQHandler
2571                     	xdef	f_EXTI3_IRQHandler
2572                     	xdef	f_EXTI2_IRQHandler
2573                     	xdef	f_EXTI1_IRQHandler
2574                     	xdef	f_EXTI0_IRQHandler
2575                     	xdef	f_EXTID_IRQHandler
2576                     	xdef	f_EXTIB_IRQHandler
2577                     	xdef	f_AWU_IRQHandler
2578                     	xdef	f_FLASH_IRQHandler
2579                     	xdef	f_TRAP_IRQHandler
2580                     	xdef	f_NonHandledInterrupt
2581                     	xdef	_RFbytesReady
2582  00a0               _RcvRFmsg:
2583  00a0 0000000000    	ds.b	5
2584                     	xdef	_RcvRFmsg
2585                     	xdef	_flag_blink_unlimited
2586                     	xdef	_flag_blink_greenLED
2587                     	xdef	_flag_blink_redLED
2588                     	xdef	_flag_blink_on_off
2589                     	xdef	_cnt_state_greenLED
2590                     	xdef	_cnt_state_redLED
2591                     	xdef	_blink_greenLED_times
2592                     	xdef	_blink_redLED_times
2593                     	xdef	_FLAG_1000ms
2594                     	xdef	_FLAG_500ms
2595                     	xdef	_FLAG_250ms
2596                     	xdef	_BTN1_press_timer
2597                     	xdef	_BTN1_DELAY_FLAG
2598                     	xdef	_BTN1_DEB_STATE
2599                     	xref	_TIM3_ClearITPendingBit
2600                     	xref	_TIM3_GetITStatus
2601                     	xref	_TIM3_GetCapture2
2602                     	xref	_TIM3_GetCapture1
2603                     	xref	_TIM2_ClearITPendingBit
2604                     	xref	_TIM2_GetITStatus
2605                     	xref.b	c_x
2606                     	xref.b	c_y
2626                     	end
