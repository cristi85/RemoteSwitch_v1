   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  52                     ; 23 void nrf24_init() 
  52                     ; 24 {
  54                     .text:	section	.text,new
  55  0000               _nrf24_init:
  59                     ; 25   nrf24_setupPins();
  61  0000 cd0000        	call	_nrf24_setupPins
  63                     ; 26   nrf24_ce_digitalWrite(LOW);
  65  0003 4f            	clr	a
  66  0004 cd0000        	call	_nrf24_ce_digitalWrite
  68                     ; 27   nrf24_csn_digitalWrite(HIGH);    
  70  0007 a601          	ld	a,#1
  72                     ; 28 }
  75  0009 cc0000        	jp	_nrf24_csn_digitalWrite
 165                     ; 31 void nrf24_config_sb(uint8_t channel, uint8_t pay_length, u8* rxadr, u8* txadr)
 165                     ; 32 {
 166                     .text:	section	.text,new
 167  0000               _nrf24_config_sb:
 169  0000 89            	pushw	x
 170  0001 89            	pushw	x
 171       00000002      OFST:	set	2
 174                     ; 34   payload_len = pay_length;
 176  0002 9f            	ld	a,xl
 177  0003 b700          	ld	_payload_len,a
 178                     ; 37   send = 0;
 180  0005 0f02          	clr	(OFST+0,sp)
 181                     ; 38   nrf24_configRegister(EN_RXADDR, send);
 183  0007 ae0200        	ldw	x,#512
 184  000a cd0000        	call	_nrf24_configRegister
 186                     ; 39   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 188  000d 4b01          	push	#1
 189  000f 96            	ldw	x,sp
 190  0010 1c0002        	addw	x,#OFST+0
 191  0013 89            	pushw	x
 192  0014 a602          	ld	a,#2
 193  0016 cd0000        	call	_nrf24_readRegister
 195  0019 5b03          	addw	sp,#3
 196                     ; 40   if(rcv != send)
 198  001b 7b01          	ld	a,(OFST-1,sp)
 199  001d 1102          	cp	a,(OFST+0,sp)
 200  001f 2704          	jreq	L36
 201                     ; 42     Errors_SetError(ERROR_NRF24_INIT);
 203  0021 4f            	clr	a
 204  0022 cd0000        	call	_Errors_SetError
 206  0025               L36:
 207                     ; 46   send = (1<<ERX_P0);
 209  0025 a601          	ld	a,#1
 210  0027 6b02          	ld	(OFST+0,sp),a
 211                     ; 47   nrf24_configRegister(EN_RXADDR, send);
 213  0029 ae0201        	ldw	x,#513
 214  002c cd0000        	call	_nrf24_configRegister
 216                     ; 48   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 218  002f 4b01          	push	#1
 219  0031 96            	ldw	x,sp
 220  0032 1c0002        	addw	x,#OFST+0
 221  0035 89            	pushw	x
 222  0036 a602          	ld	a,#2
 223  0038 cd0000        	call	_nrf24_readRegister
 225  003b 5b03          	addw	sp,#3
 226                     ; 49   if(rcv != send)
 228  003d 7b01          	ld	a,(OFST-1,sp)
 229  003f 1102          	cp	a,(OFST+0,sp)
 230  0041 2704          	jreq	L56
 231                     ; 51     Errors_SetError(ERROR_NRF24_INIT);
 233  0043 4f            	clr	a
 234  0044 cd0000        	call	_Errors_SetError
 236  0047               L56:
 237                     ; 54   send = 0;
 239  0047 0f02          	clr	(OFST+0,sp)
 240                     ; 55   nrf24_configRegister(EN_AA, send);
 242  0049 ae0100        	ldw	x,#256
 243  004c cd0000        	call	_nrf24_configRegister
 245                     ; 56   nrf24_readRegister(EN_AA, &rcv, 1);
 247  004f 4b01          	push	#1
 248  0051 96            	ldw	x,sp
 249  0052 1c0002        	addw	x,#OFST+0
 250  0055 89            	pushw	x
 251  0056 a601          	ld	a,#1
 252  0058 cd0000        	call	_nrf24_readRegister
 254  005b 5b03          	addw	sp,#3
 255                     ; 57   if(rcv != send)
 257  005d 7b01          	ld	a,(OFST-1,sp)
 258  005f 1102          	cp	a,(OFST+0,sp)
 259  0061 2704          	jreq	L76
 260                     ; 59     Errors_SetError(ERROR_NRF24_INIT);
 262  0063 4f            	clr	a
 263  0064 cd0000        	call	_Errors_SetError
 265  0067               L76:
 266                     ; 63   send = nrf24_CONFIG;
 268  0067 a63c          	ld	a,#60
 269  0069 6b02          	ld	(OFST+0,sp),a
 270                     ; 64   nrf24_configRegister(CONFIG, send);
 272  006b ae003c        	ldw	x,#60
 273  006e cd0000        	call	_nrf24_configRegister
 275                     ; 65   nrf24_readRegister(CONFIG, &rcv, 1);
 277  0071 4b01          	push	#1
 278  0073 96            	ldw	x,sp
 279  0074 1c0002        	addw	x,#OFST+0
 280  0077 89            	pushw	x
 281  0078 4f            	clr	a
 282  0079 cd0000        	call	_nrf24_readRegister
 284  007c 5b03          	addw	sp,#3
 285                     ; 66   if(rcv != send)
 287  007e 7b01          	ld	a,(OFST-1,sp)
 288  0080 1102          	cp	a,(OFST+0,sp)
 289  0082 2704          	jreq	L17
 290                     ; 68     Errors_SetError(ERROR_NRF24_INIT);
 292  0084 4f            	clr	a
 293  0085 cd0000        	call	_Errors_SetError
 295  0088               L17:
 296                     ; 72   send = (0x02<<ARD)|(0x00<<ARC);
 298  0088 a620          	ld	a,#32
 299  008a 6b02          	ld	(OFST+0,sp),a
 300                     ; 73   nrf24_configRegister(SETUP_RETR, send);
 302  008c ae0420        	ldw	x,#1056
 303  008f cd0000        	call	_nrf24_configRegister
 305                     ; 74   nrf24_readRegister(SETUP_RETR, &rcv, 1);
 307  0092 4b01          	push	#1
 308  0094 96            	ldw	x,sp
 309  0095 1c0002        	addw	x,#OFST+0
 310  0098 89            	pushw	x
 311  0099 a604          	ld	a,#4
 312  009b cd0000        	call	_nrf24_readRegister
 314  009e 5b03          	addw	sp,#3
 315                     ; 75   if(rcv != send)
 317  00a0 7b01          	ld	a,(OFST-1,sp)
 318  00a2 1102          	cp	a,(OFST+0,sp)
 319  00a4 2704          	jreq	L37
 320                     ; 77     Errors_SetError(ERROR_NRF24_INIT);
 322  00a6 4f            	clr	a
 323  00a7 cd0000        	call	_Errors_SetError
 325  00aa               L37:
 326                     ; 81   send = nrf24_ADDR_LEN - 2;
 328  00aa a603          	ld	a,#3
 329  00ac 6b02          	ld	(OFST+0,sp),a
 330                     ; 82   nrf24_configRegister(SETUP_AW, send);
 332  00ae ae0303        	ldw	x,#771
 333  00b1 cd0000        	call	_nrf24_configRegister
 335                     ; 83   nrf24_readRegister(SETUP_AW, &rcv, 1);
 337  00b4 4b01          	push	#1
 338  00b6 96            	ldw	x,sp
 339  00b7 1c0002        	addw	x,#OFST+0
 340  00ba 89            	pushw	x
 341  00bb a603          	ld	a,#3
 342  00bd cd0000        	call	_nrf24_readRegister
 344  00c0 5b03          	addw	sp,#3
 345                     ; 84   if(rcv != send)
 347  00c2 7b01          	ld	a,(OFST-1,sp)
 348  00c4 1102          	cp	a,(OFST+0,sp)
 349  00c6 2704          	jreq	L57
 350                     ; 86     Errors_SetError(ERROR_NRF24_INIT);
 352  00c8 4f            	clr	a
 353  00c9 cd0000        	call	_Errors_SetError
 355  00cc               L57:
 356                     ; 90   nrf24_writeRegister(TX_ADDR, txadr, nrf24_ADDR_LEN);
 358  00cc 4b05          	push	#5
 359  00ce 1e0a          	ldw	x,(OFST+8,sp)
 360  00d0 89            	pushw	x
 361  00d1 a610          	ld	a,#16
 362  00d3 cd0000        	call	_nrf24_writeRegister
 364  00d6 5b03          	addw	sp,#3
 365                     ; 93   nrf24_writeRegister(RX_ADDR_P0, rxadr, nrf24_ADDR_LEN);
 367  00d8 4b05          	push	#5
 368  00da 1e08          	ldw	x,(OFST+6,sp)
 369  00dc 89            	pushw	x
 370  00dd a60a          	ld	a,#10
 371  00df cd0000        	call	_nrf24_writeRegister
 373  00e2 5b03          	addw	sp,#3
 374                     ; 96   nrf24_RXmode();
 376  00e4 cd0000        	call	_nrf24_RXmode
 378                     ; 100   nrf24_configRegister(RX_PW_P0, payload_len); 
 380  00e7 b600          	ld	a,_payload_len
 381  00e9 97            	ld	xl,a
 382  00ea a611          	ld	a,#17
 383  00ec 95            	ld	xh,a
 384  00ed cd0000        	call	_nrf24_configRegister
 386                     ; 101   nrf24_readRegister(RX_PW_P0, &rcv, 1);
 388  00f0 4b01          	push	#1
 389  00f2 96            	ldw	x,sp
 390  00f3 1c0002        	addw	x,#OFST+0
 391  00f6 89            	pushw	x
 392  00f7 a611          	ld	a,#17
 393  00f9 cd0000        	call	_nrf24_readRegister
 395  00fc 5b03          	addw	sp,#3
 396                     ; 102   if(rcv != payload_len)
 398  00fe 7b01          	ld	a,(OFST-1,sp)
 399  0100 b100          	cp	a,_payload_len
 400  0102 2704          	jreq	L77
 401                     ; 104     Errors_SetError(ERROR_NRF24_INIT);
 403  0104 4f            	clr	a
 404  0105 cd0000        	call	_Errors_SetError
 406  0108               L77:
 407                     ; 108   nrf24_SetRFChannel(channel);
 409  0108 7b03          	ld	a,(OFST+1,sp)
 410  010a cd0000        	call	_nrf24_SetRFChannel
 412                     ; 111   nrf24_powerUP();
 414  010d cd0000        	call	_nrf24_powerUP
 416                     ; 113   nrf24_ce_digitalWrite(HIGH);   // Set Chip Enable (CE) pin high to enable reciever
 418  0110 a601          	ld	a,#1
 419  0112 cd0000        	call	_nrf24_ce_digitalWrite
 421                     ; 114 }
 424  0115 5b04          	addw	sp,#4
 425  0117 81            	ret	
 492                     ; 117 void nrf24_config_esb(uint8_t channel, uint8_t pay_length)
 492                     ; 118 {
 493                     .text:	section	.text,new
 494  0000               _nrf24_config_esb:
 496  0000 89            	pushw	x
 497  0001 89            	pushw	x
 498       00000002      OFST:	set	2
 501                     ; 121   payload_len = pay_length;
 503  0002 9f            	ld	a,xl
 504  0003 b700          	ld	_payload_len,a
 505                     ; 123   Errors_ResetError(ERROR_NRF24_INIT);
 507  0005 4f            	clr	a
 508  0006 cd0000        	call	_Errors_ResetError
 510                     ; 126   nrf24_configRegister(RF_CH,channel);
 512  0009 7b03          	ld	a,(OFST+1,sp)
 513  000b 97            	ld	xl,a
 514  000c a605          	ld	a,#5
 515  000e 95            	ld	xh,a
 516  000f cd0000        	call	_nrf24_configRegister
 518                     ; 127   nrf24_readRegister(RF_CH, &rcv, 1);
 520  0012 4b01          	push	#1
 521  0014 96            	ldw	x,sp
 522  0015 1c0003        	addw	x,#OFST+1
 523  0018 89            	pushw	x
 524  0019 a605          	ld	a,#5
 525  001b cd0000        	call	_nrf24_readRegister
 527  001e 5b03          	addw	sp,#3
 528                     ; 128   if(rcv != channel)
 530  0020 7b02          	ld	a,(OFST+0,sp)
 531  0022 1103          	cp	a,(OFST+1,sp)
 532  0024 2704          	jreq	L331
 533                     ; 130     Errors_SetError(ERROR_NRF24_INIT);
 535  0026 4f            	clr	a
 536  0027 cd0000        	call	_Errors_SetError
 538  002a               L331:
 539                     ; 134   nrf24_configRegister(RX_PW_P0, 0x00); // Auto-ACK pipe ...
 541  002a ae1100        	ldw	x,#4352
 542  002d cd0000        	call	_nrf24_configRegister
 544                     ; 135   nrf24_readRegister(RX_PW_P0, &rcv, 1);
 546  0030 4b01          	push	#1
 547  0032 96            	ldw	x,sp
 548  0033 1c0003        	addw	x,#OFST+1
 549  0036 89            	pushw	x
 550  0037 a611          	ld	a,#17
 551  0039 cd0000        	call	_nrf24_readRegister
 553  003c 5b03          	addw	sp,#3
 554                     ; 136   if(rcv != 0x00)
 556  003e 7b02          	ld	a,(OFST+0,sp)
 557  0040 2704          	jreq	L531
 558                     ; 138     Errors_SetError(ERROR_NRF24_INIT);
 560  0042 4f            	clr	a
 561  0043 cd0000        	call	_Errors_SetError
 563  0046               L531:
 564                     ; 141   nrf24_configRegister(RX_PW_P1, payload_len); // Data payload pipe
 566  0046 b600          	ld	a,_payload_len
 567  0048 97            	ld	xl,a
 568  0049 a612          	ld	a,#18
 569  004b 95            	ld	xh,a
 570  004c cd0000        	call	_nrf24_configRegister
 572                     ; 142   nrf24_readRegister(RX_PW_P1, &rcv, 1);
 574  004f 4b01          	push	#1
 575  0051 96            	ldw	x,sp
 576  0052 1c0003        	addw	x,#OFST+1
 577  0055 89            	pushw	x
 578  0056 a612          	ld	a,#18
 579  0058 cd0000        	call	_nrf24_readRegister
 581  005b 5b03          	addw	sp,#3
 582                     ; 143   if(rcv != payload_len)
 584  005d 7b02          	ld	a,(OFST+0,sp)
 585  005f b100          	cp	a,_payload_len
 586  0061 2704          	jreq	L731
 587                     ; 145     Errors_SetError(ERROR_NRF24_INIT);
 589  0063 4f            	clr	a
 590  0064 cd0000        	call	_Errors_SetError
 592  0067               L731:
 593                     ; 148   nrf24_configRegister(RX_PW_P2, 0x00); // Pipe not used 
 595  0067 ae1300        	ldw	x,#4864
 596  006a cd0000        	call	_nrf24_configRegister
 598                     ; 149   nrf24_readRegister(RX_PW_P2, &rcv, 1);
 600  006d 4b01          	push	#1
 601  006f 96            	ldw	x,sp
 602  0070 1c0003        	addw	x,#OFST+1
 603  0073 89            	pushw	x
 604  0074 a613          	ld	a,#19
 605  0076 cd0000        	call	_nrf24_readRegister
 607  0079 5b03          	addw	sp,#3
 608                     ; 150   if(rcv != 0x00)
 610  007b 7b02          	ld	a,(OFST+0,sp)
 611  007d 2704          	jreq	L141
 612                     ; 152     Errors_SetError(ERROR_NRF24_INIT);
 614  007f 4f            	clr	a
 615  0080 cd0000        	call	_Errors_SetError
 617  0083               L141:
 618                     ; 155   nrf24_configRegister(RX_PW_P3, 0x00); // Pipe not used 
 620  0083 ae1400        	ldw	x,#5120
 621  0086 cd0000        	call	_nrf24_configRegister
 623                     ; 156   nrf24_readRegister(RX_PW_P3, &rcv, 1);
 625  0089 4b01          	push	#1
 626  008b 96            	ldw	x,sp
 627  008c 1c0003        	addw	x,#OFST+1
 628  008f 89            	pushw	x
 629  0090 a614          	ld	a,#20
 630  0092 cd0000        	call	_nrf24_readRegister
 632  0095 5b03          	addw	sp,#3
 633                     ; 157   if(rcv != 0x00)
 635  0097 7b02          	ld	a,(OFST+0,sp)
 636  0099 2704          	jreq	L341
 637                     ; 159     Errors_SetError(ERROR_NRF24_INIT);
 639  009b 4f            	clr	a
 640  009c cd0000        	call	_Errors_SetError
 642  009f               L341:
 643                     ; 162   nrf24_configRegister(RX_PW_P4, 0x00); // Pipe not used 
 645  009f ae1500        	ldw	x,#5376
 646  00a2 cd0000        	call	_nrf24_configRegister
 648                     ; 163   nrf24_readRegister(RX_PW_P4, &rcv, 1);
 650  00a5 4b01          	push	#1
 651  00a7 96            	ldw	x,sp
 652  00a8 1c0003        	addw	x,#OFST+1
 653  00ab 89            	pushw	x
 654  00ac a615          	ld	a,#21
 655  00ae cd0000        	call	_nrf24_readRegister
 657  00b1 5b03          	addw	sp,#3
 658                     ; 164   if(rcv != 0x00)
 660  00b3 7b02          	ld	a,(OFST+0,sp)
 661  00b5 2704          	jreq	L541
 662                     ; 166     Errors_SetError(ERROR_NRF24_INIT);
 664  00b7 4f            	clr	a
 665  00b8 cd0000        	call	_Errors_SetError
 667  00bb               L541:
 668                     ; 169   nrf24_configRegister(RX_PW_P5, 0x00); // Pipe not used 
 670  00bb ae1600        	ldw	x,#5632
 671  00be cd0000        	call	_nrf24_configRegister
 673                     ; 170   nrf24_readRegister(RX_PW_P5, &rcv, 1);
 675  00c1 4b01          	push	#1
 676  00c3 96            	ldw	x,sp
 677  00c4 1c0003        	addw	x,#OFST+1
 678  00c7 89            	pushw	x
 679  00c8 a616          	ld	a,#22
 680  00ca cd0000        	call	_nrf24_readRegister
 682  00cd 5b03          	addw	sp,#3
 683                     ; 171   if(rcv != 0x00)
 685  00cf 7b02          	ld	a,(OFST+0,sp)
 686  00d1 2704          	jreq	L741
 687                     ; 173     Errors_SetError(ERROR_NRF24_INIT);
 689  00d3 4f            	clr	a
 690  00d4 cd0000        	call	_Errors_SetError
 692  00d7               L741:
 693                     ; 178   send = (1<<RF_DR_LOW)|((3)<<RF_PWR);
 695  00d7 a626          	ld	a,#38
 696  00d9 6b01          	ld	(OFST-1,sp),a
 697                     ; 179   nrf24_configRegister(RF_SETUP, send);
 699  00db ae0626        	ldw	x,#1574
 700  00de cd0000        	call	_nrf24_configRegister
 702                     ; 180   nrf24_readRegister(RF_SETUP, &rcv, 1);
 704  00e1 4b01          	push	#1
 705  00e3 96            	ldw	x,sp
 706  00e4 1c0003        	addw	x,#OFST+1
 707  00e7 89            	pushw	x
 708  00e8 a606          	ld	a,#6
 709  00ea cd0000        	call	_nrf24_readRegister
 711  00ed 5b03          	addw	sp,#3
 712                     ; 181   if(rcv != send)
 714  00ef 7b02          	ld	a,(OFST+0,sp)
 715  00f1 1101          	cp	a,(OFST-1,sp)
 716  00f3 2704          	jreq	L151
 717                     ; 183     Errors_SetError(ERROR_NRF24_INIT);
 719  00f5 4f            	clr	a
 720  00f6 cd0000        	call	_Errors_SetError
 722  00f9               L151:
 723                     ; 187   send = nrf24_CONFIG;
 725  00f9 a63c          	ld	a,#60
 726  00fb 6b01          	ld	(OFST-1,sp),a
 727                     ; 188   nrf24_configRegister(CONFIG, send);
 729  00fd ae003c        	ldw	x,#60
 730  0100 cd0000        	call	_nrf24_configRegister
 732                     ; 189   nrf24_readRegister(CONFIG, &rcv, 1);
 734  0103 4b01          	push	#1
 735  0105 96            	ldw	x,sp
 736  0106 1c0003        	addw	x,#OFST+1
 737  0109 89            	pushw	x
 738  010a 4f            	clr	a
 739  010b cd0000        	call	_nrf24_readRegister
 741  010e 5b03          	addw	sp,#3
 742                     ; 190   if(rcv != send)
 744  0110 7b02          	ld	a,(OFST+0,sp)
 745  0112 1101          	cp	a,(OFST-1,sp)
 746  0114 2704          	jreq	L351
 747                     ; 192     Errors_SetError(ERROR_NRF24_INIT);
 749  0116 4f            	clr	a
 750  0117 cd0000        	call	_Errors_SetError
 752  011a               L351:
 753                     ; 196   send = (1<<ENAA_P0)|(1<<ENAA_P1)|(0<<ENAA_P2)|(0<<ENAA_P3)|(0<<ENAA_P4)|(0<<ENAA_P5);
 755  011a a603          	ld	a,#3
 756  011c 6b01          	ld	(OFST-1,sp),a
 757                     ; 197   nrf24_configRegister(EN_AA, send);
 759  011e ae0103        	ldw	x,#259
 760  0121 cd0000        	call	_nrf24_configRegister
 762                     ; 198   nrf24_readRegister(EN_AA, &rcv, 1);
 764  0124 4b01          	push	#1
 765  0126 96            	ldw	x,sp
 766  0127 1c0003        	addw	x,#OFST+1
 767  012a 89            	pushw	x
 768  012b a601          	ld	a,#1
 769  012d cd0000        	call	_nrf24_readRegister
 771  0130 5b03          	addw	sp,#3
 772                     ; 199   if(rcv != send)
 774  0132 7b02          	ld	a,(OFST+0,sp)
 775  0134 1101          	cp	a,(OFST-1,sp)
 776  0136 2704          	jreq	L551
 777                     ; 201     Errors_SetError(ERROR_NRF24_INIT);
 779  0138 4f            	clr	a
 780  0139 cd0000        	call	_Errors_SetError
 782  013c               L551:
 783                     ; 205   send = (1<<ERX_P0)|(1<<ERX_P1)|(0<<ERX_P2)|(0<<ERX_P3)|(0<<ERX_P4)|(0<<ERX_P5);
 785  013c a603          	ld	a,#3
 786  013e 6b01          	ld	(OFST-1,sp),a
 787                     ; 206   nrf24_configRegister(EN_RXADDR, send);
 789  0140 ae0203        	ldw	x,#515
 790  0143 cd0000        	call	_nrf24_configRegister
 792                     ; 207   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 794  0146 4b01          	push	#1
 795  0148 96            	ldw	x,sp
 796  0149 1c0003        	addw	x,#OFST+1
 797  014c 89            	pushw	x
 798  014d a602          	ld	a,#2
 799  014f cd0000        	call	_nrf24_readRegister
 801  0152 5b03          	addw	sp,#3
 802                     ; 208   if(rcv != send)
 804  0154 7b02          	ld	a,(OFST+0,sp)
 805  0156 1101          	cp	a,(OFST-1,sp)
 806  0158 2704          	jreq	L751
 807                     ; 210     Errors_SetError(ERROR_NRF24_INIT);
 809  015a 4f            	clr	a
 810  015b cd0000        	call	_Errors_SetError
 812  015e               L751:
 813                     ; 214   send = (0x04<<ARD)|(0x0F<<ARC);
 815  015e a64f          	ld	a,#79
 816  0160 6b01          	ld	(OFST-1,sp),a
 817                     ; 215   nrf24_configRegister(SETUP_RETR, send);
 819  0162 ae044f        	ldw	x,#1103
 820  0165 cd0000        	call	_nrf24_configRegister
 822                     ; 216   nrf24_readRegister(SETUP_RETR, &rcv, 1);
 824  0168 4b01          	push	#1
 825  016a 96            	ldw	x,sp
 826  016b 1c0003        	addw	x,#OFST+1
 827  016e 89            	pushw	x
 828  016f a604          	ld	a,#4
 829  0171 cd0000        	call	_nrf24_readRegister
 831  0174 5b03          	addw	sp,#3
 832                     ; 217   if(rcv != send)
 834  0176 7b02          	ld	a,(OFST+0,sp)
 835  0178 1101          	cp	a,(OFST-1,sp)
 836  017a 2704          	jreq	L161
 837                     ; 219     Errors_SetError(ERROR_NRF24_INIT);
 839  017c 4f            	clr	a
 840  017d cd0000        	call	_Errors_SetError
 842  0180               L161:
 843                     ; 223   send = (0<<DPL_P0)|(0<<DPL_P1)|(0<<DPL_P2)|(0<<DPL_P3)|(0<<DPL_P4)|(0<<DPL_P5);
 845  0180 0f01          	clr	(OFST-1,sp)
 846                     ; 224   nrf24_configRegister(DYNPD, send);
 848  0182 ae1c00        	ldw	x,#7168
 849  0185 cd0000        	call	_nrf24_configRegister
 851                     ; 225   nrf24_readRegister(DYNPD, &rcv, 1);
 853  0188 4b01          	push	#1
 854  018a 96            	ldw	x,sp
 855  018b 1c0003        	addw	x,#OFST+1
 856  018e 89            	pushw	x
 857  018f a61c          	ld	a,#28
 858  0191 cd0000        	call	_nrf24_readRegister
 860  0194 5b03          	addw	sp,#3
 861                     ; 226   if(rcv != send)
 863  0196 7b02          	ld	a,(OFST+0,sp)
 864  0198 1101          	cp	a,(OFST-1,sp)
 865  019a 2704          	jreq	L361
 866                     ; 228     Errors_SetError(ERROR_NRF24_INIT);
 868  019c 4f            	clr	a
 869  019d cd0000        	call	_Errors_SetError
 871  01a0               L361:
 872                     ; 232   nrf24_powerUpRx();
 874  01a0 cd0000        	call	_nrf24_powerUpRx
 876                     ; 233 }
 879  01a3 5b04          	addw	sp,#4
 880  01a5 81            	ret	
 917                     ; 236 void nrf24_rx_address(uint8_t * adr) 
 917                     ; 237 {
 918                     .text:	section	.text,new
 919  0000               _nrf24_rx_address:
 921  0000 89            	pushw	x
 922       00000000      OFST:	set	0
 925                     ; 238     nrf24_ce_digitalWrite(LOW);
 927  0001 4f            	clr	a
 928  0002 cd0000        	call	_nrf24_ce_digitalWrite
 930                     ; 239     nrf24_writeRegister(RX_ADDR_P1, adr, nrf24_ADDR_LEN);
 932  0005 4b05          	push	#5
 933  0007 1e02          	ldw	x,(OFST+2,sp)
 934  0009 89            	pushw	x
 935  000a a60b          	ld	a,#11
 936  000c cd0000        	call	_nrf24_writeRegister
 938  000f 5b03          	addw	sp,#3
 939                     ; 240     nrf24_ce_digitalWrite(HIGH);
 941  0011 a601          	ld	a,#1
 942  0013 cd0000        	call	_nrf24_ce_digitalWrite
 944                     ; 241 }
 947  0016 85            	popw	x
 948  0017 81            	ret	
 973                     ; 244 uint8_t nrf24_payload_length()
 973                     ; 245 {
 974                     .text:	section	.text,new
 975  0000               _nrf24_payload_length:
 979                     ; 246     return payload_len;
 981  0000 b600          	ld	a,_payload_len
 984  0002 81            	ret	
1020                     ; 250 void nrf24_tx_address(uint8_t* adr)
1020                     ; 251 {
1021                     .text:	section	.text,new
1022  0000               _nrf24_tx_address:
1024  0000 89            	pushw	x
1025       00000000      OFST:	set	0
1028                     ; 253     nrf24_writeRegister(RX_ADDR_P0,adr,nrf24_ADDR_LEN);
1030  0001 4b05          	push	#5
1031  0003 89            	pushw	x
1032  0004 a60a          	ld	a,#10
1033  0006 cd0000        	call	_nrf24_writeRegister
1035  0009 5b03          	addw	sp,#3
1036                     ; 254     nrf24_writeRegister(TX_ADDR,adr,nrf24_ADDR_LEN);
1038  000b 4b05          	push	#5
1039  000d 1e02          	ldw	x,(OFST+2,sp)
1040  000f 89            	pushw	x
1041  0010 a610          	ld	a,#16
1042  0012 cd0000        	call	_nrf24_writeRegister
1044  0015 5b03          	addw	sp,#3
1045                     ; 255 }
1048  0017 85            	popw	x
1049  0018 81            	ret	
1085                     ; 259 uint8_t nrf24_dataReady() 
1085                     ; 260 {
1086                     .text:	section	.text,new
1087  0000               _nrf24_dataReady:
1089  0000 88            	push	a
1090       00000001      OFST:	set	1
1093                     ; 262     uint8_t status = nrf24_getStatus();
1095  0001 cd0000        	call	_nrf24_getStatus
1097  0004 6b01          	ld	(OFST+0,sp),a
1098                     ; 266     if ( status & (1 << RX_DR) ) 
1100  0006 a540          	bcp	a,#64
1101  0008 2705          	jreq	L742
1102                     ; 268         return 1;
1104  000a a601          	ld	a,#1
1107  000c 5b01          	addw	sp,#1
1108  000e 81            	ret	
1109  000f               L742:
1110                     ; 271     return !nrf24_rxFifoEmpty();
1112  000f cd0000        	call	_nrf24_rxFifoEmpty
1114  0012 4d            	tnz	a
1115  0013 2603          	jrne	L452
1116  0015 4c            	inc	a
1117  0016 2001          	jra	L062
1118  0018               L452:
1119  0018 4f            	clr	a
1120  0019               L062:
1123  0019 5b01          	addw	sp,#1
1124  001b 81            	ret	
1159                     ; 275 uint8_t nrf24_rxFifoEmpty()
1159                     ; 276 {
1160                     .text:	section	.text,new
1161  0000               _nrf24_rxFifoEmpty:
1163  0000 88            	push	a
1164       00000001      OFST:	set	1
1167                     ; 279     nrf24_readRegister(FIFO_STATUS,&fifoStatus,1);
1169  0001 4b01          	push	#1
1170  0003 96            	ldw	x,sp
1171  0004 1c0002        	addw	x,#OFST+1
1172  0007 89            	pushw	x
1173  0008 a617          	ld	a,#23
1174  000a cd0000        	call	_nrf24_readRegister
1176  000d 5b03          	addw	sp,#3
1177                     ; 281     return (fifoStatus & (1 << RX_EMPTY));
1179  000f 7b01          	ld	a,(OFST+0,sp)
1180  0011 a401          	and	a,#1
1183  0013 5b01          	addw	sp,#1
1184  0015 81            	ret	
1221                     ; 285 uint8_t nrf24_payloadLength()
1221                     ; 286 {
1222                     .text:	section	.text,new
1223  0000               _nrf24_payloadLength:
1225  0000 88            	push	a
1226       00000001      OFST:	set	1
1229                     ; 288     nrf24_csn_digitalWrite(LOW);
1231  0001 4f            	clr	a
1232  0002 cd0000        	call	_nrf24_csn_digitalWrite
1234                     ; 289     spi_transfer(R_RX_PL_WID);
1236  0005 a660          	ld	a,#96
1237  0007 cd0000        	call	_spi_transfer
1239                     ; 290     status = spi_transfer(0x00);
1241  000a 4f            	clr	a
1242  000b cd0000        	call	_spi_transfer
1244  000e 6b01          	ld	(OFST+0,sp),a
1245                     ; 291     nrf24_csn_digitalWrite(HIGH);
1247  0010 a601          	ld	a,#1
1248  0012 cd0000        	call	_nrf24_csn_digitalWrite
1250                     ; 292     return status;
1252  0015 7b01          	ld	a,(OFST+0,sp)
1255  0017 5b01          	addw	sp,#1
1256  0019 81            	ret	
1316                     ; 296 void nrf24_getData(uint8_t* data) 
1316                     ; 297 {
1317                     .text:	section	.text,new
1318  0000               _nrf24_getData:
1320  0000 89            	pushw	x
1321  0001 89            	pushw	x
1322       00000002      OFST:	set	2
1325                     ; 300   nrf24_csn_digitalWrite(LOW);                               
1327  0002 4f            	clr	a
1328  0003 cd0000        	call	_nrf24_csn_digitalWrite
1330                     ; 303   spi_transfer( R_RX_PAYLOAD );
1332  0006 a661          	ld	a,#97
1333  0008 cd0000        	call	_spi_transfer
1335                     ; 306   nrf24_transferSync(data,data,payload_len);
1337  000b 3b0000        	push	_payload_len
1338  000e 1e04          	ldw	x,(OFST+2,sp)
1339  0010 89            	pushw	x
1340  0011 1e06          	ldw	x,(OFST+4,sp)
1341  0013 cd0000        	call	_nrf24_transferSync
1343  0016 5b03          	addw	sp,#3
1344                     ; 309   nrf24_csn_digitalWrite(HIGH);
1346  0018 a601          	ld	a,#1
1347  001a cd0000        	call	_nrf24_csn_digitalWrite
1349                     ; 312   nrf24_readRegister(STATUS, &send, 1);
1351  001d 4b01          	push	#1
1352  001f 96            	ldw	x,sp
1353  0020 1c0002        	addw	x,#OFST+0
1354  0023 89            	pushw	x
1355  0024 a607          	ld	a,#7
1356  0026 cd0000        	call	_nrf24_readRegister
1358  0029 5b03          	addw	sp,#3
1359                     ; 313   nrf24_configRegister(STATUS,(1<<RX_DR));
1361  002b ae0740        	ldw	x,#1856
1362  002e cd0000        	call	_nrf24_configRegister
1364                     ; 314   nrf24_readRegister(STATUS, &rcv, 1);
1366  0031 4b01          	push	#1
1367  0033 96            	ldw	x,sp
1368  0034 1c0003        	addw	x,#OFST+1
1369  0037 89            	pushw	x
1370  0038 a607          	ld	a,#7
1371  003a cd0000        	call	_nrf24_readRegister
1373  003d 5b03          	addw	sp,#3
1374                     ; 315   if(rcv & (1<<RX_DR))
1376  003f 7b02          	ld	a,(OFST+0,sp)
1377  0041 a540          	bcp	a,#64
1378  0043 2705          	jreq	L333
1379                     ; 317     Errors_SetError(ERROR_NRF24_COMM);
1381  0045 a601          	ld	a,#1
1382  0047 cd0000        	call	_Errors_SetError
1384  004a               L333:
1385                     ; 319 }
1388  004a 5b04          	addw	sp,#4
1389  004c 81            	ret	
1425                     ; 322 uint8_t nrf24_retransmissionCount()
1425                     ; 323 {
1426                     .text:	section	.text,new
1427  0000               _nrf24_retransmissionCount:
1429  0000 88            	push	a
1430       00000001      OFST:	set	1
1433                     ; 325     nrf24_readRegister(OBSERVE_TX,&rv,1);
1435  0001 4b01          	push	#1
1436  0003 96            	ldw	x,sp
1437  0004 1c0002        	addw	x,#OFST+1
1438  0007 89            	pushw	x
1439  0008 a608          	ld	a,#8
1440  000a cd0000        	call	_nrf24_readRegister
1442  000d 5b03          	addw	sp,#3
1443                     ; 326     rv = rv & 0x0F;
1445  000f 7b01          	ld	a,(OFST+0,sp)
1446  0011 a40f          	and	a,#15
1447                     ; 327     return rv;
1451  0013 5b01          	addw	sp,#1
1452  0015 81            	ret	
1493                     ; 332 void nrf24_send(uint8_t* value) 
1493                     ; 333 {    
1494                     .text:	section	.text,new
1495  0000               _nrf24_send:
1497  0000 89            	pushw	x
1498       00000000      OFST:	set	0
1501                     ; 335     nrf24_ce_digitalWrite(LOW);
1503  0001 4f            	clr	a
1504  0002 cd0000        	call	_nrf24_ce_digitalWrite
1506                     ; 338     nrf24_powerUpTx();
1508  0005 cd0000        	call	_nrf24_powerUpTx
1510                     ; 353     nrf24_csn_digitalWrite(LOW);
1512  0008 4f            	clr	a
1513  0009 cd0000        	call	_nrf24_csn_digitalWrite
1515                     ; 356     spi_transfer(W_TX_PAYLOAD);
1517  000c a6a0          	ld	a,#160
1518  000e cd0000        	call	_spi_transfer
1520                     ; 359     nrf24_transmitSync(value, payload_len);   
1522  0011 3b0000        	push	_payload_len
1523  0014 1e02          	ldw	x,(OFST+2,sp)
1524  0016 cd0000        	call	_nrf24_transmitSync
1526  0019 84            	pop	a
1527                     ; 362     nrf24_csn_digitalWrite(HIGH);
1529  001a a601          	ld	a,#1
1530  001c cd0000        	call	_nrf24_csn_digitalWrite
1532                     ; 365     nrf24_ce_digitalWrite(HIGH);    
1534  001f a601          	ld	a,#1
1535  0021 cd0000        	call	_nrf24_ce_digitalWrite
1537                     ; 366 }
1540  0024 85            	popw	x
1541  0025 81            	ret	
1576                     ; 368 uint8_t nrf24_isSending()
1576                     ; 369 {
1577                     .text:	section	.text,new
1578  0000               _nrf24_isSending:
1580  0000 88            	push	a
1581       00000001      OFST:	set	1
1584                     ; 373     status = nrf24_getStatus();
1586  0001 cd0000        	call	_nrf24_getStatus
1588  0004 6b01          	ld	(OFST+0,sp),a
1589                     ; 376     if((status & ((1 << TX_DS)  | (1 << MAX_RT))))
1591  0006 a530          	bcp	a,#48
1592  0008 2704          	jreq	L704
1593                     ; 378         return 0; /* false */
1595  000a 4f            	clr	a
1598  000b 5b01          	addw	sp,#1
1599  000d 81            	ret	
1600  000e               L704:
1601                     ; 381     return 1; /* true */
1603  000e a601          	ld	a,#1
1606  0010 5b01          	addw	sp,#1
1607  0012 81            	ret	
1643                     ; 385 uint8_t nrf24_getStatus()
1643                     ; 386 {
1644                     .text:	section	.text,new
1645  0000               _nrf24_getStatus:
1647  0000 88            	push	a
1648       00000001      OFST:	set	1
1651                     ; 388     nrf24_csn_digitalWrite(LOW);
1653  0001 4f            	clr	a
1654  0002 cd0000        	call	_nrf24_csn_digitalWrite
1656                     ; 389     rv = spi_transfer(NOP);
1658  0005 a6ff          	ld	a,#255
1659  0007 cd0000        	call	_spi_transfer
1661  000a 6b01          	ld	(OFST+0,sp),a
1662                     ; 390     nrf24_csn_digitalWrite(HIGH);
1664  000c a601          	ld	a,#1
1665  000e cd0000        	call	_nrf24_csn_digitalWrite
1667                     ; 391     return rv;
1669  0011 7b01          	ld	a,(OFST+0,sp)
1672  0013 5b01          	addw	sp,#1
1673  0015 81            	ret	
1709                     ; 394 uint8_t nrf24_lastMessageStatus()
1709                     ; 395 {
1710                     .text:	section	.text,new
1711  0000               _nrf24_lastMessageStatus:
1713  0000 88            	push	a
1714       00000001      OFST:	set	1
1717                     ; 398     rv = nrf24_getStatus();
1719  0001 cd0000        	call	_nrf24_getStatus
1721  0004 6b01          	ld	(OFST+0,sp),a
1722                     ; 401     if((rv & ((1 << TX_DS))))
1724  0006 a520          	bcp	a,#32
1725  0008 2704          	jreq	L544
1726                     ; 403         return NRF24_TRANSMISSON_OK;
1728  000a 4f            	clr	a
1731  000b 5b01          	addw	sp,#1
1732  000d 81            	ret	
1733  000e               L544:
1734                     ; 407     else if((rv & ((1 << MAX_RT))))
1736  000e a510          	bcp	a,#16
1737  0010 2705          	jreq	L154
1738                     ; 409         return NRF24_MESSAGE_LOST;
1740  0012 a601          	ld	a,#1
1743  0014 5b01          	addw	sp,#1
1744  0016 81            	ret	
1745  0017               L154:
1746                     ; 414         return 0xFF;
1748  0017 a6ff          	ld	a,#255
1751  0019 5b01          	addw	sp,#1
1752  001b 81            	ret	
1801                     ; 418 void nrf24_powerUpRx()
1801                     ; 419 {     
1802                     .text:	section	.text,new
1803  0000               _nrf24_powerUpRx:
1805  0000 89            	pushw	x
1806       00000002      OFST:	set	2
1809                     ; 421     nrf24_csn_digitalWrite(LOW);
1811  0001 4f            	clr	a
1812  0002 cd0000        	call	_nrf24_csn_digitalWrite
1814                     ; 422     spi_transfer(FLUSH_RX);
1816  0005 a6e2          	ld	a,#226
1817  0007 cd0000        	call	_spi_transfer
1819                     ; 423     nrf24_csn_digitalWrite(HIGH);
1821  000a a601          	ld	a,#1
1822  000c cd0000        	call	_nrf24_csn_digitalWrite
1824                     ; 425     send = (1<<RX_DR)|(1<<TX_DS)|(1<<MAX_RT);
1826  000f a670          	ld	a,#112
1827  0011 6b02          	ld	(OFST+0,sp),a
1828                     ; 426     nrf24_configRegister(STATUS, send);
1830  0013 ae0770        	ldw	x,#1904
1831  0016 cd0000        	call	_nrf24_configRegister
1833                     ; 427     nrf24_readRegister(STATUS, &rcv, 1);
1835  0019 4b01          	push	#1
1836  001b 96            	ldw	x,sp
1837  001c 1c0002        	addw	x,#OFST+0
1838  001f 89            	pushw	x
1839  0020 a607          	ld	a,#7
1840  0022 cd0000        	call	_nrf24_readRegister
1842  0025 5b03          	addw	sp,#3
1843                     ; 428     if(rcv & send)  // RX_DR, TX_DS, MAX_RT should be reset
1845  0027 7b01          	ld	a,(OFST-1,sp)
1846  0029 1502          	bcp	a,(OFST+0,sp)
1847  002b 2704          	jreq	L774
1848                     ; 430       Errors_SetError(ERROR_NRF24_INIT);
1850  002d 4f            	clr	a
1851  002e cd0000        	call	_Errors_SetError
1853  0031               L774:
1854                     ; 433     nrf24_ce_digitalWrite(LOW);    
1856  0031 4f            	clr	a
1857  0032 cd0000        	call	_nrf24_ce_digitalWrite
1859                     ; 434     send = nrf24_CONFIG|((1<<PWR_UP)|(1<<PRIM_RX));
1861  0035 a63f          	ld	a,#63
1862  0037 6b02          	ld	(OFST+0,sp),a
1863                     ; 435     nrf24_configRegister(CONFIG, send);
1865  0039 ae003f        	ldw	x,#63
1866  003c cd0000        	call	_nrf24_configRegister
1868                     ; 436     nrf24_readRegister(CONFIG, &rcv, 1);
1870  003f 4b01          	push	#1
1871  0041 96            	ldw	x,sp
1872  0042 1c0002        	addw	x,#OFST+0
1873  0045 89            	pushw	x
1874  0046 4f            	clr	a
1875  0047 cd0000        	call	_nrf24_readRegister
1877  004a 5b03          	addw	sp,#3
1878                     ; 437     if(rcv != send)
1880  004c 7b01          	ld	a,(OFST-1,sp)
1881  004e 1102          	cp	a,(OFST+0,sp)
1882  0050 2704          	jreq	L105
1883                     ; 439       Errors_SetError(ERROR_NRF24_INIT);
1885  0052 4f            	clr	a
1886  0053 cd0000        	call	_Errors_SetError
1888  0056               L105:
1889                     ; 441     nrf24_ce_digitalWrite(HIGH);
1891  0056 a601          	ld	a,#1
1892  0058 cd0000        	call	_nrf24_ce_digitalWrite
1894                     ; 442 }
1897  005b 85            	popw	x
1898  005c 81            	ret	
1944                     ; 444 void nrf24_powerUpTx()
1944                     ; 445 {
1945                     .text:	section	.text,new
1946  0000               _nrf24_powerUpTx:
1948  0000 89            	pushw	x
1949       00000002      OFST:	set	2
1952                     ; 447   send = (1<<RX_DR)|(1<<TX_DS)|(1<<MAX_RT);
1954  0001 a670          	ld	a,#112
1955  0003 6b02          	ld	(OFST+0,sp),a
1956                     ; 448   nrf24_configRegister(STATUS, send);
1958  0005 ae0770        	ldw	x,#1904
1959  0008 cd0000        	call	_nrf24_configRegister
1961                     ; 449   nrf24_readRegister(STATUS, &rcv, 1);
1963  000b 4b01          	push	#1
1964  000d 96            	ldw	x,sp
1965  000e 1c0002        	addw	x,#OFST+0
1966  0011 89            	pushw	x
1967  0012 a607          	ld	a,#7
1968  0014 cd0000        	call	_nrf24_readRegister
1970  0017 5b03          	addw	sp,#3
1971                     ; 450   if(rcv & send)  // RX_DR, TX_DS, MAX_RT should be reset
1973  0019 7b01          	ld	a,(OFST-1,sp)
1974  001b 1502          	bcp	a,(OFST+0,sp)
1975  001d 2704          	jreq	L525
1976                     ; 452     Errors_SetError(ERROR_NRF24_INIT);
1978  001f 4f            	clr	a
1979  0020 cd0000        	call	_Errors_SetError
1981  0023               L525:
1982                     ; 454   send = nrf24_CONFIG|((1<<PWR_UP)|(0<<PRIM_RX));
1984  0023 a63e          	ld	a,#62
1985  0025 6b02          	ld	(OFST+0,sp),a
1986                     ; 455   nrf24_configRegister(CONFIG, send);
1988  0027 ae003e        	ldw	x,#62
1989  002a cd0000        	call	_nrf24_configRegister
1991                     ; 456   nrf24_readRegister(CONFIG, &rcv, 1);
1993  002d 4b01          	push	#1
1994  002f 96            	ldw	x,sp
1995  0030 1c0002        	addw	x,#OFST+0
1996  0033 89            	pushw	x
1997  0034 4f            	clr	a
1998  0035 cd0000        	call	_nrf24_readRegister
2000  0038 5b03          	addw	sp,#3
2001                     ; 457   if(rcv != send)
2003  003a 7b01          	ld	a,(OFST-1,sp)
2004  003c 1102          	cp	a,(OFST+0,sp)
2005  003e 2704          	jreq	L725
2006                     ; 459     Errors_SetError(ERROR_NRF24_INIT);
2008  0040 4f            	clr	a
2009  0041 cd0000        	call	_Errors_SetError
2011  0044               L725:
2012                     ; 461 }
2015  0044 85            	popw	x
2016  0045 81            	ret	
2062                     ; 463 void nrf24_powerUP()
2062                     ; 464 {
2063                     .text:	section	.text,new
2064  0000               _nrf24_powerUP:
2066  0000 89            	pushw	x
2067       00000002      OFST:	set	2
2070                     ; 466   nrf24_readRegister(CONFIG, &rcv, 1);
2072  0001 4b01          	push	#1
2073  0003 96            	ldw	x,sp
2074  0004 1c0003        	addw	x,#OFST+1
2075  0007 89            	pushw	x
2076  0008 4f            	clr	a
2077  0009 cd0000        	call	_nrf24_readRegister
2079  000c 5b03          	addw	sp,#3
2080                     ; 467   send = rcv | (1<<PWR_UP);
2082  000e 7b02          	ld	a,(OFST+0,sp)
2083  0010 aa02          	or	a,#2
2084  0012 6b01          	ld	(OFST-1,sp),a
2085                     ; 468   nrf24_configRegister(CONFIG, send);
2087  0014 97            	ld	xl,a
2088  0015 4f            	clr	a
2089  0016 95            	ld	xh,a
2090  0017 cd0000        	call	_nrf24_configRegister
2092                     ; 469   nrf24_readRegister(CONFIG, &rcv, 1);
2094  001a 4b01          	push	#1
2095  001c 96            	ldw	x,sp
2096  001d 1c0003        	addw	x,#OFST+1
2097  0020 89            	pushw	x
2098  0021 4f            	clr	a
2099  0022 cd0000        	call	_nrf24_readRegister
2101  0025 5b03          	addw	sp,#3
2102                     ; 470   if(rcv != send)
2104  0027 7b02          	ld	a,(OFST+0,sp)
2105  0029 1101          	cp	a,(OFST-1,sp)
2106  002b 2704          	jreq	L355
2107                     ; 472     Errors_SetError(ERROR_NRF24_INIT);
2109  002d 4f            	clr	a
2110  002e cd0000        	call	_Errors_SetError
2112  0031               L355:
2113                     ; 474 }
2116  0031 85            	popw	x
2117  0032 81            	ret	
2163                     ; 476 void nrf24_RXmode()
2163                     ; 477 {
2164                     .text:	section	.text,new
2165  0000               _nrf24_RXmode:
2167  0000 89            	pushw	x
2168       00000002      OFST:	set	2
2171                     ; 479   nrf24_readRegister(CONFIG, &rcv, 1);
2173  0001 4b01          	push	#1
2174  0003 96            	ldw	x,sp
2175  0004 1c0003        	addw	x,#OFST+1
2176  0007 89            	pushw	x
2177  0008 4f            	clr	a
2178  0009 cd0000        	call	_nrf24_readRegister
2180  000c 5b03          	addw	sp,#3
2181                     ; 480   send = rcv | (1<<PRIM_RX);
2183  000e 7b02          	ld	a,(OFST+0,sp)
2184  0010 aa01          	or	a,#1
2185  0012 6b01          	ld	(OFST-1,sp),a
2186                     ; 481   nrf24_configRegister(CONFIG, send);
2188  0014 97            	ld	xl,a
2189  0015 4f            	clr	a
2190  0016 95            	ld	xh,a
2191  0017 cd0000        	call	_nrf24_configRegister
2193                     ; 482   nrf24_readRegister(CONFIG, &rcv, 1);
2195  001a 4b01          	push	#1
2196  001c 96            	ldw	x,sp
2197  001d 1c0003        	addw	x,#OFST+1
2198  0020 89            	pushw	x
2199  0021 4f            	clr	a
2200  0022 cd0000        	call	_nrf24_readRegister
2202  0025 5b03          	addw	sp,#3
2203                     ; 483   if(rcv != send)
2205  0027 7b02          	ld	a,(OFST+0,sp)
2206  0029 1101          	cp	a,(OFST-1,sp)
2207  002b 2704          	jreq	L775
2208                     ; 485     Errors_SetError(ERROR_NRF24_INIT);
2210  002d 4f            	clr	a
2211  002e cd0000        	call	_Errors_SetError
2213  0031               L775:
2214                     ; 487 }
2217  0031 85            	popw	x
2218  0032 81            	ret	
2264                     ; 489 void nrf24_SetRFChannel(u8 channel)
2264                     ; 490 {
2265                     .text:	section	.text,new
2266  0000               _nrf24_SetRFChannel:
2268  0000 88            	push	a
2269  0001 88            	push	a
2270       00000001      OFST:	set	1
2273                     ; 492   nrf24_configRegister(RF_CH,channel);  // 2400 + RF_CHANNEL
2275  0002 97            	ld	xl,a
2276  0003 a605          	ld	a,#5
2277  0005 95            	ld	xh,a
2278  0006 cd0000        	call	_nrf24_configRegister
2280                     ; 493   nrf24_readRegister(RF_CH, &rcv, 1);
2282  0009 4b01          	push	#1
2283  000b 96            	ldw	x,sp
2284  000c 1c0002        	addw	x,#OFST+1
2285  000f 89            	pushw	x
2286  0010 a605          	ld	a,#5
2287  0012 cd0000        	call	_nrf24_readRegister
2289  0015 5b03          	addw	sp,#3
2290                     ; 494   if(rcv != channel)
2292  0017 7b01          	ld	a,(OFST+0,sp)
2293  0019 1102          	cp	a,(OFST+1,sp)
2294  001b 2704          	jreq	L326
2295                     ; 496     Errors_SetError(ERROR_NRF24_INIT);
2297  001d 4f            	clr	a
2298  001e cd0000        	call	_Errors_SetError
2300  0021               L326:
2301                     ; 498 }
2304  0021 85            	popw	x
2305  0022 81            	ret	
2351                     ; 500 void nrf24_TXmode()
2351                     ; 501 {
2352                     .text:	section	.text,new
2353  0000               _nrf24_TXmode:
2355  0000 89            	pushw	x
2356       00000002      OFST:	set	2
2359                     ; 503   nrf24_readRegister(CONFIG, &rcv, 1);
2361  0001 4b01          	push	#1
2362  0003 96            	ldw	x,sp
2363  0004 1c0003        	addw	x,#OFST+1
2364  0007 89            	pushw	x
2365  0008 4f            	clr	a
2366  0009 cd0000        	call	_nrf24_readRegister
2368  000c 5b03          	addw	sp,#3
2369                     ; 504   send = rcv & (u8)(~(1<<PRIM_RX));
2371  000e 7b02          	ld	a,(OFST+0,sp)
2372  0010 a4fe          	and	a,#254
2373  0012 6b01          	ld	(OFST-1,sp),a
2374                     ; 505   nrf24_configRegister(CONFIG, send);
2376  0014 97            	ld	xl,a
2377  0015 4f            	clr	a
2378  0016 95            	ld	xh,a
2379  0017 cd0000        	call	_nrf24_configRegister
2381                     ; 506   nrf24_readRegister(CONFIG, &rcv, 1);
2383  001a 4b01          	push	#1
2384  001c 96            	ldw	x,sp
2385  001d 1c0003        	addw	x,#OFST+1
2386  0020 89            	pushw	x
2387  0021 4f            	clr	a
2388  0022 cd0000        	call	_nrf24_readRegister
2390  0025 5b03          	addw	sp,#3
2391                     ; 507   if(rcv != send)
2393  0027 7b02          	ld	a,(OFST+0,sp)
2394  0029 1101          	cp	a,(OFST-1,sp)
2395  002b 2704          	jreq	L746
2396                     ; 509     Errors_SetError(ERROR_NRF24_INIT);
2398  002d 4f            	clr	a
2399  002e cd0000        	call	_Errors_SetError
2401  0031               L746:
2402                     ; 511 }
2405  0031 85            	popw	x
2406  0032 81            	ret	
2431                     ; 513 void nrf24_powerDown()
2431                     ; 514 {
2432                     .text:	section	.text,new
2433  0000               _nrf24_powerDown:
2437                     ; 515     nrf24_ce_digitalWrite(LOW);
2439  0000 4f            	clr	a
2440  0001 cd0000        	call	_nrf24_ce_digitalWrite
2442                     ; 516     nrf24_configRegister(CONFIG,nrf24_CONFIG);
2444  0004 ae003c        	ldw	x,#60
2446                     ; 517 }
2449  0007 cc0000        	jp	_nrf24_configRegister
2513                     ; 556 void nrf24_transferSync(uint8_t* dataout,uint8_t* datain,uint8_t len)
2513                     ; 557 {
2514                     .text:	section	.text,new
2515  0000               _nrf24_transferSync:
2517  0000 89            	pushw	x
2518  0001 88            	push	a
2519       00000001      OFST:	set	1
2522                     ; 560     for(i=0;i<len;i++)
2524  0002 0f01          	clr	(OFST+0,sp)
2526  0004 201f          	jra	L717
2527  0006               L317:
2528                     ; 562         datain[i] = spi_transfer(dataout[i]);
2530  0006 7b06          	ld	a,(OFST+5,sp)
2531  0008 97            	ld	xl,a
2532  0009 7b07          	ld	a,(OFST+6,sp)
2533  000b 1b01          	add	a,(OFST+0,sp)
2534  000d 2401          	jrnc	L215
2535  000f 5c            	incw	x
2536  0010               L215:
2537  0010 02            	rlwa	x,a
2538  0011 89            	pushw	x
2539  0012 7b04          	ld	a,(OFST+3,sp)
2540  0014 97            	ld	xl,a
2541  0015 7b05          	ld	a,(OFST+4,sp)
2542  0017 1b03          	add	a,(OFST+2,sp)
2543  0019 2401          	jrnc	L615
2544  001b 5c            	incw	x
2545  001c               L615:
2546  001c 02            	rlwa	x,a
2547  001d f6            	ld	a,(x)
2548  001e cd0000        	call	_spi_transfer
2550  0021 85            	popw	x
2551  0022 f7            	ld	(x),a
2552                     ; 560     for(i=0;i<len;i++)
2554  0023 0c01          	inc	(OFST+0,sp)
2555  0025               L717:
2558  0025 7b01          	ld	a,(OFST+0,sp)
2559  0027 1108          	cp	a,(OFST+7,sp)
2560  0029 25db          	jrult	L317
2561                     ; 565 }
2564  002b 5b03          	addw	sp,#3
2565  002d 81            	ret	
2619                     ; 568 void nrf24_transmitSync(uint8_t* dataout,uint8_t len)
2619                     ; 569 {
2620                     .text:	section	.text,new
2621  0000               _nrf24_transmitSync:
2623  0000 89            	pushw	x
2624  0001 88            	push	a
2625       00000001      OFST:	set	1
2628                     ; 572     for(i=0;i<len;i++)
2630  0002 0f01          	clr	(OFST+0,sp)
2632  0004 2011          	jra	L557
2633  0006               L157:
2634                     ; 574         spi_transfer(dataout[i]);
2636  0006 7b02          	ld	a,(OFST+1,sp)
2637  0008 97            	ld	xl,a
2638  0009 7b03          	ld	a,(OFST+2,sp)
2639  000b 1b01          	add	a,(OFST+0,sp)
2640  000d 2401          	jrnc	L425
2641  000f 5c            	incw	x
2642  0010               L425:
2643  0010 02            	rlwa	x,a
2644  0011 f6            	ld	a,(x)
2645  0012 cd0000        	call	_spi_transfer
2647                     ; 572     for(i=0;i<len;i++)
2649  0015 0c01          	inc	(OFST+0,sp)
2650  0017               L557:
2653  0017 7b01          	ld	a,(OFST+0,sp)
2654  0019 1106          	cp	a,(OFST+5,sp)
2655  001b 25e9          	jrult	L157
2656                     ; 577 }
2659  001d 5b03          	addw	sp,#3
2660  001f 81            	ret	
2706                     ; 580 void nrf24_configRegister(uint8_t reg, uint8_t value)
2706                     ; 581 {
2707                     .text:	section	.text,new
2708  0000               _nrf24_configRegister:
2710  0000 89            	pushw	x
2711       00000000      OFST:	set	0
2714                     ; 582     nrf24_csn_digitalWrite(LOW);
2716  0001 4f            	clr	a
2717  0002 cd0000        	call	_nrf24_csn_digitalWrite
2719                     ; 583     spi_transfer(W_REGISTER | (REGISTER_MASK & reg));
2721  0005 7b01          	ld	a,(OFST+1,sp)
2722  0007 a41f          	and	a,#31
2723  0009 aa20          	or	a,#32
2724  000b cd0000        	call	_spi_transfer
2726                     ; 584     spi_transfer(value);
2728  000e 7b02          	ld	a,(OFST+2,sp)
2729  0010 cd0000        	call	_spi_transfer
2731                     ; 585     nrf24_csn_digitalWrite(HIGH);
2733  0013 a601          	ld	a,#1
2734  0015 cd0000        	call	_nrf24_csn_digitalWrite
2736                     ; 586 }
2739  0018 85            	popw	x
2740  0019 81            	ret	
2796                     ; 589 void nrf24_readRegister(uint8_t reg, uint8_t* value, uint8_t len)
2796                     ; 590 {
2797                     .text:	section	.text,new
2798  0000               _nrf24_readRegister:
2800  0000 88            	push	a
2801       00000000      OFST:	set	0
2804                     ; 591     nrf24_csn_digitalWrite(LOW);
2806  0001 4f            	clr	a
2807  0002 cd0000        	call	_nrf24_csn_digitalWrite
2809                     ; 592     spi_transfer(R_REGISTER | (REGISTER_MASK & reg));
2811  0005 7b01          	ld	a,(OFST+1,sp)
2812  0007 a41f          	and	a,#31
2813  0009 cd0000        	call	_spi_transfer
2815                     ; 593     nrf24_transferSync(value,value,len);
2817  000c 7b06          	ld	a,(OFST+6,sp)
2818  000e 88            	push	a
2819  000f 1e05          	ldw	x,(OFST+5,sp)
2820  0011 89            	pushw	x
2821  0012 1e07          	ldw	x,(OFST+7,sp)
2822  0014 cd0000        	call	_nrf24_transferSync
2824  0017 5b03          	addw	sp,#3
2825                     ; 594     nrf24_csn_digitalWrite(HIGH);
2827  0019 a601          	ld	a,#1
2828  001b cd0000        	call	_nrf24_csn_digitalWrite
2830                     ; 595 }
2833  001e 84            	pop	a
2834  001f 81            	ret	
2891                     ; 598 void nrf24_writeRegister(uint8_t reg, uint8_t* value, uint8_t len) 
2891                     ; 599 {
2892                     .text:	section	.text,new
2893  0000               _nrf24_writeRegister:
2895  0000 88            	push	a
2896       00000000      OFST:	set	0
2899                     ; 600     nrf24_csn_digitalWrite(LOW);
2901  0001 4f            	clr	a
2902  0002 cd0000        	call	_nrf24_csn_digitalWrite
2904                     ; 601     spi_transfer(W_REGISTER | (REGISTER_MASK & reg));
2906  0005 7b01          	ld	a,(OFST+1,sp)
2907  0007 a41f          	and	a,#31
2908  0009 aa20          	or	a,#32
2909  000b cd0000        	call	_spi_transfer
2911                     ; 602     nrf24_transmitSync(value,len);
2913  000e 7b06          	ld	a,(OFST+6,sp)
2914  0010 88            	push	a
2915  0011 1e05          	ldw	x,(OFST+5,sp)
2916  0013 cd0000        	call	_nrf24_transmitSync
2918  0016 84            	pop	a
2919                     ; 603     nrf24_csn_digitalWrite(HIGH);
2921  0017 a601          	ld	a,#1
2922  0019 cd0000        	call	_nrf24_csn_digitalWrite
2924                     ; 604 }
2927  001c 84            	pop	a
2928  001d 81            	ret	
2952                     	switch	.ubsct
2953  0000               _payload_len:
2954  0000 00            	ds.b	1
2955                     	xdef	_payload_len
2956                     	xref	_Errors_ResetError
2957                     	xref	_Errors_SetError
2958                     	xref	_nrf24_csn_digitalWrite
2959                     	xref	_nrf24_ce_digitalWrite
2960                     	xref	_nrf24_setupPins
2961                     	xdef	_nrf24_writeRegister
2962                     	xdef	_nrf24_readRegister
2963                     	xdef	_nrf24_configRegister
2964                     	xdef	_nrf24_transferSync
2965                     	xdef	_nrf24_transmitSync
2966                     	xref	_spi_transfer
2967                     	xdef	_nrf24_TXmode
2968                     	xdef	_nrf24_RXmode
2969                     	xdef	_nrf24_powerUP
2970                     	xdef	_nrf24_powerDown
2971                     	xdef	_nrf24_powerUpTx
2972                     	xdef	_nrf24_powerUpRx
2973                     	xdef	_nrf24_payload_length
2974                     	xdef	_nrf24_retransmissionCount
2975                     	xdef	_nrf24_lastMessageStatus
2976                     	xdef	_nrf24_payloadLength
2977                     	xdef	_nrf24_getData
2978                     	xdef	_nrf24_send
2979                     	xdef	_nrf24_rxFifoEmpty
2980                     	xdef	_nrf24_getStatus
2981                     	xdef	_nrf24_isSending
2982                     	xdef	_nrf24_dataReady
2983                     	xdef	_nrf24_config_esb
2984                     	xdef	_nrf24_config_sb
2985                     	xdef	_nrf24_SetRFChannel
2986                     	xdef	_nrf24_tx_address
2987                     	xdef	_nrf24_rx_address
2988                     	xdef	_nrf24_init
3008                     	end
