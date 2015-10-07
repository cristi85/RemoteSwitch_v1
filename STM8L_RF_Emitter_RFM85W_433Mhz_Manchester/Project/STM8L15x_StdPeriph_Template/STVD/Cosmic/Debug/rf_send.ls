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
 278                     ; 62   RFM_DATA(0);
 280  00b4 72135005      	bres	20485,#1
 281                     ; 63   TIM4->ARR = 125;
 283  00b8 357d52e9      	mov	21225,#125
 284                     ; 64   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 286  00bc 721152e5      	bres	21221,#0
 288  00c0               L551:
 289                     ; 65   while(!(TIM4->SR1 & TIM4_IT_Update));
 291  00c0 720152e5fb    	btjf	21221,#0,L551
 292                     ; 66   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 294  00c5 721152e5      	bres	21221,#0
 295                     ; 69   for(i=0; i<RFSEND_DATALEN; i++)
 297  00c9 0f03          	clr	(OFST+0,sp)
 298  00cb               L161:
 299                     ; 71     mask = 0x80;
 301  00cb a680          	ld	a,#128
 302  00cd 6b02          	ld	(OFST-1,sp),a
 303                     ; 72     for(j=0; j<8; j++)
 305  00cf 0f01          	clr	(OFST-2,sp)
 306  00d1               L761:
 307                     ; 74       if((RFmsg.RFmsgarray[i] & mask))
 309  00d1 7b03          	ld	a,(OFST+0,sp)
 310  00d3 5f            	clrw	x
 311  00d4 97            	ld	xl,a
 312  00d5 e601          	ld	a,(L3_RFmsg,x)
 313  00d7 1502          	bcp	a,(OFST-1,sp)
 314  00d9 2733          	jreq	L571
 315                     ; 77         RFM_DATA(0);
 317  00db 72135005      	bres	20485,#1
 318                     ; 78         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 320  00df 721152e5      	bres	21221,#0
 322  00e3               L102:
 323                     ; 79         while(!(TIM4->SR1 & TIM4_IT_Update));
 325  00e3 720152e5fb    	btjf	21221,#0,L102
 326                     ; 80         RFM_DATA(1);
 328  00e8 72125005      	bset	20485,#1
 329                     ; 81         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 331  00ec 721152e5      	bres	21221,#0
 333  00f0               L702:
 334                     ; 82         while(!(TIM4->SR1 & TIM4_IT_Update));
 336  00f0 720152e5fb    	btjf	21221,#0,L702
 338  00f5               L312:
 339                     ; 94       mask >>= 1;
 341  00f5 0402          	srl	(OFST-1,sp)
 342                     ; 72     for(j=0; j<8; j++)
 344  00f7 0c01          	inc	(OFST-2,sp)
 347  00f9 7b01          	ld	a,(OFST-2,sp)
 348  00fb a108          	cp	a,#8
 349  00fd 25d2          	jrult	L761
 350                     ; 69   for(i=0; i<RFSEND_DATALEN; i++)
 352  00ff 0c03          	inc	(OFST+0,sp)
 355  0101 7b03          	ld	a,(OFST+0,sp)
 356  0103 a105          	cp	a,#5
 357  0105 25c4          	jrult	L161
 358                     ; 97   if(RFM_DATA_STATE)
 360  0107 720350062b    	btjf	20486,#1,L132
 362  010c 201c          	jra	L532
 363  010e               L571:
 364                     ; 87         RFM_DATA(1);
 366  010e 72125005      	bset	20485,#1
 367                     ; 88         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 369  0112 721152e5      	bres	21221,#0
 371  0116               L712:
 372                     ; 89         while(!(TIM4->SR1 & TIM4_IT_Update));
 374  0116 720152e5fb    	btjf	21221,#0,L712
 375                     ; 90         RFM_DATA(0);
 377  011b 72135005      	bres	20485,#1
 378                     ; 91         TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 380  011f 721152e5      	bres	21221,#0
 382  0123               L522:
 383                     ; 92         while(!(TIM4->SR1 & TIM4_IT_Update));
 385  0123 720152e5fb    	btjf	21221,#0,L522
 386  0128 20cb          	jra	L312
 387  012a               L532:
 388                     ; 99     while(!(TIM4->SR1 & TIM4_IT_Update));
 390  012a 720152e5fb    	btjf	21221,#0,L532
 391                     ; 100     RFM_DATA(0);
 393  012f 72135005      	bres	20485,#1
 394                     ; 101     TIM4->SR1 &= (u8)(~TIM4_IT_Update);
 396  0133 721152e5      	bres	21221,#0
 397  0137               L132:
 398                     ; 103   RFM_DATA(0);
 400  0137 72135005      	bres	20485,#1
 401                     ; 104 }
 404  013b 5b03          	addw	sp,#3
 405  013d 81            	ret	
 501                     	switch	.ubsct
 502  0000               L5_chksum:
 503  0000 00            	ds.b	1
 504  0001               L3_RFmsg:
 505  0001 0000000000    	ds.b	5
 506                     	xdef	_RF_Send
 507                     	xref	_TIM4_TimeBaseInit
 508                     	xref	_CLK_PeripheralClockConfig
 528                     	end
