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
  77  0015               _RFbytesReady:
  78  0015 00            	dc.b	0
  79  0016               L7_RFrcvTimeoutcnt:
  80  0016 00            	dc.b	0
  81  0017               L51_RF_bits:
  82  0017 00            	dc.b	0
  83  0018               L71_RF_bytes:
  84  0018 00            	dc.b	0
  85  0019               L12_RF_data:
  86  0019 00            	dc.b	0
  87  001a               L32_RF_PulsePeriod:
  88  001a 0000          	dc.w	0
  89  001c               L72_idx_temp2:
  90  001c 00            	dc.b	0
  91                     	switch	.bit
  92  0008               L13_flag_RF_StartRec:
  93  0008 01            	dc.b	1
  94                     	bsct
  95  001d               L33_RF_rcvState:
  96  001d 00            	dc.b	0
  97                     	switch	.bit
  98  0009               _FLAG_UART_cmd_rcv:
  99  0009 00            	dc.b	0
 129                     ; 122 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 129                     ; 123 {
 130                     .text:	section	.text,new
 131  0000               f_NonHandledInterrupt:
 135                     ; 127 }
 138  0000 80            	iret	
 161                     ; 135 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 161                     ; 136 {
 162                     .text:	section	.text,new
 163  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 167                     ; 140 }
 170  0000 80            	iret	
 218                     ; 146 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 218                     ; 147 {
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
 237                     ; 151     if(TIM3_GetITStatus(TIM3_IT_CC1))
 239  0013 a602          	ld	a,#2
 240  0015 cd0000        	call	_TIM3_GetITStatus
 242  0018 4d            	tnz	a
 243  0019 2604ace100e1  	jreq	L701
 244                     ; 153       RF_PulsePeriod = TIM3_GetCapture1();
 246  001f cd0000        	call	_TIM3_GetCapture1
 248  0022 bf1a          	ldw	L32_RF_PulsePeriod,x
 249                     ; 154       if(flag_RF_StartRec)
 251  0024 7201000815    	btjf	L13_flag_RF_StartRec,L111
 252                     ; 156         if(idx_temp2 < RFRECORDLEN)
 254  0029 b61c          	ld	a,L72_idx_temp2
 255  002b a11e          	cp	a,#30
 256  002d 240c          	jruge	L311
 257                     ; 158           temp2[idx_temp2++] = RF_PulsePeriod;
 259  002f 3c1c          	inc	L72_idx_temp2
 260  0031 5f            	clrw	x
 261  0032 97            	ld	xl,a
 262  0033 58            	sllw	x
 263  0034 90be1a        	ldw	y,L32_RF_PulsePeriod
 264  0037 ef00          	ldw	(L52_temp2,x),y
 266  0039 2003          	jra	L111
 267  003b               L311:
 268                     ; 162           debug = debug;
 270  003b 450c0c        	mov	_debug,_debug
 271  003e               L111:
 272                     ; 165       switch(RF_rcvState)
 274  003e b61d          	ld	a,L33_RF_rcvState
 276                     ; 238         default: break;
 277  0040 2707          	jreq	L36
 278  0042 4a            	dec	a
 279  0043 271e          	jreq	L56
 280  0045 ace100e1      	jra	L701
 281  0049               L36:
 282                     ; 170           if(RF_PulsePeriod > (u16)1100 && RF_PulsePeriod < (u16)1300)
 284  0049 be1a          	ldw	x,L32_RF_PulsePeriod
 285  004b a3044d        	cpw	x,#1101
 286  004e 25f5          	jrult	L701
 288  0050 a30514        	cpw	x,#1300
 289  0053 24f0          	jruge	L701
 290                     ; 172             RF_bits = 0;
 292  0055 b717          	ld	L51_RF_bits,a
 293                     ; 173             RF_bytes = 0;
 295  0057 b718          	ld	L71_RF_bytes,a
 296                     ; 174             RF_data = 0;
 298  0059 b719          	ld	L12_RF_data,a
 299                     ; 175             RF_rcvState = RF_RCVSTATE_REC8BITS;
 301  005b 3501001d      	mov	L33_RF_rcvState,#1
 302  005f ace100e1      	jra	L701
 303  0063               L56:
 304                     ; 182           if(RF_PulsePeriod >= 1100) 
 306  0063 be1a          	ldw	x,L32_RF_PulsePeriod
 307  0065 a3044c        	cpw	x,#1100
 308  0068 250c          	jrult	L521
 309                     ; 185             RF_bits = 0;
 311  006a b717          	ld	L51_RF_bits,a
 312                     ; 186             RF_bytes = 0;
 314  006c b718          	ld	L71_RF_bytes,a
 315                     ; 187             RF_data = 0;
 317  006e b719          	ld	L12_RF_data,a
 318                     ; 188             flag_RF_StartRec = FALSE;
 320  0070 72110008      	bres	L13_flag_RF_StartRec
 322  0074 206b          	jra	L701
 323  0076               L521:
 324                     ; 192             if(RF_PulsePeriod >= RF_MIDDLEBIT)   // 0 bit = 500uS, 1 bit = 750uS
 326  0076 a30271        	cpw	x,#625
 327  0079 2504          	jrult	L131
 328                     ; 195               RF_data |= 0x01;
 330  007b 72100019      	bset	L12_RF_data,#0
 331  007f               L131:
 332                     ; 197             RF_bits++;
 334  007f 3c17          	inc	L51_RF_bits
 335                     ; 198             if(RF_bits < 8) RF_data <<= 1;
 337  0081 b617          	ld	a,L51_RF_bits
 338  0083 a108          	cp	a,#8
 339  0085 2402          	jruge	L331
 342  0087 3819          	sll	L12_RF_data
 343  0089               L331:
 344                     ; 199             if(RF_bits == 8)
 346  0089 a108          	cp	a,#8
 347  008b 2654          	jrne	L701
 348                     ; 202               RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 350  008d b618          	ld	a,L71_RF_bytes
 351  008f 3c18          	inc	L71_RF_bytes
 352  0091 5f            	clrw	x
 353  0092 97            	ld	xl,a
 354  0093 b619          	ld	a,L12_RF_data
 355  0095 e73e          	ld	(_RcvRFmsg,x),a
 356                     ; 203               RF_bits = 0;
 358  0097 3f17          	clr	L51_RF_bits
 359                     ; 204               RF_data = 0;
 361  0099 3f19          	clr	L12_RF_data
 362                     ; 205               if(RF_bytes == 2)
 364  009b b618          	ld	a,L71_RF_bytes
 365  009d a102          	cp	a,#2
 366  009f 2615          	jrne	L731
 367                     ; 207                 if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 369  00a1 be3e          	ldw	x,_RcvRFmsg
 370  00a3 a381b3        	cpw	x,#33203
 371  00a6 2708          	jreq	L141
 372                     ; 210                   flag_RF_StartRec = FALSE;
 374  00a8 72110008      	bres	L13_flag_RF_StartRec
 375                     ; 211                   RF_rcvState = RF_RCVSTATE_WAITSTART;
 377  00ac 3f1d          	clr	L33_RF_rcvState
 379  00ae 2006          	jra	L731
 380  00b0               L141:
 381                     ; 215                   flag_RF_StartRec = TRUE;
 383  00b0 72100008      	bset	L13_flag_RF_StartRec
 384                     ; 216                   idx_temp2 = 0;
 386  00b4 3f1c          	clr	L72_idx_temp2
 387  00b6               L731:
 388                     ; 219               if(RF_bytes == RFSEND_DATALEN) 
 390  00b6 a105          	cp	a,#5
 391  00b8 2627          	jrne	L701
 392                     ; 221                 RFrcvChksum = 0;
 394  00ba 3f3c          	clr	L5_RFrcvChksum
 395                     ; 222                 for(i=0;i<RFSEND_DATALEN-1;i++)
 397  00bc 4f            	clr	a
 398  00bd 6b01          	ld	(OFST+0,sp),a
 399  00bf               L741:
 400                     ; 224                   RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 402  00bf 5f            	clrw	x
 403  00c0 97            	ld	xl,a
 404  00c1 b63c          	ld	a,L5_RFrcvChksum
 405  00c3 eb3e          	add	a,(_RcvRFmsg,x)
 406  00c5 b73c          	ld	L5_RFrcvChksum,a
 407                     ; 222                 for(i=0;i<RFSEND_DATALEN-1;i++)
 409  00c7 0c01          	inc	(OFST+0,sp)
 412  00c9 7b01          	ld	a,(OFST+0,sp)
 413  00cb a104          	cp	a,#4
 414  00cd 25f0          	jrult	L741
 415                     ; 226                 RFrcvChksum = (u8)(~RFrcvChksum);
 417  00cf 333c          	cpl	L5_RFrcvChksum
 418                     ; 227                 if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 420  00d1 b642          	ld	a,_RcvRFmsg+4
 421  00d3 b13c          	cp	a,L5_RFrcvChksum
 422  00d5 2604          	jrne	L551
 423                     ; 229                   RFbytesReady = TRUE;  // set new RF data available flag
 425  00d7 35010015      	mov	_RFbytesReady,#1
 426  00db               L551:
 427                     ; 231                 flag_RF_StartRec = FALSE;
 429  00db 72110008      	bres	L13_flag_RF_StartRec
 430                     ; 232                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 432  00df 3f1d          	clr	L33_RF_rcvState
 433                     ; 238         default: break;
 435  00e1               L701:
 436                     ; 241 }
 439  00e1 84            	pop	a
 440  00e2 85            	popw	x
 441  00e3 bf00          	ldw	c_y,x
 442  00e5 320002        	pop	c_y+2
 443  00e8 85            	popw	x
 444  00e9 bf00          	ldw	c_x,x
 445  00eb 320002        	pop	c_x+2
 446  00ee 80            	iret	
 468                     ; 248 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 468                     ; 249 {
 469                     .text:	section	.text,new
 470  0000               f_TRAP_IRQHandler:
 474                     ; 253 }
 477  0000 80            	iret	
 499                     ; 260 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 499                     ; 261 {
 500                     .text:	section	.text,new
 501  0000               f_FLASH_IRQHandler:
 505                     ; 265 }
 508  0000 80            	iret	
 530                     ; 272 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 530                     ; 273 {
 531                     .text:	section	.text,new
 532  0000               f_AWU_IRQHandler:
 536                     ; 277 }
 539  0000 80            	iret	
 561                     ; 284 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 561                     ; 285 {
 562                     .text:	section	.text,new
 563  0000               f_EXTIB_IRQHandler:
 567                     ; 289 }
 570  0000 80            	iret	
 592                     ; 296 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 592                     ; 297 {
 593                     .text:	section	.text,new
 594  0000               f_EXTID_IRQHandler:
 598                     ; 301 }
 601  0000 80            	iret	
 623                     ; 308 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 623                     ; 309 {
 624                     .text:	section	.text,new
 625  0000               f_EXTI0_IRQHandler:
 629                     ; 313 }
 632  0000 80            	iret	
 654                     ; 320 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 654                     ; 321 {
 655                     .text:	section	.text,new
 656  0000               f_EXTI1_IRQHandler:
 660                     ; 325 }
 663  0000 80            	iret	
 685                     ; 332 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 685                     ; 333 {
 686                     .text:	section	.text,new
 687  0000               f_EXTI2_IRQHandler:
 691                     ; 337 }
 694  0000 80            	iret	
 716                     ; 344 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 716                     ; 345 {
 717                     .text:	section	.text,new
 718  0000               f_EXTI3_IRQHandler:
 722                     ; 349 }
 725  0000 80            	iret	
 747                     ; 356 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 747                     ; 357 {
 748                     .text:	section	.text,new
 749  0000               f_EXTI4_IRQHandler:
 753                     ; 361 }
 756  0000 80            	iret	
 778                     ; 368 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 778                     ; 369 {
 779                     .text:	section	.text,new
 780  0000               f_EXTI5_IRQHandler:
 784                     ; 373 }
 787  0000 80            	iret	
 809                     ; 380 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 809                     ; 381 
 809                     ; 382 {
 810                     .text:	section	.text,new
 811  0000               f_EXTI6_IRQHandler:
 815                     ; 386 }
 818  0000 80            	iret	
 840                     ; 393 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 840                     ; 394 {
 841                     .text:	section	.text,new
 842  0000               f_EXTI7_IRQHandler:
 846                     ; 398 }
 849  0000 80            	iret	
 871                     ; 405 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 871                     ; 406 {
 872                     .text:	section	.text,new
 873  0000               f_COMP_IRQHandler:
 877                     ; 410 }
 880  0000 80            	iret	
 937                     ; 417 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 937                     ; 418 {
 938                     .text:	section	.text,new
 939  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 941  0000 8a            	push	cc
 942  0001 84            	pop	a
 943  0002 a4bf          	and	a,#191
 944  0004 88            	push	a
 945  0005 86            	pop	cc
 946  0006 3b0002        	push	c_x+2
 947  0009 be00          	ldw	x,c_x
 948  000b 89            	pushw	x
 949  000c 3b0002        	push	c_y+2
 950  000f be00          	ldw	x,c_y
 951  0011 89            	pushw	x
 954                     ; 422   interrupt_status = 1;
 956  0012 3501003d      	mov	L3_interrupt_status,#1
 957                     ; 423   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
 959  0016 a601          	ld	a,#1
 960  0018 cd0000        	call	_TIM2_GetITStatus
 962  001b 4d            	tnz	a
 963  001c 2604ac9c019c  	jreq	L743
 964                     ; 426     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
 966  0022 be00          	ldw	x,_cnt_flag_250ms
 967  0024 a3ffff        	cpw	x,#65535
 968  0027 2403          	jruge	L153
 971  0029 5c            	incw	x
 972  002a bf00          	ldw	_cnt_flag_250ms,x
 973  002c               L153:
 974                     ; 427     if(cnt_flag_250ms >= CNTVAL_250MS) 
 976  002c a300fa        	cpw	x,#250
 977  002f 2507          	jrult	L353
 978                     ; 429       cnt_flag_250ms = 0;
 980  0031 5f            	clrw	x
 981  0032 bf00          	ldw	_cnt_flag_250ms,x
 982                     ; 430       FLAG_250ms = TRUE;
 984  0034 72100000      	bset	_FLAG_250ms
 985  0038               L353:
 986                     ; 432     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
 988  0038 be02          	ldw	x,_cnt_flag_500ms
 989  003a a3ffff        	cpw	x,#65535
 990  003d 2403          	jruge	L553
 993  003f 5c            	incw	x
 994  0040 bf02          	ldw	_cnt_flag_500ms,x
 995  0042               L553:
 996                     ; 433     if(cnt_flag_500ms >= CNTVAL_500MS) 
 998  0042 a301f4        	cpw	x,#500
 999  0045 2507          	jrult	L753
1000                     ; 435       cnt_flag_500ms = 0;
1002  0047 5f            	clrw	x
1003  0048 bf02          	ldw	_cnt_flag_500ms,x
1004                     ; 436       FLAG_500ms = TRUE;
1006  004a 72100001      	bset	_FLAG_500ms
1007  004e               L753:
1008                     ; 438     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
1010  004e be04          	ldw	x,_cnt_flag_1000ms
1011  0050 a3ffff        	cpw	x,#65535
1012  0053 2403          	jruge	L163
1015  0055 5c            	incw	x
1016  0056 bf04          	ldw	_cnt_flag_1000ms,x
1017  0058               L163:
1018                     ; 439     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
1020  0058 a303e8        	cpw	x,#1000
1021  005b 2507          	jrult	L363
1022                     ; 441       cnt_flag_1000ms = 0;
1024  005d 5f            	clrw	x
1025  005e bf04          	ldw	_cnt_flag_1000ms,x
1026                     ; 442       FLAG_1000ms = TRUE;
1028  0060 72100002      	bset	_FLAG_1000ms
1029  0064               L363:
1030                     ; 445     if(!Timeout_istout1)
1032  0064 720000000d    	btjt	_Timeout_istout1,L563
1033                     ; 447       Timeout_toutcnt1++;
1035  0069 be00          	ldw	x,_Timeout_toutcnt1
1036  006b 5c            	incw	x
1037  006c bf00          	ldw	_Timeout_toutcnt1,x
1038                     ; 448       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
1040  006e b300          	cpw	x,_Timeout_tout1
1041  0070 2504          	jrult	L563
1044  0072 72100000      	bset	_Timeout_istout1
1045  0076               L563:
1046                     ; 450     if(!Timeout_istout2)
1048  0076 720000000d    	btjt	_Timeout_istout2,L173
1049                     ; 452       Timeout_toutcnt2++;
1051  007b be00          	ldw	x,_Timeout_toutcnt2
1052  007d 5c            	incw	x
1053  007e bf00          	ldw	_Timeout_toutcnt2,x
1054                     ; 453       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
1056  0080 b300          	cpw	x,_Timeout_tout2
1057  0082 2504          	jrult	L173
1060  0084 72100000      	bset	_Timeout_istout2
1061  0088               L173:
1062                     ; 455     if(!Timeout_istout3)
1064  0088 720000000d    	btjt	_Timeout_istout3,L573
1065                     ; 457       Timeout_toutcnt3++;
1067  008d be00          	ldw	x,_Timeout_toutcnt3
1068  008f 5c            	incw	x
1069  0090 bf00          	ldw	_Timeout_toutcnt3,x
1070                     ; 458       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
1072  0092 b300          	cpw	x,_Timeout_tout3
1073  0094 2504          	jrult	L573
1076  0096 72100000      	bset	_Timeout_istout3
1077  009a               L573:
1078                     ; 462     if(!BTN1_STATE)
1080  009a 7204500116    	btjt	20481,#2,L104
1081                     ; 464       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
1083  009f b606          	ld	a,_btn1_0_cnt
1084  00a1 a1ff          	cp	a,#255
1085  00a3 2402          	jruge	L304
1088  00a5 3c06          	inc	_btn1_0_cnt
1089  00a7               L304:
1090                     ; 465       btn1_1_cnt = 0;
1092  00a7 3f07          	clr	_btn1_1_cnt
1093                     ; 466       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
1095  00a9 b606          	ld	a,_btn1_0_cnt
1096  00ab a11e          	cp	a,#30
1097  00ad 2518          	jrult	L704
1098                     ; 468         BTN1_DEB_STATE = BTN_PRESSED;
1100  00af 35010008      	mov	_BTN1_DEB_STATE,#1
1101  00b3 2012          	jra	L704
1102  00b5               L104:
1103                     ; 473       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
1105  00b5 b607          	ld	a,_btn1_1_cnt
1106  00b7 a1ff          	cp	a,#255
1107  00b9 2402          	jruge	L114
1110  00bb 3c07          	inc	_btn1_1_cnt
1111  00bd               L114:
1112                     ; 474       btn1_0_cnt = 0;
1114  00bd 3f06          	clr	_btn1_0_cnt
1115                     ; 475       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
1117  00bf b607          	ld	a,_btn1_1_cnt
1118  00c1 a11e          	cp	a,#30
1119  00c3 2502          	jrult	L704
1120                     ; 477         BTN1_DEB_STATE = BTN_DEPRESSED;
1122  00c5 3f08          	clr	_BTN1_DEB_STATE
1123  00c7               L704:
1124                     ; 483     if(BTN1_DEB_STATE == BTN_PRESSED)
1126  00c7 b608          	ld	a,_BTN1_DEB_STATE
1127  00c9 4a            	dec	a
1128  00ca 260a          	jrne	L514
1129                     ; 485       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
1131  00cc be0a          	ldw	x,_BTN1_press_timer
1132  00ce a3ffff        	cpw	x,#65535
1133  00d1 2403          	jruge	L514
1136  00d3 5c            	incw	x
1137  00d4 bf0a          	ldw	_BTN1_press_timer,x
1138  00d6               L514:
1139                     ; 488     if(!BTN1_DELAY_FLAG)
1141  00d6 720000030e    	btjt	_BTN1_DELAY_FLAG,L124
1142                     ; 490       btn1_delay_cnt++;
1144  00db 3c09          	inc	_btn1_delay_cnt
1145                     ; 491       if(btn1_delay_cnt == BTN_DELAY)
1147  00dd b609          	ld	a,_btn1_delay_cnt
1148  00df a196          	cp	a,#150
1149  00e1 2606          	jrne	L124
1150                     ; 493         btn1_delay_cnt = 0;
1152  00e3 3f09          	clr	_btn1_delay_cnt
1153                     ; 494         BTN1_DELAY_FLAG = TRUE;
1155  00e5 72100003      	bset	_BTN1_DELAY_FLAG
1156  00e9               L124:
1157                     ; 500     if(flag_blink_redLED)
1159  00e9 7201000550    	btjf	_flag_blink_redLED,L524
1160                     ; 502       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
1162  00ee be0d          	ldw	x,_cnt_state_redLED
1163  00f0 a3ffff        	cpw	x,#65535
1164  00f3 2403          	jruge	L724
1167  00f5 5c            	incw	x
1168  00f6 bf0d          	ldw	_cnt_state_redLED,x
1169  00f8               L724:
1170                     ; 503       if(flag_blink_on_off)
1172  00f8 7201000412    	btjf	_flag_blink_on_off,L134
1173                     ; 505         if(cnt_state_redLED >= LEDBLINK_ONTIME)
1175  00fd a30032        	cpw	x,#50
1176  0100 253c          	jrult	L524
1177                     ; 507           flag_blink_on_off = FALSE;
1179  0102 72110004      	bres	_flag_blink_on_off
1180                     ; 508           cnt_state_redLED = 0;
1182  0106 5f            	clrw	x
1183  0107 bf0d          	ldw	_cnt_state_redLED,x
1184                     ; 509           LED_OFF;
1186  0109 7217500a      	bres	20490,#3
1189  010d 202b          	jpf	LC001
1190  010f               L134:
1191                     ; 514         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
1193  010f a300c8        	cpw	x,#200
1194  0112 252a          	jrult	L524
1195                     ; 516           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
1197  0114 b611          	ld	a,_cnt_blink_redLED
1198  0116 a1ff          	cp	a,#255
1199  0118 2402          	jruge	L144
1202  011a 3c11          	inc	_cnt_blink_redLED
1203  011c               L144:
1204                     ; 517           flag_blink_on_off = TRUE;
1206  011c 72100004      	bset	_flag_blink_on_off
1207                     ; 518           cnt_state_redLED = 0;
1209  0120 5f            	clrw	x
1210  0121 bf0d          	ldw	_cnt_state_redLED,x
1211                     ; 519           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
1213  0123 b611          	ld	a,_cnt_blink_redLED
1214  0125 b113          	cp	a,_blink_redLED_times
1215  0127 250d          	jrult	L344
1217  0129 7200000708    	btjt	_flag_blink_unlimited,L344
1218                     ; 521             flag_blink_redLED = FALSE;
1220  012e 72110005      	bres	_flag_blink_redLED
1221                     ; 522             cnt_blink_redLED = 0;
1223  0132 3f11          	clr	_cnt_blink_redLED
1225  0134 2008          	jra	L524
1226  0136               L344:
1227                     ; 526             LED_RED_ON;
1229  0136 7216500a      	bset	20490,#3
1232  013a               LC001:
1234  013a 7219500a      	bres	20490,#4
1236  013e               L524:
1237                     ; 531     if(flag_blink_greenLED)
1239  013e 7201000654    	btjf	_flag_blink_greenLED,L744
1240                     ; 533       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
1242  0143 be0f          	ldw	x,_cnt_state_greenLED
1243  0145 a3ffff        	cpw	x,#65535
1244  0148 2403          	jruge	L154
1247  014a 5c            	incw	x
1248  014b bf0f          	ldw	_cnt_state_greenLED,x
1249  014d               L154:
1250                     ; 534       if(flag_blink_on_off)
1252  014d 7201000416    	btjf	_flag_blink_on_off,L354
1253                     ; 536         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
1255  0152 a30032        	cpw	x,#50
1256  0155 2540          	jrult	L744
1257                     ; 538           flag_blink_on_off = FALSE;
1259  0157 72110004      	bres	_flag_blink_on_off
1260                     ; 539           cnt_state_greenLED = 0;
1262  015b 5f            	clrw	x
1263  015c bf0f          	ldw	_cnt_state_greenLED,x
1264                     ; 540           LED_OFF;
1266  015e 7217500a      	bres	20490,#3
1269  0162 7219500a      	bres	20490,#4
1271  0166 202f          	jra	L744
1272  0168               L354:
1273                     ; 545         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
1275  0168 a300c8        	cpw	x,#200
1276  016b 252a          	jrult	L744
1277                     ; 547           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
1279  016d b612          	ld	a,_cnt_blink_greenLED
1280  016f a1ff          	cp	a,#255
1281  0171 2402          	jruge	L364
1284  0173 3c12          	inc	_cnt_blink_greenLED
1285  0175               L364:
1286                     ; 548           flag_blink_on_off = TRUE;
1288  0175 72100004      	bset	_flag_blink_on_off
1289                     ; 549           cnt_state_greenLED = 0;
1291  0179 5f            	clrw	x
1292  017a bf0f          	ldw	_cnt_state_greenLED,x
1293                     ; 550           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
1295  017c b612          	ld	a,_cnt_blink_greenLED
1296  017e b114          	cp	a,_blink_greenLED_times
1297  0180 250d          	jrult	L564
1299  0182 7200000708    	btjt	_flag_blink_unlimited,L564
1300                     ; 552             flag_blink_greenLED = FALSE;
1302  0187 72110006      	bres	_flag_blink_greenLED
1303                     ; 553             cnt_blink_greenLED = 0;
1305  018b 3f12          	clr	_cnt_blink_greenLED
1307  018d 2008          	jra	L744
1308  018f               L564:
1309                     ; 557             LED_GREEN_ON;
1311  018f 7217500a      	bres	20490,#3
1314  0193 7218500a      	bset	20490,#4
1316  0197               L744:
1317                     ; 563     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
1319  0197 a601          	ld	a,#1
1320  0199 cd0000        	call	_TIM2_ClearITPendingBit
1322  019c               L743:
1323                     ; 565   interrupt_status = 0;
1325  019c 3f3d          	clr	L3_interrupt_status
1326                     ; 566 }
1329  019e 85            	popw	x
1330  019f bf00          	ldw	c_y,x
1331  01a1 320002        	pop	c_y+2
1332  01a4 85            	popw	x
1333  01a5 bf00          	ldw	c_x,x
1334  01a7 320002        	pop	c_x+2
1335  01aa 80            	iret	
1358                     ; 573 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1358                     ; 574 {
1359                     .text:	section	.text,new
1360  0000               f_TIM2_CAP_IRQHandler:
1364                     ; 578 }
1367  0000 80            	iret	
1390                     ; 585 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1390                     ; 586 {
1391                     .text:	section	.text,new
1392  0000               f_TIM4_UPD_OVF_IRQHandler:
1396                     ; 590 }
1399  0000 80            	iret	
1421                     ; 597 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1421                     ; 598 {
1422                     .text:	section	.text,new
1423  0000               f_SPI_IRQHandler:
1427                     ; 602 }
1430  0000 80            	iret	
1453                     ; 608 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1453                     ; 609 {
1454                     .text:	section	.text,new
1455  0000               f_USART_TX_IRQHandler:
1459                     ; 613 }
1462  0000 80            	iret	
1485                     ; 620 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1485                     ; 621 {
1486                     .text:	section	.text,new
1487  0000               f_USART_RX_IRQHandler:
1491                     ; 625 }
1494  0000 80            	iret	
1516                     ; 633 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1516                     ; 634 {
1517                     .text:	section	.text,new
1518  0000               f_I2C_IRQHandler:
1522                     ; 638 }
1525  0000 80            	iret	
1972                     	xdef	_FLAG_UART_cmd_rcv
1973                     	switch	.ubsct
1974  0000               L52_temp2:
1975  0000 000000000000  	ds.b	60
1976  003c               L5_RFrcvChksum:
1977  003c 00            	ds.b	1
1978                     	xdef	_cnt_blink_greenLED
1979                     	xdef	_cnt_blink_redLED
1980                     	xdef	_debug
1981  003d               L3_interrupt_status:
1982  003d 00            	ds.b	1
1983                     	xref.b	_Timeout_tout3
1984                     	xref.b	_Timeout_tout2
1985                     	xref.b	_Timeout_tout1
1986                     	xref.b	_Timeout_toutcnt3
1987                     	xref.b	_Timeout_toutcnt2
1988                     	xref.b	_Timeout_toutcnt1
1989                     	xbit	_Timeout_istout3
1990                     	xbit	_Timeout_istout2
1991                     	xbit	_Timeout_istout1
1992                     	xdef	_btn1_delay_cnt
1993                     	xdef	_btn1_1_cnt
1994                     	xdef	_btn1_0_cnt
1995                     	xdef	_cnt_flag_1000ms
1996                     	xdef	_cnt_flag_500ms
1997                     	xdef	_cnt_flag_250ms
1998                     	xdef	f_I2C_IRQHandler
1999                     	xdef	f_USART_RX_IRQHandler
2000                     	xdef	f_USART_TX_IRQHandler
2001                     	xdef	f_SPI_IRQHandler
2002                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2003                     	xdef	f_TIM3_CAP_IRQHandler
2004                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
2005                     	xdef	f_TIM2_CAP_IRQHandler
2006                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
2007                     	xdef	f_COMP_IRQHandler
2008                     	xdef	f_EXTI7_IRQHandler
2009                     	xdef	f_EXTI6_IRQHandler
2010                     	xdef	f_EXTI5_IRQHandler
2011                     	xdef	f_EXTI4_IRQHandler
2012                     	xdef	f_EXTI3_IRQHandler
2013                     	xdef	f_EXTI2_IRQHandler
2014                     	xdef	f_EXTI1_IRQHandler
2015                     	xdef	f_EXTI0_IRQHandler
2016                     	xdef	f_EXTID_IRQHandler
2017                     	xdef	f_EXTIB_IRQHandler
2018                     	xdef	f_AWU_IRQHandler
2019                     	xdef	f_FLASH_IRQHandler
2020                     	xdef	f_TRAP_IRQHandler
2021                     	xdef	f_NonHandledInterrupt
2022                     	xdef	_RFbytesReady
2023  003e               _RcvRFmsg:
2024  003e 0000000000    	ds.b	5
2025                     	xdef	_RcvRFmsg
2026                     	xdef	_flag_blink_unlimited
2027                     	xdef	_flag_blink_greenLED
2028                     	xdef	_flag_blink_redLED
2029                     	xdef	_flag_blink_on_off
2030                     	xdef	_cnt_state_greenLED
2031                     	xdef	_cnt_state_redLED
2032                     	xdef	_blink_greenLED_times
2033                     	xdef	_blink_redLED_times
2034                     	xdef	_FLAG_1000ms
2035                     	xdef	_FLAG_500ms
2036                     	xdef	_FLAG_250ms
2037                     	xdef	_BTN1_press_timer
2038                     	xdef	_BTN1_DELAY_FLAG
2039                     	xdef	_BTN1_DEB_STATE
2040                     	xref	_TIM3_GetITStatus
2041                     	xref	_TIM3_GetCapture1
2042                     	xref	_TIM2_ClearITPendingBit
2043                     	xref	_TIM2_GetITStatus
2044                     	xref.b	c_x
2045                     	xref.b	c_y
2065                     	end
