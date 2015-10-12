   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .bit:	section	.data,bit
  22  0000               _FLAG_500ms:
  23  0000 00            	dc.b	0
  24                     	bsct
  25  0000               _cnt_flag_500ms:
  26  0000 0000          	dc.w	0
  27                     	switch	.bit
  28  0001               _FLAG_1000ms:
  29  0001 00            	dc.b	0
  30                     	bsct
  31  0002               _cnt_flag_1000ms:
  32  0002 0000          	dc.w	0
  33  0004               _btn1_0_cnt:
  34  0004 00            	dc.b	0
  35  0005               _btn1_1_cnt:
  36  0005 00            	dc.b	0
  37  0006               _BTN1_DEB_STATE:
  38  0006 00            	dc.b	0
  39                     	switch	.bit
  40  0002               _BTN1_DELAY_FLAG:
  41  0002 00            	dc.b	0
  42                     	bsct
  43  0007               _btn1_delay_cnt:
  44  0007 00            	dc.b	0
  45  0008               _BTN1_press_timer:
  46  0008 0000          	dc.w	0
  47  000a               _debug:
  48  000a 00            	dc.b	0
  49  000b               _cnt_state_redLED:
  50  000b 0000          	dc.w	0
  51  000d               _cnt_state_greenLED:
  52  000d 0000          	dc.w	0
  53  000f               _cnt_blink_redLED:
  54  000f 00            	dc.b	0
  55  0010               _cnt_blink_greenLED:
  56  0010 00            	dc.b	0
  57  0011               _blink_redLED_times:
  58  0011 00            	dc.b	0
  59  0012               _blink_greenLED_times:
  60  0012 00            	dc.b	0
  61                     	switch	.bit
  62  0003               _flag_blink_on_off:
  63  0003 01            	dc.b	1
  64  0004               _flag_blink_redLED:
  65  0004 00            	dc.b	0
  66  0005               _flag_blink_greenLED:
  67  0005 00            	dc.b	0
  68  0006               _flag_blink_unlimited:
  69  0006 01            	dc.b	1
  70                     	bsct
  71  0013               L11_FLAG_rise_edge:
  72  0013 00            	dc.b	0
  73  0014               L31_FLAG_fall_edge:
  74  0014 00            	dc.b	0
  75  0015               L51_FLAG_CC_Error:
  76  0015 00            	dc.b	0
  77  0016               L71_rf_bittime:
  78  0016 0000          	dc.w	0
  79  0018               L12_rf_halfbittime:
  80  0018 0000          	dc.w	0
  81  001a               L32_rf_edges_jitter:
  82  001a 0000          	dc.w	0
  83  001c               L52_rf_low_time:
  84  001c 0000          	dc.w	0
  85  001e               L72_rf_high_time:
  86  001e 0000          	dc.w	0
  87  0020               L13_rf_offset:
  88  0020 0000          	dc.w	0
  89  0022               _idx:
  90  0022 00            	dc.b	0
  91  0023               _RFbytesReady:
  92  0023 00            	dc.b	0
  93  0024               L53_RFrcvTimeoutcnt:
  94  0024 00            	dc.b	0
  95  0025               L73_RF_bits:
  96  0025 00            	dc.b	0
  97  0026               L14_RF_bytes:
  98  0026 00            	dc.b	0
  99  0027               L34_RF_data:
 100  0027 00            	dc.b	0
 101  0028               _RF_waitstart_substate:
 102  0028 02            	dc.b	2
 103  0029               L54_RF_rcvState:
 104  0029 00            	dc.b	0
 105                     	switch	.bit
 106  0007               _FLAG_UART_cmd_rcv:
 107  0007 00            	dc.b	0
 137                     ; 145 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 137                     ; 146 {
 138                     .text:	section	.text,new
 139  0000               f_NonHandledInterrupt:
 143                     ; 150 }
 146  0000 80            	iret	
 217                     ; 157 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 217                     ; 158 {
 218                     .text:	section	.text,new
 219  0000               f_TIM3_CAP_IRQHandler:
 221  0000 8a            	push	cc
 222  0001 84            	pop	a
 223  0002 a4bf          	and	a,#191
 224  0004 88            	push	a
 225  0005 86            	pop	cc
 226       00000001      OFST:	set	1
 227  0006 3b0002        	push	c_x+2
 228  0009 be00          	ldw	x,c_x
 229  000b 89            	pushw	x
 230  000c 3b0002        	push	c_y+2
 231  000f be00          	ldw	x,c_y
 232  0011 89            	pushw	x
 233  0012 88            	push	a
 236                     ; 166   RTMS_MEASURE_START(runtime_it_RFrcv);
 238  0013 8dc302c3      	callf	LC006
 241  0017 bf06          	ldw	_runtime_it_RFrcv+6,x
 242                     ; 168   if((u8)(TIM3->SR1 & (u8)TIM3_IT_CC1)) {
 245  0019 720352850b    	btjf	21125,#1,L721
 246                     ; 169     cap_rise = TIM3_GetCapture1();
 248  001e cd0000        	call	_TIM3_GetCapture1
 250  0021 bf67          	ldw	L5_cap_rise,x
 251                     ; 174     FLAG_rise_edge = TRUE;
 253  0023 35010013      	mov	L11_FLAG_rise_edge,#1
 255  0027 2002          	jra	L131
 256  0029               L721:
 257                     ; 176   else FLAG_rise_edge = FALSE;
 259  0029 3f13          	clr	L11_FLAG_rise_edge
 260  002b               L131:
 261                     ; 178   if((u8)(TIM3->SR1 & (u8)TIM3_IT_CC2)) {
 263  002b 720552850b    	btjf	21125,#2,L331
 264                     ; 179     cap_fall = TIM3_GetCapture2();
 266  0030 cd0000        	call	_TIM3_GetCapture2
 268  0033 bf65          	ldw	L7_cap_fall,x
 269                     ; 184     FLAG_fall_edge = TRUE;
 271  0035 35010014      	mov	L31_FLAG_fall_edge,#1
 273  0039 2002          	jra	L531
 274  003b               L331:
 275                     ; 186   else FLAG_fall_edge = FALSE;
 277  003b 3f14          	clr	L31_FLAG_fall_edge
 278  003d               L531:
 279                     ; 187   if(FLAG_rise_edge && FLAG_fall_edge) {
 281  003d b613          	ld	a,L11_FLAG_rise_edge
 282  003f 2708          	jreq	L731
 284  0041 b614          	ld	a,L31_FLAG_fall_edge
 285  0043 2704          	jreq	L731
 286                     ; 188     FLAG_CC_Error = TRUE;
 288  0045 35010015      	mov	L51_FLAG_CC_Error,#1
 289  0049               L731:
 290                     ; 191   RFrcvTimeoutcnt = 0;
 292  0049 3f24          	clr	L53_RFrcvTimeoutcnt
 293                     ; 192   switch(RF_rcvState)
 295  004b b629          	ld	a,L54_RF_rcvState
 297                     ; 385     default: break;
 298  004d 270b          	jreq	L17
 299  004f 4a            	dec	a
 300  0050 2604ac020102  	jreq	L101
 301  0056 ac780278      	jra	L341
 302  005a               L17:
 303                     ; 196       switch(RF_waitstart_substate)
 305  005a b628          	ld	a,_RF_waitstart_substate
 307                     ; 249         default: break;
 308  005c a002          	sub	a,#2
 309  005e 2707          	jreq	L37
 310  0060 4a            	dec	a
 311  0061 2734          	jreq	L57
 312  0063 ac780278      	jra	L341
 313  0067               L37:
 314                     ; 200           DEBUG_PIN_ON;
 316  0067 72165005      	bset	20485,#3
 317                     ; 201           if(FLAG_fall_edge)
 319  006b 3d14          	tnz	L31_FLAG_fall_edge
 320  006d 27f4          	jreq	L341
 321                     ; 203             if(cap_fall <= RF_STARTTIME_HIGH && cap_fall >= RF_STARTTIME_LOW)
 323  006f be65          	ldw	x,L7_cap_fall
 324  0071 a32711        	cpw	x,#10001
 325  0074 24ed          	jruge	L341
 327  0076 a300c8        	cpw	x,#200
 328  0079 25e8          	jrult	L341
 329                     ; 206               rf_bittime = cap_fall >> 1;            // bit time is half of start time
 331  007b 8dde02de      	callf	LC007
 332                     ; 209               RF_bits = 0;
 334  007f b725          	ld	L73_RF_bits,a
 335                     ; 210               RF_bytes = 0;
 337  0081 b726          	ld	L14_RF_bytes,a
 338                     ; 211               RF_data = 0;
 340  0083 b727          	ld	L34_RF_data,a
 341                     ; 212               RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 343  0085 35030028      	mov	_RF_waitstart_substate,#3
 344                     ; 213               if(idx < RF_REC_LEN) rcv_buff[0] = cap_fall;
 346  0089 b622          	ld	a,_idx
 347  008b a132          	cp	a,#50
 348  008d 24d4          	jruge	L341
 351  008f be65          	ldw	x,L7_cap_fall
 352  0091 bf01          	ldw	_rcv_buff,x
 353  0093 ac780278      	jra	L341
 354  0097               L57:
 355                     ; 220           DEBUG_PIN_ON;
 357  0097 72165005      	bset	20485,#3
 358                     ; 221           if(FLAG_rise_edge)
 360  009b b613          	ld	a,L11_FLAG_rise_edge
 361  009d 27f4          	jreq	L341
 362                     ; 223             rf_low_time = cap_rise-cap_fall;
 364  009f be67          	ldw	x,L5_cap_rise
 365  00a1 72b00065      	subw	x,L7_cap_fall
 366  00a5 bf1c          	ldw	L52_rf_low_time,x
 367                     ; 224             if(rf_low_time <= rf_bittime+rf_edges_jitter && rf_low_time >= rf_bittime-rf_edges_jitter)
 369  00a7 be16          	ldw	x,L71_rf_bittime
 370  00a9 72bb001a      	addw	x,L32_rf_edges_jitter
 371  00ad b31c          	cpw	x,L52_rf_low_time
 372  00af 2525          	jrult	L161
 374  00b1 be16          	ldw	x,L71_rf_bittime
 375  00b3 72b0001a      	subw	x,L32_rf_edges_jitter
 376  00b7 b31c          	cpw	x,L52_rf_low_time
 377  00b9 221b          	jrugt	L161
 378                     ; 227               RF_data |= 0x01;
 380  00bb 72100027      	bset	L34_RF_data,#0
 381                     ; 228               RF_bits++;
 383  00bf 3c25          	inc	L73_RF_bits
 384                     ; 229               RF_data <<= 1;
 386                     ; 230               rf_offset = 0;
 388  00c1 5f            	clrw	x
 389  00c2 3827          	sll	L34_RF_data
 390  00c4 bf20          	ldw	L13_rf_offset,x
 391                     ; 231               idx = 2;
 393  00c6 35020022      	mov	_idx,#2
 394                     ; 232               rcv_buff[1] = rf_low_time;
 396  00ca be1c          	ldw	x,L52_rf_low_time
 397  00cc bf03          	ldw	_rcv_buff+2,x
 398                     ; 233               RF_rcvState = RF_RCVSTATE_RECBITS;
 400  00ce 35010029      	mov	L54_RF_rcvState,#1
 402  00d2 ac780278      	jra	L341
 403  00d6               L161:
 404                     ; 235             else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 406  00d6 be18          	ldw	x,L12_rf_halfbittime
 407  00d8 72bb001a      	addw	x,L32_rf_edges_jitter
 408  00dc b31c          	cpw	x,L52_rf_low_time
 409  00de 251a          	jrult	L561
 411  00e0 be18          	ldw	x,L12_rf_halfbittime
 412  00e2 72b0001a      	subw	x,L32_rf_edges_jitter
 413  00e6 b31c          	cpw	x,L52_rf_low_time
 414  00e8 2210          	jrugt	L561
 415                     ; 237               rf_offset = rf_low_time;
 417  00ea be1c          	ldw	x,L52_rf_low_time
 418  00ec bf20          	ldw	L13_rf_offset,x
 419                     ; 238               idx = 2;
 421  00ee 35020022      	mov	_idx,#2
 422                     ; 239               RF_rcvState = RF_RCVSTATE_RECBITS;
 424  00f2 35010029      	mov	L54_RF_rcvState,#1
 426  00f6 ac780278      	jra	L341
 427  00fa               L561:
 428                     ; 244               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 430  00fa 35020028      	mov	_RF_waitstart_substate,#2
 431  00fe ac780278      	jra	L341
 432                     ; 249         default: break;
 434                     ; 251       break;
 436  0102               L101:
 437                     ; 255       DEBUG_PIN_OFF;
 439  0102 72175005      	bres	20485,#3
 440                     ; 257       if(idx < RF_REC_LEN)
 442  0106 b622          	ld	a,_idx
 443  0108 a132          	cp	a,#50
 444  010a 2425          	jruge	L171
 445                     ; 259         if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
 447  010c b613          	ld	a,L11_FLAG_rise_edge
 448  010e 2715          	jreq	L371
 451  0110 be67          	ldw	x,L5_cap_rise
 452  0112 72b00065      	subw	x,L7_cap_fall
 453  0116 b622          	ld	a,_idx
 454  0118 3c22          	inc	_idx
 455  011a 905f          	clrw	y
 456  011c 9097          	ld	yl,a
 457  011e 9058          	sllw	y
 458  0120 90ef01        	ldw	(_rcv_buff,y),x
 460  0123 200c          	jra	L171
 461  0125               L371:
 462                     ; 260         else rcv_buff[idx++] = cap_fall;
 464  0125 b622          	ld	a,_idx
 465  0127 3c22          	inc	_idx
 466  0129 5f            	clrw	x
 467  012a 97            	ld	xl,a
 468  012b 58            	sllw	x
 469  012c 90be65        	ldw	y,L7_cap_fall
 470  012f ef01          	ldw	(_rcv_buff,x),y
 471  0131               L171:
 472                     ; 265       if(FLAG_rise_edge)
 474  0131 b613          	ld	a,L11_FLAG_rise_edge
 475  0133 2604acc701c7  	jreq	L771
 476                     ; 267         rf_low_time = cap_rise-cap_fall;
 478  0139 be67          	ldw	x,L5_cap_rise
 479  013b 72b00065      	subw	x,L7_cap_fall
 480  013f bf1c          	ldw	L52_rf_low_time,x
 481                     ; 268         if(rf_low_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_low_time+rf_offset >= rf_bittime-rf_edges_jitter)
 483  0141 8dfb02fb      	callf	LC009
 484  0145 2260          	jrugt	L102
 486  0147 8d0c030c      	callf	LC010
 487  014b 255a          	jrult	L102
 488                     ; 270           rf_bittime = ((rf_low_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 490  014d 72bb0016      	addw	x,L71_rf_bittime
 491  0151 8dde02de      	callf	LC007
 492                     ; 274           RF_data |= 0x01;
 494  0155 72100027      	bset	L34_RF_data,#0
 495                     ; 275           RF_bits++;
 497  0159 3c25          	inc	L73_RF_bits
 498                     ; 276           if(RF_bits < 8) RF_data <<= 1;
 500  015b b625          	ld	a,L73_RF_bits
 501  015d a108          	cp	a,#8
 502  015f 2402          	jruge	L302
 505  0161 3827          	sll	L34_RF_data
 506  0163               L302:
 507                     ; 277           if(RF_bits == 8)
 509  0163 a108          	cp	a,#8
 510  0165 2704ac330233  	jrne	L342
 511                     ; 280             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 513  016b 8de802e8      	callf	LC008
 514  016f 260d          	jrne	L702
 515                     ; 285               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 517  0171 be6a          	ldw	x,_RcvRFmsg
 518  0173 a3a55a        	cpw	x,#42330
 519  0176 2706          	jreq	L702
 520                     ; 288                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 522  0178 35020028      	mov	_RF_waitstart_substate,#2
 523                     ; 289                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 525  017c 3f29          	clr	L54_RF_rcvState
 526  017e               L702:
 527                     ; 292             if(RF_bytes == RFSEND_DATALEN) 
 529  017e a105          	cp	a,#5
 530  0180 26e5          	jrne	L342
 531                     ; 294               RFrcvChksum = 0;
 533  0182 3f00          	clr	L33_RFrcvChksum
 534                     ; 295               for(i=0;i<RFSEND_DATALEN-1;i++)
 536  0184 4f            	clr	a
 537  0185 6b01          	ld	(OFST+0,sp),a
 538  0187               L512:
 539                     ; 297                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 541  0187 5f            	clrw	x
 542  0188 97            	ld	xl,a
 543  0189 b600          	ld	a,L33_RFrcvChksum
 544  018b eb6a          	add	a,(_RcvRFmsg,x)
 545  018d b700          	ld	L33_RFrcvChksum,a
 546                     ; 295               for(i=0;i<RFSEND_DATALEN-1;i++)
 548  018f 0c01          	inc	(OFST+0,sp)
 551  0191 7b01          	ld	a,(OFST+0,sp)
 552  0193 a104          	cp	a,#4
 553  0195 25f0          	jrult	L512
 554                     ; 299               RFrcvChksum = (u8)(~RFrcvChksum);
 556  0197 3300          	cpl	L33_RFrcvChksum
 557                     ; 300               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 559  0199 b66e          	ld	a,_RcvRFmsg+4
 560  019b b100          	cp	a,L33_RFrcvChksum
 561  019d 2704ac2d022d  	jrne	L162
 562                     ; 302                 RFbytesReady = TRUE;  // set new RF data available flag
 563                     ; 304               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 564                     ; 305               RF_rcvState = RF_RCVSTATE_WAITSTART;
 565                     ; 308           rf_offset = 0;
 567  01a3 ac290229      	jpf	LC005
 568  01a7               L102:
 569                     ; 310         else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 571  01a7 be18          	ldw	x,L12_rf_halfbittime
 572  01a9 72bb001a      	addw	x,L32_rf_edges_jitter
 573  01ad b31c          	cpw	x,L52_rf_low_time
 574  01af 250e          	jrult	L722
 576  01b1 be18          	ldw	x,L12_rf_halfbittime
 577  01b3 72b0001a      	subw	x,L32_rf_edges_jitter
 578  01b7 b31c          	cpw	x,L52_rf_low_time
 579  01b9 2204          	jrugt	L722
 580                     ; 312           rf_offset = rf_low_time;
 582  01bb be1c          	ldw	x,L52_rf_low_time
 584  01bd 2075          	jpf	LC002
 585  01bf               L722:
 586                     ; 316           RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 588  01bf 35020028      	mov	_RF_waitstart_substate,#2
 589                     ; 317           RF_rcvState = RF_RCVSTATE_WAITSTART;
 590  01c3 ac760276      	jpf	LC001
 591  01c7               L771:
 592                     ; 320       else if(FLAG_fall_edge)
 594  01c7 b614          	ld	a,L31_FLAG_fall_edge
 595  01c9 2604ac780278  	jreq	L341
 596                     ; 322         rf_high_time = cap_fall;
 598  01cf be65          	ldw	x,L7_cap_fall
 599  01d1 bf1e          	ldw	L72_rf_high_time,x
 600                     ; 323         if(rf_high_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_high_time+rf_offset >= rf_bittime-rf_edges_jitter)
 602  01d3 8dfb02fb      	callf	LC009
 603  01d7 225f          	jrugt	L732
 605  01d9 8d0c030c      	callf	LC010
 606  01dd 2559          	jrult	L732
 607                     ; 325           rf_bittime = ((rf_high_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 609  01df 72bb0016      	addw	x,L71_rf_bittime
 610  01e3 8dde02de      	callf	LC007
 611                     ; 329           RF_bits++;
 613  01e7 3c25          	inc	L73_RF_bits
 614                     ; 330           if(RF_bits < 8) RF_data <<= 1;
 616  01e9 b625          	ld	a,L73_RF_bits
 617  01eb a108          	cp	a,#8
 618  01ed 2402          	jruge	L142
 621  01ef 3827          	sll	L34_RF_data
 622  01f1               L142:
 623                     ; 331           if(RF_bits == 8)
 625  01f1 a108          	cp	a,#8
 626  01f3 263e          	jrne	L342
 627                     ; 334             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 629  01f5 8de802e8      	callf	LC008
 630  01f9 260d          	jrne	L542
 631                     ; 339               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 633  01fb be6a          	ldw	x,_RcvRFmsg
 634  01fd a3a55a        	cpw	x,#42330
 635  0200 2706          	jreq	L542
 636                     ; 342                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 638  0202 35020028      	mov	_RF_waitstart_substate,#2
 639                     ; 343                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 641  0206 3f29          	clr	L54_RF_rcvState
 642  0208               L542:
 643                     ; 346             if(RF_bytes == RFSEND_DATALEN) 
 645  0208 a105          	cp	a,#5
 646  020a 2627          	jrne	L342
 647                     ; 348               RFrcvChksum = 0;
 649  020c 3f00          	clr	L33_RFrcvChksum
 650                     ; 349               for(i=0;i<RFSEND_DATALEN-1;i++)
 652  020e 4f            	clr	a
 653  020f 6b01          	ld	(OFST+0,sp),a
 654  0211               L352:
 655                     ; 351                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 657  0211 5f            	clrw	x
 658  0212 97            	ld	xl,a
 659  0213 b600          	ld	a,L33_RFrcvChksum
 660  0215 eb6a          	add	a,(_RcvRFmsg,x)
 661  0217 b700          	ld	L33_RFrcvChksum,a
 662                     ; 349               for(i=0;i<RFSEND_DATALEN-1;i++)
 664  0219 0c01          	inc	(OFST+0,sp)
 667  021b 7b01          	ld	a,(OFST+0,sp)
 668  021d a104          	cp	a,#4
 669  021f 25f0          	jrult	L352
 670                     ; 353               RFrcvChksum = (u8)(~RFrcvChksum);
 672  0221 3300          	cpl	L33_RFrcvChksum
 673                     ; 354               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 675  0223 b66e          	ld	a,_RcvRFmsg+4
 676  0225 b100          	cp	a,L33_RFrcvChksum
 677  0227 2604          	jrne	L162
 678                     ; 356                 RFbytesReady = TRUE;  // set new RF data available flag
 680  0229               LC005:
 682  0229 35010023      	mov	_RFbytesReady,#1
 683  022d               L162:
 684                     ; 358               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 686                     ; 359               RF_rcvState = RF_RCVSTATE_WAITSTART;
 689  022d 35020028      	mov	_RF_waitstart_substate,#2
 691  0231 3f29          	clr	L54_RF_rcvState
 692  0233               L342:
 693                     ; 362           rf_offset = 0;
 696  0233 5f            	clrw	x
 697  0234               LC002:
 698  0234 bf20          	ldw	L13_rf_offset,x
 700  0236 2040          	jra	L341
 701  0238               L732:
 702                     ; 364         else if(rf_high_time <= rf_halfbittime+rf_edges_jitter && rf_high_time >= rf_halfbittime-rf_edges_jitter)
 704  0238 be18          	ldw	x,L12_rf_halfbittime
 705  023a 72bb001a      	addw	x,L32_rf_edges_jitter
 706  023e b31e          	cpw	x,L72_rf_high_time
 707  0240 250e          	jrult	L562
 709  0242 be18          	ldw	x,L12_rf_halfbittime
 710  0244 72b0001a      	subw	x,L32_rf_edges_jitter
 711  0248 b31e          	cpw	x,L72_rf_high_time
 712  024a 2204          	jrugt	L562
 713                     ; 366           rf_offset = rf_high_time;
 715  024c be1e          	ldw	x,L72_rf_high_time
 717  024e 20e4          	jpf	LC002
 718  0250               L562:
 719                     ; 368         else if(rf_high_time <= RF_STARTTIME_HIGH && rf_high_time >= RF_STARTTIME_LOW)
 721  0250 be1e          	ldw	x,L72_rf_high_time
 722  0252 a32711        	cpw	x,#10001
 723  0255 2421          	jruge	L341
 725  0257 a300c8        	cpw	x,#200
 726  025a 251c          	jrult	L341
 727                     ; 371           rf_bittime = cap_fall >> 1;            // bit time is half of start time
 729  025c be65          	ldw	x,L7_cap_fall
 730  025e 8dde02de      	callf	LC007
 731                     ; 374           RF_bits = 0;
 733  0262 3f25          	clr	L73_RF_bits
 734                     ; 375           RF_bytes = 0;
 736  0264 3f26          	clr	L14_RF_bytes
 737                     ; 376           RF_data = 0;
 739  0266 3f27          	clr	L34_RF_data
 740                     ; 377           if(idx < RF_REC_LEN)
 742  0268 b622          	ld	a,_idx
 743  026a a132          	cp	a,#50
 744  026c 2404          	jruge	L372
 745                     ; 378           rcv_buff[0] = cap_fall;
 747  026e be65          	ldw	x,L7_cap_fall
 748  0270 bf01          	ldw	_rcv_buff,x
 749  0272               L372:
 750                     ; 379           RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 752  0272 35030028      	mov	_RF_waitstart_substate,#3
 753                     ; 380           RF_rcvState = RF_RCVSTATE_WAITSTART;
 755  0276               LC001:
 757  0276 3f29          	clr	L54_RF_rcvState
 758                     ; 385     default: break;
 760  0278               L341:
 761                     ; 388   TIM3->SR1 = (u8)(~(u8)TIM3_IT_CC1);
 763  0278 35fd5285      	mov	21125,#253
 764                     ; 390   TIM3->SR1 = (u8)(~(u8)TIM3_IT_CC2);
 766  027c 35fb5285      	mov	21125,#251
 767                     ; 391   RTMS_MEASURE_STOP(runtime_it_RFrcv);
 769  0280 8dc302c3      	callf	LC006
 772  0284 bf04          	ldw	_runtime_it_RFrcv+4,x
 775  0286 be06          	ldw	x,_runtime_it_RFrcv+6
 776  0288 b304          	cpw	x,_runtime_it_RFrcv+4
 777  028a 230d          	jrule	L572
 780  028c aeffff        	ldw	x,#65535
 781  028f 72b00006      	subw	x,_runtime_it_RFrcv+6
 782  0293 72bb0004      	addw	x,_runtime_it_RFrcv+4
 784  0297 2006          	jra	L772
 785  0299               L572:
 788  0299 be04          	ldw	x,_runtime_it_RFrcv+4
 789  029b 72b00006      	subw	x,_runtime_it_RFrcv+6
 790  029f               L772:
 791  029f bf08          	ldw	_runtime_it_RFrcv+8,x
 794  02a1 be00          	ldw	x,_runtime_it_RFrcv
 795  02a3 b308          	cpw	x,_runtime_it_RFrcv+8
 796  02a5 2304          	jrule	L103
 799  02a7 be08          	ldw	x,_runtime_it_RFrcv+8
 800  02a9 bf00          	ldw	_runtime_it_RFrcv,x
 801  02ab               L103:
 804  02ab be02          	ldw	x,_runtime_it_RFrcv+2
 805  02ad b308          	cpw	x,_runtime_it_RFrcv+8
 806  02af 2404          	jruge	L303
 809  02b1 be08          	ldw	x,_runtime_it_RFrcv+8
 810  02b3 bf02          	ldw	_runtime_it_RFrcv+2,x
 811  02b5               L303:
 812                     ; 392 }
 816  02b5 84            	pop	a
 817  02b6 85            	popw	x
 818  02b7 bf00          	ldw	c_y,x
 819  02b9 320002        	pop	c_y+2
 820  02bc 85            	popw	x
 821  02bd bf00          	ldw	c_x,x
 822  02bf 320002        	pop	c_x+2
 823  02c2 80            	iret	
 824  02c3               LC006:
 825  02c3 c6525b        	ld	a,21083
 826  02c6 5f            	clrw	x
 827  02c7 97            	ld	xl,a
 828  02c8 bf00          	ldw	_tmph,x
 829                     ; 391   RTMS_MEASURE_STOP(runtime_it_RFrcv);
 831  02ca c6525c        	ld	a,21084
 832  02cd 5f            	clrw	x
 833  02ce 97            	ld	xl,a
 834  02cf bf00          	ldw	_tmpl,x
 837  02d1 bf00          	ldw	_tmp,x
 840  02d3 b601          	ld	a,_tmp+1
 841  02d5 be00          	ldw	x,_tmph
 842  02d7 01            	rrwa	x,a
 843  02d8 ba00          	or	a,_tmp
 844  02da 01            	rrwa	x,a
 845  02db bf00          	ldw	_tmp,x
 846  02dd 87            	retf	
 847  02de               LC007:
 848  02de 54            	srlw	x
 849  02df bf16          	ldw	L71_rf_bittime,x
 850                     ; 207               rf_halfbittime = rf_bittime >> 1;      // half of bit time
 852  02e1 54            	srlw	x
 853  02e2 bf18          	ldw	L12_rf_halfbittime,x
 854                     ; 208               rf_edges_jitter = rf_halfbittime >> 1; // maximum accepted edges jitter is a quarter bit time
 856  02e4 54            	srlw	x
 857  02e5 bf1a          	ldw	L32_rf_edges_jitter,x
 858  02e7 87            	retf	
 859  02e8               LC008:
 860  02e8 b626          	ld	a,L14_RF_bytes
 861  02ea 3c26          	inc	L14_RF_bytes
 862  02ec 5f            	clrw	x
 863  02ed 97            	ld	xl,a
 864  02ee b627          	ld	a,L34_RF_data
 865  02f0 e76a          	ld	(_RcvRFmsg,x),a
 866                     ; 281             RF_bits = 0;
 868  02f2 3f25          	clr	L73_RF_bits
 869                     ; 282             RF_data = 0;
 871  02f4 3f27          	clr	L34_RF_data
 872                     ; 283             if(RF_bytes == 2)
 874  02f6 b626          	ld	a,L14_RF_bytes
 875  02f8 a102          	cp	a,#2
 876  02fa 87            	retf	
 877  02fb               LC009:
 878  02fb 90be16        	ldw	y,L71_rf_bittime
 879  02fe 72bb0020      	addw	x,L13_rf_offset
 880  0302 72b9001a      	addw	y,L32_rf_edges_jitter
 881  0306 90bf00        	ldw	c_y,y
 882  0309 b300          	cpw	x,c_y
 883  030b 87            	retf	
 884  030c               LC010:
 885  030c 90be16        	ldw	y,L71_rf_bittime
 886  030f 72b2001a      	subw	y,L32_rf_edges_jitter
 887  0313 90bf00        	ldw	c_y,y
 888  0316 b300          	cpw	x,c_y
 889  0318 87            	retf	
 947                     ; 399 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 947                     ; 400 {
 948                     .text:	section	.text,new
 949  0000               f_TIM4_UPD_OVF_IRQHandler:
 953                     ; 404   RTMS_MEASURE_START(runtime_it_1ms);
 955  0000 8dac01ac      	callf	LC012
 958  0004 bf06          	ldw	_runtime_it_1ms+6,x
 959                     ; 405   interrupt_status = 1;
 962  0006 35010069      	mov	L3_interrupt_status,#1
 963                     ; 406   if((u8)(TIM4->SR1 & (u8)TIM4_IT_Update))  //1ms
 965  000a 720052e404ac  	btjf	21220,#0,L513
 966                     ; 415     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
 968  0013 be02          	ldw	x,_cnt_flag_1000ms
 969  0015 a3ffff        	cpw	x,#65535
 970  0018 2403          	jruge	L713
 973  001a 5c            	incw	x
 974  001b bf02          	ldw	_cnt_flag_1000ms,x
 975  001d               L713:
 976                     ; 416     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
 978  001d a303e8        	cpw	x,#1000
 979  0020 2507          	jrult	L123
 980                     ; 418       cnt_flag_1000ms = 0;
 982  0022 5f            	clrw	x
 983  0023 bf02          	ldw	_cnt_flag_1000ms,x
 984                     ; 419       FLAG_1000ms = TRUE;
 986  0025 72100001      	bset	_FLAG_1000ms
 987  0029               L123:
 988                     ; 422     if(!Timeout_istout1)
 990  0029 720000000d    	btjt	_Timeout_istout1,L323
 991                     ; 424       Timeout_toutcnt1++;
 993  002e be00          	ldw	x,_Timeout_toutcnt1
 994  0030 5c            	incw	x
 995  0031 bf00          	ldw	_Timeout_toutcnt1,x
 996                     ; 425       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 998  0033 b300          	cpw	x,_Timeout_tout1
 999  0035 2504          	jrult	L323
1002  0037 72100000      	bset	_Timeout_istout1
1003  003b               L323:
1004                     ; 427     if(!Timeout_istout2)
1006  003b 720000000d    	btjt	_Timeout_istout2,L723
1007                     ; 429       Timeout_toutcnt2++;
1009  0040 be00          	ldw	x,_Timeout_toutcnt2
1010  0042 5c            	incw	x
1011  0043 bf00          	ldw	_Timeout_toutcnt2,x
1012                     ; 430       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1014  0045 b300          	cpw	x,_Timeout_tout2
1015  0047 2504          	jrult	L723
1018  0049 72100000      	bset	_Timeout_istout2
1019  004d               L723:
1020                     ; 432     if(!Timeout_istout3)
1022  004d 720000000d    	btjt	_Timeout_istout3,L333
1023                     ; 434       Timeout_toutcnt3++;
1025  0052 be00          	ldw	x,_Timeout_toutcnt3
1026  0054 5c            	incw	x
1027  0055 bf00          	ldw	_Timeout_toutcnt3,x
1028                     ; 435       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1030  0057 b300          	cpw	x,_Timeout_tout3
1031  0059 2504          	jrult	L333
1034  005b 72100000      	bset	_Timeout_istout3
1035  005f               L333:
1036                     ; 438     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
1038  005f b624          	ld	a,L53_RFrcvTimeoutcnt
1039  0061 a1ff          	cp	a,#255
1040  0063 2404          	jruge	L733
1043  0065 3c24          	inc	L53_RFrcvTimeoutcnt
1044  0067 b624          	ld	a,L53_RFrcvTimeoutcnt
1045  0069               L733:
1046                     ; 439     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1048  0069 a164          	cp	a,#100
1049  006b 2506          	jrult	L143
1050                     ; 441       RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
1052  006d 35020028      	mov	_RF_waitstart_substate,#2
1053                     ; 442       RF_rcvState = RF_RCVSTATE_WAITSTART;
1055  0071 3f29          	clr	L54_RF_rcvState
1056  0073               L143:
1057                     ; 446     if(!BTN1_STATE)
1059  0073 7204500116    	btjt	20481,#2,L343
1060                     ; 448       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1062  0078 b604          	ld	a,_btn1_0_cnt
1063  007a a1ff          	cp	a,#255
1064  007c 2402          	jruge	L543
1067  007e 3c04          	inc	_btn1_0_cnt
1068  0080               L543:
1069                     ; 449       btn1_1_cnt = 0;
1071  0080 3f05          	clr	_btn1_1_cnt
1072                     ; 450       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1074  0082 b604          	ld	a,_btn1_0_cnt
1075  0084 a11e          	cp	a,#30
1076  0086 2518          	jrult	L153
1077                     ; 452         BTN1_DEB_STATE = BTN_PRESSED;
1079  0088 35010006      	mov	_BTN1_DEB_STATE,#1
1080  008c 2012          	jra	L153
1081  008e               L343:
1082                     ; 457       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1084  008e b605          	ld	a,_btn1_1_cnt
1085  0090 a1ff          	cp	a,#255
1086  0092 2402          	jruge	L353
1089  0094 3c05          	inc	_btn1_1_cnt
1090  0096               L353:
1091                     ; 458       btn1_0_cnt = 0;
1093  0096 3f04          	clr	_btn1_0_cnt
1094                     ; 459       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1096  0098 b605          	ld	a,_btn1_1_cnt
1097  009a a11e          	cp	a,#30
1098  009c 2502          	jrult	L153
1099                     ; 461         BTN1_DEB_STATE = BTN_DEPRESSED;
1101  009e 3f06          	clr	_BTN1_DEB_STATE
1102  00a0               L153:
1103                     ; 467     if(BTN1_DEB_STATE == BTN_PRESSED)
1105  00a0 b606          	ld	a,_BTN1_DEB_STATE
1106  00a2 4a            	dec	a
1107  00a3 260a          	jrne	L753
1108                     ; 469       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1110  00a5 be08          	ldw	x,_BTN1_press_timer
1111  00a7 a3ffff        	cpw	x,#65535
1112  00aa 2403          	jruge	L753
1115  00ac 5c            	incw	x
1116  00ad bf08          	ldw	_BTN1_press_timer,x
1117  00af               L753:
1118                     ; 472     if(!BTN1_DELAY_FLAG)
1120  00af 720000020e    	btjt	_BTN1_DELAY_FLAG,L363
1121                     ; 474       btn1_delay_cnt++;
1123  00b4 3c07          	inc	_btn1_delay_cnt
1124                     ; 475       if(btn1_delay_cnt == BTN_DELAY)
1126  00b6 b607          	ld	a,_btn1_delay_cnt
1127  00b8 a196          	cp	a,#150
1128  00ba 2606          	jrne	L363
1129                     ; 477         btn1_delay_cnt = 0;
1131  00bc 3f07          	clr	_btn1_delay_cnt
1132                     ; 478         BTN1_DELAY_FLAG = TRUE;
1134  00be 72100002      	bset	_BTN1_DELAY_FLAG
1135  00c2               L363:
1136                     ; 484     if(flag_blink_redLED)
1138  00c2 7201000450    	btjf	_flag_blink_redLED,L763
1139                     ; 486       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1141  00c7 be0b          	ldw	x,_cnt_state_redLED
1142  00c9 a3ffff        	cpw	x,#65535
1143  00cc 2403          	jruge	L173
1146  00ce 5c            	incw	x
1147  00cf bf0b          	ldw	_cnt_state_redLED,x
1148  00d1               L173:
1149                     ; 487       if(flag_blink_on_off)
1151  00d1 7201000312    	btjf	_flag_blink_on_off,L373
1152                     ; 489         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1154  00d6 a30032        	cpw	x,#50
1155  00d9 253c          	jrult	L763
1156                     ; 491           flag_blink_on_off = FALSE;
1158  00db 72110003      	bres	_flag_blink_on_off
1159                     ; 492           cnt_state_redLED = 0;
1161  00df 5f            	clrw	x
1162  00e0 bf0b          	ldw	_cnt_state_redLED,x
1163                     ; 493           LED_OFF;
1165  00e2 7217500a      	bres	20490,#3
1168  00e6 202b          	jpf	LC011
1169  00e8               L373:
1170                     ; 498         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1172  00e8 a300c8        	cpw	x,#200
1173  00eb 252a          	jrult	L763
1174                     ; 500           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1176  00ed b60f          	ld	a,_cnt_blink_redLED
1177  00ef a1ff          	cp	a,#255
1178  00f1 2402          	jruge	L304
1181  00f3 3c0f          	inc	_cnt_blink_redLED
1182  00f5               L304:
1183                     ; 501           flag_blink_on_off = TRUE;
1185  00f5 72100003      	bset	_flag_blink_on_off
1186                     ; 502           cnt_state_redLED = 0;
1188  00f9 5f            	clrw	x
1189  00fa bf0b          	ldw	_cnt_state_redLED,x
1190                     ; 503           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1192  00fc b60f          	ld	a,_cnt_blink_redLED
1193  00fe b111          	cp	a,_blink_redLED_times
1194  0100 250d          	jrult	L504
1196  0102 7200000608    	btjt	_flag_blink_unlimited,L504
1197                     ; 505             flag_blink_redLED = FALSE;
1199  0107 72110004      	bres	_flag_blink_redLED
1200                     ; 506             cnt_blink_redLED = 0;
1202  010b 3f0f          	clr	_cnt_blink_redLED
1204  010d 2008          	jra	L763
1205  010f               L504:
1206                     ; 510             LED_RED_ON;
1208  010f 7216500a      	bset	20490,#3
1211  0113               LC011:
1213  0113 7219500a      	bres	20490,#4
1215  0117               L763:
1216                     ; 515     if(flag_blink_greenLED)
1218  0117 7201000554    	btjf	_flag_blink_greenLED,L114
1219                     ; 517       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1221  011c be0d          	ldw	x,_cnt_state_greenLED
1222  011e a3ffff        	cpw	x,#65535
1223  0121 2403          	jruge	L314
1226  0123 5c            	incw	x
1227  0124 bf0d          	ldw	_cnt_state_greenLED,x
1228  0126               L314:
1229                     ; 518       if(flag_blink_on_off)
1231  0126 7201000316    	btjf	_flag_blink_on_off,L514
1232                     ; 520         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1234  012b a30032        	cpw	x,#50
1235  012e 2540          	jrult	L114
1236                     ; 522           flag_blink_on_off = FALSE;
1238  0130 72110003      	bres	_flag_blink_on_off
1239                     ; 523           cnt_state_greenLED = 0;
1241  0134 5f            	clrw	x
1242  0135 bf0d          	ldw	_cnt_state_greenLED,x
1243                     ; 524           LED_OFF;
1245  0137 7217500a      	bres	20490,#3
1248  013b 7219500a      	bres	20490,#4
1250  013f 202f          	jra	L114
1251  0141               L514:
1252                     ; 529         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1254  0141 a300c8        	cpw	x,#200
1255  0144 252a          	jrult	L114
1256                     ; 531           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1258  0146 b610          	ld	a,_cnt_blink_greenLED
1259  0148 a1ff          	cp	a,#255
1260  014a 2402          	jruge	L524
1263  014c 3c10          	inc	_cnt_blink_greenLED
1264  014e               L524:
1265                     ; 532           flag_blink_on_off = TRUE;
1267  014e 72100003      	bset	_flag_blink_on_off
1268                     ; 533           cnt_state_greenLED = 0;
1270  0152 5f            	clrw	x
1271  0153 bf0d          	ldw	_cnt_state_greenLED,x
1272                     ; 534           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1274  0155 b610          	ld	a,_cnt_blink_greenLED
1275  0157 b112          	cp	a,_blink_greenLED_times
1276  0159 250d          	jrult	L724
1278  015b 7200000608    	btjt	_flag_blink_unlimited,L724
1279                     ; 536             flag_blink_greenLED = FALSE;
1281  0160 72110005      	bres	_flag_blink_greenLED
1282                     ; 537             cnt_blink_greenLED = 0;
1284  0164 3f10          	clr	_cnt_blink_greenLED
1286  0166 2008          	jra	L114
1287  0168               L724:
1288                     ; 541             LED_GREEN_ON;
1290  0168 7217500a      	bres	20490,#3
1293  016c 7218500a      	bset	20490,#4
1295  0170               L114:
1296                     ; 547     TIM4->SR1 = (u8)(~(u8)TIM4_IT_Update);       // clear TIM4 update interrupt flag
1298  0170 35fe52e4      	mov	21220,#254
1299  0174               L513:
1300                     ; 549   interrupt_status = 0;
1302  0174 3f69          	clr	L3_interrupt_status
1303                     ; 550   RTMS_MEASURE_STOP(runtime_it_1ms);
1305  0176 8dac01ac      	callf	LC012
1308  017a bf04          	ldw	_runtime_it_1ms+4,x
1311  017c be06          	ldw	x,_runtime_it_1ms+6
1312  017e b304          	cpw	x,_runtime_it_1ms+4
1313  0180 230d          	jrule	L334
1316  0182 aeffff        	ldw	x,#65535
1317  0185 72b00006      	subw	x,_runtime_it_1ms+6
1318  0189 72bb0004      	addw	x,_runtime_it_1ms+4
1320  018d 2006          	jra	L534
1321  018f               L334:
1324  018f be04          	ldw	x,_runtime_it_1ms+4
1325  0191 72b00006      	subw	x,_runtime_it_1ms+6
1326  0195               L534:
1327  0195 bf08          	ldw	_runtime_it_1ms+8,x
1330  0197 be00          	ldw	x,_runtime_it_1ms
1331  0199 b308          	cpw	x,_runtime_it_1ms+8
1332  019b 2304          	jrule	L734
1335  019d be08          	ldw	x,_runtime_it_1ms+8
1336  019f bf00          	ldw	_runtime_it_1ms,x
1337  01a1               L734:
1340  01a1 be02          	ldw	x,_runtime_it_1ms+2
1341  01a3 b308          	cpw	x,_runtime_it_1ms+8
1342  01a5 2404          	jruge	L144
1345  01a7 be08          	ldw	x,_runtime_it_1ms+8
1346  01a9 bf02          	ldw	_runtime_it_1ms+2,x
1347  01ab               L144:
1348                     ; 551 }
1352  01ab 80            	iret	
1353  01ac               LC012:
1354  01ac c6525b        	ld	a,21083
1355  01af 5f            	clrw	x
1356  01b0 97            	ld	xl,a
1357  01b1 bf00          	ldw	_tmph,x
1358                     ; 550   RTMS_MEASURE_STOP(runtime_it_1ms);
1360  01b3 c6525c        	ld	a,21084
1361  01b6 5f            	clrw	x
1362  01b7 97            	ld	xl,a
1363  01b8 bf00          	ldw	_tmpl,x
1366  01ba bf00          	ldw	_tmp,x
1369  01bc b601          	ld	a,_tmp+1
1370  01be be00          	ldw	x,_tmph
1371  01c0 01            	rrwa	x,a
1372  01c1 ba00          	or	a,_tmp
1373  01c3 01            	rrwa	x,a
1374  01c4 bf00          	ldw	_tmp,x
1375  01c6 87            	retf	
1398                     ; 558 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
1398                     ; 559 {
1399                     .text:	section	.text,new
1400  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
1404                     ; 563 }
1407  0000 80            	iret	
1430                     ; 570 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1430                     ; 571 {
1431                     .text:	section	.text,new
1432  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1436                     ; 575 }
1439  0000 80            	iret	
1461                     ; 582 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
1461                     ; 583 {
1462                     .text:	section	.text,new
1463  0000               f_TRAP_IRQHandler:
1467                     ; 587 }
1470  0000 80            	iret	
1492                     ; 594 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
1492                     ; 595 {
1493                     .text:	section	.text,new
1494  0000               f_FLASH_IRQHandler:
1498                     ; 599 }
1501  0000 80            	iret	
1523                     ; 606 INTERRUPT_HANDLER(AWU_IRQHandler,4)
1523                     ; 607 {
1524                     .text:	section	.text,new
1525  0000               f_AWU_IRQHandler:
1529                     ; 611 }
1532  0000 80            	iret	
1554                     ; 618 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
1554                     ; 619 {
1555                     .text:	section	.text,new
1556  0000               f_EXTIB_IRQHandler:
1560                     ; 623 }
1563  0000 80            	iret	
1585                     ; 630 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
1585                     ; 631 {
1586                     .text:	section	.text,new
1587  0000               f_EXTID_IRQHandler:
1591                     ; 635 }
1594  0000 80            	iret	
1616                     ; 642 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
1616                     ; 643 {
1617                     .text:	section	.text,new
1618  0000               f_EXTI0_IRQHandler:
1622                     ; 647 }
1625  0000 80            	iret	
1647                     ; 654 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
1647                     ; 655 {
1648                     .text:	section	.text,new
1649  0000               f_EXTI1_IRQHandler:
1653                     ; 659 }
1656  0000 80            	iret	
1678                     ; 666 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
1678                     ; 667 {
1679                     .text:	section	.text,new
1680  0000               f_EXTI2_IRQHandler:
1684                     ; 671 }
1687  0000 80            	iret	
1709                     ; 678 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
1709                     ; 679 {
1710                     .text:	section	.text,new
1711  0000               f_EXTI3_IRQHandler:
1715                     ; 683 }
1718  0000 80            	iret	
1740                     ; 690 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1740                     ; 691 {
1741                     .text:	section	.text,new
1742  0000               f_EXTI4_IRQHandler:
1746                     ; 695 }
1749  0000 80            	iret	
1771                     ; 702 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1771                     ; 703 {
1772                     .text:	section	.text,new
1773  0000               f_EXTI5_IRQHandler:
1777                     ; 707 }
1780  0000 80            	iret	
1802                     ; 714 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1802                     ; 715 {
1803                     .text:	section	.text,new
1804  0000               f_EXTI6_IRQHandler:
1808                     ; 719 }
1811  0000 80            	iret	
1833                     ; 726 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1833                     ; 727 {
1834                     .text:	section	.text,new
1835  0000               f_EXTI7_IRQHandler:
1839                     ; 731 }
1842  0000 80            	iret	
1864                     ; 738 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1864                     ; 739 {
1865                     .text:	section	.text,new
1866  0000               f_COMP_IRQHandler:
1870                     ; 743 }
1873  0000 80            	iret	
1896                     ; 750 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1896                     ; 751 {
1897                     .text:	section	.text,new
1898  0000               f_TIM2_CAP_IRQHandler:
1902                     ; 755 }
1905  0000 80            	iret	
1927                     ; 762 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1927                     ; 763 {
1928                     .text:	section	.text,new
1929  0000               f_SPI_IRQHandler:
1933                     ; 767 }
1936  0000 80            	iret	
1959                     ; 773 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1959                     ; 774 {
1960                     .text:	section	.text,new
1961  0000               f_USART_TX_IRQHandler:
1965                     ; 778 }
1968  0000 80            	iret	
1991                     ; 785 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1991                     ; 786 {
1992                     .text:	section	.text,new
1993  0000               f_USART_RX_IRQHandler:
1997                     ; 790 }
2000  0000 80            	iret	
2022                     ; 798 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
2022                     ; 799 {
2023                     .text:	section	.text,new
2024  0000               f_I2C_IRQHandler:
2028                     ; 803 }
2031  0000 80            	iret	
2572                     	xref.b	_runtime_it_RFrcv
2573                     	xref.b	_tmp
2574                     	xref.b	_tmpl
2575                     	xref.b	_tmph
2576                     	xref.b	_runtime_it_1ms
2577                     	xdef	_FLAG_UART_cmd_rcv
2578                     	xdef	_RF_waitstart_substate
2579                     	switch	.ubsct
2580  0000               L33_RFrcvChksum:
2581  0000 00            	ds.b	1
2582                     	xdef	_idx
2583  0001               _rcv_buff:
2584  0001 000000000000  	ds.b	100
2585                     	xdef	_rcv_buff
2586  0065               L7_cap_fall:
2587  0065 0000          	ds.b	2
2588  0067               L5_cap_rise:
2589  0067 0000          	ds.b	2
2590                     	xdef	_cnt_blink_greenLED
2591                     	xdef	_cnt_blink_redLED
2592                     	xdef	_debug
2593  0069               L3_interrupt_status:
2594  0069 00            	ds.b	1
2595                     	xref.b	_Timeout_tout3
2596                     	xref.b	_Timeout_tout2
2597                     	xref.b	_Timeout_tout1
2598                     	xref.b	_Timeout_toutcnt3
2599                     	xref.b	_Timeout_toutcnt2
2600                     	xref.b	_Timeout_toutcnt1
2601                     	xbit	_Timeout_istout3
2602                     	xbit	_Timeout_istout2
2603                     	xbit	_Timeout_istout1
2604                     	xdef	_btn1_delay_cnt
2605                     	xdef	_btn1_1_cnt
2606                     	xdef	_btn1_0_cnt
2607                     	xdef	_cnt_flag_1000ms
2608                     	xdef	_cnt_flag_500ms
2609                     	xdef	f_I2C_IRQHandler
2610                     	xdef	f_USART_RX_IRQHandler
2611                     	xdef	f_USART_TX_IRQHandler
2612                     	xdef	f_SPI_IRQHandler
2613                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2614                     	xdef	f_TIM3_CAP_IRQHandler
2615                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2616                     	xdef	f_TIM2_CAP_IRQHandler
2617                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2618                     	xdef	f_COMP_IRQHandler
2619                     	xdef	f_EXTI7_IRQHandler
2620                     	xdef	f_EXTI6_IRQHandler
2621                     	xdef	f_EXTI5_IRQHandler
2622                     	xdef	f_EXTI4_IRQHandler
2623                     	xdef	f_EXTI3_IRQHandler
2624                     	xdef	f_EXTI2_IRQHandler
2625                     	xdef	f_EXTI1_IRQHandler
2626                     	xdef	f_EXTI0_IRQHandler
2627                     	xdef	f_EXTID_IRQHandler
2628                     	xdef	f_EXTIB_IRQHandler
2629                     	xdef	f_AWU_IRQHandler
2630                     	xdef	f_FLASH_IRQHandler
2631                     	xdef	f_TRAP_IRQHandler
2632                     	xdef	f_NonHandledInterrupt
2633                     	xdef	_RFbytesReady
2634  006a               _RcvRFmsg:
2635  006a 0000000000    	ds.b	5
2636                     	xdef	_RcvRFmsg
2637                     	xdef	_flag_blink_unlimited
2638                     	xdef	_flag_blink_greenLED
2639                     	xdef	_flag_blink_redLED
2640                     	xdef	_flag_blink_on_off
2641                     	xdef	_cnt_state_greenLED
2642                     	xdef	_cnt_state_redLED
2643                     	xdef	_blink_greenLED_times
2644                     	xdef	_blink_redLED_times
2645                     	xdef	_FLAG_1000ms
2646                     	xdef	_FLAG_500ms
2647                     	xdef	_BTN1_press_timer
2648                     	xdef	_BTN1_DELAY_FLAG
2649                     	xdef	_BTN1_DEB_STATE
2650                     	xref	_TIM3_GetCapture2
2651                     	xref	_TIM3_GetCapture1
2652                     	xref.b	c_x
2653                     	xref.b	c_y
2673                     	end
