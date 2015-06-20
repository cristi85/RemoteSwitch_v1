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
  48                     .const:	section	.text
  49  0000               L34_address:
  50  0000 f7            	dc.b	247
  51  0001 ef            	dc.b	239
  52  0002 8d            	dc.b	141
  53  0003 91            	dc.b	145
  54  0004 6c            	dc.b	108
 143                     ; 119 void main(void)
 143                     ; 120 {
 145                     .text:	section	.text,new
 146  0000               _main:
 148  0000 88            	push	a
 149       00000001      OFST:	set	1
 152                     ; 121   flash_erase_timing_test = 0;
 154  0001 3f00          	clr	L14_flash_erase_timing_test
 155                     ; 122   program_status = 1;
 157  0003 35010003      	mov	L52_program_status,#1
 158                     ; 123   disableInterrupts();
 161  0007 9b            	sim	
 163                     ; 124   Config();
 166  0008 cd0000        	call	_Config
 168                     ; 125   program_status = 2;
 170  000b 35020003      	mov	L52_program_status,#2
 171                     ; 126   Errors_Init();
 173  000f cd0000        	call	_Errors_Init
 175                     ; 127   enableInterrupts();
 178  0012 9a            	rim	
 180                     ; 128   LED_GREEN_ON;
 183  0013 7217500a      	bres	20490,#3
 186  0017 7218500a      	bset	20490,#4
 187                     ; 130   Timeout_SetTimeout2(200);
 190  001b ae00c8        	ldw	x,#200
 191  001e cd0000        	call	_Timeout_SetTimeout2
 194  0021               L311:
 195                     ; 131   while(!Timeout_IsTimeout2());
 197  0021 cd0000        	call	_Timeout_IsTimeout2
 199  0024 4d            	tnz	a
 200  0025 27fa          	jreq	L311
 201                     ; 132   LED_OFF;
 203  0027 7217500a      	bres	20490,#3
 206  002b 7219500a      	bres	20490,#4
 207                     ; 133   program_status = 3;
 210  002f 35030003      	mov	L52_program_status,#3
 211                     ; 134   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 213  0033 a602          	ld	a,#2
 214  0035 cd0000        	call	_RST_GetFlagStatus
 216  0038 4d            	tnz	a
 217  0039 2706          	jreq	L711
 218                     ; 136     BLINK_REDLED(1);
 220  003b 35010000      	mov	_blink_redLED_times,#1
 230  003f 200c          	jp	LC001
 231  0041               L711:
 232                     ; 138   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 234  0041 a604          	ld	a,#4
 235  0043 cd0000        	call	_RST_GetFlagStatus
 237  0046 4d            	tnz	a
 238  0047 270b          	jreq	L121
 239                     ; 140     BLINK_REDLED(2);
 241  0049 35020000      	mov	_blink_redLED_times,#2
 255  004d               LC001:
 257  004d 72110000      	bres	_flag_blink_unlimited
 260  0051 cd0224        	call	LC004
 262  0054               L121:
 263                     ; 142   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 265  0054 a60f          	ld	a,#15
 266  0056 cd0000        	call	_RST_ClearFlag
 269  0059               L721:
 270                     ; 143   while(ISBLINKING_REDLED);
 272  0059 72000000fb    	btjt	_flag_blink_redLED,L721
 273                     ; 144   program_status = 4;
 275  005e 35040003      	mov	L52_program_status,#4
 276                     ; 145   HBRIDGE_OFF;
 278  0062 cd020e        	call	LC003
 280                     ; 148   radio_sb_init (address, HAL_NRF_PRX);
 282  0065 4b01          	push	#1
 283  0067 ae0000        	ldw	x,#L34_address
 284  006a cd0000        	call	_radio_sb_init
 286  006d 72165005      	bset	20485,#3
 287  0071 84            	pop	a
 288                     ; 149   CE_HIGH();  // Set Chip Enable (CE) pin high to enable reciever
 290                     ; 152   IWDG_Enable();
 292  0072 cd0000        	call	_IWDG_Enable
 294                     ; 153   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 296  0075 a655          	ld	a,#85
 297  0077 cd0000        	call	_IWDG_WriteAccessCmd
 299                     ; 154   IWDG_SetPrescaler(IWDG_Prescaler_64);  /* 431.15ms for RL[7:0]= 0xFF */
 301  007a a604          	ld	a,#4
 302  007c cd0000        	call	_IWDG_SetPrescaler
 304                     ; 155   IWDG_SetReload(0xFF);
 306  007f a6ff          	ld	a,#255
 307  0081 cd0000        	call	_IWDG_SetReload
 309                     ; 156   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 311  0084 4f            	clr	a
 312  0085 cd0000        	call	_IWDG_WriteAccessCmd
 314                     ; 157   IWDG_ReloadCounter();
 316  0088 cd0000        	call	_IWDG_ReloadCounter
 318                     ; 158   program_status = 5;
 320  008b 35050003      	mov	L52_program_status,#5
 321  008f               L331:
 322                     ; 161     switch(state)
 324  008f b602          	ld	a,L32_state
 326                     ; 293       default: break;
 327  0091 2603cc01d3    	jreq	LC002
 328  0096 4a            	dec	a
 329  0097 271b          	jreq	L15
 330  0099 4a            	dec	a
 331  009a 2603cc012a    	jreq	L35
 332  009f 4a            	dec	a
 333  00a0 2603cc015b    	jreq	L55
 334  00a5 4a            	dec	a
 335  00a6 2603cc01b3    	jreq	L75
 336  00ab 4a            	dec	a
 337  00ac 2603cc01bf    	jreq	L16
 338  00b1 cc01d7        	jra	L141
 339                     ; 165         state = ST_WAIT_INPUT_OR_FLAG;
 340                     ; 166         break;
 342  00b4               L15:
 343                     ; 170         if(FLAG_250ms)
 345  00b4 7201000007    	btjf	_FLAG_250ms,L341
 346                     ; 172           FLAG_250ms = FALSE;
 348  00b9 72110000      	bres	_FLAG_250ms
 349                     ; 173           TASK_250ms();
 351  00bd cd0000        	call	_TASK_250ms
 353  00c0               L341:
 354                     ; 175         if(FLAG_500ms)
 356  00c0 7201000007    	btjf	_FLAG_500ms,L541
 357                     ; 177           FLAG_500ms = FALSE;
 359  00c5 72110000      	bres	_FLAG_500ms
 360                     ; 178           TASK_500ms();
 362  00c9 cd0000        	call	_TASK_500ms
 364  00cc               L541:
 365                     ; 180         if(FLAG_1000ms)
 367  00cc 7201000004    	btjf	_FLAG_1000ms,L741
 368                     ; 182           FLAG_1000ms = FALSE;
 370  00d1 72110000      	bres	_FLAG_1000ms
 371  00d5               L741:
 372                     ; 186         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 374  00d5 b600          	ld	a,_BTN1_DEB_STATE
 375  00d7 4a            	dec	a
 376  00d8 2609          	jrne	L151
 378  00da 7200000104    	btjt	L31_FLAG_BTN1_lock,L151
 379                     ; 188           FLAG_BTN1_lock = TRUE;
 381  00df 72100001      	bset	L31_FLAG_BTN1_lock
 382  00e3               L151:
 383                     ; 190         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 385  00e3 b600          	ld	a,_BTN1_DEB_STATE
 386  00e5 260c          	jrne	L351
 388  00e7 7201000107    	btjf	L31_FLAG_BTN1_lock,L351
 389                     ; 192           FLAG_BTN1_lock = FALSE;
 391  00ec 72110001      	bres	L31_FLAG_BTN1_lock
 392                     ; 193           BTN1_Released();
 394  00f0 cd0000        	call	_BTN1_Released
 396  00f3               L351:
 397                     ; 196         if (!NRF_IRQ_STATE)                         // Check if an interupt is
 399  00f3 c65006        	ld	a,20486
 400  00f6 a410          	and	a,#16
 401  00f8 5f            	clrw	x
 402  00f9 02            	rlwa	x,a
 403  00fa 5d            	tnzw	x
 404  00fb 26b4          	jrne	L141
 405                     ; 199           Timeout_SetTimeout2(20);  // wait here for the other two data packets to be stored in the RX FIFO
 407  00fd ae0014        	ldw	x,#20
 408  0100 cd0000        	call	_Timeout_SetTimeout2
 411  0103               L161:
 412                     ; 200           while(!Timeout_IsTimeout2());
 414  0103 cd0000        	call	_Timeout_IsTimeout2
 416  0106 4d            	tnz	a
 417  0107 27fa          	jreq	L161
 418                     ; 202           radio_irq ();  // read RX FIFO and flush it
 420  0109 cd0000        	call	_radio_irq
 422                     ; 203           if ((radio_get_status ()) == RF_RX_DR)
 424  010c cd0000        	call	_radio_get_status
 426  010f a103          	cp	a,#3
 427  0111 269e          	jrne	L141
 428                     ; 205             if(Timeout_IsTimeout3())
 430  0113 cd0000        	call	_Timeout_IsTimeout3
 432  0116 4d            	tnz	a
 433  0117 2798          	jreq	L141
 434                     ; 208               radio_set_status(RF_IDLE);
 436  0119 4f            	clr	a
 437  011a cd0000        	call	_radio_set_status
 439                     ; 209               Timeout_SetTimeout3(1200);  // set timeout for two consecutive user commands
 441  011d ae04b0        	ldw	x,#1200
 442  0120 cd0000        	call	_Timeout_SetTimeout3
 444                     ; 210               state = ST_NRF_RCVD_DATA;
 446  0123 35020002      	mov	L32_state,#2
 448  0127 cc01d7        	jra	L141
 449  012a               L35:
 450                     ; 223         BtoDW.B.b0 = radio_get_pload_byte(0);  // convert 4 bytes to u32
 452  012a cd0000        	call	_radio_get_pload_byte
 454  012d b701          	ld	L7_BtoDW,a
 455                     ; 224         BtoDW.B.b1 = radio_get_pload_byte(1);
 457  012f a601          	ld	a,#1
 458  0131 cd0000        	call	_radio_get_pload_byte
 460  0134 b702          	ld	L7_BtoDW+1,a
 461                     ; 225         BtoDW.B.b2 = radio_get_pload_byte(2);
 463  0136 a602          	ld	a,#2
 464  0138 cd0000        	call	_radio_get_pload_byte
 466  013b b703          	ld	L7_BtoDW+2,a
 467                     ; 226         BtoDW.B.b3 = radio_get_pload_byte(3);
 469  013d a603          	ld	a,#3
 470  013f cd0000        	call	_radio_get_pload_byte
 472  0142 b704          	ld	L7_BtoDW+3,a
 473                     ; 228         if(LrnModeActive)
 475  0144 7201000006    	btjf	L11_LrnModeActive,L371
 476                     ; 230           LearnNewID();
 478  0149 cd0000        	call	_LearnNewID
 480                     ; 231           state = ST_WAIT_INPUT_OR_FLAG;
 482  014c cc01d3        	jp	LC002
 483  014f               L371:
 484                     ; 235           if(IsLearnedID())
 486  014f cd0000        	call	_IsLearnedID
 488  0152 4d            	tnz	a
 489  0153 277e          	jreq	LC002
 490                     ; 237             state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 492  0155 35040002      	mov	L32_state,#4
 494  0159 207c          	jra	L141
 495                     ; 241             state = ST_WAIT_INPUT_OR_FLAG;
 496  015b               L55:
 497                     ; 249 		    status = radio_get_pload_byte(4);
 499  015b a604          	ld	a,#4
 500  015d cd0000        	call	_radio_get_pload_byte
 502  0160 6b01          	ld	(OFST+0,sp),a
 503                     ; 250         if(status & STATUS_LOWBATT)
 505  0162 a501          	bcp	a,#1
 506  0164 271d          	jreq	L302
 507                     ; 252           BLINK_GREENLED(5);
 509  0166 35050000      	mov	_blink_greenLED_times,#5
 512  016a 72110000      	bres	_flag_blink_unlimited
 517  016e 5f            	clrw	x
 518  016f 72100000      	bset	_flag_blink_on_off
 519  0173 bf00          	ldw	_cnt_state_greenLED,x
 522  0175 7217500a      	bres	20490,#3
 525  0179 7218500a      	bset	20490,#4
 529  017d 72100000      	bset	_flag_blink_greenLED
 532  0181 2008          	jra	L502
 533  0183               L302:
 534                     ; 256           LED_GREEN_ON;
 536  0183 7217500a      	bres	20490,#3
 539  0187 7218500a      	bset	20490,#4
 540  018b               L502:
 541                     ; 258         if(LightState == LIGHTSTATE_OFF)
 543  018b b600          	ld	a,L3_LightState
 544  018d 260e          	jrne	L702
 545                     ; 260           LIGHT_ON;
 547  018f 72155005      	bres	20485,#2
 550  0193 72105005      	bset	20485,#0
 551                     ; 261           LightState = LIGHTSTATE_ON;
 554  0197 35010000      	mov	L3_LightState,#1
 556  019b 200a          	jra	L112
 557  019d               L702:
 558                     ; 265           LIGHT_OFF;
 560  019d 7211500f      	bres	20495,#0
 563  01a1 7214500a      	bset	20490,#2
 564                     ; 266           LightState = LIGHTSTATE_OFF;
 567  01a5 3f00          	clr	L3_LightState
 568  01a7               L112:
 569                     ; 269         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 571  01a7 ae0064        	ldw	x,#100
 572  01aa cd0000        	call	_Timeout_SetTimeout1
 574                     ; 270         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 576  01ad 35050002      	mov	L32_state,#5
 577                     ; 271         break;
 579  01b1 2024          	jra	L141
 580  01b3               L75:
 581                     ; 275         if(Timeout_IsTimeout1())
 583  01b3 cd0000        	call	_Timeout_IsTimeout1
 585  01b6 4d            	tnz	a
 586  01b7 271e          	jreq	L141
 587                     ; 277           state = ST_SWITCH_LIGHT;
 589  01b9 35030002      	mov	L32_state,#3
 590  01bd 2018          	jra	L141
 591  01bf               L16:
 592                     ; 283         if(Timeout_IsTimeout1())
 594  01bf cd0000        	call	_Timeout_IsTimeout1
 596  01c2 4d            	tnz	a
 597  01c3 2712          	jreq	L141
 598                     ; 285           HBRIDGE_OFF;
 600  01c5 ad47          	call	LC003
 602                     ; 288           BLINKSTOP_GREENLED;
 604  01c7 72110000      	bres	_flag_blink_greenLED
 607  01cb 7217500a      	bres	20490,#3
 610  01cf 7219500a      	bres	20490,#4
 611                     ; 289           state = ST_WAIT_INPUT_OR_FLAG;
 615  01d3               LC002:
 619  01d3 35010002      	mov	L32_state,#1
 620                     ; 293       default: break;
 622  01d7               L141:
 623                     ; 295     IWDG_ReloadCounter();
 625  01d7 cd0000        	call	_IWDG_ReloadCounter
 627                     ; 296     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 629  01da cd0000        	call	_Errors_IsError
 631  01dd 4d            	tnz	a
 632  01de 2716          	jreq	L712
 634  01e0 7200000211    	btjt	L51_FLAG_reset_LEDblink_error,L712
 635                     ; 298       BLINK_REDLED(255);
 637  01e5 35ff0000      	mov	_blink_redLED_times,#255
 640  01e9 72100000      	bset	_flag_blink_unlimited
 645  01ed ad35          	call	LC004
 646                     ; 299       FLAG_reset_LEDblink_error = TRUE;
 649  01ef 72100002      	bset	L51_FLAG_reset_LEDblink_error
 651  01f3 cc008f        	jra	L331
 652  01f6               L712:
 653                     ; 303       if(FLAG_reset_LEDblink_error)
 655  01f6 72010002f8    	btjf	L51_FLAG_reset_LEDblink_error,L331
 656                     ; 305         BLINKSTOP_REDLED;
 658  01fb 72110000      	bres	_flag_blink_redLED
 661  01ff 7217500a      	bres	20490,#3
 664  0203 7219500a      	bres	20490,#4
 665                     ; 306         FLAG_reset_LEDblink_error = FALSE;
 669  0207 72110002      	bres	L51_FLAG_reset_LEDblink_error
 670  020b cc008f        	jra	L331
 671  020e               LC003:
 672  020e 7210500f      	bset	20495,#0
 673                     ; 145   HBRIDGE_OFF;
 675  0212 72145005      	bset	20485,#2
 678  0216 72115005      	bres	20485,#0
 681  021a 7215500a      	bres	20490,#2
 682                     ; 146   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 685  021e ae03e8        	ldw	x,#1000
 686  0221 cc0000        	jp	_Timeout_SetTimeout1
 687  0224               LC004:
 688  0224 5f            	clrw	x
 689  0225 72100000      	bset	_flag_blink_on_off
 690  0229 bf00          	ldw	_cnt_state_redLED,x
 692  022b 7216500a      	bset	20490,#3
 694  022f 7219500a      	bres	20490,#4
 696  0233 72100000      	bset	_flag_blink_redLED
 697  0237 81            	ret	
 744                     ; 312 _Bool IsLearnedID()
 744                     ; 313 {
 745                     .text:	section	.text,new
 746  0000               _IsLearnedID:
 748  0000 89            	pushw	x
 749       00000002      OFST:	set	2
 752                     ; 315   _Bool flag_IDfound = FALSE;
 754  0001 0f01          	clr	(OFST-1,sp)
 755                     ; 316   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 757  0003 0f02          	clr	(OFST+0,sp)
 759  0005 2020          	jra	L352
 760  0007               L742:
 761                     ; 318     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 763  0007 97            	ld	xl,a
 764  0008 a604          	ld	a,#4
 765  000a 42            	mul	x,a
 766  000b 1c0005        	addw	x,#L5_Receivers
 767  000e cd0000        	call	c_ltor
 769  0011 ae0001        	ldw	x,#L7_BtoDW
 770  0014 cd0000        	call	c_lcmp
 772  0017 260c          	jrne	L752
 773                     ; 320       flag_IDfound = TRUE;
 775  0019 a601          	ld	a,#1
 776  001b 6b01          	ld	(OFST-1,sp),a
 777                     ; 321       break;
 778  001d               L552:
 779                     ; 324   return flag_IDfound;
 781  001d 7b01          	ld	a,(OFST-1,sp)
 782  001f 2702          	jreq	L421
 783  0021 a601          	ld	a,#1
 784  0023               L421:
 787  0023 85            	popw	x
 788  0024 81            	ret	
 789  0025               L752:
 790                     ; 316   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 792  0025 0c02          	inc	(OFST+0,sp)
 793  0027               L352:
 796  0027 7b02          	ld	a,(OFST+0,sp)
 797  0029 c1002d        	cp	a,L5_Receivers+40
 798  002c 25d9          	jrult	L742
 799  002e 20ed          	jra	L552
 851                     ; 327 void LearnNewID()
 851                     ; 328 {
 852                     .text:	section	.text,new
 853  0000               _LearnNewID:
 855  0000 89            	pushw	x
 856       00000002      OFST:	set	2
 859                     ; 331   _Bool flag_IDfound = FALSE;
 861  0001 0f01          	clr	(OFST-1,sp)
 862                     ; 332   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 864  0003 0f02          	clr	(OFST+0,sp)
 866  0005 2069          	jra	L703
 867  0007               L303:
 868                     ; 334     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 870  0007 97            	ld	xl,a
 871  0008 a604          	ld	a,#4
 872  000a 42            	mul	x,a
 873  000b cd0093        	call	LC006
 875  000e 265e          	jrne	L313
 876                     ; 336       flag_IDfound = TRUE;
 878  0010 a601          	ld	a,#1
 879  0012 6b01          	ld	(OFST-1,sp),a
 880                     ; 337       break;
 881  0014               L113:
 882                     ; 340   if(!flag_IDfound)
 884  0014 7b01          	ld	a,(OFST-1,sp)
 885  0016 2661          	jrne	L513
 886                     ; 343     FLASH_Unlock(FLASH_MemType_Program);
 888  0018 a6fd          	ld	a,#253
 889  001a cd0000        	call	_FLASH_Unlock
 891                     ; 344     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)BtoDW.B.b0 );
 893  001d 3b0001        	push	L7_BtoDW
 894  0020 ad69          	call	LC005
 895  0022 1c0005        	addw	x,#L5_Receivers
 896  0025 cd0000        	call	_FLASH_ProgramByte
 898  0028 84            	pop	a
 899                     ; 345     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)BtoDW.B.b1 );
 901  0029 3b0002        	push	L7_BtoDW+1
 902  002c ad5d          	call	LC005
 903  002e 1c0006        	addw	x,#L5_Receivers+1
 904  0031 cd0000        	call	_FLASH_ProgramByte
 906  0034 84            	pop	a
 907                     ; 346     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)BtoDW.B.b2 );
 909  0035 3b0003        	push	L7_BtoDW+2
 910  0038 ad51          	call	LC005
 911  003a 1c0007        	addw	x,#L5_Receivers+2
 912  003d cd0000        	call	_FLASH_ProgramByte
 914  0040 84            	pop	a
 915                     ; 347     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)BtoDW.B.b3 );
 917  0041 3b0004        	push	L7_BtoDW+3
 918  0044 ad45          	call	LC005
 919  0046 1c0008        	addw	x,#L5_Receivers+3
 920  0049 cd0000        	call	_FLASH_ProgramByte
 922  004c 84            	pop	a
 923                     ; 348     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
 925  004d c6002d        	ld	a,L5_Receivers+40
 926  0050 4c            	inc	a
 927  0051 88            	push	a
 928  0052 ae002d        	ldw	x,#L5_Receivers+40
 929  0055 cd0000        	call	_FLASH_ProgramByte
 931  0058 84            	pop	a
 932                     ; 349     FLASH_Lock(FLASH_MemType_Program);
 934  0059 a6fd          	ld	a,#253
 935  005b cd0000        	call	_FLASH_Lock
 937                     ; 351     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 939  005e ad2b          	call	LC005
 940  0060 1d0004        	subw	x,#4
 941  0063 ad2e          	call	LC006
 943  0065 2712          	jreq	L513
 944                     ; 353       Errors_SetError(ERROR_FLASH_WRITE);
 946  0067 a604          	ld	a,#4
 947  0069 cd0000        	call	_Errors_SetError
 949  006c 200b          	jra	L513
 950  006e               L313:
 951                     ; 332   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 953  006e 0c02          	inc	(OFST+0,sp)
 954  0070               L703:
 957  0070 7b02          	ld	a,(OFST+0,sp)
 958  0072 c1002d        	cp	a,L5_Receivers+40
 959  0075 2590          	jrult	L303
 960  0077 209b          	jra	L113
 961  0079               L513:
 962                     ; 356   LrnModeActive = FALSE;
 964  0079 72110000      	bres	L11_LrnModeActive
 965                     ; 357   BLINKSTOP_GREENLED;
 967  007d 72110000      	bres	_flag_blink_greenLED
 970  0081 7217500a      	bres	20490,#3
 973  0085 7219500a      	bres	20490,#4
 974                     ; 358 }
 979  0089 85            	popw	x
 980  008a 81            	ret	
 981  008b               LC005:
 982  008b c6002d        	ld	a,L5_Receivers+40
 983  008e 97            	ld	xl,a
 984  008f a604          	ld	a,#4
 985  0091 42            	mul	x,a
 986  0092 81            	ret	
 987  0093               LC006:
 988  0093 1c0005        	addw	x,#L5_Receivers
 989  0096 cd0000        	call	c_ltor
 991  0099 ae0001        	ldw	x,#L7_BtoDW
 992  009c cc0000        	jp	c_lcmp
1054                     ; 360 void BTN1_Released()
1054                     ; 361 {
1055                     .text:	section	.text,new
1056  0000               _BTN1_Released:
1058  0000 5203          	subw	sp,#3
1059       00000003      OFST:	set	3
1062                     ; 362   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
1064  0002 be00          	ldw	x,_BTN1_press_timer
1065  0004 a30bb8        	cpw	x,#3000
1066  0007 245e          	jruge	L343
1067                     ; 365     if(!Errors_IsError())
1069  0009 cd0000        	call	_Errors_IsError
1071  000c 4d            	tnz	a
1072  000d 2703cc00c9    	jrne	L753
1073                     ; 367       if(!LrnModeActive)
1075  0012 7200000046    	btjt	L11_LrnModeActive,L743
1076                     ; 369         if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
1078  0017 c6002d        	ld	a,L5_Receivers+40
1079  001a a10a          	cp	a,#10
1080  001c 2422          	jruge	L153
1081                     ; 371           LrnModeActive = TRUE;
1083  001e 72100000      	bset	L11_LrnModeActive
1084                     ; 372           BLINK_GREENLED(255);
1086  0022 35ff0000      	mov	_blink_greenLED_times,#255
1089  0026 72100000      	bset	_flag_blink_unlimited
1094  002a 5f            	clrw	x
1095  002b 72100000      	bset	_flag_blink_on_off
1096  002f bf00          	ldw	_cnt_state_greenLED,x
1099  0031 7217500a      	bres	20490,#3
1102  0035 7218500a      	bset	20490,#4
1106  0039 72100000      	bset	_flag_blink_greenLED
1109  003d cc00c9        	jra	L753
1110  0040               L153:
1111                     ; 376           BLINK_REDLED(2);
1113  0040 35020000      	mov	_blink_redLED_times,#2
1116  0044 72110000      	bres	_flag_blink_unlimited
1121  0048 5f            	clrw	x
1122  0049 72100000      	bset	_flag_blink_on_off
1123  004d bf00          	ldw	_cnt_state_redLED,x
1126  004f 7216500a      	bset	20490,#3
1129  0053 7219500a      	bres	20490,#4
1133  0057 72100000      	bset	_flag_blink_redLED
1135  005b 206c          	jra	L753
1136  005d               L743:
1137                     ; 381         LrnModeActive = FALSE;
1139  005d 72110000      	bres	L11_LrnModeActive
1140                     ; 382         BLINKSTOP_GREENLED;
1142  0061 72110000      	bres	_flag_blink_greenLED
1147  0065 205a          	jp	LC007
1148  0067               L343:
1149                     ; 391     LED_RED_ON;
1151  0067 7216500a      	bset	20490,#3
1154  006b 7219500a      	bres	20490,#4
1155                     ; 392     flash_erase_timing_test = 1;
1158  006f 35010000      	mov	L14_flash_erase_timing_test,#1
1159                     ; 393     FLASH_Unlock(FLASH_MemType_Program);
1161  0073 a6fd          	ld	a,#253
1162  0075 cd0000        	call	_FLASH_Unlock
1164                     ; 394     adr = (u8*)&Receivers;
1166  0078 ae0005        	ldw	x,#L5_Receivers
1167  007b 1f01          	ldw	(OFST-2,sp),x
1168                     ; 395     for(i = 0; i < sizeof(Receivers); i++)
1170  007d 0f03          	clr	(OFST+0,sp)
1171  007f               L163:
1172                     ; 397       FLASH_EraseByte((u16)(adr++));
1174  007f 1e01          	ldw	x,(OFST-2,sp)
1175  0081 5c            	incw	x
1176  0082 1f01          	ldw	(OFST-2,sp),x
1177  0084 5a            	decw	x
1178  0085 cd0000        	call	_FLASH_EraseByte
1180                     ; 395     for(i = 0; i < sizeof(Receivers); i++)
1182  0088 0c03          	inc	(OFST+0,sp)
1185  008a 7b03          	ld	a,(OFST+0,sp)
1186  008c a129          	cp	a,#41
1187  008e 25ef          	jrult	L163
1188                     ; 399     FLASH_Lock(FLASH_MemType_Program);
1190  0090 a6fd          	ld	a,#253
1191  0092 cd0000        	call	_FLASH_Lock
1193                     ; 400     flash_erase_timing_test = 2;
1195  0095 35020000      	mov	L14_flash_erase_timing_test,#2
1196                     ; 402     Errors_ResetError(ERROR_FLASH_ERASE);
1198  0099 a605          	ld	a,#5
1199  009b cd0000        	call	_Errors_ResetError
1201                     ; 403     adr = (u8*)&Receivers;
1203  009e ae0005        	ldw	x,#L5_Receivers
1204  00a1 1f01          	ldw	(OFST-2,sp),x
1205                     ; 404     for(i = 0; i < sizeof(Receivers); i++)
1207  00a3 0f03          	clr	(OFST+0,sp)
1208  00a5               L763:
1209                     ; 406       if(*(adr++))
1211  00a5 1e01          	ldw	x,(OFST-2,sp)
1212  00a7 5c            	incw	x
1213  00a8 1f01          	ldw	(OFST-2,sp),x
1214  00aa 5a            	decw	x
1215  00ab f6            	ld	a,(x)
1216  00ac 2707          	jreq	L573
1217                     ; 408         Errors_SetError(ERROR_FLASH_ERASE);
1219  00ae a605          	ld	a,#5
1220  00b0 cd0000        	call	_Errors_SetError
1222                     ; 409         break;
1224  00b3 2008          	jra	L373
1225  00b5               L573:
1226                     ; 404     for(i = 0; i < sizeof(Receivers); i++)
1228  00b5 0c03          	inc	(OFST+0,sp)
1231  00b7 7b03          	ld	a,(OFST+0,sp)
1232  00b9 a129          	cp	a,#41
1233  00bb 25e8          	jrult	L763
1234  00bd               L373:
1235                     ; 412     flash_erase_timing_test = 3;
1237  00bd 35030000      	mov	L14_flash_erase_timing_test,#3
1238                     ; 413     LED_OFF;
1242  00c1               LC007:
1244  00c1 7217500a      	bres	20490,#3
1246  00c5 7219500a      	bres	20490,#4
1247  00c9               L753:
1248                     ; 415   BTN1_press_timer = 0;
1250  00c9 5f            	clrw	x
1251  00ca bf00          	ldw	_BTN1_press_timer,x
1252                     ; 416 }
1255  00cc 5b03          	addw	sp,#3
1256  00ce 81            	ret	
1280                     ; 418 void TASK_1000ms()
1280                     ; 419 {
1281                     .text:	section	.text,new
1282  0000               _TASK_1000ms:
1286                     ; 420   task_1000ms_cnt++;
1288  0000 3c06          	inc	L53_task_1000ms_cnt
1289                     ; 421 }
1292  0002 81            	ret	
1316                     ; 423 void TASK_500ms()
1316                     ; 424 {
1317                     .text:	section	.text,new
1318  0000               _TASK_500ms:
1322                     ; 425   flash_erase_timing_test = 0;
1324  0000 3f00          	clr	L14_flash_erase_timing_test
1325                     ; 426 }
1328  0002 81            	ret	
1351                     ; 428 void TASK_250ms()
1351                     ; 429 {
1352                     .text:	section	.text,new
1353  0000               _TASK_250ms:
1357                     ; 431 }
1360  0000 81            	ret	
1664                     	xdef	_main
1665                     	xdef	_IsLearnedID
1666                     	xdef	_LearnNewID
1667                     	xdef	_BTN1_Released
1668                     	xdef	_TASK_250ms
1669                     	xdef	_TASK_500ms
1670                     	xdef	_TASK_1000ms
1671                     	switch	.ubsct
1672  0000               L14_flash_erase_timing_test:
1673  0000 00            	ds.b	1
1674  0001               L7_BtoDW:
1675  0001 00000000      	ds.b	4
1676                     	switch	.const
1677  0005               L5_Receivers:
1678  0005 000000000000  	ds.b	41
1679                     	xref	_radio_sb_init
1680                     	xref	_radio_irq
1681                     	xref	_radio_get_pload_byte
1682                     	xref	_radio_set_status
1683                     	xref	_radio_get_status
1684                     	xref	_Timeout_IsTimeout3
1685                     	xref	_Timeout_IsTimeout2
1686                     	xref	_Timeout_IsTimeout1
1687                     	xref	_Timeout_SetTimeout3
1688                     	xref	_Timeout_SetTimeout2
1689                     	xref	_Timeout_SetTimeout1
1690                     	xbit	_flag_blink_unlimited
1691                     	xbit	_flag_blink_greenLED
1692                     	xbit	_flag_blink_redLED
1693                     	xbit	_flag_blink_on_off
1694                     	xref.b	_cnt_state_greenLED
1695                     	xref.b	_cnt_state_redLED
1696                     	xref.b	_blink_greenLED_times
1697                     	xref.b	_blink_redLED_times
1698                     	xbit	_FLAG_1000ms
1699                     	xbit	_FLAG_500ms
1700                     	xbit	_FLAG_250ms
1701                     	xref.b	_BTN1_press_timer
1702                     	xref.b	_BTN1_DEB_STATE
1703                     	xref	_Errors_IsError
1704                     	xref	_Errors_ResetError
1705                     	xref	_Errors_SetError
1706                     	xref	_Errors_Init
1707                     	xref	_Config
1708                     	xref	_RST_ClearFlag
1709                     	xref	_RST_GetFlagStatus
1710                     	xref	_IWDG_Enable
1711                     	xref	_IWDG_ReloadCounter
1712                     	xref	_IWDG_SetReload
1713                     	xref	_IWDG_SetPrescaler
1714                     	xref	_IWDG_WriteAccessCmd
1715                     	xref	_FLASH_EraseByte
1716                     	xref	_FLASH_ProgramByte
1717                     	xref	_FLASH_Lock
1718                     	xref	_FLASH_Unlock
1738                     	xref	c_lcmp
1739                     	xref	c_ltor
1740                     	end
