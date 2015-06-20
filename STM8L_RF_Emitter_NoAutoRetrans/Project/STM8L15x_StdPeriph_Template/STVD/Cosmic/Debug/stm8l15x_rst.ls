   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 130                     ; 96 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 130                     ; 97 {
 132                     .text:	section	.text,new
 133  0000               _RST_GetFlagStatus:
 137                     ; 99   assert_param(IS_RST_FLAG(RST_Flag));
 139                     ; 103   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 141  0000 c450b1        	and	a,20657
 144  0003 81            	ret	
 179                     ; 118 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 179                     ; 119 {
 180                     .text:	section	.text,new
 181  0000               _RST_ClearFlag:
 185                     ; 121   assert_param(IS_RST_FLAG(RST_Flag));
 187                     ; 123   RST->SR = (uint8_t)RST_Flag;
 189  0000 c750b1        	ld	20657,a
 190                     ; 124 }
 193  0003 81            	ret	
 216                     ; 147 void RST_GPOutputEnable(void)
 216                     ; 148 {
 217                     .text:	section	.text,new
 218  0000               _RST_GPOutputEnable:
 222                     ; 150   RST->CR = RST_CR_MASK;
 224  0000 35d050b0      	mov	20656,#208
 225                     ; 151 }
 228  0004 81            	ret	
 241                     	xdef	_RST_GPOutputEnable
 242                     	xdef	_RST_ClearFlag
 243                     	xdef	_RST_GetFlagStatus
 262                     	end
