   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 112                     ; 9 void RF_Send(RF_Cmd_TypeDef RFcmd)
 112                     ; 10 {
 114                     .text:	section	.text,new
 115  0000               _RF_Send:
 117  0000 5203          	subw	sp,#3
 118       00000003      OFST:	set	3
 121                     ; 12   RFmsg.RFmsgmember.RFsyncValue = RFSYNCVAL;
 123  0002 aea55a        	ldw	x,#42330
 124  0005 bf01          	ldw	L3_RFmsg,x
 125                     ; 13   RFmsg.RFmsgmember.RFNodeId = RFNODEID;
 127  0007 35560003      	mov	L3_RFmsg+2,#86
 128                     ; 14   RFmsg.RFmsgmember.RFcmd = RFcmd;
 130  000b b704          	ld	L3_RFmsg+3,a
 131                     ; 16   chksum = 0;
 133  000d 3f00          	clr	L5_chksum
 134                     ; 18   for(i=0; i<RFSEND_DATALEN-1; i++)
 136  000f 4f            	clr	a
 137  0010 6b03          	ld	(OFST+0,sp),a
 138  0012               L75:
 139                     ; 20     chksum += RFmsg.RFmsgarray[i];
 141  0012 5f            	clrw	x
 142  0013 97            	ld	xl,a
 143  0014 b600          	ld	a,L5_chksum
 144  0016 eb01          	add	a,(L3_RFmsg,x)
 145  0018 b700          	ld	L5_chksum,a
 146                     ; 18   for(i=0; i<RFSEND_DATALEN-1; i++)
 148  001a 0c03          	inc	(OFST+0,sp)
 151  001c 7b03          	ld	a,(OFST+0,sp)
 152  001e a104          	cp	a,#4
 153  0020 25f0          	jrult	L75
 154                     ; 22   chksum = (u8)(~chksum);
 156  0022 3300          	cpl	L5_chksum
 157                     ; 23   RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
 159                     ; 26   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 161  0024 ae0201        	ldw	x,#513
 162  0027 450005        	mov	L3_RFmsg+4,L5_chksum
 163  002a cd0000        	call	_CLK_PeripheralClockConfig
 165                     ; 27   TIM4_TimeBaseInit(TIM4_Prescaler_4, 150);  //2us increment
 167  002d ae0296        	ldw	x,#662
 168  0030 cd0000        	call	_TIM4_TimeBaseInit
 170                     ; 28   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 172  0033 721152e5      	bres	21221,#0
 173                     ; 29   TIM4->CNTR = 0;
 175  0037 725f52e7      	clr	21223
 176                     ; 30   TIM4->CR1 |= TIM4_CR1_CEN;
 178  003b 721052e0      	bset	21216,#0
 179                     ; 33   RFM_DATA(1);
 181  003f 72125005      	bset	20485,#1
 183  0043               L76:
 184                     ; 34   while(!(TIM4->SR1 & TIM4_IT_Update));
 186  0043 720152e5fb    	btjf	21221,#0,L76
 187                     ; 35   RFM_DATA(0);
 189  0048 72135005      	bres	20485,#1
 190                     ; 36   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 192  004c 721152e5      	bres	21221,#0
 194  0050               L57:
 195                     ; 37   while(!(TIM4->SR1 & TIM4_IT_Update));
 197  0050 720152e5fb    	btjf	21221,#0,L57
 198                     ; 38   RFM_DATA(1);
 200  0055 72125005      	bset	20485,#1
 201                     ; 39   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 203  0059 721152e5      	bres	21221,#0
 205  005d               L301:
 206                     ; 40   while(!(TIM4->SR1 & TIM4_IT_Update));
 208  005d 720152e5fb    	btjf	21221,#0,L301
 209                     ; 41   RFM_DATA(0);
 211  0062 72135005      	bres	20485,#1
 212                     ; 42   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 214  0066 721152e5      	bres	21221,#0
 216  006a               L111:
 217                     ; 43   while(!(TIM4->SR1 & TIM4_IT_Update));
 219  006a 720152e5fb    	btjf	21221,#0,L111
 220                     ; 44   RFM_DATA(1);
 222  006f 72125005      	bset	20485,#1
 223                     ; 45   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 225  0073 721152e5      	bres	21221,#0
 227  0077               L711:
 228                     ; 46   while(!(TIM4->SR1 & TIM4_IT_Update));
 230  0077 720152e5fb    	btjf	21221,#0,L711
 231                     ; 47   RFM_DATA(0);
 233  007c 72135005      	bres	20485,#1
 234                     ; 48   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 236  0080 721152e5      	bres	21221,#0
 238  0084               L521:
 239                     ; 49   while(!(TIM4->SR1 & TIM4_IT_Update));
 241  0084 720152e5fb    	btjf	21221,#0,L521
 242                     ; 50   RFM_DATA(1);
 244  0089 72125005      	bset	20485,#1
 245                     ; 51   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 247  008d 721152e5      	bres	21221,#0
 249  0091               L331:
 250                     ; 52   while(!(TIM4->SR1 & TIM4_IT_Update));
 252  0091 720152e5fb    	btjf	21221,#0,L331
 253                     ; 53   RFM_DATA(0);
 255  0096 72135005      	bres	20485,#1
 256                     ; 54   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 258  009a 721152e5      	bres	21221,#0
 260  009e               L141:
 261                     ; 55   while(!(TIM4->SR1 & TIM4_IT_Update));
 263  009e 720152e5fb    	btjf	21221,#0,L141
 264                     ; 56   TIM4->ARR = 250;
 266  00a3 35fa52e9      	mov	21225,#250
 267                     ; 59   RFM_DATA(1);
 269  00a7 72125005      	bset	20485,#1
 270                     ; 60   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 272  00ab 721152e5      	bres	21221,#0
 274  00af               L741:
 275                     ; 61   while(!(TIM4->SR1 & TIM4_IT_Update));
 277  00af 720152e5fb    	btjf	21221,#0,L741
 278                     ; 62   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 280  00b4 721152e5      	bres	21221,#0
 282  00b8               L551:
 283                     ; 63   while(!(TIM4->SR1 & TIM4_IT_Update));
 285  00b8 720152e5fb    	btjf	21221,#0,L551
 286                     ; 64   RFM_DATA(0);
 288  00bd 72135005      	bres	20485,#1
 289                     ; 65   TIM4->ARR = 125;
 291  00c1 357d52e9      	mov	21225,#125
 292                     ; 66   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 294  00c5 721152e5      	bres	21221,#0
 296  00c9               L361:
 297                     ; 67   while(!(TIM4->SR1 & TIM4_IT_Update));
 299  00c9 720152e5fb    	btjf	21221,#0,L361
 300                     ; 68   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 302  00ce 721152e5      	bres	21221,#0
 303                     ; 71   for(i=0; i<RFSEND_DATALEN; i++)
 305  00d2 0f03          	clr	(OFST+0,sp)
 306  00d4               L761:
 307                     ; 73     mask = 0x80;
 309  00d4 a680          	ld	a,#128
 310  00d6 6b02          	ld	(OFST-1,sp),a
 311                     ; 74     for(j=0; j<8; j++)
 313  00d8 0f01          	clr	(OFST-2,sp)
 314  00da               L571:
 315                     ; 76       if((RFmsg.RFmsgarray[i] & mask))
 317  00da 7b03          	ld	a,(OFST+0,sp)
 318  00dc 5f            	clrw	x
 319  00dd 97            	ld	xl,a
 320  00de e601          	ld	a,(L3_RFmsg,x)
 321  00e0 1502          	bcp	a,(OFST-1,sp)
 322  00e2 2733          	jreq	L302
 323                     ; 79         RFM_DATA(0);
 325  00e4 72135005      	bres	20485,#1
 326                     ; 80         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 328  00e8 721152e5      	bres	21221,#0
 330  00ec               L702:
 331                     ; 81         while(!(TIM4->SR1 & TIM4_IT_Update));
 333  00ec 720152e5fb    	btjf	21221,#0,L702
 334                     ; 82         RFM_DATA(1);
 336  00f1 72125005      	bset	20485,#1
 337                     ; 83         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 339  00f5 721152e5      	bres	21221,#0
 341  00f9               L512:
 342                     ; 84         while(!(TIM4->SR1 & TIM4_IT_Update));
 344  00f9 720152e5fb    	btjf	21221,#0,L512
 346  00fe               L122:
 347                     ; 96       mask >>= 1;
 349  00fe 0402          	srl	(OFST-1,sp)
 350                     ; 74     for(j=0; j<8; j++)
 352  0100 0c01          	inc	(OFST-2,sp)
 355  0102 7b01          	ld	a,(OFST-2,sp)
 356  0104 a108          	cp	a,#8
 357  0106 25d2          	jrult	L571
 358                     ; 71   for(i=0; i<RFSEND_DATALEN; i++)
 360  0108 0c03          	inc	(OFST+0,sp)
 363  010a 7b03          	ld	a,(OFST+0,sp)
 364  010c a105          	cp	a,#5
 365  010e 25c4          	jrult	L761
 366                     ; 99   if(RFM_DATA_STATE)
 368  0110 720350062b    	btjf	20486,#1,L732
 370  0115 201c          	jra	L342
 371  0117               L302:
 372                     ; 89         RFM_DATA(1);
 374  0117 72125005      	bset	20485,#1
 375                     ; 90         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 377  011b 721152e5      	bres	21221,#0
 379  011f               L522:
 380                     ; 91         while(!(TIM4->SR1 & TIM4_IT_Update));
 382  011f 720152e5fb    	btjf	21221,#0,L522
 383                     ; 92         RFM_DATA(0);
 385  0124 72135005      	bres	20485,#1
 386                     ; 93         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 388  0128 721152e5      	bres	21221,#0
 390  012c               L332:
 391                     ; 94         while(!(TIM4->SR1 & TIM4_IT_Update));
 393  012c 720152e5fb    	btjf	21221,#0,L332
 394  0131 20cb          	jra	L122
 395  0133               L342:
 396                     ; 101     while(!(TIM4->SR1 & TIM4_IT_Update));
 398  0133 720152e5fb    	btjf	21221,#0,L342
 399                     ; 102     RFM_DATA(0);
 401  0138 72135005      	bres	20485,#1
 402                     ; 103     TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 404  013c 721152e5      	bres	21221,#0
 405  0140               L732:
 406                     ; 105   RFM_DATA(0);
 408  0140 72135005      	bres	20485,#1
 409                     ; 106 }
 412  0144 5b03          	addw	sp,#3
 413  0146 81            	ret	
 509                     	switch	.ubsct
 510  0000               L5_chksum:
 511  0000 00            	ds.b	1
 512  0001               L3_RFmsg:
 513  0001 0000000000    	ds.b	5
 514                     	xdef	_RF_Send
 515                     	xref	_TIM4_TimeBaseInit
 516                     	xref	_CLK_PeripheralClockConfig
 536                     	end
