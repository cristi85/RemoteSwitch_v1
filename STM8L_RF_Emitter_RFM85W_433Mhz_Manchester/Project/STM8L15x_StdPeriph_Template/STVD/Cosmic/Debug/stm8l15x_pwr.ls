   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 79 void PWR_DeInit(void)
  49                     ; 80 {
  51                     .text:	section	.text,new
  52  0000               _PWR_DeInit:
  56                     ; 81   PWR->CSR1 = PWR_CSR1_PVDIF;
  58  0000 352050b2      	mov	20658,#32
  59                     ; 82   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  61  0004 725f50b3      	clr	20659
  62                     ; 83 }
  65  0008 81            	ret	
 162                     ; 99 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 162                     ; 100 {
 163                     .text:	section	.text,new
 164  0000               _PWR_PVDLevelConfig:
 166  0000 88            	push	a
 167       00000000      OFST:	set	0
 170                     ; 102   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 172                     ; 105   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 174  0001 c650b2        	ld	a,20658
 175  0004 a4f1          	and	a,#241
 176  0006 c750b2        	ld	20658,a
 177                     ; 108   PWR->CSR1 |= PWR_PVDLevel;
 179  0009 c650b2        	ld	a,20658
 180  000c 1a01          	or	a,(OFST+1,sp)
 181  000e c750b2        	ld	20658,a
 182                     ; 110 }
 185  0011 84            	pop	a
 186  0012 81            	ret	
 241                     ; 118 void PWR_PVDCmd(FunctionalState NewState)
 241                     ; 119 {
 242                     .text:	section	.text,new
 243  0000               _PWR_PVDCmd:
 247                     ; 121   assert_param(IS_FUNCTIONAL_STATE(NewState));
 249                     ; 123   if (NewState != DISABLE)
 251  0000 4d            	tnz	a
 252  0001 2705          	jreq	L111
 253                     ; 126     PWR->CSR1 |= PWR_CSR1_PVDE;
 255  0003 721050b2      	bset	20658,#0
 258  0007 81            	ret	
 259  0008               L111:
 260                     ; 131     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 262  0008 721150b2      	bres	20658,#0
 263                     ; 133 }
 266  000c 81            	ret	
 301                     ; 168 void PWR_FastWakeUpCmd(FunctionalState NewState)
 301                     ; 169 {
 302                     .text:	section	.text,new
 303  0000               _PWR_FastWakeUpCmd:
 307                     ; 171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 309                     ; 173   if (NewState != DISABLE)
 311  0000 4d            	tnz	a
 312  0001 2705          	jreq	L331
 313                     ; 176     PWR->CSR2 |= PWR_CSR2_FWU;
 315  0003 721450b3      	bset	20659,#2
 318  0007 81            	ret	
 319  0008               L331:
 320                     ; 181     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 322  0008 721550b3      	bres	20659,#2
 323                     ; 183 }
 326  000c 81            	ret	
 362                     ; 191 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 362                     ; 192 {
 363                     .text:	section	.text,new
 364  0000               _PWR_UltraLowPowerCmd:
 368                     ; 194   assert_param(IS_FUNCTIONAL_STATE(NewState));
 370                     ; 196   if (NewState != DISABLE)
 372  0000 4d            	tnz	a
 373  0001 2705          	jreq	L551
 374                     ; 199     PWR->CSR2 |= PWR_CSR2_ULP;
 376  0003 721250b3      	bset	20659,#1
 379  0007 81            	ret	
 380  0008               L551:
 381                     ; 204     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 383  0008 721350b3      	bres	20659,#1
 384                     ; 206 }
 387  000c 81            	ret	
 422                     ; 229 void PWR_PVDITConfig(FunctionalState NewState)
 422                     ; 230 {
 423                     .text:	section	.text,new
 424  0000               _PWR_PVDITConfig:
 428                     ; 232   assert_param(IS_FUNCTIONAL_STATE(NewState));
 430                     ; 234   if (NewState != DISABLE)
 432  0000 4d            	tnz	a
 433  0001 2705          	jreq	L771
 434                     ; 237     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 436  0003 721850b2      	bset	20658,#4
 439  0007 81            	ret	
 440  0008               L771:
 441                     ; 242     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 443  0008 721950b2      	bres	20658,#4
 444                     ; 244 }
 447  000c 81            	ret	
 540                     ; 258 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 540                     ; 259 {
 541                     .text:	section	.text,new
 542  0000               _PWR_GetFlagStatus:
 544  0000 88            	push	a
 545  0001 88            	push	a
 546       00000001      OFST:	set	1
 549                     ; 260   FlagStatus bitstatus = RESET;
 551                     ; 263   assert_param(IS_PWR_FLAG(PWR_FLAG));
 553                     ; 265   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 555  0002 a501          	bcp	a,#1
 556  0004 2709          	jreq	L742
 557                     ; 267     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 559  0006 720150b302    	btjf	20659,#0,L152
 560                     ; 269       bitstatus = SET;
 562  000b 2009          	jp	LC002
 563  000d               L152:
 564                     ; 273       bitstatus = RESET;
 565  000d 200b          	jp	L752
 566  000f               L742:
 567                     ; 278     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 569  000f c650b2        	ld	a,20658
 570  0012 1502          	bcp	a,(OFST+1,sp)
 571  0014 2704          	jreq	L752
 572                     ; 280       bitstatus = SET;
 574  0016               LC002:
 576  0016 a601          	ld	a,#1
 578  0018 2001          	jra	L552
 579  001a               L752:
 580                     ; 284       bitstatus = RESET;
 583  001a 4f            	clr	a
 584  001b               L552:
 585                     ; 289   return((FlagStatus)bitstatus);
 589  001b 85            	popw	x
 590  001c 81            	ret	
 613                     ; 297 void PWR_PVDClearFlag(void)
 613                     ; 298 {
 614                     .text:	section	.text,new
 615  0000               _PWR_PVDClearFlag:
 619                     ; 300   PWR->CSR1 |= PWR_CSR1_PVDIF;
 621  0000 721a50b2      	bset	20658,#5
 622                     ; 301 }
 625  0004 81            	ret	
 679                     ; 308 ITStatus PWR_PVDGetITStatus(void)
 679                     ; 309 {
 680                     .text:	section	.text,new
 681  0000               _PWR_PVDGetITStatus:
 683  0000 89            	pushw	x
 684       00000002      OFST:	set	2
 687                     ; 310   ITStatus bitstatus = RESET;
 689                     ; 312   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 693                     ; 314   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 695  0001 c650b2        	ld	a,20658
 696  0004 a420          	and	a,#32
 697  0006 6b01          	ld	(OFST-1,sp),a
 698                     ; 315   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 700  0008 c650b2        	ld	a,20658
 701  000b a410          	and	a,#16
 702  000d 6b02          	ld	(OFST+0,sp),a
 703                     ; 317   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 705  000f 7b01          	ld	a,(OFST-1,sp)
 706  0011 2708          	jreq	L123
 708  0013 7b02          	ld	a,(OFST+0,sp)
 709  0015 2704          	jreq	L123
 710                     ; 319     bitstatus = (ITStatus)SET;
 712  0017 a601          	ld	a,#1
 714  0019 2001          	jra	L323
 715  001b               L123:
 716                     ; 323     bitstatus = (ITStatus)RESET;
 718  001b 4f            	clr	a
 719  001c               L323:
 720                     ; 325   return ((ITStatus)bitstatus);
 724  001c 85            	popw	x
 725  001d 81            	ret	
 749                     ; 333 void PWR_PVDClearITPendingBit(void)
 749                     ; 334 {
 750                     .text:	section	.text,new
 751  0000               _PWR_PVDClearITPendingBit:
 755                     ; 336   PWR->CSR1 |= PWR_CSR1_PVDIF;
 757  0000 721a50b2      	bset	20658,#5
 758                     ; 337 }
 761  0004 81            	ret	
 774                     	xdef	_PWR_PVDClearITPendingBit
 775                     	xdef	_PWR_PVDClearFlag
 776                     	xdef	_PWR_GetFlagStatus
 777                     	xdef	_PWR_PVDGetITStatus
 778                     	xdef	_PWR_PVDITConfig
 779                     	xdef	_PWR_UltraLowPowerCmd
 780                     	xdef	_PWR_FastWakeUpCmd
 781                     	xdef	_PWR_PVDCmd
 782                     	xdef	_PWR_PVDLevelConfig
 783                     	xdef	_PWR_DeInit
 802                     	end
