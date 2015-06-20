   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 121                     ; 27 void hal_nrf_set_irq_mode(hal_nrf_irq_source_t int_source, bool irq_state)
 121                     ; 28 {
 123                     .text:	section	.text,new
 124  0000               _hal_nrf_set_irq_mode:
 126  0000 89            	pushw	x
 127  0001 88            	push	a
 128       00000001      OFST:	set	1
 131                     ; 29   if(irq_state)
 133  0002 9f            	ld	a,xl
 134  0003 4d            	tnz	a
 135  0004 2717          	jreq	L55
 136                     ; 31     hal_nrf_write_reg(CONFIG, hal_nrf_read_reg(CONFIG) & ~SET_BIT(int_source));
 138  0006 9e            	ld	a,xh
 139  0007 5f            	clrw	x
 140  0008 97            	ld	xl,a
 141  0009 a601          	ld	a,#1
 142  000b 5d            	tnzw	x
 143  000c 2704          	jreq	L01
 144  000e               L21:
 145  000e 48            	sll	a
 146  000f 5a            	decw	x
 147  0010 26fc          	jrne	L21
 148  0012               L01:
 149  0012 43            	cpl	a
 150  0013 6b01          	ld	(OFST+0,sp),a
 151  0015 4f            	clr	a
 152  0016 cd0000        	call	_hal_nrf_read_reg
 154  0019 1401          	and	a,(OFST+0,sp)
 157  001b 2015          	jra	L75
 158  001d               L55:
 159                     ; 35     hal_nrf_write_reg(CONFIG, hal_nrf_read_reg(CONFIG) | SET_BIT(int_source));
 161  001d 7b02          	ld	a,(OFST+1,sp)
 162  001f 5f            	clrw	x
 163  0020 97            	ld	xl,a
 164  0021 a601          	ld	a,#1
 165  0023 5d            	tnzw	x
 166  0024 2704          	jreq	L02
 167  0026               L22:
 168  0026 48            	sll	a
 169  0027 5a            	decw	x
 170  0028 26fc          	jrne	L22
 171  002a               L02:
 172  002a 6b01          	ld	(OFST+0,sp),a
 173  002c 4f            	clr	a
 174  002d cd0000        	call	_hal_nrf_read_reg
 176  0030 1a01          	or	a,(OFST+0,sp)
 178  0032               L75:
 179  0032 97            	ld	xl,a
 180  0033 4f            	clr	a
 181  0034 95            	ld	xh,a
 182  0035 cd0000        	call	_hal_nrf_write_reg
 183                     ; 37 }
 186  0038 5b03          	addw	sp,#3
 187  003a 81            	ret	
 212                     ; 39 uint8_t hal_nrf_get_clear_irq_flags(void)
 212                     ; 40 {
 213                     .text:	section	.text,new
 214  0000               _hal_nrf_get_clear_irq_flags:
 218                     ; 41   return hal_nrf_write_reg(STATUS, (BIT_6|BIT_5|BIT_4)) & (BIT_6|BIT_5|BIT_4);
 220  0000 ae0770        	ldw	x,#1904
 221  0003 cd0000        	call	_hal_nrf_write_reg
 223  0006 a470          	and	a,#112
 226  0008 81            	ret	
 263                     ; 44 void hal_nrf_clear_irq_flag(hal_nrf_irq_source_t int_source)
 263                     ; 45 {
 264                     .text:	section	.text,new
 265  0000               _hal_nrf_clear_irq_flag:
 269                     ; 46   hal_nrf_write_reg(STATUS, SET_BIT(int_source));
 271  0000 5f            	clrw	x
 272  0001 97            	ld	xl,a
 273  0002 a601          	ld	a,#1
 274  0004 5d            	tnzw	x
 275  0005 2704          	jreq	L63
 276  0007               L04:
 277  0007 48            	sll	a
 278  0008 5a            	decw	x
 279  0009 26fc          	jrne	L04
 280  000b               L63:
 281  000b 97            	ld	xl,a
 282  000c a607          	ld	a,#7
 283  000e 95            	ld	xh,a
 285                     ; 47 }
 288  000f cc0000        	jp	_hal_nrf_write_reg
 325                     ; 49 bool hal_nrf_get_irq_mode(uint8_t int_type)
 325                     ; 50 {
 326                     .text:	section	.text,new
 327  0000               _hal_nrf_get_irq_mode:
 329  0000 88            	push	a
 330       00000001      OFST:	set	1
 333                     ; 51   if(hal_nrf_read_reg(CONFIG) & SET_BIT(int_type))
 335  0001 5f            	clrw	x
 336  0002 97            	ld	xl,a
 337  0003 a601          	ld	a,#1
 338  0005 5d            	tnzw	x
 339  0006 2704          	jreq	L44
 340  0008               L64:
 341  0008 48            	sll	a
 342  0009 5a            	decw	x
 343  000a 26fc          	jrne	L64
 344  000c               L44:
 345  000c 6b01          	ld	(OFST+0,sp),a
 346  000e 4f            	clr	a
 347  000f cd0000        	call	_hal_nrf_read_reg
 349  0012 1401          	and	a,(OFST+0,sp)
 350  0014 2704          	jreq	L521
 351                     ; 52     return FALSE;
 353  0016 4f            	clr	a
 356  0017 5b01          	addw	sp,#1
 357  0019 81            	ret	
 358  001a               L521:
 359                     ; 54     return TRUE;
 361  001a 4c            	inc	a
 364  001b 5b01          	addw	sp,#1
 365  001d 81            	ret	
 390                     ; 57 uint8_t hal_nrf_get_irq_flags(void)
 390                     ; 58 {
 391                     .text:	section	.text,new
 392  0000               _hal_nrf_get_irq_flags:
 396                     ; 59   return hal_nrf_nop() & (BIT_6|BIT_5|BIT_4);
 398  0000 cd0000        	call	_hal_nrf_nop
 400  0003 a470          	and	a,#112
 403  0005 81            	ret	
 468                     ; 62 void hal_nrf_set_crc_mode(hal_nrf_crc_mode_t crc_mode)
 468                     ; 63 {
 469                     .text:	section	.text,new
 470  0000               _hal_nrf_set_crc_mode:
 472  0000 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 64   hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) & ~(BIT_3|BIT_2)) | (UINT8(crc_mode)<<2));
 478  0001 48            	sll	a
 479  0002 48            	sll	a
 480  0003 6b01          	ld	(OFST+0,sp),a
 481  0005 4f            	clr	a
 482  0006 cd0000        	call	_hal_nrf_read_reg
 484  0009 a4f3          	and	a,#243
 485  000b 1a01          	or	a,(OFST+0,sp)
 486  000d 97            	ld	xl,a
 487  000e 4f            	clr	a
 488  000f 95            	ld	xh,a
 489  0010 cd0000        	call	_hal_nrf_write_reg
 491                     ; 65 }
 494  0013 84            	pop	a
 495  0014 81            	ret	
 604                     ; 67 void hal_nrf_open_pipe(hal_nrf_address_t pipe_num, bool auto_ack)
 604                     ; 68 {
 605                     .text:	section	.text,new
 606  0000               _hal_nrf_open_pipe:
 608  0000 89            	pushw	x
 609  0001 88            	push	a
 610       00000001      OFST:	set	1
 613                     ; 69   switch(pipe_num)
 615  0002 9e            	ld	a,xh
 617                     ; 94     default:
 617                     ; 95       break;
 618  0003 4d            	tnz	a
 619  0004 2715          	jreq	L171
 620  0006 4a            	dec	a
 621  0007 2712          	jreq	L171
 622  0009 4a            	dec	a
 623  000a 270f          	jreq	L171
 624  000c 4a            	dec	a
 625  000d 270c          	jreq	L171
 626  000f 4a            	dec	a
 627  0010 2709          	jreq	L171
 628  0012 4a            	dec	a
 629  0013 2706          	jreq	L171
 630  0015 a0fa          	sub	a,#250
 631  0017 2758          	jreq	L371
 632  0019 206b          	jra	L742
 633  001b               L171:
 634                     ; 71     case HAL_NRF_PIPE0:
 634                     ; 72     case HAL_NRF_PIPE1:
 634                     ; 73     case HAL_NRF_PIPE2:
 634                     ; 74     case HAL_NRF_PIPE3:
 634                     ; 75     case HAL_NRF_PIPE4:
 634                     ; 76     case HAL_NRF_PIPE5:
 634                     ; 77       hal_nrf_write_reg(EN_RXADDR, hal_nrf_read_reg(EN_RXADDR) | SET_BIT(pipe_num));
 636  001b 7b02          	ld	a,(OFST+1,sp)
 637  001d 5f            	clrw	x
 638  001e 97            	ld	xl,a
 639  001f a601          	ld	a,#1
 640  0021 5d            	tnzw	x
 641  0022 2704          	jreq	L07
 642  0024               L27:
 643  0024 48            	sll	a
 644  0025 5a            	decw	x
 645  0026 26fc          	jrne	L27
 646  0028               L07:
 647  0028 6b01          	ld	(OFST+0,sp),a
 648  002a a602          	ld	a,#2
 649  002c cd0000        	call	_hal_nrf_read_reg
 651  002f 1a01          	or	a,(OFST+0,sp)
 652  0031 97            	ld	xl,a
 653  0032 a602          	ld	a,#2
 654  0034 95            	ld	xh,a
 655  0035 cd0000        	call	_hal_nrf_write_reg
 657                     ; 79       if(auto_ack)
 659  0038 7b03          	ld	a,(OFST+2,sp)
 660  003a 2718          	jreq	L152
 661                     ; 80         hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) | SET_BIT(pipe_num));
 663  003c 7b02          	ld	a,(OFST+1,sp)
 664  003e 5f            	clrw	x
 665  003f 97            	ld	xl,a
 666  0040 a601          	ld	a,#1
 667  0042 5d            	tnzw	x
 668  0043 2704          	jreq	L001
 669  0045               L201:
 670  0045 48            	sll	a
 671  0046 5a            	decw	x
 672  0047 26fc          	jrne	L201
 673  0049               L001:
 674  0049 6b01          	ld	(OFST+0,sp),a
 675  004b a601          	ld	a,#1
 676  004d cd0000        	call	_hal_nrf_read_reg
 678  0050 1a01          	or	a,(OFST+0,sp)
 681  0052 2017          	jp	LC002
 682  0054               L152:
 683                     ; 82         hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) & ~SET_BIT(pipe_num));
 685  0054 7b02          	ld	a,(OFST+1,sp)
 686  0056 5f            	clrw	x
 687  0057 97            	ld	xl,a
 688  0058 a601          	ld	a,#1
 689  005a 5d            	tnzw	x
 690  005b 2704          	jreq	L011
 691  005d               L211:
 692  005d 48            	sll	a
 693  005e 5a            	decw	x
 694  005f 26fc          	jrne	L211
 695  0061               L011:
 696  0061 43            	cpl	a
 697  0062 6b01          	ld	(OFST+0,sp),a
 698  0064 a601          	ld	a,#1
 699  0066 cd0000        	call	_hal_nrf_read_reg
 701  0069 1401          	and	a,(OFST+0,sp)
 702  006b               LC002:
 703  006b 97            	ld	xl,a
 704  006c a601          	ld	a,#1
 705  006e 95            	ld	xh,a
 707  006f 2012          	jp	LC001
 708  0071               L371:
 709                     ; 85     case HAL_NRF_ALL:
 709                     ; 86       hal_nrf_write_reg(EN_RXADDR, ~(BIT_7|BIT_6));
 711  0071 ae023f        	ldw	x,#575
 712  0074 cd0000        	call	_hal_nrf_write_reg
 714                     ; 88       if(auto_ack)
 716  0077 7b03          	ld	a,(OFST+2,sp)
 717  0079 2705          	jreq	L552
 718                     ; 89         hal_nrf_write_reg(EN_AA, ~(BIT_7|BIT_6));
 720  007b ae013f        	ldw	x,#319
 723  007e 2003          	jp	LC001
 724  0080               L552:
 725                     ; 91         hal_nrf_write_reg(EN_AA, 0);
 727  0080 ae0100        	ldw	x,#256
 728  0083               LC001:
 729  0083 cd0000        	call	_hal_nrf_write_reg
 731                     ; 94     default:
 731                     ; 95       break;
 733  0086               L742:
 734                     ; 97 }
 737  0086 5b03          	addw	sp,#3
 738  0088 81            	ret	
 775                     ; 99 void hal_nrf_close_pipe(hal_nrf_address_t pipe_num)
 775                     ; 100 {
 776                     .text:	section	.text,new
 777  0000               _hal_nrf_close_pipe:
 779  0000 88            	push	a
 780  0001 88            	push	a
 781       00000001      OFST:	set	1
 784                     ; 101   switch(pipe_num)
 787                     ; 118     default:
 787                     ; 119       break;
 788  0002 4d            	tnz	a
 789  0003 2715          	jreq	L162
 790  0005 4a            	dec	a
 791  0006 2712          	jreq	L162
 792  0008 4a            	dec	a
 793  0009 270f          	jreq	L162
 794  000b 4a            	dec	a
 795  000c 270c          	jreq	L162
 796  000e 4a            	dec	a
 797  000f 2709          	jreq	L162
 798  0011 4a            	dec	a
 799  0012 2706          	jreq	L162
 800  0014 a0fa          	sub	a,#250
 801  0016 273d          	jreq	L362
 802  0018 2047          	jra	L703
 803  001a               L162:
 804                     ; 103     case HAL_NRF_PIPE0:
 804                     ; 104     case HAL_NRF_PIPE1:
 804                     ; 105     case HAL_NRF_PIPE2:
 804                     ; 106     case HAL_NRF_PIPE3:
 804                     ; 107     case HAL_NRF_PIPE4:
 804                     ; 108     case HAL_NRF_PIPE5:
 804                     ; 109       hal_nrf_write_reg(EN_RXADDR, hal_nrf_read_reg(EN_RXADDR) & ~SET_BIT(pipe_num));
 806  001a 7b02          	ld	a,(OFST+1,sp)
 807  001c 5f            	clrw	x
 808  001d 97            	ld	xl,a
 809  001e a601          	ld	a,#1
 810  0020 5d            	tnzw	x
 811  0021 2704          	jreq	L031
 812  0023               L231:
 813  0023 48            	sll	a
 814  0024 5a            	decw	x
 815  0025 26fc          	jrne	L231
 816  0027               L031:
 817  0027 43            	cpl	a
 818  0028 6b01          	ld	(OFST+0,sp),a
 819  002a a602          	ld	a,#2
 820  002c cd0000        	call	_hal_nrf_read_reg
 822  002f 1401          	and	a,(OFST+0,sp)
 823  0031 97            	ld	xl,a
 824  0032 a602          	ld	a,#2
 825  0034 95            	ld	xh,a
 826  0035 cd0000        	call	_hal_nrf_write_reg
 828                     ; 110       hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) & ~SET_BIT(pipe_num));
 830  0038 7b02          	ld	a,(OFST+1,sp)
 831  003a 5f            	clrw	x
 832  003b 97            	ld	xl,a
 833  003c a601          	ld	a,#1
 834  003e 5d            	tnzw	x
 835  003f 2704          	jreq	L041
 836  0041               L241:
 837  0041 48            	sll	a
 838  0042 5a            	decw	x
 839  0043 26fc          	jrne	L241
 840  0045               L041:
 841  0045 43            	cpl	a
 842  0046 6b01          	ld	(OFST+0,sp),a
 843  0048 a601          	ld	a,#1
 844  004a cd0000        	call	_hal_nrf_read_reg
 846  004d 1401          	and	a,(OFST+0,sp)
 847  004f 97            	ld	xl,a
 848  0050 a601          	ld	a,#1
 849  0052 95            	ld	xh,a
 851                     ; 111       break;
 853  0053 2009          	jp	LC003
 854  0055               L362:
 855                     ; 113     case HAL_NRF_ALL:
 855                     ; 114       hal_nrf_write_reg(EN_RXADDR, 0);
 857  0055 ae0200        	ldw	x,#512
 858  0058 cd0000        	call	_hal_nrf_write_reg
 860                     ; 115       hal_nrf_write_reg(EN_AA, 0);
 862  005b ae0100        	ldw	x,#256
 863  005e               LC003:
 864  005e cd0000        	call	_hal_nrf_write_reg
 866                     ; 116       break;
 868                     ; 118     default:
 868                     ; 119       break;
 870  0061               L703:
 871                     ; 121 }
 874  0061 85            	popw	x
 875  0062 81            	ret	
 923                     ; 123 void hal_nrf_set_address(hal_nrf_address_t address, uint8_t *addr)
 923                     ; 124 {
 924                     .text:	section	.text,new
 925  0000               _hal_nrf_set_address:
 927  0000 88            	push	a
 928       00000000      OFST:	set	0
 931                     ; 125   switch(address)
 934                     ; 140     default:
 934                     ; 141       break;
 935  0001 4d            	tnz	a
 936  0002 2712          	jreq	L113
 937  0004 4a            	dec	a
 938  0005 270f          	jreq	L113
 939  0007 4a            	dec	a
 940  0008 271a          	jreq	L313
 941  000a 4a            	dec	a
 942  000b 2717          	jreq	L313
 943  000d 4a            	dec	a
 944  000e 2714          	jreq	L313
 945  0010 4a            	dec	a
 946  0011 2711          	jreq	L313
 947  0013 4a            	dec	a
 948  0014 261a          	jrne	L343
 949  0016               L113:
 950                     ; 127     case HAL_NRF_TX:
 950                     ; 128     case HAL_NRF_PIPE0:
 950                     ; 129     case HAL_NRF_PIPE1:
 950                     ; 130       hal_nrf_write_multibyte_reg((uint8_t) address, addr, 0);
 952  0016 4b00          	push	#0
 953  0018 1e05          	ldw	x,(OFST+5,sp)
 954  001a 89            	pushw	x
 955  001b 7b04          	ld	a,(OFST+4,sp)
 956  001d cd0000        	call	_hal_nrf_write_multibyte_reg
 958  0020 5b03          	addw	sp,#3
 959                     ; 131       break;
 961  0022 200c          	jra	L343
 962  0024               L313:
 963                     ; 133     case HAL_NRF_PIPE2:
 963                     ; 134     case HAL_NRF_PIPE3:
 963                     ; 135     case HAL_NRF_PIPE4:
 963                     ; 136     case HAL_NRF_PIPE5:
 963                     ; 137       hal_nrf_write_reg(RX_ADDR_P0 + (uint8_t) address, *addr);
 965  0024 1e04          	ldw	x,(OFST+4,sp)
 966  0026 f6            	ld	a,(x)
 967  0027 97            	ld	xl,a
 968  0028 7b01          	ld	a,(OFST+1,sp)
 969  002a ab0a          	add	a,#10
 970  002c 95            	ld	xh,a
 971  002d cd0000        	call	_hal_nrf_write_reg
 973                     ; 138       break;
 975                     ; 140     default:
 975                     ; 141       break;
 977  0030               L343:
 978                     ; 143 }
 981  0030 84            	pop	a
 982  0031 81            	ret	
1027                     ; 145 void hal_nrf_set_auto_retr(uint8_t retr, uint16_t delay)
1027                     ; 146 {
1028                     .text:	section	.text,new
1029  0000               _hal_nrf_set_auto_retr:
1031  0000 88            	push	a
1032       00000000      OFST:	set	0
1035                     ; 147   hal_nrf_write_reg(SETUP_RETR, (((delay/250)-1)<<4) | retr);
1037  0001 1e04          	ldw	x,(OFST+4,sp)
1038  0003 a6fa          	ld	a,#250
1039  0005 62            	div	x,a
1040  0006 58            	sllw	x
1041  0007 58            	sllw	x
1042  0008 58            	sllw	x
1043  0009 58            	sllw	x
1044  000a 1d0010        	subw	x,#16
1045  000d 01            	rrwa	x,a
1046  000e 1a01          	or	a,(OFST+1,sp)
1047                     
1048  0010 97            	ld	xl,a
1049  0011 a604          	ld	a,#4
1050  0013 95            	ld	xh,a
1051  0014 cd0000        	call	_hal_nrf_write_reg
1053                     ; 148 }
1056  0017 84            	pop	a
1057  0018 81            	ret	
1121                     ; 150 void hal_nrf_set_address_width(hal_nrf_address_width_t address_width)
1121                     ; 151 {
1122                     .text:	section	.text,new
1123  0000               _hal_nrf_set_address_width:
1127                     ; 152   hal_nrf_write_reg(SETUP_AW, (UINT8(address_width) - 2));
1129  0000 a002          	sub	a,#2
1130  0002 97            	ld	xl,a
1131  0003 a603          	ld	a,#3
1132  0005 95            	ld	xh,a
1134                     ; 153 }
1137  0006 cc0000        	jp	_hal_nrf_write_reg
1182                     ; 155 void hal_nrf_set_rx_pload_width(uint8_t pipe_num, uint8_t pload_width)
1182                     ; 156 {
1183                     .text:	section	.text,new
1184  0000               _hal_nrf_set_rx_pload_width:
1186  0000 89            	pushw	x
1187       00000000      OFST:	set	0
1190                     ; 157   hal_nrf_write_reg(RX_PW_P0 + pipe_num, pload_width);
1192  0001 7b01          	ld	a,(OFST+1,sp)
1193  0003 ab11          	add	a,#17
1194  0005 95            	ld	xh,a
1195  0006 cd0000        	call	_hal_nrf_write_reg
1197                     ; 158 }
1200  0009 85            	popw	x
1201  000a 81            	ret	
1226                     ; 160 uint8_t hal_nrf_get_crc_mode(void)
1226                     ; 161 {
1227                     .text:	section	.text,new
1228  0000               _hal_nrf_get_crc_mode:
1232                     ; 162   return (hal_nrf_read_reg(CONFIG) & (BIT_3|BIT_2)) >> CRCO;
1234  0000 4f            	clr	a
1235  0001 cd0000        	call	_hal_nrf_read_reg
1237  0004 a40c          	and	a,#12
1238  0006 44            	srl	a
1239  0007 44            	srl	a
1242  0008 81            	ret	
1296                     ; 165 uint8_t hal_nrf_get_pipe_status(uint8_t pipe_num)
1296                     ; 166 {
1297                     .text:	section	.text,new
1298  0000               _hal_nrf_get_pipe_status:
1300  0000 88            	push	a
1301  0001 5203          	subw	sp,#3
1302       00000003      OFST:	set	3
1305                     ; 169   en_rx = hal_nrf_read_reg(EN_RXADDR) & (1<<pipe_num);
1307  0003 5f            	clrw	x
1308  0004 97            	ld	xl,a
1309  0005 a601          	ld	a,#1
1310  0007 5d            	tnzw	x
1311  0008 2704          	jreq	L202
1312  000a               L402:
1313  000a 48            	sll	a
1314  000b 5a            	decw	x
1315  000c 26fc          	jrne	L402
1316  000e               L202:
1317  000e 6b01          	ld	(OFST-2,sp),a
1318  0010 a602          	ld	a,#2
1319  0012 cd0000        	call	_hal_nrf_read_reg
1321  0015 1401          	and	a,(OFST-2,sp)
1322  0017 6b02          	ld	(OFST-1,sp),a
1323                     ; 170   en_aa = hal_nrf_read_reg(EN_AA) & (1<<pipe_num);
1325  0019 5f            	clrw	x
1326  001a 7b04          	ld	a,(OFST+1,sp)
1327  001c 97            	ld	xl,a
1328  001d a601          	ld	a,#1
1329  001f 5d            	tnzw	x
1330  0020 2704          	jreq	L012
1331  0022               L212:
1332  0022 48            	sll	a
1333  0023 5a            	decw	x
1334  0024 26fc          	jrne	L212
1335  0026               L012:
1336  0026 6b01          	ld	(OFST-2,sp),a
1337  0028 a601          	ld	a,#1
1338  002a cd0000        	call	_hal_nrf_read_reg
1340  002d 1401          	and	a,(OFST-2,sp)
1341  002f 6b03          	ld	(OFST+0,sp),a
1342                     ; 172   en_rx >>= pipe_num;
1344  0031 5f            	clrw	x
1345  0032 7b04          	ld	a,(OFST+1,sp)
1346  0034 97            	ld	xl,a
1347  0035 7b02          	ld	a,(OFST-1,sp)
1348  0037 5d            	tnzw	x
1349  0038 2704          	jreq	L612
1350  003a               L022:
1351  003a 44            	srl	a
1352  003b 5a            	decw	x
1353  003c 26fc          	jrne	L022
1354  003e               L612:
1355  003e 6b02          	ld	(OFST-1,sp),a
1356                     ; 173   en_aa >>= pipe_num;
1358  0040 5f            	clrw	x
1359  0041 7b04          	ld	a,(OFST+1,sp)
1360  0043 97            	ld	xl,a
1361  0044 7b03          	ld	a,(OFST+0,sp)
1362  0046 5d            	tnzw	x
1363  0047 2704          	jreq	L222
1364  0049               L422:
1365  0049 44            	srl	a
1366  004a 5a            	decw	x
1367  004b 26fc          	jrne	L422
1368  004d               L222:
1369  004d 6b03          	ld	(OFST+0,sp),a
1370                     ; 175   return (en_aa << 1) + en_rx;
1372  004f 48            	sll	a
1373  0050 1b02          	add	a,(OFST-1,sp)
1376  0052 5b04          	addw	sp,#4
1377  0054 81            	ret	
1425                     ; 178 uint8_t hal_nrf_get_address(uint8_t address, uint8_t *addr)
1425                     ; 179 {
1426                     .text:	section	.text,new
1427  0000               _hal_nrf_get_address:
1429  0000 88            	push	a
1430       00000000      OFST:	set	0
1433                     ; 180   switch(address)
1436                     ; 189       return hal_nrf_get_address_width();
1437  0001 4d            	tnz	a
1438  0002 2717          	jreq	L774
1439  0004 4a            	dec	a
1440  0005 2714          	jreq	L774
1441  0007 a005          	sub	a,#5
1442  0009 2710          	jreq	L774
1443                     ; 187     default:
1443                     ; 188       *addr = hal_nrf_read_reg(RX_ADDR_P0 + address);
1445  000b 7b01          	ld	a,(OFST+1,sp)
1446  000d ab0a          	add	a,#10
1447  000f cd0000        	call	_hal_nrf_read_reg
1449  0012 1e04          	ldw	x,(OFST+4,sp)
1450  0014 f7            	ld	(x),a
1451                     ; 189       return hal_nrf_get_address_width();
1453  0015 cd0000        	call	_hal_nrf_get_address_width
1457  0018 5b01          	addw	sp,#1
1458  001a 81            	ret	
1459  001b               L774:
1460                     ; 182     case HAL_NRF_PIPE0:
1460                     ; 183     case HAL_NRF_PIPE1:
1460                     ; 184     case HAL_NRF_TX:
1460                     ; 185       return hal_nrf_read_multibyte_reg(address, addr);
1462  001b 1e04          	ldw	x,(OFST+4,sp)
1463  001d 89            	pushw	x
1464  001e 7b03          	ld	a,(OFST+3,sp)
1465  0020 cd0000        	call	_hal_nrf_read_multibyte_reg
1467  0023 5b02          	addw	sp,#2
1468  0025 9f            	ld	a,xl
1471  0026 5b01          	addw	sp,#1
1472  0028 81            	ret	
1497                     ; 193 uint8_t hal_nrf_get_auto_retr_status(void)
1497                     ; 194 {
1498                     .text:	section	.text,new
1499  0000               _hal_nrf_get_auto_retr_status:
1503                     ; 195   return hal_nrf_read_reg(OBSERVE_TX);
1505  0000 a608          	ld	a,#8
1509  0002 cc0000        	jp	_hal_nrf_read_reg
1534                     ; 198 uint8_t hal_nrf_get_packet_lost_ctr(void)
1534                     ; 199 {
1535                     .text:	section	.text,new
1536  0000               _hal_nrf_get_packet_lost_ctr:
1540                     ; 200   return (hal_nrf_read_reg(OBSERVE_TX) & (BIT_7|BIT_6|BIT_5|BIT_4)) >> 4;
1542  0000 a608          	ld	a,#8
1543  0002 cd0000        	call	_hal_nrf_read_reg
1545  0005 4e            	swap	a
1546  0006 a40f          	and	a,#15
1549  0008 81            	ret	
1574                     ; 203 uint8_t hal_nrf_get_address_width(void)
1574                     ; 204 {
1575                     .text:	section	.text,new
1576  0000               _hal_nrf_get_address_width:
1580                     ; 205   return (hal_nrf_read_reg(SETUP_AW) + 2);
1582  0000 a603          	ld	a,#3
1583  0002 cd0000        	call	_hal_nrf_read_reg
1585  0005 ab02          	add	a,#2
1588  0007 81            	ret	
1624                     ; 208 uint8_t hal_nrf_get_rx_pload_width(uint8_t pipe_num)
1624                     ; 209 {
1625                     .text:	section	.text,new
1626  0000               _hal_nrf_get_rx_pload_width:
1630                     ; 210   return hal_nrf_read_reg(RX_PW_P0 + pipe_num);
1632  0000 ab11          	add	a,#17
1636  0002 cc0000        	jp	_hal_nrf_read_reg
1694                     ; 213 void hal_nrf_set_operation_mode(hal_nrf_operation_mode_t op_mode)
1694                     ; 214 {
1695                     .text:	section	.text,new
1696  0000               _hal_nrf_set_operation_mode:
1700                     ; 215   if(op_mode == HAL_NRF_PRX)
1702  0000 4a            	dec	a
1703  0001 2607          	jrne	L526
1704                     ; 217     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) | (1<<PRIM_RX)));
1706  0003 cd0000        	call	_hal_nrf_read_reg
1708  0006 aa01          	or	a,#1
1711  0008 2006          	jra	L726
1712  000a               L526:
1713                     ; 221     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) & ~(1<<PRIM_RX)));
1715  000a 4f            	clr	a
1716  000b cd0000        	call	_hal_nrf_read_reg
1718  000e a4fe          	and	a,#254
1720  0010               L726:
1721  0010 97            	ld	xl,a
1722  0011 4f            	clr	a
1723  0012 95            	ld	xh,a
1724                     ; 223 }
1727  0013 cc0000        	jp	_hal_nrf_write_reg
1785                     ; 225 void hal_nrf_set_power_mode(hal_nrf_pwr_mode_t pwr_mode)
1785                     ; 226 {
1786                     .text:	section	.text,new
1787  0000               _hal_nrf_set_power_mode:
1791                     ; 227   if(pwr_mode == HAL_NRF_PWR_UP)
1793  0000 4a            	dec	a
1794  0001 2607          	jrne	L756
1795                     ; 229     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) | (1<<PWR_UP)));
1797  0003 cd0000        	call	_hal_nrf_read_reg
1799  0006 aa02          	or	a,#2
1802  0008 2006          	jra	L166
1803  000a               L756:
1804                     ; 233     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) & ~(1<<PWR_UP)));
1806  000a 4f            	clr	a
1807  000b cd0000        	call	_hal_nrf_read_reg
1809  000e a4fd          	and	a,#253
1811  0010               L166:
1812  0010 97            	ld	xl,a
1813  0011 4f            	clr	a
1814  0012 95            	ld	xh,a
1815                     ; 235 }
1818  0013 cc0000        	jp	_hal_nrf_write_reg
1854                     ; 237 void hal_nrf_set_rf_channel(uint8_t channel)
1854                     ; 238 {
1855                     .text:	section	.text,new
1856  0000               _hal_nrf_set_rf_channel:
1860                     ; 239   hal_nrf_write_reg(RF_CH, channel);
1862  0000 97            	ld	xl,a
1863  0001 a605          	ld	a,#5
1864  0003 95            	ld	xh,a
1866                     ; 240 }
1869  0004 cc0000        	jp	_hal_nrf_write_reg
1941                     ; 242 void hal_nrf_set_output_power(hal_nrf_output_power_t power)
1941                     ; 243 {
1942                     .text:	section	.text,new
1943  0000               _hal_nrf_set_output_power:
1945  0000 88            	push	a
1946       00000001      OFST:	set	1
1949                     ; 244   hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~((1<<RF_PWR1)|(1<<RF_PWR0))) | (UINT8(power)<<1));
1951  0001 48            	sll	a
1952  0002 6b01          	ld	(OFST+0,sp),a
1953  0004 a606          	ld	a,#6
1954  0006 cd0000        	call	_hal_nrf_read_reg
1956  0009 a4f9          	and	a,#249
1957  000b 1a01          	or	a,(OFST+0,sp)
1958  000d 97            	ld	xl,a
1959  000e a606          	ld	a,#6
1960  0010 95            	ld	xh,a
1961  0011 cd0000        	call	_hal_nrf_write_reg
1963                     ; 245 }
1966  0014 84            	pop	a
1967  0015 81            	ret	
2032                     ; 247 void hal_nrf_set_datarate(hal_nrf_datarate_t datarate)
2032                     ; 248 {
2033                     .text:	section	.text,new
2034  0000               _hal_nrf_set_datarate:
2038                     ; 249   switch(datarate)
2041                     ; 266     default: break;
2042  0000 4d            	tnz	a
2043  0001 2707          	jreq	L337
2044  0003 4a            	dec	a
2045  0004 270f          	jreq	L537
2046  0006 4a            	dec	a
2047  0007 2715          	jreq	L737
2049  0009 81            	ret	
2050  000a               L337:
2051                     ; 253       hal_nrf_write_reg(RF_SETUP, ( (hal_nrf_read_reg(RF_SETUP)|(1<<RF_DR_LOW)) & ~(1<< RF_DR_HIGH) ));
2053  000a a606          	ld	a,#6
2054  000c cd0000        	call	_hal_nrf_read_reg
2056  000f a4f7          	and	a,#247
2057  0011 aa20          	or	a,#32
2059                     ; 254       break;  
2061  0013 2012          	jp	LC004
2062  0015               L537:
2063                     ; 258       hal_nrf_write_reg(RF_SETUP, ( hal_nrf_read_reg(RF_SETUP) & ~(1<<RF_DR_HIGH | 1<<RF_DR_LOW) ));
2065  0015 a606          	ld	a,#6
2066  0017 cd0000        	call	_hal_nrf_read_reg
2068  001a a4d7          	and	a,#215
2070                     ; 259       break;  
2072  001c 2009          	jp	LC004
2073  001e               L737:
2074                     ; 263       hal_nrf_write_reg(RF_SETUP, ( (hal_nrf_read_reg(RF_SETUP)|(1<<RF_DR_HIGH)) & ~(1<< RF_DR_LOW) ));
2076  001e a606          	ld	a,#6
2077  0020 cd0000        	call	_hal_nrf_read_reg
2079  0023 a4df          	and	a,#223
2080  0025 aa08          	or	a,#8
2081  0027               LC004:
2082  0027 97            	ld	xl,a
2083  0028 a606          	ld	a,#6
2084  002a 95            	ld	xh,a
2086                     ; 264       break;  
2088                     ; 266     default: break;
2090                     ; 268 }
2093  002b cc0000        	jp	_hal_nrf_write_reg
2118                     ; 270 uint8_t hal_nrf_get_operation_mode(void)
2118                     ; 271 {
2119                     .text:	section	.text,new
2120  0000               _hal_nrf_get_operation_mode:
2124                     ; 272   return (hal_nrf_read_reg(CONFIG) & (1<<PRIM_RX)) >> PRIM_RX;
2126  0000 4f            	clr	a
2127  0001 cd0000        	call	_hal_nrf_read_reg
2129  0004 5f            	clrw	x
2130  0005               L633:
2131  0005 44            	srl	a
2132  0006 5a            	decw	x
2133  0007 26fc          	jrne	L633
2134  0009 a401          	and	a,#1
2137  000b 81            	ret	
2162                     ; 275 uint8_t hal_nrf_get_power_mode(void)
2162                     ; 276 {
2163                     .text:	section	.text,new
2164  0000               _hal_nrf_get_power_mode:
2168                     ; 277   return (hal_nrf_read_reg(CONFIG) & (1<<PWR_UP)) >> PWR_UP;
2170  0000 4f            	clr	a
2171  0001 cd0000        	call	_hal_nrf_read_reg
2173  0004 a402          	and	a,#2
2174  0006 44            	srl	a
2177  0007 81            	ret	
2202                     ; 280 uint8_t hal_nrf_get_rf_channel(void)
2202                     ; 281 {
2203                     .text:	section	.text,new
2204  0000               _hal_nrf_get_rf_channel:
2208                     ; 282   return hal_nrf_read_reg(RF_CH);
2210  0000 a605          	ld	a,#5
2214  0002 cc0000        	jp	_hal_nrf_read_reg
2239                     ; 285 uint8_t hal_nrf_get_output_power(void)
2239                     ; 286 {
2240                     .text:	section	.text,new
2241  0000               _hal_nrf_get_output_power:
2245                     ; 287   return (hal_nrf_read_reg(RF_SETUP) & ((1<<RF_PWR1)|(1<<RF_PWR0))) >> RF_PWR0;
2247  0000 a606          	ld	a,#6
2248  0002 cd0000        	call	_hal_nrf_read_reg
2250  0005 a406          	and	a,#6
2251  0007 44            	srl	a
2254  0008 81            	ret	
2290                     ; 290 uint8_t hal_nrf_get_datarate(void)
2290                     ; 291 {
2291                     .text:	section	.text,new
2292  0000               _hal_nrf_get_datarate:
2294  0000 89            	pushw	x
2295       00000002      OFST:	set	2
2298                     ; 292   uint8_t tmp = hal_nrf_read_reg(RF_SETUP);
2300  0001 a606          	ld	a,#6
2301  0003 cd0000        	call	_hal_nrf_read_reg
2303  0006 6b02          	ld	(OFST+0,sp),a
2304                     ; 293   return ((tmp & (1<<RF_DR_HIGH)) >> (RF_DR_HIGH-1)) | ((tmp & (1<<RF_DR_LOW)) >> (RF_DR_LOW));
2306  0008 4e            	swap	a
2307  0009 a402          	and	a,#2
2308  000b 44            	srl	a
2309  000c 6b01          	ld	(OFST-1,sp),a
2310  000e 7b02          	ld	a,(OFST+0,sp)
2311  0010 a408          	and	a,#8
2312  0012 44            	srl	a
2313  0013 44            	srl	a
2314  0014 1a01          	or	a,(OFST-1,sp)
2317  0016 85            	popw	x
2318  0017 81            	ret	
2344                     ; 296 bool hal_nrf_rx_fifo_empty(void)
2344                     ; 297 {
2345                     .text:	section	.text,new
2346  0000               _hal_nrf_rx_fifo_empty:
2350                     ; 298  if(hal_nrf_get_rx_data_source()==7)
2352  0000 cd0000        	call	_hal_nrf_get_rx_data_source
2354  0003 a107          	cp	a,#7
2355  0005 2603          	jrne	L5601
2356                     ; 300     return TRUE;
2358  0007 a601          	ld	a,#1
2361  0009 81            	ret	
2362  000a               L5601:
2363                     ; 304     return FALSE;
2365  000a 4f            	clr	a
2368  000b 81            	ret	
2394                     ; 308 bool hal_nrf_rx_fifo_full(void)
2394                     ; 309 {
2395                     .text:	section	.text,new
2396  0000               _hal_nrf_rx_fifo_full:
2400                     ; 310   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> RX_EMPTY) & 1);
2402  0000 a617          	ld	a,#23
2403  0002 cd0000        	call	_hal_nrf_read_reg
2405  0005 a401          	and	a,#1
2408  0007 81            	ret	
2434                     ; 313 bool hal_nrf_tx_fifo_empty(void)
2434                     ; 314 {
2435                     .text:	section	.text,new
2436  0000               _hal_nrf_tx_fifo_empty:
2440                     ; 315   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> TX_EMPTY) & 1);
2442  0000 a617          	ld	a,#23
2443  0002 cd0000        	call	_hal_nrf_read_reg
2445  0005 4e            	swap	a
2446  0006 a401          	and	a,#1
2449  0008 81            	ret	
2475                     ; 318 bool hal_nrf_tx_fifo_full(void)
2475                     ; 319 {
2476                     .text:	section	.text,new
2477  0000               _hal_nrf_tx_fifo_full:
2481                     ; 320   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> TX_FIFO_FULL) & 1);
2483  0000 a617          	ld	a,#23
2484  0002 cd0000        	call	_hal_nrf_read_reg
2486  0005 4e            	swap	a
2487  0006 a402          	and	a,#2
2488  0008 44            	srl	a
2491  0009 81            	ret	
2516                     ; 323 uint8_t hal_nrf_get_tx_fifo_status(void)
2516                     ; 324 {
2517                     .text:	section	.text,new
2518  0000               _hal_nrf_get_tx_fifo_status:
2522                     ; 325   return ((hal_nrf_read_reg(FIFO_STATUS) & ((1<<TX_FIFO_FULL)|(1<<TX_EMPTY))) >> 4);
2524  0000 a617          	ld	a,#23
2525  0002 cd0000        	call	_hal_nrf_read_reg
2527  0005 4e            	swap	a
2528  0006 a403          	and	a,#3
2531  0008 81            	ret	
2556                     ; 328 uint8_t hal_nrf_get_rx_fifo_status(void)
2556                     ; 329 {
2557                     .text:	section	.text,new
2558  0000               _hal_nrf_get_rx_fifo_status:
2562                     ; 330   return (hal_nrf_read_reg(FIFO_STATUS) & ((1<<RX_FULL)|(1<<RX_EMPTY)));
2564  0000 a617          	ld	a,#23
2565  0002 cd0000        	call	_hal_nrf_read_reg
2567  0005 a403          	and	a,#3
2570  0007 81            	ret	
2595                     ; 333 uint8_t hal_nrf_get_fifo_status(void)
2595                     ; 334 {
2596                     .text:	section	.text,new
2597  0000               _hal_nrf_get_fifo_status:
2601                     ; 335   return hal_nrf_read_reg(FIFO_STATUS);
2603  0000 a617          	ld	a,#23
2607  0002 cc0000        	jp	_hal_nrf_read_reg
2632                     ; 338 uint8_t hal_nrf_get_transmit_attempts(void)
2632                     ; 339 {
2633                     .text:	section	.text,new
2634  0000               _hal_nrf_get_transmit_attempts:
2638                     ; 340   return hal_nrf_read_reg(OBSERVE_TX) & (BIT_3|BIT_2|BIT_1|BIT_0);
2640  0000 a608          	ld	a,#8
2641  0002 cd0000        	call	_hal_nrf_read_reg
2643  0005 a40f          	and	a,#15
2646  0007 81            	ret	
2672                     ; 343 bool hal_nrf_get_carrier_detect(void)
2672                     ; 344 {
2673                     .text:	section	.text,new
2674  0000               _hal_nrf_get_carrier_detect:
2678                     ; 345   return hal_nrf_read_reg(CD) & 1;
2680  0000 a609          	ld	a,#9
2681  0002 cd0000        	call	_hal_nrf_read_reg
2683  0005 a401          	and	a,#1
2686  0007 81            	ret	
2732                     ; 348 void hal_nrf_write_tx_pload(uint8_t *tx_pload, uint8_t length)
2732                     ; 349 {
2733                     .text:	section	.text,new
2734  0000               _hal_nrf_write_tx_pload:
2736  0000 89            	pushw	x
2737       00000000      OFST:	set	0
2740                     ; 350   hal_nrf_write_multibyte_reg(UINT8(HAL_NRF_TX_PLOAD), tx_pload, length);
2742  0001 7b05          	ld	a,(OFST+5,sp)
2743  0003 88            	push	a
2744  0004 89            	pushw	x
2745  0005 a607          	ld	a,#7
2746  0007 cd0000        	call	_hal_nrf_write_multibyte_reg
2748  000a 5b03          	addw	sp,#3
2749                     ; 351 }
2752  000c 85            	popw	x
2753  000d 81            	ret	
2789                     ; 353 void hal_nrf_setup_dyn_pl(uint8_t setup)
2789                     ; 354 {
2790                     .text:	section	.text,new
2791  0000               _hal_nrf_setup_dyn_pl:
2795                     ; 355   hal_nrf_write_reg(DYNPD, setup & ~0xC0); 
2797  0000 a43f          	and	a,#63
2798  0002 97            	ld	xl,a
2799  0003 a61c          	ld	a,#28
2800  0005 95            	ld	xh,a
2802                     ; 356 }
2805  0006 cc0000        	jp	_hal_nrf_write_reg
2831                     ; 358 void hal_nrf_enable_dynamic_pl(void)
2831                     ; 359 {
2832                     .text:	section	.text,new
2833  0000               _hal_nrf_enable_dynamic_pl:
2837                     ; 360   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x04));   
2839  0000 a61d          	ld	a,#29
2840  0002 cd0000        	call	_hal_nrf_read_reg
2842  0005 aa04          	or	a,#4
2843  0007 97            	ld	xl,a
2844  0008 a61d          	ld	a,#29
2845  000a 95            	ld	xh,a
2847                     ; 361 }
2850  000b cc0000        	jp	_hal_nrf_write_reg
2876                     ; 363 void hal_nrf_disable_dynamic_pl(void)
2876                     ; 364 {
2877                     .text:	section	.text,new
2878  0000               _hal_nrf_disable_dynamic_pl:
2882                     ; 365   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x04));   
2884  0000 a61d          	ld	a,#29
2885  0002 cd0000        	call	_hal_nrf_read_reg
2887  0005 a4fb          	and	a,#251
2888  0007 97            	ld	xl,a
2889  0008 a61d          	ld	a,#29
2890  000a 95            	ld	xh,a
2892                     ; 366 }
2895  000b cc0000        	jp	_hal_nrf_write_reg
2921                     ; 368 void hal_nrf_enable_ack_pl(void)
2921                     ; 369 {
2922                     .text:	section	.text,new
2923  0000               _hal_nrf_enable_ack_pl:
2927                     ; 370   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x02));   
2929  0000 a61d          	ld	a,#29
2930  0002 cd0000        	call	_hal_nrf_read_reg
2932  0005 aa02          	or	a,#2
2933  0007 97            	ld	xl,a
2934  0008 a61d          	ld	a,#29
2935  000a 95            	ld	xh,a
2937                     ; 371 }
2940  000b cc0000        	jp	_hal_nrf_write_reg
2966                     ; 373 void hal_nrf_disable_ack_pl(void)
2966                     ; 374 {
2967                     .text:	section	.text,new
2968  0000               _hal_nrf_disable_ack_pl:
2972                     ; 375   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x02));   
2974  0000 a61d          	ld	a,#29
2975  0002 cd0000        	call	_hal_nrf_read_reg
2977  0005 a4fd          	and	a,#253
2978  0007 97            	ld	xl,a
2979  0008 a61d          	ld	a,#29
2980  000a 95            	ld	xh,a
2982                     ; 376 }
2985  000b cc0000        	jp	_hal_nrf_write_reg
3011                     ; 378 void hal_nrf_enable_dynamic_ack(void)
3011                     ; 379 {
3012                     .text:	section	.text,new
3013  0000               _hal_nrf_enable_dynamic_ack:
3017                     ; 380   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x01));   
3019  0000 a61d          	ld	a,#29
3020  0002 cd0000        	call	_hal_nrf_read_reg
3022  0005 aa01          	or	a,#1
3023  0007 97            	ld	xl,a
3024  0008 a61d          	ld	a,#29
3025  000a 95            	ld	xh,a
3027                     ; 381 }
3030  000b cc0000        	jp	_hal_nrf_write_reg
3056                     ; 383 void hal_nrf_disable_dynamic_ack(void)
3056                     ; 384 {
3057                     .text:	section	.text,new
3058  0000               _hal_nrf_disable_dynamic_ack:
3062                     ; 385   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x01));   
3064  0000 a61d          	ld	a,#29
3065  0002 cd0000        	call	_hal_nrf_read_reg
3067  0005 a4fe          	and	a,#254
3068  0007 97            	ld	xl,a
3069  0008 a61d          	ld	a,#29
3070  000a 95            	ld	xh,a
3072                     ; 386 }
3075  000b cc0000        	jp	_hal_nrf_write_reg
3130                     ; 388 void hal_nrf_write_ack_pload(uint8_t pipe, uint8_t *tx_pload, uint8_t length)
3130                     ; 389 {
3131                     .text:	section	.text,new
3132  0000               _hal_nrf_write_ack_pload:
3134  0000 88            	push	a
3135       00000000      OFST:	set	0
3138                     ; 390   CSN_LOW();
3140  0001 72135005      	bres	20485,#1
3141                     ; 392   hal_nrf_rw(WR_ACK_PLOAD | pipe);
3143  0005 aaa8          	or	a,#168
3146  0007 2006          	jra	L1431
3147  0009               L7331:
3148                     ; 395     hal_nrf_rw(*tx_pload++);
3150  0009 1e04          	ldw	x,(OFST+4,sp)
3151  000b f6            	ld	a,(x)
3152  000c 5c            	incw	x
3153  000d 1f04          	ldw	(OFST+4,sp),x
3155  000f               L1431:
3156  000f cd0000        	call	_hal_nrf_rw
3157                     ; 393   while(length--)
3159  0012 7b06          	ld	a,(OFST+6,sp)
3160  0014 0a06          	dec	(OFST+6,sp)
3161  0016 4d            	tnz	a
3162  0017 26f0          	jrne	L7331
3163                     ; 398   CSN_HIGH();
3165  0019 72125005      	bset	20485,#1
3166                     ; 399 }
3169  001d 84            	pop	a
3170  001e 81            	ret	
3206                     ; 401 uint8_t hal_nrf_read_rx_pl_w()
3206                     ; 402 {
3207                     .text:	section	.text,new
3208  0000               _hal_nrf_read_rx_pl_w:
3210  0000 88            	push	a
3211       00000001      OFST:	set	1
3214                     ; 405   CSN_LOW();
3216  0001 72135005      	bres	20485,#1
3217                     ; 407   hal_nrf_rw(RD_RX_PLOAD_W);
3219  0005 a660          	ld	a,#96
3220  0007 cd0000        	call	_hal_nrf_rw
3222                     ; 408   temp = hal_nrf_rw(0);
3224  000a 4f            	clr	a
3225  000b cd0000        	call	_hal_nrf_rw
3227  000e 6b01          	ld	(OFST+0,sp),a
3228                     ; 409   CSN_HIGH();
3230  0010 72125005      	bset	20485,#1
3231                     ; 411   return temp;
3235  0014 5b01          	addw	sp,#1
3236  0016 81            	ret	
3261                     ; 414 void hal_nrf_lock_unlock()
3261                     ; 415 {
3262                     .text:	section	.text,new
3263  0000               _hal_nrf_lock_unlock:
3267                     ; 416   CSN_LOW();
3269  0000 72135005      	bres	20485,#1
3270                     ; 418   hal_nrf_rw(LOCK_UNLOCK);             
3272  0004 a650          	ld	a,#80
3273  0006 cd0000        	call	_hal_nrf_rw
3275                     ; 419   hal_nrf_rw(0x73);
3277  0009 a673          	ld	a,#115
3278  000b cd0000        	call	_hal_nrf_rw
3280                     ; 421   CSN_HIGH();
3282  000e 72125005      	bset	20485,#1
3283                     ; 422 }
3286  0012 81            	ret	
3311                     ; 424 uint8_t hal_nrf_get_rx_data_source(void)
3311                     ; 425 {
3312                     .text:	section	.text,new
3313  0000               _hal_nrf_get_rx_data_source:
3317                     ; 426   return ((hal_nrf_nop() & (BIT_3|BIT_2|BIT_1)) >> 1);
3319  0000 cd0000        	call	_hal_nrf_nop
3321  0003 a40e          	and	a,#14
3322  0005 44            	srl	a
3325  0006 81            	ret	
3362                     ; 431 uint16_t hal_nrf_read_rx_pload(uint8_t *rx_pload)
3362                     ; 432 {
3363                     .text:	section	.text,new
3364  0000               _hal_nrf_read_rx_pload:
3368                     ; 433   return hal_nrf_read_multibyte_reg(UINT8(HAL_NRF_RX_PLOAD), rx_pload);
3370  0000 89            	pushw	x
3371  0001 a608          	ld	a,#8
3372  0003 cd0000        	call	_hal_nrf_read_multibyte_reg
3374  0006 5b02          	addw	sp,#2
3377  0008 81            	ret	
3401                     ; 436 void hal_nrf_reuse_tx(void)
3401                     ; 437 {
3402                     .text:	section	.text,new
3403  0000               _hal_nrf_reuse_tx:
3407                     ; 438   hal_nrf_write_reg(REUSE_TX_PL, 0);
3409  0000 aee300        	ldw	x,#58112
3411                     ; 439 }
3414  0003 cc0000        	jp	_hal_nrf_write_reg
3440                     ; 441 bool hal_nrf_get_reuse_tx_status(void)
3440                     ; 442 {
3441                     .text:	section	.text,new
3442  0000               _hal_nrf_get_reuse_tx_status:
3446                     ; 443   return (bool)((hal_nrf_get_fifo_status() & (1<<TX_REUSE)) >> TX_REUSE);
3448  0000 cd0000        	call	_hal_nrf_get_fifo_status
3450  0003 4e            	swap	a
3451  0004 a404          	and	a,#4
3452  0006 44            	srl	a
3453  0007 44            	srl	a
3456  0008 81            	ret	
3480                     ; 446 void hal_nrf_flush_rx(void)
3480                     ; 447 {
3481                     .text:	section	.text,new
3482  0000               _hal_nrf_flush_rx:
3486                     ; 448   hal_nrf_write_reg(FLUSH_RX, 0);
3488  0000 aee200        	ldw	x,#57856
3490                     ; 449 }
3493  0003 cc0000        	jp	_hal_nrf_write_reg
3517                     ; 451 void hal_nrf_flush_tx(void)
3517                     ; 452 {
3518                     .text:	section	.text,new
3519  0000               _hal_nrf_flush_tx:
3523                     ; 453   hal_nrf_write_reg(FLUSH_TX, 0);
3525  0000 aee100        	ldw	x,#57600
3527                     ; 454 }
3530  0003 cc0000        	jp	_hal_nrf_write_reg
3554                     ; 456 uint8_t hal_nrf_nop(void)
3554                     ; 457 {
3555                     .text:	section	.text,new
3556  0000               _hal_nrf_nop:
3560                     ; 458   return hal_nrf_write_reg(NOP,0);
3562  0000 aeff00        	ldw	x,#65280
3566  0003 cc0000        	jp	_hal_nrf_write_reg
3624                     ; 461 void hal_nrf_set_pll_mode(hal_nrf_pll_mode_t pll_mode)
3624                     ; 462 {
3625                     .text:	section	.text,new
3626  0000               _hal_nrf_set_pll_mode:
3630                     ; 463   if(pll_mode == HAL_NRF_PLL_LOCK)
3632  0000 4a            	dec	a
3633  0001 2609          	jrne	L7151
3634                     ; 465     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) | (1<<PLL_LOCK)));
3636  0003 a606          	ld	a,#6
3637  0005 cd0000        	call	_hal_nrf_read_reg
3639  0008 aa10          	or	a,#16
3642  000a 2007          	jra	L1251
3643  000c               L7151:
3644                     ; 469     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~(1<<PLL_LOCK)));
3646  000c a606          	ld	a,#6
3647  000e cd0000        	call	_hal_nrf_read_reg
3649  0011 a4ef          	and	a,#239
3651  0013               L1251:
3652  0013 97            	ld	xl,a
3653  0014 a606          	ld	a,#6
3654  0016 95            	ld	xh,a
3655                     ; 471 }
3658  0017 cc0000        	jp	_hal_nrf_write_reg
3684                     ; 473 hal_nrf_pll_mode_t hal_nrf_get_pll_mode(void)
3684                     ; 474 {
3685                     .text:	section	.text,new
3686  0000               _hal_nrf_get_pll_mode:
3690                     ; 475   return (hal_nrf_pll_mode_t)((hal_nrf_read_reg(RF_SETUP) & (1<<PLL_LOCK)) >> PLL_LOCK);
3692  0000 a606          	ld	a,#6
3693  0002 cd0000        	call	_hal_nrf_read_reg
3695  0005 4e            	swap	a
3696  0006 a401          	and	a,#1
3699  0008 81            	ret	
3757                     ; 478 void hal_nrf_set_lna_gain(hal_nrf_lna_mode_t lna_gain)
3757                     ; 479 {
3758                     .text:	section	.text,new
3759  0000               _hal_nrf_set_lna_gain:
3763                     ; 480   if(lna_gain == HAL_NRF_LNA_HCURR)
3765  0000 4a            	dec	a
3766  0001 2609          	jrne	L1651
3767                     ; 482     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) | (1<<LNA_HCURR)));
3769  0003 a606          	ld	a,#6
3770  0005 cd0000        	call	_hal_nrf_read_reg
3772  0008 aa01          	or	a,#1
3775  000a 2007          	jra	L3651
3776  000c               L1651:
3777                     ; 486     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~(1<<LNA_HCURR)));
3779  000c a606          	ld	a,#6
3780  000e cd0000        	call	_hal_nrf_read_reg
3782  0011 a4fe          	and	a,#254
3784  0013               L3651:
3785  0013 97            	ld	xl,a
3786  0014 a606          	ld	a,#6
3787  0016 95            	ld	xh,a
3788                     ; 488 }
3791  0017 cc0000        	jp	_hal_nrf_write_reg
3817                     ; 490 hal_nrf_lna_mode_t hal_nrf_get_lna_gain(void)
3817                     ; 491 {
3818                     .text:	section	.text,new
3819  0000               _hal_nrf_get_lna_gain:
3823                     ; 492   return (hal_nrf_lna_mode_t) ( (hal_nrf_read_reg(RF_SETUP) & (1<<LNA_HCURR)) >> LNA_HCURR );
3825  0000 a606          	ld	a,#6
3826  0002 cd0000        	call	_hal_nrf_read_reg
3828  0005 5f            	clrw	x
3829  0006               L216:
3830  0006 44            	srl	a
3831  0007 5a            	decw	x
3832  0008 26fc          	jrne	L216
3833  000a a401          	and	a,#1
3836  000c 81            	ret	
3880                     ; 495 uint8_t hal_nrf_read_reg(uint8_t reg)
3880                     ; 496 {
3881                     .text:	section	.text,new
3882  0000               _hal_nrf_read_reg:
3884  0000 88            	push	a
3885       00000001      OFST:	set	1
3888                     ; 498   CSN_LOW();
3890  0001 72135005      	bres	20485,#1
3891                     ; 499   hal_nrf_rw(reg);
3893  0005 cd0000        	call	_hal_nrf_rw
3895                     ; 500   temp = hal_nrf_rw(0);
3897  0008 4f            	clr	a
3898  0009 cd0000        	call	_hal_nrf_rw
3900  000c 6b01          	ld	(OFST+0,sp),a
3901                     ; 501   CSN_HIGH();
3903  000e 72125005      	bset	20485,#1
3904                     ; 503   return temp;
3908  0012 5b01          	addw	sp,#1
3909  0014 81            	ret	
3962                     ; 506 uint8_t hal_nrf_write_reg(uint8_t reg, uint8_t value)
3962                     ; 507 {
3963                     .text:	section	.text,new
3964  0000               _hal_nrf_write_reg:
3966  0000 89            	pushw	x
3967  0001 88            	push	a
3968       00000001      OFST:	set	1
3971                     ; 509   CSN_LOW();
3973  0002 72135005      	bres	20485,#1
3974                     ; 510   if(reg < WRITE_REG)   // i.e. this is a register access
3976  0006 9e            	ld	a,xh
3977  0007 a120          	cp	a,#32
3978  0009 2405          	jruge	L5461
3979                     ; 512     retval = hal_nrf_rw(WRITE_REG + reg);
3981  000b 9e            	ld	a,xh
3982  000c ab20          	add	a,#32
3984                     ; 513     hal_nrf_rw(value);
3987  000e 2012          	jp	LC005
3988  0010               L5461:
3989                     ; 517     if(!(reg == FLUSH_TX) && !(reg == FLUSH_RX) && !(reg == REUSE_TX_PL) && !(reg == NOP))
3991  0010 7b02          	ld	a,(OFST+1,sp)
3992  0012 a1e1          	cp	a,#225
3993  0014 2718          	jreq	L1561
3995  0016 a1e2          	cp	a,#226
3996  0018 2714          	jreq	L1561
3998  001a a1e3          	cp	a,#227
3999  001c 2710          	jreq	L1561
4001  001e a1ff          	cp	a,#255
4002  0020 270c          	jreq	L1561
4003                     ; 519       retval = hal_nrf_rw(reg);
4006                     ; 520       hal_nrf_rw(value);
4008  0022               LC005:
4009  0022 cd0000        	call	_hal_nrf_rw
4010  0025 6b01          	ld	(OFST+0,sp),a
4012  0027 7b03          	ld	a,(OFST+2,sp)
4013  0029 cd0000        	call	_hal_nrf_rw
4016  002c 2005          	jra	L7461
4017  002e               L1561:
4018                     ; 524       retval = hal_nrf_rw(reg);
4020  002e cd0000        	call	_hal_nrf_rw
4022  0031 6b01          	ld	(OFST+0,sp),a
4023  0033               L7461:
4024                     ; 527   CSN_HIGH();
4026  0033 72125005      	bset	20485,#1
4027                     ; 529   return retval;
4029  0037 7b01          	ld	a,(OFST+0,sp)
4032  0039 5b03          	addw	sp,#3
4033  003b 81            	ret	
4100                     ; 532 uint16_t hal_nrf_read_multibyte_reg(uint8_t reg, uint8_t *pbuf)
4100                     ; 533 {
4101                     .text:	section	.text,new
4102  0000               _hal_nrf_read_multibyte_reg:
4104  0000 88            	push	a
4105  0001 89            	pushw	x
4106       00000002      OFST:	set	2
4109                     ; 535   switch(reg)
4112                     ; 561       break;
4113  0002 4d            	tnz	a
4114  0003 270d          	jreq	L5561
4115  0005 4a            	dec	a
4116  0006 270a          	jreq	L5561
4117  0008 a005          	sub	a,#5
4118  000a 2706          	jreq	L5561
4119  000c a002          	sub	a,#2
4120  000e 2713          	jreq	L7561
4121                     ; 559     default:
4121                     ; 560       ctr = length = 0;
4122                     ; 561       break;
4124  0010 202c          	jp	L1271
4125  0012               L5561:
4126                     ; 537     case HAL_NRF_PIPE0:
4126                     ; 538     case HAL_NRF_PIPE1:
4126                     ; 539     case HAL_NRF_TX:
4126                     ; 540       length = ctr = hal_nrf_get_address_width();
4128  0012 cd0000        	call	_hal_nrf_get_address_width
4130  0015 6b02          	ld	(OFST+0,sp),a
4131  0017 6b01          	ld	(OFST-1,sp),a
4132                     ; 541       CSN_LOW();
4134  0019 72135005      	bres	20485,#1
4135                     ; 542       hal_nrf_rw(RX_ADDR_P0 + reg);
4137  001d 7b03          	ld	a,(OFST+1,sp)
4138  001f ab0a          	add	a,#10
4140                     ; 543       break;
4142  0021 2016          	jp	LC007
4143  0023               L7561:
4144                     ; 545     case HAL_NRF_RX_PLOAD:
4144                     ; 546       if( (reg = hal_nrf_get_rx_data_source()) < 7)
4146  0023 cd0000        	call	_hal_nrf_get_rx_data_source
4148  0026 6b03          	ld	(OFST+1,sp),a
4149  0028 a107          	cp	a,#7
4150  002a 2412          	jruge	L1271
4151                     ; 548         length = ctr = hal_nrf_read_rx_pl_w();
4153  002c cd0000        	call	_hal_nrf_read_rx_pl_w
4155  002f 6b02          	ld	(OFST+0,sp),a
4156  0031 6b01          	ld	(OFST-1,sp),a
4157                     ; 550         CSN_LOW();
4159  0033 72135005      	bres	20485,#1
4160                     ; 551         hal_nrf_rw(RD_RX_PLOAD);
4162  0037 a661          	ld	a,#97
4163  0039               LC007:
4164  0039 cd0000        	call	_hal_nrf_rw
4167  003c 2010          	jra	L7271
4168  003e               L1271:
4169                     ; 555        ctr = length = 0;
4172  003e 0f01          	clr	(OFST-1,sp)
4173  0040 0f02          	clr	(OFST+0,sp)
4174  0042 200a          	jra	L7271
4175                     ; 561       break;
4176  0044               L5271:
4177                     ; 566     *pbuf++ = hal_nrf_rw(0);
4179  0044 4f            	clr	a
4180  0045 cd0000        	call	_hal_nrf_rw
4182  0048 1e06          	ldw	x,(OFST+4,sp)
4183  004a f7            	ld	(x),a
4184  004b 5c            	incw	x
4185  004c 1f06          	ldw	(OFST+4,sp),x
4186  004e               L7271:
4187                     ; 564   while(ctr--)
4189  004e 7b02          	ld	a,(OFST+0,sp)
4190  0050 0a02          	dec	(OFST+0,sp)
4191  0052 4d            	tnz	a
4192  0053 26ef          	jrne	L5271
4193                     ; 569   CSN_HIGH();
4195  0055 72125005      	bset	20485,#1
4196                     ; 571   return (((uint16_t) reg << 8) | length);
4198  0059 7b03          	ld	a,(OFST+1,sp)
4199  005b 97            	ld	xl,a
4200  005c 7b01          	ld	a,(OFST-1,sp)
4201  005e 02            	rlwa	x,a
4204  005f 5b03          	addw	sp,#3
4205  0061 81            	ret	
4261                     ; 574 void hal_nrf_write_multibyte_reg(uint8_t reg, uint8_t *pbuf, uint8_t length)
4261                     ; 575 {
4262                     .text:	section	.text,new
4263  0000               _hal_nrf_write_multibyte_reg:
4265  0000 88            	push	a
4266       00000000      OFST:	set	0
4269                     ; 576   switch(reg)
4272                     ; 590     default:
4272                     ; 591       break;
4273  0001 4d            	tnz	a
4274  0002 270c          	jreq	L3371
4275  0004 4a            	dec	a
4276  0005 2709          	jreq	L3371
4277  0007 a005          	sub	a,#5
4278  0009 2705          	jreq	L3371
4279  000b 4a            	dec	a
4280  000c 2711          	jreq	L5371
4281  000e 2020          	jra	L5771
4282  0010               L3371:
4283                     ; 578     case HAL_NRF_PIPE0:
4283                     ; 579     case HAL_NRF_PIPE1:
4283                     ; 580     case HAL_NRF_TX:
4283                     ; 581       length = hal_nrf_get_address_width();
4285  0010 cd0000        	call	_hal_nrf_get_address_width
4287  0013 6b06          	ld	(OFST+6,sp),a
4288                     ; 582       CSN_LOW();
4290  0015 72135005      	bres	20485,#1
4291                     ; 583       hal_nrf_rw(WRITE_REG + RX_ADDR_P0 + reg);
4293  0019 7b01          	ld	a,(OFST+1,sp)
4294  001b ab2a          	add	a,#42
4296                     ; 584       break;
4298  001d 200e          	jp	LC008
4299  001f               L5371:
4300                     ; 586     case HAL_NRF_TX_PLOAD:
4300                     ; 587       CSN_LOW();
4302  001f 72135005      	bres	20485,#1
4303                     ; 588       hal_nrf_rw(WR_TX_PLOAD);
4305  0023 a6a0          	ld	a,#160
4307                     ; 589       break;      
4309  0025 2006          	jp	LC008
4310                     ; 590     default:
4310                     ; 591       break;
4313  0027               L3771:
4314                     ; 596     hal_nrf_rw(*pbuf++);
4316  0027 1e04          	ldw	x,(OFST+4,sp)
4317  0029 f6            	ld	a,(x)
4318  002a 5c            	incw	x
4319  002b 1f04          	ldw	(OFST+4,sp),x
4320  002d               LC008:
4321  002d cd0000        	call	_hal_nrf_rw
4323  0030               L5771:
4324                     ; 594   while(length--)
4326  0030 7b06          	ld	a,(OFST+6,sp)
4327  0032 0a06          	dec	(OFST+6,sp)
4328  0034 4d            	tnz	a
4329  0035 26f0          	jrne	L3771
4330                     ; 599   CSN_HIGH();
4332  0037 72125005      	bset	20485,#1
4333                     ; 600 }
4336  003b 84            	pop	a
4337  003c 81            	ret	
4350                     	xdef	_hal_nrf_get_fifo_status
4351                     	xref	_hal_nrf_rw
4352                     	xdef	_hal_nrf_write_multibyte_reg
4353                     	xdef	_hal_nrf_read_multibyte_reg
4354                     	xdef	_hal_nrf_write_reg
4355                     	xdef	_hal_nrf_read_reg
4356                     	xdef	_hal_nrf_get_lna_gain
4357                     	xdef	_hal_nrf_set_lna_gain
4358                     	xdef	_hal_nrf_get_pll_mode
4359                     	xdef	_hal_nrf_set_pll_mode
4360                     	xdef	_hal_nrf_nop
4361                     	xdef	_hal_nrf_flush_tx
4362                     	xdef	_hal_nrf_flush_rx
4363                     	xdef	_hal_nrf_get_reuse_tx_status
4364                     	xdef	_hal_nrf_reuse_tx
4365                     	xdef	_hal_nrf_write_tx_pload
4366                     	xdef	_hal_nrf_read_rx_pload
4367                     	xdef	_hal_nrf_get_rx_data_source
4368                     	xdef	_hal_nrf_get_carrier_detect
4369                     	xdef	_hal_nrf_get_transmit_attempts
4370                     	xdef	_hal_nrf_rx_fifo_full
4371                     	xdef	_hal_nrf_rx_fifo_empty
4372                     	xdef	_hal_nrf_get_rx_fifo_status
4373                     	xdef	_hal_nrf_tx_fifo_full
4374                     	xdef	_hal_nrf_tx_fifo_empty
4375                     	xdef	_hal_nrf_get_tx_fifo_status
4376                     	xdef	_hal_nrf_get_datarate
4377                     	xdef	_hal_nrf_get_output_power
4378                     	xdef	_hal_nrf_get_rf_channel
4379                     	xdef	_hal_nrf_get_power_mode
4380                     	xdef	_hal_nrf_get_operation_mode
4381                     	xdef	_hal_nrf_set_datarate
4382                     	xdef	_hal_nrf_set_output_power
4383                     	xdef	_hal_nrf_set_rf_channel
4384                     	xdef	_hal_nrf_set_power_mode
4385                     	xdef	_hal_nrf_set_operation_mode
4386                     	xdef	_hal_nrf_get_rx_pload_width
4387                     	xdef	_hal_nrf_get_address_width
4388                     	xdef	_hal_nrf_get_packet_lost_ctr
4389                     	xdef	_hal_nrf_get_auto_retr_status
4390                     	xdef	_hal_nrf_get_address
4391                     	xdef	_hal_nrf_get_pipe_status
4392                     	xdef	_hal_nrf_get_crc_mode
4393                     	xdef	_hal_nrf_get_irq_flags
4394                     	xdef	_hal_nrf_get_irq_mode
4395                     	xdef	_hal_nrf_set_rx_pload_width
4396                     	xdef	_hal_nrf_set_address_width
4397                     	xdef	_hal_nrf_set_auto_retr
4398                     	xdef	_hal_nrf_set_address
4399                     	xdef	_hal_nrf_close_pipe
4400                     	xdef	_hal_nrf_open_pipe
4401                     	xdef	_hal_nrf_set_crc_mode
4402                     	xdef	_hal_nrf_clear_irq_flag
4403                     	xdef	_hal_nrf_get_clear_irq_flags
4404                     	xdef	_hal_nrf_disable_dynamic_ack
4405                     	xdef	_hal_nrf_enable_dynamic_ack
4406                     	xdef	_hal_nrf_write_ack_pload
4407                     	xdef	_hal_nrf_read_rx_pl_w
4408                     	xdef	_hal_nrf_setup_dyn_pl
4409                     	xdef	_hal_nrf_disable_dynamic_pl
4410                     	xdef	_hal_nrf_enable_dynamic_pl
4411                     	xdef	_hal_nrf_disable_ack_pl
4412                     	xdef	_hal_nrf_enable_ack_pl
4413                     	xdef	_hal_nrf_lock_unlock
4414                     	xdef	_hal_nrf_set_irq_mode
4433                     	end
