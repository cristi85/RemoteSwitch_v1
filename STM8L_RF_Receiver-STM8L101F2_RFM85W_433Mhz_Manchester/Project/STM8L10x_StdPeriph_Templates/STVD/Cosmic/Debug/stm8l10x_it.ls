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
 137                     ; 144 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 137                     ; 145 {
 138                     .text:	section	.text,new
 139  0000               f_NonHandledInterrupt:
 143                     ; 149 }
 146  0000 80            	iret	
 219                     ; 156 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 219                     ; 157 {
 220                     .text:	section	.text,new
 221  0000               f_TIM3_CAP_IRQHandler:
 223  0000 8a            	push	cc
 224  0001 84            	pop	a
 225  0002 a4bf          	and	a,#191
 226  0004 88            	push	a
 227  0005 86            	pop	cc
 228       00000001      OFST:	set	1
 229  0006 3b0002        	push	c_x+2
 230  0009 be00          	ldw	x,c_x
 231  000b 89            	pushw	x
 232  000c 3b0002        	push	c_y+2
 233  000f be00          	ldw	x,c_y
 234  0011 89            	pushw	x
 235  0012 88            	push	a
 238                     ; 165   RTMS_MEASURE_START(runtime_it_RFrcv);
 240  0013 8dcb02cb      	callf	LC006
 243  0017 bf06          	ldw	_runtime_it_RFrcv+6,x
 244                     ; 166   if(TIM3_GetITStatus(TIM3_IT_CC1) == SET) {
 247  0019 a602          	ld	a,#2
 248  001b cd0000        	call	_TIM3_GetITStatus
 250  001e 4a            	dec	a
 251  001f 260b          	jrne	L321
 252                     ; 167     cap_rise = TIM3_GetCapture1();
 254  0021 cd0000        	call	_TIM3_GetCapture1
 256  0024 bf67          	ldw	L5_cap_rise,x
 257                     ; 168     FLAG_rise_edge = TRUE;
 259  0026 35010013      	mov	L11_FLAG_rise_edge,#1
 261  002a 2002          	jra	L521
 262  002c               L321:
 263                     ; 170   else FLAG_rise_edge = FALSE;
 265  002c 3f13          	clr	L11_FLAG_rise_edge
 266  002e               L521:
 267                     ; 171   if(TIM3_GetITStatus(TIM3_IT_CC2) == SET) {
 269  002e a604          	ld	a,#4
 270  0030 cd0000        	call	_TIM3_GetITStatus
 272  0033 4a            	dec	a
 273  0034 260b          	jrne	L721
 274                     ; 172     cap_fall = TIM3_GetCapture2();
 276  0036 cd0000        	call	_TIM3_GetCapture2
 278  0039 bf65          	ldw	L7_cap_fall,x
 279                     ; 173     FLAG_fall_edge = TRUE;
 281  003b 35010014      	mov	L31_FLAG_fall_edge,#1
 283  003f 2002          	jra	L131
 284  0041               L721:
 285                     ; 175   else FLAG_fall_edge = FALSE;
 287  0041 3f14          	clr	L31_FLAG_fall_edge
 288  0043               L131:
 289                     ; 176   if(FLAG_rise_edge && FLAG_fall_edge) {
 291  0043 b613          	ld	a,L11_FLAG_rise_edge
 292  0045 2708          	jreq	L331
 294  0047 b614          	ld	a,L31_FLAG_fall_edge
 295  0049 2704          	jreq	L331
 296                     ; 177     FLAG_CC_Error = TRUE;
 298  004b 35010015      	mov	L51_FLAG_CC_Error,#1
 299  004f               L331:
 300                     ; 180   RFrcvTimeoutcnt = 0;
 302  004f 3f24          	clr	L53_RFrcvTimeoutcnt
 303                     ; 181   switch(RF_rcvState)
 305  0051 b629          	ld	a,L54_RF_rcvState
 307                     ; 374     default: break;
 308  0053 270b          	jreq	L56
 309  0055 4a            	dec	a
 310  0056 2604ac080108  	jreq	L57
 311  005c ac7e027e      	jra	L731
 312  0060               L56:
 313                     ; 185       switch(RF_waitstart_substate)
 315  0060 b628          	ld	a,_RF_waitstart_substate
 317                     ; 238         default: break;
 318  0062 a002          	sub	a,#2
 319  0064 2707          	jreq	L76
 320  0066 4a            	dec	a
 321  0067 2734          	jreq	L17
 322  0069 ac7e027e      	jra	L731
 323  006d               L76:
 324                     ; 189           DEBUG_PIN_ON;
 326  006d 72165005      	bset	20485,#3
 327                     ; 190           if(FLAG_fall_edge)
 329  0071 3d14          	tnz	L31_FLAG_fall_edge
 330  0073 27f4          	jreq	L731
 331                     ; 192             if(cap_fall <= RF_STARTTIME_HIGH && cap_fall >= RF_STARTTIME_LOW)
 333  0075 be65          	ldw	x,L7_cap_fall
 334  0077 a32711        	cpw	x,#10001
 335  007a 24ed          	jruge	L731
 337  007c a300c8        	cpw	x,#200
 338  007f 25e8          	jrult	L731
 339                     ; 195               rf_bittime = cap_fall >> 1;            // bit time is half of start time
 341  0081 8de602e6      	callf	LC007
 342                     ; 198               RF_bits = 0;
 344  0085 b725          	ld	L73_RF_bits,a
 345                     ; 199               RF_bytes = 0;
 347  0087 b726          	ld	L14_RF_bytes,a
 348                     ; 200               RF_data = 0;
 350  0089 b727          	ld	L34_RF_data,a
 351                     ; 201               RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 353  008b 35030028      	mov	_RF_waitstart_substate,#3
 354                     ; 202               if(idx < RF_REC_LEN) rcv_buff[0] = cap_fall;
 356  008f b622          	ld	a,_idx
 357  0091 a132          	cp	a,#50
 358  0093 24d4          	jruge	L731
 361  0095 be65          	ldw	x,L7_cap_fall
 362  0097 bf01          	ldw	_rcv_buff,x
 363  0099 ac7e027e      	jra	L731
 364  009d               L17:
 365                     ; 209           DEBUG_PIN_ON;
 367  009d 72165005      	bset	20485,#3
 368                     ; 210           if(FLAG_rise_edge)
 370  00a1 b613          	ld	a,L11_FLAG_rise_edge
 371  00a3 27f4          	jreq	L731
 372                     ; 212             rf_low_time = cap_rise-cap_fall;
 374  00a5 be67          	ldw	x,L5_cap_rise
 375  00a7 72b00065      	subw	x,L7_cap_fall
 376  00ab bf1c          	ldw	L52_rf_low_time,x
 377                     ; 213             if(rf_low_time <= rf_bittime+rf_edges_jitter && rf_low_time >= rf_bittime-rf_edges_jitter)
 379  00ad be16          	ldw	x,L71_rf_bittime
 380  00af 72bb001a      	addw	x,L32_rf_edges_jitter
 381  00b3 b31c          	cpw	x,L52_rf_low_time
 382  00b5 2525          	jrult	L551
 384  00b7 be16          	ldw	x,L71_rf_bittime
 385  00b9 72b0001a      	subw	x,L32_rf_edges_jitter
 386  00bd b31c          	cpw	x,L52_rf_low_time
 387  00bf 221b          	jrugt	L551
 388                     ; 216               RF_data |= 0x01;
 390  00c1 72100027      	bset	L34_RF_data,#0
 391                     ; 217               RF_bits++;
 393  00c5 3c25          	inc	L73_RF_bits
 394                     ; 218               RF_data <<= 1;
 396                     ; 219               rf_offset = 0;
 398  00c7 5f            	clrw	x
 399  00c8 3827          	sll	L34_RF_data
 400  00ca bf20          	ldw	L13_rf_offset,x
 401                     ; 220               idx = 2;
 403  00cc 35020022      	mov	_idx,#2
 404                     ; 221               rcv_buff[1] = rf_low_time;
 406  00d0 be1c          	ldw	x,L52_rf_low_time
 407  00d2 bf03          	ldw	_rcv_buff+2,x
 408                     ; 222               RF_rcvState = RF_RCVSTATE_RECBITS;
 410  00d4 35010029      	mov	L54_RF_rcvState,#1
 412  00d8 ac7e027e      	jra	L731
 413  00dc               L551:
 414                     ; 224             else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 416  00dc be18          	ldw	x,L12_rf_halfbittime
 417  00de 72bb001a      	addw	x,L32_rf_edges_jitter
 418  00e2 b31c          	cpw	x,L52_rf_low_time
 419  00e4 251a          	jrult	L161
 421  00e6 be18          	ldw	x,L12_rf_halfbittime
 422  00e8 72b0001a      	subw	x,L32_rf_edges_jitter
 423  00ec b31c          	cpw	x,L52_rf_low_time
 424  00ee 2210          	jrugt	L161
 425                     ; 226               rf_offset = rf_low_time;
 427  00f0 be1c          	ldw	x,L52_rf_low_time
 428  00f2 bf20          	ldw	L13_rf_offset,x
 429                     ; 227               idx = 2;
 431  00f4 35020022      	mov	_idx,#2
 432                     ; 228               RF_rcvState = RF_RCVSTATE_RECBITS;
 434  00f8 35010029      	mov	L54_RF_rcvState,#1
 436  00fc ac7e027e      	jra	L731
 437  0100               L161:
 438                     ; 233               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 440  0100 35020028      	mov	_RF_waitstart_substate,#2
 441  0104 ac7e027e      	jra	L731
 442                     ; 238         default: break;
 444                     ; 240       break;
 446  0108               L57:
 447                     ; 244       DEBUG_PIN_OFF;
 449  0108 72175005      	bres	20485,#3
 450                     ; 246       if(idx < RF_REC_LEN)
 452  010c b622          	ld	a,_idx
 453  010e a132          	cp	a,#50
 454  0110 2425          	jruge	L561
 455                     ; 248         if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
 457  0112 b613          	ld	a,L11_FLAG_rise_edge
 458  0114 2715          	jreq	L761
 461  0116 be67          	ldw	x,L5_cap_rise
 462  0118 72b00065      	subw	x,L7_cap_fall
 463  011c b622          	ld	a,_idx
 464  011e 3c22          	inc	_idx
 465  0120 905f          	clrw	y
 466  0122 9097          	ld	yl,a
 467  0124 9058          	sllw	y
 468  0126 90ef01        	ldw	(_rcv_buff,y),x
 470  0129 200c          	jra	L561
 471  012b               L761:
 472                     ; 249         else rcv_buff[idx++] = cap_fall;
 474  012b b622          	ld	a,_idx
 475  012d 3c22          	inc	_idx
 476  012f 5f            	clrw	x
 477  0130 97            	ld	xl,a
 478  0131 58            	sllw	x
 479  0132 90be65        	ldw	y,L7_cap_fall
 480  0135 ef01          	ldw	(_rcv_buff,x),y
 481  0137               L561:
 482                     ; 254       if(FLAG_rise_edge)
 484  0137 b613          	ld	a,L11_FLAG_rise_edge
 485  0139 2604accd01cd  	jreq	L371
 486                     ; 256         rf_low_time = cap_rise-cap_fall;
 488  013f be67          	ldw	x,L5_cap_rise
 489  0141 72b00065      	subw	x,L7_cap_fall
 490  0145 bf1c          	ldw	L52_rf_low_time,x
 491                     ; 257         if(rf_low_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_low_time+rf_offset >= rf_bittime-rf_edges_jitter)
 493  0147 8d030303      	callf	LC009
 494  014b 2260          	jrugt	L571
 496  014d 8d140314      	callf	LC010
 497  0151 255a          	jrult	L571
 498                     ; 259           rf_bittime = ((rf_low_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 500  0153 72bb0016      	addw	x,L71_rf_bittime
 501  0157 8de602e6      	callf	LC007
 502                     ; 263           RF_data |= 0x01;
 504  015b 72100027      	bset	L34_RF_data,#0
 505                     ; 264           RF_bits++;
 507  015f 3c25          	inc	L73_RF_bits
 508                     ; 265           if(RF_bits < 8) RF_data <<= 1;
 510  0161 b625          	ld	a,L73_RF_bits
 511  0163 a108          	cp	a,#8
 512  0165 2402          	jruge	L771
 515  0167 3827          	sll	L34_RF_data
 516  0169               L771:
 517                     ; 266           if(RF_bits == 8)
 519  0169 a108          	cp	a,#8
 520  016b 2704ac390239  	jrne	L732
 521                     ; 269             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 523  0171 8df002f0      	callf	LC008
 524  0175 260d          	jrne	L302
 525                     ; 274               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 527  0177 be6a          	ldw	x,_RcvRFmsg
 528  0179 a3a55a        	cpw	x,#42330
 529  017c 2706          	jreq	L302
 530                     ; 277                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 532  017e 35020028      	mov	_RF_waitstart_substate,#2
 533                     ; 278                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 535  0182 3f29          	clr	L54_RF_rcvState
 536  0184               L302:
 537                     ; 281             if(RF_bytes == RFSEND_DATALEN) 
 539  0184 a105          	cp	a,#5
 540  0186 26e5          	jrne	L732
 541                     ; 283               RFrcvChksum = 0;
 543  0188 3f00          	clr	L33_RFrcvChksum
 544                     ; 284               for(i=0;i<RFSEND_DATALEN-1;i++)
 546  018a 4f            	clr	a
 547  018b 6b01          	ld	(OFST+0,sp),a
 548  018d               L112:
 549                     ; 286                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 551  018d 5f            	clrw	x
 552  018e 97            	ld	xl,a
 553  018f b600          	ld	a,L33_RFrcvChksum
 554  0191 eb6a          	add	a,(_RcvRFmsg,x)
 555  0193 b700          	ld	L33_RFrcvChksum,a
 556                     ; 284               for(i=0;i<RFSEND_DATALEN-1;i++)
 558  0195 0c01          	inc	(OFST+0,sp)
 561  0197 7b01          	ld	a,(OFST+0,sp)
 562  0199 a104          	cp	a,#4
 563  019b 25f0          	jrult	L112
 564                     ; 288               RFrcvChksum = (u8)(~RFrcvChksum);
 566  019d 3300          	cpl	L33_RFrcvChksum
 567                     ; 289               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 569  019f b66e          	ld	a,_RcvRFmsg+4
 570  01a1 b100          	cp	a,L33_RFrcvChksum
 571  01a3 2704ac330233  	jrne	L552
 572                     ; 291                 RFbytesReady = TRUE;  // set new RF data available flag
 573                     ; 293               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 574                     ; 294               RF_rcvState = RF_RCVSTATE_WAITSTART;
 575                     ; 297           rf_offset = 0;
 577  01a9 ac2f022f      	jpf	LC005
 578  01ad               L571:
 579                     ; 299         else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
 581  01ad be18          	ldw	x,L12_rf_halfbittime
 582  01af 72bb001a      	addw	x,L32_rf_edges_jitter
 583  01b3 b31c          	cpw	x,L52_rf_low_time
 584  01b5 250e          	jrult	L322
 586  01b7 be18          	ldw	x,L12_rf_halfbittime
 587  01b9 72b0001a      	subw	x,L32_rf_edges_jitter
 588  01bd b31c          	cpw	x,L52_rf_low_time
 589  01bf 2204          	jrugt	L322
 590                     ; 301           rf_offset = rf_low_time;
 592  01c1 be1c          	ldw	x,L52_rf_low_time
 594  01c3 2075          	jpf	LC002
 595  01c5               L322:
 596                     ; 305           RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 598  01c5 35020028      	mov	_RF_waitstart_substate,#2
 599                     ; 306           RF_rcvState = RF_RCVSTATE_WAITSTART;
 600  01c9 ac7c027c      	jpf	LC001
 601  01cd               L371:
 602                     ; 309       else if(FLAG_fall_edge)
 604  01cd b614          	ld	a,L31_FLAG_fall_edge
 605  01cf 2604ac7e027e  	jreq	L731
 606                     ; 311         rf_high_time = cap_fall;
 608  01d5 be65          	ldw	x,L7_cap_fall
 609  01d7 bf1e          	ldw	L72_rf_high_time,x
 610                     ; 312         if(rf_high_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_high_time+rf_offset >= rf_bittime-rf_edges_jitter)
 612  01d9 8d030303      	callf	LC009
 613  01dd 225f          	jrugt	L332
 615  01df 8d140314      	callf	LC010
 616  01e3 2559          	jrult	L332
 617                     ; 314           rf_bittime = ((rf_high_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
 619  01e5 72bb0016      	addw	x,L71_rf_bittime
 620  01e9 8de602e6      	callf	LC007
 621                     ; 318           RF_bits++;
 623  01ed 3c25          	inc	L73_RF_bits
 624                     ; 319           if(RF_bits < 8) RF_data <<= 1;
 626  01ef b625          	ld	a,L73_RF_bits
 627  01f1 a108          	cp	a,#8
 628  01f3 2402          	jruge	L532
 631  01f5 3827          	sll	L34_RF_data
 632  01f7               L532:
 633                     ; 320           if(RF_bits == 8)
 635  01f7 a108          	cp	a,#8
 636  01f9 263e          	jrne	L732
 637                     ; 323             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 639  01fb 8df002f0      	callf	LC008
 640  01ff 260d          	jrne	L142
 641                     ; 328               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 643  0201 be6a          	ldw	x,_RcvRFmsg
 644  0203 a3a55a        	cpw	x,#42330
 645  0206 2706          	jreq	L142
 646                     ; 331                 RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 648  0208 35020028      	mov	_RF_waitstart_substate,#2
 649                     ; 332                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 651  020c 3f29          	clr	L54_RF_rcvState
 652  020e               L142:
 653                     ; 335             if(RF_bytes == RFSEND_DATALEN) 
 655  020e a105          	cp	a,#5
 656  0210 2627          	jrne	L732
 657                     ; 337               RFrcvChksum = 0;
 659  0212 3f00          	clr	L33_RFrcvChksum
 660                     ; 338               for(i=0;i<RFSEND_DATALEN-1;i++)
 662  0214 4f            	clr	a
 663  0215 6b01          	ld	(OFST+0,sp),a
 664  0217               L742:
 665                     ; 340                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 667  0217 5f            	clrw	x
 668  0218 97            	ld	xl,a
 669  0219 b600          	ld	a,L33_RFrcvChksum
 670  021b eb6a          	add	a,(_RcvRFmsg,x)
 671  021d b700          	ld	L33_RFrcvChksum,a
 672                     ; 338               for(i=0;i<RFSEND_DATALEN-1;i++)
 674  021f 0c01          	inc	(OFST+0,sp)
 677  0221 7b01          	ld	a,(OFST+0,sp)
 678  0223 a104          	cp	a,#4
 679  0225 25f0          	jrult	L742
 680                     ; 342               RFrcvChksum = (u8)(~RFrcvChksum);
 682  0227 3300          	cpl	L33_RFrcvChksum
 683                     ; 343               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 685  0229 b66e          	ld	a,_RcvRFmsg+4
 686  022b b100          	cp	a,L33_RFrcvChksum
 687  022d 2604          	jrne	L552
 688                     ; 345                 RFbytesReady = TRUE;  // set new RF data available flag
 690  022f               LC005:
 692  022f 35010023      	mov	_RFbytesReady,#1
 693  0233               L552:
 694                     ; 347               RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
 696                     ; 348               RF_rcvState = RF_RCVSTATE_WAITSTART;
 699  0233 35020028      	mov	_RF_waitstart_substate,#2
 701  0237 3f29          	clr	L54_RF_rcvState
 702  0239               L732:
 703                     ; 351           rf_offset = 0;
 706  0239 5f            	clrw	x
 707  023a               LC002:
 708  023a bf20          	ldw	L13_rf_offset,x
 710  023c 2040          	jra	L731
 711  023e               L332:
 712                     ; 353         else if(rf_high_time <= rf_halfbittime+rf_edges_jitter && rf_high_time >= rf_halfbittime-rf_edges_jitter)
 714  023e be18          	ldw	x,L12_rf_halfbittime
 715  0240 72bb001a      	addw	x,L32_rf_edges_jitter
 716  0244 b31e          	cpw	x,L72_rf_high_time
 717  0246 250e          	jrult	L162
 719  0248 be18          	ldw	x,L12_rf_halfbittime
 720  024a 72b0001a      	subw	x,L32_rf_edges_jitter
 721  024e b31e          	cpw	x,L72_rf_high_time
 722  0250 2204          	jrugt	L162
 723                     ; 355           rf_offset = rf_high_time;
 725  0252 be1e          	ldw	x,L72_rf_high_time
 727  0254 20e4          	jpf	LC002
 728  0256               L162:
 729                     ; 357         else if(rf_high_time <= RF_STARTTIME_HIGH && rf_high_time >= RF_STARTTIME_LOW)
 731  0256 be1e          	ldw	x,L72_rf_high_time
 732  0258 a32711        	cpw	x,#10001
 733  025b 2421          	jruge	L731
 735  025d a300c8        	cpw	x,#200
 736  0260 251c          	jrult	L731
 737                     ; 360           rf_bittime = cap_fall >> 1;            // bit time is half of start time
 739  0262 be65          	ldw	x,L7_cap_fall
 740  0264 8de602e6      	callf	LC007
 741                     ; 363           RF_bits = 0;
 743  0268 3f25          	clr	L73_RF_bits
 744                     ; 364           RF_bytes = 0;
 746  026a 3f26          	clr	L14_RF_bytes
 747                     ; 365           RF_data = 0;
 749  026c 3f27          	clr	L34_RF_data
 750                     ; 366           if(idx < RF_REC_LEN)
 752  026e b622          	ld	a,_idx
 753  0270 a132          	cp	a,#50
 754  0272 2404          	jruge	L762
 755                     ; 367           rcv_buff[0] = cap_fall;
 757  0274 be65          	ldw	x,L7_cap_fall
 758  0276 bf01          	ldw	_rcv_buff,x
 759  0278               L762:
 760                     ; 368           RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
 762  0278 35030028      	mov	_RF_waitstart_substate,#3
 763                     ; 369           RF_rcvState = RF_RCVSTATE_WAITSTART;
 765  027c               LC001:
 767  027c 3f29          	clr	L54_RF_rcvState
 768                     ; 374     default: break;
 770  027e               L731:
 771                     ; 376   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 773  027e a602          	ld	a,#2
 774  0280 cd0000        	call	_TIM3_ClearITPendingBit
 776                     ; 377   TIM3_ClearITPendingBit(TIM3_IT_CC2);
 778  0283 a604          	ld	a,#4
 779  0285 cd0000        	call	_TIM3_ClearITPendingBit
 781                     ; 378   RTMS_MEASURE_STOP(runtime_it_RFrcv);
 783  0288 8dcb02cb      	callf	LC006
 786  028c bf04          	ldw	_runtime_it_RFrcv+4,x
 789  028e be06          	ldw	x,_runtime_it_RFrcv+6
 790  0290 b304          	cpw	x,_runtime_it_RFrcv+4
 791  0292 230d          	jrule	L172
 794  0294 aeffff        	ldw	x,#65535
 795  0297 72b00006      	subw	x,_runtime_it_RFrcv+6
 796  029b 72bb0004      	addw	x,_runtime_it_RFrcv+4
 798  029f 2006          	jra	L372
 799  02a1               L172:
 802  02a1 be04          	ldw	x,_runtime_it_RFrcv+4
 803  02a3 72b00006      	subw	x,_runtime_it_RFrcv+6
 804  02a7               L372:
 805  02a7 bf08          	ldw	_runtime_it_RFrcv+8,x
 808  02a9 be00          	ldw	x,_runtime_it_RFrcv
 809  02ab b308          	cpw	x,_runtime_it_RFrcv+8
 810  02ad 2304          	jrule	L572
 813  02af be08          	ldw	x,_runtime_it_RFrcv+8
 814  02b1 bf00          	ldw	_runtime_it_RFrcv,x
 815  02b3               L572:
 818  02b3 be02          	ldw	x,_runtime_it_RFrcv+2
 819  02b5 b308          	cpw	x,_runtime_it_RFrcv+8
 820  02b7 2404          	jruge	L772
 823  02b9 be08          	ldw	x,_runtime_it_RFrcv+8
 824  02bb bf02          	ldw	_runtime_it_RFrcv+2,x
 825  02bd               L772:
 826                     ; 379 }
 830  02bd 84            	pop	a
 831  02be 85            	popw	x
 832  02bf bf00          	ldw	c_y,x
 833  02c1 320002        	pop	c_y+2
 834  02c4 85            	popw	x
 835  02c5 bf00          	ldw	c_x,x
 836  02c7 320002        	pop	c_x+2
 837  02ca 80            	iret	
 838  02cb               LC006:
 839  02cb c6525b        	ld	a,21083
 840  02ce 5f            	clrw	x
 841  02cf 97            	ld	xl,a
 842  02d0 bf00          	ldw	_tmph,x
 843                     ; 378   RTMS_MEASURE_STOP(runtime_it_RFrcv);
 845  02d2 c6525c        	ld	a,21084
 846  02d5 5f            	clrw	x
 847  02d6 97            	ld	xl,a
 848  02d7 bf00          	ldw	_tmpl,x
 851  02d9 bf00          	ldw	_tmp,x
 854  02db b601          	ld	a,_tmp+1
 855  02dd be00          	ldw	x,_tmph
 856  02df 01            	rrwa	x,a
 857  02e0 ba00          	or	a,_tmp
 858  02e2 01            	rrwa	x,a
 859  02e3 bf00          	ldw	_tmp,x
 860  02e5 87            	retf	
 861  02e6               LC007:
 862  02e6 54            	srlw	x
 863  02e7 bf16          	ldw	L71_rf_bittime,x
 864                     ; 196               rf_halfbittime = rf_bittime >> 1;      // half of bit time
 866  02e9 54            	srlw	x
 867  02ea bf18          	ldw	L12_rf_halfbittime,x
 868                     ; 197               rf_edges_jitter = rf_halfbittime >> 1; // maximum accepted edges jitter is a quarter bit time
 870  02ec 54            	srlw	x
 871  02ed bf1a          	ldw	L32_rf_edges_jitter,x
 872  02ef 87            	retf	
 873  02f0               LC008:
 874  02f0 b626          	ld	a,L14_RF_bytes
 875  02f2 3c26          	inc	L14_RF_bytes
 876  02f4 5f            	clrw	x
 877  02f5 97            	ld	xl,a
 878  02f6 b627          	ld	a,L34_RF_data
 879  02f8 e76a          	ld	(_RcvRFmsg,x),a
 880                     ; 270             RF_bits = 0;
 882  02fa 3f25          	clr	L73_RF_bits
 883                     ; 271             RF_data = 0;
 885  02fc 3f27          	clr	L34_RF_data
 886                     ; 272             if(RF_bytes == 2)
 888  02fe b626          	ld	a,L14_RF_bytes
 889  0300 a102          	cp	a,#2
 890  0302 87            	retf	
 891  0303               LC009:
 892  0303 90be16        	ldw	y,L71_rf_bittime
 893  0306 72bb0020      	addw	x,L13_rf_offset
 894  030a 72b9001a      	addw	y,L32_rf_edges_jitter
 895  030e 90bf00        	ldw	c_y,y
 896  0311 b300          	cpw	x,c_y
 897  0313 87            	retf	
 898  0314               LC010:
 899  0314 90be16        	ldw	y,L71_rf_bittime
 900  0317 72b2001a      	subw	y,L32_rf_edges_jitter
 901  031b 90bf00        	ldw	c_y,y
 902  031e b300          	cpw	x,c_y
 903  0320 87            	retf	
 965                     ; 386 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 965                     ; 387 {
 966                     .text:	section	.text,new
 967  0000               f_TIM4_UPD_OVF_IRQHandler:
 969  0000 8a            	push	cc
 970  0001 84            	pop	a
 971  0002 a4bf          	and	a,#191
 972  0004 88            	push	a
 973  0005 86            	pop	cc
 974  0006 3b0002        	push	c_x+2
 975  0009 be00          	ldw	x,c_x
 976  000b 89            	pushw	x
 977  000c 3b0002        	push	c_y+2
 978  000f be00          	ldw	x,c_y
 979  0011 89            	pushw	x
 982                     ; 391   RTMS_MEASURE_START(runtime_it_1ms);
 984  0012 8de401e4      	callf	LC012
 987  0016 bf06          	ldw	_runtime_it_1ms+6,x
 988                     ; 392   interrupt_status = 1;
 991  0018 35010069      	mov	L3_interrupt_status,#1
 992                     ; 393   if(TIM4_GetITStatus(TIM4_IT_Update))  //1ms
 994  001c a601          	ld	a,#1
 995  001e cd0000        	call	_TIM4_GetITStatus
 997  0021 4d            	tnz	a
 998  0022 2604aca001a0  	jreq	L113
 999                     ; 396     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
1001  0028 be00          	ldw	x,_cnt_flag_500ms
1002  002a a3ffff        	cpw	x,#65535
1003  002d 2403          	jruge	L313
1006  002f 5c            	incw	x
1007  0030 bf00          	ldw	_cnt_flag_500ms,x
1008  0032               L313:
1009                     ; 397     if(cnt_flag_500ms >= CNTVAL_500MS) 
1011  0032 a301f4        	cpw	x,#500
1012  0035 2507          	jrult	L513
1013                     ; 399       cnt_flag_500ms = 0;
1015  0037 5f            	clrw	x
1016  0038 bf00          	ldw	_cnt_flag_500ms,x
1017                     ; 400       FLAG_500ms = TRUE;
1019  003a 72100000      	bset	_FLAG_500ms
1020  003e               L513:
1021                     ; 402     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
1023  003e be02          	ldw	x,_cnt_flag_1000ms
1024  0040 a3ffff        	cpw	x,#65535
1025  0043 2403          	jruge	L713
1028  0045 5c            	incw	x
1029  0046 bf02          	ldw	_cnt_flag_1000ms,x
1030  0048               L713:
1031                     ; 403     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
1033  0048 a303e8        	cpw	x,#1000
1034  004b 2507          	jrult	L123
1035                     ; 405       cnt_flag_1000ms = 0;
1037  004d 5f            	clrw	x
1038  004e bf02          	ldw	_cnt_flag_1000ms,x
1039                     ; 406       FLAG_1000ms = TRUE;
1041  0050 72100001      	bset	_FLAG_1000ms
1042  0054               L123:
1043                     ; 409     if(!Timeout_istout1)
1045  0054 720000000d    	btjt	_Timeout_istout1,L323
1046                     ; 411       Timeout_toutcnt1++;
1048  0059 be00          	ldw	x,_Timeout_toutcnt1
1049  005b 5c            	incw	x
1050  005c bf00          	ldw	_Timeout_toutcnt1,x
1051                     ; 412       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
1053  005e b300          	cpw	x,_Timeout_tout1
1054  0060 2504          	jrult	L323
1057  0062 72100000      	bset	_Timeout_istout1
1058  0066               L323:
1059                     ; 414     if(!Timeout_istout2)
1061  0066 720000000d    	btjt	_Timeout_istout2,L723
1062                     ; 416       Timeout_toutcnt2++;
1064  006b be00          	ldw	x,_Timeout_toutcnt2
1065  006d 5c            	incw	x
1066  006e bf00          	ldw	_Timeout_toutcnt2,x
1067                     ; 417       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1069  0070 b300          	cpw	x,_Timeout_tout2
1070  0072 2504          	jrult	L723
1073  0074 72100000      	bset	_Timeout_istout2
1074  0078               L723:
1075                     ; 419     if(!Timeout_istout3)
1077  0078 720000000d    	btjt	_Timeout_istout3,L333
1078                     ; 421       Timeout_toutcnt3++;
1080  007d be00          	ldw	x,_Timeout_toutcnt3
1081  007f 5c            	incw	x
1082  0080 bf00          	ldw	_Timeout_toutcnt3,x
1083                     ; 422       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1085  0082 b300          	cpw	x,_Timeout_tout3
1086  0084 2504          	jrult	L333
1089  0086 72100000      	bset	_Timeout_istout3
1090  008a               L333:
1091                     ; 425     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
1093  008a b624          	ld	a,L53_RFrcvTimeoutcnt
1094  008c a1ff          	cp	a,#255
1095  008e 2404          	jruge	L733
1098  0090 3c24          	inc	L53_RFrcvTimeoutcnt
1099  0092 b624          	ld	a,L53_RFrcvTimeoutcnt
1100  0094               L733:
1101                     ; 426     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1103  0094 a164          	cp	a,#100
1104  0096 2506          	jrult	L143
1105                     ; 428       RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
1107  0098 35020028      	mov	_RF_waitstart_substate,#2
1108                     ; 429       RF_rcvState = RF_RCVSTATE_WAITSTART;
1110  009c 3f29          	clr	L54_RF_rcvState
1111  009e               L143:
1112                     ; 433     if(!BTN1_STATE)
1114  009e 7204500116    	btjt	20481,#2,L343
1115                     ; 435       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1117  00a3 b604          	ld	a,_btn1_0_cnt
1118  00a5 a1ff          	cp	a,#255
1119  00a7 2402          	jruge	L543
1122  00a9 3c04          	inc	_btn1_0_cnt
1123  00ab               L543:
1124                     ; 436       btn1_1_cnt = 0;
1126  00ab 3f05          	clr	_btn1_1_cnt
1127                     ; 437       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1129  00ad b604          	ld	a,_btn1_0_cnt
1130  00af a11e          	cp	a,#30
1131  00b1 2518          	jrult	L153
1132                     ; 439         BTN1_DEB_STATE = BTN_PRESSED;
1134  00b3 35010006      	mov	_BTN1_DEB_STATE,#1
1135  00b7 2012          	jra	L153
1136  00b9               L343:
1137                     ; 444       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1139  00b9 b605          	ld	a,_btn1_1_cnt
1140  00bb a1ff          	cp	a,#255
1141  00bd 2402          	jruge	L353
1144  00bf 3c05          	inc	_btn1_1_cnt
1145  00c1               L353:
1146                     ; 445       btn1_0_cnt = 0;
1148  00c1 3f04          	clr	_btn1_0_cnt
1149                     ; 446       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1151  00c3 b605          	ld	a,_btn1_1_cnt
1152  00c5 a11e          	cp	a,#30
1153  00c7 2502          	jrult	L153
1154                     ; 448         BTN1_DEB_STATE = BTN_DEPRESSED;
1156  00c9 3f06          	clr	_BTN1_DEB_STATE
1157  00cb               L153:
1158                     ; 454     if(BTN1_DEB_STATE == BTN_PRESSED)
1160  00cb b606          	ld	a,_BTN1_DEB_STATE
1161  00cd 4a            	dec	a
1162  00ce 260a          	jrne	L753
1163                     ; 456       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1165  00d0 be08          	ldw	x,_BTN1_press_timer
1166  00d2 a3ffff        	cpw	x,#65535
1167  00d5 2403          	jruge	L753
1170  00d7 5c            	incw	x
1171  00d8 bf08          	ldw	_BTN1_press_timer,x
1172  00da               L753:
1173                     ; 459     if(!BTN1_DELAY_FLAG)
1175  00da 720000020e    	btjt	_BTN1_DELAY_FLAG,L363
1176                     ; 461       btn1_delay_cnt++;
1178  00df 3c07          	inc	_btn1_delay_cnt
1179                     ; 462       if(btn1_delay_cnt == BTN_DELAY)
1181  00e1 b607          	ld	a,_btn1_delay_cnt
1182  00e3 a196          	cp	a,#150
1183  00e5 2606          	jrne	L363
1184                     ; 464         btn1_delay_cnt = 0;
1186  00e7 3f07          	clr	_btn1_delay_cnt
1187                     ; 465         BTN1_DELAY_FLAG = TRUE;
1189  00e9 72100002      	bset	_BTN1_DELAY_FLAG
1190  00ed               L363:
1191                     ; 471     if(flag_blink_redLED)
1193  00ed 7201000450    	btjf	_flag_blink_redLED,L763
1194                     ; 473       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1196  00f2 be0b          	ldw	x,_cnt_state_redLED
1197  00f4 a3ffff        	cpw	x,#65535
1198  00f7 2403          	jruge	L173
1201  00f9 5c            	incw	x
1202  00fa bf0b          	ldw	_cnt_state_redLED,x
1203  00fc               L173:
1204                     ; 474       if(flag_blink_on_off)
1206  00fc 7201000312    	btjf	_flag_blink_on_off,L373
1207                     ; 476         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1209  0101 a30032        	cpw	x,#50
1210  0104 253c          	jrult	L763
1211                     ; 478           flag_blink_on_off = FALSE;
1213  0106 72110003      	bres	_flag_blink_on_off
1214                     ; 479           cnt_state_redLED = 0;
1216  010a 5f            	clrw	x
1217  010b bf0b          	ldw	_cnt_state_redLED,x
1218                     ; 480           LED_OFF;
1220  010d 7217500a      	bres	20490,#3
1223  0111 202b          	jpf	LC011
1224  0113               L373:
1225                     ; 485         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1227  0113 a300c8        	cpw	x,#200
1228  0116 252a          	jrult	L763
1229                     ; 487           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1231  0118 b60f          	ld	a,_cnt_blink_redLED
1232  011a a1ff          	cp	a,#255
1233  011c 2402          	jruge	L304
1236  011e 3c0f          	inc	_cnt_blink_redLED
1237  0120               L304:
1238                     ; 488           flag_blink_on_off = TRUE;
1240  0120 72100003      	bset	_flag_blink_on_off
1241                     ; 489           cnt_state_redLED = 0;
1243  0124 5f            	clrw	x
1244  0125 bf0b          	ldw	_cnt_state_redLED,x
1245                     ; 490           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1247  0127 b60f          	ld	a,_cnt_blink_redLED
1248  0129 b111          	cp	a,_blink_redLED_times
1249  012b 250d          	jrult	L504
1251  012d 7200000608    	btjt	_flag_blink_unlimited,L504
1252                     ; 492             flag_blink_redLED = FALSE;
1254  0132 72110004      	bres	_flag_blink_redLED
1255                     ; 493             cnt_blink_redLED = 0;
1257  0136 3f0f          	clr	_cnt_blink_redLED
1259  0138 2008          	jra	L763
1260  013a               L504:
1261                     ; 497             LED_RED_ON;
1263  013a 7216500a      	bset	20490,#3
1266  013e               LC011:
1268  013e 7219500a      	bres	20490,#4
1270  0142               L763:
1271                     ; 502     if(flag_blink_greenLED)
1273  0142 7201000554    	btjf	_flag_blink_greenLED,L114
1274                     ; 504       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1276  0147 be0d          	ldw	x,_cnt_state_greenLED
1277  0149 a3ffff        	cpw	x,#65535
1278  014c 2403          	jruge	L314
1281  014e 5c            	incw	x
1282  014f bf0d          	ldw	_cnt_state_greenLED,x
1283  0151               L314:
1284                     ; 505       if(flag_blink_on_off)
1286  0151 7201000316    	btjf	_flag_blink_on_off,L514
1287                     ; 507         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1289  0156 a30032        	cpw	x,#50
1290  0159 2540          	jrult	L114
1291                     ; 509           flag_blink_on_off = FALSE;
1293  015b 72110003      	bres	_flag_blink_on_off
1294                     ; 510           cnt_state_greenLED = 0;
1296  015f 5f            	clrw	x
1297  0160 bf0d          	ldw	_cnt_state_greenLED,x
1298                     ; 511           LED_OFF;
1300  0162 7217500a      	bres	20490,#3
1303  0166 7219500a      	bres	20490,#4
1305  016a 202f          	jra	L114
1306  016c               L514:
1307                     ; 516         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1309  016c a300c8        	cpw	x,#200
1310  016f 252a          	jrult	L114
1311                     ; 518           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1313  0171 b610          	ld	a,_cnt_blink_greenLED
1314  0173 a1ff          	cp	a,#255
1315  0175 2402          	jruge	L524
1318  0177 3c10          	inc	_cnt_blink_greenLED
1319  0179               L524:
1320                     ; 519           flag_blink_on_off = TRUE;
1322  0179 72100003      	bset	_flag_blink_on_off
1323                     ; 520           cnt_state_greenLED = 0;
1325  017d 5f            	clrw	x
1326  017e bf0d          	ldw	_cnt_state_greenLED,x
1327                     ; 521           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1329  0180 b610          	ld	a,_cnt_blink_greenLED
1330  0182 b112          	cp	a,_blink_greenLED_times
1331  0184 250d          	jrult	L724
1333  0186 7200000608    	btjt	_flag_blink_unlimited,L724
1334                     ; 523             flag_blink_greenLED = FALSE;
1336  018b 72110005      	bres	_flag_blink_greenLED
1337                     ; 524             cnt_blink_greenLED = 0;
1339  018f 3f10          	clr	_cnt_blink_greenLED
1341  0191 2008          	jra	L114
1342  0193               L724:
1343                     ; 528             LED_GREEN_ON;
1345  0193 7217500a      	bres	20490,#3
1348  0197 7218500a      	bset	20490,#4
1350  019b               L114:
1351                     ; 534     TIM4_ClearITPendingBit(TIM4_IT_Update);        // clear TIM4 update interrupt flag
1353  019b a601          	ld	a,#1
1354  019d cd0000        	call	_TIM4_ClearITPendingBit
1356  01a0               L113:
1357                     ; 536   interrupt_status = 0;
1359  01a0 3f69          	clr	L3_interrupt_status
1360                     ; 537   RTMS_MEASURE_STOP(runtime_it_1ms);
1362  01a2 8de401e4      	callf	LC012
1365  01a6 bf04          	ldw	_runtime_it_1ms+4,x
1368  01a8 be06          	ldw	x,_runtime_it_1ms+6
1369  01aa b304          	cpw	x,_runtime_it_1ms+4
1370  01ac 230d          	jrule	L334
1373  01ae aeffff        	ldw	x,#65535
1374  01b1 72b00006      	subw	x,_runtime_it_1ms+6
1375  01b5 72bb0004      	addw	x,_runtime_it_1ms+4
1377  01b9 2006          	jra	L534
1378  01bb               L334:
1381  01bb be04          	ldw	x,_runtime_it_1ms+4
1382  01bd 72b00006      	subw	x,_runtime_it_1ms+6
1383  01c1               L534:
1384  01c1 bf08          	ldw	_runtime_it_1ms+8,x
1387  01c3 be00          	ldw	x,_runtime_it_1ms
1388  01c5 b308          	cpw	x,_runtime_it_1ms+8
1389  01c7 2304          	jrule	L734
1392  01c9 be08          	ldw	x,_runtime_it_1ms+8
1393  01cb bf00          	ldw	_runtime_it_1ms,x
1394  01cd               L734:
1397  01cd be02          	ldw	x,_runtime_it_1ms+2
1398  01cf b308          	cpw	x,_runtime_it_1ms+8
1399  01d1 2404          	jruge	L144
1402  01d3 be08          	ldw	x,_runtime_it_1ms+8
1403  01d5 bf02          	ldw	_runtime_it_1ms+2,x
1404  01d7               L144:
1405                     ; 538 }
1409  01d7 85            	popw	x
1410  01d8 bf00          	ldw	c_y,x
1411  01da 320002        	pop	c_y+2
1412  01dd 85            	popw	x
1413  01de bf00          	ldw	c_x,x
1414  01e0 320002        	pop	c_x+2
1415  01e3 80            	iret	
1416  01e4               LC012:
1417  01e4 c6525b        	ld	a,21083
1418  01e7 5f            	clrw	x
1419  01e8 97            	ld	xl,a
1420  01e9 bf00          	ldw	_tmph,x
1421                     ; 537   RTMS_MEASURE_STOP(runtime_it_1ms);
1423  01eb c6525c        	ld	a,21084
1424  01ee 5f            	clrw	x
1425  01ef 97            	ld	xl,a
1426  01f0 bf00          	ldw	_tmpl,x
1429  01f2 bf00          	ldw	_tmp,x
1432  01f4 b601          	ld	a,_tmp+1
1433  01f6 be00          	ldw	x,_tmph
1434  01f8 01            	rrwa	x,a
1435  01f9 ba00          	or	a,_tmp
1436  01fb 01            	rrwa	x,a
1437  01fc bf00          	ldw	_tmp,x
1438  01fe 87            	retf	
1461                     ; 545 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
1461                     ; 546 {
1462                     .text:	section	.text,new
1463  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
1467                     ; 550 }
1470  0000 80            	iret	
1493                     ; 557 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1493                     ; 558 {
1494                     .text:	section	.text,new
1495  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1499                     ; 562 }
1502  0000 80            	iret	
1524                     ; 569 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
1524                     ; 570 {
1525                     .text:	section	.text,new
1526  0000               f_TRAP_IRQHandler:
1530                     ; 574 }
1533  0000 80            	iret	
1555                     ; 581 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
1555                     ; 582 {
1556                     .text:	section	.text,new
1557  0000               f_FLASH_IRQHandler:
1561                     ; 586 }
1564  0000 80            	iret	
1586                     ; 593 INTERRUPT_HANDLER(AWU_IRQHandler,4)
1586                     ; 594 {
1587                     .text:	section	.text,new
1588  0000               f_AWU_IRQHandler:
1592                     ; 598 }
1595  0000 80            	iret	
1617                     ; 605 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
1617                     ; 606 {
1618                     .text:	section	.text,new
1619  0000               f_EXTIB_IRQHandler:
1623                     ; 610 }
1626  0000 80            	iret	
1648                     ; 617 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
1648                     ; 618 {
1649                     .text:	section	.text,new
1650  0000               f_EXTID_IRQHandler:
1654                     ; 622 }
1657  0000 80            	iret	
1679                     ; 629 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
1679                     ; 630 {
1680                     .text:	section	.text,new
1681  0000               f_EXTI0_IRQHandler:
1685                     ; 634 }
1688  0000 80            	iret	
1710                     ; 641 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
1710                     ; 642 {
1711                     .text:	section	.text,new
1712  0000               f_EXTI1_IRQHandler:
1716                     ; 646 }
1719  0000 80            	iret	
1741                     ; 653 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
1741                     ; 654 {
1742                     .text:	section	.text,new
1743  0000               f_EXTI2_IRQHandler:
1747                     ; 658 }
1750  0000 80            	iret	
1772                     ; 665 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
1772                     ; 666 {
1773                     .text:	section	.text,new
1774  0000               f_EXTI3_IRQHandler:
1778                     ; 670 }
1781  0000 80            	iret	
1803                     ; 677 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1803                     ; 678 {
1804                     .text:	section	.text,new
1805  0000               f_EXTI4_IRQHandler:
1809                     ; 682 }
1812  0000 80            	iret	
1834                     ; 689 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1834                     ; 690 {
1835                     .text:	section	.text,new
1836  0000               f_EXTI5_IRQHandler:
1840                     ; 694 }
1843  0000 80            	iret	
1865                     ; 701 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1865                     ; 702 {
1866                     .text:	section	.text,new
1867  0000               f_EXTI6_IRQHandler:
1871                     ; 706 }
1874  0000 80            	iret	
1896                     ; 713 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1896                     ; 714 {
1897                     .text:	section	.text,new
1898  0000               f_EXTI7_IRQHandler:
1902                     ; 718 }
1905  0000 80            	iret	
1927                     ; 725 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1927                     ; 726 {
1928                     .text:	section	.text,new
1929  0000               f_COMP_IRQHandler:
1933                     ; 730 }
1936  0000 80            	iret	
1959                     ; 737 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1959                     ; 738 {
1960                     .text:	section	.text,new
1961  0000               f_TIM2_CAP_IRQHandler:
1965                     ; 742 }
1968  0000 80            	iret	
1990                     ; 749 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1990                     ; 750 {
1991                     .text:	section	.text,new
1992  0000               f_SPI_IRQHandler:
1996                     ; 754 }
1999  0000 80            	iret	
2022                     ; 760 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
2022                     ; 761 {
2023                     .text:	section	.text,new
2024  0000               f_USART_TX_IRQHandler:
2028                     ; 765 }
2031  0000 80            	iret	
2054                     ; 772 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
2054                     ; 773 {
2055                     .text:	section	.text,new
2056  0000               f_USART_RX_IRQHandler:
2060                     ; 777 }
2063  0000 80            	iret	
2085                     ; 785 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
2085                     ; 786 {
2086                     .text:	section	.text,new
2087  0000               f_I2C_IRQHandler:
2091                     ; 790 }
2094  0000 80            	iret	
2635                     	xref.b	_runtime_it_RFrcv
2636                     	xref.b	_tmp
2637                     	xref.b	_tmpl
2638                     	xref.b	_tmph
2639                     	xref.b	_runtime_it_1ms
2640                     	xdef	_FLAG_UART_cmd_rcv
2641                     	xdef	_RF_waitstart_substate
2642                     	switch	.ubsct
2643  0000               L33_RFrcvChksum:
2644  0000 00            	ds.b	1
2645                     	xdef	_idx
2646  0001               _rcv_buff:
2647  0001 000000000000  	ds.b	100
2648                     	xdef	_rcv_buff
2649  0065               L7_cap_fall:
2650  0065 0000          	ds.b	2
2651  0067               L5_cap_rise:
2652  0067 0000          	ds.b	2
2653                     	xdef	_cnt_blink_greenLED
2654                     	xdef	_cnt_blink_redLED
2655                     	xdef	_debug
2656  0069               L3_interrupt_status:
2657  0069 00            	ds.b	1
2658                     	xref.b	_Timeout_tout3
2659                     	xref.b	_Timeout_tout2
2660                     	xref.b	_Timeout_tout1
2661                     	xref.b	_Timeout_toutcnt3
2662                     	xref.b	_Timeout_toutcnt2
2663                     	xref.b	_Timeout_toutcnt1
2664                     	xbit	_Timeout_istout3
2665                     	xbit	_Timeout_istout2
2666                     	xbit	_Timeout_istout1
2667                     	xdef	_btn1_delay_cnt
2668                     	xdef	_btn1_1_cnt
2669                     	xdef	_btn1_0_cnt
2670                     	xdef	_cnt_flag_1000ms
2671                     	xdef	_cnt_flag_500ms
2672                     	xdef	f_I2C_IRQHandler
2673                     	xdef	f_USART_RX_IRQHandler
2674                     	xdef	f_USART_TX_IRQHandler
2675                     	xdef	f_SPI_IRQHandler
2676                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2677                     	xdef	f_TIM3_CAP_IRQHandler
2678                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2679                     	xdef	f_TIM2_CAP_IRQHandler
2680                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2681                     	xdef	f_COMP_IRQHandler
2682                     	xdef	f_EXTI7_IRQHandler
2683                     	xdef	f_EXTI6_IRQHandler
2684                     	xdef	f_EXTI5_IRQHandler
2685                     	xdef	f_EXTI4_IRQHandler
2686                     	xdef	f_EXTI3_IRQHandler
2687                     	xdef	f_EXTI2_IRQHandler
2688                     	xdef	f_EXTI1_IRQHandler
2689                     	xdef	f_EXTI0_IRQHandler
2690                     	xdef	f_EXTID_IRQHandler
2691                     	xdef	f_EXTIB_IRQHandler
2692                     	xdef	f_AWU_IRQHandler
2693                     	xdef	f_FLASH_IRQHandler
2694                     	xdef	f_TRAP_IRQHandler
2695                     	xdef	f_NonHandledInterrupt
2696                     	xdef	_RFbytesReady
2697  006a               _RcvRFmsg:
2698  006a 0000000000    	ds.b	5
2699                     	xdef	_RcvRFmsg
2700                     	xdef	_flag_blink_unlimited
2701                     	xdef	_flag_blink_greenLED
2702                     	xdef	_flag_blink_redLED
2703                     	xdef	_flag_blink_on_off
2704                     	xdef	_cnt_state_greenLED
2705                     	xdef	_cnt_state_redLED
2706                     	xdef	_blink_greenLED_times
2707                     	xdef	_blink_redLED_times
2708                     	xdef	_FLAG_1000ms
2709                     	xdef	_FLAG_500ms
2710                     	xdef	_BTN1_press_timer
2711                     	xdef	_BTN1_DELAY_FLAG
2712                     	xdef	_BTN1_DEB_STATE
2713                     	xref	_TIM4_ClearITPendingBit
2714                     	xref	_TIM4_GetITStatus
2715                     	xref	_TIM3_ClearITPendingBit
2716                     	xref	_TIM3_GetITStatus
2717                     	xref	_TIM3_GetCapture2
2718                     	xref	_TIM3_GetCapture1
2719                     	xref.b	c_x
2720                     	xref.b	c_y
2740                     	end
