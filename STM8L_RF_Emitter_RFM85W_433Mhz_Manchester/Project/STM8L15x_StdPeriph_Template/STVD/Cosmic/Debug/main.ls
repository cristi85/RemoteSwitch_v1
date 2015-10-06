   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  61                     ; 49 void main(void)
  61                     ; 50 {
  63                     .text:	section	.text,new
  64  0000               _main:
  68                     ; 52   disableInterrupts();
  71  0000 9b            	sim	
  73                     ; 53   Config();
  76  0001 cd0000        	call	_Config
  78                     ; 54   Errors_Init();
  80  0004 cd0000        	call	_Errors_Init
  82                     ; 55   enableInterrupts();
  85  0007               LC002:
  86  0007 9a            	rim	
  88                     ; 56   Goto_HALT();
  92  0008               L33:
  94  0008 cd0000        	call	L3_Goto_HALT
  95                     ; 60     if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2))
  97  000b b600          	ld	a,_btn_pressed
  98  000d a101          	cp	a,#1
  99  000f 2710          	jreq	L34
 101  0011 a102          	cp	a,#2
 102  0013 270c          	jreq	L34
 103                     ; 62       DELAY_STOP;
 105  0015 721152e0      	bres	21216,#0
 108  0019 ae0200        	ldw	x,#512
 109  001c cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 63       goto sleep;
 114  001f 20e7          	jra	L33
 115  0021               L34:
 116                     ; 66     while(!DELAY_EXPIRED);           // wait for power-up delay to expire (~20ms)
 118  0021 720152e5fb    	btjf	21221,#0,L34
 119                     ; 67     DELAY_STOP;
 121  0026 721152e0      	bres	21216,#0
 124  002a ae0200        	ldw	x,#512
 125  002d cd0000        	call	_CLK_PeripheralClockConfig
 127                     ; 69     disableInterrupts();
 131  0030 9b            	sim	
 133                     ; 70     if(btn_pressed == BUTTON1)
 136  0031 b600          	ld	a,_btn_pressed
 137  0033 4a            	dec	a
 138  0034 2604          	jrne	L74
 139                     ; 72       RF_Send(RFCMD_HEATING_ON);
 141  0036 a60f          	ld	a,#15
 144  0038 2008          	jp	LC001
 145  003a               L74:
 146                     ; 74     else if(btn_pressed = BUTTON2)
 148  003a a602          	ld	a,#2
 149  003c b700          	ld	_btn_pressed,a
 150  003e 27c7          	jreq	LC002
 151                     ; 76       RF_Send(RFCMD_HEATING_OFF);
 153  0040 a6f0          	ld	a,#240
 154  0042               LC001:
 155  0042 cd0000        	call	_RF_Send
 157                     ; 78     enableInterrupts();
 161                     ; 80     sleep:
 161                     ; 81     Goto_HALT();
 164  0045 20c0          	jp	LC002
 192                     ; 85 static void Goto_HALT()
 192                     ; 86 {
 193                     .text:	section	.text,new
 194  0000               L3_Goto_HALT:
 198                     ; 88   LED_OFF;
 200  0000 721b500a      	bres	20490,#5
 203  0004 721d500a      	bres	20490,#6
 204                     ; 89   RFM_OFF;
 207  0008 72165005      	bset	20485,#3
 208                     ; 90   btn_pressed = 0;
 210  000c 3f00          	clr	_btn_pressed
 211                     ; 91   CLK->PCKENR1 = 0x00; //Stop all peripheral clocks
 213  000e 725f50c3      	clr	20675
 214                     ; 92   CLK->PCKENR2 = 0x00;
 216  0012 725f50c4      	clr	20676
 217                     ; 93   CLK->PCKENR3 = 0x00;
 219  0016 725f50d0      	clr	20688
 220                     ; 94   PWR_FastWakeUpCmd(ENABLE);     //Enables or disables the Fast WakeUp from Ultra Low Power mode, system does not wait for VrefINT to stabilize (around 3ms)
 222  001a a601          	ld	a,#1
 223  001c cd0000        	call	_PWR_FastWakeUpCmd
 225                     ; 95   PWR_UltraLowPowerCmd(ENABLE);  //Enables or disables the Ultra Low Power mode, disable VrefINT during Halt or Active-Halt modes
 227  001f a601          	ld	a,#1
 228  0021 cd0000        	call	_PWR_UltraLowPowerCmd
 230                     ; 96   CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE);  //Configures clock during halt and active halt modes
 232  0024 ae2001        	ldw	x,#8193
 233  0027 cd0000        	call	_CLK_HaltConfig
 235                     ; 98   CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);  //When it is set, the main voltage regulator is powered off as soon as the MCU enters Active-halt mode, so the wakeup time is longer
 237  002a ae1001        	ldw	x,#4097
 238  002d cd0000        	call	_CLK_HaltConfig
 240                     ; 100   halt(); /* go to HALT mode */
 243  0030 8e            	halt	
 245                     ; 101 }
 249  0031 81            	ret	
 262                     	xdef	_main
 263                     	xref	_RF_Send
 264                     	xref	_Errors_Init
 265                     	xref	_Config
 266                     	xref.b	_btn_pressed
 267                     	xref	_PWR_UltraLowPowerCmd
 268                     	xref	_PWR_FastWakeUpCmd
 269                     	xref	_CLK_HaltConfig
 270                     	xref	_CLK_PeripheralClockConfig
 289                     	end
