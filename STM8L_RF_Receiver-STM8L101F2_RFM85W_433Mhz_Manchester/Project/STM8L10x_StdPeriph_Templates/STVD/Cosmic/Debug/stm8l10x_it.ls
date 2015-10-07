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
  83  0018               L71_FLAG_start_found:
  84  0018 00            	dc.b	0
  85  0019               L12_rf_bittime:
  86  0019 0000          	dc.w	0
  87  001b               L32_rf_halfbittime:
  88  001b 0000          	dc.w	0
  89  001d               L52_rf_low_time:
  90  001d 0000          	dc.w	0
  91  001f               L72_rf_high_time:
  92  001f 0000          	dc.w	0
  93  0021               L13_rf_offset:
  94  0021 0000          	dc.w	0
  95  0023               _idx:
  96  0023 00            	dc.b	0
  97  0024               _RFbytesReady:
  98  0024 00            	dc.b	0
  99  0025               L53_RFrcvTimeoutcnt:
 100  0025 00            	dc.b	0
 101  0026               L73_RF_bits:
 102  0026 00            	dc.b	0
 103  0027               L14_RF_bytes:
 104  0027 00            	dc.b	0
 105  0028               L34_RF_data:
 106  0028 00            	dc.b	0
 107  0029               L54_RF_rcvState:
 108  0029 00            	dc.b	0
 109                     	switch	.bit
 110  0008               _FLAG_UART_cmd_rcv:
 111  0008 00            	dc.b	0
 141                     ; 130 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 141                     ; 131 {
 142                     .text:	section	.text,new
 143  0000               f_NonHandledInterrupt:
 147                     ; 135 }
 150  0000 80            	iret	
 218                     ; 142 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 218                     ; 143 {
 219                     .text:	section	.text,new
 220  0000               f_TIM3_CAP_IRQHandler:
 222  0000 8a            	push	cc
 223  0001 84            	pop	a
 224  0002 a4bf          	and	a,#191
 225  0004 88            	push	a
 226  0005 86            	pop	cc
 227       00000001      OFST:	set	1
 228  0006 3b0002        	push	c_x+2
 229  0009 be00          	ldw	x,c_x
 230  000b 89            	pushw	x
 231  000c 3b0002        	push	c_y+2
 232  000f be00          	ldw	x,c_y
 233  0011 89            	pushw	x
 234  0012 88            	push	a
 237                     ; 151   if(TIM3_GetITStatus(TIM3_IT_CC1) == SET) {
 239  0013 a602          	ld	a,#2
 240  0015 cd0000        	call	_TIM3_GetITStatus
 242  0018 4a            	dec	a
 243  0019 260b          	jrne	L511
 244                     ; 152     cap_rise = TIM3_GetCapture1();
 246  001b cd0000        	call	_TIM3_GetCapture1
 248  001e bf9d          	ldw	L5_cap_rise,x
 249                     ; 153     FLAG_rise_edge = TRUE;
 251  0020 35010015      	mov	L11_FLAG_rise_edge,#1
 253  0024 2002          	jra	L711
 254  0026               L511:
 255                     ; 155   else FLAG_rise_edge = FALSE;
 257  0026 3f15          	clr	L11_FLAG_rise_edge
 258  0028               L711:
 259                     ; 156   if(TIM3_GetITStatus(TIM3_IT_CC2) == SET) {
 261  0028 a604          	ld	a,#4
 262  002a cd0000        	call	_TIM3_GetITStatus
 264  002d 4a            	dec	a
 265  002e 260b          	jrne	L121
 266                     ; 157     cap_fall = TIM3_GetCapture2();
 268  0030 cd0000        	call	_TIM3_GetCapture2
 270  0033 bf9b          	ldw	L7_cap_fall,x
 271                     ; 158     FLAG_fall_edge = TRUE;
 273  0035 35010016      	mov	L31_FLAG_fall_edge,#1
 275  0039 2002          	jra	L321
 276  003b               L121:
 277                     ; 160   else FLAG_fall_edge = FALSE;
 279  003b 3f16          	clr	L31_FLAG_fall_edge
 280  003d               L321:
 281                     ; 161   if(FLAG_rise_edge && FLAG_fall_edge) {
 283  003d b615          	ld	a,L11_FLAG_rise_edge
 284  003f 2708          	jreq	L521
 286  0041 b616          	ld	a,L31_FLAG_fall_edge
 287  0043 2704          	jreq	L521
 288                     ; 162     FLAG_CC_Error = TRUE;
 290  0045 35010017      	mov	L51_FLAG_CC_Error,#1
 291  0049               L521:
 292                     ; 165   RFrcvTimeoutcnt = 0;
 294  0049 3f25          	clr	L53_RFrcvTimeoutcnt
 295                     ; 166   switch(RF_rcvState)
 297  004b b629          	ld	a,L54_RF_rcvState
 299                     ; 321     default: break;
 300  004d 270b          	jreq	L56
 301  004f 4a            	dec	a
 302  0050 2604acdf00df  	jreq	L76
 303  0056 acf901f9      	jra	L131
 304  005a               L56:
 305                     ; 170       if(FLAG_fall_edge)
 307  005a 3d16          	tnz	L31_FLAG_fall_edge
 308  005c 2725          	jreq	L331
 309                     ; 172         if(cap_fall >= 500 - RF_EDGES_JITTER && cap_fall <= 500 + RF_EDGES_JITTER)
 311  005e be9b          	ldw	x,L7_cap_fall
 312  0060 a301ae        	cpw	x,#430
 313  0063 251e          	jrult	L331
 315  0065 a3023b        	cpw	x,#571
 316  0068 2419          	jruge	L331
 317                     ; 174           rf_bittime = cap_fall;
 319  006a bf19          	ldw	L12_rf_bittime,x
 320                     ; 175           rf_halfbittime = rf_bittime >> 1;
 322  006c 54            	srlw	x
 323  006d bf1b          	ldw	L32_rf_halfbittime,x
 324                     ; 176           RF_bits = 0;
 326  006f b726          	ld	L73_RF_bits,a
 327                     ; 177           RF_bytes = 0;
 329  0071 b727          	ld	L14_RF_bytes,a
 330                     ; 178           RF_data = 0;
 332  0073 b728          	ld	L34_RF_data,a
 333                     ; 179           if(idx < RF_REC_LEN)
 335  0075 b623          	ld	a,_idx
 336  0077 a14d          	cp	a,#77
 337  0079 2404          	jruge	L731
 338                     ; 180           rcv_buff[0] = cap_fall;
 340  007b be9b          	ldw	x,L7_cap_fall
 341  007d bf01          	ldw	_rcv_buff,x
 342  007f               L731:
 343                     ; 181           FLAG_start_found = TRUE;
 345  007f 35010018      	mov	L71_FLAG_start_found,#1
 346  0083               L331:
 347                     ; 184       if(FLAG_rise_edge && FLAG_start_found)
 349  0083 b615          	ld	a,L11_FLAG_rise_edge
 350  0085 27cf          	jreq	L131
 352  0087 b618          	ld	a,L71_FLAG_start_found
 353  0089 27cb          	jreq	L131
 354                     ; 186         rf_low_time = cap_rise-cap_fall;
 356  008b be9d          	ldw	x,L5_cap_rise
 357  008d 72b0009b      	subw	x,L7_cap_fall
 358  0091 bf1d          	ldw	L52_rf_low_time,x
 359                     ; 187         if(rf_low_time <= rf_bittime+RF_EDGES_JITTER && rf_low_time >= rf_bittime-RF_EDGES_JITTER)
 361  0093 be19          	ldw	x,L12_rf_bittime
 362  0095 1c0046        	addw	x,#70
 363  0098 b31d          	cpw	x,L52_rf_low_time
 364  009a 251b          	jrult	L341
 366  009c be19          	ldw	x,L12_rf_bittime
 367  009e 1d0046        	subw	x,#70
 368  00a1 b31d          	cpw	x,L52_rf_low_time
 369  00a3 2212          	jrugt	L341
 370                     ; 190           RF_data |= 0x01;
 372  00a5 72100028      	bset	L34_RF_data,#0
 373                     ; 191           RF_bits++;
 375  00a9 3c26          	inc	L73_RF_bits
 376                     ; 192           RF_data <<= 1;
 378  00ab 3828          	sll	L34_RF_data
 379                     ; 193           idx = 2;
 381  00ad 35020023      	mov	_idx,#2
 382                     ; 194           rcv_buff[1] = rf_low_time;
 384  00b1 be1d          	ldw	x,L52_rf_low_time
 385  00b3 bf03          	ldw	_rcv_buff+2,x
 386                     ; 195           RF_rcvState = RF_RCVSTATE_RECBITS;
 388  00b5 201a          	jpf	LC001
 389  00b7               L341:
 390                     ; 197         else if(rf_low_time <= rf_halfbittime+RF_EDGES_JITTER && rf_low_time >= rf_halfbittime-RF_EDGES_JITTER)
 392  00b7 be1b          	ldw	x,L32_rf_halfbittime
 393  00b9 1c0046        	addw	x,#70
 394  00bc b31d          	cpw	x,L52_rf_low_time
 395  00be 2517          	jrult	L741
 397  00c0 be1b          	ldw	x,L32_rf_halfbittime
 398  00c2 1d0046        	subw	x,#70
 399  00c5 b31d          	cpw	x,L52_rf_low_time
 400  00c7 220e          	jrugt	L741
 401                     ; 199           rf_offset = rf_low_time;
 403  00c9 be1d          	ldw	x,L52_rf_low_time
 404  00cb bf21          	ldw	L13_rf_offset,x
 405                     ; 200           idx = 2;
 407  00cd 35020023      	mov	_idx,#2
 408                     ; 201           RF_rcvState = RF_RCVSTATE_RECBITS;
 410  00d1               LC001:
 412  00d1 35010029      	mov	L54_RF_rcvState,#1
 414  00d5 2002          	jra	L541
 415  00d7               L741:
 416                     ; 205           RF_rcvState = RF_RCVSTATE_WAITSTART;
 418  00d7 3f29          	clr	L54_RF_rcvState
 419  00d9               L541:
 420                     ; 207         FLAG_start_found = FALSE;
 422  00d9 3f18          	clr	L71_FLAG_start_found
 423  00db acf901f9      	jra	L131
 424  00df               L76:
 425                     ; 214       if(idx < RF_REC_LEN)
 427  00df b623          	ld	a,_idx
 428  00e1 a14d          	cp	a,#77
 429  00e3 2425          	jruge	L351
 430                     ; 216         if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
 432  00e5 b615          	ld	a,L11_FLAG_rise_edge
 433  00e7 2715          	jreq	L551
 436  00e9 be9d          	ldw	x,L5_cap_rise
 437  00eb 72b0009b      	subw	x,L7_cap_fall
 438  00ef b623          	ld	a,_idx
 439  00f1 3c23          	inc	_idx
 440  00f3 905f          	clrw	y
 441  00f5 9097          	ld	yl,a
 442  00f7 9058          	sllw	y
 443  00f9 90ef01        	ldw	(_rcv_buff,y),x
 445  00fc 200c          	jra	L351
 446  00fe               L551:
 447                     ; 217         else rcv_buff[idx++] = cap_fall;
 449  00fe b623          	ld	a,_idx
 450  0100 3c23          	inc	_idx
 451  0102 5f            	clrw	x
 452  0103 97            	ld	xl,a
 453  0104 58            	sllw	x
 454  0105 90be9b        	ldw	y,L7_cap_fall
 455  0108 ef01          	ldw	(_rcv_buff,x),y
 456  010a               L351:
 457                     ; 222       if(FLAG_rise_edge)
 459  010a b615          	ld	a,L11_FLAG_rise_edge
 460  010c 2776          	jreq	L161
 461                     ; 224         rf_low_time = cap_rise-cap_fall;
 463  010e be9d          	ldw	x,L5_cap_rise
 464  0110 72b0009b      	subw	x,L7_cap_fall
 465  0114 bf1d          	ldw	L52_rf_low_time,x
 466                     ; 225         if(rf_low_time+rf_offset <= rf_bittime+RF_EDGES_JITTER && rf_low_time+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 468  0116 8d240224      	callf	LC008
 469  011a 224e          	jrugt	L361
 471  011c 8d350235      	callf	LC009
 472  0120 2548          	jrult	L361
 473                     ; 228           RF_data |= 0x01;
 475  0122 72100028      	bset	L34_RF_data,#0
 476                     ; 229           RF_bits++;
 478  0126 3c26          	inc	L73_RF_bits
 479                     ; 230           if(RF_bits < 8) RF_data <<= 1;
 481  0128 b626          	ld	a,L73_RF_bits
 482  012a a108          	cp	a,#8
 483  012c 2402          	jruge	L561
 486  012e 3828          	sll	L34_RF_data
 487  0130               L561:
 488                     ; 231           if(RF_bits == 8)
 490  0130 a108          	cp	a,#8
 491  0132 2704acdc01dc  	jrne	L522
 492                     ; 234             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 494  0138 8d110211      	callf	LC007
 495  013c 2609          	jrne	L171
 496                     ; 239               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 498  013e bea0          	ldw	x,_RcvRFmsg
 499  0140 a3a55a        	cpw	x,#42330
 500  0143 2702          	jreq	L171
 501                     ; 242                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 503  0145 3f29          	clr	L54_RF_rcvState
 504  0147               L171:
 505                     ; 245             if(RF_bytes == RFSEND_DATALEN) 
 507  0147 a105          	cp	a,#5
 508  0149 26e9          	jrne	L522
 509                     ; 247               RFrcvChksum = 0;
 511  014b 3f00          	clr	L33_RFrcvChksum
 512                     ; 248               for(i=0;i<RFSEND_DATALEN-1;i++)
 514  014d 4f            	clr	a
 515  014e 6b01          	ld	(OFST+0,sp),a
 516  0150               L771:
 517                     ; 250                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 519  0150 5f            	clrw	x
 520  0151 97            	ld	xl,a
 521  0152 b600          	ld	a,L33_RFrcvChksum
 522  0154 eba0          	add	a,(_RcvRFmsg,x)
 523  0156 b700          	ld	L33_RFrcvChksum,a
 524                     ; 248               for(i=0;i<RFSEND_DATALEN-1;i++)
 526  0158 0c01          	inc	(OFST+0,sp)
 529  015a 7b01          	ld	a,(OFST+0,sp)
 530  015c a104          	cp	a,#4
 531  015e 25f0          	jrult	L771
 532                     ; 252               RFrcvChksum = (u8)(~RFrcvChksum);
 534  0160 3300          	cpl	L33_RFrcvChksum
 535                     ; 253               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 537  0162 b6a4          	ld	a,_RcvRFmsg+4
 538  0164 b100          	cp	a,L33_RFrcvChksum
 539  0166 2672          	jrne	L342
 540                     ; 255                 RFbytesReady = TRUE;  // set new RF data available flag
 541                     ; 257               RF_rcvState = RF_RCVSTATE_WAITSTART;
 542                     ; 260           rf_offset = 0;
 544  0168 206c          	jpf	LC006
 545  016a               L361:
 546                     ; 262         else if(rf_low_time <= rf_halfbittime+RF_EDGES_JITTER && rf_low_time >= rf_halfbittime-RF_EDGES_JITTER)
 548  016a be1b          	ldw	x,L32_rf_halfbittime
 549  016c 1c0046        	addw	x,#70
 550  016f b31d          	cpw	x,L52_rf_low_time
 551  0171 2404acf701f7  	jrult	L742
 553  0177 be1b          	ldw	x,L32_rf_halfbittime
 554  0179 1d0046        	subw	x,#70
 555  017c b31d          	cpw	x,L52_rf_low_time
 556  017e 2277          	jrugt	L742
 557                     ; 264           rf_offset = rf_low_time;
 559  0180 be1d          	ldw	x,L52_rf_low_time
 561  0182 2059          	jpf	LC003
 562                     ; 268           RF_rcvState = RF_RCVSTATE_WAITSTART;
 563  0184               L161:
 564                     ; 271       else if(FLAG_fall_edge)
 566  0184 b616          	ld	a,L31_FLAG_fall_edge
 567  0186 2771          	jreq	L131
 568                     ; 273         rf_high_time = cap_fall;
 570  0188 be9b          	ldw	x,L7_cap_fall
 571  018a bf1f          	ldw	L72_rf_high_time,x
 572                     ; 274         if(rf_high_time+rf_offset <= rf_bittime+RF_EDGES_JITTER && rf_high_time+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 574  018c 8d240224      	callf	LC008
 575  0190 224f          	jrugt	L122
 577  0192 8d350235      	callf	LC009
 578  0196 2549          	jrult	L122
 579                     ; 277           RF_bits++;
 581  0198 3c26          	inc	L73_RF_bits
 582                     ; 278           if(RF_bits < 8) RF_data <<= 1;
 584  019a b626          	ld	a,L73_RF_bits
 585  019c a108          	cp	a,#8
 586  019e 2402          	jruge	L322
 589  01a0 3828          	sll	L34_RF_data
 590  01a2               L322:
 591                     ; 279           if(RF_bits == 8)
 593  01a2 a108          	cp	a,#8
 594  01a4 2636          	jrne	L522
 595                     ; 282             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 597  01a6 8d110211      	callf	LC007
 598  01aa 2609          	jrne	L722
 599                     ; 287               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 601  01ac bea0          	ldw	x,_RcvRFmsg
 602  01ae a3a55a        	cpw	x,#42330
 603  01b1 2702          	jreq	L722
 604                     ; 290                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 606  01b3 3f29          	clr	L54_RF_rcvState
 607  01b5               L722:
 608                     ; 293             if(RF_bytes == RFSEND_DATALEN) 
 610  01b5 a105          	cp	a,#5
 611  01b7 2623          	jrne	L522
 612                     ; 295               RFrcvChksum = 0;
 614  01b9 3f00          	clr	L33_RFrcvChksum
 615                     ; 296               for(i=0;i<RFSEND_DATALEN-1;i++)
 617  01bb 4f            	clr	a
 618  01bc 6b01          	ld	(OFST+0,sp),a
 619  01be               L532:
 620                     ; 298                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 622  01be 5f            	clrw	x
 623  01bf 97            	ld	xl,a
 624  01c0 b600          	ld	a,L33_RFrcvChksum
 625  01c2 eba0          	add	a,(_RcvRFmsg,x)
 626  01c4 b700          	ld	L33_RFrcvChksum,a
 627                     ; 296               for(i=0;i<RFSEND_DATALEN-1;i++)
 629  01c6 0c01          	inc	(OFST+0,sp)
 632  01c8 7b01          	ld	a,(OFST+0,sp)
 633  01ca a104          	cp	a,#4
 634  01cc 25f0          	jrult	L532
 635                     ; 300               RFrcvChksum = (u8)(~RFrcvChksum);
 637  01ce 3300          	cpl	L33_RFrcvChksum
 638                     ; 301               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 640  01d0 b6a4          	ld	a,_RcvRFmsg+4
 641  01d2 b100          	cp	a,L33_RFrcvChksum
 642  01d4 2604          	jrne	L342
 643                     ; 303                 RFbytesReady = TRUE;  // set new RF data available flag
 645  01d6               LC006:
 647  01d6 35010024      	mov	_RFbytesReady,#1
 648  01da               L342:
 649                     ; 305               RF_rcvState = RF_RCVSTATE_WAITSTART;
 652  01da 3f29          	clr	L54_RF_rcvState
 653  01dc               L522:
 654                     ; 308           rf_offset = 0;
 657  01dc 5f            	clrw	x
 658  01dd               LC003:
 659  01dd bf21          	ldw	L13_rf_offset,x
 661  01df 2018          	jra	L131
 662  01e1               L122:
 663                     ; 310         else if(rf_high_time <= rf_halfbittime+RF_EDGES_JITTER && rf_high_time >= rf_halfbittime-RF_EDGES_JITTER)
 665  01e1 be1b          	ldw	x,L32_rf_halfbittime
 666  01e3 1c0046        	addw	x,#70
 667  01e6 b31f          	cpw	x,L72_rf_high_time
 668  01e8 250d          	jrult	L742
 670  01ea be1b          	ldw	x,L32_rf_halfbittime
 671  01ec 1d0046        	subw	x,#70
 672  01ef b31f          	cpw	x,L72_rf_high_time
 673  01f1 2204          	jrugt	L742
 674                     ; 312           rf_offset = rf_high_time;
 676  01f3 be1f          	ldw	x,L72_rf_high_time
 678  01f5 20e6          	jpf	LC003
 679  01f7               L742:
 680                     ; 316           RF_rcvState = RF_RCVSTATE_WAITSTART;
 683  01f7 3f29          	clr	L54_RF_rcvState
 684                     ; 321     default: break;
 686  01f9               L131:
 687                     ; 323   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 689  01f9 a602          	ld	a,#2
 690  01fb cd0000        	call	_TIM3_ClearITPendingBit
 692                     ; 324   TIM3_ClearITPendingBit(TIM3_IT_CC2);
 694  01fe a604          	ld	a,#4
 695  0200 cd0000        	call	_TIM3_ClearITPendingBit
 697                     ; 325 }
 700  0203 84            	pop	a
 701  0204 85            	popw	x
 702  0205 bf00          	ldw	c_y,x
 703  0207 320002        	pop	c_y+2
 704  020a 85            	popw	x
 705  020b bf00          	ldw	c_x,x
 706  020d 320002        	pop	c_x+2
 707  0210 80            	iret	
 708  0211               LC007:
 709  0211 b627          	ld	a,L14_RF_bytes
 710  0213 3c27          	inc	L14_RF_bytes
 711  0215 5f            	clrw	x
 712  0216 97            	ld	xl,a
 713  0217 b628          	ld	a,L34_RF_data
 714  0219 e7a0          	ld	(_RcvRFmsg,x),a
 715                     ; 235             RF_bits = 0;
 717  021b 3f26          	clr	L73_RF_bits
 718                     ; 236             RF_data = 0;
 720  021d 3f28          	clr	L34_RF_data
 721                     ; 237             if(RF_bytes == 2)
 723  021f b627          	ld	a,L14_RF_bytes
 724  0221 a102          	cp	a,#2
 725  0223 87            	retf	
 726  0224               LC008:
 727  0224 90be19        	ldw	y,L12_rf_bittime
 728  0227 72bb0021      	addw	x,L13_rf_offset
 729  022b 72a90046      	addw	y,#70
 730  022f 90bf00        	ldw	c_y,y
 731  0232 b300          	cpw	x,c_y
 732  0234 87            	retf	
 733  0235               LC009:
 734  0235 90be19        	ldw	y,L12_rf_bittime
 735  0238 72a20046      	subw	y,#70
 736  023c 90bf00        	ldw	c_y,y
 737  023f b300          	cpw	x,c_y
 738  0241 87            	retf	
 797                     ; 332 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 797                     ; 333 {
 798                     .text:	section	.text,new
 799  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 801  0000 8a            	push	cc
 802  0001 84            	pop	a
 803  0002 a4bf          	and	a,#191
 804  0004 88            	push	a
 805  0005 86            	pop	cc
 806  0006 3b0002        	push	c_x+2
 807  0009 be00          	ldw	x,c_x
 808  000b 89            	pushw	x
 809  000c 3b0002        	push	c_y+2
 810  000f be00          	ldw	x,c_y
 811  0011 89            	pushw	x
 814                     ; 337   interrupt_status = 1;
 816  0012 3501009f      	mov	L3_interrupt_status,#1
 817                     ; 338   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
 819  0016 a601          	ld	a,#1
 820  0018 cd0000        	call	_TIM2_GetITStatus
 822  001b 4d            	tnz	a
 823  001c 2604acac01ac  	jreq	L362
 824                     ; 341     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
 826  0022 be00          	ldw	x,_cnt_flag_250ms
 827  0024 a3ffff        	cpw	x,#65535
 828  0027 2403          	jruge	L562
 831  0029 5c            	incw	x
 832  002a bf00          	ldw	_cnt_flag_250ms,x
 833  002c               L562:
 834                     ; 342     if(cnt_flag_250ms >= CNTVAL_250MS) 
 836  002c a300fa        	cpw	x,#250
 837  002f 2507          	jrult	L762
 838                     ; 344       cnt_flag_250ms = 0;
 840  0031 5f            	clrw	x
 841  0032 bf00          	ldw	_cnt_flag_250ms,x
 842                     ; 345       FLAG_250ms = TRUE;
 844  0034 72100000      	bset	_FLAG_250ms
 845  0038               L762:
 846                     ; 347     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
 848  0038 be02          	ldw	x,_cnt_flag_500ms
 849  003a a3ffff        	cpw	x,#65535
 850  003d 2403          	jruge	L172
 853  003f 5c            	incw	x
 854  0040 bf02          	ldw	_cnt_flag_500ms,x
 855  0042               L172:
 856                     ; 348     if(cnt_flag_500ms >= CNTVAL_500MS) 
 858  0042 a301f4        	cpw	x,#500
 859  0045 2507          	jrult	L372
 860                     ; 350       cnt_flag_500ms = 0;
 862  0047 5f            	clrw	x
 863  0048 bf02          	ldw	_cnt_flag_500ms,x
 864                     ; 351       FLAG_500ms = TRUE;
 866  004a 72100001      	bset	_FLAG_500ms
 867  004e               L372:
 868                     ; 353     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
 870  004e be04          	ldw	x,_cnt_flag_1000ms
 871  0050 a3ffff        	cpw	x,#65535
 872  0053 2403          	jruge	L572
 875  0055 5c            	incw	x
 876  0056 bf04          	ldw	_cnt_flag_1000ms,x
 877  0058               L572:
 878                     ; 354     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
 880  0058 a303e8        	cpw	x,#1000
 881  005b 2507          	jrult	L772
 882                     ; 356       cnt_flag_1000ms = 0;
 884  005d 5f            	clrw	x
 885  005e bf04          	ldw	_cnt_flag_1000ms,x
 886                     ; 357       FLAG_1000ms = TRUE;
 888  0060 72100002      	bset	_FLAG_1000ms
 889  0064               L772:
 890                     ; 360     if(!Timeout_istout1)
 892  0064 720000000d    	btjt	_Timeout_istout1,L103
 893                     ; 362       Timeout_toutcnt1++;
 895  0069 be00          	ldw	x,_Timeout_toutcnt1
 896  006b 5c            	incw	x
 897  006c bf00          	ldw	_Timeout_toutcnt1,x
 898                     ; 363       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 900  006e b300          	cpw	x,_Timeout_tout1
 901  0070 2504          	jrult	L103
 904  0072 72100000      	bset	_Timeout_istout1
 905  0076               L103:
 906                     ; 365     if(!Timeout_istout2)
 908  0076 720000000d    	btjt	_Timeout_istout2,L503
 909                     ; 367       Timeout_toutcnt2++;
 911  007b be00          	ldw	x,_Timeout_toutcnt2
 912  007d 5c            	incw	x
 913  007e bf00          	ldw	_Timeout_toutcnt2,x
 914                     ; 368       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
 916  0080 b300          	cpw	x,_Timeout_tout2
 917  0082 2504          	jrult	L503
 920  0084 72100000      	bset	_Timeout_istout2
 921  0088               L503:
 922                     ; 370     if(!Timeout_istout3)
 924  0088 720000000d    	btjt	_Timeout_istout3,L113
 925                     ; 372       Timeout_toutcnt3++;
 927  008d be00          	ldw	x,_Timeout_toutcnt3
 928  008f 5c            	incw	x
 929  0090 bf00          	ldw	_Timeout_toutcnt3,x
 930                     ; 373       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
 932  0092 b300          	cpw	x,_Timeout_tout3
 933  0094 2504          	jrult	L113
 936  0096 72100000      	bset	_Timeout_istout3
 937  009a               L113:
 938                     ; 376     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
 940  009a b625          	ld	a,L53_RFrcvTimeoutcnt
 941  009c a1ff          	cp	a,#255
 942  009e 2404          	jruge	L513
 945  00a0 3c25          	inc	L53_RFrcvTimeoutcnt
 946  00a2 b625          	ld	a,L53_RFrcvTimeoutcnt
 947  00a4               L513:
 948                     ; 377     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
 950  00a4 a164          	cp	a,#100
 951  00a6 2502          	jrult	L713
 952                     ; 379       RF_rcvState = RF_RCVSTATE_WAITSTART;
 954  00a8 3f29          	clr	L54_RF_rcvState
 955  00aa               L713:
 956                     ; 383     if(!BTN1_STATE)
 958  00aa 7204500116    	btjt	20481,#2,L123
 959                     ; 385       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
 961  00af b606          	ld	a,_btn1_0_cnt
 962  00b1 a1ff          	cp	a,#255
 963  00b3 2402          	jruge	L323
 966  00b5 3c06          	inc	_btn1_0_cnt
 967  00b7               L323:
 968                     ; 386       btn1_1_cnt = 0;
 970  00b7 3f07          	clr	_btn1_1_cnt
 971                     ; 387       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
 973  00b9 b606          	ld	a,_btn1_0_cnt
 974  00bb a11e          	cp	a,#30
 975  00bd 2518          	jrult	L723
 976                     ; 389         BTN1_DEB_STATE = BTN_PRESSED;
 978  00bf 35010008      	mov	_BTN1_DEB_STATE,#1
 979  00c3 2012          	jra	L723
 980  00c5               L123:
 981                     ; 394       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
 983  00c5 b607          	ld	a,_btn1_1_cnt
 984  00c7 a1ff          	cp	a,#255
 985  00c9 2402          	jruge	L133
 988  00cb 3c07          	inc	_btn1_1_cnt
 989  00cd               L133:
 990                     ; 395       btn1_0_cnt = 0;
 992  00cd 3f06          	clr	_btn1_0_cnt
 993                     ; 396       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
 995  00cf b607          	ld	a,_btn1_1_cnt
 996  00d1 a11e          	cp	a,#30
 997  00d3 2502          	jrult	L723
 998                     ; 398         BTN1_DEB_STATE = BTN_DEPRESSED;
1000  00d5 3f08          	clr	_BTN1_DEB_STATE
1001  00d7               L723:
1002                     ; 404     if(BTN1_DEB_STATE == BTN_PRESSED)
1004  00d7 b608          	ld	a,_BTN1_DEB_STATE
1005  00d9 4a            	dec	a
1006  00da 260a          	jrne	L533
1007                     ; 406       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1009  00dc be0a          	ldw	x,_BTN1_press_timer
1010  00de a3ffff        	cpw	x,#65535
1011  00e1 2403          	jruge	L533
1014  00e3 5c            	incw	x
1015  00e4 bf0a          	ldw	_BTN1_press_timer,x
1016  00e6               L533:
1017                     ; 409     if(!BTN1_DELAY_FLAG)
1019  00e6 720000030e    	btjt	_BTN1_DELAY_FLAG,L143
1020                     ; 411       btn1_delay_cnt++;
1022  00eb 3c09          	inc	_btn1_delay_cnt
1023                     ; 412       if(btn1_delay_cnt == BTN_DELAY)
1025  00ed b609          	ld	a,_btn1_delay_cnt
1026  00ef a196          	cp	a,#150
1027  00f1 2606          	jrne	L143
1028                     ; 414         btn1_delay_cnt = 0;
1030  00f3 3f09          	clr	_btn1_delay_cnt
1031                     ; 415         BTN1_DELAY_FLAG = TRUE;
1033  00f5 72100003      	bset	_BTN1_DELAY_FLAG
1034  00f9               L143:
1035                     ; 421     if(flag_blink_redLED)
1037  00f9 7201000550    	btjf	_flag_blink_redLED,L543
1038                     ; 423       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1040  00fe be0d          	ldw	x,_cnt_state_redLED
1041  0100 a3ffff        	cpw	x,#65535
1042  0103 2403          	jruge	L743
1045  0105 5c            	incw	x
1046  0106 bf0d          	ldw	_cnt_state_redLED,x
1047  0108               L743:
1048                     ; 424       if(flag_blink_on_off)
1050  0108 7201000412    	btjf	_flag_blink_on_off,L153
1051                     ; 426         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1053  010d a30032        	cpw	x,#50
1054  0110 253c          	jrult	L543
1055                     ; 428           flag_blink_on_off = FALSE;
1057  0112 72110004      	bres	_flag_blink_on_off
1058                     ; 429           cnt_state_redLED = 0;
1060  0116 5f            	clrw	x
1061  0117 bf0d          	ldw	_cnt_state_redLED,x
1062                     ; 430           LED_OFF;
1064  0119 7217500a      	bres	20490,#3
1067  011d 202b          	jpf	LC010
1068  011f               L153:
1069                     ; 435         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1071  011f a300c8        	cpw	x,#200
1072  0122 252a          	jrult	L543
1073                     ; 437           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1075  0124 b611          	ld	a,_cnt_blink_redLED
1076  0126 a1ff          	cp	a,#255
1077  0128 2402          	jruge	L163
1080  012a 3c11          	inc	_cnt_blink_redLED
1081  012c               L163:
1082                     ; 438           flag_blink_on_off = TRUE;
1084  012c 72100004      	bset	_flag_blink_on_off
1085                     ; 439           cnt_state_redLED = 0;
1087  0130 5f            	clrw	x
1088  0131 bf0d          	ldw	_cnt_state_redLED,x
1089                     ; 440           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1091  0133 b611          	ld	a,_cnt_blink_redLED
1092  0135 b113          	cp	a,_blink_redLED_times
1093  0137 250d          	jrult	L363
1095  0139 7200000708    	btjt	_flag_blink_unlimited,L363
1096                     ; 442             flag_blink_redLED = FALSE;
1098  013e 72110005      	bres	_flag_blink_redLED
1099                     ; 443             cnt_blink_redLED = 0;
1101  0142 3f11          	clr	_cnt_blink_redLED
1103  0144 2008          	jra	L543
1104  0146               L363:
1105                     ; 447             LED_RED_ON;
1107  0146 7216500a      	bset	20490,#3
1110  014a               LC010:
1112  014a 7219500a      	bres	20490,#4
1114  014e               L543:
1115                     ; 452     if(flag_blink_greenLED)
1117  014e 7201000654    	btjf	_flag_blink_greenLED,L763
1118                     ; 454       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1120  0153 be0f          	ldw	x,_cnt_state_greenLED
1121  0155 a3ffff        	cpw	x,#65535
1122  0158 2403          	jruge	L173
1125  015a 5c            	incw	x
1126  015b bf0f          	ldw	_cnt_state_greenLED,x
1127  015d               L173:
1128                     ; 455       if(flag_blink_on_off)
1130  015d 7201000416    	btjf	_flag_blink_on_off,L373
1131                     ; 457         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1133  0162 a30032        	cpw	x,#50
1134  0165 2540          	jrult	L763
1135                     ; 459           flag_blink_on_off = FALSE;
1137  0167 72110004      	bres	_flag_blink_on_off
1138                     ; 460           cnt_state_greenLED = 0;
1140  016b 5f            	clrw	x
1141  016c bf0f          	ldw	_cnt_state_greenLED,x
1142                     ; 461           LED_OFF;
1144  016e 7217500a      	bres	20490,#3
1147  0172 7219500a      	bres	20490,#4
1149  0176 202f          	jra	L763
1150  0178               L373:
1151                     ; 466         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1153  0178 a300c8        	cpw	x,#200
1154  017b 252a          	jrult	L763
1155                     ; 468           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1157  017d b612          	ld	a,_cnt_blink_greenLED
1158  017f a1ff          	cp	a,#255
1159  0181 2402          	jruge	L304
1162  0183 3c12          	inc	_cnt_blink_greenLED
1163  0185               L304:
1164                     ; 469           flag_blink_on_off = TRUE;
1166  0185 72100004      	bset	_flag_blink_on_off
1167                     ; 470           cnt_state_greenLED = 0;
1169  0189 5f            	clrw	x
1170  018a bf0f          	ldw	_cnt_state_greenLED,x
1171                     ; 471           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1173  018c b612          	ld	a,_cnt_blink_greenLED
1174  018e b114          	cp	a,_blink_greenLED_times
1175  0190 250d          	jrult	L504
1177  0192 7200000708    	btjt	_flag_blink_unlimited,L504
1178                     ; 473             flag_blink_greenLED = FALSE;
1180  0197 72110006      	bres	_flag_blink_greenLED
1181                     ; 474             cnt_blink_greenLED = 0;
1183  019b 3f12          	clr	_cnt_blink_greenLED
1185  019d 2008          	jra	L763
1186  019f               L504:
1187                     ; 478             LED_GREEN_ON;
1189  019f 7217500a      	bres	20490,#3
1192  01a3 7218500a      	bset	20490,#4
1194  01a7               L763:
1195                     ; 484     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
1197  01a7 a601          	ld	a,#1
1198  01a9 cd0000        	call	_TIM2_ClearITPendingBit
1200  01ac               L362:
1201                     ; 486   interrupt_status = 0;
1203  01ac 3f9f          	clr	L3_interrupt_status
1204                     ; 487 }
1207  01ae 85            	popw	x
1208  01af bf00          	ldw	c_y,x
1209  01b1 320002        	pop	c_y+2
1210  01b4 85            	popw	x
1211  01b5 bf00          	ldw	c_x,x
1212  01b7 320002        	pop	c_x+2
1213  01ba 80            	iret	
1236                     ; 494 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1236                     ; 495 {
1237                     .text:	section	.text,new
1238  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1242                     ; 499 }
1245  0000 80            	iret	
1267                     ; 506 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
1267                     ; 507 {
1268                     .text:	section	.text,new
1269  0000               f_TRAP_IRQHandler:
1273                     ; 511 }
1276  0000 80            	iret	
1298                     ; 518 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
1298                     ; 519 {
1299                     .text:	section	.text,new
1300  0000               f_FLASH_IRQHandler:
1304                     ; 523 }
1307  0000 80            	iret	
1329                     ; 530 INTERRUPT_HANDLER(AWU_IRQHandler,4)
1329                     ; 531 {
1330                     .text:	section	.text,new
1331  0000               f_AWU_IRQHandler:
1335                     ; 535 }
1338  0000 80            	iret	
1360                     ; 542 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
1360                     ; 543 {
1361                     .text:	section	.text,new
1362  0000               f_EXTIB_IRQHandler:
1366                     ; 547 }
1369  0000 80            	iret	
1391                     ; 554 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
1391                     ; 555 {
1392                     .text:	section	.text,new
1393  0000               f_EXTID_IRQHandler:
1397                     ; 559 }
1400  0000 80            	iret	
1422                     ; 566 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
1422                     ; 567 {
1423                     .text:	section	.text,new
1424  0000               f_EXTI0_IRQHandler:
1428                     ; 571 }
1431  0000 80            	iret	
1453                     ; 578 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
1453                     ; 579 {
1454                     .text:	section	.text,new
1455  0000               f_EXTI1_IRQHandler:
1459                     ; 583 }
1462  0000 80            	iret	
1484                     ; 590 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
1484                     ; 591 {
1485                     .text:	section	.text,new
1486  0000               f_EXTI2_IRQHandler:
1490                     ; 595 }
1493  0000 80            	iret	
1515                     ; 602 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
1515                     ; 603 {
1516                     .text:	section	.text,new
1517  0000               f_EXTI3_IRQHandler:
1521                     ; 607 }
1524  0000 80            	iret	
1546                     ; 614 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1546                     ; 615 {
1547                     .text:	section	.text,new
1548  0000               f_EXTI4_IRQHandler:
1552                     ; 619 }
1555  0000 80            	iret	
1577                     ; 626 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1577                     ; 627 {
1578                     .text:	section	.text,new
1579  0000               f_EXTI5_IRQHandler:
1583                     ; 631 }
1586  0000 80            	iret	
1608                     ; 638 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1608                     ; 639 {
1609                     .text:	section	.text,new
1610  0000               f_EXTI6_IRQHandler:
1614                     ; 643 }
1617  0000 80            	iret	
1639                     ; 650 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1639                     ; 651 {
1640                     .text:	section	.text,new
1641  0000               f_EXTI7_IRQHandler:
1645                     ; 655 }
1648  0000 80            	iret	
1670                     ; 662 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1670                     ; 663 {
1671                     .text:	section	.text,new
1672  0000               f_COMP_IRQHandler:
1676                     ; 667 }
1679  0000 80            	iret	
1702                     ; 674 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1702                     ; 675 {
1703                     .text:	section	.text,new
1704  0000               f_TIM2_CAP_IRQHandler:
1708                     ; 679 }
1711  0000 80            	iret	
1734                     ; 686 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1734                     ; 687 {
1735                     .text:	section	.text,new
1736  0000               f_TIM4_UPD_OVF_IRQHandler:
1740                     ; 691 }
1743  0000 80            	iret	
1765                     ; 698 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1765                     ; 699 {
1766                     .text:	section	.text,new
1767  0000               f_SPI_IRQHandler:
1771                     ; 703 }
1774  0000 80            	iret	
1797                     ; 709 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1797                     ; 710 {
1798                     .text:	section	.text,new
1799  0000               f_USART_TX_IRQHandler:
1803                     ; 714 }
1806  0000 80            	iret	
1829                     ; 721 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1829                     ; 722 {
1830                     .text:	section	.text,new
1831  0000               f_USART_RX_IRQHandler:
1835                     ; 726 }
1838  0000 80            	iret	
1860                     ; 734 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1860                     ; 735 {
1861                     .text:	section	.text,new
1862  0000               f_I2C_IRQHandler:
1866                     ; 739 }
1869  0000 80            	iret	
2396                     	xdef	_FLAG_UART_cmd_rcv
2397                     	switch	.ubsct
2398  0000               L33_RFrcvChksum:
2399  0000 00            	ds.b	1
2400                     	xdef	_idx
2401  0001               _rcv_buff:
2402  0001 000000000000  	ds.b	154
2403                     	xdef	_rcv_buff
2404  009b               L7_cap_fall:
2405  009b 0000          	ds.b	2
2406  009d               L5_cap_rise:
2407  009d 0000          	ds.b	2
2408                     	xdef	_cnt_blink_greenLED
2409                     	xdef	_cnt_blink_redLED
2410                     	xdef	_debug
2411  009f               L3_interrupt_status:
2412  009f 00            	ds.b	1
2413                     	xref.b	_Timeout_tout3
2414                     	xref.b	_Timeout_tout2
2415                     	xref.b	_Timeout_tout1
2416                     	xref.b	_Timeout_toutcnt3
2417                     	xref.b	_Timeout_toutcnt2
2418                     	xref.b	_Timeout_toutcnt1
2419                     	xbit	_Timeout_istout3
2420                     	xbit	_Timeout_istout2
2421                     	xbit	_Timeout_istout1
2422                     	xdef	_btn1_delay_cnt
2423                     	xdef	_btn1_1_cnt
2424                     	xdef	_btn1_0_cnt
2425                     	xdef	_cnt_flag_1000ms
2426                     	xdef	_cnt_flag_500ms
2427                     	xdef	_cnt_flag_250ms
2428                     	xdef	f_I2C_IRQHandler
2429                     	xdef	f_USART_RX_IRQHandler
2430                     	xdef	f_USART_TX_IRQHandler
2431                     	xdef	f_SPI_IRQHandler
2432                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2433                     	xdef	f_TIM3_CAP_IRQHandler
2434                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2435                     	xdef	f_TIM2_CAP_IRQHandler
2436                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2437                     	xdef	f_COMP_IRQHandler
2438                     	xdef	f_EXTI7_IRQHandler
2439                     	xdef	f_EXTI6_IRQHandler
2440                     	xdef	f_EXTI5_IRQHandler
2441                     	xdef	f_EXTI4_IRQHandler
2442                     	xdef	f_EXTI3_IRQHandler
2443                     	xdef	f_EXTI2_IRQHandler
2444                     	xdef	f_EXTI1_IRQHandler
2445                     	xdef	f_EXTI0_IRQHandler
2446                     	xdef	f_EXTID_IRQHandler
2447                     	xdef	f_EXTIB_IRQHandler
2448                     	xdef	f_AWU_IRQHandler
2449                     	xdef	f_FLASH_IRQHandler
2450                     	xdef	f_TRAP_IRQHandler
2451                     	xdef	f_NonHandledInterrupt
2452                     	xdef	_RFbytesReady
2453  00a0               _RcvRFmsg:
2454  00a0 0000000000    	ds.b	5
2455                     	xdef	_RcvRFmsg
2456                     	xdef	_flag_blink_unlimited
2457                     	xdef	_flag_blink_greenLED
2458                     	xdef	_flag_blink_redLED
2459                     	xdef	_flag_blink_on_off
2460                     	xdef	_cnt_state_greenLED
2461                     	xdef	_cnt_state_redLED
2462                     	xdef	_blink_greenLED_times
2463                     	xdef	_blink_redLED_times
2464                     	xdef	_FLAG_1000ms
2465                     	xdef	_FLAG_500ms
2466                     	xdef	_FLAG_250ms
2467                     	xdef	_BTN1_press_timer
2468                     	xdef	_BTN1_DELAY_FLAG
2469                     	xdef	_BTN1_DEB_STATE
2470                     	xref	_TIM3_ClearITPendingBit
2471                     	xref	_TIM3_GetITStatus
2472                     	xref	_TIM3_GetCapture2
2473                     	xref	_TIM3_GetCapture1
2474                     	xref	_TIM2_ClearITPendingBit
2475                     	xref	_TIM2_GetITStatus
2476                     	xref.b	c_x
2477                     	xref.b	c_y
2497                     	end
