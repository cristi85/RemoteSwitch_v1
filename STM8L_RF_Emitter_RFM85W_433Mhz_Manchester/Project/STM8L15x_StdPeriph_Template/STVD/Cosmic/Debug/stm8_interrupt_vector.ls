   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .const:	section	.text
  22  0000               __vectab:
  23  0000 82            	dc.b	130
  25  0001 00            	dc.b	page(__stext)
  26  0002 0000          	dc.w	__stext
  27  0004 82            	dc.b	130
  29  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  30  0006 0000          	dc.w	f_TRAP_IRQHandler
  31  0008 82            	dc.b	130
  33  0009 00            	dc.b	page(f_NonHandledInterrupt)
  34  000a 0000          	dc.w	f_NonHandledInterrupt
  35  000c 82            	dc.b	130
  37  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  38  000e 0000          	dc.w	f_FLASH_IRQHandler
  39  0010 82            	dc.b	130
  41  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
  42  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
  43  0014 82            	dc.b	130
  45  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
  46  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
  47  0018 82            	dc.b	130
  49  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  50  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  51  001c 82            	dc.b	130
  53  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
  54  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
  55  0020 82            	dc.b	130
  57  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
  58  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
  59  0024 82            	dc.b	130
  61  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
  62  0026 0000          	dc.w	f_EXTID_H_IRQHandler
  63  0028 82            	dc.b	130
  65  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  66  002a 0000          	dc.w	f_EXTI0_IRQHandler
  67  002c 82            	dc.b	130
  69  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  70  002e 0000          	dc.w	f_EXTI1_IRQHandler
  71  0030 82            	dc.b	130
  73  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  74  0032 0000          	dc.w	f_EXTI2_IRQHandler
  75  0034 82            	dc.b	130
  77  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  78  0036 0000          	dc.w	f_EXTI3_IRQHandler
  79  0038 82            	dc.b	130
  81  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  82  003a 0000          	dc.w	f_EXTI4_IRQHandler
  83  003c 82            	dc.b	130
  85  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  86  003e 0000          	dc.w	f_EXTI5_IRQHandler
  87  0040 82            	dc.b	130
  89  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  90  0042 0000          	dc.w	f_EXTI6_IRQHandler
  91  0044 82            	dc.b	130
  93  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  94  0046 0000          	dc.w	f_EXTI7_IRQHandler
  95  0048 82            	dc.b	130
  97  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
  98  004a 0000          	dc.w	f_LCD_AES_IRQHandler
  99  004c 82            	dc.b	130
 101  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
 102  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 103  0050 82            	dc.b	130
 105  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
 106  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
 107  0054 82            	dc.b	130
 109  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
 110  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 111  0058 82            	dc.b	130
 113  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
 114  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
 115  005c 82            	dc.b	130
 117  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
 118  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 119  0060 82            	dc.b	130
 121  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
 122  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
 123  0064 82            	dc.b	130
 125  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 126  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 127  0068 82            	dc.b	130
 129  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
 130  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
 131  006c 82            	dc.b	130
 133  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 134  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 135  0070 82            	dc.b	130
 137  0071 00            	dc.b	page(f_SPI1_IRQHandler)
 138  0072 0000          	dc.w	f_SPI1_IRQHandler
 139  0074 82            	dc.b	130
 141  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 142  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 143  0078 82            	dc.b	130
 145  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 146  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 147  007c 82            	dc.b	130
 149  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
 150  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
 210                     	xdef	__vectab
 211                     	xref	f_I2C1_SPI2_IRQHandler
 212                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 213                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 214                     	xref	f_SPI1_IRQHandler
 215                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 216                     	xref	f_TIM1_CC_IRQHandler
 217                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 218                     	xref	f_TIM3_CC_USART3_RX_IRQHandler
 219                     	xref	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 220                     	xref	f_TIM2_CC_USART2_RX_IRQHandler
 221                     	xref	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 222                     	xref	f_ADC1_COMP_IRQHandler
 223                     	xref	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 224                     	xref	f_LCD_AES_IRQHandler
 225                     	xref	f_EXTI7_IRQHandler
 226                     	xref	f_EXTI6_IRQHandler
 227                     	xref	f_EXTI5_IRQHandler
 228                     	xref	f_EXTI4_IRQHandler
 229                     	xref	f_EXTI3_IRQHandler
 230                     	xref	f_EXTI2_IRQHandler
 231                     	xref	f_EXTI1_IRQHandler
 232                     	xref	f_EXTI0_IRQHandler
 233                     	xref	f_EXTID_H_IRQHandler
 234                     	xref	f_EXTIB_G_IRQHandler
 235                     	xref	f_EXTIE_F_PVD_IRQHandler
 236                     	xref	f_RTC_CSSLSE_IRQHandler
 237                     	xref	f_DMA1_CHANNEL2_3_IRQHandler
 238                     	xref	f_DMA1_CHANNEL0_1_IRQHandler
 239                     	xref	f_FLASH_IRQHandler
 240                     	xref	f_TRAP_IRQHandler
 241                     	xref	f_NonHandledInterrupt
 242                     	xref	__stext
 261                     	end
