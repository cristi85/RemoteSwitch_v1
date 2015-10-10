   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .const:	section	.text
  22  0000               L5_error_cnt_thr:
  23  0000 01            	dc.b	1
  24  0001 01            	dc.b	1
  66                     ; 8 void Errors_Init()
  66                     ; 9 {
  68                     .text:	section	.text,new
  69  0000               _Errors_Init:
  71  0000 88            	push	a
  72       00000001      OFST:	set	1
  75                     ; 11   for(i = 0; i < ERRORS; i++)
  77  0001 4f            	clr	a
  78  0002 6b01          	ld	(OFST+0,sp),a
  79  0004               L53:
  80                     ; 13     error_cnt[i] = 0;
  82  0004 5f            	clrw	x
  83  0005 97            	ld	xl,a
  84  0006 6f02          	clr	(L3_error_cnt,x)
  85                     ; 14     error_state[i] = 0;
  87  0008 5f            	clrw	x
  88  0009 97            	ld	xl,a
  89  000a 6f00          	clr	(L7_error_state,x)
  90                     ; 11   for(i = 0; i < ERRORS; i++)
  92  000c 0c01          	inc	(OFST+0,sp)
  95  000e 7b01          	ld	a,(OFST+0,sp)
  96  0010 a102          	cp	a,#2
  97  0012 25f0          	jrult	L53
  98                     ; 16 }
 101  0014 84            	pop	a
 102  0015 81            	ret	
 139                     ; 17 void Errors_SetError(u8 ErrorID)
 139                     ; 18 {
 140                     .text:	section	.text,new
 141  0000               _Errors_SetError:
 143  0000 88            	push	a
 144       00000000      OFST:	set	0
 147                     ; 19   if(error_cnt[ErrorID] < U8_MAX) error_cnt[ErrorID]++;
 149  0001 5f            	clrw	x
 150  0002 97            	ld	xl,a
 151  0003 e602          	ld	a,(L3_error_cnt,x)
 152  0005 a1ff          	cp	a,#255
 153  0007 2406          	jruge	L16
 156  0009 7b01          	ld	a,(OFST+1,sp)
 157  000b 5f            	clrw	x
 158  000c 97            	ld	xl,a
 159  000d 6c02          	inc	(L3_error_cnt,x)
 160  000f               L16:
 161                     ; 20   if(error_cnt[ErrorID] >= error_cnt_thr[ErrorID])
 163  000f 7b01          	ld	a,(OFST+1,sp)
 164  0011 5f            	clrw	x
 165  0012 97            	ld	xl,a
 166  0013 905f          	clrw	y
 167  0015 9097          	ld	yl,a
 168  0017 90e602        	ld	a,(L3_error_cnt,y)
 169  001a d10000        	cp	a,(L5_error_cnt_thr,x)
 170  001d 2508          	jrult	L36
 171                     ; 22     error_state[ErrorID] = TRUE;
 173  001f 7b01          	ld	a,(OFST+1,sp)
 174  0021 5f            	clrw	x
 175  0022 97            	ld	xl,a
 176  0023 a601          	ld	a,#1
 177  0025 e700          	ld	(L7_error_state,x),a
 178  0027               L36:
 179                     ; 24 }
 182  0027 84            	pop	a
 183  0028 81            	ret	
 219                     ; 25 void Errors_ResetError(u8 ErrorID)
 219                     ; 26 {
 220                     .text:	section	.text,new
 221  0000               _Errors_ResetError:
 223  0000 88            	push	a
 224       00000000      OFST:	set	0
 227                     ; 27   if(error_cnt[ErrorID] > 0) error_cnt[ErrorID]--;
 229  0001 5f            	clrw	x
 230  0002 97            	ld	xl,a
 231  0003 6d02          	tnz	(L3_error_cnt,x)
 232  0005 2704          	jreq	L301
 235  0007 5f            	clrw	x
 236  0008 97            	ld	xl,a
 237  0009 6a02          	dec	(L3_error_cnt,x)
 238  000b               L301:
 239                     ; 28   if(error_cnt[ErrorID] == 0)
 241  000b 7b01          	ld	a,(OFST+1,sp)
 242  000d 5f            	clrw	x
 243  000e 97            	ld	xl,a
 244  000f 6d02          	tnz	(L3_error_cnt,x)
 245  0011 2604          	jrne	L501
 246                     ; 30     error_state[ErrorID] = FALSE;
 248  0013 5f            	clrw	x
 249  0014 97            	ld	xl,a
 250  0015 6f00          	clr	(L7_error_state,x)
 251  0017               L501:
 252                     ; 32 }
 255  0017 84            	pop	a
 256  0018 81            	ret	
 312                     ; 33 bool Errors_CheckError(u8 ErrorID)
 312                     ; 34 {
 313                     .text:	section	.text,new
 314  0000               _Errors_CheckError:
 318                     ; 35   return error_state[ErrorID];
 320  0000 5f            	clrw	x
 321  0001 97            	ld	xl,a
 322  0002 e600          	ld	a,(L7_error_state,x)
 325  0004 81            	ret	
 361                     ; 38 bool Errors_IsError()
 361                     ; 39 {
 362                     .text:	section	.text,new
 363  0000               _Errors_IsError:
 365  0000 88            	push	a
 366       00000001      OFST:	set	1
 369                     ; 41   for(i = 0; i < ERRORS; i++)
 371  0001 4f            	clr	a
 372  0002 6b01          	ld	(OFST+0,sp),a
 373  0004               L351:
 374                     ; 43     if(error_state[i]) return TRUE;
 376  0004 5f            	clrw	x
 377  0005 97            	ld	xl,a
 378  0006 e600          	ld	a,(L7_error_state,x)
 379  0008 2705          	jreq	L161
 382  000a a601          	ld	a,#1
 385  000c 5b01          	addw	sp,#1
 386  000e 81            	ret	
 387  000f               L161:
 388                     ; 41   for(i = 0; i < ERRORS; i++)
 390  000f 0c01          	inc	(OFST+0,sp)
 393  0011 7b01          	ld	a,(OFST+0,sp)
 394  0013 a102          	cp	a,#2
 395  0015 25ed          	jrult	L351
 396                     ; 45   return FALSE;
 398  0017 4f            	clr	a
 401  0018 5b01          	addw	sp,#1
 402  001a 81            	ret	
 446                     ; 48 u8 Errors_NumErrors(void)
 446                     ; 49 {
 447                     .text:	section	.text,new
 448  0000               _Errors_NumErrors:
 450  0000 89            	pushw	x
 451       00000002      OFST:	set	2
 454                     ; 50   u8 i, numerrors = 0;
 456  0001 0f01          	clr	(OFST-1,sp)
 457                     ; 51   for(i = 0; i < ERRORS; i++)
 459  0003 4f            	clr	a
 460  0004 6b02          	ld	(OFST+0,sp),a
 461  0006               L502:
 462                     ; 53     if(error_state[i]) numerrors++;
 464  0006 5f            	clrw	x
 465  0007 97            	ld	xl,a
 466  0008 e600          	ld	a,(L7_error_state,x)
 467  000a 2702          	jreq	L312
 470  000c 0c01          	inc	(OFST-1,sp)
 471  000e               L312:
 472                     ; 51   for(i = 0; i < ERRORS; i++)
 474  000e 0c02          	inc	(OFST+0,sp)
 477  0010 7b02          	ld	a,(OFST+0,sp)
 478  0012 a102          	cp	a,#2
 479  0014 25f0          	jrult	L502
 480                     ; 55   return numerrors;
 482  0016 7b01          	ld	a,(OFST-1,sp)
 485  0018 85            	popw	x
 486  0019 81            	ret	
 531                     	switch	.ubsct
 532  0000               L7_error_state:
 533  0000 0000          	ds.b	2
 534  0002               L3_error_cnt:
 535  0002 0000          	ds.b	2
 536                     	xdef	_Errors_NumErrors
 537                     	xdef	_Errors_IsError
 538                     	xdef	_Errors_CheckError
 539                     	xdef	_Errors_ResetError
 540                     	xdef	_Errors_SetError
 541                     	xdef	_Errors_Init
 561                     	end
