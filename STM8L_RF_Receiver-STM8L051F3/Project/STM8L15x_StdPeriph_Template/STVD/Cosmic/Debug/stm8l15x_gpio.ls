   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
 115                     ; 93 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 94 {
 117                     .text:	section	.text,new
 118  0000               _GPIO_DeInit:
 122                     ; 95   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 124  0000 6f04          	clr	(4,x)
 125                     ; 96   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 127  0002 7f            	clr	(x)
 128                     ; 97   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 130  0003 6f02          	clr	(2,x)
 131                     ; 98   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 133  0005 6f03          	clr	(3,x)
 134                     ; 99 }
 137  0007 81            	ret	
 293                     ; 130 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 293                     ; 131 {
 294                     .text:	section	.text,new
 295  0000               _GPIO_Init:
 297  0000 89            	pushw	x
 298       00000000      OFST:	set	0
 301                     ; 136   assert_param(IS_GPIO_MODE(GPIO_Mode));
 303                     ; 137   assert_param(IS_GPIO_PIN(GPIO_Pin));
 305                     ; 140   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 307  0001 7b05          	ld	a,(OFST+5,sp)
 308  0003 43            	cpl	a
 309  0004 e404          	and	a,(4,x)
 310  0006 e704          	ld	(4,x),a
 311                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 313  0008 7b06          	ld	a,(OFST+6,sp)
 314  000a 2a18          	jrpl	L541
 315                     ; 148     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 317  000c a510          	bcp	a,#16
 318  000e 2705          	jreq	L741
 319                     ; 150       GPIOx->ODR |= GPIO_Pin;
 321  0010 f6            	ld	a,(x)
 322  0011 1a05          	or	a,(OFST+5,sp)
 324  0013 2006          	jra	L151
 325  0015               L741:
 326                     ; 153       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 328  0015 1e01          	ldw	x,(OFST+1,sp)
 329  0017 7b05          	ld	a,(OFST+5,sp)
 330  0019 43            	cpl	a
 331  001a f4            	and	a,(x)
 332  001b               L151:
 333  001b f7            	ld	(x),a
 334                     ; 156     GPIOx->DDR |= GPIO_Pin;
 336  001c 1e01          	ldw	x,(OFST+1,sp)
 337  001e e602          	ld	a,(2,x)
 338  0020 1a05          	or	a,(OFST+5,sp)
 340  0022 2007          	jra	L351
 341  0024               L541:
 342                     ; 160     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 344  0024 1e01          	ldw	x,(OFST+1,sp)
 345  0026 7b05          	ld	a,(OFST+5,sp)
 346  0028 43            	cpl	a
 347  0029 e402          	and	a,(2,x)
 348  002b               L351:
 349  002b e702          	ld	(2,x),a
 350                     ; 167   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 352  002d 7b06          	ld	a,(OFST+6,sp)
 353  002f a540          	bcp	a,#64
 354  0031 2706          	jreq	L551
 355                     ; 169     GPIOx->CR1 |= GPIO_Pin;
 357  0033 e603          	ld	a,(3,x)
 358  0035 1a05          	or	a,(OFST+5,sp)
 360  0037 2005          	jra	L751
 361  0039               L551:
 362                     ; 172     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 364  0039 7b05          	ld	a,(OFST+5,sp)
 365  003b 43            	cpl	a
 366  003c e403          	and	a,(3,x)
 367  003e               L751:
 368  003e e703          	ld	(3,x),a
 369                     ; 179   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 371  0040 7b06          	ld	a,(OFST+6,sp)
 372  0042 a520          	bcp	a,#32
 373  0044 2706          	jreq	L161
 374                     ; 181     GPIOx->CR2 |= GPIO_Pin;
 376  0046 e604          	ld	a,(4,x)
 377  0048 1a05          	or	a,(OFST+5,sp)
 379  004a 2005          	jra	L361
 380  004c               L161:
 381                     ; 184     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 383  004c 7b05          	ld	a,(OFST+5,sp)
 384  004e 43            	cpl	a
 385  004f e404          	and	a,(4,x)
 386  0051               L361:
 387  0051 e704          	ld	(4,x),a
 388                     ; 187 }
 391  0053 85            	popw	x
 392  0054 81            	ret	
 469                     ; 206 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 469                     ; 207 {
 470                     .text:	section	.text,new
 471  0000               _GPIO_ExternalPullUpConfig:
 473  0000 89            	pushw	x
 474       00000000      OFST:	set	0
 477                     ; 209   assert_param(IS_GPIO_PIN(GPIO_Pin));
 479                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 481                     ; 212   if (NewState != DISABLE) /* External Pull-Up Set*/
 483  0001 7b06          	ld	a,(OFST+6,sp)
 484  0003 2706          	jreq	L522
 485                     ; 214     GPIOx->CR1 |= GPIO_Pin;
 487  0005 e603          	ld	a,(3,x)
 488  0007 1a05          	or	a,(OFST+5,sp)
 490  0009 2007          	jra	L722
 491  000b               L522:
 492                     ; 217     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 494  000b 1e01          	ldw	x,(OFST+1,sp)
 495  000d 7b05          	ld	a,(OFST+5,sp)
 496  000f 43            	cpl	a
 497  0010 e403          	and	a,(3,x)
 498  0012               L722:
 499  0012 e703          	ld	(3,x),a
 500                     ; 219 }
 503  0014 85            	popw	x
 504  0015 81            	ret	
 550                     ; 245 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 550                     ; 246 {
 551                     .text:	section	.text,new
 552  0000               _GPIO_Write:
 554  0000 89            	pushw	x
 555       00000000      OFST:	set	0
 558                     ; 247   GPIOx->ODR = GPIO_PortVal;
 560  0001 1e01          	ldw	x,(OFST+1,sp)
 561  0003 7b05          	ld	a,(OFST+5,sp)
 562  0005 f7            	ld	(x),a
 563                     ; 248 }
 566  0006 85            	popw	x
 567  0007 81            	ret	
 727                     ; 267 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 727                     ; 268 {
 728                     .text:	section	.text,new
 729  0000               _GPIO_WriteBit:
 731  0000 89            	pushw	x
 732       00000000      OFST:	set	0
 735                     ; 270   assert_param(IS_GPIO_PIN(GPIO_Pin));
 737                     ; 271   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 739                     ; 273   if (GPIO_BitVal != RESET)
 741  0001 7b06          	ld	a,(OFST+6,sp)
 742  0003 2705          	jreq	L743
 743                     ; 275     GPIOx->ODR |= GPIO_Pin;
 745  0005 f6            	ld	a,(x)
 746  0006 1a05          	or	a,(OFST+5,sp)
 748  0008 2006          	jra	L153
 749  000a               L743:
 750                     ; 280     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 752  000a 1e01          	ldw	x,(OFST+1,sp)
 753  000c 7b05          	ld	a,(OFST+5,sp)
 754  000e 43            	cpl	a
 755  000f f4            	and	a,(x)
 756  0010               L153:
 757  0010 f7            	ld	(x),a
 758                     ; 282 }
 761  0011 85            	popw	x
 762  0012 81            	ret	
 808                     ; 300 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 808                     ; 301 {
 809                     .text:	section	.text,new
 810  0000               _GPIO_SetBits:
 812  0000 89            	pushw	x
 813       00000000      OFST:	set	0
 816                     ; 302   GPIOx->ODR |= GPIO_Pin;
 818  0001 f6            	ld	a,(x)
 819  0002 1a05          	or	a,(OFST+5,sp)
 820  0004 f7            	ld	(x),a
 821                     ; 303 }
 824  0005 85            	popw	x
 825  0006 81            	ret	
 871                     ; 321 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 871                     ; 322 {
 872                     .text:	section	.text,new
 873  0000               _GPIO_ResetBits:
 875  0000 89            	pushw	x
 876       00000000      OFST:	set	0
 879                     ; 323   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 881  0001 7b05          	ld	a,(OFST+5,sp)
 882  0003 43            	cpl	a
 883  0004 f4            	and	a,(x)
 884  0005 f7            	ld	(x),a
 885                     ; 324 }
 888  0006 85            	popw	x
 889  0007 81            	ret	
 935                     ; 333 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 935                     ; 334 {
 936                     .text:	section	.text,new
 937  0000               _GPIO_ToggleBits:
 939  0000 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 335   GPIOx->ODR ^= GPIO_Pin;
 945  0001 f6            	ld	a,(x)
 946  0002 1805          	xor	a,(OFST+5,sp)
 947  0004 f7            	ld	(x),a
 948                     ; 336 }
 951  0005 85            	popw	x
 952  0006 81            	ret	
 989                     ; 344 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 989                     ; 345 {
 990                     .text:	section	.text,new
 991  0000               _GPIO_ReadInputData:
 995                     ; 346   return ((uint8_t)GPIOx->IDR);
 997  0000 e601          	ld	a,(1,x)
1000  0002 81            	ret	
1038                     ; 355 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1038                     ; 356 {
1039                     .text:	section	.text,new
1040  0000               _GPIO_ReadOutputData:
1044                     ; 357   return ((uint8_t)GPIOx->ODR);
1046  0000 f6            	ld	a,(x)
1049  0001 81            	ret	
1098                     ; 375 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1098                     ; 376 {
1099                     .text:	section	.text,new
1100  0000               _GPIO_ReadInputDataBit:
1102  0000 89            	pushw	x
1103       00000000      OFST:	set	0
1106                     ; 377   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1108  0001 e601          	ld	a,(1,x)
1109  0003 1405          	and	a,(OFST+5,sp)
1112  0005 85            	popw	x
1113  0006 81            	ret	
1162                     ; 386 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1162                     ; 387 {
1163                     .text:	section	.text,new
1164  0000               _GPIO_ReadOutputDataBit:
1166  0000 89            	pushw	x
1167       00000000      OFST:	set	0
1170                     ; 388   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1172  0001 f6            	ld	a,(x)
1173  0002 1405          	and	a,(OFST+5,sp)
1176  0004 85            	popw	x
1177  0005 81            	ret	
1190                     	xdef	_GPIO_ReadOutputDataBit
1191                     	xdef	_GPIO_ReadInputDataBit
1192                     	xdef	_GPIO_ReadOutputData
1193                     	xdef	_GPIO_ReadInputData
1194                     	xdef	_GPIO_ToggleBits
1195                     	xdef	_GPIO_ResetBits
1196                     	xdef	_GPIO_SetBits
1197                     	xdef	_GPIO_WriteBit
1198                     	xdef	_GPIO_Write
1199                     	xdef	_GPIO_ExternalPullUpConfig
1200                     	xdef	_GPIO_Init
1201                     	xdef	_GPIO_DeInit
1220                     	end
