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
 227  0050 cd018f        	call	LC004
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
 245  0061 cd0179        	call	LC003
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
 284  0083 2603cc013e    	jreq	LC002
 285  0088 4a            	dec	a
 286  0089 2713          	jreq	L54
 287  008b a002          	sub	a,#2
 288  008d 2757          	jreq	L74
 289  008f 4a            	dec	a
 290  0090 2603cc011e    	jreq	L75
 291  0095 4a            	dec	a
 292  0096 2603cc012a    	jreq	L16
 293  009b cc0142        	jra	L331
 294                     ; 158         state = ST_WAIT_INPUT_OR_FLAG;
 295                     ; 159         break;
 297  009e               L54:
 298                     ; 163         if(RFbytesReady)
 300  009e 3d00          	tnz	_RFbytesReady
 301  00a0 2706          	jreq	L531
 302                     ; 165           RFbytesReady = FALSE;
 304  00a2 b700          	ld	_RFbytesReady,a
 305                     ; 166           state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 307  00a4 35040002      	mov	L32_state,#4
 308  00a8               L531:
 309                     ; 168         if(FLAG_250ms)
 311  00a8 7201000007    	btjf	_FLAG_250ms,L731
 312                     ; 170           FLAG_250ms = FALSE;
 314  00ad 72110000      	bres	_FLAG_250ms
 315                     ; 171           TASK_250ms();
 317  00b1 cd0000        	call	_TASK_250ms
 319  00b4               L731:
 320                     ; 173         if(FLAG_500ms)
 322  00b4 7201000007    	btjf	_FLAG_500ms,L141
 323                     ; 175           FLAG_500ms = FALSE;
 325  00b9 72110000      	bres	_FLAG_500ms
 326                     ; 176           TASK_500ms();
 328  00bd cd0000        	call	_TASK_500ms
 330  00c0               L141:
 331                     ; 178         if(FLAG_1000ms)
 333  00c0 7201000004    	btjf	_FLAG_1000ms,L341
 334                     ; 180           FLAG_1000ms = FALSE;
 336  00c5 72110000      	bres	_FLAG_1000ms
 337  00c9               L341:
 338                     ; 183         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 340  00c9 b600          	ld	a,_BTN1_DEB_STATE
 341  00cb 4a            	dec	a
 342  00cc 2609          	jrne	L541
 344  00ce 7200000104    	btjt	L31_FLAG_BTN1_lock,L541
 345                     ; 185           FLAG_BTN1_lock = TRUE;
 347  00d3 72100001      	bset	L31_FLAG_BTN1_lock
 348  00d7               L541:
 349                     ; 187         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 351  00d7 b600          	ld	a,_BTN1_DEB_STATE
 352  00d9 2667          	jrne	L331
 354  00db 7201000162    	btjf	L31_FLAG_BTN1_lock,L331
 355                     ; 189           FLAG_BTN1_lock = FALSE;
 357  00e0 72110001      	bres	L31_FLAG_BTN1_lock
 358  00e4 205c          	jra	L331
 359  00e6               L74:
 360                     ; 198         LED_GREEN_ON;
 362  00e6 7217500a      	bres	20490,#3
 365  00ea 7218500a      	bset	20490,#4
 366                     ; 199         switch(RcvRFmsg.RFmsgmember.RFcmd)
 369  00ee b603          	ld	a,_RcvRFmsg+3
 371                     ; 213           default: break;
 372  00f0 a00f          	sub	a,#15
 373  00f2 2706          	jreq	L15
 374  00f4 a0e1          	sub	a,#225
 375  00f6 2710          	jreq	L35
 376  00f8 2018          	jra	L351
 377  00fa               L15:
 378                     ; 203             LIGHT_ON;
 380  00fa 72155005      	bres	20485,#2
 383  00fe 72105005      	bset	20485,#0
 384                     ; 204             LightState = LIGHTSTATE_ON;
 387  0102 35010000      	mov	L3_LightState,#1
 388                     ; 205             break;
 390  0106 200a          	jra	L351
 391  0108               L35:
 392                     ; 209             LIGHT_OFF;
 394  0108 7211500f      	bres	20495,#0
 397  010c 7214500a      	bset	20490,#2
 398                     ; 210             LightState = LIGHTSTATE_OFF;
 401  0110 b700          	ld	L3_LightState,a
 402                     ; 211             break;
 404                     ; 213           default: break;
 406  0112               L351:
 407                     ; 216         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 409  0112 ae0064        	ldw	x,#100
 410  0115 cd0000        	call	_Timeout_SetTimeout1
 412                     ; 217         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 414  0118 35050002      	mov	L32_state,#5
 415                     ; 218         break;
 417  011c 2024          	jra	L331
 418  011e               L75:
 419                     ; 222         if(Timeout_IsTimeout1())
 421  011e cd0000        	call	_Timeout_IsTimeout1
 423  0121 4d            	tnz	a
 424  0122 271e          	jreq	L331
 425                     ; 224           state = ST_SWITCH_LIGHT;
 427  0124 35030002      	mov	L32_state,#3
 428  0128 2018          	jra	L331
 429  012a               L16:
 430                     ; 230         if(Timeout_IsTimeout1())
 432  012a cd0000        	call	_Timeout_IsTimeout1
 434  012d 4d            	tnz	a
 435  012e 2712          	jreq	L331
 436                     ; 232           HBRIDGE_OFF;
 438  0130 ad47          	call	LC003
 440                     ; 235           BLINKSTOP_GREENLED;
 442  0132 72110000      	bres	_flag_blink_greenLED
 445  0136 7217500a      	bres	20490,#3
 448  013a 7219500a      	bres	20490,#4
 449                     ; 236           state = ST_WAIT_INPUT_OR_FLAG;
 453  013e               LC002:
 455  013e 35010002      	mov	L32_state,#1
 456                     ; 240       default: break;
 458  0142               L331:
 459                     ; 242     IWDG_ReloadCounter();
 461  0142 cd0000        	call	_IWDG_ReloadCounter
 463                     ; 243     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 465  0145 cd0000        	call	_Errors_IsError
 467  0148 4d            	tnz	a
 468  0149 2716          	jreq	L161
 470  014b 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L161
 471                     ; 245       BLINK_REDLED(255);
 473  0150 35ff0000      	mov	_blink_redLED_times,#255
 476  0154 72100000      	bset	_flag_blink_unlimited
 481  0158 ad35          	call	LC004
 482                     ; 246       FLAG_reset_LEDblink_error = TRUE;
 485  015a 72100002      	bset	L51_FLAG_reset_LEDblink_error
 487  015e cc0081        	jra	L521
 488  0161               L161:
 489                     ; 250       if(FLAG_reset_LEDblink_error)
 491  0161 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L521
 492                     ; 252         BLINKSTOP_REDLED;
 494  0166 72110000      	bres	_flag_blink_redLED
 497  016a 7217500a      	bres	20490,#3
 500  016e 7219500a      	bres	20490,#4
 501                     ; 253         FLAG_reset_LEDblink_error = FALSE;
 505  0172 72110002      	bres	L51_FLAG_reset_LEDblink_error
 506  0176 cc0081        	jra	L521
 507  0179               LC003:
 508  0179 7210500f      	bset	20495,#0
 509                     ; 142   HBRIDGE_OFF;
 511  017d 72145005      	bset	20485,#2
 514  0181 72115005      	bres	20485,#0
 517  0185 7215500a      	bres	20490,#2
 518                     ; 143   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 521  0189 ae03e8        	ldw	x,#1000
 522  018c cc0000        	jp	_Timeout_SetTimeout1
 523  018f               LC004:
 524  018f 5f            	clrw	x
 525  0190 72100000      	bset	_flag_blink_on_off
 526  0194 bf00          	ldw	_cnt_state_redLED,x
 528  0196 7216500a      	bset	20490,#3
 530  019a 7219500a      	bres	20490,#4
 532  019e 72100000      	bset	_flag_blink_redLED
 533  01a2 81            	ret	
 580                     ; 259 _Bool IsLearnedID()
 580                     ; 260 {
 581                     .text:	section	.text,new
 582  0000               _IsLearnedID:
 584  0000 89            	pushw	x
 585       00000002      OFST:	set	2
 588                     ; 262   _Bool flag_IDfound = FALSE;
 590  0001 0f01          	clr	(OFST-1,sp)
 591                     ; 263   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 593  0003 0f02          	clr	(OFST+0,sp)
 595  0005 2020          	jra	L512
 596  0007               L112:
 597                     ; 265     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 599  0007 97            	ld	xl,a
 600  0008 a604          	ld	a,#4
 601  000a 42            	mul	x,a
 602  000b 1c0000        	addw	x,#L5_Receivers
 603  000e cd0000        	call	c_ltor
 605  0011 ae0001        	ldw	x,#L7_BtoDW
 606  0014 cd0000        	call	c_lcmp
 608  0017 260c          	jrne	L122
 609                     ; 267       flag_IDfound = TRUE;
 611  0019 a601          	ld	a,#1
 612  001b 6b01          	ld	(OFST-1,sp),a
 613                     ; 268       break;
 614  001d               L712:
 615                     ; 271   return flag_IDfound;
 617  001d 7b01          	ld	a,(OFST-1,sp)
 618  001f 2702          	jreq	L46
 619  0021 a601          	ld	a,#1
 620  0023               L46:
 623  0023 85            	popw	x
 624  0024 81            	ret	
 625  0025               L122:
 626                     ; 263   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 628  0025 0c02          	inc	(OFST+0,sp)
 629  0027               L512:
 632  0027 7b02          	ld	a,(OFST+0,sp)
 633  0029 c10028        	cp	a,L5_Receivers+40
 634  002c 25d9          	jrult	L112
 635  002e 20ed          	jra	L712
 687                     ; 274 void LearnNewID()
 687                     ; 275 {
 688                     .text:	section	.text,new
 689  0000               _LearnNewID:
 691  0000 89            	pushw	x
 692       00000002      OFST:	set	2
 695                     ; 278   _Bool flag_IDfound = FALSE;
 697  0001 0f01          	clr	(OFST-1,sp)
 698                     ; 279   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 700  0003 0f02          	clr	(OFST+0,sp)
 702  0005 2069          	jra	L152
 703  0007               L542:
 704                     ; 281     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 706  0007 97            	ld	xl,a
 707  0008 a604          	ld	a,#4
 708  000a 42            	mul	x,a
 709  000b cd0093        	call	LC006
 711  000e 265e          	jrne	L552
 712                     ; 283       flag_IDfound = TRUE;
 714  0010 a601          	ld	a,#1
 715  0012 6b01          	ld	(OFST-1,sp),a
 716                     ; 284       break;
 717  0014               L352:
 718                     ; 287   if(!flag_IDfound)
 720  0014 7b01          	ld	a,(OFST-1,sp)
 721  0016 2661          	jrne	L752
 722                     ; 290     FLASH_Unlock(FLASH_MemType_Program);
 724  0018 a6fd          	ld	a,#253
 725  001a cd0000        	call	_FLASH_Unlock
 727                     ; 291     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)BtoDW.B.b0 );
 729  001d 3b0001        	push	L7_BtoDW
 730  0020 ad69          	call	LC005
 731  0022 1c0000        	addw	x,#L5_Receivers
 732  0025 cd0000        	call	_FLASH_ProgramByte
 734  0028 84            	pop	a
 735                     ; 292     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)BtoDW.B.b1 );
 737  0029 3b0002        	push	L7_BtoDW+1
 738  002c ad5d          	call	LC005
 739  002e 1c0001        	addw	x,#L5_Receivers+1
 740  0031 cd0000        	call	_FLASH_ProgramByte
 742  0034 84            	pop	a
 743                     ; 293     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)BtoDW.B.b2 );
 745  0035 3b0003        	push	L7_BtoDW+2
 746  0038 ad51          	call	LC005
 747  003a 1c0002        	addw	x,#L5_Receivers+2
 748  003d cd0000        	call	_FLASH_ProgramByte
 750  0040 84            	pop	a
 751                     ; 294     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)BtoDW.B.b3 );
 753  0041 3b0004        	push	L7_BtoDW+3
 754  0044 ad45          	call	LC005
 755  0046 1c0003        	addw	x,#L5_Receivers+3
 756  0049 cd0000        	call	_FLASH_ProgramByte
 758  004c 84            	pop	a
 759                     ; 295     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
 761  004d c60028        	ld	a,L5_Receivers+40
 762  0050 4c            	inc	a
 763  0051 88            	push	a
 764  0052 ae0028        	ldw	x,#L5_Receivers+40
 765  0055 cd0000        	call	_FLASH_ProgramByte
 767  0058 84            	pop	a
 768                     ; 296     FLASH_Lock(FLASH_MemType_Program);
 770  0059 a6fd          	ld	a,#253
 771  005b cd0000        	call	_FLASH_Lock
 773                     ; 298     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 775  005e ad2b          	call	LC005
 776  0060 1d0004        	subw	x,#4
 777  0063 ad2e          	call	LC006
 779  0065 2712          	jreq	L752
 780                     ; 300       Errors_SetError(ERROR_FLASH_WRITE);
 782  0067 a604          	ld	a,#4
 783  0069 cd0000        	call	_Errors_SetError
 785  006c 200b          	jra	L752
 786  006e               L552:
 787                     ; 279   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 789  006e 0c02          	inc	(OFST+0,sp)
 790  0070               L152:
 793  0070 7b02          	ld	a,(OFST+0,sp)
 794  0072 c10028        	cp	a,L5_Receivers+40
 795  0075 2590          	jrult	L542
 796  0077 209b          	jra	L352
 797  0079               L752:
 798                     ; 303   LrnModeActive = FALSE;
 800  0079 72110000      	bres	L11_LrnModeActive
 801                     ; 304   BLINKSTOP_GREENLED;
 803  007d 72110000      	bres	_flag_blink_greenLED
 806  0081 7217500a      	bres	20490,#3
 809  0085 7219500a      	bres	20490,#4
 810                     ; 305 }
 815  0089 85            	popw	x
 816  008a 81            	ret	
 817  008b               LC005:
 818  008b c60028        	ld	a,L5_Receivers+40
 819  008e 97            	ld	xl,a
 820  008f a604          	ld	a,#4
 821  0091 42            	mul	x,a
 822  0092 81            	ret	
 823  0093               LC006:
 824  0093 1c0000        	addw	x,#L5_Receivers
 825  0096 cd0000        	call	c_ltor
 827  0099 ae0001        	ldw	x,#L7_BtoDW
 828  009c cc0000        	jp	c_lcmp
 890                     ; 307 void BTN1_Released()
 890                     ; 308 {
 891                     .text:	section	.text,new
 892  0000               _BTN1_Released:
 894  0000 5203          	subw	sp,#3
 895       00000003      OFST:	set	3
 898                     ; 309   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 900  0002 be00          	ldw	x,_BTN1_press_timer
 901  0004 a30bb8        	cpw	x,#3000
 902  0007 245e          	jruge	L503
 903                     ; 312     if(!Errors_IsError())
 905  0009 cd0000        	call	_Errors_IsError
 907  000c 4d            	tnz	a
 908  000d 2703cc00c9    	jrne	L123
 909                     ; 314       if(!LrnModeActive)
 911  0012 7200000046    	btjt	L11_LrnModeActive,L113
 912                     ; 316         if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
 914  0017 c60028        	ld	a,L5_Receivers+40
 915  001a a10a          	cp	a,#10
 916  001c 2422          	jruge	L313
 917                     ; 318           LrnModeActive = TRUE;
 919  001e 72100000      	bset	L11_LrnModeActive
 920                     ; 319           BLINK_GREENLED(255);
 922  0022 35ff0000      	mov	_blink_greenLED_times,#255
 925  0026 72100000      	bset	_flag_blink_unlimited
 930  002a 5f            	clrw	x
 931  002b 72100000      	bset	_flag_blink_on_off
 932  002f bf00          	ldw	_cnt_state_greenLED,x
 935  0031 7217500a      	bres	20490,#3
 938  0035 7218500a      	bset	20490,#4
 942  0039 72100000      	bset	_flag_blink_greenLED
 945  003d cc00c9        	jra	L123
 946  0040               L313:
 947                     ; 323           BLINK_REDLED(2);
 949  0040 35020000      	mov	_blink_redLED_times,#2
 952  0044 72110000      	bres	_flag_blink_unlimited
 957  0048 5f            	clrw	x
 958  0049 72100000      	bset	_flag_blink_on_off
 959  004d bf00          	ldw	_cnt_state_redLED,x
 962  004f 7216500a      	bset	20490,#3
 965  0053 7219500a      	bres	20490,#4
 969  0057 72100000      	bset	_flag_blink_redLED
 971  005b 206c          	jra	L123
 972  005d               L113:
 973                     ; 328         LrnModeActive = FALSE;
 975  005d 72110000      	bres	L11_LrnModeActive
 976                     ; 329         BLINKSTOP_GREENLED;
 978  0061 72110000      	bres	_flag_blink_greenLED
 983  0065 205a          	jp	LC007
 984  0067               L503:
 985                     ; 338     LED_RED_ON;
 987  0067 7216500a      	bset	20490,#3
 990  006b 7219500a      	bres	20490,#4
 991                     ; 339     flash_erase_timing_test = 1;
 994  006f 35010000      	mov	L14_flash_erase_timing_test,#1
 995                     ; 340     FLASH_Unlock(FLASH_MemType_Program);
 997  0073 a6fd          	ld	a,#253
 998  0075 cd0000        	call	_FLASH_Unlock
1000                     ; 341     adr = (u8*)&Receivers;
1002  0078 ae0000        	ldw	x,#L5_Receivers
1003  007b 1f01          	ldw	(OFST-2,sp),x
1004                     ; 342     for(i = 0; i < sizeof(Receivers); i++)
1006  007d 0f03          	clr	(OFST+0,sp)
1007  007f               L323:
1008                     ; 344       FLASH_EraseByte((u16)(adr++));
1010  007f 1e01          	ldw	x,(OFST-2,sp)
1011  0081 5c            	incw	x
1012  0082 1f01          	ldw	(OFST-2,sp),x
1013  0084 5a            	decw	x
1014  0085 cd0000        	call	_FLASH_EraseByte
1016                     ; 342     for(i = 0; i < sizeof(Receivers); i++)
1018  0088 0c03          	inc	(OFST+0,sp)
1021  008a 7b03          	ld	a,(OFST+0,sp)
1022  008c a129          	cp	a,#41
1023  008e 25ef          	jrult	L323
1024                     ; 346     FLASH_Lock(FLASH_MemType_Program);
1026  0090 a6fd          	ld	a,#253
1027  0092 cd0000        	call	_FLASH_Lock
1029                     ; 347     flash_erase_timing_test = 2;
1031  0095 35020000      	mov	L14_flash_erase_timing_test,#2
1032                     ; 349     Errors_ResetError(ERROR_FLASH_ERASE);
1034  0099 a605          	ld	a,#5
1035  009b cd0000        	call	_Errors_ResetError
1037                     ; 350     adr = (u8*)&Receivers;
1039  009e ae0000        	ldw	x,#L5_Receivers
1040  00a1 1f01          	ldw	(OFST-2,sp),x
1041                     ; 351     for(i = 0; i < sizeof(Receivers); i++)
1043  00a3 0f03          	clr	(OFST+0,sp)
1044  00a5               L133:
1045                     ; 353       if(*(adr++))
1047  00a5 1e01          	ldw	x,(OFST-2,sp)
1048  00a7 5c            	incw	x
1049  00a8 1f01          	ldw	(OFST-2,sp),x
1050  00aa 5a            	decw	x
1051  00ab f6            	ld	a,(x)
1052  00ac 2707          	jreq	L733
1053                     ; 355         Errors_SetError(ERROR_FLASH_ERASE);
1055  00ae a605          	ld	a,#5
1056  00b0 cd0000        	call	_Errors_SetError
1058                     ; 356         break;
1060  00b3 2008          	jra	L533
1061  00b5               L733:
1062                     ; 351     for(i = 0; i < sizeof(Receivers); i++)
1064  00b5 0c03          	inc	(OFST+0,sp)
1067  00b7 7b03          	ld	a,(OFST+0,sp)
1068  00b9 a129          	cp	a,#41
1069  00bb 25e8          	jrult	L133
1070  00bd               L533:
1071                     ; 359     flash_erase_timing_test = 3;
1073  00bd 35030000      	mov	L14_flash_erase_timing_test,#3
1074                     ; 360     LED_OFF;
1078  00c1               LC007:
1080  00c1 7217500a      	bres	20490,#3
1082  00c5 7219500a      	bres	20490,#4
1083  00c9               L123:
1084                     ; 362   BTN1_press_timer = 0;
1086  00c9 5f            	clrw	x
1087  00ca bf00          	ldw	_BTN1_press_timer,x
1088                     ; 363 }
1091  00cc 5b03          	addw	sp,#3
1092  00ce 81            	ret	
1116                     ; 365 void TASK_1000ms()
1116                     ; 366 {
1117                     .text:	section	.text,new
1118  0000               _TASK_1000ms:
1122                     ; 367   task_1000ms_cnt++;
1124  0000 3c06          	inc	L53_task_1000ms_cnt
1125                     ; 368 }
1128  0002 81            	ret	
1152                     ; 370 void TASK_500ms()
1152                     ; 371 {
1153                     .text:	section	.text,new
1154  0000               _TASK_500ms:
1158                     ; 372   flash_erase_timing_test = 0;
1160  0000 3f00          	clr	L14_flash_erase_timing_test
1161                     ; 373 }
1164  0002 81            	ret	
1187                     ; 375 void TASK_250ms()
1187                     ; 376 {
1188                     .text:	section	.text,new
1189  0000               _TASK_250ms:
1193                     ; 378 }
1196  0000 81            	ret	
1490                     	xdef	_main
1491                     	xdef	_IsLearnedID
1492                     	xdef	_LearnNewID
1493                     	xdef	_BTN1_Released
1494                     	xdef	_TASK_250ms
1495                     	xdef	_TASK_500ms
1496                     	xdef	_TASK_1000ms
1497                     	switch	.ubsct
1498  0000               L14_flash_erase_timing_test:
1499  0000 00            	ds.b	1
1500  0001               L7_BtoDW:
1501  0001 00000000      	ds.b	4
1502                     .const:	section	.text
1503  0000               L5_Receivers:
1504  0000 000000000000  	ds.b	41
1505                     	xref	_Timeout_IsTimeout2
1506                     	xref	_Timeout_IsTimeout1
1507                     	xref	_Timeout_SetTimeout2
1508                     	xref	_Timeout_SetTimeout1
1509                     	xref.b	_RFbytesReady
1510                     	xref.b	_RcvRFmsg
1511                     	xbit	_flag_blink_unlimited
1512                     	xbit	_flag_blink_greenLED
1513                     	xbit	_flag_blink_redLED
1514                     	xbit	_flag_blink_on_off
1515                     	xref.b	_cnt_state_greenLED
1516                     	xref.b	_cnt_state_redLED
1517                     	xref.b	_blink_greenLED_times
1518                     	xref.b	_blink_redLED_times
1519                     	xbit	_FLAG_1000ms
1520                     	xbit	_FLAG_500ms
1521                     	xbit	_FLAG_250ms
1522                     	xref.b	_BTN1_press_timer
1523                     	xref.b	_BTN1_DEB_STATE
1524                     	xref	_Errors_IsError
1525                     	xref	_Errors_ResetError
1526                     	xref	_Errors_SetError
1527                     	xref	_Errors_Init
1528                     	xref	_Config
1529                     	xref	_RST_ClearFlag
1530                     	xref	_RST_GetFlagStatus
1531                     	xref	_IWDG_Enable
1532                     	xref	_IWDG_ReloadCounter
1533                     	xref	_IWDG_SetReload
1534                     	xref	_IWDG_SetPrescaler
1535                     	xref	_IWDG_WriteAccessCmd
1536                     	xref	_FLASH_EraseByte
1537                     	xref	_FLASH_ProgramByte
1538                     	xref	_FLASH_Lock
1539                     	xref	_FLASH_Unlock
1559                     	xref	c_lcmp
1560                     	xref	c_ltor
1561                     	end
