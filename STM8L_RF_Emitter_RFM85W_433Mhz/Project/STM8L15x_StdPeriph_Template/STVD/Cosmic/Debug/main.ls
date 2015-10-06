   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  59                     ; 49 void main(void)
  59                     ; 50 {
  61                     .text:	section	.text,new
  62  0000               _main:
  66                     ; 52   disableInterrupts();
  69  0000 9b            	sim	
  71                     ; 53   Config();
  74  0001 cd0000        	call	_Config
  76                     ; 54   Errors_Init();
  78  0004 cd0000        	call	_Errors_Init
  80                     ; 55   enableInterrupts();
  83  0007 9a            	rim	
  85                     ; 56   Goto_HALT();
  89  0008               L33:
  91  0008 cd0000        	call	L3_Goto_HALT
  92                     ; 60     if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2))
  94  000b b600          	ld	a,_btn_pressed
  95  000d a101          	cp	a,#1
  96  000f 2710          	jreq	L34
  98  0011 a102          	cp	a,#2
  99  0013 270c          	jreq	L34
 100                     ; 62       DELAY_STOP;
 102  0015 721152e0      	bres	21216,#0
 105  0019 ae0200        	ldw	x,#512
 106  001c cd0000        	call	_CLK_PeripheralClockConfig
 108                     ; 63       goto sleep;
 111  001f 20e7          	jra	L33
 112  0021               L34:
 113                     ; 66     while(!DELAY_EXPIRED);           // wait for power-up delay to expire (~20ms)
 115  0021 720152e5fb    	btjf	21221,#0,L34
 116                     ; 67     DELAY_STOP;
 118  0026 721152e0      	bres	21216,#0
 121  002a ae0200        	ldw	x,#512
 122  002d cd0000        	call	_CLK_PeripheralClockConfig
 124                     ; 69     if(btn_pressed == BUTTON1)
 127  0030 b600          	ld	a,_btn_pressed
 128  0032 4a            	dec	a
 129  0033 2604          	jrne	L74
 130                     ; 71       RF_Send(RFCMD_HEATING_ON);
 132  0035 a60f          	ld	a,#15
 135  0037 2008          	jp	LC001
 136  0039               L74:
 137                     ; 73     else if(btn_pressed = BUTTON2)
 139  0039 a602          	ld	a,#2
 140  003b b700          	ld	_btn_pressed,a
 141  003d 27c9          	jreq	L33
 142                     ; 75       RF_Send(RFCMD_HEATING_OFF);
 144  003f a6f0          	ld	a,#240
 145  0041               LC001:
 146  0041 cd0000        	call	_RF_Send
 148                     ; 78     sleep:
 148                     ; 79     Goto_HALT();
 151  0044 20c2          	jra	L33
 179                     ; 83 static void Goto_HALT()
 179                     ; 84 {
 180                     .text:	section	.text,new
 181  0000               L3_Goto_HALT:
 185                     ; 86   LED_OFF;
 187  0000 721b500a      	bres	20490,#5
 190  0004 721d500a      	bres	20490,#6
 191                     ; 87   RFM_OFF;
 194  0008 72165005      	bset	20485,#3
 195                     ; 88   btn_pressed = 0;
 197  000c 3f00          	clr	_btn_pressed
 198                     ; 89   CLK->PCKENR1 = 0x00; //Stop all peripheral clocks
 200  000e 725f50c3      	clr	20675
 201                     ; 90   CLK->PCKENR2 = 0x00;
 203  0012 725f50c4      	clr	20676
 204                     ; 91   CLK->PCKENR3 = 0x00;
 206  0016 725f50d0      	clr	20688
 207                     ; 92   PWR_FastWakeUpCmd(ENABLE);     //Enables or disables the Fast WakeUp from Ultra Low Power mode, system does not wait for VrefINT to stabilize (around 3ms)
 209  001a a601          	ld	a,#1
 210  001c cd0000        	call	_PWR_FastWakeUpCmd
 212                     ; 93   PWR_UltraLowPowerCmd(ENABLE);  //Enables or disables the Ultra Low Power mode, disable VrefINT during Halt or Active-Halt modes
 214  001f a601          	ld	a,#1
 215  0021 cd0000        	call	_PWR_UltraLowPowerCmd
 217                     ; 94   CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE);  //Configures clock during halt and active halt modes
 219  0024 ae2001        	ldw	x,#8193
 220  0027 cd0000        	call	_CLK_HaltConfig
 222                     ; 96   CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);  //When it is set, the main voltage regulator is powered off as soon as the MCU enters Active-halt mode, so the wakeup time is longer
 224  002a ae1001        	ldw	x,#4097
 225  002d cd0000        	call	_CLK_HaltConfig
 227                     ; 98   halt(); /* go to HALT mode */
 230  0030 8e            	halt	
 232                     ; 99 }
 236  0031 81            	ret	
 280                     ; 101 static void LED_Green_Blink(u8 times)
 280                     ; 102 {
 281                     .text:	section	.text,new
 282  0000               L5_LED_Green_Blink:
 284  0000 88            	push	a
 285  0001 88            	push	a
 286       00000001      OFST:	set	1
 289                     ; 103   if(times > 1)
 291  0002 a102          	cp	a,#2
 292  0004 2403cc00ac    	jrult	L701
 293                     ; 106     for(i = 0; i < times - 1; i++)
 295  0009 0f01          	clr	(OFST+0,sp)
 297  000b 2064          	jra	L511
 298  000d               L111:
 299                     ; 108       LED_GREEN_ON;
 301  000d 721a500a      	bset	20490,#5
 304  0011 721d500a      	bres	20490,#6
 305                     ; 109       DELAY50MS_START;
 308  0015 ae0201        	ldw	x,#513
 309  0018 cd0000        	call	_CLK_PeripheralClockConfig
 313  001b 350b52e8      	mov	21224,#11
 316  001f 353152e9      	mov	21225,#49
 319  0023 725f52e7      	clr	21223
 322  0027 721152e5      	bres	21221,#0
 325  002b 721052e0      	bset	21216,#0
 328  002f               L321:
 329                     ; 110       while(!DELAY_EXPIRED);
 331  002f 720152e5fb    	btjf	21221,#0,L321
 332                     ; 111       DELAY_STOP;
 334  0034 721152e0      	bres	21216,#0
 337  0038 ae0200        	ldw	x,#512
 338  003b cd0000        	call	_CLK_PeripheralClockConfig
 340                     ; 112       LED_OFF;
 343  003e 721b500a      	bres	20490,#5
 346  0042 721d500a      	bres	20490,#6
 347                     ; 113       DELAY200MS_START;
 350  0046 ae0201        	ldw	x,#513
 351  0049 cd0000        	call	_CLK_PeripheralClockConfig
 355  004c 350b52e8      	mov	21224,#11
 358  0050 35c352e9      	mov	21225,#195
 361  0054 725f52e7      	clr	21223
 364  0058 721152e5      	bres	21221,#0
 367  005c 721052e0      	bset	21216,#0
 370  0060               L131:
 371                     ; 114       while(!DELAY_EXPIRED);
 373  0060 720152e5fb    	btjf	21221,#0,L131
 374                     ; 115       DELAY_STOP;
 376  0065 721152e0      	bres	21216,#0
 379  0069 ae0200        	ldw	x,#512
 380  006c cd0000        	call	_CLK_PeripheralClockConfig
 382                     ; 106     for(i = 0; i < times - 1; i++)
 385  006f 0c01          	inc	(OFST+0,sp)
 386  0071               L511:
 389  0071 7b02          	ld	a,(OFST+1,sp)
 390  0073 5f            	clrw	x
 391  0074 97            	ld	xl,a
 392  0075 5a            	decw	x
 393  0076 7b01          	ld	a,(OFST+0,sp)
 394  0078 905f          	clrw	y
 395  007a 9097          	ld	yl,a
 396  007c 90bf00        	ldw	c_y,y
 397  007f b300          	cpw	x,c_y
 398  0081 2c8a          	jrsgt	L111
 399                     ; 117     LED_GREEN_ON;
 401  0083 721a500a      	bset	20490,#5
 404  0087 721d500a      	bres	20490,#6
 405                     ; 118     DELAY50MS_START;
 408  008b ae0201        	ldw	x,#513
 409  008e cd0000        	call	_CLK_PeripheralClockConfig
 413  0091 350b52e8      	mov	21224,#11
 416  0095 353152e9      	mov	21225,#49
 419  0099 725f52e7      	clr	21223
 422  009d 721152e5      	bres	21221,#0
 425  00a1 721052e0      	bset	21216,#0
 428  00a5               L731:
 429                     ; 119     while(!DELAY_EXPIRED);
 431  00a5 720152e5fb    	btjf	21221,#0,L731
 432                     ; 120     DELAY_STOP;
 435                     ; 121     LED_OFF;
 440  00aa 202c          	jp	LC002
 441  00ac               L701:
 442                     ; 123   else if(times == 1)
 444  00ac 7b02          	ld	a,(OFST+1,sp)
 445  00ae 4a            	dec	a
 446  00af 2639          	jrne	L341
 447                     ; 125     LED_GREEN_ON;
 449  00b1 721a500a      	bset	20490,#5
 452  00b5 721d500a      	bres	20490,#6
 453                     ; 126     DELAY50MS_START;
 456  00b9 ae0201        	ldw	x,#513
 457  00bc cd0000        	call	_CLK_PeripheralClockConfig
 461  00bf 350b52e8      	mov	21224,#11
 464  00c3 353152e9      	mov	21225,#49
 467  00c7 725f52e7      	clr	21223
 470  00cb 721152e5      	bres	21221,#0
 473  00cf 721052e0      	bset	21216,#0
 476  00d3               L151:
 477                     ; 127     while(!DELAY_EXPIRED);
 479  00d3 720152e5fb    	btjf	21221,#0,L151
 480                     ; 128     DELAY_STOP;
 485                     ; 129     LED_OFF;
 490  00d8               LC002:
 492  00d8 721152e0      	bres	21216,#0
 494  00dc ae0200        	ldw	x,#512
 495  00df cd0000        	call	_CLK_PeripheralClockConfig
 497  00e2 721b500a      	bres	20490,#5
 499  00e6 721d500a      	bres	20490,#6
 501  00ea               L341:
 502                     ; 131 }
 505  00ea 85            	popw	x
 506  00eb 81            	ret	
 550                     ; 133 static void LED_Red_Blink(u8 times)
 550                     ; 134 {
 551                     .text:	section	.text,new
 552  0000               L7_LED_Red_Blink:
 554  0000 88            	push	a
 555  0001 88            	push	a
 556       00000001      OFST:	set	1
 559                     ; 135   if(times > 1)
 561  0002 a102          	cp	a,#2
 562  0004 2403cc00ac    	jrult	L771
 563                     ; 138     for(i = 0; i < times - 1; i++)
 565  0009 0f01          	clr	(OFST+0,sp)
 567  000b 2064          	jra	L502
 568  000d               L102:
 569                     ; 140       LED_RED_ON;
 571  000d 721b500a      	bres	20490,#5
 574  0011 721c500a      	bset	20490,#6
 575                     ; 141       DELAY50MS_START;
 578  0015 ae0201        	ldw	x,#513
 579  0018 cd0000        	call	_CLK_PeripheralClockConfig
 583  001b 350b52e8      	mov	21224,#11
 586  001f 353152e9      	mov	21225,#49
 589  0023 725f52e7      	clr	21223
 592  0027 721152e5      	bres	21221,#0
 595  002b 721052e0      	bset	21216,#0
 598  002f               L312:
 599                     ; 142       while(!DELAY_EXPIRED);
 601  002f 720152e5fb    	btjf	21221,#0,L312
 602                     ; 143       DELAY_STOP;
 604  0034 721152e0      	bres	21216,#0
 607  0038 ae0200        	ldw	x,#512
 608  003b cd0000        	call	_CLK_PeripheralClockConfig
 610                     ; 144       LED_OFF;
 613  003e 721b500a      	bres	20490,#5
 616  0042 721d500a      	bres	20490,#6
 617                     ; 145       DELAY200MS_START;
 620  0046 ae0201        	ldw	x,#513
 621  0049 cd0000        	call	_CLK_PeripheralClockConfig
 625  004c 350b52e8      	mov	21224,#11
 628  0050 35c352e9      	mov	21225,#195
 631  0054 725f52e7      	clr	21223
 634  0058 721152e5      	bres	21221,#0
 637  005c 721052e0      	bset	21216,#0
 640  0060               L122:
 641                     ; 146       while(!DELAY_EXPIRED);
 643  0060 720152e5fb    	btjf	21221,#0,L122
 644                     ; 147       DELAY_STOP;
 646  0065 721152e0      	bres	21216,#0
 649  0069 ae0200        	ldw	x,#512
 650  006c cd0000        	call	_CLK_PeripheralClockConfig
 652                     ; 138     for(i = 0; i < times - 1; i++)
 655  006f 0c01          	inc	(OFST+0,sp)
 656  0071               L502:
 659  0071 7b02          	ld	a,(OFST+1,sp)
 660  0073 5f            	clrw	x
 661  0074 97            	ld	xl,a
 662  0075 5a            	decw	x
 663  0076 7b01          	ld	a,(OFST+0,sp)
 664  0078 905f          	clrw	y
 665  007a 9097          	ld	yl,a
 666  007c 90bf00        	ldw	c_y,y
 667  007f b300          	cpw	x,c_y
 668  0081 2c8a          	jrsgt	L102
 669                     ; 149     LED_RED_ON;
 671  0083 721b500a      	bres	20490,#5
 674  0087 721c500a      	bset	20490,#6
 675                     ; 150     DELAY50MS_START;
 678  008b ae0201        	ldw	x,#513
 679  008e cd0000        	call	_CLK_PeripheralClockConfig
 683  0091 350b52e8      	mov	21224,#11
 686  0095 353152e9      	mov	21225,#49
 689  0099 725f52e7      	clr	21223
 692  009d 721152e5      	bres	21221,#0
 695  00a1 721052e0      	bset	21216,#0
 698  00a5               L722:
 699                     ; 151     while(!DELAY_EXPIRED);
 701  00a5 720152e5fb    	btjf	21221,#0,L722
 702                     ; 152     DELAY_STOP;
 705                     ; 153     LED_OFF;
 710  00aa 202c          	jp	LC003
 711  00ac               L771:
 712                     ; 155   else if(times == 1)
 714  00ac 7b02          	ld	a,(OFST+1,sp)
 715  00ae 4a            	dec	a
 716  00af 2639          	jrne	L332
 717                     ; 157     LED_RED_ON;
 719  00b1 721b500a      	bres	20490,#5
 722  00b5 721c500a      	bset	20490,#6
 723                     ; 158     DELAY50MS_START;
 726  00b9 ae0201        	ldw	x,#513
 727  00bc cd0000        	call	_CLK_PeripheralClockConfig
 731  00bf 350b52e8      	mov	21224,#11
 734  00c3 353152e9      	mov	21225,#49
 737  00c7 725f52e7      	clr	21223
 740  00cb 721152e5      	bres	21221,#0
 743  00cf 721052e0      	bset	21216,#0
 746  00d3               L142:
 747                     ; 159     while(!DELAY_EXPIRED);
 749  00d3 720152e5fb    	btjf	21221,#0,L142
 750                     ; 160     DELAY_STOP;
 755                     ; 161     LED_OFF;
 760  00d8               LC003:
 762  00d8 721152e0      	bres	21216,#0
 764  00dc ae0200        	ldw	x,#512
 765  00df cd0000        	call	_CLK_PeripheralClockConfig
 767  00e2 721b500a      	bres	20490,#5
 769  00e6 721d500a      	bres	20490,#6
 771  00ea               L332:
 772                     ; 163 }
 775  00ea 85            	popw	x
 776  00eb 81            	ret	
 789                     	xdef	_main
 790                     	xref	_RF_Send
 791                     	xref	_Errors_Init
 792                     	xref	_Config
 793                     	xref.b	_btn_pressed
 794                     	xref	_PWR_UltraLowPowerCmd
 795                     	xref	_PWR_FastWakeUpCmd
 796                     	xref	_CLK_HaltConfig
 797                     	xref	_CLK_PeripheralClockConfig
 798                     	xref.b	c_y
 817                     	end
