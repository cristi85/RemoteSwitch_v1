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
 112                     ; 120 void main(void)
 112                     ; 121 {
 114                     .text:	section	.text,new
 115  0000               _main:
 119                     ; 122   flash_erase_timing_test = 0;
 121  0000 3f14          	clr	L14_flash_erase_timing_test
 122                     ; 123   program_status = 1;
 124  0002 35010003      	mov	L52_program_status,#1
 125                     ; 124   disableInterrupts();
 128  0006 9b            	sim	
 130                     ; 125   Config();
 133  0007 cd0000        	call	_Config
 135                     ; 126   program_status = 2;
 137  000a 35020003      	mov	L52_program_status,#2
 138                     ; 127   Errors_Init();
 140  000e cd0000        	call	_Errors_Init
 142                     ; 128   RTMS_INIT(runtime_it_1ms);
 144  0011 aeffff        	ldw	x,#65535
 145  0014 bf0a          	ldw	_runtime_it_1ms,x
 148  0016 5f            	clrw	x
 149  0017 bf0c          	ldw	_runtime_it_1ms+2,x
 152  0019 bf0e          	ldw	_runtime_it_1ms+4,x
 155  001b bf12          	ldw	_runtime_it_1ms+8,x
 158  001d bf10          	ldw	_runtime_it_1ms+6,x
 159                     ; 129   RTMS_INIT(runtime_it_RFrcv);
 162  001f 5a            	decw	x
 163  0020 bf00          	ldw	_runtime_it_RFrcv,x
 166  0022 5f            	clrw	x
 167  0023 bf02          	ldw	_runtime_it_RFrcv+2,x
 170  0025 bf04          	ldw	_runtime_it_RFrcv+4,x
 173  0027 bf08          	ldw	_runtime_it_RFrcv+8,x
 176  0029 bf06          	ldw	_runtime_it_RFrcv+6,x
 177                     ; 130   enableInterrupts();
 181  002b 9a            	rim	
 183                     ; 131   LED_GREEN_ON;
 186  002c 7217500a      	bres	20490,#3
 189  0030 7218500a      	bset	20490,#4
 190                     ; 133   Timeout_SetTimeout2(200);
 193  0034 ae00c8        	ldw	x,#200
 194  0037 cd0000        	call	_Timeout_SetTimeout2
 197  003a               L501:
 198                     ; 134   while(!Timeout_IsTimeout2());
 200  003a cd0000        	call	_Timeout_IsTimeout2
 202  003d 4d            	tnz	a
 203  003e 27fa          	jreq	L501
 204                     ; 135   LED_OFF;
 206  0040 7217500a      	bres	20490,#3
 209  0044 7219500a      	bres	20490,#4
 210                     ; 136   program_status = 3;
 213  0048 35030003      	mov	L52_program_status,#3
 214                     ; 137   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 216  004c a602          	ld	a,#2
 217  004e cd0000        	call	_RST_GetFlagStatus
 219  0051 4d            	tnz	a
 220  0052 2706          	jreq	L111
 221                     ; 139     BLINK_REDLED(1);
 223  0054 35010000      	mov	_blink_redLED_times,#1
 233  0058 200c          	jp	LC001
 234  005a               L111:
 235                     ; 141   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 237  005a a604          	ld	a,#4
 238  005c cd0000        	call	_RST_GetFlagStatus
 240  005f 4d            	tnz	a
 241  0060 270b          	jreq	L311
 242                     ; 143     BLINK_REDLED(2);
 244  0062 35020000      	mov	_blink_redLED_times,#2
 258  0066               LC001:
 260  0066 72110000      	bres	_flag_blink_unlimited
 263  006a cd019d        	call	LC004
 265  006d               L311:
 266                     ; 145   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 268  006d a60f          	ld	a,#15
 269  006f cd0000        	call	_RST_ClearFlag
 272  0072               L121:
 273                     ; 146   while(ISBLINKING_REDLED);
 275  0072 72000000fb    	btjt	_flag_blink_redLED,L121
 276                     ; 147   program_status = 4;
 278  0077 35040003      	mov	L52_program_status,#4
 279                     ; 148   HBRIDGE_OFF;
 281  007b cd0187        	call	LC003
 283                     ; 151   IWDG_Enable();
 285  007e cd0000        	call	_IWDG_Enable
 287                     ; 152   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 289  0081 a655          	ld	a,#85
 290  0083 cd0000        	call	_IWDG_WriteAccessCmd
 292                     ; 153   IWDG_SetPrescaler(IWDG_Prescaler_64);  /* 431.15ms for RL[7:0]= 0xFF */
 294  0086 a604          	ld	a,#4
 295  0088 cd0000        	call	_IWDG_SetPrescaler
 297                     ; 154   IWDG_SetReload(0xFF);
 299  008b a6ff          	ld	a,#255
 300  008d cd0000        	call	_IWDG_SetReload
 302                     ; 155   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 304  0090 4f            	clr	a
 305  0091 cd0000        	call	_IWDG_WriteAccessCmd
 307                     ; 156   IWDG_ReloadCounter();
 309  0094 cd0000        	call	_IWDG_ReloadCounter
 311                     ; 157   program_status = 5;
 313  0097 35050003      	mov	L52_program_status,#5
 314  009b               L521:
 315                     ; 160     switch(state)
 317  009b b602          	ld	a,L32_state
 319                     ; 241       default: break;
 320  009d 2603cc014c    	jreq	LC002
 321  00a2 4a            	dec	a
 322  00a3 2713          	jreq	L54
 323  00a5 a002          	sub	a,#2
 324  00a7 274b          	jreq	L74
 325  00a9 4a            	dec	a
 326  00aa 2603cc012c    	jreq	L75
 327  00af 4a            	dec	a
 328  00b0 2603cc0138    	jreq	L16
 329  00b5 cc0150        	jra	L331
 330                     ; 164         state = ST_WAIT_INPUT_OR_FLAG;
 331                     ; 165         break;
 333  00b8               L54:
 334                     ; 169         if(RFbytesReady)
 336  00b8 3d00          	tnz	_RFbytesReady
 337  00ba 2706          	jreq	L531
 338                     ; 171           RFbytesReady = FALSE;
 340  00bc b700          	ld	_RFbytesReady,a
 341                     ; 172           state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 343  00be 35040002      	mov	L32_state,#4
 344  00c2               L531:
 345                     ; 174         if(FLAG_500ms)
 347  00c2 7201000007    	btjf	_FLAG_500ms,L731
 348                     ; 176           FLAG_500ms = FALSE;
 350  00c7 72110000      	bres	_FLAG_500ms
 351                     ; 177           TASK_500ms();
 353  00cb cd0000        	call	_TASK_500ms
 355  00ce               L731:
 356                     ; 179         if(FLAG_1000ms)
 358  00ce 7201000004    	btjf	_FLAG_1000ms,L141
 359                     ; 181           FLAG_1000ms = FALSE;
 361  00d3 72110000      	bres	_FLAG_1000ms
 362  00d7               L141:
 363                     ; 184         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 365  00d7 b600          	ld	a,_BTN1_DEB_STATE
 366  00d9 4a            	dec	a
 367  00da 2609          	jrne	L341
 369  00dc 7200000104    	btjt	L31_FLAG_BTN1_lock,L341
 370                     ; 186           FLAG_BTN1_lock = TRUE;
 372  00e1 72100001      	bset	L31_FLAG_BTN1_lock
 373  00e5               L341:
 374                     ; 188         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 376  00e5 b600          	ld	a,_BTN1_DEB_STATE
 377  00e7 2667          	jrne	L331
 379  00e9 7201000162    	btjf	L31_FLAG_BTN1_lock,L331
 380                     ; 190           FLAG_BTN1_lock = FALSE;
 382  00ee 72110001      	bres	L31_FLAG_BTN1_lock
 383  00f2 205c          	jra	L331
 384  00f4               L74:
 385                     ; 199         LED_GREEN_ON;
 387  00f4 7217500a      	bres	20490,#3
 390  00f8 7218500a      	bset	20490,#4
 391                     ; 200         switch(RcvRFmsg.RFmsgmember.RFcmd)
 394  00fc b603          	ld	a,_RcvRFmsg+3
 396                     ; 214           default: break;
 397  00fe a00f          	sub	a,#15
 398  0100 2706          	jreq	L15
 399  0102 a0e1          	sub	a,#225
 400  0104 2710          	jreq	L35
 401  0106 2018          	jra	L151
 402  0108               L15:
 403                     ; 204             LIGHT_ON;
 405  0108 72155005      	bres	20485,#2
 408  010c 72105005      	bset	20485,#0
 409                     ; 205             LightState = LIGHTSTATE_ON;
 412  0110 35010000      	mov	L3_LightState,#1
 413                     ; 206             break;
 415  0114 200a          	jra	L151
 416  0116               L35:
 417                     ; 210             LIGHT_OFF;
 419  0116 7211500f      	bres	20495,#0
 422  011a 7214500a      	bset	20490,#2
 423                     ; 211             LightState = LIGHTSTATE_OFF;
 426  011e b700          	ld	L3_LightState,a
 427                     ; 212             break;
 429                     ; 214           default: break;
 431  0120               L151:
 432                     ; 217         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 434  0120 ae0064        	ldw	x,#100
 435  0123 cd0000        	call	_Timeout_SetTimeout1
 437                     ; 218         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 439  0126 35050002      	mov	L32_state,#5
 440                     ; 219         break;
 442  012a 2024          	jra	L331
 443  012c               L75:
 444                     ; 223         if(Timeout_IsTimeout1())
 446  012c cd0000        	call	_Timeout_IsTimeout1
 448  012f 4d            	tnz	a
 449  0130 271e          	jreq	L331
 450                     ; 225           state = ST_SWITCH_LIGHT;
 452  0132 35030002      	mov	L32_state,#3
 453  0136 2018          	jra	L331
 454  0138               L16:
 455                     ; 231         if(Timeout_IsTimeout1())
 457  0138 cd0000        	call	_Timeout_IsTimeout1
 459  013b 4d            	tnz	a
 460  013c 2712          	jreq	L331
 461                     ; 233           HBRIDGE_OFF;
 463  013e ad47          	call	LC003
 465                     ; 236           BLINKSTOP_GREENLED;
 467  0140 72110000      	bres	_flag_blink_greenLED
 470  0144 7217500a      	bres	20490,#3
 473  0148 7219500a      	bres	20490,#4
 474                     ; 237           state = ST_WAIT_INPUT_OR_FLAG;
 478  014c               LC002:
 480  014c 35010002      	mov	L32_state,#1
 481                     ; 241       default: break;
 483  0150               L331:
 484                     ; 243     IWDG_ReloadCounter();
 486  0150 cd0000        	call	_IWDG_ReloadCounter
 488                     ; 244     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 490  0153 cd0000        	call	_Errors_IsError
 492  0156 4d            	tnz	a
 493  0157 2716          	jreq	L751
 495  0159 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L751
 496                     ; 246       BLINK_REDLED(255);
 498  015e 35ff0000      	mov	_blink_redLED_times,#255
 501  0162 72100000      	bset	_flag_blink_unlimited
 506  0166 ad35          	call	LC004
 507                     ; 247       FLAG_reset_LEDblink_error = TRUE;
 510  0168 72100002      	bset	L51_FLAG_reset_LEDblink_error
 512  016c cc009b        	jra	L521
 513  016f               L751:
 514                     ; 251       if(FLAG_reset_LEDblink_error)
 516  016f 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L521
 517                     ; 253         BLINKSTOP_REDLED;
 519  0174 72110000      	bres	_flag_blink_redLED
 522  0178 7217500a      	bres	20490,#3
 525  017c 7219500a      	bres	20490,#4
 526                     ; 254         FLAG_reset_LEDblink_error = FALSE;
 530  0180 72110002      	bres	L51_FLAG_reset_LEDblink_error
 531  0184 cc009b        	jra	L521
 532  0187               LC003:
 533  0187 7210500f      	bset	20495,#0
 534                     ; 148   HBRIDGE_OFF;
 536  018b 72145005      	bset	20485,#2
 539  018f 72115005      	bres	20485,#0
 542  0193 7215500a      	bres	20490,#2
 543                     ; 149   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 546  0197 ae03e8        	ldw	x,#1000
 547  019a cc0000        	jp	_Timeout_SetTimeout1
 548  019d               LC004:
 549  019d 5f            	clrw	x
 550  019e 72100000      	bset	_flag_blink_on_off
 551  01a2 bf00          	ldw	_cnt_state_redLED,x
 553  01a4 7216500a      	bset	20490,#3
 555  01a8 7219500a      	bres	20490,#4
 557  01ac 72100000      	bset	_flag_blink_redLED
 558  01b0 81            	ret	
 605                     ; 260 _Bool IsLearnedID()
 605                     ; 261 {
 606                     .text:	section	.text,new
 607  0000               _IsLearnedID:
 609  0000 89            	pushw	x
 610       00000002      OFST:	set	2
 613                     ; 263   _Bool flag_IDfound = FALSE;
 615  0001 0f01          	clr	(OFST-1,sp)
 616                     ; 264   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 618  0003 0f02          	clr	(OFST+0,sp)
 620  0005 2020          	jra	L312
 621  0007               L702:
 622                     ; 266     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 624  0007 97            	ld	xl,a
 625  0008 a604          	ld	a,#4
 626  000a 42            	mul	x,a
 627  000b 1c0000        	addw	x,#L5_Receivers
 628  000e cd0000        	call	c_ltor
 630  0011 ae0015        	ldw	x,#L7_BtoDW
 631  0014 cd0000        	call	c_lcmp
 633  0017 260c          	jrne	L712
 634                     ; 268       flag_IDfound = TRUE;
 636  0019 a601          	ld	a,#1
 637  001b 6b01          	ld	(OFST-1,sp),a
 638                     ; 269       break;
 639  001d               L512:
 640                     ; 272   return flag_IDfound;
 642  001d 7b01          	ld	a,(OFST-1,sp)
 643  001f 2702          	jreq	L26
 644  0021 a601          	ld	a,#1
 645  0023               L26:
 648  0023 85            	popw	x
 649  0024 81            	ret	
 650  0025               L712:
 651                     ; 264   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 653  0025 0c02          	inc	(OFST+0,sp)
 654  0027               L312:
 657  0027 7b02          	ld	a,(OFST+0,sp)
 658  0029 c10028        	cp	a,L5_Receivers+40
 659  002c 25d9          	jrult	L702
 660  002e 20ed          	jra	L512
 712                     ; 275 void LearnNewID()
 712                     ; 276 {
 713                     .text:	section	.text,new
 714  0000               _LearnNewID:
 716  0000 89            	pushw	x
 717       00000002      OFST:	set	2
 720                     ; 279   _Bool flag_IDfound = FALSE;
 722  0001 0f01          	clr	(OFST-1,sp)
 723                     ; 280   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 725  0003 0f02          	clr	(OFST+0,sp)
 727  0005 2068          	jra	L742
 728  0007               L342:
 729                     ; 282     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 731  0007 97            	ld	xl,a
 732  0008 a604          	ld	a,#4
 733  000a 42            	mul	x,a
 734  000b cd0092        	call	LC006
 736  000e 265d          	jrne	L352
 737                     ; 284       flag_IDfound = TRUE;
 739  0010 a601          	ld	a,#1
 740  0012 6b01          	ld	(OFST-1,sp),a
 741                     ; 285       break;
 742  0014               L152:
 743                     ; 288   if(!flag_IDfound)
 745  0014 7b01          	ld	a,(OFST-1,sp)
 746  0016 2660          	jrne	L552
 747                     ; 291     FLASH_Unlock(FLASH_MemType_Program);
 749  0018 a6fd          	ld	a,#253
 750  001a cd0000        	call	_FLASH_Unlock
 752                     ; 292     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)BtoDW.B.b0 );
 754  001d 3b0015        	push	L7_BtoDW
 755  0020 ad68          	call	LC005
 756  0022 1c0000        	addw	x,#L5_Receivers
 757  0025 cd0000        	call	_FLASH_ProgramByte
 759  0028 84            	pop	a
 760                     ; 293     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)BtoDW.B.b1 );
 762  0029 3b0016        	push	L7_BtoDW+1
 763  002c ad5c          	call	LC005
 764  002e 1c0001        	addw	x,#L5_Receivers+1
 765  0031 cd0000        	call	_FLASH_ProgramByte
 767  0034 84            	pop	a
 768                     ; 294     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)BtoDW.B.b2 );
 770  0035 3b0017        	push	L7_BtoDW+2
 771  0038 ad50          	call	LC005
 772  003a 1c0002        	addw	x,#L5_Receivers+2
 773  003d cd0000        	call	_FLASH_ProgramByte
 775  0040 84            	pop	a
 776                     ; 295     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)BtoDW.B.b3 );
 778  0041 3b0018        	push	L7_BtoDW+3
 779  0044 ad44          	call	LC005
 780  0046 1c0003        	addw	x,#L5_Receivers+3
 781  0049 cd0000        	call	_FLASH_ProgramByte
 783  004c 84            	pop	a
 784                     ; 296     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
 786  004d c60028        	ld	a,L5_Receivers+40
 787  0050 4c            	inc	a
 788  0051 88            	push	a
 789  0052 ae0028        	ldw	x,#L5_Receivers+40
 790  0055 cd0000        	call	_FLASH_ProgramByte
 792  0058 84            	pop	a
 793                     ; 297     FLASH_Lock(FLASH_MemType_Program);
 795  0059 a6fd          	ld	a,#253
 796  005b cd0000        	call	_FLASH_Lock
 798                     ; 299     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 800  005e ad2a          	call	LC005
 801  0060 1d0004        	subw	x,#4
 802  0063 ad2d          	call	LC006
 804  0065 2711          	jreq	L552
 805                     ; 301       Errors_SetError(ERROR_FLASH_WRITE);
 807  0067 4f            	clr	a
 808  0068 cd0000        	call	_Errors_SetError
 810  006b 200b          	jra	L552
 811  006d               L352:
 812                     ; 280   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 814  006d 0c02          	inc	(OFST+0,sp)
 815  006f               L742:
 818  006f 7b02          	ld	a,(OFST+0,sp)
 819  0071 c10028        	cp	a,L5_Receivers+40
 820  0074 2591          	jrult	L342
 821  0076 209c          	jra	L152
 822  0078               L552:
 823                     ; 304   LrnModeActive = FALSE;
 825  0078 72110000      	bres	L11_LrnModeActive
 826                     ; 305   BLINKSTOP_GREENLED;
 828  007c 72110000      	bres	_flag_blink_greenLED
 831  0080 7217500a      	bres	20490,#3
 834  0084 7219500a      	bres	20490,#4
 835                     ; 306 }
 840  0088 85            	popw	x
 841  0089 81            	ret	
 842  008a               LC005:
 843  008a c60028        	ld	a,L5_Receivers+40
 844  008d 97            	ld	xl,a
 845  008e a604          	ld	a,#4
 846  0090 42            	mul	x,a
 847  0091 81            	ret	
 848  0092               LC006:
 849  0092 1c0000        	addw	x,#L5_Receivers
 850  0095 cd0000        	call	c_ltor
 852  0098 ae0015        	ldw	x,#L7_BtoDW
 853  009b cc0000        	jp	c_lcmp
 915                     ; 308 void BTN1_Released()
 915                     ; 309 {
 916                     .text:	section	.text,new
 917  0000               _BTN1_Released:
 919  0000 5203          	subw	sp,#3
 920       00000003      OFST:	set	3
 923                     ; 310   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 925  0002 be00          	ldw	x,_BTN1_press_timer
 926  0004 a30bb8        	cpw	x,#3000
 927  0007 245e          	jruge	L303
 928                     ; 313     if(!Errors_IsError())
 930  0009 cd0000        	call	_Errors_IsError
 932  000c 4d            	tnz	a
 933  000d 2703cc00c9    	jrne	L713
 934                     ; 315       if(!LrnModeActive)
 936  0012 7200000046    	btjt	L11_LrnModeActive,L703
 937                     ; 317         if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
 939  0017 c60028        	ld	a,L5_Receivers+40
 940  001a a10a          	cp	a,#10
 941  001c 2422          	jruge	L113
 942                     ; 319           LrnModeActive = TRUE;
 944  001e 72100000      	bset	L11_LrnModeActive
 945                     ; 320           BLINK_GREENLED(255);
 947  0022 35ff0000      	mov	_blink_greenLED_times,#255
 950  0026 72100000      	bset	_flag_blink_unlimited
 955  002a 5f            	clrw	x
 956  002b 72100000      	bset	_flag_blink_on_off
 957  002f bf00          	ldw	_cnt_state_greenLED,x
 960  0031 7217500a      	bres	20490,#3
 963  0035 7218500a      	bset	20490,#4
 967  0039 72100000      	bset	_flag_blink_greenLED
 970  003d cc00c9        	jra	L713
 971  0040               L113:
 972                     ; 324           BLINK_REDLED(2);
 974  0040 35020000      	mov	_blink_redLED_times,#2
 977  0044 72110000      	bres	_flag_blink_unlimited
 982  0048 5f            	clrw	x
 983  0049 72100000      	bset	_flag_blink_on_off
 984  004d bf00          	ldw	_cnt_state_redLED,x
 987  004f 7216500a      	bset	20490,#3
 990  0053 7219500a      	bres	20490,#4
 994  0057 72100000      	bset	_flag_blink_redLED
 996  005b 206c          	jra	L713
 997  005d               L703:
 998                     ; 329         LrnModeActive = FALSE;
1000  005d 72110000      	bres	L11_LrnModeActive
1001                     ; 330         BLINKSTOP_GREENLED;
1003  0061 72110000      	bres	_flag_blink_greenLED
1008  0065 205a          	jp	LC007
1009  0067               L303:
1010                     ; 339     LED_RED_ON;
1012  0067 7216500a      	bset	20490,#3
1015  006b 7219500a      	bres	20490,#4
1016                     ; 340     flash_erase_timing_test = 1;
1019  006f 35010014      	mov	L14_flash_erase_timing_test,#1
1020                     ; 341     FLASH_Unlock(FLASH_MemType_Program);
1022  0073 a6fd          	ld	a,#253
1023  0075 cd0000        	call	_FLASH_Unlock
1025                     ; 342     adr = (u8*)&Receivers;
1027  0078 ae0000        	ldw	x,#L5_Receivers
1028  007b 1f01          	ldw	(OFST-2,sp),x
1029                     ; 343     for(i = 0; i < sizeof(Receivers); i++)
1031  007d 0f03          	clr	(OFST+0,sp)
1032  007f               L123:
1033                     ; 345       FLASH_EraseByte((u16)(adr++));
1035  007f 1e01          	ldw	x,(OFST-2,sp)
1036  0081 5c            	incw	x
1037  0082 1f01          	ldw	(OFST-2,sp),x
1038  0084 5a            	decw	x
1039  0085 cd0000        	call	_FLASH_EraseByte
1041                     ; 343     for(i = 0; i < sizeof(Receivers); i++)
1043  0088 0c03          	inc	(OFST+0,sp)
1046  008a 7b03          	ld	a,(OFST+0,sp)
1047  008c a129          	cp	a,#41
1048  008e 25ef          	jrult	L123
1049                     ; 347     FLASH_Lock(FLASH_MemType_Program);
1051  0090 a6fd          	ld	a,#253
1052  0092 cd0000        	call	_FLASH_Lock
1054                     ; 348     flash_erase_timing_test = 2;
1056  0095 35020014      	mov	L14_flash_erase_timing_test,#2
1057                     ; 350     Errors_ResetError(ERROR_FLASH_ERASE);
1059  0099 a601          	ld	a,#1
1060  009b cd0000        	call	_Errors_ResetError
1062                     ; 351     adr = (u8*)&Receivers;
1064  009e ae0000        	ldw	x,#L5_Receivers
1065  00a1 1f01          	ldw	(OFST-2,sp),x
1066                     ; 352     for(i = 0; i < sizeof(Receivers); i++)
1068  00a3 0f03          	clr	(OFST+0,sp)
1069  00a5               L723:
1070                     ; 354       if(*(adr++))
1072  00a5 1e01          	ldw	x,(OFST-2,sp)
1073  00a7 5c            	incw	x
1074  00a8 1f01          	ldw	(OFST-2,sp),x
1075  00aa 5a            	decw	x
1076  00ab f6            	ld	a,(x)
1077  00ac 2707          	jreq	L533
1078                     ; 356         Errors_SetError(ERROR_FLASH_ERASE);
1080  00ae a601          	ld	a,#1
1081  00b0 cd0000        	call	_Errors_SetError
1083                     ; 357         break;
1085  00b3 2008          	jra	L333
1086  00b5               L533:
1087                     ; 352     for(i = 0; i < sizeof(Receivers); i++)
1089  00b5 0c03          	inc	(OFST+0,sp)
1092  00b7 7b03          	ld	a,(OFST+0,sp)
1093  00b9 a129          	cp	a,#41
1094  00bb 25e8          	jrult	L723
1095  00bd               L333:
1096                     ; 360     flash_erase_timing_test = 3;
1098  00bd 35030014      	mov	L14_flash_erase_timing_test,#3
1099                     ; 361     LED_OFF;
1103  00c1               LC007:
1105  00c1 7217500a      	bres	20490,#3
1107  00c5 7219500a      	bres	20490,#4
1108  00c9               L713:
1109                     ; 363   BTN1_press_timer = 0;
1111  00c9 5f            	clrw	x
1112  00ca bf00          	ldw	_BTN1_press_timer,x
1113                     ; 364 }
1116  00cc 5b03          	addw	sp,#3
1117  00ce 81            	ret	
1141                     ; 366 void TASK_1000ms()
1141                     ; 367 {
1142                     .text:	section	.text,new
1143  0000               _TASK_1000ms:
1147                     ; 368   task_1000ms_cnt++;
1149  0000 3c06          	inc	L53_task_1000ms_cnt
1150                     ; 369 }
1153  0002 81            	ret	
1177                     ; 371 void TASK_500ms()
1177                     ; 372 {
1178                     .text:	section	.text,new
1179  0000               _TASK_500ms:
1183                     ; 373   flash_erase_timing_test = 0;
1185  0000 3f14          	clr	L14_flash_erase_timing_test
1186                     ; 374 }
1189  0002 81            	ret	
1545                     	xdef	_main
1546                     	switch	.ubsct
1547  0000               _runtime_it_RFrcv:
1548  0000 000000000000  	ds.b	10
1549                     	xdef	_runtime_it_RFrcv
1550  000a               _runtime_it_1ms:
1551  000a 000000000000  	ds.b	10
1552                     	xdef	_runtime_it_1ms
1553                     	xdef	_IsLearnedID
1554                     	xdef	_LearnNewID
1555                     	xdef	_BTN1_Released
1556                     	xdef	_TASK_500ms
1557                     	xdef	_TASK_1000ms
1558  0014               L14_flash_erase_timing_test:
1559  0014 00            	ds.b	1
1560  0015               L7_BtoDW:
1561  0015 00000000      	ds.b	4
1562                     .const:	section	.text
1563  0000               L5_Receivers:
1564  0000 000000000000  	ds.b	41
1565                     	xref	_Timeout_IsTimeout2
1566                     	xref	_Timeout_IsTimeout1
1567                     	xref	_Timeout_SetTimeout2
1568                     	xref	_Timeout_SetTimeout1
1569                     	xref.b	_RFbytesReady
1570                     	xref.b	_RcvRFmsg
1571                     	xbit	_flag_blink_unlimited
1572                     	xbit	_flag_blink_greenLED
1573                     	xbit	_flag_blink_redLED
1574                     	xbit	_flag_blink_on_off
1575                     	xref.b	_cnt_state_greenLED
1576                     	xref.b	_cnt_state_redLED
1577                     	xref.b	_blink_greenLED_times
1578                     	xref.b	_blink_redLED_times
1579                     	xbit	_FLAG_1000ms
1580                     	xbit	_FLAG_500ms
1581                     	xref.b	_BTN1_press_timer
1582                     	xref.b	_BTN1_DEB_STATE
1583                     	xref	_Errors_IsError
1584                     	xref	_Errors_ResetError
1585                     	xref	_Errors_SetError
1586                     	xref	_Errors_Init
1587                     	xref	_Config
1588                     	xref	_RST_ClearFlag
1589                     	xref	_RST_GetFlagStatus
1590                     	xref	_IWDG_Enable
1591                     	xref	_IWDG_ReloadCounter
1592                     	xref	_IWDG_SetReload
1593                     	xref	_IWDG_SetPrescaler
1594                     	xref	_IWDG_WriteAccessCmd
1595                     	xref	_FLASH_EraseByte
1596                     	xref	_FLASH_ProgramByte
1597                     	xref	_FLASH_Lock
1598                     	xref	_FLASH_Unlock
1618                     	xref	c_lcmp
1619                     	xref	c_ltor
1620                     	end
