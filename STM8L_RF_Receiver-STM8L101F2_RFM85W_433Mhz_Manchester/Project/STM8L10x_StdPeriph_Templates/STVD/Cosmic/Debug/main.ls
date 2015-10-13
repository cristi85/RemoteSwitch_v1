   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               L3_LightState:
  23  0000 00            	dc.b	0
  24                     .bit:	section	.data,bit
  25  0000               L11_LrnModeActive:
  26  0000 00            	dc.b	0
  27  0001               L31_FLAG_BTN1_lock:
  28  0001 00            	dc.b	0
  29  0002               L51_FLAG_reset_LEDblink_error:
  30  0002 00            	dc.b	0
  31  0003               L71_FLAG_check_nrf_reg:
  32  0003 00            	dc.b	0
  33                     	bsct
  34  0001               L12_error_nrf24_reg_cnt:
  35  0001 00            	dc.b	0
  36  0002               L32_state:
  37  0002 00            	dc.b	0
  38  0003               L52_program_status:
  39  0003 00            	dc.b	0
  40  0004               L72_interrupt_status:
  41  0004 00            	dc.b	0
  42  0005               L33_debug_reg_idx:
  43  0005 00            	dc.b	0
  44  0006               L53_task_1000ms_cnt:
  45  0006 00            	dc.b	0
  46  0007               L73_init_delay:
  47  0007 ffff          	dc.w	-1
 114                     ; 119 void main(void)
 114                     ; 120 {
 116                     .text:	section	.text,new
 117  0000               _main:
 121                     ; 121   flash_erase_timing_test = 0;
 123  0000 3f14          	clr	L14_flash_erase_timing_test
 124                     ; 122   program_status = 1;
 126  0002 35010003      	mov	L52_program_status,#1
 127                     ; 123   disableInterrupts();
 130  0006 9b            	sim	
 132                     ; 124   Config();
 135  0007 cd0000        	call	_Config
 137                     ; 125   program_status = 2;
 139  000a 35020003      	mov	L52_program_status,#2
 140                     ; 126   Errors_Init();
 142  000e cd0000        	call	_Errors_Init
 144                     ; 127   RTMS_INIT(runtime_it_1ms);
 146  0011 aeffff        	ldw	x,#65535
 147  0014 bf0a          	ldw	_runtime_it_1ms,x
 150  0016 5f            	clrw	x
 151  0017 bf0c          	ldw	_runtime_it_1ms+2,x
 154  0019 bf0e          	ldw	_runtime_it_1ms+4,x
 157  001b bf12          	ldw	_runtime_it_1ms+8,x
 160  001d bf10          	ldw	_runtime_it_1ms+6,x
 161                     ; 128   RTMS_INIT(runtime_it_RFrcv);
 164  001f 5a            	decw	x
 165  0020 bf00          	ldw	_runtime_it_RFrcv,x
 168  0022 5f            	clrw	x
 169  0023 bf02          	ldw	_runtime_it_RFrcv+2,x
 172  0025 bf04          	ldw	_runtime_it_RFrcv+4,x
 175  0027 bf08          	ldw	_runtime_it_RFrcv+8,x
 178  0029 bf06          	ldw	_runtime_it_RFrcv+6,x
 179                     ; 129   enableInterrupts();
 183  002b 9a            	rim	
 185                     ; 130   LED_GREEN_ON;
 188  002c 7217500a      	bres	20490,#3
 191  0030 7218500a      	bset	20490,#4
 192                     ; 132   Timeout_SetTimeout2(200);
 195  0034 ae00c8        	ldw	x,#200
 196  0037 cd0000        	call	_Timeout_SetTimeout2
 199  003a               L501:
 200                     ; 133   while(!Timeout_IsTimeout2());
 202  003a cd0000        	call	_Timeout_IsTimeout2
 204  003d 4d            	tnz	a
 205  003e 27fa          	jreq	L501
 206                     ; 134   LED_OFF;
 208  0040 7217500a      	bres	20490,#3
 211  0044 7219500a      	bres	20490,#4
 212                     ; 135   program_status = 3;
 215  0048 35030003      	mov	L52_program_status,#3
 216                     ; 136   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 218  004c a602          	ld	a,#2
 219  004e cd0000        	call	_RST_GetFlagStatus
 221  0051 4d            	tnz	a
 222  0052 2706          	jreq	L111
 223                     ; 138     BLINK_REDLED(1);
 225  0054 35010000      	mov	_blink_redLED_times,#1
 235  0058 200c          	jp	LC001
 236  005a               L111:
 237                     ; 140   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 239  005a a604          	ld	a,#4
 240  005c cd0000        	call	_RST_GetFlagStatus
 242  005f 4d            	tnz	a
 243  0060 270b          	jreq	L311
 244                     ; 142     BLINK_REDLED(2);
 246  0062 35020000      	mov	_blink_redLED_times,#2
 260  0066               LC001:
 262  0066 72110000      	bres	_flag_blink_unlimited
 265  006a cd01aa        	call	LC005
 267  006d               L311:
 268                     ; 144   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 270  006d a60f          	ld	a,#15
 271  006f cd0000        	call	_RST_ClearFlag
 274  0072               L121:
 275                     ; 145   while(ISBLINKING_REDLED);
 277  0072 72000000fb    	btjt	_flag_blink_redLED,L121
 278                     ; 146   program_status = 4;
 280  0077 35040003      	mov	L52_program_status,#4
 281                     ; 147   HBRIDGE_OFF;
 283  007b cd0194        	call	LC004
 285                     ; 150   IWDG_Enable();
 287  007e cd0000        	call	_IWDG_Enable
 289                     ; 151   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 291  0081 a655          	ld	a,#85
 292  0083 cd0000        	call	_IWDG_WriteAccessCmd
 294                     ; 152   IWDG_SetPrescaler(IWDG_Prescaler_64);  /* 431.15ms for RL[7:0]= 0xFF */
 296  0086 a604          	ld	a,#4
 297  0088 cd0000        	call	_IWDG_SetPrescaler
 299                     ; 153   IWDG_SetReload(0xFF);
 301  008b a6ff          	ld	a,#255
 302  008d cd0000        	call	_IWDG_SetReload
 304                     ; 154   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 306  0090 4f            	clr	a
 307  0091 cd0000        	call	_IWDG_WriteAccessCmd
 309                     ; 155   IWDG_ReloadCounter();
 311  0094 cd0000        	call	_IWDG_ReloadCounter
 313                     ; 156   program_status = 5;
 315  0097 35050003      	mov	L52_program_status,#5
 316  009b               L521:
 317                     ; 159     switch(state)
 319  009b b602          	ld	a,L32_state
 321                     ; 250       default: break;
 322  009d 2603cc0159    	jreq	LC003
 323  00a2 4a            	dec	a
 324  00a3 2713          	jreq	L54
 325  00a5 a002          	sub	a,#2
 326  00a7 2758          	jreq	L74
 327  00a9 4a            	dec	a
 328  00aa 2603cc0139    	jreq	L75
 329  00af 4a            	dec	a
 330  00b0 2603cc0145    	jreq	L16
 331  00b5 cc015d        	jra	L331
 332                     ; 163         state = ST_WAIT_INPUT_OR_FLAG;
 333                     ; 164         break;
 335  00b8               L54:
 336                     ; 168         if(RFbytesReady)
 338  00b8 3d00          	tnz	_RFbytesReady
 339  00ba 271c          	jreq	L531
 340                     ; 170           RFbytesReady = FALSE;
 342  00bc b700          	ld	_RFbytesReady,a
 343                     ; 171           if(LrnModeActive)
 345  00be 7201000005    	btjf	L11_LrnModeActive,L731
 346                     ; 173             LearnNewID();
 348  00c3 cd0000        	call	_LearnNewID
 350                     ; 174             state = ST_WAIT_INPUT_OR_FLAG;
 352  00c6 200c          	jp	L341
 353  00c8               L731:
 354                     ; 178             if(IsLearnedID())
 356  00c8 cd0000        	call	_IsLearnedID
 358  00cb 4d            	tnz	a
 359  00cc 2706          	jreq	L341
 360                     ; 180               state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 362  00ce 35040002      	mov	L32_state,#4
 364  00d2 2004          	jra	L531
 365  00d4               L341:
 366                     ; 184               state = ST_WAIT_INPUT_OR_FLAG;
 369  00d4 35010002      	mov	L32_state,#1
 370  00d8               L531:
 371                     ; 188         if(FLAG_1000ms)
 373  00d8 7201000004    	btjf	_FLAG_1000ms,L741
 374                     ; 190           FLAG_1000ms = FALSE;
 376  00dd 72110000      	bres	_FLAG_1000ms
 377  00e1               L741:
 378                     ; 193         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 380  00e1 b600          	ld	a,_BTN1_DEB_STATE
 381  00e3 4a            	dec	a
 382  00e4 2609          	jrne	L151
 384  00e6 7200000104    	btjt	L31_FLAG_BTN1_lock,L151
 385                     ; 195           FLAG_BTN1_lock = TRUE;
 387  00eb 72100001      	bset	L31_FLAG_BTN1_lock
 388  00ef               L151:
 389                     ; 197         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 391  00ef b600          	ld	a,_BTN1_DEB_STATE
 392  00f1 266a          	jrne	L331
 394  00f3 7201000165    	btjf	L31_FLAG_BTN1_lock,L331
 395                     ; 199           FLAG_BTN1_lock = FALSE;
 397  00f8 72110001      	bres	L31_FLAG_BTN1_lock
 398                     ; 200           BTN1_Released();
 400  00fc cd0000        	call	_BTN1_Released
 402  00ff 205c          	jra	L331
 403  0101               L74:
 404                     ; 208         LED_GREEN_ON;
 406  0101 7217500a      	bres	20490,#3
 409  0105 7218500a      	bset	20490,#4
 410                     ; 209         switch(RcvRFmsg.RFmsgmember.RFcmd)
 413  0109 b603          	ld	a,_RcvRFmsg+3
 415                     ; 223           default: break;
 416  010b a00f          	sub	a,#15
 417  010d 2706          	jreq	L15
 418  010f a0e1          	sub	a,#225
 419  0111 2710          	jreq	L35
 420  0113 2018          	jra	L751
 421  0115               L15:
 422                     ; 213             LIGHT_ON;
 424  0115 72155005      	bres	20485,#2
 427  0119 72105005      	bset	20485,#0
 428                     ; 214             LightState = LIGHTSTATE_ON;
 431  011d 35010000      	mov	L3_LightState,#1
 432                     ; 215             break;
 434  0121 200a          	jra	L751
 435  0123               L35:
 436                     ; 219             LIGHT_OFF;
 438  0123 7211500f      	bres	20495,#0
 441  0127 7214500a      	bset	20490,#2
 442                     ; 220             LightState = LIGHTSTATE_OFF;
 445  012b b700          	ld	L3_LightState,a
 446                     ; 221             break;
 448                     ; 223           default: break;
 450  012d               L751:
 451                     ; 226         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 453  012d ae0064        	ldw	x,#100
 454  0130 cd0000        	call	_Timeout_SetTimeout1
 456                     ; 227         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 458  0133 35050002      	mov	L32_state,#5
 459                     ; 228         break;
 461  0137 2024          	jra	L331
 462  0139               L75:
 463                     ; 232         if(Timeout_IsTimeout1())
 465  0139 cd0000        	call	_Timeout_IsTimeout1
 467  013c 4d            	tnz	a
 468  013d 271e          	jreq	L331
 469                     ; 234           state = ST_SWITCH_LIGHT;
 471  013f 35030002      	mov	L32_state,#3
 472  0143 2018          	jra	L331
 473  0145               L16:
 474                     ; 240         if(Timeout_IsTimeout1())
 476  0145 cd0000        	call	_Timeout_IsTimeout1
 478  0148 4d            	tnz	a
 479  0149 2712          	jreq	L331
 480                     ; 242           HBRIDGE_OFF;
 482  014b ad47          	call	LC004
 484                     ; 245           BLINKSTOP_GREENLED;
 486  014d 72110000      	bres	_flag_blink_greenLED
 489  0151 7217500a      	bres	20490,#3
 492  0155 7219500a      	bres	20490,#4
 493                     ; 246           state = ST_WAIT_INPUT_OR_FLAG;
 497  0159               LC003:
 499  0159 35010002      	mov	L32_state,#1
 500                     ; 250       default: break;
 502  015d               L331:
 503                     ; 252     IWDG_ReloadCounter();
 505  015d cd0000        	call	_IWDG_ReloadCounter
 507                     ; 253     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 509  0160 cd0000        	call	_Errors_IsError
 511  0163 4d            	tnz	a
 512  0164 2716          	jreq	L561
 514  0166 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L561
 515                     ; 255       BLINK_REDLED(255);
 517  016b 35ff0000      	mov	_blink_redLED_times,#255
 520  016f 72100000      	bset	_flag_blink_unlimited
 525  0173 ad35          	call	LC005
 526                     ; 256       FLAG_reset_LEDblink_error = TRUE;
 529  0175 72100002      	bset	L51_FLAG_reset_LEDblink_error
 531  0179 cc009b        	jra	L521
 532  017c               L561:
 533                     ; 260       if(FLAG_reset_LEDblink_error)
 535  017c 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L521
 536                     ; 262         BLINKSTOP_REDLED;
 538  0181 72110000      	bres	_flag_blink_redLED
 541  0185 7217500a      	bres	20490,#3
 544  0189 7219500a      	bres	20490,#4
 545                     ; 263         FLAG_reset_LEDblink_error = FALSE;
 549  018d 72110002      	bres	L51_FLAG_reset_LEDblink_error
 550  0191 cc009b        	jra	L521
 551  0194               LC004:
 552  0194 7210500f      	bset	20495,#0
 553                     ; 147   HBRIDGE_OFF;
 555  0198 72145005      	bset	20485,#2
 558  019c 72115005      	bres	20485,#0
 561  01a0 7215500a      	bres	20490,#2
 562                     ; 148   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 565  01a4 ae03e8        	ldw	x,#1000
 566  01a7 cc0000        	jp	_Timeout_SetTimeout1
 567  01aa               LC005:
 568  01aa 5f            	clrw	x
 569  01ab 72100000      	bset	_flag_blink_on_off
 570  01af bf00          	ldw	_cnt_state_redLED,x
 572  01b1 7216500a      	bset	20490,#3
 574  01b5 7219500a      	bres	20490,#4
 576  01b9 72100000      	bset	_flag_blink_redLED
 577  01bd 81            	ret	
 624                     ; 269 _Bool IsLearnedID()
 624                     ; 270 {
 625                     .text:	section	.text,new
 626  0000               _IsLearnedID:
 628  0000 89            	pushw	x
 629       00000002      OFST:	set	2
 632                     ; 272   _Bool flag_IDfound = FALSE;
 634  0001 0f01          	clr	(OFST-1,sp)
 635                     ; 273   for(i = 0; i < Receivers.NumLrndRcv; i++)
 637  0003 0f02          	clr	(OFST+0,sp)
 639  0005 2019          	jra	L122
 640  0007               L512:
 641                     ; 275     if(RcvRFmsg.RFmsgmember.RFNodeId == Receivers.ID[i])
 643  0007 7b02          	ld	a,(OFST+0,sp)
 644  0009 5f            	clrw	x
 645  000a 97            	ld	xl,a
 646  000b d60000        	ld	a,(L5_Receivers,x)
 647  000e b102          	cp	a,_RcvRFmsg+2
 648  0010 260c          	jrne	L522
 649                     ; 277       flag_IDfound = TRUE;
 651  0012 a601          	ld	a,#1
 652  0014 6b01          	ld	(OFST-1,sp),a
 653                     ; 278       break;
 654  0016               L322:
 655                     ; 281   return flag_IDfound;
 657  0016 7b01          	ld	a,(OFST-1,sp)
 658  0018 2702          	jreq	L66
 659  001a a601          	ld	a,#1
 660  001c               L66:
 663  001c 85            	popw	x
 664  001d 81            	ret	
 665  001e               L522:
 666                     ; 273   for(i = 0; i < Receivers.NumLrndRcv; i++)
 668  001e 0c02          	inc	(OFST+0,sp)
 669  0020               L122:
 672  0020 c6000a        	ld	a,L5_Receivers+10
 673  0023 1102          	cp	a,(OFST+0,sp)
 674  0025 22e0          	jrugt	L512
 675  0027 20ed          	jra	L322
 727                     ; 284 void LearnNewID()
 727                     ; 285 {
 728                     .text:	section	.text,new
 729  0000               _LearnNewID:
 731  0000 89            	pushw	x
 732       00000002      OFST:	set	2
 735                     ; 288   _Bool flag_IDfound = FALSE;
 737  0001 0f01          	clr	(OFST-1,sp)
 738                     ; 289   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 740  0003 0f02          	clr	(OFST+0,sp)
 742  0005 204b          	jra	L552
 743  0007               L152:
 744                     ; 291     if( RcvRFmsg.RFmsgmember.RFNodeId == (*(u8*)(&(Receivers.ID[i]))) )
 746  0007 5f            	clrw	x
 747  0008 97            	ld	xl,a
 748  0009 d60000        	ld	a,(L5_Receivers,x)
 749  000c b102          	cp	a,_RcvRFmsg+2
 750  000e 2640          	jrne	L162
 751                     ; 293       flag_IDfound = TRUE;
 753  0010 a601          	ld	a,#1
 754  0012 6b01          	ld	(OFST-1,sp),a
 755                     ; 294       break;
 756  0014               L752:
 757                     ; 297   if(!flag_IDfound)
 759  0014 7b01          	ld	a,(OFST-1,sp)
 760  0016 2643          	jrne	L362
 761                     ; 300     FLASH_Unlock(FLASH_MemType_Program);
 763  0018 a6fd          	ld	a,#253
 764  001a cd0000        	call	_FLASH_Unlock
 766                     ; 301     FLASH_ProgramByte( (u16)(u8*)(&Receivers.ID[Receivers.NumLrndRcv]), (u8)RcvRFmsg.RFmsgmember.RFNodeId );
 768  001d 3b0002        	push	_RcvRFmsg+2
 769  0020 c6000a        	ld	a,L5_Receivers+10
 770  0023 5f            	clrw	x
 771  0024 97            	ld	xl,a
 772  0025 1c0000        	addw	x,#L5_Receivers
 773  0028 cd0000        	call	_FLASH_ProgramByte
 775  002b 84            	pop	a
 776                     ; 302     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), Receivers.NumLrndRcv + 1);
 778  002c c6000a        	ld	a,L5_Receivers+10
 779  002f 4c            	inc	a
 780  0030 88            	push	a
 781  0031 ae000a        	ldw	x,#L5_Receivers+10
 782  0034 cd0000        	call	_FLASH_ProgramByte
 784  0037 84            	pop	a
 785                     ; 303     FLASH_Lock(FLASH_MemType_Program);
 787  0038 a6fd          	ld	a,#253
 788  003a cd0000        	call	_FLASH_Lock
 790                     ; 305     if( RcvRFmsg.RFmsgmember.RFNodeId != (*(u8*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 792  003d c6000a        	ld	a,L5_Receivers+10
 793  0040 5f            	clrw	x
 794  0041 97            	ld	xl,a
 795  0042 5a            	decw	x
 796  0043 d60000        	ld	a,(L5_Receivers,x)
 797  0046 b102          	cp	a,_RcvRFmsg+2
 798  0048 2711          	jreq	L362
 799                     ; 307       Errors_SetError(ERROR_FLASH_WRITE);
 801  004a 4f            	clr	a
 802  004b cd0000        	call	_Errors_SetError
 804  004e 200b          	jra	L362
 805  0050               L162:
 806                     ; 289   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 808  0050 0c02          	inc	(OFST+0,sp)
 809  0052               L552:
 812  0052 7b02          	ld	a,(OFST+0,sp)
 813  0054 c1000a        	cp	a,L5_Receivers+10
 814  0057 25ae          	jrult	L152
 815  0059 20b9          	jra	L752
 816  005b               L362:
 817                     ; 310   LrnModeActive = FALSE;
 819  005b 72110000      	bres	L11_LrnModeActive
 820                     ; 311   BLINKSTOP_GREENLED;
 822  005f 72110000      	bres	_flag_blink_greenLED
 825  0063 7217500a      	bres	20490,#3
 828  0067 7219500a      	bres	20490,#4
 829                     ; 312 }
 834  006b 85            	popw	x
 835  006c 81            	ret	
 896                     ; 314 void BTN1_Released()
 896                     ; 315 {
 897                     .text:	section	.text,new
 898  0000               _BTN1_Released:
 900  0000 5203          	subw	sp,#3
 901       00000003      OFST:	set	3
 904                     ; 316   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 906  0002 be00          	ldw	x,_BTN1_press_timer
 907  0004 a30bb8        	cpw	x,#3000
 908  0007 2455          	jruge	L113
 909                     ; 319     if(!LrnModeActive)
 911  0009 7200000046    	btjt	L11_LrnModeActive,L313
 912                     ; 321       if(Receivers.NumLrndRcv < MAX_NUM_RECEIVERS)
 914  000e c6000a        	ld	a,L5_Receivers+10
 915  0011 a10a          	cp	a,#10
 916  0013 2422          	jruge	L513
 917                     ; 323         LrnModeActive = TRUE;
 919  0015 72100000      	bset	L11_LrnModeActive
 920                     ; 324         BLINK_GREENLED(255);
 922  0019 35ff0000      	mov	_blink_greenLED_times,#255
 925  001d 72100000      	bset	_flag_blink_unlimited
 930  0021 5f            	clrw	x
 931  0022 72100000      	bset	_flag_blink_on_off
 932  0026 bf00          	ldw	_cnt_state_greenLED,x
 935  0028 7217500a      	bres	20490,#3
 938  002c 7218500a      	bset	20490,#4
 942  0030 72100000      	bset	_flag_blink_greenLED
 945  0034 cc00c0        	jra	L323
 946  0037               L513:
 947                     ; 328         BLINK_REDLED(2);
 949  0037 35020000      	mov	_blink_redLED_times,#2
 952  003b 72110000      	bres	_flag_blink_unlimited
 957  003f 5f            	clrw	x
 958  0040 72100000      	bset	_flag_blink_on_off
 959  0044 bf00          	ldw	_cnt_state_redLED,x
 962  0046 7216500a      	bset	20490,#3
 965  004a 7219500a      	bres	20490,#4
 969  004e 72100000      	bset	_flag_blink_redLED
 971  0052 206c          	jra	L323
 972  0054               L313:
 973                     ; 333       LrnModeActive = FALSE;
 975  0054 72110000      	bres	L11_LrnModeActive
 976                     ; 334       BLINKSTOP_GREENLED;
 978  0058 72110000      	bres	_flag_blink_greenLED
 983  005c 205a          	jp	LC006
 984  005e               L113:
 985                     ; 342     LED_RED_ON;
 987  005e 7216500a      	bset	20490,#3
 990  0062 7219500a      	bres	20490,#4
 991                     ; 343     flash_erase_timing_test = 1;
 994  0066 35010014      	mov	L14_flash_erase_timing_test,#1
 995                     ; 344     FLASH_Unlock(FLASH_MemType_Program);
 997  006a a6fd          	ld	a,#253
 998  006c cd0000        	call	_FLASH_Unlock
1000                     ; 345     adr = (u8*)&Receivers;
1002  006f ae0000        	ldw	x,#L5_Receivers
1003  0072 1f01          	ldw	(OFST-2,sp),x
1004                     ; 346     for(i = 0; i < sizeof(Receivers); i++)
1006  0074 0f03          	clr	(OFST+0,sp)
1007  0076               L523:
1008                     ; 348       FLASH_EraseByte((u16)(adr++));
1010  0076 1e01          	ldw	x,(OFST-2,sp)
1011  0078 5c            	incw	x
1012  0079 1f01          	ldw	(OFST-2,sp),x
1013  007b 5a            	decw	x
1014  007c cd0000        	call	_FLASH_EraseByte
1016                     ; 346     for(i = 0; i < sizeof(Receivers); i++)
1018  007f 0c03          	inc	(OFST+0,sp)
1021  0081 7b03          	ld	a,(OFST+0,sp)
1022  0083 a10b          	cp	a,#11
1023  0085 25ef          	jrult	L523
1024                     ; 350     FLASH_Lock(FLASH_MemType_Program);
1026  0087 a6fd          	ld	a,#253
1027  0089 cd0000        	call	_FLASH_Lock
1029                     ; 351     flash_erase_timing_test = 2;
1031  008c 35020014      	mov	L14_flash_erase_timing_test,#2
1032                     ; 353     Errors_ResetError(ERROR_FLASH_ERASE);
1034  0090 a601          	ld	a,#1
1035  0092 cd0000        	call	_Errors_ResetError
1037                     ; 354     adr = (u8*)&Receivers;
1039  0095 ae0000        	ldw	x,#L5_Receivers
1040  0098 1f01          	ldw	(OFST-2,sp),x
1041                     ; 355     for(i = 0; i < sizeof(Receivers); i++)
1043  009a 0f03          	clr	(OFST+0,sp)
1044  009c               L333:
1045                     ; 357       if(*(adr++))
1047  009c 1e01          	ldw	x,(OFST-2,sp)
1048  009e 5c            	incw	x
1049  009f 1f01          	ldw	(OFST-2,sp),x
1050  00a1 5a            	decw	x
1051  00a2 f6            	ld	a,(x)
1052  00a3 2707          	jreq	L143
1053                     ; 359         Errors_SetError(ERROR_FLASH_ERASE);
1055  00a5 a601          	ld	a,#1
1056  00a7 cd0000        	call	_Errors_SetError
1058                     ; 360         break;
1060  00aa 2008          	jra	L733
1061  00ac               L143:
1062                     ; 355     for(i = 0; i < sizeof(Receivers); i++)
1064  00ac 0c03          	inc	(OFST+0,sp)
1067  00ae 7b03          	ld	a,(OFST+0,sp)
1068  00b0 a10b          	cp	a,#11
1069  00b2 25e8          	jrult	L333
1070  00b4               L733:
1071                     ; 363     flash_erase_timing_test = 3;
1073  00b4 35030014      	mov	L14_flash_erase_timing_test,#3
1074                     ; 364     LED_OFF;
1078  00b8               LC006:
1080  00b8 7217500a      	bres	20490,#3
1082  00bc 7219500a      	bres	20490,#4
1083  00c0               L323:
1084                     ; 366   BTN1_press_timer = 0;
1086  00c0 5f            	clrw	x
1087  00c1 bf00          	ldw	_BTN1_press_timer,x
1088                     ; 367 }
1091  00c3 5b03          	addw	sp,#3
1092  00c5 81            	ret	
1116                     ; 369 void TASK_1000ms()
1116                     ; 370 {
1117                     .text:	section	.text,new
1118  0000               _TASK_1000ms:
1122                     ; 371   task_1000ms_cnt++;
1124  0000 3c06          	inc	L53_task_1000ms_cnt
1125                     ; 372 }
1128  0002 81            	ret	
1415                     	xdef	_main
1416                     	switch	.ubsct
1417  0000               _runtime_it_RFrcv:
1418  0000 000000000000  	ds.b	10
1419                     	xdef	_runtime_it_RFrcv
1420  000a               _runtime_it_1ms:
1421  000a 000000000000  	ds.b	10
1422                     	xdef	_runtime_it_1ms
1423                     	xdef	_IsLearnedID
1424                     	xdef	_LearnNewID
1425                     	xdef	_BTN1_Released
1426                     	xdef	_TASK_1000ms
1427  0014               L14_flash_erase_timing_test:
1428  0014 00            	ds.b	1
1429                     .const:	section	.text
1430  0000               L5_Receivers:
1431  0000 000000000000  	ds.b	11
1432                     	xref	_Timeout_IsTimeout2
1433                     	xref	_Timeout_IsTimeout1
1434                     	xref	_Timeout_SetTimeout2
1435                     	xref	_Timeout_SetTimeout1
1436                     	xref.b	_RFbytesReady
1437                     	xref.b	_RcvRFmsg
1438                     	xbit	_flag_blink_unlimited
1439                     	xbit	_flag_blink_greenLED
1440                     	xbit	_flag_blink_redLED
1441                     	xbit	_flag_blink_on_off
1442                     	xref.b	_cnt_state_greenLED
1443                     	xref.b	_cnt_state_redLED
1444                     	xref.b	_blink_greenLED_times
1445                     	xref.b	_blink_redLED_times
1446                     	xbit	_FLAG_1000ms
1447                     	xref.b	_BTN1_press_timer
1448                     	xref.b	_BTN1_DEB_STATE
1449                     	xref	_Errors_IsError
1450                     	xref	_Errors_ResetError
1451                     	xref	_Errors_SetError
1452                     	xref	_Errors_Init
1453                     	xref	_Config
1454                     	xref	_RST_ClearFlag
1455                     	xref	_RST_GetFlagStatus
1456                     	xref	_IWDG_Enable
1457                     	xref	_IWDG_ReloadCounter
1458                     	xref	_IWDG_SetReload
1459                     	xref	_IWDG_SetPrescaler
1460                     	xref	_IWDG_WriteAccessCmd
1461                     	xref	_FLASH_EraseByte
1462                     	xref	_FLASH_ProgramByte
1463                     	xref	_FLASH_Lock
1464                     	xref	_FLASH_Unlock
1484                     	end
