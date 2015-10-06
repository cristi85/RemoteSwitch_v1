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
 123  0002 5f            	clrw	x
 124  0003 bf01          	ldw	L3_RFmsg,x
 125                     ; 13   RFmsg.RFmsgmember.RFNodeId = RFNODEID;
 127  0005 35560003      	mov	L3_RFmsg+2,#86
 128                     ; 14   RFmsg.RFmsgmember.RFcmd = RFcmd;
 130  0009 b704          	ld	L3_RFmsg+3,a
 131                     ; 16   chksum = 0;
 133  000b 3f00          	clr	L5_chksum
 134                     ; 18   for(i=0; i<RFSEND_DATALEN-1; i++)
 136  000d 4f            	clr	a
 137  000e 6b03          	ld	(OFST+0,sp),a
 138  0010               L75:
 139                     ; 20     chksum += RFmsg.RFmsgarray[i];
 141  0010 5f            	clrw	x
 142  0011 97            	ld	xl,a
 143  0012 b600          	ld	a,L5_chksum
 144  0014 eb01          	add	a,(L3_RFmsg,x)
 145  0016 b700          	ld	L5_chksum,a
 146                     ; 18   for(i=0; i<RFSEND_DATALEN-1; i++)
 148  0018 0c03          	inc	(OFST+0,sp)
 151  001a 7b03          	ld	a,(OFST+0,sp)
 152  001c a104          	cp	a,#4
 153  001e 25f0          	jrult	L75
 154                     ; 22   chksum = (u8)(~chksum);
 156  0020 3300          	cpl	L5_chksum
 157                     ; 23   RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
 159                     ; 26   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 161  0022 ae0201        	ldw	x,#513
 162  0025 450005        	mov	L3_RFmsg+4,L5_chksum
 163  0028 cd0000        	call	_CLK_PeripheralClockConfig
 165                     ; 27   TIM4_TimeBaseInit(TIM4_Prescaler_4, 150);  //2us increment
 167  002b ae0296        	ldw	x,#662
 168  002e cd0000        	call	_TIM4_TimeBaseInit
 170                     ; 28   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 172  0031 721152e5      	bres	21221,#0
 173                     ; 29   TIM4->CNTR = 0;
 175  0035 725f52e7      	clr	21223
 176                     ; 30   TIM4->CR1 |= TIM4_CR1_CEN;
 178  0039 721052e0      	bset	21216,#0
 179                     ; 33   RFM_DATA(1);
 181  003d 72125005      	bset	20485,#1
 183  0041               L76:
 184                     ; 34   while(!(TIM4->SR1 & TIM4_IT_Update));
 186  0041 720152e5fb    	btjf	21221,#0,L76
 187                     ; 35   RFM_DATA(0);
 189  0046 72135005      	bres	20485,#1
 190                     ; 36   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 192  004a 721152e5      	bres	21221,#0
 194  004e               L57:
 195                     ; 37   while(!(TIM4->SR1 & TIM4_IT_Update));
 197  004e 720152e5fb    	btjf	21221,#0,L57
 198                     ; 38   RFM_DATA(1);
 200  0053 72125005      	bset	20485,#1
 201                     ; 39   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 203  0057 721152e5      	bres	21221,#0
 205  005b               L301:
 206                     ; 40   while(!(TIM4->SR1 & TIM4_IT_Update));
 208  005b 720152e5fb    	btjf	21221,#0,L301
 209                     ; 41   RFM_DATA(0);
 211  0060 72135005      	bres	20485,#1
 212                     ; 42   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 214  0064 721152e5      	bres	21221,#0
 216  0068               L111:
 217                     ; 43   while(!(TIM4->SR1 & TIM4_IT_Update));
 219  0068 720152e5fb    	btjf	21221,#0,L111
 220                     ; 44   RFM_DATA(1);
 222  006d 72125005      	bset	20485,#1
 223                     ; 45   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 225  0071 721152e5      	bres	21221,#0
 227  0075               L711:
 228                     ; 46   while(!(TIM4->SR1 & TIM4_IT_Update));
 230  0075 720152e5fb    	btjf	21221,#0,L711
 231                     ; 47   RFM_DATA(0);
 233  007a 72135005      	bres	20485,#1
 234                     ; 48   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 236  007e 721152e5      	bres	21221,#0
 238  0082               L521:
 239                     ; 49   while(!(TIM4->SR1 & TIM4_IT_Update));
 241  0082 720152e5fb    	btjf	21221,#0,L521
 242                     ; 50   RFM_DATA(1);
 244  0087 72125005      	bset	20485,#1
 245                     ; 51   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 247  008b 721152e5      	bres	21221,#0
 249  008f               L331:
 250                     ; 52   while(!(TIM4->SR1 & TIM4_IT_Update));
 252  008f 720152e5fb    	btjf	21221,#0,L331
 253                     ; 53   RFM_DATA(0);
 255  0094 72135005      	bres	20485,#1
 256                     ; 54   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 258  0098 721152e5      	bres	21221,#0
 260  009c               L141:
 261                     ; 55   while(!(TIM4->SR1 & TIM4_IT_Update));
 263  009c 720152e5fb    	btjf	21221,#0,L141
 264                     ; 56   TIM4->ARR = 250;
 266  00a1 35fa52e9      	mov	21225,#250
 267                     ; 59   RFM_DATA(1);
 269  00a5 72125005      	bset	20485,#1
 270                     ; 60   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 272  00a9 721152e5      	bres	21221,#0
 274  00ad               L741:
 275                     ; 61   while(!(TIM4->SR1 & TIM4_IT_Update));
 277  00ad 720152e5fb    	btjf	21221,#0,L741
 278                     ; 62   RFM_DATA(0);
 280  00b2 72135005      	bres	20485,#1
 281                     ; 63   TIM4->ARR = 125;
 283  00b6 357d52e9      	mov	21225,#125
 284                     ; 64   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 286  00ba 721152e5      	bres	21221,#0
 288  00be               L551:
 289                     ; 65   while(!(TIM4->SR1 & TIM4_IT_Update));
 291  00be 720152e5fb    	btjf	21221,#0,L551
 292                     ; 66   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 294  00c3 721152e5      	bres	21221,#0
 295                     ; 69   for(i=0; i<RFSEND_DATALEN; i++)
 297  00c7 0f03          	clr	(OFST+0,sp)
 298  00c9               L161:
 299                     ; 71     mask = 0x80;
 301  00c9 a680          	ld	a,#128
 302  00cb 6b02          	ld	(OFST-1,sp),a
 303                     ; 72     for(j=0; j<8; j++)
 305  00cd 0f01          	clr	(OFST-2,sp)
 306  00cf               L761:
 307                     ; 74       if((RFmsg.RFmsgarray[i] & mask))
 309  00cf 7b03          	ld	a,(OFST+0,sp)
 310  00d1 5f            	clrw	x
 311  00d2 97            	ld	xl,a
 312  00d3 e601          	ld	a,(L3_RFmsg,x)
 313  00d5 1502          	bcp	a,(OFST-1,sp)
 314  00d7 2733          	jreq	L571
 315                     ; 77         RFM_DATA(0);
 317  00d9 72135005      	bres	20485,#1
 318                     ; 78         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 320  00dd 721152e5      	bres	21221,#0
 322  00e1               L102:
 323                     ; 79         while(!(TIM4->SR1 & TIM4_IT_Update));
 325  00e1 720152e5fb    	btjf	21221,#0,L102
 326                     ; 80         RFM_DATA(1);
 328  00e6 72125005      	bset	20485,#1
 329                     ; 81         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 331  00ea 721152e5      	bres	21221,#0
 333  00ee               L702:
 334                     ; 82         while(!(TIM4->SR1 & TIM4_IT_Update));
 336  00ee 720152e5fb    	btjf	21221,#0,L702
 338  00f3               L312:
 339                     ; 94       mask >>= 1;
 341  00f3 0402          	srl	(OFST-1,sp)
 342                     ; 72     for(j=0; j<8; j++)
 344  00f5 0c01          	inc	(OFST-2,sp)
 347  00f7 7b01          	ld	a,(OFST-2,sp)
 348  00f9 a108          	cp	a,#8
 349  00fb 25d2          	jrult	L761
 350                     ; 69   for(i=0; i<RFSEND_DATALEN; i++)
 352  00fd 0c03          	inc	(OFST+0,sp)
 355  00ff 7b03          	ld	a,(OFST+0,sp)
 356  0101 a105          	cp	a,#5
 357  0103 25c4          	jrult	L161
 358                     ; 97   if(RFM_DATA_STATE)
 360  0105 720350062b    	btjf	20486,#1,L132
 362  010a 201c          	jra	L532
 363  010c               L571:
 364                     ; 87         RFM_DATA(1);
 366  010c 72125005      	bset	20485,#1
 367                     ; 88         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 369  0110 721152e5      	bres	21221,#0
 371  0114               L712:
 372                     ; 89         while(!(TIM4->SR1 & TIM4_IT_Update));
 374  0114 720152e5fb    	btjf	21221,#0,L712
 375                     ; 90         RFM_DATA(0);
 377  0119 72135005      	bres	20485,#1
 378                     ; 91         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 380  011d 721152e5      	bres	21221,#0
 382  0121               L522:
 383                     ; 92         while(!(TIM4->SR1 & TIM4_IT_Update));
 385  0121 720152e5fb    	btjf	21221,#0,L522
 386  0126 20cb          	jra	L312
 387  0128               L532:
 388                     ; 99     while(!(TIM4->SR1 & TIM4_IT_Update));
 390  0128 720152e5fb    	btjf	21221,#0,L532
 391                     ; 100     RFM_DATA(0);
 393  012d 72135005      	bres	20485,#1
 394                     ; 101     TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 396  0131 721152e5      	bres	21221,#0
 397  0135               L132:
 398                     ; 103   RFM_DATA(0);
 400  0135 72135005      	bres	20485,#1
 401                     ; 104 }
 404  0139 5b03          	addw	sp,#3
 405  013b 81            	ret	
 501                     	switch	.ubsct
 502  0000               L5_chksum:
 503  0000 00            	ds.b	1
 504  0001               L3_RFmsg:
 505  0001 0000000000    	ds.b	5
 506                     	xdef	_RF_Send
 507                     	xref	_TIM4_TimeBaseInit
 508                     	xref	_CLK_PeripheralClockConfig
 528                     	end
