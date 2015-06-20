   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  70                     ; 8 void RFPULSE(u8 LOW, u8 HIGH) 
  70                     ; 9 { 
  72                     .text:	section	.text,new
  73  0000               _RFPULSE:
  75  0000 89            	pushw	x
  76       00000000      OFST:	set	0
  79                     ; 10   delay_4us(LOW);
  81  0001 9e            	ld	a,xh
  82  0002 cd0000        	call	_delay_4us
  84                     ; 11   RFSEND_HIGH();
  86  0005 721c500a      	bset	20490,#6
  87                     ; 12   delay_4us(HIGH);
  89  0009 7b02          	ld	a,(OFST+2,sp)
  90  000b cd0000        	call	_delay_4us
  92                     ; 13   RFSEND_LOW();
  94  000e 721d500a      	bres	20490,#6
  95                     ; 14 }         
  98  0012 85            	popw	x
  99  0013 81            	ret	
 102                     	bsct
 103  0000               L53_m_RFseccode:
 104  0000 81b3ac98      	dc.l	-2118931304
 189                     ; 19 void RF_Send(RF_Cmd_TypeDef RFcmd)
 189                     ; 20 {
 190                     .text:	section	.text,new
 191  0000               _RF_Send:
 193  0000 88            	push	a
 194  0001 5203          	subw	sp,#3
 195       00000003      OFST:	set	3
 198                     ; 22   m_RFseccode = xorshift32(m_RFseccode);
 200  0003 be02          	ldw	x,L53_m_RFseccode+2
 201  0005 89            	pushw	x
 202  0006 be00          	ldw	x,L53_m_RFseccode
 203  0008 89            	pushw	x
 204  0009 cd0000        	call	_xorshift32
 206  000c 5b04          	addw	sp,#4
 207  000e ae0000        	ldw	x,#L53_m_RFseccode
 208  0011 cd0000        	call	c_rtol
 210                     ; 23   RFmsg.RFmsgmember.RFseccode = m_RFseccode;
 212  0014 be02          	ldw	x,L53_m_RFseccode+2
 213  0016 bf03          	ldw	L33_RFmsg+2,x
 214  0018 be00          	ldw	x,L53_m_RFseccode
 215  001a bf01          	ldw	L33_RFmsg,x
 216                     ; 24   RFmsg.RFmsgmember.RFremoteID = RFREMOTEID;
 218  001c 35560005      	mov	L33_RFmsg+4,#86
 219                     ; 25   RFmsg.RFmsgmember.RFcmd = RFcmd;
 221  0020 7b04          	ld	a,(OFST+1,sp)
 222  0022 b706          	ld	L33_RFmsg+5,a
 223                     ; 27   CHKSUM = 0;
 225  0024 3f00          	clr	L73_CHKSUM
 226                     ; 29   for(i=0; i<RFSEND_DATALEN-1; i++)
 228  0026 4f            	clr	a
 229  0027 6b03          	ld	(OFST+0,sp),a
 230  0029               L301:
 231                     ; 31     CHKSUM += RFmsg.RFmsgarray[i];
 233  0029 5f            	clrw	x
 234  002a 97            	ld	xl,a
 235  002b b600          	ld	a,L73_CHKSUM
 236  002d eb01          	add	a,(L33_RFmsg,x)
 237  002f b700          	ld	L73_CHKSUM,a
 238                     ; 29   for(i=0; i<RFSEND_DATALEN-1; i++)
 240  0031 0c03          	inc	(OFST+0,sp)
 243  0033 7b03          	ld	a,(OFST+0,sp)
 244  0035 a106          	cp	a,#6
 245  0037 25f0          	jrult	L301
 246                     ; 33   CHKSUM = (u8)(~CHKSUM);
 248  0039 3300          	cpl	L73_CHKSUM
 249                     ; 34   RFmsg.RFmsgmember.RFmsgCHKSUM = CHKSUM;
 251  003b 450007        	mov	L33_RFmsg+6,L73_CHKSUM
 252                     ; 36   for(i=0; i < 10; i++)
 254  003e 0f03          	clr	(OFST+0,sp)
 255  0040               L111:
 256                     ; 39     RFPULSE(87, 87);
 258  0040 ae5757        	ldw	x,#22359
 259  0043 cd0000        	call	_RFPULSE
 261                     ; 36   for(i=0; i < 10; i++)
 263  0046 0c03          	inc	(OFST+0,sp)
 266  0048 7b03          	ld	a,(OFST+0,sp)
 267  004a a10a          	cp	a,#10
 268  004c 25f2          	jrult	L111
 269                     ; 44   RFPULSE(212, 100);
 271  004e aed464        	ldw	x,#54372
 272  0051 cd0000        	call	_RFPULSE
 274                     ; 47   for(i=0; i<RFSEND_DATALEN; i++)
 276  0054 0f03          	clr	(OFST+0,sp)
 277  0056               L711:
 278                     ; 49     mask = 0x80;
 280  0056 a680          	ld	a,#128
 281  0058 6b02          	ld	(OFST-1,sp),a
 282                     ; 50     for(j=0; j<8; j++)
 284  005a 0f01          	clr	(OFST-2,sp)
 285  005c               L521:
 286                     ; 52       if(RFmsg.RFmsgarray[i] & mask)
 288  005c 7b03          	ld	a,(OFST+0,sp)
 289  005e 5f            	clrw	x
 290  005f 97            	ld	xl,a
 291  0060 e601          	ld	a,(L33_RFmsg,x)
 292  0062 1502          	bcp	a,(OFST-1,sp)
 293  0064 2705          	jreq	L331
 294                     ; 56         RFPULSE(87, 100);
 296  0066 ae5764        	ldw	x,#22372
 299  0069 2003          	jra	L531
 300  006b               L331:
 301                     ; 62         RFPULSE(25, 100);
 303  006b ae1964        	ldw	x,#6500
 305  006e               L531:
 306  006e cd0000        	call	_RFPULSE
 307                     ; 64       mask >>= 1;
 309  0071 0402          	srl	(OFST-1,sp)
 310                     ; 50     for(j=0; j<8; j++)
 312  0073 0c01          	inc	(OFST-2,sp)
 315  0075 7b01          	ld	a,(OFST-2,sp)
 316  0077 a108          	cp	a,#8
 317  0079 25e1          	jrult	L521
 318                     ; 47   for(i=0; i<RFSEND_DATALEN; i++)
 320  007b 0c03          	inc	(OFST+0,sp)
 323  007d 7b03          	ld	a,(OFST+0,sp)
 324  007f a107          	cp	a,#7
 325  0081 25d3          	jrult	L711
 326                     ; 67 }
 329  0083 5b04          	addw	sp,#4
 330  0085 81            	ret	
 435                     	switch	.ubsct
 436  0000               L73_CHKSUM:
 437  0000 00            	ds.b	1
 438  0001               L33_RFmsg:
 439  0001 000000000000  	ds.b	7
 440                     	xref	_xorshift32
 441                     	xdef	_RF_Send
 442                     	xdef	_RFPULSE
 443                     	xref	_delay_4us
 463                     	xref	c_rtol
 464                     	end
