   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  70                     ; 116 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  70                     ; 117 {
  72                     .text:	section	.text,new
  73  0000               _WWDG_Init:
  75  0000 89            	pushw	x
  76       00000000      OFST:	set	0
  79                     ; 119   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  81                     ; 121   WWDG->WR = WWDG_WR_RESET_VALUE;
  83  0001 357f50d4      	mov	20692,#127
  84                     ; 122   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  86  0005 9e            	ld	a,xh
  87  0006 aa80          	or	a,#128
  88  0008 c750d3        	ld	20691,a
  89                     ; 123   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  91  000b 7b02          	ld	a,(OFST+2,sp)
  92  000d a47f          	and	a,#127
  93  000f c750d4        	ld	20692,a
  94                     ; 124 }
  97  0012 85            	popw	x
  98  0013 81            	ret	
 142                     ; 132 void WWDG_SetWindowValue(uint8_t WindowValue)
 142                     ; 133 {
 143                     .text:	section	.text,new
 144  0000               _WWDG_SetWindowValue:
 146  0000 88            	push	a
 147       00000001      OFST:	set	1
 150                     ; 134   __IO uint8_t tmpreg = 0;
 152  0001 0f01          	clr	(OFST+0,sp)
 153                     ; 137   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 155                     ; 140   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 157  0003 a47f          	and	a,#127
 158  0005 1a01          	or	a,(OFST+0,sp)
 159  0007 6b01          	ld	(OFST+0,sp),a
 160                     ; 143   WWDG->WR = tmpreg;
 162  0009 7b01          	ld	a,(OFST+0,sp)
 163  000b c750d4        	ld	20692,a
 164                     ; 144 }
 167  000e 84            	pop	a
 168  000f 81            	ret	
 202                     ; 153 void WWDG_SetCounter(uint8_t Counter)
 202                     ; 154 {
 203                     .text:	section	.text,new
 204  0000               _WWDG_SetCounter:
 208                     ; 156   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 210                     ; 160   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 212  0000 a47f          	and	a,#127
 213  0002 c750d3        	ld	20691,a
 214                     ; 161 }
 217  0005 81            	ret	
 251                     ; 184 void WWDG_Enable(uint8_t Counter)
 251                     ; 185 {
 252                     .text:	section	.text,new
 253  0000               _WWDG_Enable:
 257                     ; 187   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 259                     ; 188   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 261  0000 aa80          	or	a,#128
 262  0002 c750d3        	ld	20691,a
 263                     ; 189 }
 266  0005 81            	ret	
 289                     ; 213 uint8_t WWDG_GetCounter(void)
 289                     ; 214 {
 290                     .text:	section	.text,new
 291  0000               _WWDG_GetCounter:
 295                     ; 215   return(WWDG->CR);
 297  0000 c650d3        	ld	a,20691
 300  0003 81            	ret	
 323                     ; 223 void WWDG_SWReset(void)
 323                     ; 224 {
 324                     .text:	section	.text,new
 325  0000               _WWDG_SWReset:
 329                     ; 225   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 331  0000 358050d3      	mov	20691,#128
 332                     ; 226 }
 335  0004 81            	ret	
 348                     	xdef	_WWDG_SWReset
 349                     	xdef	_WWDG_GetCounter
 350                     	xdef	_WWDG_Enable
 351                     	xdef	_WWDG_SetCounter
 352                     	xdef	_WWDG_SetWindowValue
 353                     	xdef	_WWDG_Init
 372                     	end
