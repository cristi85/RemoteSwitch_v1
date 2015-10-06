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
  87  001c               L32_rf_offset:
  88  001c 0000          	dc.w	0
  89  001e               L72_idx:
  90  001e 0000          	dc.w	0
  91  0020               _RFbytesReady:
  92  0020 00            	dc.b	0
  93  0021               L33_RFrcvTimeoutcnt:
  94  0021 00            	dc.b	0
  95  0022               L53_RF_bits:
  96  0022 00            	dc.b	0
  97  0023               L73_RF_bytes:
  98  0023 00            	dc.b	0
  99  0024               L14_RF_data:
 100  0024 00            	dc.b	0
 101  0025               L54_idx_temp2:
 102  0025 00            	dc.b	0
 103                     	switch	.bit
 104  0008               L74_flag_RF_StartRec:
 105  0008 01            	dc.b	1
 106                     	bsct
 107  0026               L15_RF_rcvState:
 108  0026 00            	dc.b	0
 109                     	switch	.bit
 110  0009               _FLAG_UART_cmd_rcv:
 111  0009 00            	dc.b	0
 141                     ; 130 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 141                     ; 131 {
 142                     .text:	section	.text,new
 143  0000               f_NonHandledInterrupt:
 147                     ; 135 }
 150  0000 80            	iret	
 173                     ; 143 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 173                     ; 144 {
 174                     .text:	section	.text,new
 175  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 179                     ; 148 }
 182  0000 80            	iret	
 249                     ; 154 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 249                     ; 155 {
 250                     .text:	section	.text,new
 251  0000               f_TIM3_CAP_IRQHandler:
 253  0000 8a            	push	cc
 254  0001 84            	pop	a
 255  0002 a4bf          	and	a,#191
 256  0004 88            	push	a
 257  0005 86            	pop	cc
 258       00000001      OFST:	set	1
 259  0006 3b0002        	push	c_x+2
 260  0009 be00          	ldw	x,c_x
 261  000b 89            	pushw	x
 262  000c 3b0002        	push	c_y+2
 263  000f be00          	ldw	x,c_y
 264  0011 89            	pushw	x
 265  0012 88            	push	a
 268                     ; 159   if(TIM3_GetITStatus(TIM3_IT_CC2) == SET)
 270  0013 a604          	ld	a,#4
 271  0015 cd0000        	call	_TIM3_GetITStatus
 273  0018 4a            	dec	a
 274  0019 260b          	jrne	L131
 275                     ; 161     cap_rise = TIM3_GetCapture2();
 277  001b cd0000        	call	_TIM3_GetCapture2
 279  001e bf67          	ldw	L5_cap_rise,x
 280                     ; 162     FLAG_rise_edge = TRUE;
 282  0020 35010015      	mov	L11_FLAG_rise_edge,#1
 284  0024 2002          	jra	L331
 285  0026               L131:
 286                     ; 164   else FLAG_rise_edge = FALSE;
 288  0026 3f15          	clr	L11_FLAG_rise_edge
 289  0028               L331:
 290                     ; 165   if(TIM3_GetITStatus(TIM3_IT_CC1) == SET)
 292  0028 a602          	ld	a,#2
 293  002a cd0000        	call	_TIM3_GetITStatus
 295  002d 4a            	dec	a
 296  002e 260b          	jrne	L531
 297                     ; 167     cap_fall = TIM3_GetCapture1();
 299  0030 cd0000        	call	_TIM3_GetCapture1
 301  0033 bf65          	ldw	L7_cap_fall,x
 302                     ; 168     FLAG_fall_edge = TRUE;
 304  0035 35010016      	mov	L31_FLAG_fall_edge,#1
 306  0039 2002          	jra	L731
 307  003b               L531:
 308                     ; 170   else FLAG_fall_edge = FALSE;
 310  003b 3f16          	clr	L31_FLAG_fall_edge
 311  003d               L731:
 312                     ; 171   if(FLAG_rise_edge && FLAG_fall_edge)
 314  003d b615          	ld	a,L11_FLAG_rise_edge
 315  003f 2708          	jreq	L141
 317  0041 b616          	ld	a,L31_FLAG_fall_edge
 318  0043 2704          	jreq	L141
 319                     ; 173     FLAG_CC_Error = TRUE;
 321  0045 35010017      	mov	L51_FLAG_CC_Error,#1
 322  0049               L141:
 323                     ; 176   if(idx < 50)
 325  0049 be1e          	ldw	x,L72_idx
 326  004b a30032        	cpw	x,#50
 327  004e 2e1e          	jrsge	L341
 328                     ; 178     if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise;
 330  0050 b615          	ld	a,L11_FLAG_rise_edge
 331  0052 270c          	jreq	L541
 334  0054 be1e          	ldw	x,L72_idx
 335  0056 5c            	incw	x
 336  0057 bf1e          	ldw	L72_idx,x
 337  0059 5a            	decw	x
 338  005a 58            	sllw	x
 339  005b 90be67        	ldw	y,L5_cap_rise
 341  005e 200a          	jpf	LC001
 342  0060               L541:
 343                     ; 179     else rcv_buff[idx++] = cap_fall;
 345  0060 be1e          	ldw	x,L72_idx
 346  0062 5c            	incw	x
 347  0063 bf1e          	ldw	L72_idx,x
 348  0065 5a            	decw	x
 349  0066 58            	sllw	x
 350  0067 90be65        	ldw	y,L7_cap_fall
 351  006a               LC001:
 352  006a ef01          	ldw	(L52_rcv_buff,x),y
 353  006c 2003          	jra	L151
 354  006e               L341:
 355                     ; 181   else idx = 0;
 357  006e 5f            	clrw	x
 358  006f bf1e          	ldw	L72_idx,x
 359  0071               L151:
 360                     ; 182   RFrcvTimeoutcnt = 0;
 362  0071 3f21          	clr	L33_RFrcvTimeoutcnt
 363                     ; 183   switch(RF_rcvState)
 365  0073 b626          	ld	a,L15_RF_rcvState
 367                     ; 323     default: break;
 368  0075 2707          	jreq	L101
 369  0077 4a            	dec	a
 370  0078 272e          	jreq	L301
 371  007a ace101e1      	jra	L551
 372  007e               L101:
 373                     ; 187       if(FLAG_fall_edge)
 375  007e 3d16          	tnz	L31_FLAG_fall_edge
 376  0080 27f8          	jreq	L551
 377                     ; 189         rf_halfbittime = cap_rise;
 379  0082 be67          	ldw	x,L5_cap_rise
 380  0084 bf1a          	ldw	L12_rf_halfbittime,x
 381                     ; 190         rf_bittime = cap_fall;
 383  0086 be65          	ldw	x,L7_cap_fall
 384  0088 bf18          	ldw	L71_rf_bittime,x
 385                     ; 191         if(cap_fall >= 500 - RF_EDGES_JITTER && cap_fall <= 500 + RF_EDGES_JITTER)
 387  008a a301c2        	cpw	x,#450
 388  008d 25eb          	jrult	L551
 390  008f a30227        	cpw	x,#551
 391  0092 24e6          	jruge	L551
 392                     ; 193           rf_bittime = cap_fall;
 394                     ; 194           rf_halfbittime = rf_bittime >> 1;
 396  0094 54            	srlw	x
 397  0095 bf1a          	ldw	L12_rf_halfbittime,x
 398                     ; 195           RF_bits = 0;
 400  0097 b722          	ld	L53_RF_bits,a
 401                     ; 196           RF_bytes = 0;
 403  0099 b723          	ld	L73_RF_bytes,a
 404                     ; 197           RF_data = 0;
 406  009b b724          	ld	L14_RF_data,a
 407                     ; 198           idx = 0;
 409  009d 5f            	clrw	x
 410  009e bf1e          	ldw	L72_idx,x
 411                     ; 199           RF_rcvState = RF_RCVSTATE_REC8BITS;
 413  00a0 35010026      	mov	L15_RF_rcvState,#1
 414  00a4 ace101e1      	jra	L551
 415  00a8               L301:
 416                     ; 212       if(FLAG_rise_edge)
 418  00a8 b615          	ld	a,L11_FLAG_rise_edge
 419  00aa 2604ac370137  	jreq	L361
 420                     ; 214         if(cap_rise+rf_offset <= rf_bittime+RF_EDGES_JITTER && cap_rise+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 422  00b0 be67          	ldw	x,L5_cap_rise
 423  00b2 72bb001c      	addw	x,L32_rf_offset
 424  00b6 90be18        	ldw	y,L71_rf_bittime
 425  00b9 8df901f9      	callf	LC007
 426  00bd 225c          	jrugt	L561
 428  00bf 90be18        	ldw	y,L71_rf_bittime
 429  00c2 8d030203      	callf	LC008
 430  00c6 2553          	jrult	L561
 431                     ; 217           RF_bits++;
 433  00c8 3c22          	inc	L53_RF_bits
 434                     ; 218           if(RF_bits < 8) RF_data <<= 1;
 436  00ca b622          	ld	a,L53_RF_bits
 437  00cc a108          	cp	a,#8
 438  00ce 2402          	jruge	L761
 441  00d0 3824          	sll	L14_RF_data
 442  00d2               L761:
 443                     ; 219           if(RF_bits == 8)
 445  00d2 a108          	cp	a,#8
 446  00d4 2704acb001b0  	jrne	L332
 447                     ; 222             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 449  00da 8d0d020d      	callf	LC009
 450  00de 2612          	jrne	L371
 451                     ; 227               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 453  00e0 be6a          	ldw	x,_RcvRFmsg
 454  00e2 2708          	jreq	L571
 455                     ; 230                 flag_RF_StartRec = FALSE;
 457  00e4 72110008      	bres	L74_flag_RF_StartRec
 458                     ; 231                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 460  00e8 3f26          	clr	L15_RF_rcvState
 462  00ea 2006          	jra	L371
 463  00ec               L571:
 464                     ; 235                 flag_RF_StartRec = TRUE;
 466  00ec 72100008      	bset	L74_flag_RF_StartRec
 467                     ; 236                 idx_temp2 = 0;
 469  00f0 3f25          	clr	L54_idx_temp2
 470  00f2               L371:
 471                     ; 239             if(RF_bytes == RFSEND_DATALEN) 
 473  00f2 a105          	cp	a,#5
 474  00f4 26e0          	jrne	L332
 475                     ; 241               RFrcvChksum = 0;
 477  00f6 3f00          	clr	L13_RFrcvChksum
 478                     ; 242               for(i=0;i<RFSEND_DATALEN-1;i++)
 480  00f8 4f            	clr	a
 481  00f9 6b01          	ld	(OFST+0,sp),a
 482  00fb               L302:
 483                     ; 244                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 485  00fb 5f            	clrw	x
 486  00fc 97            	ld	xl,a
 487  00fd b600          	ld	a,L13_RFrcvChksum
 488  00ff eb6a          	add	a,(_RcvRFmsg,x)
 489  0101 b700          	ld	L13_RFrcvChksum,a
 490                     ; 242               for(i=0;i<RFSEND_DATALEN-1;i++)
 492  0103 0c01          	inc	(OFST+0,sp)
 495  0105 7b01          	ld	a,(OFST+0,sp)
 496  0107 a104          	cp	a,#4
 497  0109 25f0          	jrult	L302
 498                     ; 246               RFrcvChksum = (u8)(~RFrcvChksum);
 500  010b 3300          	cpl	L13_RFrcvChksum
 501                     ; 247               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 503  010d b66e          	ld	a,_RcvRFmsg+4
 504  010f b100          	cp	a,L13_RFrcvChksum
 505  0111 2704acaa01aa  	jrne	L352
 506                     ; 249                 RFbytesReady = TRUE;  // set new RF data available flag
 507                     ; 251               flag_RF_StartRec = FALSE;
 508                     ; 252               RF_rcvState = RF_RCVSTATE_WAITSTART;
 509                     ; 255           if(rf_offset > 0) rf_offset = 0;
 511  0117 aca601a6      	jpf	LC006
 512  011b               L561:
 513                     ; 257         else if(cap_rise <= rf_halfbittime+RF_EDGES_JITTER && cap_rise >= rf_halfbittime-RF_EDGES_JITTER)
 515  011b be1a          	ldw	x,L12_rf_halfbittime
 516  011d 1c0032        	addw	x,#50
 517  0120 b367          	cpw	x,L5_cap_rise
 518  0122 2404acdf01df  	jrult	L162
 520  0128 be1a          	ldw	x,L12_rf_halfbittime
 521  012a 1d0032        	subw	x,#50
 522  012d b367          	cpw	x,L5_cap_rise
 523  012f 22f3          	jrugt	L162
 524                     ; 259           rf_offset = cap_rise;
 526  0131 be67          	ldw	x,L5_cap_rise
 528  0133 acb501b5      	jpf	LC003
 529                     ; 263           RF_rcvState = RF_RCVSTATE_WAITSTART;
 530  0137               L361:
 531                     ; 266       else if(FLAG_fall_edge)
 533  0137 b616          	ld	a,L31_FLAG_fall_edge
 534  0139 2604ace101e1  	jreq	L551
 535                     ; 268         if(cap_fall-cap_rise+rf_offset <= rf_bittime+RF_EDGES_JITTER && cap_fall-cap_rise+rf_offset >= rf_bittime-RF_EDGES_JITTER)
 537  013f be65          	ldw	x,L7_cap_fall
 538  0141 72b00067      	subw	x,L5_cap_rise
 539  0145 72bb001c      	addw	x,L32_rf_offset
 540  0149 90be18        	ldw	y,L71_rf_bittime
 541  014c 8df901f9      	callf	LC007
 542  0150 2267          	jrugt	L722
 544  0152 90be18        	ldw	y,L71_rf_bittime
 545  0155 8d030203      	callf	LC008
 546  0159 255e          	jrult	L722
 547                     ; 271           RF_data |= 0x01;
 549  015b 72100024      	bset	L14_RF_data,#0
 550                     ; 272           RF_bits++;
 552  015f 3c22          	inc	L53_RF_bits
 553                     ; 273           if(RF_bits < 8) RF_data <<= 1;
 555  0161 b622          	ld	a,L53_RF_bits
 556  0163 a108          	cp	a,#8
 557  0165 2402          	jruge	L132
 560  0167 3824          	sll	L14_RF_data
 561  0169               L132:
 562                     ; 274           if(RF_bits == 8)
 564  0169 a108          	cp	a,#8
 565  016b 2643          	jrne	L332
 566                     ; 277             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 568  016d 8d0d020d      	callf	LC009
 569  0171 2612          	jrne	L532
 570                     ; 282               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 572  0173 be6a          	ldw	x,_RcvRFmsg
 573  0175 2708          	jreq	L732
 574                     ; 285                 flag_RF_StartRec = FALSE;
 576  0177 72110008      	bres	L74_flag_RF_StartRec
 577                     ; 286                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 579  017b 3f26          	clr	L15_RF_rcvState
 581  017d 2006          	jra	L532
 582  017f               L732:
 583                     ; 290                 flag_RF_StartRec = TRUE;
 585  017f 72100008      	bset	L74_flag_RF_StartRec
 586                     ; 291                 idx_temp2 = 0;
 588  0183 3f25          	clr	L54_idx_temp2
 589  0185               L532:
 590                     ; 294             if(RF_bytes == RFSEND_DATALEN) 
 592  0185 a105          	cp	a,#5
 593  0187 2627          	jrne	L332
 594                     ; 296               RFrcvChksum = 0;
 596  0189 3f00          	clr	L13_RFrcvChksum
 597                     ; 297               for(i=0;i<RFSEND_DATALEN-1;i++)
 599  018b 4f            	clr	a
 600  018c 6b01          	ld	(OFST+0,sp),a
 601  018e               L542:
 602                     ; 299                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 604  018e 5f            	clrw	x
 605  018f 97            	ld	xl,a
 606  0190 b600          	ld	a,L13_RFrcvChksum
 607  0192 eb6a          	add	a,(_RcvRFmsg,x)
 608  0194 b700          	ld	L13_RFrcvChksum,a
 609                     ; 297               for(i=0;i<RFSEND_DATALEN-1;i++)
 611  0196 0c01          	inc	(OFST+0,sp)
 614  0198 7b01          	ld	a,(OFST+0,sp)
 615  019a a104          	cp	a,#4
 616  019c 25f0          	jrult	L542
 617                     ; 301               RFrcvChksum = (u8)(~RFrcvChksum);
 619  019e 3300          	cpl	L13_RFrcvChksum
 620                     ; 302               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 622  01a0 b66e          	ld	a,_RcvRFmsg+4
 623  01a2 b100          	cp	a,L13_RFrcvChksum
 624  01a4 2604          	jrne	L352
 625                     ; 304                 RFbytesReady = TRUE;  // set new RF data available flag
 627  01a6               LC006:
 629  01a6 35010020      	mov	_RFbytesReady,#1
 630  01aa               L352:
 631                     ; 306               flag_RF_StartRec = FALSE;
 633                     ; 307               RF_rcvState = RF_RCVSTATE_WAITSTART;
 636  01aa 72110008      	bres	L74_flag_RF_StartRec
 638  01ae 3f26          	clr	L15_RF_rcvState
 639  01b0               L332:
 640                     ; 310           if(rf_offset > 0) rf_offset = 0;
 645  01b0 be1c          	ldw	x,L32_rf_offset
 646  01b2 272d          	jreq	L551
 648  01b4 5f            	clrw	x
 649  01b5               LC003:
 650  01b5 bf1c          	ldw	L32_rf_offset,x
 651  01b7 2028          	jra	L551
 652  01b9               L722:
 653                     ; 312         else if(cap_fall-cap_rise <= rf_halfbittime+RF_EDGES_JITTER && cap_fall-cap_rise >= rf_halfbittime-RF_EDGES_JITTER)
 655  01b9 be65          	ldw	x,L7_cap_fall
 656  01bb 72b00067      	subw	x,L5_cap_rise
 657  01bf 90be1a        	ldw	y,L12_rf_halfbittime
 658  01c2 8df901f9      	callf	LC007
 659  01c6 2217          	jrugt	L162
 661  01c8 be65          	ldw	x,L7_cap_fall
 662  01ca 72b00067      	subw	x,L5_cap_rise
 663  01ce 90be1a        	ldw	y,L12_rf_halfbittime
 664  01d1 8d030203      	callf	LC008
 665  01d5 2508          	jrult	L162
 666                     ; 314           rf_offset = cap_fall-cap_rise;
 668  01d7 be65          	ldw	x,L7_cap_fall
 669  01d9 72b00067      	subw	x,L5_cap_rise
 671  01dd 20d6          	jpf	LC003
 672  01df               L162:
 673                     ; 318           RF_rcvState = RF_RCVSTATE_WAITSTART;
 676  01df 3f26          	clr	L15_RF_rcvState
 677                     ; 323     default: break;
 679  01e1               L551:
 680                     ; 326   TIM3_ClearITPendingBit(TIM3_IT_CC1);
 682  01e1 a602          	ld	a,#2
 683  01e3 cd0000        	call	_TIM3_ClearITPendingBit
 685                     ; 327   TIM3_ClearITPendingBit(TIM3_IT_CC2);
 687  01e6 a604          	ld	a,#4
 688  01e8 cd0000        	call	_TIM3_ClearITPendingBit
 690                     ; 328 }
 693  01eb 84            	pop	a
 694  01ec 85            	popw	x
 695  01ed bf00          	ldw	c_y,x
 696  01ef 320002        	pop	c_y+2
 697  01f2 85            	popw	x
 698  01f3 bf00          	ldw	c_x,x
 699  01f5 320002        	pop	c_x+2
 700  01f8 80            	iret	
 701  01f9               LC007:
 702  01f9 72a90032      	addw	y,#50
 703  01fd 90bf00        	ldw	c_y,y
 704  0200 b300          	cpw	x,c_y
 705  0202 87            	retf	
 706  0203               LC008:
 707  0203 72a20032      	subw	y,#50
 708  0207 90bf00        	ldw	c_y,y
 709  020a b300          	cpw	x,c_y
 710  020c 87            	retf	
 711  020d               LC009:
 712  020d b623          	ld	a,L73_RF_bytes
 713  020f 3c23          	inc	L73_RF_bytes
 714  0211 5f            	clrw	x
 715  0212 97            	ld	xl,a
 716  0213 b624          	ld	a,L14_RF_data
 717  0215 e76a          	ld	(_RcvRFmsg,x),a
 718                     ; 223             RF_bits = 0;
 720  0217 3f22          	clr	L53_RF_bits
 721                     ; 224             RF_data = 0;
 723  0219 3f24          	clr	L14_RF_data
 724                     ; 225             if(RF_bytes == 2)
 726  021b b623          	ld	a,L73_RF_bytes
 727  021d a102          	cp	a,#2
 728  021f 87            	retf	
 750                     ; 335 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 750                     ; 336 {
 751                     .text:	section	.text,new
 752  0000               f_TRAP_IRQHandler:
 756                     ; 340 }
 759  0000 80            	iret	
 781                     ; 347 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 781                     ; 348 {
 782                     .text:	section	.text,new
 783  0000               f_FLASH_IRQHandler:
 787                     ; 352 }
 790  0000 80            	iret	
 812                     ; 359 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 812                     ; 360 {
 813                     .text:	section	.text,new
 814  0000               f_AWU_IRQHandler:
 818                     ; 364 }
 821  0000 80            	iret	
 843                     ; 371 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 843                     ; 372 {
 844                     .text:	section	.text,new
 845  0000               f_EXTIB_IRQHandler:
 849                     ; 376 }
 852  0000 80            	iret	
 874                     ; 383 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 874                     ; 384 {
 875                     .text:	section	.text,new
 876  0000               f_EXTID_IRQHandler:
 880                     ; 388 }
 883  0000 80            	iret	
 905                     ; 395 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 905                     ; 396 {
 906                     .text:	section	.text,new
 907  0000               f_EXTI0_IRQHandler:
 911                     ; 400 }
 914  0000 80            	iret	
 936                     ; 407 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 936                     ; 408 {
 937                     .text:	section	.text,new
 938  0000               f_EXTI1_IRQHandler:
 942                     ; 412 }
 945  0000 80            	iret	
 967                     ; 419 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 967                     ; 420 {
 968                     .text:	section	.text,new
 969  0000               f_EXTI2_IRQHandler:
 973                     ; 424 }
 976  0000 80            	iret	
 998                     ; 431 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 998                     ; 432 {
 999                     .text:	section	.text,new
1000  0000               f_EXTI3_IRQHandler:
1004                     ; 436 }
1007  0000 80            	iret	
1029                     ; 443 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
1029                     ; 444 {
1030                     .text:	section	.text,new
1031  0000               f_EXTI4_IRQHandler:
1035                     ; 448 }
1038  0000 80            	iret	
1060                     ; 455 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
1060                     ; 456 {
1061                     .text:	section	.text,new
1062  0000               f_EXTI5_IRQHandler:
1066                     ; 460 }
1069  0000 80            	iret	
1091                     ; 467 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
1091                     ; 468 
1091                     ; 469 {
1092                     .text:	section	.text,new
1093  0000               f_EXTI6_IRQHandler:
1097                     ; 473 }
1100  0000 80            	iret	
1122                     ; 480 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
1122                     ; 481 {
1123                     .text:	section	.text,new
1124  0000               f_EXTI7_IRQHandler:
1128                     ; 485 }
1131  0000 80            	iret	
1153                     ; 492 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
1153                     ; 493 {
1154                     .text:	section	.text,new
1155  0000               f_COMP_IRQHandler:
1159                     ; 497 }
1162  0000 80            	iret	
1221                     ; 504 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
1221                     ; 505 {
1222                     .text:	section	.text,new
1223  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
1225  0000 8a            	push	cc
1226  0001 84            	pop	a
1227  0002 a4bf          	and	a,#191
1228  0004 88            	push	a
1229  0005 86            	pop	cc
1230  0006 3b0002        	push	c_x+2
1231  0009 be00          	ldw	x,c_x
1232  000b 89            	pushw	x
1233  000c 3b0002        	push	c_y+2
1234  000f be00          	ldw	x,c_y
1235  0011 89            	pushw	x
1238                     ; 509   interrupt_status = 1;
1240  0012 35010069      	mov	L3_interrupt_status,#1
1241                     ; 510   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
1243  0016 a601          	ld	a,#1
1244  0018 cd0000        	call	_TIM2_GetITStatus
1246  001b 4d            	tnz	a
1247  001c 2604acac01ac  	jreq	L554
1248                     ; 513     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
1250  0022 be00          	ldw	x,_cnt_flag_250ms
1251  0024 a3ffff        	cpw	x,#65535
1252  0027 2403          	jruge	L754
1255  0029 5c            	incw	x
1256  002a bf00          	ldw	_cnt_flag_250ms,x
1257  002c               L754:
1258                     ; 514     if(cnt_flag_250ms >= CNTVAL_250MS) 
1260  002c a300fa        	cpw	x,#250
1261  002f 2507          	jrult	L164
1262                     ; 516       cnt_flag_250ms = 0;
1264  0031 5f            	clrw	x
1265  0032 bf00          	ldw	_cnt_flag_250ms,x
1266                     ; 517       FLAG_250ms = TRUE;
1268  0034 72100000      	bset	_FLAG_250ms
1269  0038               L164:
1270                     ; 519     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
1272  0038 be02          	ldw	x,_cnt_flag_500ms
1273  003a a3ffff        	cpw	x,#65535
1274  003d 2403          	jruge	L364
1277  003f 5c            	incw	x
1278  0040 bf02          	ldw	_cnt_flag_500ms,x
1279  0042               L364:
1280                     ; 520     if(cnt_flag_500ms >= CNTVAL_500MS) 
1282  0042 a301f4        	cpw	x,#500
1283  0045 2507          	jrult	L564
1284                     ; 522       cnt_flag_500ms = 0;
1286  0047 5f            	clrw	x
1287  0048 bf02          	ldw	_cnt_flag_500ms,x
1288                     ; 523       FLAG_500ms = TRUE;
1290  004a 72100001      	bset	_FLAG_500ms
1291  004e               L564:
1292                     ; 525     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
1294  004e be04          	ldw	x,_cnt_flag_1000ms
1295  0050 a3ffff        	cpw	x,#65535
1296  0053 2403          	jruge	L764
1299  0055 5c            	incw	x
1300  0056 bf04          	ldw	_cnt_flag_1000ms,x
1301  0058               L764:
1302                     ; 526     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
1304  0058 a303e8        	cpw	x,#1000
1305  005b 2507          	jrult	L174
1306                     ; 528       cnt_flag_1000ms = 0;
1308  005d 5f            	clrw	x
1309  005e bf04          	ldw	_cnt_flag_1000ms,x
1310                     ; 529       FLAG_1000ms = TRUE;
1312  0060 72100002      	bset	_FLAG_1000ms
1313  0064               L174:
1314                     ; 532     if(!Timeout_istout1)
1316  0064 720000000d    	btjt	_Timeout_istout1,L374
1317                     ; 534       Timeout_toutcnt1++;
1319  0069 be00          	ldw	x,_Timeout_toutcnt1
1320  006b 5c            	incw	x
1321  006c bf00          	ldw	_Timeout_toutcnt1,x
1322                     ; 535       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
1324  006e b300          	cpw	x,_Timeout_tout1
1325  0070 2504          	jrult	L374
1328  0072 72100000      	bset	_Timeout_istout1
1329  0076               L374:
1330                     ; 537     if(!Timeout_istout2)
1332  0076 720000000d    	btjt	_Timeout_istout2,L774
1333                     ; 539       Timeout_toutcnt2++;
1335  007b be00          	ldw	x,_Timeout_toutcnt2
1336  007d 5c            	incw	x
1337  007e bf00          	ldw	_Timeout_toutcnt2,x
1338                     ; 540       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1340  0080 b300          	cpw	x,_Timeout_tout2
1341  0082 2504          	jrult	L774
1344  0084 72100000      	bset	_Timeout_istout2
1345  0088               L774:
1346                     ; 542     if(!Timeout_istout3)
1348  0088 720000000d    	btjt	_Timeout_istout3,L305
1349                     ; 544       Timeout_toutcnt3++;
1351  008d be00          	ldw	x,_Timeout_toutcnt3
1352  008f 5c            	incw	x
1353  0090 bf00          	ldw	_Timeout_toutcnt3,x
1354                     ; 545       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1356  0092 b300          	cpw	x,_Timeout_tout3
1357  0094 2504          	jrult	L305
1360  0096 72100000      	bset	_Timeout_istout3
1361  009a               L305:
1362                     ; 548     if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
1364  009a b621          	ld	a,L33_RFrcvTimeoutcnt
1365  009c a1ff          	cp	a,#255
1366  009e 2404          	jruge	L705
1369  00a0 3c21          	inc	L33_RFrcvTimeoutcnt
1370  00a2 b621          	ld	a,L33_RFrcvTimeoutcnt
1371  00a4               L705:
1372                     ; 549     if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1374  00a4 a164          	cp	a,#100
1375  00a6 2502          	jrult	L115
1376                     ; 551       RF_rcvState = RF_RCVSTATE_WAITSTART;
1378  00a8 3f26          	clr	L15_RF_rcvState
1379  00aa               L115:
1380                     ; 555     if(!BTN1_STATE)
1382  00aa 7204500116    	btjt	20481,#2,L315
1383                     ; 557       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1385  00af b606          	ld	a,_btn1_0_cnt
1386  00b1 a1ff          	cp	a,#255
1387  00b3 2402          	jruge	L515
1390  00b5 3c06          	inc	_btn1_0_cnt
1391  00b7               L515:
1392                     ; 558       btn1_1_cnt = 0;
1394  00b7 3f07          	clr	_btn1_1_cnt
1395                     ; 559       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1397  00b9 b606          	ld	a,_btn1_0_cnt
1398  00bb a11e          	cp	a,#30
1399  00bd 2518          	jrult	L125
1400                     ; 561         BTN1_DEB_STATE = BTN_PRESSED;
1402  00bf 35010008      	mov	_BTN1_DEB_STATE,#1
1403  00c3 2012          	jra	L125
1404  00c5               L315:
1405                     ; 566       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1407  00c5 b607          	ld	a,_btn1_1_cnt
1408  00c7 a1ff          	cp	a,#255
1409  00c9 2402          	jruge	L325
1412  00cb 3c07          	inc	_btn1_1_cnt
1413  00cd               L325:
1414                     ; 567       btn1_0_cnt = 0;
1416  00cd 3f06          	clr	_btn1_0_cnt
1417                     ; 568       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1419  00cf b607          	ld	a,_btn1_1_cnt
1420  00d1 a11e          	cp	a,#30
1421  00d3 2502          	jrult	L125
1422                     ; 570         BTN1_DEB_STATE = BTN_DEPRESSED;
1424  00d5 3f08          	clr	_BTN1_DEB_STATE
1425  00d7               L125:
1426                     ; 576     if(BTN1_DEB_STATE == BTN_PRESSED)
1428  00d7 b608          	ld	a,_BTN1_DEB_STATE
1429  00d9 4a            	dec	a
1430  00da 260a          	jrne	L725
1431                     ; 578       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1433  00dc be0a          	ldw	x,_BTN1_press_timer
1434  00de a3ffff        	cpw	x,#65535
1435  00e1 2403          	jruge	L725
1438  00e3 5c            	incw	x
1439  00e4 bf0a          	ldw	_BTN1_press_timer,x
1440  00e6               L725:
1441                     ; 581     if(!BTN1_DELAY_FLAG)
1443  00e6 720000030e    	btjt	_BTN1_DELAY_FLAG,L335
1444                     ; 583       btn1_delay_cnt++;
1446  00eb 3c09          	inc	_btn1_delay_cnt
1447                     ; 584       if(btn1_delay_cnt == BTN_DELAY)
1449  00ed b609          	ld	a,_btn1_delay_cnt
1450  00ef a196          	cp	a,#150
1451  00f1 2606          	jrne	L335
1452                     ; 586         btn1_delay_cnt = 0;
1454  00f3 3f09          	clr	_btn1_delay_cnt
1455                     ; 587         BTN1_DELAY_FLAG = TRUE;
1457  00f5 72100003      	bset	_BTN1_DELAY_FLAG
1458  00f9               L335:
1459                     ; 593     if(flag_blink_redLED)
1461  00f9 7201000550    	btjf	_flag_blink_redLED,L735
1462                     ; 595       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1464  00fe be0d          	ldw	x,_cnt_state_redLED
1465  0100 a3ffff        	cpw	x,#65535
1466  0103 2403          	jruge	L145
1469  0105 5c            	incw	x
1470  0106 bf0d          	ldw	_cnt_state_redLED,x
1471  0108               L145:
1472                     ; 596       if(flag_blink_on_off)
1474  0108 7201000412    	btjf	_flag_blink_on_off,L345
1475                     ; 598         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1477  010d a30032        	cpw	x,#50
1478  0110 253c          	jrult	L735
1479                     ; 600           flag_blink_on_off = FALSE;
1481  0112 72110004      	bres	_flag_blink_on_off
1482                     ; 601           cnt_state_redLED = 0;
1484  0116 5f            	clrw	x
1485  0117 bf0d          	ldw	_cnt_state_redLED,x
1486                     ; 602           LED_OFF;
1488  0119 7217500a      	bres	20490,#3
1491  011d 202b          	jpf	LC010
1492  011f               L345:
1493                     ; 607         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1495  011f a300c8        	cpw	x,#200
1496  0122 252a          	jrult	L735
1497                     ; 609           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1499  0124 b611          	ld	a,_cnt_blink_redLED
1500  0126 a1ff          	cp	a,#255
1501  0128 2402          	jruge	L355
1504  012a 3c11          	inc	_cnt_blink_redLED
1505  012c               L355:
1506                     ; 610           flag_blink_on_off = TRUE;
1508  012c 72100004      	bset	_flag_blink_on_off
1509                     ; 611           cnt_state_redLED = 0;
1511  0130 5f            	clrw	x
1512  0131 bf0d          	ldw	_cnt_state_redLED,x
1513                     ; 612           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1515  0133 b611          	ld	a,_cnt_blink_redLED
1516  0135 b113          	cp	a,_blink_redLED_times
1517  0137 250d          	jrult	L555
1519  0139 7200000708    	btjt	_flag_blink_unlimited,L555
1520                     ; 614             flag_blink_redLED = FALSE;
1522  013e 72110005      	bres	_flag_blink_redLED
1523                     ; 615             cnt_blink_redLED = 0;
1525  0142 3f11          	clr	_cnt_blink_redLED
1527  0144 2008          	jra	L735
1528  0146               L555:
1529                     ; 619             LED_RED_ON;
1531  0146 7216500a      	bset	20490,#3
1534  014a               LC010:
1536  014a 7219500a      	bres	20490,#4
1538  014e               L735:
1539                     ; 624     if(flag_blink_greenLED)
1541  014e 7201000654    	btjf	_flag_blink_greenLED,L165
1542                     ; 626       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1544  0153 be0f          	ldw	x,_cnt_state_greenLED
1545  0155 a3ffff        	cpw	x,#65535
1546  0158 2403          	jruge	L365
1549  015a 5c            	incw	x
1550  015b bf0f          	ldw	_cnt_state_greenLED,x
1551  015d               L365:
1552                     ; 627       if(flag_blink_on_off)
1554  015d 7201000416    	btjf	_flag_blink_on_off,L565
1555                     ; 629         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1557  0162 a30032        	cpw	x,#50
1558  0165 2540          	jrult	L165
1559                     ; 631           flag_blink_on_off = FALSE;
1561  0167 72110004      	bres	_flag_blink_on_off
1562                     ; 632           cnt_state_greenLED = 0;
1564  016b 5f            	clrw	x
1565  016c bf0f          	ldw	_cnt_state_greenLED,x
1566                     ; 633           LED_OFF;
1568  016e 7217500a      	bres	20490,#3
1571  0172 7219500a      	bres	20490,#4
1573  0176 202f          	jra	L165
1574  0178               L565:
1575                     ; 638         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1577  0178 a300c8        	cpw	x,#200
1578  017b 252a          	jrult	L165
1579                     ; 640           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1581  017d b612          	ld	a,_cnt_blink_greenLED
1582  017f a1ff          	cp	a,#255
1583  0181 2402          	jruge	L575
1586  0183 3c12          	inc	_cnt_blink_greenLED
1587  0185               L575:
1588                     ; 641           flag_blink_on_off = TRUE;
1590  0185 72100004      	bset	_flag_blink_on_off
1591                     ; 642           cnt_state_greenLED = 0;
1593  0189 5f            	clrw	x
1594  018a bf0f          	ldw	_cnt_state_greenLED,x
1595                     ; 643           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1597  018c b612          	ld	a,_cnt_blink_greenLED
1598  018e b114          	cp	a,_blink_greenLED_times
1599  0190 250d          	jrult	L775
1601  0192 7200000708    	btjt	_flag_blink_unlimited,L775
1602                     ; 645             flag_blink_greenLED = FALSE;
1604  0197 72110006      	bres	_flag_blink_greenLED
1605                     ; 646             cnt_blink_greenLED = 0;
1607  019b 3f12          	clr	_cnt_blink_greenLED
1609  019d 2008          	jra	L165
1610  019f               L775:
1611                     ; 650             LED_GREEN_ON;
1613  019f 7217500a      	bres	20490,#3
1616  01a3 7218500a      	bset	20490,#4
1618  01a7               L165:
1619                     ; 656     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
1621  01a7 a601          	ld	a,#1
1622  01a9 cd0000        	call	_TIM2_ClearITPendingBit
1624  01ac               L554:
1625                     ; 658   interrupt_status = 0;
1627  01ac 3f69          	clr	L3_interrupt_status
1628                     ; 659 }
1631  01ae 85            	popw	x
1632  01af bf00          	ldw	c_y,x
1633  01b1 320002        	pop	c_y+2
1634  01b4 85            	popw	x
1635  01b5 bf00          	ldw	c_x,x
1636  01b7 320002        	pop	c_x+2
1637  01ba 80            	iret	
1660                     ; 666 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1660                     ; 667 {
1661                     .text:	section	.text,new
1662  0000               f_TIM2_CAP_IRQHandler:
1666                     ; 671 }
1669  0000 80            	iret	
1692                     ; 678 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1692                     ; 679 {
1693                     .text:	section	.text,new
1694  0000               f_TIM4_UPD_OVF_IRQHandler:
1698                     ; 683 }
1701  0000 80            	iret	
1723                     ; 690 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1723                     ; 691 {
1724                     .text:	section	.text,new
1725  0000               f_SPI_IRQHandler:
1729                     ; 695 }
1732  0000 80            	iret	
1755                     ; 701 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1755                     ; 702 {
1756                     .text:	section	.text,new
1757  0000               f_USART_TX_IRQHandler:
1761                     ; 706 }
1764  0000 80            	iret	
1787                     ; 713 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1787                     ; 714 {
1788                     .text:	section	.text,new
1789  0000               f_USART_RX_IRQHandler:
1793                     ; 718 }
1796  0000 80            	iret	
1818                     ; 726 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1818                     ; 727 {
1819                     .text:	section	.text,new
1820  0000               f_I2C_IRQHandler:
1824                     ; 731 }
1827  0000 80            	iret	
2346                     	xdef	_FLAG_UART_cmd_rcv
2347                     	switch	.ubsct
2348  0000               L13_RFrcvChksum:
2349  0000 00            	ds.b	1
2350  0001               L52_rcv_buff:
2351  0001 000000000000  	ds.b	100
2352  0065               L7_cap_fall:
2353  0065 0000          	ds.b	2
2354  0067               L5_cap_rise:
2355  0067 0000          	ds.b	2
2356                     	xdef	_cnt_blink_greenLED
2357                     	xdef	_cnt_blink_redLED
2358                     	xdef	_debug
2359  0069               L3_interrupt_status:
2360  0069 00            	ds.b	1
2361                     	xref.b	_Timeout_tout3
2362                     	xref.b	_Timeout_tout2
2363                     	xref.b	_Timeout_tout1
2364                     	xref.b	_Timeout_toutcnt3
2365                     	xref.b	_Timeout_toutcnt2
2366                     	xref.b	_Timeout_toutcnt1
2367                     	xbit	_Timeout_istout3
2368                     	xbit	_Timeout_istout2
2369                     	xbit	_Timeout_istout1
2370                     	xdef	_btn1_delay_cnt
2371                     	xdef	_btn1_1_cnt
2372                     	xdef	_btn1_0_cnt
2373                     	xdef	_cnt_flag_1000ms
2374                     	xdef	_cnt_flag_500ms
2375                     	xdef	_cnt_flag_250ms
2376                     	xdef	f_I2C_IRQHandler
2377                     	xdef	f_USART_RX_IRQHandler
2378                     	xdef	f_USART_TX_IRQHandler
2379                     	xdef	f_SPI_IRQHandler
2380                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2381                     	xdef	f_TIM3_CAP_IRQHandler
2382                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2383                     	xdef	f_TIM2_CAP_IRQHandler
2384                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2385                     	xdef	f_COMP_IRQHandler
2386                     	xdef	f_EXTI7_IRQHandler
2387                     	xdef	f_EXTI6_IRQHandler
2388                     	xdef	f_EXTI5_IRQHandler
2389                     	xdef	f_EXTI4_IRQHandler
2390                     	xdef	f_EXTI3_IRQHandler
2391                     	xdef	f_EXTI2_IRQHandler
2392                     	xdef	f_EXTI1_IRQHandler
2393                     	xdef	f_EXTI0_IRQHandler
2394                     	xdef	f_EXTID_IRQHandler
2395                     	xdef	f_EXTIB_IRQHandler
2396                     	xdef	f_AWU_IRQHandler
2397                     	xdef	f_FLASH_IRQHandler
2398                     	xdef	f_TRAP_IRQHandler
2399                     	xdef	f_NonHandledInterrupt
2400                     	xdef	_RFbytesReady
2401  006a               _RcvRFmsg:
2402  006a 0000000000    	ds.b	5
2403                     	xdef	_RcvRFmsg
2404                     	xdef	_flag_blink_unlimited
2405                     	xdef	_flag_blink_greenLED
2406                     	xdef	_flag_blink_redLED
2407                     	xdef	_flag_blink_on_off
2408                     	xdef	_cnt_state_greenLED
2409                     	xdef	_cnt_state_redLED
2410                     	xdef	_blink_greenLED_times
2411                     	xdef	_blink_redLED_times
2412                     	xdef	_FLAG_1000ms
2413                     	xdef	_FLAG_500ms
2414                     	xdef	_FLAG_250ms
2415                     	xdef	_BTN1_press_timer
2416                     	xdef	_BTN1_DELAY_FLAG
2417                     	xdef	_BTN1_DEB_STATE
2418                     	xref	_TIM3_ClearITPendingBit
2419                     	xref	_TIM3_GetITStatus
2420                     	xref	_TIM3_GetCapture2
2421                     	xref	_TIM3_GetCapture1
2422                     	xref	_TIM2_ClearITPendingBit
2423                     	xref	_TIM2_GetITStatus
2424                     	xref.b	c_x
2425                     	xref.b	c_y
2445                     	end
