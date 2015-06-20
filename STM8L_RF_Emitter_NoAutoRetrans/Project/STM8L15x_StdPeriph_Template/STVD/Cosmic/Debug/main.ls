   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               L3_ownID_btn1:
  23  0000 a42e3d62      	dc.l	-1540473502
  24  0004               L5_ownID_btn2:
  25  0004 a727245e      	dc.l	-1490607010
  26                     .const:	section	.text
  27  0000               L71_address:
  28  0000 f7            	dc.b	247
  29  0001 ef            	dc.b	239
  30  0002 8d            	dc.b	141
  31  0003 91            	dc.b	145
  32  0004 6c            	dc.b	108
  90                     ; 107 void main(void)
  90                     ; 108 {
  92                     .text:	section	.text,new
  93  0000               _main:
  95  0000 88            	push	a
  96       00000001      OFST:	set	1
  99                     ; 110   disableInterrupts();
 102  0001 9b            	sim	
 104                     ; 111   Config();
 107  0002 cd0000        	call	_Config
 109                     ; 112   Errors_Init();
 111  0005 cd0000        	call	_Errors_Init
 113                     ; 113   enableInterrupts();
 116  0008 9a            	rim	
 118                     ; 114   Goto_HALT();
 122  0009               L15:
 124  0009 cd0000        	call	L11_Goto_HALT
 125                     ; 118     if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2))
 127  000c b600          	ld	a,_btn_pressed
 128  000e a101          	cp	a,#1
 129  0010 2710          	jreq	L55
 131  0012 a102          	cp	a,#2
 132  0014 270c          	jreq	L55
 133                     ; 120       DELAY_STOP;
 135  0016 721152e0      	bres	21216,#0
 138  001a ae0200        	ldw	x,#512
 139  001d cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 121       goto sleep;
 142                     ; 171     sleep:
 142                     ; 172     Goto_HALT();
 145  0020 20e7          	jra	L15
 146  0022               L55:
 147                     ; 124     PWR_PVDCmd(ENABLE);                    // Power voltage detector and brownout Reset unit supply current 2,6uA
 149  0022 a601          	ld	a,#1
 150  0024 cd0000        	call	_PWR_PVDCmd
 152                     ; 125     PWR_PVDLevelConfig(PWR_PVDLevel_2V26); // Set Programmable voltage detector threshold to 2,26V 
 154  0027 a604          	ld	a,#4
 155  0029 cd0000        	call	_PWR_PVDLevelConfig
 158  002c               L16:
 159                     ; 127     while(!DELAY_EXPIRED);           // wait for power-up delay to expire (~120ms) - needed for nRF24L01+ power up 
 161  002c 720152e5fb    	btjf	21221,#0,L16
 162                     ; 128     DELAY_STOP;
 164  0031 721152e0      	bres	21216,#0
 167  0035 ae0200        	ldw	x,#512
 168  0038 cd0000        	call	_CLK_PeripheralClockConfig
 170                     ; 130     CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
 173  003b ae0401        	ldw	x,#1025
 174  003e cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 131     radio_sb_init (address, HAL_NRF_PTX);
 178  0041 4b00          	push	#0
 179  0043 ae0000        	ldw	x,#L71_address
 180  0046 cd0000        	call	_radio_sb_init
 182  0049 84            	pop	a
 183                     ; 133     if(btn_pressed == BUTTON1)
 185  004a b600          	ld	a,_btn_pressed
 186  004c 4a            	dec	a
 187  004d 2608          	jrne	L56
 188                     ; 135       TXmsg.M.ownID = ownID_btn1;
 190  004f be02          	ldw	x,L3_ownID_btn1+2
 191  0051 bf08          	ldw	L7_TXmsg+2,x
 192  0053 be00          	ldw	x,L3_ownID_btn1
 194  0055 200c          	jp	LC001
 195  0057               L56:
 196                     ; 137     else if(btn_pressed = BUTTON2)
 198  0057 a602          	ld	a,#2
 199  0059 b700          	ld	_btn_pressed,a
 200  005b 2708          	jreq	L76
 201                     ; 139       TXmsg.M.ownID = ownID_btn2;
 203  005d be06          	ldw	x,L5_ownID_btn2+2
 204  005f bf08          	ldw	L7_TXmsg+2,x
 205  0061 be04          	ldw	x,L5_ownID_btn2
 206  0063               LC001:
 207  0063 bf06          	ldw	L7_TXmsg,x
 208  0065               L76:
 209                     ; 141     pload_sb[0] = TXmsg.B.b[0];
 211  0065 450600        	mov	L12_pload_sb,L7_TXmsg
 212                     ; 142     pload_sb[1] = TXmsg.B.b[1];
 214  0068 450701        	mov	L12_pload_sb+1,L7_TXmsg+1
 215                     ; 143     pload_sb[2] = TXmsg.B.b[2];
 217  006b 450802        	mov	L12_pload_sb+2,L7_TXmsg+2
 218                     ; 144     pload_sb[3] = TXmsg.B.b[3];
 220  006e 450903        	mov	L12_pload_sb+3,L7_TXmsg+3
 221                     ; 146     TXmsg.M.status = 0;                    /* Reset status byte */
 223  0071 3f0a          	clr	L7_TXmsg+4
 224                     ; 150     if(PWR->CSR1 & PWR_FLAG_PVDOF)
 226  0073 720d50b204    	btjf	20658,#6,L37
 227                     ; 153       TXmsg.M.status |= STATUS_LOWBATT;
 229  0078 7210000a      	bset	L7_TXmsg+4,#0
 230  007c               L37:
 231                     ; 155     PWR_PVDCmd(DISABLE);
 233  007c 4f            	clr	a
 234  007d cd0000        	call	_PWR_PVDCmd
 236                     ; 157     for(l_cnt = 0; l_cnt < 3; l_cnt++)
 238  0080 0f01          	clr	(OFST+0,sp)
 239  0082               L57:
 240                     ; 160       radio_send_packet(pload_sb, RF_PAYLOAD_LENGTH);
 242  0082 4b06          	push	#6
 243  0084 ae0000        	ldw	x,#L12_pload_sb
 244  0087 cd0000        	call	_radio_send_packet
 246  008a 84            	pop	a
 247  008b               L301:
 248                     ; 163         radio_irq ();
 250  008b cd0000        	call	_radio_irq
 252                     ; 165       while((radio_get_status ()) == RF_BUSY);
 254  008e cd0000        	call	_radio_get_status
 256  0091 a105          	cp	a,#5
 257  0093 27f6          	jreq	L301
 258                     ; 167       DELAY5MS_START;
 260  0095 ae0201        	ldw	x,#513
 261  0098 cd0000        	call	_CLK_PeripheralClockConfig
 265  009b 350b52e8      	mov	21224,#11
 268  009f 350552e9      	mov	21225,#5
 271  00a3 725f52e7      	clr	21223
 274  00a7 721152e5      	bres	21221,#0
 277  00ab 721052e0      	bset	21216,#0
 280  00af               L311:
 281                     ; 168       while(!DELAY_EXPIRED);
 283  00af 720152e5fb    	btjf	21221,#0,L311
 284                     ; 169       DELAY_STOP;
 286  00b4 721152e0      	bres	21216,#0
 289  00b8 ae0200        	ldw	x,#512
 290  00bb cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 157     for(l_cnt = 0; l_cnt < 3; l_cnt++)
 295  00be 0c01          	inc	(OFST+0,sp)
 298  00c0 7b01          	ld	a,(OFST+0,sp)
 299  00c2 a103          	cp	a,#3
 300  00c4 25bc          	jrult	L57
 301  00c6 cc0009        	jra	L15
 329                     ; 176 static void Goto_HALT()
 329                     ; 177 {
 330                     .text:	section	.text,new
 331  0000               L11_Goto_HALT:
 335                     ; 178   LED_OFF;
 337  0000 721b500a      	bres	20490,#5
 340  0004 721d500a      	bres	20490,#6
 341                     ; 179   NRF_OFF;
 344  0008 72165005      	bset	20485,#3
 345                     ; 180   btn_pressed = 0;
 347  000c 3f00          	clr	_btn_pressed
 348                     ; 182   NRF_CE(0);
 350  000e 72155005      	bres	20485,#2
 351                     ; 183   NRF_CSN(0);
 353  0012 72135005      	bres	20485,#1
 354                     ; 186   CLK->PCKENR1 = 0x00; //Stop all peripheral clocks
 356  0016 725f50c3      	clr	20675
 357                     ; 187   CLK->PCKENR2 = 0x00;
 359  001a 725f50c4      	clr	20676
 360                     ; 188   CLK->PCKENR3 = 0x00;
 362  001e 725f50d0      	clr	20688
 363                     ; 189   PWR_FastWakeUpCmd(ENABLE);     //Enables or disables the Fast WakeUp from Ultra Low Power mode, system does not wait for VrefINT to stabilize (around 3ms)
 365  0022 a601          	ld	a,#1
 366  0024 cd0000        	call	_PWR_FastWakeUpCmd
 368                     ; 190   PWR_UltraLowPowerCmd(ENABLE);  //Enables or disables the Ultra Low Power mode, disable VrefINT during Halt or Active-Halt modes
 370  0027 a601          	ld	a,#1
 371  0029 cd0000        	call	_PWR_UltraLowPowerCmd
 373                     ; 191   CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE);  //Configures clock during halt and active halt modes
 375  002c ae2001        	ldw	x,#8193
 376  002f cd0000        	call	_CLK_HaltConfig
 378                     ; 193   CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);  //When it is set, the main voltage regulator is powered off as soon as the MCU enters Active-halt mode, so the wakeup time is longer
 380  0032 ae1001        	ldw	x,#4097
 381  0035 cd0000        	call	_CLK_HaltConfig
 383                     ; 195   halt(); /* go to HALT mode */
 386  0038 8e            	halt	
 388                     ; 196 }
 392  0039 81            	ret	
 436                     ; 198 static void LED_Green_Blink(u8 times)
 436                     ; 199 {
 437                     .text:	section	.text,new
 438  0000               L31_LED_Green_Blink:
 440  0000 88            	push	a
 441  0001 88            	push	a
 442       00000001      OFST:	set	1
 445                     ; 200   if(times > 1)
 447  0002 a102          	cp	a,#2
 448  0004 2403cc00ac    	jrult	L151
 449                     ; 203     for(i = 0; i < times - 1; i++)
 451  0009 0f01          	clr	(OFST+0,sp)
 453  000b 2064          	jra	L751
 454  000d               L351:
 455                     ; 205       LED_GREEN_ON;
 457  000d 721a500a      	bset	20490,#5
 460  0011 721d500a      	bres	20490,#6
 461                     ; 206       DELAY50MS_START;
 464  0015 ae0201        	ldw	x,#513
 465  0018 cd0000        	call	_CLK_PeripheralClockConfig
 469  001b 350b52e8      	mov	21224,#11
 472  001f 353152e9      	mov	21225,#49
 475  0023 725f52e7      	clr	21223
 478  0027 721152e5      	bres	21221,#0
 481  002b 721052e0      	bset	21216,#0
 484  002f               L561:
 485                     ; 207       while(!DELAY_EXPIRED);
 487  002f 720152e5fb    	btjf	21221,#0,L561
 488                     ; 208       DELAY_STOP;
 490  0034 721152e0      	bres	21216,#0
 493  0038 ae0200        	ldw	x,#512
 494  003b cd0000        	call	_CLK_PeripheralClockConfig
 496                     ; 209       LED_OFF;
 499  003e 721b500a      	bres	20490,#5
 502  0042 721d500a      	bres	20490,#6
 503                     ; 210       DELAY200MS_START;
 506  0046 ae0201        	ldw	x,#513
 507  0049 cd0000        	call	_CLK_PeripheralClockConfig
 511  004c 350b52e8      	mov	21224,#11
 514  0050 35c352e9      	mov	21225,#195
 517  0054 725f52e7      	clr	21223
 520  0058 721152e5      	bres	21221,#0
 523  005c 721052e0      	bset	21216,#0
 526  0060               L371:
 527                     ; 211       while(!DELAY_EXPIRED);
 529  0060 720152e5fb    	btjf	21221,#0,L371
 530                     ; 212       DELAY_STOP;
 532  0065 721152e0      	bres	21216,#0
 535  0069 ae0200        	ldw	x,#512
 536  006c cd0000        	call	_CLK_PeripheralClockConfig
 538                     ; 203     for(i = 0; i < times - 1; i++)
 541  006f 0c01          	inc	(OFST+0,sp)
 542  0071               L751:
 545  0071 7b02          	ld	a,(OFST+1,sp)
 546  0073 5f            	clrw	x
 547  0074 97            	ld	xl,a
 548  0075 5a            	decw	x
 549  0076 7b01          	ld	a,(OFST+0,sp)
 550  0078 905f          	clrw	y
 551  007a 9097          	ld	yl,a
 552  007c 90bf00        	ldw	c_y,y
 553  007f b300          	cpw	x,c_y
 554  0081 2c8a          	jrsgt	L351
 555                     ; 214     LED_GREEN_ON;
 557  0083 721a500a      	bset	20490,#5
 560  0087 721d500a      	bres	20490,#6
 561                     ; 215     DELAY50MS_START;
 564  008b ae0201        	ldw	x,#513
 565  008e cd0000        	call	_CLK_PeripheralClockConfig
 569  0091 350b52e8      	mov	21224,#11
 572  0095 353152e9      	mov	21225,#49
 575  0099 725f52e7      	clr	21223
 578  009d 721152e5      	bres	21221,#0
 581  00a1 721052e0      	bset	21216,#0
 584  00a5               L102:
 585                     ; 216     while(!DELAY_EXPIRED);
 587  00a5 720152e5fb    	btjf	21221,#0,L102
 588                     ; 217     DELAY_STOP;
 591                     ; 218     LED_OFF;
 596  00aa 202c          	jp	LC002
 597  00ac               L151:
 598                     ; 220   else if(times == 1)
 600  00ac 7b02          	ld	a,(OFST+1,sp)
 601  00ae 4a            	dec	a
 602  00af 2639          	jrne	L502
 603                     ; 222     LED_GREEN_ON;
 605  00b1 721a500a      	bset	20490,#5
 608  00b5 721d500a      	bres	20490,#6
 609                     ; 223     DELAY50MS_START;
 612  00b9 ae0201        	ldw	x,#513
 613  00bc cd0000        	call	_CLK_PeripheralClockConfig
 617  00bf 350b52e8      	mov	21224,#11
 620  00c3 353152e9      	mov	21225,#49
 623  00c7 725f52e7      	clr	21223
 626  00cb 721152e5      	bres	21221,#0
 629  00cf 721052e0      	bset	21216,#0
 632  00d3               L312:
 633                     ; 224     while(!DELAY_EXPIRED);
 635  00d3 720152e5fb    	btjf	21221,#0,L312
 636                     ; 225     DELAY_STOP;
 641                     ; 226     LED_OFF;
 646  00d8               LC002:
 648  00d8 721152e0      	bres	21216,#0
 650  00dc ae0200        	ldw	x,#512
 651  00df cd0000        	call	_CLK_PeripheralClockConfig
 653  00e2 721b500a      	bres	20490,#5
 655  00e6 721d500a      	bres	20490,#6
 657  00ea               L502:
 658                     ; 228 }
 661  00ea 85            	popw	x
 662  00eb 81            	ret	
 706                     ; 230 static void LED_Red_Blink(u8 times)
 706                     ; 231 {
 707                     .text:	section	.text,new
 708  0000               L51_LED_Red_Blink:
 710  0000 88            	push	a
 711  0001 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 232   if(times > 1)
 717  0002 a102          	cp	a,#2
 718  0004 2403cc00ac    	jrult	L142
 719                     ; 235     for(i = 0; i < times - 1; i++)
 721  0009 0f01          	clr	(OFST+0,sp)
 723  000b 2064          	jra	L742
 724  000d               L342:
 725                     ; 237       LED_RED_ON;
 727  000d 721b500a      	bres	20490,#5
 730  0011 721c500a      	bset	20490,#6
 731                     ; 238       DELAY50MS_START;
 734  0015 ae0201        	ldw	x,#513
 735  0018 cd0000        	call	_CLK_PeripheralClockConfig
 739  001b 350b52e8      	mov	21224,#11
 742  001f 353152e9      	mov	21225,#49
 745  0023 725f52e7      	clr	21223
 748  0027 721152e5      	bres	21221,#0
 751  002b 721052e0      	bset	21216,#0
 754  002f               L552:
 755                     ; 239       while(!DELAY_EXPIRED);
 757  002f 720152e5fb    	btjf	21221,#0,L552
 758                     ; 240       DELAY_STOP;
 760  0034 721152e0      	bres	21216,#0
 763  0038 ae0200        	ldw	x,#512
 764  003b cd0000        	call	_CLK_PeripheralClockConfig
 766                     ; 241       LED_OFF;
 769  003e 721b500a      	bres	20490,#5
 772  0042 721d500a      	bres	20490,#6
 773                     ; 242       DELAY200MS_START;
 776  0046 ae0201        	ldw	x,#513
 777  0049 cd0000        	call	_CLK_PeripheralClockConfig
 781  004c 350b52e8      	mov	21224,#11
 784  0050 35c352e9      	mov	21225,#195
 787  0054 725f52e7      	clr	21223
 790  0058 721152e5      	bres	21221,#0
 793  005c 721052e0      	bset	21216,#0
 796  0060               L362:
 797                     ; 243       while(!DELAY_EXPIRED);
 799  0060 720152e5fb    	btjf	21221,#0,L362
 800                     ; 244       DELAY_STOP;
 802  0065 721152e0      	bres	21216,#0
 805  0069 ae0200        	ldw	x,#512
 806  006c cd0000        	call	_CLK_PeripheralClockConfig
 808                     ; 235     for(i = 0; i < times - 1; i++)
 811  006f 0c01          	inc	(OFST+0,sp)
 812  0071               L742:
 815  0071 7b02          	ld	a,(OFST+1,sp)
 816  0073 5f            	clrw	x
 817  0074 97            	ld	xl,a
 818  0075 5a            	decw	x
 819  0076 7b01          	ld	a,(OFST+0,sp)
 820  0078 905f          	clrw	y
 821  007a 9097          	ld	yl,a
 822  007c 90bf00        	ldw	c_y,y
 823  007f b300          	cpw	x,c_y
 824  0081 2c8a          	jrsgt	L342
 825                     ; 246     LED_RED_ON;
 827  0083 721b500a      	bres	20490,#5
 830  0087 721c500a      	bset	20490,#6
 831                     ; 247     DELAY50MS_START;
 834  008b ae0201        	ldw	x,#513
 835  008e cd0000        	call	_CLK_PeripheralClockConfig
 839  0091 350b52e8      	mov	21224,#11
 842  0095 353152e9      	mov	21225,#49
 845  0099 725f52e7      	clr	21223
 848  009d 721152e5      	bres	21221,#0
 851  00a1 721052e0      	bset	21216,#0
 854  00a5               L172:
 855                     ; 248     while(!DELAY_EXPIRED);
 857  00a5 720152e5fb    	btjf	21221,#0,L172
 858                     ; 249     DELAY_STOP;
 861                     ; 250     LED_OFF;
 866  00aa 202c          	jp	LC003
 867  00ac               L142:
 868                     ; 252   else if(times == 1)
 870  00ac 7b02          	ld	a,(OFST+1,sp)
 871  00ae 4a            	dec	a
 872  00af 2639          	jrne	L572
 873                     ; 254     LED_RED_ON;
 875  00b1 721b500a      	bres	20490,#5
 878  00b5 721c500a      	bset	20490,#6
 879                     ; 255     DELAY50MS_START;
 882  00b9 ae0201        	ldw	x,#513
 883  00bc cd0000        	call	_CLK_PeripheralClockConfig
 887  00bf 350b52e8      	mov	21224,#11
 890  00c3 353152e9      	mov	21225,#49
 893  00c7 725f52e7      	clr	21223
 896  00cb 721152e5      	bres	21221,#0
 899  00cf 721052e0      	bset	21216,#0
 902  00d3               L303:
 903                     ; 256     while(!DELAY_EXPIRED);
 905  00d3 720152e5fb    	btjf	21221,#0,L303
 906                     ; 257     DELAY_STOP;
 911                     ; 258     LED_OFF;
 916  00d8               LC003:
 918  00d8 721152e0      	bres	21216,#0
 920  00dc ae0200        	ldw	x,#512
 921  00df cd0000        	call	_CLK_PeripheralClockConfig
 923  00e2 721b500a      	bres	20490,#5
 925  00e6 721d500a      	bres	20490,#6
 927  00ea               L572:
 928                     ; 260 }
 931  00ea 85            	popw	x
 932  00eb 81            	ret	
1067                     	xdef	_main
1068                     	switch	.ubsct
1069  0000               L12_pload_sb:
1070  0000 000000000000  	ds.b	6
1071  0006               L7_TXmsg:
1072  0006 000000000000  	ds.b	6
1073                     	xref	_radio_sb_init
1074                     	xref	_radio_irq
1075                     	xref	_radio_send_packet
1076                     	xref	_radio_get_status
1077                     	xref	_Errors_Init
1078                     	xref	_Config
1079                     	xref.b	_btn_pressed
1080                     	xref	_PWR_UltraLowPowerCmd
1081                     	xref	_PWR_FastWakeUpCmd
1082                     	xref	_PWR_PVDCmd
1083                     	xref	_PWR_PVDLevelConfig
1084                     	xref	_CLK_HaltConfig
1085                     	xref	_CLK_PeripheralClockConfig
1086                     	xref.b	c_y
1106                     	end
