   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               L5_tx_address:
  23  0000 06            	dc.b	6
  24  0001 05            	dc.b	5
  25  0002 2e            	dc.b	46
  26  0003 58            	dc.b	88
  27  0004 c1            	dc.b	193
  28  0005               L7_rx_address:
  29  0005 4e            	dc.b	78
  30  0006 cc            	dc.b	204
  31  0007 54            	dc.b	84
  32  0008 da            	dc.b	218
  33  0009 5f            	dc.b	95
  34  000a               L11_LightState:
  35  000a 00            	dc.b	0
  36                     .bit:	section	.data,bit
  37  0000               L71_LrnModeActive:
  38  0000 00            	dc.b	0
  39  0001               L12_FLAG_BTN1_lock:
  40  0001 00            	dc.b	0
  41  0002               L32_FLAG_reset_LEDblink_error:
  42  0002 00            	dc.b	0
  43  0003               L52_FLAG_check_nrf_reg:
  44  0003 00            	dc.b	0
  45                     	bsct
  46  000b               L72_error_nrf24_reg_cnt:
  47  000b 00            	dc.b	0
  48  000c               L13_state:
  49  000c 00            	dc.b	0
  50  000d               L33_program_status:
  51  000d 00            	dc.b	0
  52  000e               L53_interrupt_status:
  53  000e 00            	dc.b	0
  54  000f               L14_debug_reg_idx:
  55  000f 00            	dc.b	0
  56  0010               L34_task_1000ms_cnt:
  57  0010 00            	dc.b	0
  58  0011               L54_init_delay:
  59  0011 ffff          	dc.w	-1
 145                     ; 117 void main(void)
 145                     ; 118 {
 147                     .text:	section	.text,new
 148  0000               _main:
 150  0000 88            	push	a
 151       00000001      OFST:	set	1
 154                     ; 119   program_status = 1;
 156  0001 3501000d      	mov	L33_program_status,#1
 158  0005               L511:
 159                     ; 121   while(init_delay--);
 161  0005 be11          	ldw	x,L54_init_delay
 162  0007 5a            	decw	x
 163  0008 bf11          	ldw	L54_init_delay,x
 164  000a 5c            	incw	x
 165  000b 26f8          	jrne	L511
 166                     ; 122   disableInterrupts();
 169  000d 9b            	sim	
 171                     ; 123   Config();
 174  000e cd0000        	call	_Config
 176                     ; 124   program_status = 2;
 178  0011 3502000d      	mov	L33_program_status,#2
 179                     ; 125   Errors_Init();
 181  0015 cd0000        	call	_Errors_Init
 183                     ; 126   enableInterrupts();
 186  0018 9a            	rim	
 188                     ; 127   program_status = 3;
 191  0019 3503000d      	mov	L33_program_status,#3
 192                     ; 128   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 194  001d a602          	ld	a,#2
 195  001f cd0000        	call	_RST_GetFlagStatus
 197  0022 4d            	tnz	a
 198  0023 2706          	jreq	L121
 199                     ; 130     BLINK_REDLED(1);
 201  0025 35010000      	mov	_blink_redLED_times,#1
 211  0029 200c          	jp	LC001
 212  002b               L121:
 213                     ; 132   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 215  002b a604          	ld	a,#4
 216  002d cd0000        	call	_RST_GetFlagStatus
 218  0030 4d            	tnz	a
 219  0031 270b          	jreq	L321
 220                     ; 134     BLINK_REDLED(2);
 222  0033 35020000      	mov	_blink_redLED_times,#2
 236  0037               LC001:
 238  0037 72110000      	bres	_flag_blink_unlimited
 241  003b cd01f8        	call	LC004
 243  003e               L321:
 244                     ; 136   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 246  003e a60f          	ld	a,#15
 247  0040 cd0000        	call	_RST_ClearFlag
 250  0043               L131:
 251                     ; 137   while(ISBLINKING_REDLED);
 253  0043 72000000fb    	btjt	_flag_blink_redLED,L131
 254                     ; 138   program_status = 4;
 256  0048 3504000d      	mov	L33_program_status,#4
 257                     ; 139   LED_GREEN_ON;
 259  004c 7217500a      	bres	20490,#3
 262  0050 7218500a      	bset	20490,#4
 263                     ; 140   HBRIDGE_OFF;
 266  0054 cd01e2        	call	LC003
 268                     ; 143   Timeout_SetTimeout2(200);
 270  0057 ae00c8        	ldw	x,#200
 271  005a cd0000        	call	_Timeout_SetTimeout2
 274  005d               L731:
 275                     ; 144   while(!Timeout_IsTimeout2());
 277  005d cd0000        	call	_Timeout_IsTimeout2
 279  0060 4d            	tnz	a
 280  0061 27fa          	jreq	L731
 281                     ; 146   nrf24_init();
 283  0063 cd0000        	call	_nrf24_init
 285                     ; 148   nrf24_config_sb(RF_CHANNEL, RF_PAYLOAD_LEN, rx_address, tx_address);
 287  0066 ae0000        	ldw	x,#L5_tx_address
 288  0069 89            	pushw	x
 289  006a ae0005        	ldw	x,#L7_rx_address
 290  006d 89            	pushw	x
 291  006e ae0006        	ldw	x,#6
 292  0071 cd0000        	call	_nrf24_config_sb
 294  0074 5b04          	addw	sp,#4
 295                     ; 152   LED_OFF;
 297  0076 7217500a      	bres	20490,#3
 300  007a 7219500a      	bres	20490,#4
 301                     ; 153   IWDG_Enable();
 304  007e cd0000        	call	_IWDG_Enable
 306                     ; 154   program_status = 5;
 308  0081 3505000d      	mov	L33_program_status,#5
 309  0085               L341:
 310                     ; 157     switch(state)
 312  0085 b60c          	ld	a,L13_state
 314                     ; 278       default: break;
 315  0087 2603cc01a7    	jreq	LC002
 316  008c 4a            	dec	a
 317  008d 2718          	jreq	L15
 318  008f 4a            	dec	a
 319  0090 2768          	jreq	L35
 320  0092 4a            	dec	a
 321  0093 2603cc0132    	jreq	L55
 322  0098 4a            	dec	a
 323  0099 2603cc0187    	jreq	L75
 324  009e 4a            	dec	a
 325  009f 2603cc0193    	jreq	L16
 326  00a4 cc01ab        	jra	L151
 327                     ; 161         state = ST_WAIT_INPUT_OR_FLAG;
 328                     ; 162         break;
 330  00a7               L15:
 331                     ; 166         if(FLAG_250ms)
 333  00a7 7201000007    	btjf	_FLAG_250ms,L351
 334                     ; 168           FLAG_250ms = FALSE;
 336  00ac 72110000      	bres	_FLAG_250ms
 337                     ; 169           TASK_250ms();
 339  00b0 cd0000        	call	_TASK_250ms
 341  00b3               L351:
 342                     ; 171         if(FLAG_500ms)
 344  00b3 7201000007    	btjf	_FLAG_500ms,L551
 345                     ; 173           FLAG_500ms = FALSE;
 347  00b8 72110000      	bres	_FLAG_500ms
 348                     ; 174           TASK_500ms();
 350  00bc cd0000        	call	_TASK_500ms
 352  00bf               L551:
 353                     ; 176         if(FLAG_1000ms)
 355  00bf 7201000007    	btjf	_FLAG_1000ms,L751
 356                     ; 178           FLAG_1000ms = FALSE;
 358  00c4 72110000      	bres	_FLAG_1000ms
 359                     ; 179           TASK_1000ms();  // NRF check registers to be modified to fit SB configuration
 361  00c8 cd0000        	call	_TASK_1000ms
 363  00cb               L751:
 364                     ; 182         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 366  00cb b600          	ld	a,_BTN1_DEB_STATE
 367  00cd 4a            	dec	a
 368  00ce 2609          	jrne	L161
 370  00d0 7200000104    	btjt	L12_FLAG_BTN1_lock,L161
 371                     ; 184           FLAG_BTN1_lock = TRUE;
 373  00d5 72100001      	bset	L12_FLAG_BTN1_lock
 374  00d9               L161:
 375                     ; 186         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 377  00d9 b600          	ld	a,_BTN1_DEB_STATE
 378  00db 260c          	jrne	L361
 380  00dd 7201000107    	btjf	L12_FLAG_BTN1_lock,L361
 381                     ; 188           FLAG_BTN1_lock = FALSE;
 383  00e2 72110001      	bres	L12_FLAG_BTN1_lock
 384                     ; 189           BTN1_Released();
 386  00e6 cd0000        	call	_BTN1_Released
 388  00e9               L361:
 389                     ; 192         if(! NRF_IRQ_STATE)
 391  00e9 c65006        	ld	a,20486
 392  00ec a410          	and	a,#16
 393  00ee 5f            	clrw	x
 394  00ef 02            	rlwa	x,a
 395  00f0 5d            	tnzw	x
 396  00f1 26b1          	jrne	L151
 397                     ; 194           state = ST_NRF_IRQ;
 399  00f3 3502000c      	mov	L13_state,#2
 400  00f7 cc01ab        	jra	L151
 401  00fa               L35:
 402                     ; 200         if(!Errors_CheckError(ERROR_NRF24_INIT) && !Errors_CheckError(ERROR_NRF24_COMM))
 404  00fa 4c            	inc	a
 405  00fb cd0000        	call	_Errors_CheckError
 407  00fe 4d            	tnz	a
 408  00ff 2688          	jrne	LC002
 410  0101 a602          	ld	a,#2
 411  0103 cd0000        	call	_Errors_CheckError
 413  0106 4d            	tnz	a
 414  0107 2680          	jrne	LC002
 415                     ; 202           nrf24_getData(rcvdata);
 417  0109 ae000d        	ldw	x,#L3_rcvdata
 418  010c cd0000        	call	_nrf24_getData
 420                     ; 203           BtoDW.B.b0 = rcvdata[0];  // convert 4 bytes to u32
 422  010f 450d09        	mov	L51_BtoDW,L3_rcvdata
 423                     ; 204           BtoDW.B.b1 = rcvdata[1];
 425  0112 450e0a        	mov	L51_BtoDW+1,L3_rcvdata+1
 426                     ; 205           BtoDW.B.b2 = rcvdata[2];
 428  0115 450f0b        	mov	L51_BtoDW+2,L3_rcvdata+2
 429                     ; 206           BtoDW.B.b3 = rcvdata[3];
 431  0118 45100c        	mov	L51_BtoDW+3,L3_rcvdata+3
 432                     ; 208           if(LrnModeActive)
 434  011b 7201000006    	btjf	L71_LrnModeActive,L171
 435                     ; 210             LearnNewID();
 437  0120 cd0000        	call	_LearnNewID
 439                     ; 211             state = ST_WAIT_INPUT_OR_FLAG;
 441  0123 cc01a7        	jp	LC002
 442  0126               L171:
 443                     ; 215             if(IsLearnedID())
 445  0126 cd0000        	call	_IsLearnedID
 447  0129 4d            	tnz	a
 448  012a 277b          	jreq	LC002
 449                     ; 217               state = ST_WAIT_TIMEOUT1_CAP_CHARGE;
 451  012c 3504000c      	mov	L13_state,#4
 453  0130 2079          	jra	L151
 454                     ; 221               state = ST_WAIT_INPUT_OR_FLAG;
 455                     ; 227           state = ST_WAIT_INPUT_OR_FLAG;
 456  0132               L55:
 457                     ; 234 		    status = rcvdata[4];
 459  0132 b611          	ld	a,L3_rcvdata+4
 460  0134 6b01          	ld	(OFST+0,sp),a
 461                     ; 235         if(status & STATUS_LOWBATT)
 463  0136 a501          	bcp	a,#1
 464  0138 271d          	jreq	L302
 465                     ; 237             BLINK_GREENLED(5);
 467  013a 35050000      	mov	_blink_greenLED_times,#5
 470  013e 72110000      	bres	_flag_blink_unlimited
 475  0142 5f            	clrw	x
 476  0143 72100000      	bset	_flag_blink_on_off
 477  0147 bf00          	ldw	_cnt_state_greenLED,x
 480  0149 7217500a      	bres	20490,#3
 483  014d 7218500a      	bset	20490,#4
 487  0151 72100000      	bset	_flag_blink_greenLED
 490  0155 2008          	jra	L502
 491  0157               L302:
 492                     ; 241             LED_GREEN_ON;
 494  0157 7217500a      	bres	20490,#3
 497  015b 7218500a      	bset	20490,#4
 498  015f               L502:
 499                     ; 243         if(LightState == OFF)
 501  015f b60a          	ld	a,L11_LightState
 502  0161 260e          	jrne	L702
 503                     ; 245           LIGHT_ON;
 505  0163 72155005      	bres	20485,#2
 508  0167 72105005      	bset	20485,#0
 509                     ; 246           LightState = ON;
 512  016b 3501000a      	mov	L11_LightState,#1
 514  016f 200a          	jra	L112
 515  0171               L702:
 516                     ; 250           LIGHT_OFF;
 518  0171 7211500f      	bres	20495,#0
 521  0175 7214500a      	bset	20490,#2
 522                     ; 251           LightState = OFF;
 525  0179 3f0a          	clr	L11_LightState
 526  017b               L112:
 527                     ; 254         Timeout_SetTimeout1(HBRIDGE_ON_TIME);
 529  017b ae0064        	ldw	x,#100
 530  017e cd0000        	call	_Timeout_SetTimeout1
 532                     ; 255         state = ST_WAIT_TIMEOUT1_HBRIDGE_ON;
 534  0181 3505000c      	mov	L13_state,#5
 535                     ; 256         break;
 537  0185 2024          	jra	L151
 538  0187               L75:
 539                     ; 260         if(Timeout_IsTimeout1())
 541  0187 cd0000        	call	_Timeout_IsTimeout1
 543  018a 4d            	tnz	a
 544  018b 271e          	jreq	L151
 545                     ; 262           state = ST_SWITCH_LIGHT;
 547  018d 3503000c      	mov	L13_state,#3
 548  0191 2018          	jra	L151
 549  0193               L16:
 550                     ; 268         if(Timeout_IsTimeout1())
 552  0193 cd0000        	call	_Timeout_IsTimeout1
 554  0196 4d            	tnz	a
 555  0197 2712          	jreq	L151
 556                     ; 270           HBRIDGE_OFF;
 558  0199 ad47          	call	LC003
 560                     ; 273           BLINKSTOP_GREENLED;
 562  019b 72110000      	bres	_flag_blink_greenLED
 565  019f 7217500a      	bres	20490,#3
 568  01a3 7219500a      	bres	20490,#4
 569                     ; 274           state = ST_WAIT_INPUT_OR_FLAG;
 573  01a7               LC002:
 578  01a7 3501000c      	mov	L13_state,#1
 579                     ; 278       default: break;
 581  01ab               L151:
 582                     ; 280     IWDG_ReloadCounter();
 584  01ab cd0000        	call	_IWDG_ReloadCounter
 586                     ; 281     if(Errors_IsError() && !FLAG_reset_LEDblink_error)
 588  01ae cd0000        	call	_Errors_IsError
 590  01b1 4d            	tnz	a
 591  01b2 2716          	jreq	L712
 593  01b4 7200000211    	btjt	L32_FLAG_reset_LEDblink_error,L712
 594                     ; 283       BLINK_REDLED(255);
 596  01b9 35ff0000      	mov	_blink_redLED_times,#255
 599  01bd 72100000      	bset	_flag_blink_unlimited
 604  01c1 ad35          	call	LC004
 605                     ; 284       FLAG_reset_LEDblink_error = TRUE;
 608  01c3 72100002      	bset	L32_FLAG_reset_LEDblink_error
 610  01c7 cc0085        	jra	L341
 611  01ca               L712:
 612                     ; 288       if(FLAG_reset_LEDblink_error)
 614  01ca 72010002f8    	btjf	L32_FLAG_reset_LEDblink_error,L341
 615                     ; 290         BLINKSTOP_REDLED;
 617  01cf 72110000      	bres	_flag_blink_redLED
 620  01d3 7217500a      	bres	20490,#3
 623  01d7 7219500a      	bres	20490,#4
 624                     ; 291         FLAG_reset_LEDblink_error = FALSE;
 628  01db 72110002      	bres	L32_FLAG_reset_LEDblink_error
 629  01df cc0085        	jra	L341
 630  01e2               LC003:
 631  01e2 7210500f      	bset	20495,#0
 632                     ; 140   HBRIDGE_OFF;
 634  01e6 72145005      	bset	20485,#2
 637  01ea 72115005      	bres	20485,#0
 640  01ee 7215500a      	bres	20490,#2
 641                     ; 141   Timeout_SetTimeout1(HBRIDGE_CHARGE_TIME);
 644  01f2 ae0258        	ldw	x,#600
 645  01f5 cc0000        	jp	_Timeout_SetTimeout1
 646  01f8               LC004:
 647  01f8 5f            	clrw	x
 648  01f9 72100000      	bset	_flag_blink_on_off
 649  01fd bf00          	ldw	_cnt_state_redLED,x
 651  01ff 7216500a      	bset	20490,#3
 653  0203 7219500a      	bres	20490,#4
 655  0207 72100000      	bset	_flag_blink_redLED
 656  020b 81            	ret	
 703                     ; 297 _Bool IsLearnedID()
 703                     ; 298 {
 704                     .text:	section	.text,new
 705  0000               _IsLearnedID:
 707  0000 89            	pushw	x
 708       00000002      OFST:	set	2
 711                     ; 300   _Bool flag_IDfound = FALSE;
 713  0001 0f01          	clr	(OFST-1,sp)
 714                     ; 301   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 716  0003 0f02          	clr	(OFST+0,sp)
 718  0005 2020          	jra	L352
 719  0007               L742:
 720                     ; 303     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 722  0007 97            	ld	xl,a
 723  0008 a604          	ld	a,#4
 724  000a 42            	mul	x,a
 725  000b 1c0000        	addw	x,#L31_Receivers
 726  000e cd0000        	call	c_ltor
 728  0011 ae0009        	ldw	x,#L51_BtoDW
 729  0014 cd0000        	call	c_lcmp
 731  0017 260c          	jrne	L752
 732                     ; 305       flag_IDfound = TRUE;
 734  0019 a601          	ld	a,#1
 735  001b 6b01          	ld	(OFST-1,sp),a
 736                     ; 306       break;
 737  001d               L552:
 738                     ; 309   return flag_IDfound;
 740  001d 7b01          	ld	a,(OFST-1,sp)
 741  001f 2702          	jreq	L47
 742  0021 a601          	ld	a,#1
 743  0023               L47:
 746  0023 85            	popw	x
 747  0024 81            	ret	
 748  0025               L752:
 749                     ; 301   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 751  0025 0c02          	inc	(OFST+0,sp)
 752  0027               L352:
 755  0027 7b02          	ld	a,(OFST+0,sp)
 756  0029 c10028        	cp	a,L31_Receivers+40
 757  002c 25d9          	jrult	L742
 758  002e 20ed          	jra	L552
 811                     ; 312 void LearnNewID()
 811                     ; 313 {
 812                     .text:	section	.text,new
 813  0000               _LearnNewID:
 815  0000 89            	pushw	x
 816       00000002      OFST:	set	2
 819                     ; 316   _Bool flag_IDfound = FALSE;
 821  0001 0f01          	clr	(OFST-1,sp)
 822                     ; 317   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 824  0003 0f02          	clr	(OFST+0,sp)
 826  0005 2069          	jra	L703
 827  0007               L303:
 828                     ; 319     if( BtoDW.DW == (*(u32*)(&(Receivers.ID[i]))) )
 830  0007 97            	ld	xl,a
 831  0008 a604          	ld	a,#4
 832  000a 42            	mul	x,a
 833  000b cd0093        	call	LC006
 835  000e 265e          	jrne	L313
 836                     ; 321       flag_IDfound = TRUE;
 838  0010 a601          	ld	a,#1
 839  0012 6b01          	ld	(OFST-1,sp),a
 840                     ; 322       break;
 841  0014               L113:
 842                     ; 325   if(!flag_IDfound)
 844  0014 7b01          	ld	a,(OFST-1,sp)
 845  0016 2661          	jrne	L513
 846                     ; 328     FLASH_Unlock(FLASH_MemType_Program);
 848  0018 a6fd          	ld	a,#253
 849  001a cd0000        	call	_FLASH_Unlock
 851                     ; 329     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+0, (u8)rcvdata[0] );
 853  001d 3b000d        	push	L3_rcvdata
 854  0020 ad69          	call	LC005
 855  0022 1c0000        	addw	x,#L31_Receivers
 856  0025 cd0000        	call	_FLASH_ProgramByte
 858  0028 84            	pop	a
 859                     ; 330     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+1, (u8)rcvdata[1] );
 861  0029 3b000e        	push	L3_rcvdata+1
 862  002c ad5d          	call	LC005
 863  002e 1c0001        	addw	x,#L31_Receivers+1
 864  0031 cd0000        	call	_FLASH_ProgramByte
 866  0034 84            	pop	a
 867                     ; 331     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+2, (u8)rcvdata[2] );
 869  0035 3b000f        	push	L3_rcvdata+2
 870  0038 ad51          	call	LC005
 871  003a 1c0002        	addw	x,#L31_Receivers+2
 872  003d cd0000        	call	_FLASH_ProgramByte
 874  0040 84            	pop	a
 875                     ; 332     FLASH_ProgramByte( (u16)(u8*)((&Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv)))]))+3, (u8)rcvdata[3] );
 877  0041 3b0010        	push	L3_rcvdata+3
 878  0044 ad45          	call	LC005
 879  0046 1c0003        	addw	x,#L31_Receivers+3
 880  0049 cd0000        	call	_FLASH_ProgramByte
 882  004c 84            	pop	a
 883                     ; 333     FLASH_ProgramByte( (u16)(u8*)(&Receivers.NumLrndRcv), (u8)(*(u8*)(&(Receivers.NumLrndRcv))+1) );
 885  004d c60028        	ld	a,L31_Receivers+40
 886  0050 4c            	inc	a
 887  0051 88            	push	a
 888  0052 ae0028        	ldw	x,#L31_Receivers+40
 889  0055 cd0000        	call	_FLASH_ProgramByte
 891  0058 84            	pop	a
 892                     ; 334     FLASH_Lock(FLASH_MemType_Program);
 894  0059 a6fd          	ld	a,#253
 895  005b cd0000        	call	_FLASH_Lock
 897                     ; 336     if( BtoDW.DW != (*(u32*)(&(Receivers.ID[(*(u8*)(&(Receivers.NumLrndRcv))) - 1]))) )
 899  005e ad2b          	call	LC005
 900  0060 1d0004        	subw	x,#4
 901  0063 ad2e          	call	LC006
 903  0065 2712          	jreq	L513
 904                     ; 338       Errors_SetError(ERROR_FLASH_WRITE);
 906  0067 a604          	ld	a,#4
 907  0069 cd0000        	call	_Errors_SetError
 909  006c 200b          	jra	L513
 910  006e               L313:
 911                     ; 317   for(i = 0; i < (*(u8*)(&(Receivers.NumLrndRcv))); i++)
 913  006e 0c02          	inc	(OFST+0,sp)
 914  0070               L703:
 917  0070 7b02          	ld	a,(OFST+0,sp)
 918  0072 c10028        	cp	a,L31_Receivers+40
 919  0075 2590          	jrult	L303
 920  0077 209b          	jra	L113
 921  0079               L513:
 922                     ; 341   LrnModeActive = FALSE;
 924  0079 72110000      	bres	L71_LrnModeActive
 925                     ; 342   BLINKSTOP_GREENLED;
 927  007d 72110000      	bres	_flag_blink_greenLED
 930  0081 7217500a      	bres	20490,#3
 933  0085 7219500a      	bres	20490,#4
 934                     ; 343 }
 939  0089 85            	popw	x
 940  008a 81            	ret	
 941  008b               LC005:
 942  008b c60028        	ld	a,L31_Receivers+40
 943  008e 97            	ld	xl,a
 944  008f a604          	ld	a,#4
 945  0091 42            	mul	x,a
 946  0092 81            	ret	
 947  0093               LC006:
 948  0093 1c0000        	addw	x,#L31_Receivers
 949  0096 cd0000        	call	c_ltor
 951  0099 ae0009        	ldw	x,#L51_BtoDW
 952  009c cc0000        	jp	c_lcmp
1013                     ; 345 void BTN1_Released()
1013                     ; 346 {
1014                     .text:	section	.text,new
1015  0000               _BTN1_Released:
1017  0000 5203          	subw	sp,#3
1018       00000003      OFST:	set	3
1021                     ; 347   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
1023  0002 be00          	ldw	x,_BTN1_press_timer
1024  0004 a30bb8        	cpw	x,#3000
1025  0007 245e          	jruge	L343
1026                     ; 350     if(!Errors_IsError())
1028  0009 cd0000        	call	_Errors_IsError
1030  000c 4d            	tnz	a
1031  000d 2703cc00cd    	jrne	L753
1032                     ; 352       if(!LrnModeActive)
1034  0012 7200000046    	btjt	L71_LrnModeActive,L743
1035                     ; 354         if((*(u8*)(&Receivers.NumLrndRcv)) < 10)
1037  0017 c60028        	ld	a,L31_Receivers+40
1038  001a a10a          	cp	a,#10
1039  001c 2422          	jruge	L153
1040                     ; 356           LrnModeActive = TRUE;
1042  001e 72100000      	bset	L71_LrnModeActive
1043                     ; 357           BLINK_GREENLED(255);
1045  0022 35ff0000      	mov	_blink_greenLED_times,#255
1048  0026 72100000      	bset	_flag_blink_unlimited
1053  002a 5f            	clrw	x
1054  002b 72100000      	bset	_flag_blink_on_off
1055  002f bf00          	ldw	_cnt_state_greenLED,x
1058  0031 7217500a      	bres	20490,#3
1061  0035 7218500a      	bset	20490,#4
1065  0039 72100000      	bset	_flag_blink_greenLED
1068  003d cc00cd        	jra	L753
1069  0040               L153:
1070                     ; 361           BLINK_REDLED(2);
1072  0040 35020000      	mov	_blink_redLED_times,#2
1075  0044 72110000      	bres	_flag_blink_unlimited
1080  0048 5f            	clrw	x
1081  0049 72100000      	bset	_flag_blink_on_off
1082  004d bf00          	ldw	_cnt_state_redLED,x
1085  004f 7216500a      	bset	20490,#3
1088  0053 7219500a      	bres	20490,#4
1092  0057 72100000      	bset	_flag_blink_redLED
1094  005b 2070          	jra	L753
1095  005d               L743:
1096                     ; 366         LrnModeActive = FALSE;
1098  005d 72110000      	bres	L71_LrnModeActive
1099                     ; 367         BLINKSTOP_GREENLED;
1101  0061 72110000      	bres	_flag_blink_greenLED
1106  0065 205e          	jp	L173
1107  0067               L343:
1108                     ; 376     LED_RED_ON;
1110  0067 7216500a      	bset	20490,#3
1113  006b 7219500a      	bres	20490,#4
1114                     ; 377     FLASH_Unlock(FLASH_MemType_Program);
1117  006f a6fd          	ld	a,#253
1118  0071 cd0000        	call	_FLASH_Unlock
1120                     ; 378     adr = (u16)&Receivers;
1122  0074 ae0000        	ldw	x,#L31_Receivers
1123  0077 1f01          	ldw	(OFST-2,sp),x
1124                     ; 379     for(i = 0; i < sizeof(Receivers); i++)
1126  0079 0f03          	clr	(OFST+0,sp)
1127  007b               L163:
1128                     ; 381       FLASH_EraseByte(adr++);
1130  007b 1e01          	ldw	x,(OFST-2,sp)
1131  007d 5c            	incw	x
1132  007e 1f01          	ldw	(OFST-2,sp),x
1133  0080 5a            	decw	x
1134  0081 cd0000        	call	_FLASH_EraseByte
1136                     ; 379     for(i = 0; i < sizeof(Receivers); i++)
1138  0084 0c03          	inc	(OFST+0,sp)
1141  0086 7b03          	ld	a,(OFST+0,sp)
1142  0088 a129          	cp	a,#41
1143  008a 25ef          	jrult	L163
1144                     ; 383     FLASH_Lock(FLASH_MemType_Program);
1146  008c a6fd          	ld	a,#253
1147  008e cd0000        	call	_FLASH_Lock
1149                     ; 385     Errors_ResetError(ERROR_FLASH_ERASE);
1151  0091 a605          	ld	a,#5
1152  0093 cd0000        	call	_Errors_ResetError
1154                     ; 386     if((*(u8*)(&Receivers.NumLrndRcv)) != 0)
1156  0096 c60028        	ld	a,L31_Receivers+40
1157  0099 2705          	jreq	L763
1158                     ; 388       Errors_SetError(ERROR_FLASH_ERASE);
1160  009b a605          	ld	a,#5
1161  009d cd0000        	call	_Errors_SetError
1163  00a0               L763:
1164                     ; 390     if(!Errors_CheckError(ERROR_FLASH_ERASE))
1166  00a0 a605          	ld	a,#5
1167  00a2 cd0000        	call	_Errors_CheckError
1169  00a5 4d            	tnz	a
1170  00a6 261d          	jrne	L173
1171                     ; 392       for(i = 0; i < MAX_NUM_RECEIVERS; i++)
1173  00a8 6b03          	ld	(OFST+0,sp),a
1174  00aa               L373:
1175                     ; 394         if((*(u32*)(&(Receivers.ID[i]))) != 0)
1177  00aa 97            	ld	xl,a
1178  00ab a604          	ld	a,#4
1179  00ad 42            	mul	x,a
1180  00ae 1c0000        	addw	x,#L31_Receivers
1181  00b1 cd0000        	call	c_lzmp
1183  00b4 2707          	jreq	L104
1184                     ; 396           Errors_SetError(ERROR_FLASH_ERASE);
1186  00b6 a605          	ld	a,#5
1187  00b8 cd0000        	call	_Errors_SetError
1189                     ; 397           break;
1191  00bb 2008          	jra	L173
1192  00bd               L104:
1193                     ; 392       for(i = 0; i < MAX_NUM_RECEIVERS; i++)
1195  00bd 0c03          	inc	(OFST+0,sp)
1198  00bf 7b03          	ld	a,(OFST+0,sp)
1199  00c1 a10a          	cp	a,#10
1200  00c3 25e5          	jrult	L373
1201  00c5               L173:
1202                     ; 401     LED_OFF;
1207  00c5 7217500a      	bres	20490,#3
1209  00c9 7219500a      	bres	20490,#4
1210  00cd               L753:
1211                     ; 403   BTN1_press_timer = 0;
1213  00cd 5f            	clrw	x
1214  00ce bf00          	ldw	_BTN1_press_timer,x
1215                     ; 404 }
1218  00d0 5b03          	addw	sp,#3
1219  00d2 81            	ret	
1222                     	switch	.ubsct
1223  0000               L304_read_reg:
1224  0000 00            	ds.b	1
1262                     ; 406 void TASK_1000ms()
1262                     ; 407 {
1263                     .text:	section	.text,new
1264  0000               _TASK_1000ms:
1268                     ; 412     FLAG_check_nrf_reg = TRUE;
1270  0000 72100003      	bset	L52_FLAG_check_nrf_reg
1271                     ; 417     Errors_ResetError(ERROR_NRF24_REG);
1273  0004 a603          	ld	a,#3
1274  0006 cd0000        	call	_Errors_ResetError
1276                     ; 418     debug_reg_idx = 0;
1278  0009 3f0f          	clr	L14_debug_reg_idx
1279                     ; 419     nrf24_readRegister(CONFIG, &read_reg, 1);
1281  000b 4b01          	push	#1
1282  000d ae0000        	ldw	x,#L304_read_reg
1283  0010 89            	pushw	x
1284  0011 4f            	clr	a
1285  0012 cd0000        	call	_nrf24_readRegister
1287  0015 5b03          	addw	sp,#3
1288                     ; 420     debug_registers[debug_reg_idx++] = read_reg;
1290  0017 ad6c          	call	LC008
1291                     ; 425     nrf24_readRegister(RF_CH, &read_reg, 1);
1293  0019 4b01          	push	#1
1294  001b ae0000        	ldw	x,#L304_read_reg
1295  001e 89            	pushw	x
1296  001f a605          	ld	a,#5
1297  0021 cd0000        	call	_nrf24_readRegister
1299  0024 5b03          	addw	sp,#3
1300                     ; 426     debug_registers[debug_reg_idx++] = read_reg;
1302  0026 ad5d          	call	LC008
1303                     ; 431     nrf24_readRegister(RX_PW_P1, &read_reg, 1);
1305  0028 4b01          	push	#1
1306  002a ae0000        	ldw	x,#L304_read_reg
1307  002d 89            	pushw	x
1308  002e a612          	ld	a,#18
1309  0030 cd0000        	call	_nrf24_readRegister
1311  0033 5b03          	addw	sp,#3
1312                     ; 432     debug_registers[debug_reg_idx++] = read_reg;
1314  0035 ad4e          	call	LC008
1315                     ; 437     nrf24_readRegister(RF_SETUP, &read_reg, 1);
1317  0037 4b01          	push	#1
1318  0039 ae0000        	ldw	x,#L304_read_reg
1319  003c 89            	pushw	x
1320  003d a606          	ld	a,#6
1321  003f cd0000        	call	_nrf24_readRegister
1323  0042 5b03          	addw	sp,#3
1324                     ; 438     debug_registers[debug_reg_idx++] = read_reg;
1326  0044 ad3f          	call	LC008
1327                     ; 443     nrf24_readRegister(EN_AA, &read_reg, 1);
1329  0046 4b01          	push	#1
1330  0048 ae0000        	ldw	x,#L304_read_reg
1331  004b 89            	pushw	x
1332  004c a601          	ld	a,#1
1333  004e cd0000        	call	_nrf24_readRegister
1335  0051 5b03          	addw	sp,#3
1336                     ; 444     debug_registers[debug_reg_idx++] = read_reg;
1338  0053 ad30          	call	LC008
1339                     ; 449     nrf24_readRegister(EN_RXADDR, &read_reg, 1);
1341  0055 4b01          	push	#1
1342  0057 ae0000        	ldw	x,#L304_read_reg
1343  005a 89            	pushw	x
1344  005b a602          	ld	a,#2
1345  005d cd0000        	call	_nrf24_readRegister
1347  0060 5b03          	addw	sp,#3
1348                     ; 450     debug_registers[debug_reg_idx++] = read_reg;
1350  0062 ad21          	call	LC008
1351                     ; 455     nrf24_readRegister(SETUP_RETR, &read_reg, 1);
1353  0064 4b01          	push	#1
1354  0066 ae0000        	ldw	x,#L304_read_reg
1355  0069 89            	pushw	x
1356  006a a604          	ld	a,#4
1357  006c cd0000        	call	_nrf24_readRegister
1359  006f 5b03          	addw	sp,#3
1360                     ; 456     debug_registers[debug_reg_idx++] = read_reg;
1362  0071 ad12          	call	LC008
1363                     ; 461     nrf24_readRegister(DYNPD, &read_reg, 1);
1365  0073 4b01          	push	#1
1366  0075 ae0000        	ldw	x,#L304_read_reg
1367  0078 89            	pushw	x
1368  0079 a61c          	ld	a,#28
1369  007b cd0000        	call	_nrf24_readRegister
1371  007e 5b03          	addw	sp,#3
1372                     ; 462     debug_registers[debug_reg_idx++] = read_reg;
1374  0080 ad03          	call	LC008
1375                     ; 479   task_1000ms_cnt++;
1377  0082 3c10          	inc	L34_task_1000ms_cnt
1378                     ; 480 }
1381  0084 81            	ret	
1382  0085               LC008:
1383  0085 b60f          	ld	a,L14_debug_reg_idx
1384  0087 3c0f          	inc	L14_debug_reg_idx
1385  0089 5f            	clrw	x
1386  008a 97            	ld	xl,a
1387  008b b600          	ld	a,L304_read_reg
1388  008d e701          	ld	(L73_debug_registers,x),a
1389  008f 81            	ret	
1412                     ; 482 void TASK_500ms()
1412                     ; 483 {
1413                     .text:	section	.text,new
1414  0000               _TASK_500ms:
1418                     ; 485 }
1421  0000 81            	ret	
1444                     ; 487 void TASK_250ms()
1444                     ; 488 {
1445                     .text:	section	.text,new
1446  0000               _TASK_250ms:
1450                     ; 490 }
1453  0000 81            	ret	
1777                     	xdef	_main
1778                     	xdef	_IsLearnedID
1779                     	xdef	_LearnNewID
1780                     	xdef	_BTN1_Released
1781                     	xdef	_TASK_250ms
1782                     	xdef	_TASK_500ms
1783                     	xdef	_TASK_1000ms
1784                     	switch	.ubsct
1785  0001               L73_debug_registers:
1786  0001 000000000000  	ds.b	8
1787  0009               L51_BtoDW:
1788  0009 00000000      	ds.b	4
1789                     .const:	section	.text
1790  0000               L31_Receivers:
1791  0000 000000000000  	ds.b	41
1792                     	switch	.ubsct
1793  000d               L3_rcvdata:
1794  000d 000000000000  	ds.b	6
1795                     	xref	_Timeout_IsTimeout2
1796                     	xref	_Timeout_IsTimeout1
1797                     	xref	_Timeout_SetTimeout2
1798                     	xref	_Timeout_SetTimeout1
1799                     	xbit	_flag_blink_unlimited
1800                     	xbit	_flag_blink_greenLED
1801                     	xbit	_flag_blink_redLED
1802                     	xbit	_flag_blink_on_off
1803                     	xref.b	_cnt_state_greenLED
1804                     	xref.b	_cnt_state_redLED
1805                     	xref.b	_blink_greenLED_times
1806                     	xref.b	_blink_redLED_times
1807                     	xbit	_FLAG_1000ms
1808                     	xbit	_FLAG_500ms
1809                     	xbit	_FLAG_250ms
1810                     	xref.b	_BTN1_press_timer
1811                     	xref.b	_BTN1_DEB_STATE
1812                     	xref	_nrf24_readRegister
1813                     	xref	_nrf24_getData
1814                     	xref	_nrf24_config_sb
1815                     	xref	_nrf24_init
1816                     	xref	_Errors_IsError
1817                     	xref	_Errors_CheckError
1818                     	xref	_Errors_ResetError
1819                     	xref	_Errors_SetError
1820                     	xref	_Errors_Init
1821                     	xref	_Config
1822                     	xref	_RST_ClearFlag
1823                     	xref	_RST_GetFlagStatus
1824                     	xref	_IWDG_Enable
1825                     	xref	_IWDG_ReloadCounter
1826                     	xref	_FLASH_EraseByte
1827                     	xref	_FLASH_ProgramByte
1828                     	xref	_FLASH_Lock
1829                     	xref	_FLASH_Unlock
1849                     	xref	c_lzmp
1850                     	xref	c_lcmp
1851                     	xref	c_ltor
1852                     	end
