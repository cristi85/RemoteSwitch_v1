   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  50                     ; 89 void BEEP_DeInit(void)
  50                     ; 90 {
  52                     .text:	section	.text,new
  53  0000               _BEEP_DeInit:
  57                     ; 91   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  59  0000 725f50f0      	clr	20720
  60                     ; 92   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  62  0004 351f50f3      	mov	20723,#31
  63                     ; 93 }
  66  0008 81            	ret	
 131                     ; 102 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 131                     ; 103 {
 132                     .text:	section	.text,new
 133  0000               _BEEP_Init:
 135  0000 88            	push	a
 136       00000000      OFST:	set	0
 139                     ; 106   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 141                     ; 109   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 143  0001 c650f3        	ld	a,20723
 144  0004 a41f          	and	a,#31
 145  0006 a11f          	cp	a,#31
 146  0008 260c          	jrne	L15
 147                     ; 111     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 149  000a c650f3        	ld	a,20723
 150  000d a4e0          	and	a,#224
 151  000f c750f3        	ld	20723,a
 152                     ; 112     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 154  0012 721050f3      	bset	20723,#0
 155  0016               L15:
 156                     ; 116   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 158  0016 c650f3        	ld	a,20723
 159  0019 a43f          	and	a,#63
 160  001b c750f3        	ld	20723,a
 161                     ; 117   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 163  001e c650f3        	ld	a,20723
 164  0021 1a01          	or	a,(OFST+1,sp)
 165  0023 c750f3        	ld	20723,a
 166                     ; 119 }
 169  0026 84            	pop	a
 170  0027 81            	ret	
 225                     ; 127 void BEEP_Cmd(FunctionalState NewState)
 225                     ; 128 {
 226                     .text:	section	.text,new
 227  0000               _BEEP_Cmd:
 231                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 233                     ; 132   if (NewState != DISABLE)
 235  0000 4d            	tnz	a
 236  0001 2705          	jreq	L101
 237                     ; 135     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 239  0003 721a50f3      	bset	20723,#5
 242  0007 81            	ret	
 243  0008               L101:
 244                     ; 140     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 246  0008 721b50f3      	bres	20723,#5
 247                     ; 142 }
 250  000c 81            	ret	
 286                     ; 175 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 286                     ; 176 {
 287                     .text:	section	.text,new
 288  0000               _BEEP_LSClockToTIMConnectCmd:
 292                     ; 178   assert_param(IS_FUNCTIONAL_STATE(NewState));
 294                     ; 180   if (NewState != DISABLE)
 296  0000 4d            	tnz	a
 297  0001 2705          	jreq	L321
 298                     ; 183     BEEP->CSR1 |= BEEP_CSR1_MSR;
 300  0003 721050f0      	bset	20720,#0
 303  0007 81            	ret	
 304  0008               L321:
 305                     ; 188     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 307  0008 721150f0      	bres	20720,#0
 308                     ; 190 }
 311  000c 81            	ret	
 364                     .const:	section	.text
 365  0000               L61:
 366  0000 000003e8      	dc.l	1000
 367                     ; 204 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 367                     ; 205 {
 368                     .text:	section	.text,new
 369  0000               _BEEP_LSICalibrationConfig:
 371  0000 5206          	subw	sp,#6
 372       00000006      OFST:	set	6
 375                     ; 210   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 377                     ; 212   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 379  0002 96            	ldw	x,sp
 380  0003 1c0009        	addw	x,#OFST+3
 381  0006 cd0000        	call	c_ltor
 383  0009 ae0000        	ldw	x,#L61
 384  000c cd0000        	call	c_ludv
 386  000f be02          	ldw	x,c_lreg+2
 387  0011 1f03          	ldw	(OFST-3,sp),x
 388                     ; 216   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 390  0013 c650f3        	ld	a,20723
 391  0016 a4e0          	and	a,#224
 392  0018 c750f3        	ld	20723,a
 393                     ; 218   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 395  001b 54            	srlw	x
 396  001c 54            	srlw	x
 397  001d 54            	srlw	x
 398  001e 1f05          	ldw	(OFST-1,sp),x
 399                     ; 220   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 401  0020 58            	sllw	x
 402  0021 58            	sllw	x
 403  0022 58            	sllw	x
 404  0023 1f01          	ldw	(OFST-5,sp),x
 405  0025 1e03          	ldw	x,(OFST-3,sp)
 406  0027 72f001        	subw	x,(OFST-5,sp)
 407  002a 1605          	ldw	y,(OFST-1,sp)
 408  002c 9058          	sllw	y
 409  002e 905c          	incw	y
 410  0030 cd0000        	call	c_imul
 412  0033 1605          	ldw	y,(OFST-1,sp)
 413  0035 9058          	sllw	y
 414  0037 9058          	sllw	y
 415  0039 bf00          	ldw	c_x,x
 416  003b 9058          	sllw	y
 417  003d 90b300        	cpw	y,c_x
 418  0040 7b06          	ld	a,(OFST+0,sp)
 419  0042 2504          	jrult	L551
 420                     ; 222     BEEP->CSR2 |= (uint8_t)(A - 2U);
 422  0044 a002          	sub	a,#2
 424  0046 2001          	jra	L751
 425  0048               L551:
 426                     ; 226     BEEP->CSR2 |= (uint8_t)(A - 1U);
 428  0048 4a            	dec	a
 429  0049               L751:
 430  0049 ca50f3        	or	a,20723
 431  004c c750f3        	ld	20723,a
 432                     ; 228 }
 435  004f 5b06          	addw	sp,#6
 436  0051 81            	ret	
 449                     	xdef	_BEEP_LSICalibrationConfig
 450                     	xdef	_BEEP_LSClockToTIMConnectCmd
 451                     	xdef	_BEEP_Cmd
 452                     	xdef	_BEEP_Init
 453                     	xdef	_BEEP_DeInit
 454                     	xref.b	c_lreg
 455                     	xref.b	c_x
 474                     	xref	c_imul
 475                     	xref	c_ludv
 476                     	xref	c_ltor
 477                     	end
