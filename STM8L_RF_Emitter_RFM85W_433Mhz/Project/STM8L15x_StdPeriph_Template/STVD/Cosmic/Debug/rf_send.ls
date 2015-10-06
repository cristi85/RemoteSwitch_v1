   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 112                     ; 8 void RF_Send(RF_Cmd_TypeDef RFcmd)
 112                     ; 9 {
 114                     .text:	section	.text,new
 115  0000               _RF_Send:
 117  0000 5203          	subw	sp,#3
 118       00000003      OFST:	set	3
 121                     ; 11   RFmsg.RFmsgmember.RFsyncValue = RFSYNCVAL;
 123  0002 ae81b3        	ldw	x,#33203
 124  0005 bf01          	ldw	L3_RFmsg,x
 125                     ; 12   RFmsg.RFmsgmember.RFNodeId = RFNODEID;
 127  0007 35560003      	mov	L3_RFmsg+2,#86
 128                     ; 13   RFmsg.RFmsgmember.RFcmd = RFcmd;
 130  000b b704          	ld	L3_RFmsg+3,a
 131                     ; 15   chksum = 0;
 133  000d 3f00          	clr	L5_chksum
 134                     ; 17   for(i=0; i<RFSEND_DATALEN-1; i++)
 136  000f 4f            	clr	a
 137  0010 6b03          	ld	(OFST+0,sp),a
 138  0012               L75:
 139                     ; 19     chksum += RFmsg.RFmsgarray[i];
 141  0012 5f            	clrw	x
 142  0013 97            	ld	xl,a
 143  0014 b600          	ld	a,L5_chksum
 144  0016 eb01          	add	a,(L3_RFmsg,x)
 145  0018 b700          	ld	L5_chksum,a
 146                     ; 17   for(i=0; i<RFSEND_DATALEN-1; i++)
 148  001a 0c03          	inc	(OFST+0,sp)
 151  001c 7b03          	ld	a,(OFST+0,sp)
 152  001e a104          	cp	a,#4
 153  0020 25f0          	jrult	L75
 154                     ; 21   chksum = (u8)(~chksum);
 156  0022 3300          	cpl	L5_chksum
 157                     ; 22   RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
 159                     ; 24   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 161  0024 ae0101        	ldw	x,#257
 162  0027 450005        	mov	L3_RFmsg+4,L5_chksum
 163  002a cd0000        	call	_CLK_PeripheralClockConfig
 165                     ; 25   TIM3_SetCounter(0);
 167  002d 5f            	clrw	x
 168  002e cd0000        	call	_TIM3_SetCounter
 170                     ; 27   TIM3->CCR1H = (uint8_t)0x01;
 172  0031 35015291      	mov	21137,#1
 173                     ; 28   TIM3->CCR1L = (uint8_t)0x77;
 175  0035 35775292      	mov	21138,#119
 176                     ; 30   TIM3->ARRH = (uint8_t)0x02;
 178  0039 3502528f      	mov	21135,#2
 179                     ; 31   TIM3->ARRL = (uint8_t)0xEE;
 181  003d 35ee5290      	mov	21136,#238
 182                     ; 33   TIM3->CR1 |= TIM_CR1_CEN;
 184  0041 72105280      	bset	21120,#0
 185                     ; 35   for(i=0; i < 11; i++)
 187  0045 0f03          	clr	(OFST+0,sp)
 188  0047               L57:
 189                     ; 37     while(!(TIM3->SR1 & TIM3_FLAG_Update));
 191  0047 72015286fb    	btjf	21126,#0,L57
 192                     ; 38     TIM3->SR1 &= ~(TIM3_FLAG_Update);
 194  004c 72115286      	bres	21126,#0
 195                     ; 35   for(i=0; i < 11; i++)
 197  0050 0c03          	inc	(OFST+0,sp)
 200  0052 7b03          	ld	a,(OFST+0,sp)
 201  0054 a10b          	cp	a,#11
 202  0056 25ef          	jrult	L57
 203                     ; 42   TIM3->CCR1H = (uint8_t)0x02;
 205  0058 35025291      	mov	21137,#2
 206                     ; 43   TIM3->CCR1L = (uint8_t)0x58;
 208  005c 35585292      	mov	21138,#88
 209                     ; 45   TIM3->ARRH = (uint8_t)0x04;
 211  0060 3504528f      	mov	21135,#4
 212                     ; 46   TIM3->ARRL = (uint8_t)0xB0;
 214  0064 35b05290      	mov	21136,#176
 216  0068               L501:
 217                     ; 48   while(!(TIM3->SR1 & TIM3_FLAG_Update));
 219  0068 72015286fb    	btjf	21126,#0,L501
 220                     ; 49   TIM3->SR1 &= ~(TIM3_FLAG_Update);
 222  006d 72115286      	bres	21126,#0
 223                     ; 52   for(i=0; i<RFSEND_DATALEN; i++)
 225  0071 0f03          	clr	(OFST+0,sp)
 226  0073               L111:
 227                     ; 54     mask = 0x80;
 229  0073 a680          	ld	a,#128
 230  0075 6b02          	ld	(OFST-1,sp),a
 231                     ; 55     for(j=0; j<8; j++)
 233  0077 0f01          	clr	(OFST-2,sp)
 234  0079               L711:
 235                     ; 57       if(RFmsg.RFmsgarray[i] & mask)
 237  0079 7b03          	ld	a,(OFST+0,sp)
 238  007b 5f            	clrw	x
 239  007c 97            	ld	xl,a
 240  007d e601          	ld	a,(L3_RFmsg,x)
 241  007f 1502          	bcp	a,(OFST-1,sp)
 242  0081 2712          	jreq	L521
 243                     ; 61         TIM3->CCR1H = (uint8_t)0x01;
 245  0083 35015291      	mov	21137,#1
 246                     ; 62         TIM3->CCR1L = (uint8_t)0x77;
 248  0087 35775292      	mov	21138,#119
 249                     ; 64         TIM3->ARRH = (uint8_t)0x02;
 251  008b 3502528f      	mov	21135,#2
 252                     ; 65         TIM3->ARRL = (uint8_t)0xEE;
 254  008f 35ee5290      	mov	21136,#238
 256  0093 2010          	jra	L721
 257  0095               L521:
 258                     ; 71         TIM3->CCR1H = (uint8_t)0x00;
 260  0095 725f5291      	clr	21137
 261                     ; 72         TIM3->CCR1L = (uint8_t)0xFA;
 263  0099 35fa5292      	mov	21138,#250
 264                     ; 74         TIM3->ARRH = (uint8_t)0x01;
 266  009d 3501528f      	mov	21135,#1
 267                     ; 75         TIM3->ARRL = (uint8_t)0xF4;
 269  00a1 35f45290      	mov	21136,#244
 270  00a5               L721:
 271                     ; 77       mask >>= 1;
 273  00a5 0402          	srl	(OFST-1,sp)
 275  00a7               L331:
 276                     ; 78       while(!(TIM3->SR1 & TIM3_FLAG_Update));
 278  00a7 72015286fb    	btjf	21126,#0,L331
 279                     ; 79       TIM3->SR1 &= ~(TIM3_FLAG_Update);
 281  00ac 72115286      	bres	21126,#0
 282                     ; 55     for(j=0; j<8; j++)
 284  00b0 0c01          	inc	(OFST-2,sp)
 287  00b2 7b01          	ld	a,(OFST-2,sp)
 288  00b4 a108          	cp	a,#8
 289  00b6 25c1          	jrult	L711
 290                     ; 52   for(i=0; i<RFSEND_DATALEN; i++)
 292  00b8 0c03          	inc	(OFST+0,sp)
 295  00ba 7b03          	ld	a,(OFST+0,sp)
 296  00bc a105          	cp	a,#5
 297  00be 25b3          	jrult	L111
 299  00c0               L141:
 300                     ; 83   while(!(TIM3->SR1 & TIM3_FLAG_Update));
 302  00c0 72015286fb    	btjf	21126,#0,L141
 303                     ; 84   TIM3->SR1 &= ~(TIM3_FLAG_Update);
 305  00c5 72115286      	bres	21126,#0
 306                     ; 86   TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
 308  00c9 72115280      	bres	21120,#0
 309                     ; 87   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
 311  00cd ae0100        	ldw	x,#256
 312  00d0 cd0000        	call	_CLK_PeripheralClockConfig
 314                     ; 88 }
 317  00d3 5b03          	addw	sp,#3
 318  00d5 81            	ret	
 414                     	switch	.ubsct
 415  0000               L5_chksum:
 416  0000 00            	ds.b	1
 417  0001               L3_RFmsg:
 418  0001 0000000000    	ds.b	5
 419                     	xdef	_RF_Send
 420                     	xref	_TIM3_SetCounter
 421                     	xref	_CLK_PeripheralClockConfig
 441                     	end
