   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               L3_ownID_btn1:
  23  0000 be383603      	dc.l	-1103612413
  24  0004               L5_ownID_btn2:
  25  0004 d9701e21      	dc.l	-646963679
  26  0008               L7_rx_address:
  27  0008 06            	dc.b	6
  28  0009 05            	dc.b	5
  29  000a 2e            	dc.b	46
  30  000b 58            	dc.b	88
  31  000c c1            	dc.b	193
  32  000d               L11_tx_address:
  33  000d 4e            	dc.b	78
  34  000e cc            	dc.b	204
  35  000f 54            	dc.b	84
  36  0010 da            	dc.b	218
  37  0011 5f            	dc.b	95
  38  0012               L31_tx_cnt:
  39  0012 00            	dc.b	0
  40                     	switch	.ubsct
  41  0000               L52_status:
  42  0000 00            	ds.b	1
 147                     ; 91 void main(void)
 147                     ; 92 {
 149                     .text:	section	.text,new
 150  0000               _main:
 152  0000 88            	push	a
 153       00000001      OFST:	set	1
 156                     ; 95   disableInterrupts();
 159  0001 9b            	sim	
 161                     ; 96   Config();
 164  0002 cd0000        	call	_Config
 166                     ; 97   Errors_Init();
 168  0005 cd0000        	call	_Errors_Init
 170                     ; 98   enableInterrupts();
 173  0008 9a            	rim	
 175                     ; 99   Goto_HALT();
 179  0009               L57:
 181  0009 cd0000        	call	L71_Goto_HALT
 182                     ; 103     if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2))
 184  000c b600          	ld	a,_btn_pressed
 185  000e a101          	cp	a,#1
 186  0010 270e          	jreq	L101
 188  0012 a102          	cp	a,#2
 189  0014 270a          	jreq	L101
 190                     ; 105       DELAY_STOP;
 192  0016 721152e0      	bres	21216,#0
 195  001a 721550c3      	bres	20675,#2
 196                     ; 106       goto sleep;
 197                     ; 180     sleep:
 197                     ; 181     Goto_HALT();
 200  001e 20e9          	jra	L57
 201  0020               L101:
 202                     ; 109     PWR_PVDCmd(ENABLE);                    /* Power voltage detector and brownout Reset unit supply current 2,6uA */
 204  0020 a601          	ld	a,#1
 205  0022 cd0000        	call	_PWR_PVDCmd
 207                     ; 110     PWR_PVDLevelConfig(PWR_PVDLevel_2V26); /* Set Programmable voltage detector threshold to 2,26V */
 209  0025 a604          	ld	a,#4
 210  0027 cd0000        	call	_PWR_PVDLevelConfig
 212                     ; 111     if(DELAY_EXPIRED)
 214  002a 720152e506    	btjf	21221,#0,L301
 215                     ; 112       flag_display_retrans_cnt = TRUE;
 217  002f a601          	ld	a,#1
 218  0031 6b01          	ld	(OFST+0,sp),a
 220  0033 2002          	jra	L111
 221  0035               L301:
 222                     ; 114       flag_display_retrans_cnt = FALSE;
 224  0035 0f01          	clr	(OFST+0,sp)
 225  0037               L111:
 226                     ; 115     while(!DELAY_EXPIRED);           /* wait for power-up delay to expire (199.68ms) - needed for nRF24L01+ power up */
 228  0037 720152e5fb    	btjf	21221,#0,L111
 229                     ; 116     DELAY_STOP;
 231  003c 721152e0      	bres	21216,#0
 234  0040 721550c3      	bres	20675,#2
 235                     ; 118     CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
 238  0044 ae0401        	ldw	x,#1025
 239  0047 cd0000        	call	_CLK_PeripheralClockConfig
 241                     ; 119     nrf24_init();                          /* init hardware pins */
 243  004a cd0000        	call	_nrf24_init
 245                     ; 120     nrf24_config(0, 6);                    /* Channel #0 , payload length: 6 */
 247  004d ae0006        	ldw	x,#6
 248  0050 cd0000        	call	_nrf24_config
 250                     ; 121     nrf24_tx_address(tx_address);          /* Set the device addresses */
 252  0053 ae000d        	ldw	x,#L11_tx_address
 253  0056 cd0000        	call	_nrf24_tx_address
 255                     ; 122     nrf24_rx_address(rx_address);
 257  0059 ae0008        	ldw	x,#L7_rx_address
 258  005c cd0000        	call	_nrf24_rx_address
 260                     ; 125     if(Errors_CheckError(ERROR_NRF24_INIT))
 262  005f 4f            	clr	a
 263  0060 cd0000        	call	_Errors_CheckError
 265  0063 4d            	tnz	a
 266  0064 2704          	jreq	L511
 267                     ; 127       LED_Red_Blink(2);
 269  0066 a602          	ld	a,#2
 271                     ; 128       goto sleep;
 273  0068 205d          	jp	LC001
 274  006a               L511:
 275                     ; 131     TXmsg.M.status = 0;                    /* Reset status byte */
 277  006a b705          	ld	L51_TXmsg+4,a
 278                     ; 135     if(PWR->CSR1 & PWR_FLAG_PVDOF)
 280  006c 720d50b204    	btjf	20658,#6,L711
 281                     ; 138       TXmsg.M.status |= STATUS_LOWBATT;
 283  0071 72100005      	bset	L51_TXmsg+4,#0
 284  0075               L711:
 285                     ; 140     PWR_PVDCmd(DISABLE);
 287  0075 4f            	clr	a
 288  0076 cd0000        	call	_PWR_PVDCmd
 290                     ; 142     if(btn_pressed == BUTTON1)
 292  0079 b600          	ld	a,_btn_pressed
 293  007b 4a            	dec	a
 294  007c 2608          	jrne	L121
 295                     ; 144       TXmsg.M.ownID = (u32)ownID_btn1;
 297  007e be02          	ldw	x,L3_ownID_btn1+2
 298  0080 bf03          	ldw	L51_TXmsg+2,x
 299  0082 be00          	ldw	x,L3_ownID_btn1
 300                     ; 145       TXmsg.M.txcnt = tx_cnt++;
 301                     ; 146       nrf24_send((u8*)&TXmsg.B.b[0]);
 304  0084 200c          	jp	LC003
 305  0086               L121:
 306                     ; 148     else if(btn_pressed = BUTTON2)
 308  0086 a602          	ld	a,#2
 309  0088 b700          	ld	_btn_pressed,a
 310  008a 2714          	jreq	L321
 311                     ; 150       TXmsg.M.ownID = (u32)ownID_btn2;
 313  008c be06          	ldw	x,L5_ownID_btn2+2
 314  008e bf03          	ldw	L51_TXmsg+2,x
 315  0090 be04          	ldw	x,L5_ownID_btn2
 316                     ; 151       TXmsg.M.txcnt = tx_cnt++;
 318                     ; 152       nrf24_send((u8*)&TXmsg.B.b[0]);
 320  0092               LC003:
 321  0092 bf01          	ldw	L51_TXmsg,x
 323  0094 b612          	ld	a,L31_tx_cnt
 324  0096 3c12          	inc	L31_tx_cnt
 325  0098 b706          	ld	L51_TXmsg+5,a
 327  009a ae0001        	ldw	x,#L51_TXmsg
 328  009d cd0000        	call	_nrf24_send
 330  00a0               L321:
 331                     ; 154     btn_pressed = 0;
 333  00a0 3f00          	clr	_btn_pressed
 334  00a2               L721:
 335                     ; 158       status = nrf24_getStatus();
 337  00a2 cd0000        	call	_nrf24_getStatus
 339  00a5 b700          	ld	L52_status,a
 340                     ; 160     while(!(status & ((1 << TX_DS)  | (1 << MAX_RT))));
 342  00a7 a530          	bcp	a,#48
 343  00a9 27f7          	jreq	L721
 344                     ; 162     if(status & (1 << TX_DS))  /* send successful */
 346  00ab a520          	bcp	a,#32
 347  00ad 2712          	jreq	L531
 348                     ; 164       if(flag_display_retrans_cnt)
 350  00af 7b01          	ld	a,(OFST+0,sp)
 351  00b1 2707          	jreq	L731
 352                     ; 167         u8 retrans_cnt = nrf24_retransmissionCount();
 354  00b3 cd0000        	call	_nrf24_retransmissionCount
 356  00b6 6b01          	ld	(OFST+0,sp),a
 357                     ; 168         LED_Green_Blink(retrans_cnt);
 360  00b8 2001          	jp	LC002
 361  00ba               L731:
 362                     ; 172         LED_Green_Blink(1);
 364  00ba 4c            	inc	a
 365  00bb               LC002:
 367  00bb cd0000        	call	L12_LED_Green_Blink
 369  00be cc0009        	jra	L57
 370  00c1               L531:
 371                     ; 175     else if(status & (1 << MAX_RT))  /* send failed, max retries exceeded */
 373  00c1 a510          	bcp	a,#16
 374  00c3 27f9          	jreq	L57
 375                     ; 177       LED_Red_Blink(1);
 377  00c5 a601          	ld	a,#1
 378  00c7               LC001:
 379  00c7 cd0000        	call	L32_LED_Red_Blink
 381  00ca cc0009        	jra	L57
 408                     ; 185 static void Goto_HALT()
 408                     ; 186 {
 409                     .text:	section	.text,new
 410  0000               L71_Goto_HALT:
 414                     ; 187   LED_OFF;
 416  0000 721b500a      	bres	20490,#5
 419  0004 721d500a      	bres	20490,#6
 420                     ; 188   NRF_OFF;
 423  0008 72165005      	bset	20485,#3
 424                     ; 190   NRF_CE(0);
 426  000c 72155005      	bres	20485,#2
 427                     ; 191   NRF_CSN(0);
 429  0010 72135005      	bres	20485,#1
 430                     ; 194   CLK->PCKENR1 = 0x00; //Stop all peripheral clocks
 432  0014 725f50c3      	clr	20675
 433                     ; 195   CLK->PCKENR2 = 0x00;
 435  0018 725f50c4      	clr	20676
 436                     ; 196   CLK->PCKENR3 = 0x00;
 438  001c 725f50d0      	clr	20688
 439                     ; 197   PWR_FastWakeUpCmd(ENABLE);     //Enables or disables the Fast WakeUp from Ultra Low Power mode, system does not wait for VrefINT to stabilize (around 3ms)
 441  0020 a601          	ld	a,#1
 442  0022 cd0000        	call	_PWR_FastWakeUpCmd
 444                     ; 198   PWR_UltraLowPowerCmd(ENABLE);  //Enables or disables the Ultra Low Power mode, disable VrefINT during Halt or Active-Halt modes
 446  0025 a601          	ld	a,#1
 447  0027 cd0000        	call	_PWR_UltraLowPowerCmd
 449                     ; 199   CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE);  //Configures clock during halt and active halt modes
 451  002a ae2001        	ldw	x,#8193
 452  002d cd0000        	call	_CLK_HaltConfig
 454                     ; 201   CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);  //When it is set, the main voltage regulator is powered off as soon as the MCU enters Active-halt mode, so the wakeup time is longer
 456  0030 ae1001        	ldw	x,#4097
 457  0033 cd0000        	call	_CLK_HaltConfig
 459                     ; 203   halt(); /* go to HALT mode */
 462  0036 8e            	halt	
 464                     ; 204 }
 468  0037 81            	ret	
 512                     ; 206 static void LED_Green_Blink(u8 times)
 512                     ; 207 {
 513                     .text:	section	.text,new
 514  0000               L12_LED_Green_Blink:
 516  0000 88            	push	a
 517  0001 88            	push	a
 518       00000001      OFST:	set	1
 521                     ; 208   if(times > 1)
 523  0002 a102          	cp	a,#2
 524  0004 2403cc00a8    	jrult	L102
 525                     ; 211     for(i = 0; i < times - 1; i++)
 527  0009 0f01          	clr	(OFST+0,sp)
 529  000b 2060          	jra	L702
 530  000d               L302:
 531                     ; 213       LED_GREEN_ON;
 533  000d 721a500a      	bset	20490,#5
 536  0011 721d500a      	bres	20490,#6
 537                     ; 214       DELAY50MS_START;
 540  0015 ae0201        	ldw	x,#513
 541  0018 cd0000        	call	_CLK_PeripheralClockConfig
 545  001b 350b52e8      	mov	21224,#11
 548  001f 353152e9      	mov	21225,#49
 551  0023 725f52e7      	clr	21223
 554  0027 721152e5      	bres	21221,#0
 557  002b 721052e0      	bset	21216,#0
 560  002f               L512:
 561                     ; 215       while(!DELAY_EXPIRED);
 563  002f 720152e5fb    	btjf	21221,#0,L512
 564                     ; 216       DELAY_STOP;
 566  0034 721152e0      	bres	21216,#0
 569  0038 721550c3      	bres	20675,#2
 570                     ; 217       LED_OFF;
 573  003c 721b500a      	bres	20490,#5
 576  0040 721d500a      	bres	20490,#6
 577                     ; 218       DELAY200MS_START;
 580  0044 ae0201        	ldw	x,#513
 581  0047 cd0000        	call	_CLK_PeripheralClockConfig
 585  004a 350b52e8      	mov	21224,#11
 588  004e 35c352e9      	mov	21225,#195
 591  0052 725f52e7      	clr	21223
 594  0056 721152e5      	bres	21221,#0
 597  005a 721052e0      	bset	21216,#0
 600  005e               L322:
 601                     ; 219       while(!DELAY_EXPIRED);
 603  005e 720152e5fb    	btjf	21221,#0,L322
 604                     ; 220       DELAY_STOP;
 606  0063 721152e0      	bres	21216,#0
 609  0067 721550c3      	bres	20675,#2
 610                     ; 211     for(i = 0; i < times - 1; i++)
 613  006b 0c01          	inc	(OFST+0,sp)
 614  006d               L702:
 617  006d 7b02          	ld	a,(OFST+1,sp)
 618  006f 5f            	clrw	x
 619  0070 97            	ld	xl,a
 620  0071 5a            	decw	x
 621  0072 7b01          	ld	a,(OFST+0,sp)
 622  0074 905f          	clrw	y
 623  0076 9097          	ld	yl,a
 624  0078 90bf00        	ldw	c_y,y
 625  007b b300          	cpw	x,c_y
 626  007d 2c8e          	jrsgt	L302
 627                     ; 222     LED_GREEN_ON;
 629  007f 721a500a      	bset	20490,#5
 632  0083 721d500a      	bres	20490,#6
 633                     ; 223     DELAY50MS_START;
 636  0087 ae0201        	ldw	x,#513
 637  008a cd0000        	call	_CLK_PeripheralClockConfig
 641  008d 350b52e8      	mov	21224,#11
 644  0091 353152e9      	mov	21225,#49
 647  0095 725f52e7      	clr	21223
 650  0099 721152e5      	bres	21221,#0
 653  009d 721052e0      	bset	21216,#0
 656  00a1               L132:
 657                     ; 224     while(!DELAY_EXPIRED);
 659  00a1 720152e5fb    	btjf	21221,#0,L132
 660                     ; 225     DELAY_STOP;
 662                     ; 226     LED_OFF;
 667  00a6 202c          	jp	LC004
 668  00a8               L102:
 669                     ; 228   else if(times == 1)
 671  00a8 7b02          	ld	a,(OFST+1,sp)
 672  00aa 4a            	dec	a
 673  00ab 2637          	jrne	L532
 674                     ; 230     LED_GREEN_ON;
 676  00ad 721a500a      	bset	20490,#5
 679  00b1 721d500a      	bres	20490,#6
 680                     ; 231     DELAY50MS_START;
 683  00b5 ae0201        	ldw	x,#513
 684  00b8 cd0000        	call	_CLK_PeripheralClockConfig
 688  00bb 350b52e8      	mov	21224,#11
 691  00bf 353152e9      	mov	21225,#49
 694  00c3 725f52e7      	clr	21223
 697  00c7 721152e5      	bres	21221,#0
 700  00cb 721052e0      	bset	21216,#0
 703  00cf               L342:
 704                     ; 232     while(!DELAY_EXPIRED);
 706  00cf 720152e5fb    	btjf	21221,#0,L342
 707                     ; 233     DELAY_STOP;
 711                     ; 234     LED_OFF;
 716  00d4               LC004:
 718  00d4 721152e0      	bres	21216,#0
 720  00d8 721550c3      	bres	20675,#2
 722  00dc 721b500a      	bres	20490,#5
 724  00e0 721d500a      	bres	20490,#6
 726  00e4               L532:
 727                     ; 236 }
 730  00e4 85            	popw	x
 731  00e5 81            	ret	
 775                     ; 238 static void LED_Red_Blink(u8 times)
 775                     ; 239 {
 776                     .text:	section	.text,new
 777  0000               L32_LED_Red_Blink:
 779  0000 88            	push	a
 780  0001 88            	push	a
 781       00000001      OFST:	set	1
 784                     ; 240   if(times > 1)
 786  0002 a102          	cp	a,#2
 787  0004 2403cc00a8    	jrult	L172
 788                     ; 243     for(i = 0; i < times - 1; i++)
 790  0009 0f01          	clr	(OFST+0,sp)
 792  000b 2060          	jra	L772
 793  000d               L372:
 794                     ; 245       LED_RED_ON;
 796  000d 721b500a      	bres	20490,#5
 799  0011 721c500a      	bset	20490,#6
 800                     ; 246       DELAY50MS_START;
 803  0015 ae0201        	ldw	x,#513
 804  0018 cd0000        	call	_CLK_PeripheralClockConfig
 808  001b 350b52e8      	mov	21224,#11
 811  001f 353152e9      	mov	21225,#49
 814  0023 725f52e7      	clr	21223
 817  0027 721152e5      	bres	21221,#0
 820  002b 721052e0      	bset	21216,#0
 823  002f               L503:
 824                     ; 247       while(!DELAY_EXPIRED);
 826  002f 720152e5fb    	btjf	21221,#0,L503
 827                     ; 248       DELAY_STOP;
 829  0034 721152e0      	bres	21216,#0
 832  0038 721550c3      	bres	20675,#2
 833                     ; 249       LED_OFF;
 836  003c 721b500a      	bres	20490,#5
 839  0040 721d500a      	bres	20490,#6
 840                     ; 250       DELAY200MS_START;
 843  0044 ae0201        	ldw	x,#513
 844  0047 cd0000        	call	_CLK_PeripheralClockConfig
 848  004a 350b52e8      	mov	21224,#11
 851  004e 35c352e9      	mov	21225,#195
 854  0052 725f52e7      	clr	21223
 857  0056 721152e5      	bres	21221,#0
 860  005a 721052e0      	bset	21216,#0
 863  005e               L313:
 864                     ; 251       while(!DELAY_EXPIRED);
 866  005e 720152e5fb    	btjf	21221,#0,L313
 867                     ; 252       DELAY_STOP;
 869  0063 721152e0      	bres	21216,#0
 872  0067 721550c3      	bres	20675,#2
 873                     ; 243     for(i = 0; i < times - 1; i++)
 876  006b 0c01          	inc	(OFST+0,sp)
 877  006d               L772:
 880  006d 7b02          	ld	a,(OFST+1,sp)
 881  006f 5f            	clrw	x
 882  0070 97            	ld	xl,a
 883  0071 5a            	decw	x
 884  0072 7b01          	ld	a,(OFST+0,sp)
 885  0074 905f          	clrw	y
 886  0076 9097          	ld	yl,a
 887  0078 90bf00        	ldw	c_y,y
 888  007b b300          	cpw	x,c_y
 889  007d 2c8e          	jrsgt	L372
 890                     ; 254     LED_RED_ON;
 892  007f 721b500a      	bres	20490,#5
 895  0083 721c500a      	bset	20490,#6
 896                     ; 255     DELAY50MS_START;
 899  0087 ae0201        	ldw	x,#513
 900  008a cd0000        	call	_CLK_PeripheralClockConfig
 904  008d 350b52e8      	mov	21224,#11
 907  0091 353152e9      	mov	21225,#49
 910  0095 725f52e7      	clr	21223
 913  0099 721152e5      	bres	21221,#0
 916  009d 721052e0      	bset	21216,#0
 919  00a1               L123:
 920                     ; 256     while(!DELAY_EXPIRED);
 922  00a1 720152e5fb    	btjf	21221,#0,L123
 923                     ; 257     DELAY_STOP;
 925                     ; 258     LED_OFF;
 930  00a6 202c          	jp	LC005
 931  00a8               L172:
 932                     ; 260   else if(times == 1)
 934  00a8 7b02          	ld	a,(OFST+1,sp)
 935  00aa 4a            	dec	a
 936  00ab 2637          	jrne	L523
 937                     ; 262     LED_RED_ON;
 939  00ad 721b500a      	bres	20490,#5
 942  00b1 721c500a      	bset	20490,#6
 943                     ; 263     DELAY50MS_START;
 946  00b5 ae0201        	ldw	x,#513
 947  00b8 cd0000        	call	_CLK_PeripheralClockConfig
 951  00bb 350b52e8      	mov	21224,#11
 954  00bf 353152e9      	mov	21225,#49
 957  00c3 725f52e7      	clr	21223
 960  00c7 721152e5      	bres	21221,#0
 963  00cb 721052e0      	bset	21216,#0
 966  00cf               L333:
 967                     ; 264     while(!DELAY_EXPIRED);
 969  00cf 720152e5fb    	btjf	21221,#0,L333
 970                     ; 265     DELAY_STOP;
 974                     ; 266     LED_OFF;
 979  00d4               LC005:
 981  00d4 721152e0      	bres	21216,#0
 983  00d8 721550c3      	bres	20675,#2
 985  00dc 721b500a      	bres	20490,#5
 987  00e0 721d500a      	bres	20490,#6
 989  00e4               L523:
 990                     ; 268 }
 993  00e4 85            	popw	x
 994  00e5 81            	ret	
1138                     	xdef	_main
1139                     	switch	.ubsct
1140  0001               L51_TXmsg:
1141  0001 000000000000  	ds.b	6
1142                     	xref	_nrf24_retransmissionCount
1143                     	xref	_nrf24_send
1144                     	xref	_nrf24_getStatus
1145                     	xref	_nrf24_config
1146                     	xref	_nrf24_tx_address
1147                     	xref	_nrf24_rx_address
1148                     	xref	_nrf24_init
1149                     	xref	_Errors_CheckError
1150                     	xref	_Errors_Init
1151                     	xref	_Config
1152                     	xref.b	_btn_pressed
1153                     	xref	_PWR_UltraLowPowerCmd
1154                     	xref	_PWR_FastWakeUpCmd
1155                     	xref	_PWR_PVDCmd
1156                     	xref	_PWR_PVDLevelConfig
1157                     	xref	_CLK_HaltConfig
1158                     	xref	_CLK_PeripheralClockConfig
1159                     	xref.b	c_y
1179                     	end
