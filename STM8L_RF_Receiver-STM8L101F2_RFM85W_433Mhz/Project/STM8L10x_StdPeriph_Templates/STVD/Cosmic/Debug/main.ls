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
 112                     ; 116 void main(void)
 112                     ; 117 {
 114                     .text:	section	.text,new
 115  0000               _main:
 119                     ; 118   flash_erase_timing_test = 0;
 121  0000 3f00          	clr	L14_flash_erase_timing_test
 122                     ; 119   program_status = 1;
 124  0002 35010003      	mov	L52_program_status,#1
 125                     ; 120   disableInterrupts();
 128  0006 9b            	sim	
 130                     ; 121   Config();
 133  0007 cd0000        	call	_Config
 135                     ; 122   program_status = 2;
 137  000a 35020003      	mov	L52_program_status,#2
 138                     ; 123   Errors_Init();
 140  000e cd0000        	call	_Errors_Init
 142                     ; 124   enableInterrupts();
 145  0011 9a            	rim	
 147                     ; 125   LED_GREEN_ON;
 150  0012 7217500a      	bres	20490,#3
 153  0016 7218500a      	bset	20490,#4
 154                     ; 127   Timeout_SetTimeout2(200);
 157  001a ae00c8        	ldw	x,#200
 158  001d cd0000        	call	_Timeout_SetTimeout2
 161  0020               L501:
 162                     ; 128   while(!Timeout_IsTimeout2());
 164  0020 cd0000        	call	_Timeout_IsTimeout2
 166  0023 4d            	tnz	a
 167  0024 27fa          	jreq	L501
 168                     ; 129   LED_OFF;
 170  0026 7217500a      	bres	20490,#3
 173  002a 7219500a      	bres	20490,#4
 174                     ; 130   program_status = 3;
 177  002e 35030003      	mov	L52_program_status,#3
 178                     ; 131   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 180  0032 a602          	ld	a,#2
 181  0034 cd0000        	call	_RST_GetFlagStatus
 183  0037 4d            	tnz	a
 184  0038 2706          	jreq	L111
 185                     ; 133     BLINK_REDLED(1);
 187  003a 35010000      	mov	_blink_redLED_times,#1
 197  003e 200c          	jp	LC001
 198  0040               L111:
 199                     ; 135   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 201  0040 a604          	ld	a,#4
 202  0042 cd0000        	call	_RST_GetFlagStatus
 204  0045 4d            	tnz	a
 205  0046 270b          	jreq	L311
 206                     ; 137     BLINK_REDLED(2);
 208  0048 35020000      	mov	_blink_redLED_times,#2
 222  004c               LC001:
 224  004c 72110000      	bres	_flag_blink_unlimited
 227  0050 cd0190        	call	LC004
 229  0053               L311:
 230                     ; 139   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 232  0053 a60f          	ld	a,#15
 233  0055 cd0000        	call	_RST_ClearFlag
 236  0058               L121:
 237                     ; 140   while(ISBLINKING_REDLED);
 239  0058 72000000fb    	btjt	_flag_blink_redLED,L121
 240                     ; 141   program_status = 4;
 242  005d 35040003      	mov	L52_program_status,#4
 243                     ; 142   HBRIDGE_OFF;
 245  0061 cd017a        	call	LC003
 247                     ; 145   IWDG_Enable();
 249  0064 cd0000        	call	_IWDG_Enable
 251                     ; 146   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 253  0067 a655          	ld	a,#85
 254  0069 cd0000        	call	_IWDG_WriteAccessCmd
 256                     ; 147   IWDG_SetPrescaler(IWDG_Prescaler_64);  /* 431.15ms for RL[7:0]= 0xFF */
 258  006c a604          	ld	a,#4
 259  006e cd0000        	call	_IWDG_SetPrescaler
 261                     ; 148   IWDG_SetReload(0xFF);
 263  0071 a6ff          	ld	a,#255
 264  0073 cd0000        	call	_IWDG_SetReload
 266                     ; 149   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 268  0076 4f            	clr	a
 269  0077 cd0000        	call	_IWDG_WriteAccessCmd
 271                     ; 150   IWDG_ReloadCounter();
 273  007a cd0000        	call	_IWDG_ReloadCounter
 275                     ; 151   program_status = 5;
 277  007d 35050003      	mov	L52_program_status,#5
 278  0081               L521:
 279                     ; 154     switch(state)
 281  0081 b602          	ld	a,L32_state
 283                     ; 240       default: break;
 284  0083 2603cc013f    	jreq	LC002
 285  0088 4a            	dec	a
 286  0089 2713          	jreq	L54
 287  008b a002          	sub	a,#2
 288  008d 2758          	jreq	L74
 289  008f 4a            	dec	a
 290  0090 2603cc011f    	jreq	L75
 291  0095 4a            	dec	a
 292  0096 2603cc012b    	jreq	L16
 293  009b cc0143        	jra	L331
 294                     ; 158         state = ST_WAIT_INPUT_OR_FLAG;
 295                     ; 159         break;
 297  009e               L54:
 298                     ; 163         if(RFbytesReady == TRUE)
 300  009e b600          	ld	a,_RFbytesReady
 301  00a0 4a            	dec	a
 302  00a1 2606          	jrne	L531
 303                     ; 165           RFbytesReady = FALSE;
 305  00a3 b700          	ld	_RFbytesReady,a
 306                     ; 166           state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 308  00a5 35040002      	mov	L32_state,#4
 309  00a9               L531:
 310                     ; 168         if(FLAG_250ms)
 312  00a9 7201000007    	btjf	_FLAG_250ms,L731
 313                     ; 170           FLAG_250ms = FALSE;
 315  00ae 72110000      	bres	_FLAG_250ms
 316                     ; 171           TASK_250ms();
 318  00b2 cd0000        	call	_TASK_250ms
 320  00b5               L731:
 321                     ; 173         if(FLAG_500ms)
 323  00b5 7201000007    	btjf	_FLAG_500ms,L141
 324                     ; 175           FLAG_500ms = FALSE;
 326  00ba 72110000      	bres	_FLAG_500ms
 327                     ; 176           TASK_500ms();
 329  00be cd0000        	call	_TASK_500ms
 331  00c1               L141:
 332                     ; 178         if(FLAG_1000ms)
 334  00c1 7201000004    	btjf	_FLAG_1000ms,L341
 335                     ; 180           FLAG_1000ms = FALSE;
 337  00c6 72110000      	bres	_FLAG_1000ms
 338  00ca               L341:
 339                     ; 183         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 341  00ca b600          	ld	a,_BTN1_DEB_STATE
 342  00cc 4a            	dec	a
 343  00cd 2609          	jrne	L541
 345  00cf 7200000104    	btjt	L31_FLAG_BTN1_lock,L541
 346                     ; 185           FLAG_BTN1_lock = TRUE;
 348  00d4 72100001      	bset	L31_FLAG_BTN1_lock
 349  00d8               L541:
 350                     ; 187         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 352  00d8 b600          	ld	a,_BTN1_DEB_STATE
 353  00da 2667          	jrne	L331
 355  00dc 7201000162    	btjf	L31_FLAG_BTN1_lock,L331
 356                     ; 189           FLAG_BTN1_lock = FALSE;
 358  00e1 72110001      	bres	L31_FLAG_BTN1_lock
 359  00e5 205c          	jra	L331
 360  00e7               L74:
 361                     ; 198         LED_GREEN_ON;
 363  00e7 7217500a      	bres	20490,#3
 366  00eb 7218500a      	bset	20490,#4
 367                     ; 199         switch(RcvRFmsg.RFmsgmember.RFcmd)
 370  00ef b603          	ld	a,_RcvRFmsg+3
 372                     ; 213           default: break;
 373  00f1 a00f          	sub	a,#15
 374  00f3 2706          	jreq	L15
 375  00f5 a0e1          	sub	a,#225
 376  00f7 2710          	jreq	L35
 377  00f9 2018          	jra	L351
 378  00fb               L15:
 379                     ; 203             LIGHT_ON;
 381  00fb 72155005      	bres	20485,#2
 384  00ff 72105005      	bset	20485,#0
 385                     ; 204             LightState = LIGHTSTATE_ON;
 388  0103 35010000      	mov	L3_LightState,#1
 389                     ; 205             break;
 391  0107 200a          	jra	L351
 392  0109               L35:
 393                     ; 209             LIGHT_OFF;
 395  0109 7211500f      	bres	20495,#0
 398  010d 7214500a      	bset	20490,#2
 399                     ; 210             LightState = LIGHTSTATE_OFF;
 402  0111 b700          	ld	L3_LightState,a
 403                     ; 211             break;
 405                     ; 213           default: break;
 407  0113               L351:
 408                     ; 216         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 410  0113 ae0064        	ldw	x,#100
 411  0116 cd0000        	call	_Timeout_SetTimeout1
 413                     ; 217         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 415  0119 35050002      	mov	L32_state,#5
 416                     ; 218         break;
 418  011d 2024          	jra	L331
 419  011f               L75:
 420                     ; 222         if(Timeout_IsTimeout1())
 422  011f cd0000        	call	_Timeout_IsTimeout1
 424  0122 4d            	tnz	a
 425  0123 271e          	jreq	L331
 426                     ; 224           state = ST_SWITCH_LIGHT;
 428  0125 35030002      	mov	L32_state,#3
 429  0129 2018          	jra	L331
 430  012b               L16:
 431                     ; 230         if(Timeout_IsTimeout1())
 433  012b cd0000        	call	_Timeout_IsTimeout1
 435  012e 4d            	tnz	a
 436  012f 2712          	jreq	L331
 437                     ; 232           HBRIDGE_OFF;
 439  0131 ad47          	call	LC003
 441                     ; 235           BLINKSTOP_GREENLED;
 443  0133 72110000      	bres	_flag_blink_greenLED
 446  0137 7217500a      	bres	20490,#3
 449  013b 7219500a      	bres	20490,#4
 450                     ; 236           state = ST_WAIT_INPUT_OR_FLAG;
 454  013f               LC002:
 456  013f 35010002      	mov	L32_state,#1
 457                     ; 240       default: break;
 459  0143               L331:
 460                     ; 242     IWDG_ReloadCounter();
 462  0143 cd0000        	call	_IWDG_ReloadCounter
 464                     ; 243     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 466  0146 cd0000        	call	_Errors_IsError
 468  0149 4d            	tnz	a
 469  014a 2716          	jreq	L161
 471  014c 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L161
 472                     ; 245       BLINK_REDLED(255);
 474  0151 35ff0000      	mov	_blink_redLED_times,#255
 477  0155 72100000      	bset	_flag_blink_unlimited
 482  0159 ad35          	call	LC004
 483                     ; 246       FLAG_reset_LEDblink_error = TRUE;
 486  015b 72100002      	bset	L51_FLAG_reset_LEDblink_error
 488  015f cc0081        	jra	L521
 489  0162               L161:
 490                     ; 250       if(FLAG_reset_LEDblink_error)
 492  0162 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L521
 493                     ; 252         BLINKSTOP_REDLED;
 495  0167 72110000      	bres	_flag_blink_redLED
 498  016b 7217500a      	bres	20490,#3
 501  016f 7219500a      	bres	20490,#4
 502                     ; 253         FLAG_reset_LEDblink_error = FALSE;
 506  0173 72110002      	bres	L51_FLAG_reset_LEDblink_error
 507  0177 cc0081        	jra	L521
 508  017a               LC003:
 509  017a 7210500f      	bset	20495,#0
 510                     ; 142   HBRIDGE_OFF;
 512  017e 72145005      	bset	20485,#2
 515  0182 72115005      	bres	20485,#0
 518  0186 7215500a      	bres	20490,#2
 519                     ; 143   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 522  018a ae03e8        	ldw	x,#1000
 523  018d cc0000        	jp	_Timeout_SetTimeout1
 524  0190               LC004:
 525  0190 5f            	clrw	x
 526  0191 72100000      	bset	_flag_blink_on_off
 527  0195 bf00          	ldw	_cnt_state_redLED,x
 529  0197 7216500a      	bset	20490,#3
 531  019b 7219500a      	bres	20490,#4
 533  019f 72100000      	bset	_flag_blink_redLED
 534  01a3 81            	ret	
 581                     ; 259 _Bool IsLearnedID()
 581                     ; 260 {
 582                     .text:	section	.text,new
 583  0000               _IsLearnedID:
 585  0000 89            	pushw	x
 586       00000002      OFST:	set	2
 589                     ; 262   _Bool flag_IDfound = FALSE;
 591  0001 0f01          	clr	(OFST-1,sp)
 592                     ; 263   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 594  0003 0f02          	clr	(OFST+0,sp)
 596  0005 2020          	jra	L512
 597  0007               L112:
 598                     ; 265     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 600  0007 97            	ld	xl,a
 601  0008 a604          	ld	a,#4
 602  000a 42            	mul	x,a
 603  000b 1c0000        	addw	x,#L5_Receivers
 604  000e cd0000        	call	c_ltor
 606  0011 ae0001        	ldw	x,#L7_BtoDW
 607  0014 cd0000        	call	c_lcmp
 609  0017 260c          	jrne	L122
 610                     ; 267       flag_IDfound = TRUE;
 612  0019 a601          	ld	a,#1
 613  001b 6b01          	ld	(OFST-1,sp),a
 614                     ; 268       break;
 615  001d               L712:
 616                     ; 271   return flag_IDfound;
 618  001d 7b01          	ld	a,(OFST-1,sp)
 619  001f 2702          	jreq	L46
 620  0021 a601          	ld	a,#1
 621  0023               L46:
 624  0023 85            	popw	x
 625  0024 81            	ret	
 626  0025               L122:
 627                     ; 263   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 629  0025 0c02          	inc	(OFST+0,sp)
 630  0027               L512:
 633  0027 7b02          	ld	a,(OFST+0,sp)
 634  0029 c10028        	cp	a,L5_Receivers+40
 635  002c 25d9          	jrult	L112
 636  002e 20ed          	jra	L712
 688                     ; 274 void LearnNewID()
 688                     ; 275 {
 689                     .text:	section	.text,new
 690  0000               _LearnNewID:
 692  0000 89            	pushw	x
 693       00000002      OFST:	set	2
 696                     ; 278   _Bool flag_IDfound = FALSE;
 698  0001 0f01          	clr	(OFST-1,sp)
 699                     ; 279   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 701  0003 0f02          	clr	(OFST+0,sp)
 703  0005 2069          	jra	L152
 704  0007               L542:
 705                     ; 281     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 707  0007 97            	ld	xl,a
 708  0008 a604          	ld	a,#4
 709  000a 42            	mul	x,a
 710  000b cd0093        	call	LC006
 712  000e 265e          	jrne	L552
 713                     ; 283       flag_IDfound = TRUE;
 715  0010 a601          	ld	a,#1
 716  0012 6b01          	ld	(OFST-1,sp),a
 717                     ; 284       break;
 718  0014               L352:
 719                     ; 287   if(!flag_IDfound)
 721  0014 7b01          	ld	a,(OFST-1,sp)
 722  0016 2661          	jrne	L752
 723                     ; 290     FLASH_Unlock(FLASH_MemType_Program);
 725  0018 a6fd          	ld	a,#253
 726  001a cd0000        	call	_FLASH_Unlock
 728                     ; 291     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)BtoDW.B.b0 );
 730  001d 3b0001        	push	L7_BtoDW
 731  0020 ad69          	call	LC005
 732  0022 1c0000        	addw	x,#L5_Receivers
 733  0025 cd0000        	call	_FLASH_ProgramByte
 735  0028 84            	pop	a
 736                     ; 292     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)BtoDW.B.b1 );
 738  0029 3b0002        	push	L7_BtoDW+1
 739  002c ad5d          	call	LC005
 740  002e 1c0001        	addw	x,#L5_Receivers+1
 741  0031 cd0000        	call	_FLASH_ProgramByte
 743  0034 84            	pop	a
 744                     ; 293     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)BtoDW.B.b2 );
 746  0035 3b0003        	push	L7_BtoDW+2
 747  0038 ad51          	call	LC005
 748  003a 1c0002        	addw	x,#L5_Receivers+2
 749  003d cd0000        	call	_FLASH_ProgramByte
 751  0040 84            	pop	a
 752                     ; 294     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)BtoDW.B.b3 );
 754  0041 3b0004        	push	L7_BtoDW+3
 755  0044 ad45          	call	LC005
 756  0046 1c0003        	addw	x,#L5_Receivers+3
 757  0049 cd0000        	call	_FLASH_ProgramByte
 759  004c 84            	pop	a
 760                     ; 295     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
 762  004d c60028        	ld	a,L5_Receivers+40
 763  0050 4c            	inc	a
 764  0051 88            	push	a
 765  0052 ae0028        	ldw	x,#L5_Receivers+40
 766  0055 cd0000        	call	_FLASH_ProgramByte
 768  0058 84            	pop	a
 769                     ; 296     FLASH_Lock(FLASH_MemType_Program);
 771  0059 a6fd          	ld	a,#253
 772  005b cd0000        	call	_FLASH_Lock
 774                     ; 298     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 776  005e ad2b          	call	LC005
 777  0060 1d0004        	subw	x,#4
 778  0063 ad2e          	call	LC006
 780  0065 2712          	jreq	L752
 781                     ; 300       Errors_SetError(ERROR_FLASH_WRITE);
 783  0067 a604          	ld	a,#4
 784  0069 cd0000        	call	_Errors_SetError
 786  006c 200b          	jra	L752
 787  006e               L552:
 788                     ; 279   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 790  006e 0c02          	inc	(OFST+0,sp)
 791  0070               L152:
 794  0070 7b02          	ld	a,(OFST+0,sp)
 795  0072 c10028        	cp	a,L5_Receivers+40
 796  0075 2590          	jrult	L542
 797  0077 209b          	jra	L352
 798  0079               L752:
 799                     ; 303   LrnModeActive = FALSE;
 801  0079 72110000      	bres	L11_LrnModeActive
 802                     ; 304   BLINKSTOP_GREENLED;
 804  007d 72110000      	bres	_flag_blink_greenLED
 807  0081 7217500a      	bres	20490,#3
 810  0085 7219500a      	bres	20490,#4
 811                     ; 305 }
 816  0089 85            	popw	x
 817  008a 81            	ret	
 818  008b               LC005:
 819  008b c60028        	ld	a,L5_Receivers+40
 820  008e 97            	ld	xl,a
 821  008f a604          	ld	a,#4
 822  0091 42            	mul	x,a
 823  0092 81            	ret	
 824  0093               LC006:
 825  0093 1c0000        	addw	x,#L5_Receivers
 826  0096 cd0000        	call	c_ltor
 828  0099 ae0001        	ldw	x,#L7_BtoDW
 829  009c cc0000        	jp	c_lcmp
 891                     ; 307 void BTN1_Released()
 891                     ; 308 {
 892                     .text:	section	.text,new
 893  0000               _BTN1_Released:
 895  0000 5203          	subw	sp,#3
 896       00000003      OFST:	set	3
 899                     ; 309   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 901  0002 be00          	ldw	x,_BTN1_press_timer
 902  0004 a30bb8        	cpw	x,#3000
 903  0007 245e          	jruge	L503
 904                     ; 312     if(!Errors_IsError())
 906  0009 cd0000        	call	_Errors_IsError
 908  000c 4d            	tnz	a
 909  000d 2703cc00c9    	jrne	L123
 910                     ; 314       if(!LrnModeActive)
 912  0012 7200000046    	btjt	L11_LrnModeActive,L113
 913                     ; 316         if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
 915  0017 c60028        	ld	a,L5_Receivers+40
 916  001a a10a          	cp	a,#10
 917  001c 2422          	jruge	L313
 918                     ; 318           LrnModeActive = TRUE;
 920  001e 72100000      	bset	L11_LrnModeActive
 921                     ; 319           BLINK_GREENLED(255);
 923  0022 35ff0000      	mov	_blink_greenLED_times,#255
 926  0026 72100000      	bset	_flag_blink_unlimited
 931  002a 5f            	clrw	x
 932  002b 72100000      	bset	_flag_blink_on_off
 933  002f bf00          	ldw	_cnt_state_greenLED,x
 936  0031 7217500a      	bres	20490,#3
 939  0035 7218500a      	bset	20490,#4
 943  0039 72100000      	bset	_flag_blink_greenLED
 946  003d cc00c9        	jra	L123
 947  0040               L313:
 948                     ; 323           BLINK_REDLED(2);
 950  0040 35020000      	mov	_blink_redLED_times,#2
 953  0044 72110000      	bres	_flag_blink_unlimited
 958  0048 5f            	clrw	x
 959  0049 72100000      	bset	_flag_blink_on_off
 960  004d bf00          	ldw	_cnt_state_redLED,x
 963  004f 7216500a      	bset	20490,#3
 966  0053 7219500a      	bres	20490,#4
 970  0057 72100000      	bset	_flag_blink_redLED
 972  005b 206c          	jra	L123
 973  005d               L113:
 974                     ; 328         LrnModeActive = FALSE;
 976  005d 72110000      	bres	L11_LrnModeActive
 977                     ; 329         BLINKSTOP_GREENLED;
 979  0061 72110000      	bres	_flag_blink_greenLED
 984  0065 205a          	jp	LC007
 985  0067               L503:
 986                     ; 338     LED_RED_ON;
 988  0067 7216500a      	bset	20490,#3
 991  006b 7219500a      	bres	20490,#4
 992                     ; 339     flash_erase_timing_test = 1;
 995  006f 35010000      	mov	L14_flash_erase_timing_test,#1
 996                     ; 340     FLASH_Unlock(FLASH_MemType_Program);
 998  0073 a6fd          	ld	a,#253
 999  0075 cd0000        	call	_FLASH_Unlock
1001                     ; 341     adr = (u8*)&Receivers;
1003  0078 ae0000        	ldw	x,#L5_Receivers
1004  007b 1f01          	ldw	(OFST-2,sp),x
1005                     ; 342     for(i = 0; i < sizeof(Receivers); i++)
1007  007d 0f03          	clr	(OFST+0,sp)
1008  007f               L323:
1009                     ; 344       FLASH_EraseByte((u16)(adr++));
1011  007f 1e01          	ldw	x,(OFST-2,sp)
1012  0081 5c            	incw	x
1013  0082 1f01          	ldw	(OFST-2,sp),x
1014  0084 5a            	decw	x
1015  0085 cd0000        	call	_FLASH_EraseByte
1017                     ; 342     for(i = 0; i < sizeof(Receivers); i++)
1019  0088 0c03          	inc	(OFST+0,sp)
1022  008a 7b03          	ld	a,(OFST+0,sp)
1023  008c a129          	cp	a,#41
1024  008e 25ef          	jrult	L323
1025                     ; 346     FLASH_Lock(FLASH_MemType_Program);
1027  0090 a6fd          	ld	a,#253
1028  0092 cd0000        	call	_FLASH_Lock
1030                     ; 347     flash_erase_timing_test = 2;
1032  0095 35020000      	mov	L14_flash_erase_timing_test,#2
1033                     ; 349     Errors_ResetError(ERROR_FLASH_ERASE);
1035  0099 a605          	ld	a,#5
1036  009b cd0000        	call	_Errors_ResetError
1038                     ; 350     adr = (u8*)&Receivers;
1040  009e ae0000        	ldw	x,#L5_Receivers
1041  00a1 1f01          	ldw	(OFST-2,sp),x
1042                     ; 351     for(i = 0; i < sizeof(Receivers); i++)
1044  00a3 0f03          	clr	(OFST+0,sp)
1045  00a5               L133:
1046                     ; 353       if(*(adr++))
1048  00a5 1e01          	ldw	x,(OFST-2,sp)
1049  00a7 5c            	incw	x
1050  00a8 1f01          	ldw	(OFST-2,sp),x
1051  00aa 5a            	decw	x
1052  00ab f6            	ld	a,(x)
1053  00ac 2707          	jreq	L733
1054                     ; 355         Errors_SetError(ERROR_FLASH_ERASE);
1056  00ae a605          	ld	a,#5
1057  00b0 cd0000        	call	_Errors_SetError
1059                     ; 356         break;
1061  00b3 2008          	jra	L533
1062  00b5               L733:
1063                     ; 351     for(i = 0; i < sizeof(Receivers); i++)
1065  00b5 0c03          	inc	(OFST+0,sp)
1068  00b7 7b03          	ld	a,(OFST+0,sp)
1069  00b9 a129          	cp	a,#41
1070  00bb 25e8          	jrult	L133
1071  00bd               L533:
1072                     ; 359     flash_erase_timing_test = 3;
1074  00bd 35030000      	mov	L14_flash_erase_timing_test,#3
1075                     ; 360     LED_OFF;
1079  00c1               LC007:
1081  00c1 7217500a      	bres	20490,#3
1083  00c5 7219500a      	bres	20490,#4
1084  00c9               L123:
1085                     ; 362   BTN1_press_timer = 0;
1087  00c9 5f            	clrw	x
1088  00ca bf00          	ldw	_BTN1_press_timer,x
1089                     ; 363 }
1092  00cc 5b03          	addw	sp,#3
1093  00ce 81            	ret	
1117                     ; 365 void TASK_1000ms()
1117                     ; 366 {
1118                     .text:	section	.text,new
1119  0000               _TASK_1000ms:
1123                     ; 367   task_1000ms_cnt++;
1125  0000 3c06          	inc	L53_task_1000ms_cnt
1126                     ; 368 }
1129  0002 81            	ret	
1153                     ; 370 void TASK_500ms()
1153                     ; 371 {
1154                     .text:	section	.text,new
1155  0000               _TASK_500ms:
1159                     ; 372   flash_erase_timing_test = 0;
1161  0000 3f00          	clr	L14_flash_erase_timing_test
1162                     ; 373 }
1165  0002 81            	ret	
1188                     ; 375 void TASK_250ms()
1188                     ; 376 {
1189                     .text:	section	.text,new
1190  0000               _TASK_250ms:
1194                     ; 378 }
1197  0000 81            	ret	
1491                     	xdef	_main
1492                     	xdef	_IsLearnedID
1493                     	xdef	_LearnNewID
1494                     	xdef	_BTN1_Released
1495                     	xdef	_TASK_250ms
1496                     	xdef	_TASK_500ms
1497                     	xdef	_TASK_1000ms
1498                     	switch	.ubsct
1499  0000               L14_flash_erase_timing_test:
1500  0000 00            	ds.b	1
1501  0001               L7_BtoDW:
1502  0001 00000000      	ds.b	4
1503                     .const:	section	.text
1504  0000               L5_Receivers:
1505  0000 000000000000  	ds.b	41
1506                     	xref	_Timeout_IsTimeout2
1507                     	xref	_Timeout_IsTimeout1
1508                     	xref	_Timeout_SetTimeout2
1509                     	xref	_Timeout_SetTimeout1
1510                     	xref.b	_RFbytesReady
1511                     	xref.b	_RcvRFmsg
1512                     	xbit	_flag_blink_unlimited
1513                     	xbit	_flag_blink_greenLED
1514                     	xbit	_flag_blink_redLED
1515                     	xbit	_flag_blink_on_off
1516                     	xref.b	_cnt_state_greenLED
1517                     	xref.b	_cnt_state_redLED
1518                     	xref.b	_blink_greenLED_times
1519                     	xref.b	_blink_redLED_times
1520                     	xbit	_FLAG_1000ms
1521                     	xbit	_FLAG_500ms
1522                     	xbit	_FLAG_250ms
1523                     	xref.b	_BTN1_press_timer
1524                     	xref.b	_BTN1_DEB_STATE
1525                     	xref	_Errors_IsError
1526                     	xref	_Errors_ResetError
1527                     	xref	_Errors_SetError
1528                     	xref	_Errors_Init
1529                     	xref	_Config
1530                     	xref	_RST_ClearFlag
1531                     	xref	_RST_GetFlagStatus
1532                     	xref	_IWDG_Enable
1533                     	xref	_IWDG_ReloadCounter
1534                     	xref	_IWDG_SetReload
1535                     	xref	_IWDG_SetPrescaler
1536                     	xref	_IWDG_WriteAccessCmd
1537                     	xref	_FLASH_EraseByte
1538                     	xref	_FLASH_ProgramByte
1539                     	xref	_FLASH_Lock
1540                     	xref	_FLASH_Unlock
1560                     	xref	c_lcmp
1561                     	xref	c_ltor
1562                     	end
