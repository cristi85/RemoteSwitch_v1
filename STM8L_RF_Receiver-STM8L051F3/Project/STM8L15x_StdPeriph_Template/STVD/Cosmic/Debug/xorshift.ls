   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  69                     ; 3 u32 xorshift32(u32 x) 
  69                     ; 4 {
  71                     .text:	section	.text,new
  72  0000               _xorshift32:
  74  0000 5204          	subw	sp,#4
  75       00000004      OFST:	set	4
  78                     ; 6   tmp = (u32)(x << 13);
  80  0002 96            	ldw	x,sp
  81  0003 1c0007        	addw	x,#OFST+3
  82  0006 cd0000        	call	c_ltor
  84  0009 a60d          	ld	a,#13
  85  000b cd0000        	call	c_llsh
  87  000e 96            	ldw	x,sp
  88  000f 5c            	incw	x
  89  0010 cd0000        	call	c_rtol
  91                     ; 7   x ^= tmp;
  93  0013 96            	ldw	x,sp
  94  0014 5c            	incw	x
  95  0015 cd0000        	call	c_ltor
  97  0018 96            	ldw	x,sp
  98  0019 1c0007        	addw	x,#OFST+3
  99  001c cd0000        	call	c_lgxor
 101                     ; 8   tmp = (u32)(x >> 17);
 103  001f 96            	ldw	x,sp
 104  0020 1c0007        	addw	x,#OFST+3
 105  0023 cd0000        	call	c_ltor
 107  0026 a611          	ld	a,#17
 108  0028 cd0000        	call	c_lursh
 110  002b 96            	ldw	x,sp
 111  002c 5c            	incw	x
 112  002d cd0000        	call	c_rtol
 114                     ; 9   x ^= tmp;
 116  0030 96            	ldw	x,sp
 117  0031 5c            	incw	x
 118  0032 cd0000        	call	c_ltor
 120  0035 96            	ldw	x,sp
 121  0036 1c0007        	addw	x,#OFST+3
 122  0039 cd0000        	call	c_lgxor
 124                     ; 10   tmp = (u32)(x << 5);
 126  003c 96            	ldw	x,sp
 127  003d 1c0007        	addw	x,#OFST+3
 128  0040 cd0000        	call	c_ltor
 130  0043 a605          	ld	a,#5
 131  0045 cd0000        	call	c_llsh
 133  0048 96            	ldw	x,sp
 134  0049 5c            	incw	x
 135  004a cd0000        	call	c_rtol
 137                     ; 11   x ^= tmp;
 139  004d 96            	ldw	x,sp
 140  004e 5c            	incw	x
 141  004f cd0000        	call	c_ltor
 143  0052 96            	ldw	x,sp
 144  0053 1c0007        	addw	x,#OFST+3
 145  0056 cd0000        	call	c_lgxor
 147                     ; 12   return x;
 149  0059 96            	ldw	x,sp
 150  005a 1c0007        	addw	x,#OFST+3
 151  005d cd0000        	call	c_ltor
 155  0060 5b04          	addw	sp,#4
 156  0062 81            	ret	
 169                     	xdef	_xorshift32
 188                     	xref	c_lursh
 189                     	xref	c_lgxor
 190                     	xref	c_rtol
 191                     	xref	c_llsh
 192                     	xref	c_ltor
 193                     	end
