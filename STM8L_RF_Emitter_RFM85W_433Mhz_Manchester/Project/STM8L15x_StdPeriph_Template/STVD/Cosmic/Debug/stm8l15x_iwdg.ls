   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  84                     ; 125 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  84                     ; 126 {
  86                     .text:	section	.text,new
  87  0000               _IWDG_WriteAccessCmd:
  91                     ; 128   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  93                     ; 129   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 130 }
  99  0003 81            	ret	
 189                     ; 145 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 189                     ; 146 {
 190                     .text:	section	.text,new
 191  0000               _IWDG_SetPrescaler:
 195                     ; 148   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 197                     ; 149   IWDG->PR = IWDG_Prescaler;
 199  0000 c750e1        	ld	20705,a
 200                     ; 150 }
 203  0003 81            	ret	
 237                     ; 159 void IWDG_SetReload(uint8_t IWDG_Reload)
 237                     ; 160 {
 238                     .text:	section	.text,new
 239  0000               _IWDG_SetReload:
 243                     ; 161   IWDG->RLR = IWDG_Reload;
 245  0000 c750e2        	ld	20706,a
 246                     ; 162 }
 249  0003 81            	ret	
 272                     ; 170 void IWDG_ReloadCounter(void)
 272                     ; 171 {
 273                     .text:	section	.text,new
 274  0000               _IWDG_ReloadCounter:
 278                     ; 172   IWDG->KR = IWDG_KEY_REFRESH;
 280  0000 35aa50e0      	mov	20704,#170
 281                     ; 173 }
 284  0004 81            	ret	
 307                     ; 196 void IWDG_Enable(void)
 307                     ; 197 {
 308                     .text:	section	.text,new
 309  0000               _IWDG_Enable:
 313                     ; 198   IWDG->KR = IWDG_KEY_ENABLE;
 315  0000 35cc50e0      	mov	20704,#204
 316                     ; 199 }
 319  0004 81            	ret	
 332                     	xdef	_IWDG_Enable
 333                     	xdef	_IWDG_ReloadCounter
 334                     	xdef	_IWDG_SetReload
 335                     	xdef	_IWDG_SetPrescaler
 336                     	xdef	_IWDG_WriteAccessCmd
 355                     	end
