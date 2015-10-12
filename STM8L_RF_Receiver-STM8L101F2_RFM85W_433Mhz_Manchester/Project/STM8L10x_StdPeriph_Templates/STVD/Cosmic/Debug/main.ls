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
 110                     ; 119 void main(void)
 110                     ; 120 {
 112                     .text:	section	.text,new
 113  0000               _main:
 117                     ; 121   flash_erase_timing_test = 0;
 119  0000 3f14          	clr	L14_flash_erase_timing_test
 120                     ; 122   program_status = 1;
 122  0002 35010003      	mov	L52_program_status,#1
 123                     ; 123   disableInterrupts();
 126  0006 9b            	sim	
 128                     ; 124   Config();
 131  0007 cd0000        	call	_Config
 133                     ; 125   program_status = 2;
 135  000a 35020003      	mov	L52_program_status,#2
 136                     ; 126   Errors_Init();
 138  000e cd0000        	call	_Errors_Init
 140                     ; 127   RTMS_INIT(runtime_it_1ms);
 142  0011 aeffff        	ldw	x,#65535
 143  0014 bf0a          	ldw	_runtime_it_1ms,x
 146  0016 5f            	clrw	x
 147  0017 bf0c          	ldw	_runtime_it_1ms+2,x
 150  0019 bf0e          	ldw	_runtime_it_1ms+4,x
 153  001b bf12          	ldw	_runtime_it_1ms+8,x
 156  001d bf10          	ldw	_runtime_it_1ms+6,x
 157                     ; 128   RTMS_INIT(runtime_it_RFrcv);
 160  001f 5a            	decw	x
 161  0020 bf00          	ldw	_runtime_it_RFrcv,x
 164  0022 5f            	clrw	x
 165  0023 bf02          	ldw	_runtime_it_RFrcv+2,x
 168  0025 bf04          	ldw	_runtime_it_RFrcv+4,x
 171  0027 bf08          	ldw	_runtime_it_RFrcv+8,x
 174  0029 bf06          	ldw	_runtime_it_RFrcv+6,x
 175                     ; 129   enableInterrupts();
 179  002b 9a            	rim	
 181                     ; 130   LED_GREEN_ON;
 184  002c 7217500a      	bres	20490,#3
 187  0030 7218500a      	bset	20490,#4
 188                     ; 132   Timeout_SetTimeout2(200);
 191  0034 ae00c8        	ldw	x,#200
 192  0037 cd0000        	call	_Timeout_SetTimeout2
 195  003a               L501:
 196                     ; 133   while(!Timeout_IsTimeout2());
 198  003a cd0000        	call	_Timeout_IsTimeout2
 200  003d 4d            	tnz	a
 201  003e 27fa          	jreq	L501
 202                     ; 134   LED_OFF;
 204  0040 7217500a      	bres	20490,#3
 207  0044 7219500a      	bres	20490,#4
 208                     ; 135   program_status = 3;
 211  0048 35030003      	mov	L52_program_status,#3
 212                     ; 136   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 214  004c a602          	ld	a,#2
 215  004e cd0000        	call	_RST_GetFlagStatus
 217  0051 4d            	tnz	a
 218  0052 2706          	jreq	L111
 219                     ; 138     BLINK_REDLED(1);
 221  0054 35010000      	mov	_blink_redLED_times,#1
 231  0058 200c          	jp	LC001
 232  005a               L111:
 233                     ; 140   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 235  005a a604          	ld	a,#4
 236  005c cd0000        	call	_RST_GetFlagStatus
 238  005f 4d            	tnz	a
 239  0060 270b          	jreq	L311
 240                     ; 142     BLINK_REDLED(2);
 242  0062 35020000      	mov	_blink_redLED_times,#2
 256  0066               LC001:
 258  0066 72110000      	bres	_flag_blink_unlimited
 261  006a cd018b        	call	LC004
 263  006d               L311:
 264                     ; 144   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 266  006d a60f          	ld	a,#15
 267  006f cd0000        	call	_RST_ClearFlag
 270  0072               L121:
 271                     ; 145   while(ISBLINKING_REDLED);
 273  0072 72000000fb    	btjt	_flag_blink_redLED,L121
 274                     ; 146   program_status = 4;
 276  0077 35040003      	mov	L52_program_status,#4
 277                     ; 147   HBRIDGE_OFF;
 279  007b cd0175        	call	LC003
 281                     ; 150   IWDG_Enable();
 283  007e cd0000        	call	_IWDG_Enable
 285                     ; 151   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 287  0081 a655          	ld	a,#85
 288  0083 cd0000        	call	_IWDG_WriteAccessCmd
 290                     ; 152   IWDG_SetPrescaler(IWDG_Prescaler_64);  /* 431.15ms for RL[7:0]= 0xFF */
 292  0086 a604          	ld	a,#4
 293  0088 cd0000        	call	_IWDG_SetPrescaler
 295                     ; 153   IWDG_SetReload(0xFF);
 297  008b a6ff          	ld	a,#255
 298  008d cd0000        	call	_IWDG_SetReload
 300                     ; 154   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 302  0090 4f            	clr	a
 303  0091 cd0000        	call	_IWDG_WriteAccessCmd
 305                     ; 155   IWDG_ReloadCounter();
 307  0094 cd0000        	call	_IWDG_ReloadCounter
 309                     ; 156   program_status = 5;
 311  0097 35050003      	mov	L52_program_status,#5
 312  009b               L521:
 313                     ; 159     switch(state)
 315  009b b602          	ld	a,L32_state
 317                     ; 235       default: break;
 318  009d 2603cc013a    	jreq	LC002
 319  00a2 4a            	dec	a
 320  00a3 270d          	jreq	L54
 321  00a5 a002          	sub	a,#2
 322  00a7 2739          	jreq	L74
 323  00a9 4a            	dec	a
 324  00aa 276e          	jreq	L75
 325  00ac 4a            	dec	a
 326  00ad 2777          	jreq	L16
 327  00af cc013e        	jra	L331
 328                     ; 163         state = ST_WAIT_INPUT_OR_FLAG;
 329                     ; 164         break;
 331  00b2               L54:
 332                     ; 168         if(RFbytesReady)
 334  00b2 3d00          	tnz	_RFbytesReady
 335  00b4 2706          	jreq	L531
 336                     ; 170           RFbytesReady = FALSE;
 338  00b6 b700          	ld	_RFbytesReady,a
 339                     ; 171           state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 341  00b8 35040002      	mov	L32_state,#4
 342  00bc               L531:
 343                     ; 173         if(FLAG_1000ms)
 345  00bc 7201000004    	btjf	_FLAG_1000ms,L731
 346                     ; 175           FLAG_1000ms = FALSE;
 348  00c1 72110000      	bres	_FLAG_1000ms
 349  00c5               L731:
 350                     ; 178         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 352  00c5 b600          	ld	a,_BTN1_DEB_STATE
 353  00c7 4a            	dec	a
 354  00c8 2609          	jrne	L141
 356  00ca 7200000104    	btjt	L31_FLAG_BTN1_lock,L141
 357                     ; 180           FLAG_BTN1_lock = TRUE;
 359  00cf 72100001      	bset	L31_FLAG_BTN1_lock
 360  00d3               L141:
 361                     ; 182         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 363  00d3 b600          	ld	a,_BTN1_DEB_STATE
 364  00d5 2667          	jrne	L331
 366  00d7 7201000162    	btjf	L31_FLAG_BTN1_lock,L331
 367                     ; 184           FLAG_BTN1_lock = FALSE;
 369  00dc 72110001      	bres	L31_FLAG_BTN1_lock
 370  00e0 205c          	jra	L331
 371  00e2               L74:
 372                     ; 193         LED_GREEN_ON;
 374  00e2 7217500a      	bres	20490,#3
 377  00e6 7218500a      	bset	20490,#4
 378                     ; 194         switch(RcvRFmsg.RFmsgmember.RFcmd)
 381  00ea b603          	ld	a,_RcvRFmsg+3
 383                     ; 208           default: break;
 384  00ec a00f          	sub	a,#15
 385  00ee 2706          	jreq	L15
 386  00f0 a0e1          	sub	a,#225
 387  00f2 2710          	jreq	L35
 388  00f4 2018          	jra	L741
 389  00f6               L15:
 390                     ; 198             LIGHT_ON;
 392  00f6 72155005      	bres	20485,#2
 395  00fa 72105005      	bset	20485,#0
 396                     ; 199             LightState = LIGHTSTATE_ON;
 399  00fe 35010000      	mov	L3_LightState,#1
 400                     ; 200             break;
 402  0102 200a          	jra	L741
 403  0104               L35:
 404                     ; 204             LIGHT_OFF;
 406  0104 7211500f      	bres	20495,#0
 409  0108 7214500a      	bset	20490,#2
 410                     ; 205             LightState = LIGHTSTATE_OFF;
 413  010c b700          	ld	L3_LightState,a
 414                     ; 206             break;
 416                     ; 208           default: break;
 418  010e               L741:
 419                     ; 211         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 421  010e ae0064        	ldw	x,#100
 422  0111 cd0000        	call	_Timeout_SetTimeout1
 424                     ; 212         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 426  0114 35050002      	mov	L32_state,#5
 427                     ; 213         break;
 429  0118 2024          	jra	L331
 430  011a               L75:
 431                     ; 217         if(Timeout_IsTimeout1())
 433  011a cd0000        	call	_Timeout_IsTimeout1
 435  011d 4d            	tnz	a
 436  011e 271e          	jreq	L331
 437                     ; 219           state = ST_SWITCH_LIGHT;
 439  0120 35030002      	mov	L32_state,#3
 440  0124 2018          	jra	L331
 441  0126               L16:
 442                     ; 225         if(Timeout_IsTimeout1())
 444  0126 cd0000        	call	_Timeout_IsTimeout1
 446  0129 4d            	tnz	a
 447  012a 2712          	jreq	L331
 448                     ; 227           HBRIDGE_OFF;
 450  012c ad47          	call	LC003
 452                     ; 230           BLINKSTOP_GREENLED;
 454  012e 72110000      	bres	_flag_blink_greenLED
 457  0132 7217500a      	bres	20490,#3
 460  0136 7219500a      	bres	20490,#4
 461                     ; 231           state = ST_WAIT_INPUT_OR_FLAG;
 465  013a               LC002:
 467  013a 35010002      	mov	L32_state,#1
 468                     ; 235       default: break;
 470  013e               L331:
 471                     ; 237     IWDG_ReloadCounter();
 473  013e cd0000        	call	_IWDG_ReloadCounter
 475                     ; 238     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 477  0141 cd0000        	call	_Errors_IsError
 479  0144 4d            	tnz	a
 480  0145 2716          	jreq	L551
 482  0147 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L551
 483                     ; 240       BLINK_REDLED(255);
 485  014c 35ff0000      	mov	_blink_redLED_times,#255
 488  0150 72100000      	bset	_flag_blink_unlimited
 493  0154 ad35          	call	LC004
 494                     ; 241       FLAG_reset_LEDblink_error = TRUE;
 497  0156 72100002      	bset	L51_FLAG_reset_LEDblink_error
 499  015a cc009b        	jra	L521
 500  015d               L551:
 501                     ; 245       if(FLAG_reset_LEDblink_error)
 503  015d 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L521
 504                     ; 247         BLINKSTOP_REDLED;
 506  0162 72110000      	bres	_flag_blink_redLED
 509  0166 7217500a      	bres	20490,#3
 512  016a 7219500a      	bres	20490,#4
 513                     ; 248         FLAG_reset_LEDblink_error = FALSE;
 517  016e 72110002      	bres	L51_FLAG_reset_LEDblink_error
 518  0172 cc009b        	jra	L521
 519  0175               LC003:
 520  0175 7210500f      	bset	20495,#0
 521                     ; 147   HBRIDGE_OFF;
 523  0179 72145005      	bset	20485,#2
 526  017d 72115005      	bres	20485,#0
 529  0181 7215500a      	bres	20490,#2
 530                     ; 148   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 533  0185 ae03e8        	ldw	x,#1000
 534  0188 cc0000        	jp	_Timeout_SetTimeout1
 535  018b               LC004:
 536  018b 5f            	clrw	x
 537  018c 72100000      	bset	_flag_blink_on_off
 538  0190 bf00          	ldw	_cnt_state_redLED,x
 540  0192 7216500a      	bset	20490,#3
 542  0196 7219500a      	bres	20490,#4
 544  019a 72100000      	bset	_flag_blink_redLED
 545  019e 81            	ret	
 592                     ; 254 _Bool IsLearnedID()
 592                     ; 255 {
 593                     .text:	section	.text,new
 594  0000               _IsLearnedID:
 596  0000 89            	pushw	x
 597       00000002      OFST:	set	2
 600                     ; 257   _Bool flag_IDfound = FALSE;
 602  0001 0f01          	clr	(OFST-1,sp)
 603                     ; 258   for(i = 0; i < Receivers.NumLrndRcv; i++)
 605  0003 0f02          	clr	(OFST+0,sp)
 607  0005 2019          	jra	L112
 608  0007               L502:
 609                     ; 260     if(RcvRFmsg.RFmsgmember.RFNodeId == Receivers.ID[i])
 611  0007 7b02          	ld	a,(OFST+0,sp)
 612  0009 5f            	clrw	x
 613  000a 97            	ld	xl,a
 614  000b d60000        	ld	a,(L5_Receivers,x)
 615  000e b102          	cp	a,_RcvRFmsg+2
 616  0010 260c          	jrne	L512
 617                     ; 262       flag_IDfound = TRUE;
 619  0012 a601          	ld	a,#1
 620  0014 6b01          	ld	(OFST-1,sp),a
 621                     ; 263       break;
 622  0016               L312:
 623                     ; 266   return flag_IDfound;
 625  0016 7b01          	ld	a,(OFST-1,sp)
 626  0018 2702          	jreq	L06
 627  001a a601          	ld	a,#1
 628  001c               L06:
 631  001c 85            	popw	x
 632  001d 81            	ret	
 633  001e               L512:
 634                     ; 258   for(i = 0; i < Receivers.NumLrndRcv; i++)
 636  001e 0c02          	inc	(OFST+0,sp)
 637  0020               L112:
 640  0020 c6000a        	ld	a,L5_Receivers+10
 641  0023 1102          	cp	a,(OFST+0,sp)
 642  0025 22e0          	jrugt	L502
 643  0027 20ed          	jra	L312
 696                     ; 269 void LearnNewID()
 696                     ; 270 {
 697                     .text:	section	.text,new
 698  0000               _LearnNewID:
 700  0000 89            	pushw	x
 701       00000002      OFST:	set	2
 704                     ; 273   _Bool flag_IDfound = FALSE;
 706  0001 0f01          	clr	(OFST-1,sp)
 707                     ; 274   for(i = 0; i < Receivers.NumLrndRcv; i++)
 709  0003 0f02          	clr	(OFST+0,sp)
 711  0005 2054          	jra	L542
 712  0007               L142:
 713                     ; 276     if( RcvRFmsg.RFmsgmember.RFNodeId == Receivers.ID[i])
 715  0007 7b02          	ld	a,(OFST+0,sp)
 716  0009 5f            	clrw	x
 717  000a 97            	ld	xl,a
 718  000b d60000        	ld	a,(L5_Receivers,x)
 719  000e b102          	cp	a,_RcvRFmsg+2
 720  0010 2647          	jrne	L152
 721                     ; 278       flag_IDfound = TRUE;
 723  0012 a601          	ld	a,#1
 724  0014 6b01          	ld	(OFST-1,sp),a
 725                     ; 279       break;
 726  0016               L742:
 727                     ; 282   if(!flag_IDfound)
 729  0016 7b01          	ld	a,(OFST-1,sp)
 730  0018 264a          	jrne	L352
 731                     ; 285     FLASH_Unlock(FLASH_MemType_Program);
 733  001a a6fd          	ld	a,#253
 734  001c cd0000        	call	_FLASH_Unlock
 736                     ; 286     FLASH_ProgramByte( (u16)(u8*)(&Receivers.ID[Receivers.NumLrndRcv]), (u8)RcvRFmsg.RFmsgmember.RFNodeId );
 738  001f 3b0002        	push	_RcvRFmsg+2
 739  0022 c6000a        	ld	a,L5_Receivers+10
 740  0025 5f            	clrw	x
 741  0026 97            	ld	xl,a
 742  0027 1c0000        	addw	x,#L5_Receivers
 743  002a cd0000        	call	_FLASH_ProgramByte
 745  002d 84            	pop	a
 746                     ; 287     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), Receivers.NumLrndRcv + 1);
 748  002e c6000a        	ld	a,L5_Receivers+10
 749  0031 4c            	inc	a
 750  0032 88            	push	a
 751  0033 ae000a        	ldw	x,#L5_Receivers+10
 752  0036 cd0000        	call	_FLASH_ProgramByte
 754  0039 84            	pop	a
 755                     ; 288     FLASH_Lock(FLASH_MemType_Program);
 757  003a a6fd          	ld	a,#253
 758  003c cd0000        	call	_FLASH_Lock
 760                     ; 290     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 762  003f c6000a        	ld	a,L5_Receivers+10
 763  0042 5f            	clrw	x
 764  0043 97            	ld	xl,a
 765  0044 5a            	decw	x
 766  0045 1c0000        	addw	x,#L5_Receivers
 767  0048 cd0000        	call	c_ltor
 769  004b ae0015        	ldw	x,#L7_BtoDW
 770  004e cd0000        	call	c_lcmp
 772  0051 2711          	jreq	L352
 773                     ; 292       Errors_SetError(ERROR_FLASH_WRITE);
 775  0053 4f            	clr	a
 776  0054 cd0000        	call	_Errors_SetError
 778  0057 200b          	jra	L352
 779  0059               L152:
 780                     ; 274   for(i = 0; i < Receivers.NumLrndRcv; i++)
 782  0059 0c02          	inc	(OFST+0,sp)
 783  005b               L542:
 786  005b c6000a        	ld	a,L5_Receivers+10
 787  005e 1102          	cp	a,(OFST+0,sp)
 788  0060 22a5          	jrugt	L142
 789  0062 20b2          	jra	L742
 790  0064               L352:
 791                     ; 295   LrnModeActive = FALSE;
 793  0064 72110000      	bres	L11_LrnModeActive
 794                     ; 296   BLINKSTOP_GREENLED;
 796  0068 72110000      	bres	_flag_blink_greenLED
 799  006c 7217500a      	bres	20490,#3
 802  0070 7219500a      	bres	20490,#4
 803                     ; 297 }
 808  0074 85            	popw	x
 809  0075 81            	ret	
 871                     ; 299 void BTN1_Released()
 871                     ; 300 {
 872                     .text:	section	.text,new
 873  0000               _BTN1_Released:
 875  0000 5203          	subw	sp,#3
 876       00000003      OFST:	set	3
 879                     ; 301   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 881  0002 be00          	ldw	x,_BTN1_press_timer
 882  0004 a30bb8        	cpw	x,#3000
 883  0007 245e          	jruge	L103
 884                     ; 304     if(!Errors_IsError())
 886  0009 cd0000        	call	_Errors_IsError
 888  000c 4d            	tnz	a
 889  000d 2703cc00c9    	jrne	L513
 890                     ; 306       if(!LrnModeActive)
 892  0012 7200000046    	btjt	L11_LrnModeActive,L503
 893                     ; 308         if(Receivers.NumLrndRcv < MAX_NUM_RECEIVERS)
 895  0017 c6000a        	ld	a,L5_Receivers+10
 896  001a a10a          	cp	a,#10
 897  001c 2422          	jruge	L703
 898                     ; 310           LrnModeActive = TRUE;
 900  001e 72100000      	bset	L11_LrnModeActive
 901                     ; 311           BLINK_GREENLED(255);
 903  0022 35ff0000      	mov	_blink_greenLED_times,#255
 906  0026 72100000      	bset	_flag_blink_unlimited
 911  002a 5f            	clrw	x
 912  002b 72100000      	bset	_flag_blink_on_off
 913  002f bf00          	ldw	_cnt_state_greenLED,x
 916  0031 7217500a      	bres	20490,#3
 919  0035 7218500a      	bset	20490,#4
 923  0039 72100000      	bset	_flag_blink_greenLED
 926  003d cc00c9        	jra	L513
 927  0040               L703:
 928                     ; 315           BLINK_REDLED(2);
 930  0040 35020000      	mov	_blink_redLED_times,#2
 933  0044 72110000      	bres	_flag_blink_unlimited
 938  0048 5f            	clrw	x
 939  0049 72100000      	bset	_flag_blink_on_off
 940  004d bf00          	ldw	_cnt_state_redLED,x
 943  004f 7216500a      	bset	20490,#3
 946  0053 7219500a      	bres	20490,#4
 950  0057 72100000      	bset	_flag_blink_redLED
 952  005b 206c          	jra	L513
 953  005d               L503:
 954                     ; 320         LrnModeActive = FALSE;
 956  005d 72110000      	bres	L11_LrnModeActive
 957                     ; 321         BLINKSTOP_GREENLED;
 959  0061 72110000      	bres	_flag_blink_greenLED
 964  0065 205a          	jp	LC005
 965  0067               L103:
 966                     ; 330     LED_RED_ON;
 968  0067 7216500a      	bset	20490,#3
 971  006b 7219500a      	bres	20490,#4
 972                     ; 331     flash_erase_timing_test = 1;
 975  006f 35010014      	mov	L14_flash_erase_timing_test,#1
 976                     ; 332     FLASH_Unlock(FLASH_MemType_Program);
 978  0073 a6fd          	ld	a,#253
 979  0075 cd0000        	call	_FLASH_Unlock
 981                     ; 333     adr = (u8*)&Receivers;
 983  0078 ae0000        	ldw	x,#L5_Receivers
 984  007b 1f01          	ldw	(OFST-2,sp),x
 985                     ; 334     for(i = 0; i < sizeof(Receivers); i++)
 987  007d 0f03          	clr	(OFST+0,sp)
 988  007f               L713:
 989                     ; 336       FLASH_EraseByte((u16)(adr++));
 991  007f 1e01          	ldw	x,(OFST-2,sp)
 992  0081 5c            	incw	x
 993  0082 1f01          	ldw	(OFST-2,sp),x
 994  0084 5a            	decw	x
 995  0085 cd0000        	call	_FLASH_EraseByte
 997                     ; 334     for(i = 0; i < sizeof(Receivers); i++)
 999  0088 0c03          	inc	(OFST+0,sp)
1002  008a 7b03          	ld	a,(OFST+0,sp)
1003  008c a10b          	cp	a,#11
1004  008e 25ef          	jrult	L713
1005                     ; 338     FLASH_Lock(FLASH_MemType_Program);
1007  0090 a6fd          	ld	a,#253
1008  0092 cd0000        	call	_FLASH_Lock
1010                     ; 339     flash_erase_timing_test = 2;
1012  0095 35020014      	mov	L14_flash_erase_timing_test,#2
1013                     ; 341     Errors_ResetError(ERROR_FLASH_ERASE);
1015  0099 a601          	ld	a,#1
1016  009b cd0000        	call	_Errors_ResetError
1018                     ; 342     adr = (u8*)&Receivers;
1020  009e ae0000        	ldw	x,#L5_Receivers
1021  00a1 1f01          	ldw	(OFST-2,sp),x
1022                     ; 343     for(i = 0; i < sizeof(Receivers); i++)
1024  00a3 0f03          	clr	(OFST+0,sp)
1025  00a5               L523:
1026                     ; 345       if(*(adr++))
1028  00a5 1e01          	ldw	x,(OFST-2,sp)
1029  00a7 5c            	incw	x
1030  00a8 1f01          	ldw	(OFST-2,sp),x
1031  00aa 5a            	decw	x
1032  00ab f6            	ld	a,(x)
1033  00ac 2707          	jreq	L333
1034                     ; 347         Errors_SetError(ERROR_FLASH_ERASE);
1036  00ae a601          	ld	a,#1
1037  00b0 cd0000        	call	_Errors_SetError
1039                     ; 348         break;
1041  00b3 2008          	jra	L133
1042  00b5               L333:
1043                     ; 343     for(i = 0; i < sizeof(Receivers); i++)
1045  00b5 0c03          	inc	(OFST+0,sp)
1048  00b7 7b03          	ld	a,(OFST+0,sp)
1049  00b9 a10b          	cp	a,#11
1050  00bb 25e8          	jrult	L523
1051  00bd               L133:
1052                     ; 351     flash_erase_timing_test = 3;
1054  00bd 35030014      	mov	L14_flash_erase_timing_test,#3
1055                     ; 352     LED_OFF;
1059  00c1               LC005:
1061  00c1 7217500a      	bres	20490,#3
1063  00c5 7219500a      	bres	20490,#4
1064  00c9               L513:
1065                     ; 354   BTN1_press_timer = 0;
1067  00c9 5f            	clrw	x
1068  00ca bf00          	ldw	_BTN1_press_timer,x
1069                     ; 355 }
1072  00cc 5b03          	addw	sp,#3
1073  00ce 81            	ret	
1097                     ; 357 void TASK_1000ms()
1097                     ; 358 {
1098                     .text:	section	.text,new
1099  0000               _TASK_1000ms:
1103                     ; 359   task_1000ms_cnt++;
1105  0000 3c06          	inc	L53_task_1000ms_cnt
1106                     ; 360 }
1109  0002 81            	ret	
1465                     	xdef	_main
1466                     	switch	.ubsct
1467  0000               _runtime_it_RFrcv:
1468  0000 000000000000  	ds.b	10
1469                     	xdef	_runtime_it_RFrcv
1470  000a               _runtime_it_1ms:
1471  000a 000000000000  	ds.b	10
1472                     	xdef	_runtime_it_1ms
1473                     	xdef	_IsLearnedID
1474                     	xdef	_LearnNewID
1475                     	xdef	_BTN1_Released
1476                     	xdef	_TASK_1000ms
1477  0014               L14_flash_erase_timing_test:
1478  0014 00            	ds.b	1
1479  0015               L7_BtoDW:
1480  0015 00000000      	ds.b	4
1481                     	switch	.bss
1482  0000               L5_Receivers:
1483  0000 000000000000  	ds.b	11
1484                     	xref	_Timeout_IsTimeout2
1485                     	xref	_Timeout_IsTimeout1
1486                     	xref	_Timeout_SetTimeout2
1487                     	xref	_Timeout_SetTimeout1
1488                     	xref.b	_RFbytesReady
1489                     	xref.b	_RcvRFmsg
1490                     	xbit	_flag_blink_unlimited
1491                     	xbit	_flag_blink_greenLED
1492                     	xbit	_flag_blink_redLED
1493                     	xbit	_flag_blink_on_off
1494                     	xref.b	_cnt_state_greenLED
1495                     	xref.b	_cnt_state_redLED
1496                     	xref.b	_blink_greenLED_times
1497                     	xref.b	_blink_redLED_times
1498                     	xbit	_FLAG_1000ms
1499                     	xref.b	_BTN1_press_timer
1500                     	xref.b	_BTN1_DEB_STATE
1501                     	xref	_Errors_IsError
1502                     	xref	_Errors_ResetError
1503                     	xref	_Errors_SetError
1504                     	xref	_Errors_Init
1505                     	xref	_Config
1506                     	xref	_RST_ClearFlag
1507                     	xref	_RST_GetFlagStatus
1508                     	xref	_IWDG_Enable
1509                     	xref	_IWDG_ReloadCounter
1510                     	xref	_IWDG_SetReload
1511                     	xref	_IWDG_SetPrescaler
1512                     	xref	_IWDG_WriteAccessCmd
1513                     	xref	_FLASH_EraseByte
1514                     	xref	_FLASH_ProgramByte
1515                     	xref	_FLASH_Lock
1516                     	xref	_FLASH_Unlock
1536                     	xref	c_lcmp
1537                     	xref	c_ltor
1538                     	end
