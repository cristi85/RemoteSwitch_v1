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
 631  0017 274f          	jreq	L371
 632  0019 2062          	jra	L742
 633  001b               L171:
 634                     ; 71     case HAL_NRF_PIPE0:
 634                     ; 72     case HAL_NRF_PIPE1:
 634                     ; 73     case HAL_NRF_PIPE2:
 634                     ; 74     case HAL_NRF_PIPE3:
 634                     ; 75     case HAL_NRF_PIPE4:
 634                     ; 76     case HAL_NRF_PIPE5:
 634                     ; 77       hal_nrf_write_reg(EN_RXADDR, hal_nrf_read_reg(EN_RXADDR) | SET_BIT(pipe_num));
 636  001b 7b02          	ld	a,(OFST+1,sp)
 637  001d ad61          	call	LC003
 638  001f 2704          	jreq	L07
 639  0021               L27:
 640  0021 48            	sll	a
 641  0022 5a            	decw	x
 642  0023 26fc          	jrne	L27
 643  0025               L07:
 644  0025 6b01          	ld	(OFST+0,sp),a
 645  0027 a602          	ld	a,#2
 646  0029 cd0000        	call	_hal_nrf_read_reg
 648  002c 1a01          	or	a,(OFST+0,sp)
 649  002e 97            	ld	xl,a
 650  002f a602          	ld	a,#2
 651  0031 95            	ld	xh,a
 652  0032 cd0000        	call	_hal_nrf_write_reg
 654                     ; 79       if(auto_ack)
 656  0035 7b03          	ld	a,(OFST+2,sp)
 657  0037 2715          	jreq	L152
 658                     ; 80         hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) | SET_BIT(pipe_num));
 660  0039 7b02          	ld	a,(OFST+1,sp)
 661  003b ad43          	call	LC003
 662  003d 2704          	jreq	L001
 663  003f               L201:
 664  003f 48            	sll	a
 665  0040 5a            	decw	x
 666  0041 26fc          	jrne	L201
 667  0043               L001:
 668  0043 6b01          	ld	(OFST+0,sp),a
 669  0045 a601          	ld	a,#1
 670  0047 cd0000        	call	_hal_nrf_read_reg
 672  004a 1a01          	or	a,(OFST+0,sp)
 675  004c 2014          	jp	LC002
 676  004e               L152:
 677                     ; 82         hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) & ~SET_BIT(pipe_num));
 679  004e 7b02          	ld	a,(OFST+1,sp)
 680  0050 ad2e          	call	LC003
 681  0052 2704          	jreq	L011
 682  0054               L211:
 683  0054 48            	sll	a
 684  0055 5a            	decw	x
 685  0056 26fc          	jrne	L211
 686  0058               L011:
 687  0058 43            	cpl	a
 688  0059 6b01          	ld	(OFST+0,sp),a
 689  005b a601          	ld	a,#1
 690  005d cd0000        	call	_hal_nrf_read_reg
 692  0060 1401          	and	a,(OFST+0,sp)
 693  0062               LC002:
 694  0062 97            	ld	xl,a
 695  0063 a601          	ld	a,#1
 696  0065 95            	ld	xh,a
 698  0066 2012          	jp	LC001
 699  0068               L371:
 700                     ; 85     case HAL_NRF_ALL:
 700                     ; 86       hal_nrf_write_reg(EN_RXADDR, ~(BIT_7|BIT_6));
 702  0068 ae023f        	ldw	x,#575
 703  006b cd0000        	call	_hal_nrf_write_reg
 705                     ; 88       if(auto_ack)
 707  006e 7b03          	ld	a,(OFST+2,sp)
 708  0070 2705          	jreq	L552
 709                     ; 89         hal_nrf_write_reg(EN_AA, ~(BIT_7|BIT_6));
 711  0072 ae013f        	ldw	x,#319
 714  0075 2003          	jp	LC001
 715  0077               L552:
 716                     ; 91         hal_nrf_write_reg(EN_AA, 0);
 718  0077 ae0100        	ldw	x,#256
 719  007a               LC001:
 720  007a cd0000        	call	_hal_nrf_write_reg
 722                     ; 94     default:
 722                     ; 95       break;
 724  007d               L742:
 725                     ; 97 }
 728  007d 5b03          	addw	sp,#3
 729  007f 81            	ret	
 730  0080               LC003:
 731  0080 5f            	clrw	x
 732  0081 97            	ld	xl,a
 733  0082 a601          	ld	a,#1
 734  0084 5d            	tnzw	x
 735  0085 81            	ret	
 772                     ; 99 void hal_nrf_close_pipe(hal_nrf_address_t pipe_num)
 772                     ; 100 {
 773                     .text:	section	.text,new
 774  0000               _hal_nrf_close_pipe:
 776  0000 88            	push	a
 777  0001 88            	push	a
 778       00000001      OFST:	set	1
 781                     ; 101   switch(pipe_num)
 784                     ; 118     default:
 784                     ; 119       break;
 785  0002 4d            	tnz	a
 786  0003 2715          	jreq	L162
 787  0005 4a            	dec	a
 788  0006 2712          	jreq	L162
 789  0008 4a            	dec	a
 790  0009 270f          	jreq	L162
 791  000b 4a            	dec	a
 792  000c 270c          	jreq	L162
 793  000e 4a            	dec	a
 794  000f 2709          	jreq	L162
 795  0011 4a            	dec	a
 796  0012 2706          	jreq	L162
 797  0014 a0fa          	sub	a,#250
 798  0016 273d          	jreq	L362
 799  0018 2047          	jra	L703
 800  001a               L162:
 801                     ; 103     case HAL_NRF_PIPE0:
 801                     ; 104     case HAL_NRF_PIPE1:
 801                     ; 105     case HAL_NRF_PIPE2:
 801                     ; 106     case HAL_NRF_PIPE3:
 801                     ; 107     case HAL_NRF_PIPE4:
 801                     ; 108     case HAL_NRF_PIPE5:
 801                     ; 109       hal_nrf_write_reg(EN_RXADDR, hal_nrf_read_reg(EN_RXADDR) & ~SET_BIT(pipe_num));
 803  001a 7b02          	ld	a,(OFST+1,sp)
 804  001c 5f            	clrw	x
 805  001d 97            	ld	xl,a
 806  001e a601          	ld	a,#1
 807  0020 5d            	tnzw	x
 808  0021 2704          	jreq	L031
 809  0023               L231:
 810  0023 48            	sll	a
 811  0024 5a            	decw	x
 812  0025 26fc          	jrne	L231
 813  0027               L031:
 814  0027 43            	cpl	a
 815  0028 6b01          	ld	(OFST+0,sp),a
 816  002a a602          	ld	a,#2
 817  002c cd0000        	call	_hal_nrf_read_reg
 819  002f 1401          	and	a,(OFST+0,sp)
 820  0031 97            	ld	xl,a
 821  0032 a602          	ld	a,#2
 822  0034 95            	ld	xh,a
 823  0035 cd0000        	call	_hal_nrf_write_reg
 825                     ; 110       hal_nrf_write_reg(EN_AA, hal_nrf_read_reg(EN_AA) & ~SET_BIT(pipe_num));
 827  0038 7b02          	ld	a,(OFST+1,sp)
 828  003a 5f            	clrw	x
 829  003b 97            	ld	xl,a
 830  003c a601          	ld	a,#1
 831  003e 5d            	tnzw	x
 832  003f 2704          	jreq	L041
 833  0041               L241:
 834  0041 48            	sll	a
 835  0042 5a            	decw	x
 836  0043 26fc          	jrne	L241
 837  0045               L041:
 838  0045 43            	cpl	a
 839  0046 6b01          	ld	(OFST+0,sp),a
 840  0048 a601          	ld	a,#1
 841  004a cd0000        	call	_hal_nrf_read_reg
 843  004d 1401          	and	a,(OFST+0,sp)
 844  004f 97            	ld	xl,a
 845  0050 a601          	ld	a,#1
 846  0052 95            	ld	xh,a
 848                     ; 111       break;
 850  0053 2009          	jp	LC004
 851  0055               L362:
 852                     ; 113     case HAL_NRF_ALL:
 852                     ; 114       hal_nrf_write_reg(EN_RXADDR, 0);
 854  0055 ae0200        	ldw	x,#512
 855  0058 cd0000        	call	_hal_nrf_write_reg
 857                     ; 115       hal_nrf_write_reg(EN_AA, 0);
 859  005b ae0100        	ldw	x,#256
 860  005e               LC004:
 861  005e cd0000        	call	_hal_nrf_write_reg
 863                     ; 116       break;
 865                     ; 118     default:
 865                     ; 119       break;
 867  0061               L703:
 868                     ; 121 }
 871  0061 85            	popw	x
 872  0062 81            	ret	
 920                     ; 123 void hal_nrf_set_address(hal_nrf_address_t address, uint8_t *addr)
 920                     ; 124 {
 921                     .text:	section	.text,new
 922  0000               _hal_nrf_set_address:
 924  0000 88            	push	a
 925       00000000      OFST:	set	0
 928                     ; 125   switch(address)
 931                     ; 140     default:
 931                     ; 141       break;
 932  0001 4d            	tnz	a
 933  0002 2712          	jreq	L113
 934  0004 4a            	dec	a
 935  0005 270f          	jreq	L113
 936  0007 4a            	dec	a
 937  0008 271a          	jreq	L313
 938  000a 4a            	dec	a
 939  000b 2717          	jreq	L313
 940  000d 4a            	dec	a
 941  000e 2714          	jreq	L313
 942  0010 4a            	dec	a
 943  0011 2711          	jreq	L313
 944  0013 4a            	dec	a
 945  0014 261a          	jrne	L343
 946  0016               L113:
 947                     ; 127     case HAL_NRF_TX:
 947                     ; 128     case HAL_NRF_PIPE0:
 947                     ; 129     case HAL_NRF_PIPE1:
 947                     ; 130       hal_nrf_write_multibyte_reg((uint8_t) address, addr, 0);
 949  0016 4b00          	push	#0
 950  0018 1e05          	ldw	x,(OFST+5,sp)
 951  001a 89            	pushw	x
 952  001b 7b04          	ld	a,(OFST+4,sp)
 953  001d cd0000        	call	_hal_nrf_write_multibyte_reg
 955  0020 5b03          	addw	sp,#3
 956                     ; 131       break;
 958  0022 200c          	jra	L343
 959  0024               L313:
 960                     ; 133     case HAL_NRF_PIPE2:
 960                     ; 134     case HAL_NRF_PIPE3:
 960                     ; 135     case HAL_NRF_PIPE4:
 960                     ; 136     case HAL_NRF_PIPE5:
 960                     ; 137       hal_nrf_write_reg(RX_ADDR_P0 + (uint8_t) address, *addr);
 962  0024 1e04          	ldw	x,(OFST+4,sp)
 963  0026 f6            	ld	a,(x)
 964  0027 97            	ld	xl,a
 965  0028 7b01          	ld	a,(OFST+1,sp)
 966  002a ab0a          	add	a,#10
 967  002c 95            	ld	xh,a
 968  002d cd0000        	call	_hal_nrf_write_reg
 970                     ; 138       break;
 972                     ; 140     default:
 972                     ; 141       break;
 974  0030               L343:
 975                     ; 143 }
 978  0030 84            	pop	a
 979  0031 81            	ret	
1024                     ; 145 void hal_nrf_set_auto_retr(uint8_t retr, uint16_t delay)
1024                     ; 146 {
1025                     .text:	section	.text,new
1026  0000               _hal_nrf_set_auto_retr:
1028  0000 88            	push	a
1029       00000000      OFST:	set	0
1032                     ; 147   hal_nrf_write_reg(SETUP_RETR, (((delay/250)-1)<<4) | retr);
1034  0001 1e04          	ldw	x,(OFST+4,sp)
1035  0003 a6fa          	ld	a,#250
1036  0005 62            	div	x,a
1037  0006 58            	sllw	x
1038  0007 58            	sllw	x
1039  0008 58            	sllw	x
1040  0009 58            	sllw	x
1041  000a 1d0010        	subw	x,#16
1042  000d 01            	rrwa	x,a
1043  000e 1a01          	or	a,(OFST+1,sp)
1044                     
1045  0010 97            	ld	xl,a
1046  0011 a604          	ld	a,#4
1047  0013 95            	ld	xh,a
1048  0014 cd0000        	call	_hal_nrf_write_reg
1050                     ; 148 }
1053  0017 84            	pop	a
1054  0018 81            	ret	
1118                     ; 150 void hal_nrf_set_address_width(hal_nrf_address_width_t address_width)
1118                     ; 151 {
1119                     .text:	section	.text,new
1120  0000               _hal_nrf_set_address_width:
1124                     ; 152   hal_nrf_write_reg(SETUP_AW, (UINT8(address_width) - 2));
1126  0000 a002          	sub	a,#2
1127  0002 97            	ld	xl,a
1128  0003 a603          	ld	a,#3
1129  0005 95            	ld	xh,a
1131                     ; 153 }
1134  0006 cc0000        	jp	_hal_nrf_write_reg
1179                     ; 155 void hal_nrf_set_rx_pload_width(uint8_t pipe_num, uint8_t pload_width)
1179                     ; 156 {
1180                     .text:	section	.text,new
1181  0000               _hal_nrf_set_rx_pload_width:
1183  0000 89            	pushw	x
1184       00000000      OFST:	set	0
1187                     ; 157   hal_nrf_write_reg(RX_PW_P0 + pipe_num, pload_width);
1189  0001 7b01          	ld	a,(OFST+1,sp)
1190  0003 ab11          	add	a,#17
1191  0005 95            	ld	xh,a
1192  0006 cd0000        	call	_hal_nrf_write_reg
1194                     ; 158 }
1197  0009 85            	popw	x
1198  000a 81            	ret	
1223                     ; 160 uint8_t hal_nrf_get_crc_mode(void)
1223                     ; 161 {
1224                     .text:	section	.text,new
1225  0000               _hal_nrf_get_crc_mode:
1229                     ; 162   return (hal_nrf_read_reg(CONFIG) & (BIT_3|BIT_2)) >> CRCO;
1231  0000 4f            	clr	a
1232  0001 cd0000        	call	_hal_nrf_read_reg
1234  0004 a40c          	and	a,#12
1235  0006 44            	srl	a
1236  0007 44            	srl	a
1239  0008 81            	ret	
1293                     ; 165 uint8_t hal_nrf_get_pipe_status(uint8_t pipe_num)
1293                     ; 166 {
1294                     .text:	section	.text,new
1295  0000               _hal_nrf_get_pipe_status:
1297  0000 88            	push	a
1298  0001 5203          	subw	sp,#3
1299       00000003      OFST:	set	3
1302                     ; 169   en_rx = hal_nrf_read_reg(EN_RXADDR) & (1<<pipe_num);
1304  0003 5f            	clrw	x
1305  0004 97            	ld	xl,a
1306  0005 a601          	ld	a,#1
1307  0007 5d            	tnzw	x
1308  0008 2704          	jreq	L202
1309  000a               L402:
1310  000a 48            	sll	a
1311  000b 5a            	decw	x
1312  000c 26fc          	jrne	L402
1313  000e               L202:
1314  000e 6b01          	ld	(OFST-2,sp),a
1315  0010 a602          	ld	a,#2
1316  0012 cd0000        	call	_hal_nrf_read_reg
1318  0015 1401          	and	a,(OFST-2,sp)
1319  0017 6b02          	ld	(OFST-1,sp),a
1320                     ; 170   en_aa = hal_nrf_read_reg(EN_AA) & (1<<pipe_num);
1322  0019 5f            	clrw	x
1323  001a 7b04          	ld	a,(OFST+1,sp)
1324  001c 97            	ld	xl,a
1325  001d a601          	ld	a,#1
1326  001f 5d            	tnzw	x
1327  0020 2704          	jreq	L012
1328  0022               L212:
1329  0022 48            	sll	a
1330  0023 5a            	decw	x
1331  0024 26fc          	jrne	L212
1332  0026               L012:
1333  0026 6b01          	ld	(OFST-2,sp),a
1334  0028 a601          	ld	a,#1
1335  002a cd0000        	call	_hal_nrf_read_reg
1337  002d 1401          	and	a,(OFST-2,sp)
1338  002f 6b03          	ld	(OFST+0,sp),a
1339                     ; 172   en_rx >>= pipe_num;
1341  0031 5f            	clrw	x
1342  0032 7b04          	ld	a,(OFST+1,sp)
1343  0034 97            	ld	xl,a
1344  0035 7b02          	ld	a,(OFST-1,sp)
1345  0037 5d            	tnzw	x
1346  0038 2704          	jreq	L612
1347  003a               L022:
1348  003a 44            	srl	a
1349  003b 5a            	decw	x
1350  003c 26fc          	jrne	L022
1351  003e               L612:
1352  003e 6b02          	ld	(OFST-1,sp),a
1353                     ; 173   en_aa >>= pipe_num;
1355  0040 5f            	clrw	x
1356  0041 7b04          	ld	a,(OFST+1,sp)
1357  0043 97            	ld	xl,a
1358  0044 7b03          	ld	a,(OFST+0,sp)
1359  0046 5d            	tnzw	x
1360  0047 2704          	jreq	L222
1361  0049               L422:
1362  0049 44            	srl	a
1363  004a 5a            	decw	x
1364  004b 26fc          	jrne	L422
1365  004d               L222:
1366  004d 6b03          	ld	(OFST+0,sp),a
1367                     ; 175   return (en_aa << 1) + en_rx;
1369  004f 48            	sll	a
1370  0050 1b02          	add	a,(OFST-1,sp)
1373  0052 5b04          	addw	sp,#4
1374  0054 81            	ret	
1422                     ; 178 uint8_t hal_nrf_get_address(uint8_t address, uint8_t *addr)
1422                     ; 179 {
1423                     .text:	section	.text,new
1424  0000               _hal_nrf_get_address:
1426  0000 88            	push	a
1427       00000000      OFST:	set	0
1430                     ; 180   switch(address)
1433                     ; 189       return hal_nrf_get_address_width();
1434  0001 4d            	tnz	a
1435  0002 2717          	jreq	L774
1436  0004 4a            	dec	a
1437  0005 2714          	jreq	L774
1438  0007 a005          	sub	a,#5
1439  0009 2710          	jreq	L774
1440                     ; 187     default:
1440                     ; 188       *addr = hal_nrf_read_reg(RX_ADDR_P0 + address);
1442  000b 7b01          	ld	a,(OFST+1,sp)
1443  000d ab0a          	add	a,#10
1444  000f cd0000        	call	_hal_nrf_read_reg
1446  0012 1e04          	ldw	x,(OFST+4,sp)
1447  0014 f7            	ld	(x),a
1448                     ; 189       return hal_nrf_get_address_width();
1450  0015 cd0000        	call	_hal_nrf_get_address_width
1454  0018 5b01          	addw	sp,#1
1455  001a 81            	ret	
1456  001b               L774:
1457                     ; 182     case HAL_NRF_PIPE0:
1457                     ; 183     case HAL_NRF_PIPE1:
1457                     ; 184     case HAL_NRF_TX:
1457                     ; 185       return hal_nrf_read_multibyte_reg(address, addr);
1459  001b 1e04          	ldw	x,(OFST+4,sp)
1460  001d 89            	pushw	x
1461  001e 7b03          	ld	a,(OFST+3,sp)
1462  0020 cd0000        	call	_hal_nrf_read_multibyte_reg
1464  0023 5b02          	addw	sp,#2
1465  0025 9f            	ld	a,xl
1468  0026 5b01          	addw	sp,#1
1469  0028 81            	ret	
1494                     ; 193 uint8_t hal_nrf_get_auto_retr_status(void)
1494                     ; 194 {
1495                     .text:	section	.text,new
1496  0000               _hal_nrf_get_auto_retr_status:
1500                     ; 195   return hal_nrf_read_reg(OBSERVE_TX);
1502  0000 a608          	ld	a,#8
1506  0002 cc0000        	jp	_hal_nrf_read_reg
1531                     ; 198 uint8_t hal_nrf_get_packet_lost_ctr(void)
1531                     ; 199 {
1532                     .text:	section	.text,new
1533  0000               _hal_nrf_get_packet_lost_ctr:
1537                     ; 200   return (hal_nrf_read_reg(OBSERVE_TX) & (BIT_7|BIT_6|BIT_5|BIT_4)) >> 4;
1539  0000 a608          	ld	a,#8
1540  0002 cd0000        	call	_hal_nrf_read_reg
1542  0005 4e            	swap	a
1543  0006 a40f          	and	a,#15
1546  0008 81            	ret	
1571                     ; 203 uint8_t hal_nrf_get_address_width(void)
1571                     ; 204 {
1572                     .text:	section	.text,new
1573  0000               _hal_nrf_get_address_width:
1577                     ; 205   return (hal_nrf_read_reg(SETUP_AW) + 2);
1579  0000 a603          	ld	a,#3
1580  0002 cd0000        	call	_hal_nrf_read_reg
1582  0005 ab02          	add	a,#2
1585  0007 81            	ret	
1621                     ; 208 uint8_t hal_nrf_get_rx_pload_width(uint8_t pipe_num)
1621                     ; 209 {
1622                     .text:	section	.text,new
1623  0000               _hal_nrf_get_rx_pload_width:
1627                     ; 210   return hal_nrf_read_reg(RX_PW_P0 + pipe_num);
1629  0000 ab11          	add	a,#17
1633  0002 cc0000        	jp	_hal_nrf_read_reg
1691                     ; 213 void hal_nrf_set_operation_mode(hal_nrf_operation_mode_t op_mode)
1691                     ; 214 {
1692                     .text:	section	.text,new
1693  0000               _hal_nrf_set_operation_mode:
1697                     ; 215   if(op_mode == HAL_NRF_PRX)
1699  0000 4a            	dec	a
1700  0001 2607          	jrne	L526
1701                     ; 217     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) | (1<<PRIM_RX)));
1703  0003 cd0000        	call	_hal_nrf_read_reg
1705  0006 aa01          	or	a,#1
1708  0008 2006          	jra	L726
1709  000a               L526:
1710                     ; 221     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) & ~(1<<PRIM_RX)));
1712  000a 4f            	clr	a
1713  000b cd0000        	call	_hal_nrf_read_reg
1715  000e a4fe          	and	a,#254
1717  0010               L726:
1718  0010 97            	ld	xl,a
1719  0011 4f            	clr	a
1720  0012 95            	ld	xh,a
1721                     ; 223 }
1724  0013 cc0000        	jp	_hal_nrf_write_reg
1782                     ; 225 void hal_nrf_set_power_mode(hal_nrf_pwr_mode_t pwr_mode)
1782                     ; 226 {
1783                     .text:	section	.text,new
1784  0000               _hal_nrf_set_power_mode:
1788                     ; 227   if(pwr_mode == HAL_NRF_PWR_UP)
1790  0000 4a            	dec	a
1791  0001 2607          	jrne	L756
1792                     ; 229     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) | (1<<PWR_UP)));
1794  0003 cd0000        	call	_hal_nrf_read_reg
1796  0006 aa02          	or	a,#2
1799  0008 2006          	jra	L166
1800  000a               L756:
1801                     ; 233     hal_nrf_write_reg(CONFIG, (hal_nrf_read_reg(CONFIG) & ~(1<<PWR_UP)));
1803  000a 4f            	clr	a
1804  000b cd0000        	call	_hal_nrf_read_reg
1806  000e a4fd          	and	a,#253
1808  0010               L166:
1809  0010 97            	ld	xl,a
1810  0011 4f            	clr	a
1811  0012 95            	ld	xh,a
1812                     ; 235 }
1815  0013 cc0000        	jp	_hal_nrf_write_reg
1851                     ; 237 void hal_nrf_set_rf_channel(uint8_t channel)
1851                     ; 238 {
1852                     .text:	section	.text,new
1853  0000               _hal_nrf_set_rf_channel:
1857                     ; 239   hal_nrf_write_reg(RF_CH, channel);
1859  0000 97            	ld	xl,a
1860  0001 a605          	ld	a,#5
1861  0003 95            	ld	xh,a
1863                     ; 240 }
1866  0004 cc0000        	jp	_hal_nrf_write_reg
1938                     ; 242 void hal_nrf_set_output_power(hal_nrf_output_power_t power)
1938                     ; 243 {
1939                     .text:	section	.text,new
1940  0000               _hal_nrf_set_output_power:
1942  0000 88            	push	a
1943       00000001      OFST:	set	1
1946                     ; 244   hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~((1<<RF_PWR1)|(1<<RF_PWR0))) | (UINT8(power)<<1));
1948  0001 48            	sll	a
1949  0002 6b01          	ld	(OFST+0,sp),a
1950  0004 a606          	ld	a,#6
1951  0006 cd0000        	call	_hal_nrf_read_reg
1953  0009 a4f9          	and	a,#249
1954  000b 1a01          	or	a,(OFST+0,sp)
1955  000d 97            	ld	xl,a
1956  000e a606          	ld	a,#6
1957  0010 95            	ld	xh,a
1958  0011 cd0000        	call	_hal_nrf_write_reg
1960                     ; 245 }
1963  0014 84            	pop	a
1964  0015 81            	ret	
2029                     ; 247 void hal_nrf_set_datarate(hal_nrf_datarate_t datarate)
2029                     ; 248 {
2030                     .text:	section	.text,new
2031  0000               _hal_nrf_set_datarate:
2035                     ; 249   switch(datarate)
2038                     ; 266     default: break;
2039  0000 4d            	tnz	a
2040  0001 2707          	jreq	L337
2041  0003 4a            	dec	a
2042  0004 270f          	jreq	L537
2043  0006 4a            	dec	a
2044  0007 2715          	jreq	L737
2046  0009 81            	ret	
2047  000a               L337:
2048                     ; 253       hal_nrf_write_reg(RF_SETUP, ( (hal_nrf_read_reg(RF_SETUP)|(1<<RF_DR_LOW)) & ~(1<< RF_DR_HIGH) ));
2050  000a a606          	ld	a,#6
2051  000c cd0000        	call	_hal_nrf_read_reg
2053  000f a4f7          	and	a,#247
2054  0011 aa20          	or	a,#32
2056                     ; 254       break;  
2058  0013 2012          	jp	LC005
2059  0015               L537:
2060                     ; 258       hal_nrf_write_reg(RF_SETUP, ( hal_nrf_read_reg(RF_SETUP) & ~(1<<RF_DR_HIGH | 1<<RF_DR_LOW) ));
2062  0015 a606          	ld	a,#6
2063  0017 cd0000        	call	_hal_nrf_read_reg
2065  001a a4d7          	and	a,#215
2067                     ; 259       break;  
2069  001c 2009          	jp	LC005
2070  001e               L737:
2071                     ; 263       hal_nrf_write_reg(RF_SETUP, ( (hal_nrf_read_reg(RF_SETUP)|(1<<RF_DR_HIGH)) & ~(1<< RF_DR_LOW) ));
2073  001e a606          	ld	a,#6
2074  0020 cd0000        	call	_hal_nrf_read_reg
2076  0023 a4df          	and	a,#223
2077  0025 aa08          	or	a,#8
2078  0027               LC005:
2079  0027 97            	ld	xl,a
2080  0028 a606          	ld	a,#6
2081  002a 95            	ld	xh,a
2083                     ; 264       break;  
2085                     ; 266     default: break;
2087                     ; 268 }
2090  002b cc0000        	jp	_hal_nrf_write_reg
2115                     ; 270 uint8_t hal_nrf_get_operation_mode(void)
2115                     ; 271 {
2116                     .text:	section	.text,new
2117  0000               _hal_nrf_get_operation_mode:
2121                     ; 272   return (hal_nrf_read_reg(CONFIG) & (1<<PRIM_RX)) >> PRIM_RX;
2123  0000 4f            	clr	a
2124  0001 cd0000        	call	_hal_nrf_read_reg
2126  0004 5f            	clrw	x
2127  0005               L633:
2128  0005 44            	srl	a
2129  0006 5a            	decw	x
2130  0007 26fc          	jrne	L633
2131  0009 a401          	and	a,#1
2134  000b 81            	ret	
2159                     ; 275 uint8_t hal_nrf_get_power_mode(void)
2159                     ; 276 {
2160                     .text:	section	.text,new
2161  0000               _hal_nrf_get_power_mode:
2165                     ; 277   return (hal_nrf_read_reg(CONFIG) & (1<<PWR_UP)) >> PWR_UP;
2167  0000 4f            	clr	a
2168  0001 cd0000        	call	_hal_nrf_read_reg
2170  0004 a402          	and	a,#2
2171  0006 44            	srl	a
2174  0007 81            	ret	
2199                     ; 280 uint8_t hal_nrf_get_rf_channel(void)
2199                     ; 281 {
2200                     .text:	section	.text,new
2201  0000               _hal_nrf_get_rf_channel:
2205                     ; 282   return hal_nrf_read_reg(RF_CH);
2207  0000 a605          	ld	a,#5
2211  0002 cc0000        	jp	_hal_nrf_read_reg
2236                     ; 285 uint8_t hal_nrf_get_output_power(void)
2236                     ; 286 {
2237                     .text:	section	.text,new
2238  0000               _hal_nrf_get_output_power:
2242                     ; 287   return (hal_nrf_read_reg(RF_SETUP) & ((1<<RF_PWR1)|(1<<RF_PWR0))) >> RF_PWR0;
2244  0000 a606          	ld	a,#6
2245  0002 cd0000        	call	_hal_nrf_read_reg
2247  0005 a406          	and	a,#6
2248  0007 44            	srl	a
2251  0008 81            	ret	
2287                     ; 290 uint8_t hal_nrf_get_datarate(void)
2287                     ; 291 {
2288                     .text:	section	.text,new
2289  0000               _hal_nrf_get_datarate:
2291  0000 89            	pushw	x
2292       00000002      OFST:	set	2
2295                     ; 292   uint8_t tmp = hal_nrf_read_reg(RF_SETUP);
2297  0001 a606          	ld	a,#6
2298  0003 cd0000        	call	_hal_nrf_read_reg
2300  0006 6b02          	ld	(OFST+0,sp),a
2301                     ; 293   return ((tmp & (1<<RF_DR_HIGH)) >> (RF_DR_HIGH-1)) | ((tmp & (1<<RF_DR_LOW)) >> (RF_DR_LOW));
2303  0008 4e            	swap	a
2304  0009 a402          	and	a,#2
2305  000b 44            	srl	a
2306  000c 6b01          	ld	(OFST-1,sp),a
2307  000e 7b02          	ld	a,(OFST+0,sp)
2308  0010 a408          	and	a,#8
2309  0012 44            	srl	a
2310  0013 44            	srl	a
2311  0014 1a01          	or	a,(OFST-1,sp)
2314  0016 85            	popw	x
2315  0017 81            	ret	
2341                     ; 296 bool hal_nrf_rx_fifo_empty(void)
2341                     ; 297 {
2342                     .text:	section	.text,new
2343  0000               _hal_nrf_rx_fifo_empty:
2347                     ; 298  if(hal_nrf_get_rx_data_source()==7)
2349  0000 cd0000        	call	_hal_nrf_get_rx_data_source
2351  0003 a107          	cp	a,#7
2352  0005 2603          	jrne	L5601
2353                     ; 300     return TRUE;
2355  0007 a601          	ld	a,#1
2358  0009 81            	ret	
2359  000a               L5601:
2360                     ; 304     return FALSE;
2362  000a 4f            	clr	a
2365  000b 81            	ret	
2391                     ; 308 bool hal_nrf_rx_fifo_full(void)
2391                     ; 309 {
2392                     .text:	section	.text,new
2393  0000               _hal_nrf_rx_fifo_full:
2397                     ; 310   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> RX_EMPTY) & 1);
2399  0000 a617          	ld	a,#23
2400  0002 cd0000        	call	_hal_nrf_read_reg
2402  0005 a401          	and	a,#1
2405  0007 81            	ret	
2431                     ; 313 bool hal_nrf_tx_fifo_empty(void)
2431                     ; 314 {
2432                     .text:	section	.text,new
2433  0000               _hal_nrf_tx_fifo_empty:
2437                     ; 315   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> TX_EMPTY) & 1);
2439  0000 a617          	ld	a,#23
2440  0002 cd0000        	call	_hal_nrf_read_reg
2442  0005 4e            	swap	a
2443  0006 a401          	and	a,#1
2446  0008 81            	ret	
2472                     ; 318 bool hal_nrf_tx_fifo_full(void)
2472                     ; 319 {
2473                     .text:	section	.text,new
2474  0000               _hal_nrf_tx_fifo_full:
2478                     ; 320   return (bool)((hal_nrf_read_reg(FIFO_STATUS) >> TX_FIFO_FULL) & 1);
2480  0000 a617          	ld	a,#23
2481  0002 cd0000        	call	_hal_nrf_read_reg
2483  0005 4e            	swap	a
2484  0006 a402          	and	a,#2
2485  0008 44            	srl	a
2488  0009 81            	ret	
2513                     ; 323 uint8_t hal_nrf_get_tx_fifo_status(void)
2513                     ; 324 {
2514                     .text:	section	.text,new
2515  0000               _hal_nrf_get_tx_fifo_status:
2519                     ; 325   return ((hal_nrf_read_reg(FIFO_STATUS) & ((1<<TX_FIFO_FULL)|(1<<TX_EMPTY))) >> 4);
2521  0000 a617          	ld	a,#23
2522  0002 cd0000        	call	_hal_nrf_read_reg
2524  0005 4e            	swap	a
2525  0006 a403          	and	a,#3
2528  0008 81            	ret	
2553                     ; 328 uint8_t hal_nrf_get_rx_fifo_status(void)
2553                     ; 329 {
2554                     .text:	section	.text,new
2555  0000               _hal_nrf_get_rx_fifo_status:
2559                     ; 330   return (hal_nrf_read_reg(FIFO_STATUS) & ((1<<RX_FULL)|(1<<RX_EMPTY)));
2561  0000 a617          	ld	a,#23
2562  0002 cd0000        	call	_hal_nrf_read_reg
2564  0005 a403          	and	a,#3
2567  0007 81            	ret	
2592                     ; 333 uint8_t hal_nrf_get_fifo_status(void)
2592                     ; 334 {
2593                     .text:	section	.text,new
2594  0000               _hal_nrf_get_fifo_status:
2598                     ; 335   return hal_nrf_read_reg(FIFO_STATUS);
2600  0000 a617          	ld	a,#23
2604  0002 cc0000        	jp	_hal_nrf_read_reg
2629                     ; 338 uint8_t hal_nrf_get_transmit_attempts(void)
2629                     ; 339 {
2630                     .text:	section	.text,new
2631  0000               _hal_nrf_get_transmit_attempts:
2635                     ; 340   return hal_nrf_read_reg(OBSERVE_TX) & (BIT_3|BIT_2|BIT_1|BIT_0);
2637  0000 a608          	ld	a,#8
2638  0002 cd0000        	call	_hal_nrf_read_reg
2640  0005 a40f          	and	a,#15
2643  0007 81            	ret	
2669                     ; 343 bool hal_nrf_get_carrier_detect(void)
2669                     ; 344 {
2670                     .text:	section	.text,new
2671  0000               _hal_nrf_get_carrier_detect:
2675                     ; 345   return hal_nrf_read_reg(CD) & 1;
2677  0000 a609          	ld	a,#9
2678  0002 cd0000        	call	_hal_nrf_read_reg
2680  0005 a401          	and	a,#1
2683  0007 81            	ret	
2729                     ; 348 void hal_nrf_write_tx_pload(uint8_t *tx_pload, uint8_t length)
2729                     ; 349 {
2730                     .text:	section	.text,new
2731  0000               _hal_nrf_write_tx_pload:
2733  0000 89            	pushw	x
2734       00000000      OFST:	set	0
2737                     ; 350   hal_nrf_write_multibyte_reg(UINT8(HAL_NRF_TX_PLOAD), tx_pload, length);
2739  0001 7b05          	ld	a,(OFST+5,sp)
2740  0003 88            	push	a
2741  0004 89            	pushw	x
2742  0005 a607          	ld	a,#7
2743  0007 cd0000        	call	_hal_nrf_write_multibyte_reg
2745  000a 5b03          	addw	sp,#3
2746                     ; 351 }
2749  000c 85            	popw	x
2750  000d 81            	ret	
2786                     ; 353 void hal_nrf_setup_dyn_pl(uint8_t setup)
2786                     ; 354 {
2787                     .text:	section	.text,new
2788  0000               _hal_nrf_setup_dyn_pl:
2792                     ; 355   hal_nrf_write_reg(DYNPD, setup & ~0xC0); 
2794  0000 a43f          	and	a,#63
2795  0002 97            	ld	xl,a
2796  0003 a61c          	ld	a,#28
2797  0005 95            	ld	xh,a
2799                     ; 356 }
2802  0006 cc0000        	jp	_hal_nrf_write_reg
2828                     ; 358 void hal_nrf_enable_dynamic_pl(void)
2828                     ; 359 {
2829                     .text:	section	.text,new
2830  0000               _hal_nrf_enable_dynamic_pl:
2834                     ; 360   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x04));   
2836  0000 a61d          	ld	a,#29
2837  0002 cd0000        	call	_hal_nrf_read_reg
2839  0005 aa04          	or	a,#4
2840  0007 97            	ld	xl,a
2841  0008 a61d          	ld	a,#29
2842  000a 95            	ld	xh,a
2844                     ; 361 }
2847  000b cc0000        	jp	_hal_nrf_write_reg
2873                     ; 363 void hal_nrf_disable_dynamic_pl(void)
2873                     ; 364 {
2874                     .text:	section	.text,new
2875  0000               _hal_nrf_disable_dynamic_pl:
2879                     ; 365   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x04));   
2881  0000 a61d          	ld	a,#29
2882  0002 cd0000        	call	_hal_nrf_read_reg
2884  0005 a4fb          	and	a,#251
2885  0007 97            	ld	xl,a
2886  0008 a61d          	ld	a,#29
2887  000a 95            	ld	xh,a
2889                     ; 366 }
2892  000b cc0000        	jp	_hal_nrf_write_reg
2918                     ; 368 void hal_nrf_enable_ack_pl(void)
2918                     ; 369 {
2919                     .text:	section	.text,new
2920  0000               _hal_nrf_enable_ack_pl:
2924                     ; 370   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x02));   
2926  0000 a61d          	ld	a,#29
2927  0002 cd0000        	call	_hal_nrf_read_reg
2929  0005 aa02          	or	a,#2
2930  0007 97            	ld	xl,a
2931  0008 a61d          	ld	a,#29
2932  000a 95            	ld	xh,a
2934                     ; 371 }
2937  000b cc0000        	jp	_hal_nrf_write_reg
2963                     ; 373 void hal_nrf_disable_ack_pl(void)
2963                     ; 374 {
2964                     .text:	section	.text,new
2965  0000               _hal_nrf_disable_ack_pl:
2969                     ; 375   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x02));   
2971  0000 a61d          	ld	a,#29
2972  0002 cd0000        	call	_hal_nrf_read_reg
2974  0005 a4fd          	and	a,#253
2975  0007 97            	ld	xl,a
2976  0008 a61d          	ld	a,#29
2977  000a 95            	ld	xh,a
2979                     ; 376 }
2982  000b cc0000        	jp	_hal_nrf_write_reg
3008                     ; 378 void hal_nrf_enable_dynamic_ack(void)
3008                     ; 379 {
3009                     .text:	section	.text,new
3010  0000               _hal_nrf_enable_dynamic_ack:
3014                     ; 380   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) | 0x01));   
3016  0000 a61d          	ld	a,#29
3017  0002 cd0000        	call	_hal_nrf_read_reg
3019  0005 aa01          	or	a,#1
3020  0007 97            	ld	xl,a
3021  0008 a61d          	ld	a,#29
3022  000a 95            	ld	xh,a
3024                     ; 381 }
3027  000b cc0000        	jp	_hal_nrf_write_reg
3053                     ; 383 void hal_nrf_disable_dynamic_ack(void)
3053                     ; 384 {
3054                     .text:	section	.text,new
3055  0000               _hal_nrf_disable_dynamic_ack:
3059                     ; 385   hal_nrf_write_reg(FEATURE, (hal_nrf_read_reg(FEATURE) & ~0x01));   
3061  0000 a61d          	ld	a,#29
3062  0002 cd0000        	call	_hal_nrf_read_reg
3064  0005 a4fe          	and	a,#254
3065  0007 97            	ld	xl,a
3066  0008 a61d          	ld	a,#29
3067  000a 95            	ld	xh,a
3069                     ; 386 }
3072  000b cc0000        	jp	_hal_nrf_write_reg
3127                     ; 388 void hal_nrf_write_ack_pload(uint8_t pipe, uint8_t *tx_pload, uint8_t length)
3127                     ; 389 {
3128                     .text:	section	.text,new
3129  0000               _hal_nrf_write_ack_pload:
3131  0000 88            	push	a
3132       00000000      OFST:	set	0
3135                     ; 390   CSN_LOW();
3137  0001 72135005      	bres	20485,#1
3138                     ; 392   hal_nrf_rw(WR_ACK_PLOAD | pipe);
3140  0005 aaa8          	or	a,#168
3143  0007 2006          	jra	L1431
3144  0009               L7331:
3145                     ; 395     hal_nrf_rw(*tx_pload++);
3147  0009 1e04          	ldw	x,(OFST+4,sp)
3148  000b f6            	ld	a,(x)
3149  000c 5c            	incw	x
3150  000d 1f04          	ldw	(OFST+4,sp),x
3152  000f               L1431:
3153  000f cd0000        	call	_hal_nrf_rw
3154                     ; 393   while(length--)
3156  0012 7b06          	ld	a,(OFST+6,sp)
3157  0014 0a06          	dec	(OFST+6,sp)
3158  0016 4d            	tnz	a
3159  0017 26f0          	jrne	L7331
3160                     ; 398   CSN_HIGH();
3162  0019 72125005      	bset	20485,#1
3163                     ; 399 }
3166  001d 84            	pop	a
3167  001e 81            	ret	
3203                     ; 401 uint8_t hal_nrf_read_rx_pl_w()
3203                     ; 402 {
3204                     .text:	section	.text,new
3205  0000               _hal_nrf_read_rx_pl_w:
3207  0000 88            	push	a
3208       00000001      OFST:	set	1
3211                     ; 405   CSN_LOW();
3213  0001 72135005      	bres	20485,#1
3214                     ; 407   hal_nrf_rw(RD_RX_PLOAD_W);
3216  0005 a660          	ld	a,#96
3217  0007 cd0000        	call	_hal_nrf_rw
3219                     ; 408   temp = hal_nrf_rw(0);
3221  000a 4f            	clr	a
3222  000b cd0000        	call	_hal_nrf_rw
3224  000e 6b01          	ld	(OFST+0,sp),a
3225                     ; 409   CSN_HIGH();
3227  0010 72125005      	bset	20485,#1
3228                     ; 411   return temp;
3232  0014 5b01          	addw	sp,#1
3233  0016 81            	ret	
3258                     ; 414 void hal_nrf_lock_unlock()
3258                     ; 415 {
3259                     .text:	section	.text,new
3260  0000               _hal_nrf_lock_unlock:
3264                     ; 416   CSN_LOW();
3266  0000 72135005      	bres	20485,#1
3267                     ; 418   hal_nrf_rw(LOCK_UNLOCK);             
3269  0004 a650          	ld	a,#80
3270  0006 cd0000        	call	_hal_nrf_rw
3272                     ; 419   hal_nrf_rw(0x73);
3274  0009 a673          	ld	a,#115
3275  000b cd0000        	call	_hal_nrf_rw
3277                     ; 421   CSN_HIGH();
3279  000e 72125005      	bset	20485,#1
3280                     ; 422 }
3283  0012 81            	ret	
3308                     ; 424 uint8_t hal_nrf_get_rx_data_source(void)
3308                     ; 425 {
3309                     .text:	section	.text,new
3310  0000               _hal_nrf_get_rx_data_source:
3314                     ; 426   return ((hal_nrf_nop() & (BIT_3|BIT_2|BIT_1)) >> 1);
3316  0000 cd0000        	call	_hal_nrf_nop
3318  0003 a40e          	and	a,#14
3319  0005 44            	srl	a
3322  0006 81            	ret	
3359                     ; 431 uint16_t hal_nrf_read_rx_pload(uint8_t *rx_pload)
3359                     ; 432 {
3360                     .text:	section	.text,new
3361  0000               _hal_nrf_read_rx_pload:
3365                     ; 433   return hal_nrf_read_multibyte_reg(UINT8(HAL_NRF_RX_PLOAD), rx_pload);
3367  0000 89            	pushw	x
3368  0001 a608          	ld	a,#8
3369  0003 cd0000        	call	_hal_nrf_read_multibyte_reg
3371  0006 5b02          	addw	sp,#2
3374  0008 81            	ret	
3398                     ; 436 void hal_nrf_reuse_tx(void)
3398                     ; 437 {
3399                     .text:	section	.text,new
3400  0000               _hal_nrf_reuse_tx:
3404                     ; 438   hal_nrf_write_reg(REUSE_TX_PL, 0);
3406  0000 aee300        	ldw	x,#58112
3408                     ; 439 }
3411  0003 cc0000        	jp	_hal_nrf_write_reg
3437                     ; 441 bool hal_nrf_get_reuse_tx_status(void)
3437                     ; 442 {
3438                     .text:	section	.text,new
3439  0000               _hal_nrf_get_reuse_tx_status:
3443                     ; 443   return (bool)((hal_nrf_get_fifo_status() & (1<<TX_REUSE)) >> TX_REUSE);
3445  0000 cd0000        	call	_hal_nrf_get_fifo_status
3447  0003 4e            	swap	a
3448  0004 a404          	and	a,#4
3449  0006 44            	srl	a
3450  0007 44            	srl	a
3453  0008 81            	ret	
3477                     ; 446 void hal_nrf_flush_rx(void)
3477                     ; 447 {
3478                     .text:	section	.text,new
3479  0000               _hal_nrf_flush_rx:
3483                     ; 448   hal_nrf_write_reg(FLUSH_RX, 0);
3485  0000 aee200        	ldw	x,#57856
3487                     ; 449 }
3490  0003 cc0000        	jp	_hal_nrf_write_reg
3514                     ; 451 void hal_nrf_flush_tx(void)
3514                     ; 452 {
3515                     .text:	section	.text,new
3516  0000               _hal_nrf_flush_tx:
3520                     ; 453   hal_nrf_write_reg(FLUSH_TX, 0);
3522  0000 aee100        	ldw	x,#57600
3524                     ; 454 }
3527  0003 cc0000        	jp	_hal_nrf_write_reg
3551                     ; 456 uint8_t hal_nrf_nop(void)
3551                     ; 457 {
3552                     .text:	section	.text,new
3553  0000               _hal_nrf_nop:
3557                     ; 458   return hal_nrf_write_reg(NOP,0);
3559  0000 aeff00        	ldw	x,#65280
3563  0003 cc0000        	jp	_hal_nrf_write_reg
3621                     ; 461 void hal_nrf_set_pll_mode(hal_nrf_pll_mode_t pll_mode)
3621                     ; 462 {
3622                     .text:	section	.text,new
3623  0000               _hal_nrf_set_pll_mode:
3627                     ; 463   if(pll_mode == HAL_NRF_PLL_LOCK)
3629  0000 4a            	dec	a
3630  0001 2609          	jrne	L7151
3631                     ; 465     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) | (1<<PLL_LOCK)));
3633  0003 a606          	ld	a,#6
3634  0005 cd0000        	call	_hal_nrf_read_reg
3636  0008 aa10          	or	a,#16
3639  000a 2007          	jra	L1251
3640  000c               L7151:
3641                     ; 469     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~(1<<PLL_LOCK)));
3643  000c a606          	ld	a,#6
3644  000e cd0000        	call	_hal_nrf_read_reg
3646  0011 a4ef          	and	a,#239
3648  0013               L1251:
3649  0013 97            	ld	xl,a
3650  0014 a606          	ld	a,#6
3651  0016 95            	ld	xh,a
3652                     ; 471 }
3655  0017 cc0000        	jp	_hal_nrf_write_reg
3681                     ; 473 hal_nrf_pll_mode_t hal_nrf_get_pll_mode(void)
3681                     ; 474 {
3682                     .text:	section	.text,new
3683  0000               _hal_nrf_get_pll_mode:
3687                     ; 475   return (hal_nrf_pll_mode_t)((hal_nrf_read_reg(RF_SETUP) & (1<<PLL_LOCK)) >> PLL_LOCK);
3689  0000 a606          	ld	a,#6
3690  0002 cd0000        	call	_hal_nrf_read_reg
3692  0005 4e            	swap	a
3693  0006 a401          	and	a,#1
3696  0008 81            	ret	
3754                     ; 478 void hal_nrf_set_lna_gain(hal_nrf_lna_mode_t lna_gain)
3754                     ; 479 {
3755                     .text:	section	.text,new
3756  0000               _hal_nrf_set_lna_gain:
3760                     ; 480   if(lna_gain == HAL_NRF_LNA_HCURR)
3762  0000 4a            	dec	a
3763  0001 2609          	jrne	L1651
3764                     ; 482     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) | (1<<LNA_HCURR)));
3766  0003 a606          	ld	a,#6
3767  0005 cd0000        	call	_hal_nrf_read_reg
3769  0008 aa01          	or	a,#1
3772  000a 2007          	jra	L3651
3773  000c               L1651:
3774                     ; 486     hal_nrf_write_reg(RF_SETUP, (hal_nrf_read_reg(RF_SETUP) & ~(1<<LNA_HCURR)));
3776  000c a606          	ld	a,#6
3777  000e cd0000        	call	_hal_nrf_read_reg
3779  0011 a4fe          	and	a,#254
3781  0013               L3651:
3782  0013 97            	ld	xl,a
3783  0014 a606          	ld	a,#6
3784  0016 95            	ld	xh,a
3785                     ; 488 }
3788  0017 cc0000        	jp	_hal_nrf_write_reg
3814                     ; 490 hal_nrf_lna_mode_t hal_nrf_get_lna_gain(void)
3814                     ; 491 {
3815                     .text:	section	.text,new
3816  0000               _hal_nrf_get_lna_gain:
3820                     ; 492   return (hal_nrf_lna_mode_t) ( (hal_nrf_read_reg(RF_SETUP) & (1<<LNA_HCURR)) >> LNA_HCURR );
3822  0000 a606          	ld	a,#6
3823  0002 cd0000        	call	_hal_nrf_read_reg
3825  0005 5f            	clrw	x
3826  0006               L216:
3827  0006 44            	srl	a
3828  0007 5a            	decw	x
3829  0008 26fc          	jrne	L216
3830  000a a401          	and	a,#1
3833  000c 81            	ret	
3877                     ; 495 uint8_t hal_nrf_read_reg(uint8_t reg)
3877                     ; 496 {
3878                     .text:	section	.text,new
3879  0000               _hal_nrf_read_reg:
3881  0000 88            	push	a
3882       00000001      OFST:	set	1
3885                     ; 498   CSN_LOW();
3887  0001 72135005      	bres	20485,#1
3888                     ; 499   hal_nrf_rw(reg);
3890  0005 cd0000        	call	_hal_nrf_rw
3892                     ; 500   temp = hal_nrf_rw(0);
3894  0008 4f            	clr	a
3895  0009 cd0000        	call	_hal_nrf_rw
3897  000c 6b01          	ld	(OFST+0,sp),a
3898                     ; 501   CSN_HIGH();
3900  000e 72125005      	bset	20485,#1
3901                     ; 503   return temp;
3905  0012 5b01          	addw	sp,#1
3906  0014 81            	ret	
3959                     ; 506 uint8_t hal_nrf_write_reg(uint8_t reg, uint8_t value)
3959                     ; 507 {
3960                     .text:	section	.text,new
3961  0000               _hal_nrf_write_reg:
3963  0000 89            	pushw	x
3964  0001 88            	push	a
3965       00000001      OFST:	set	1
3968                     ; 509   CSN_LOW();
3970  0002 72135005      	bres	20485,#1
3971                     ; 510   if(reg < WRITE_REG)   // i.e. this is a register access
3973  0006 9e            	ld	a,xh
3974  0007 a120          	cp	a,#32
3975  0009 2405          	jruge	L5461
3976                     ; 512     retval = hal_nrf_rw(WRITE_REG + reg);
3978  000b 9e            	ld	a,xh
3979  000c ab20          	add	a,#32
3981                     ; 513     hal_nrf_rw(value);
3984  000e 2012          	jp	LC006
3985  0010               L5461:
3986                     ; 517     if(!(reg == FLUSH_TX) && !(reg == FLUSH_RX) && !(reg == REUSE_TX_PL) && !(reg == NOP))
3988  0010 7b02          	ld	a,(OFST+1,sp)
3989  0012 a1e1          	cp	a,#225
3990  0014 2718          	jreq	L1561
3992  0016 a1e2          	cp	a,#226
3993  0018 2714          	jreq	L1561
3995  001a a1e3          	cp	a,#227
3996  001c 2710          	jreq	L1561
3998  001e a1ff          	cp	a,#255
3999  0020 270c          	jreq	L1561
4000                     ; 519       retval = hal_nrf_rw(reg);
4003                     ; 520       hal_nrf_rw(value);
4005  0022               LC006:
4006  0022 cd0000        	call	_hal_nrf_rw
4007  0025 6b01          	ld	(OFST+0,sp),a
4009  0027 7b03          	ld	a,(OFST+2,sp)
4010  0029 cd0000        	call	_hal_nrf_rw
4013  002c 2005          	jra	L7461
4014  002e               L1561:
4015                     ; 524       retval = hal_nrf_rw(reg);
4017  002e cd0000        	call	_hal_nrf_rw
4019  0031 6b01          	ld	(OFST+0,sp),a
4020  0033               L7461:
4021                     ; 527   CSN_HIGH();
4023  0033 72125005      	bset	20485,#1
4024                     ; 529   return retval;
4026  0037 7b01          	ld	a,(OFST+0,sp)
4029  0039 5b03          	addw	sp,#3
4030  003b 81            	ret	
4097                     ; 532 uint16_t hal_nrf_read_multibyte_reg(uint8_t reg, uint8_t *pbuf)
4097                     ; 533 {
4098                     .text:	section	.text,new
4099  0000               _hal_nrf_read_multibyte_reg:
4101  0000 88            	push	a
4102  0001 89            	pushw	x
4103       00000002      OFST:	set	2
4106                     ; 535   switch(reg)
4109                     ; 561       break;
4110  0002 4d            	tnz	a
4111  0003 270d          	jreq	L5561
4112  0005 4a            	dec	a
4113  0006 270a          	jreq	L5561
4114  0008 a005          	sub	a,#5
4115  000a 2706          	jreq	L5561
4116  000c a002          	sub	a,#2
4117  000e 2713          	jreq	L7561
4118                     ; 559     default:
4118                     ; 560       ctr = length = 0;
4119                     ; 561       break;
4121  0010 202c          	jp	L1271
4122  0012               L5561:
4123                     ; 537     case HAL_NRF_PIPE0:
4123                     ; 538     case HAL_NRF_PIPE1:
4123                     ; 539     case HAL_NRF_TX:
4123                     ; 540       length = ctr = hal_nrf_get_address_width();
4125  0012 cd0000        	call	_hal_nrf_get_address_width
4127  0015 6b02          	ld	(OFST+0,sp),a
4128  0017 6b01          	ld	(OFST-1,sp),a
4129                     ; 541       CSN_LOW();
4131  0019 72135005      	bres	20485,#1
4132                     ; 542       hal_nrf_rw(RX_ADDR_P0 + reg);
4134  001d 7b03          	ld	a,(OFST+1,sp)
4135  001f ab0a          	add	a,#10
4137                     ; 543       break;
4139  0021 2016          	jp	LC008
4140  0023               L7561:
4141                     ; 545     case HAL_NRF_RX_PLOAD:
4141                     ; 546       if( (reg = hal_nrf_get_rx_data_source()) < 7)
4143  0023 cd0000        	call	_hal_nrf_get_rx_data_source
4145  0026 6b03          	ld	(OFST+1,sp),a
4146  0028 a107          	cp	a,#7
4147  002a 2412          	jruge	L1271
4148                     ; 548         length = ctr = hal_nrf_read_rx_pl_w();
4150  002c cd0000        	call	_hal_nrf_read_rx_pl_w
4152  002f 6b02          	ld	(OFST+0,sp),a
4153  0031 6b01          	ld	(OFST-1,sp),a
4154                     ; 550         CSN_LOW();
4156  0033 72135005      	bres	20485,#1
4157                     ; 551         hal_nrf_rw(RD_RX_PLOAD);
4159  0037 a661          	ld	a,#97
4160  0039               LC008:
4161  0039 cd0000        	call	_hal_nrf_rw
4164  003c 2010          	jra	L7271
4165  003e               L1271:
4166                     ; 555        ctr = length = 0;
4169  003e 0f01          	clr	(OFST-1,sp)
4170  0040 0f02          	clr	(OFST+0,sp)
4171  0042 200a          	jra	L7271
4172                     ; 561       break;
4173  0044               L5271:
4174                     ; 566     *pbuf++ = hal_nrf_rw(0);
4176  0044 4f            	clr	a
4177  0045 cd0000        	call	_hal_nrf_rw
4179  0048 1e06          	ldw	x,(OFST+4,sp)
4180  004a f7            	ld	(x),a
4181  004b 5c            	incw	x
4182  004c 1f06          	ldw	(OFST+4,sp),x
4183  004e               L7271:
4184                     ; 564   while(ctr--)
4186  004e 7b02          	ld	a,(OFST+0,sp)
4187  0050 0a02          	dec	(OFST+0,sp)
4188  0052 4d            	tnz	a
4189  0053 26ef          	jrne	L5271
4190                     ; 569   CSN_HIGH();
4192  0055 72125005      	bset	20485,#1
4193                     ; 571   return (((uint16_t) reg << 8) | length);
4195  0059 7b03          	ld	a,(OFST+1,sp)
4196  005b 97            	ld	xl,a
4197  005c 7b01          	ld	a,(OFST-1,sp)
4198  005e 02            	rlwa	x,a
4201  005f 5b03          	addw	sp,#3
4202  0061 81            	ret	
4258                     ; 574 void hal_nrf_write_multibyte_reg(uint8_t reg, uint8_t *pbuf, uint8_t length)
4258                     ; 575 {
4259                     .text:	section	.text,new
4260  0000               _hal_nrf_write_multibyte_reg:
4262  0000 88            	push	a
4263       00000000      OFST:	set	0
4266                     ; 576   switch(reg)
4269                     ; 590     default:
4269                     ; 591       break;
4270  0001 4d            	tnz	a
4271  0002 270c          	jreq	L3371
4272  0004 4a            	dec	a
4273  0005 2709          	jreq	L3371
4274  0007 a005          	sub	a,#5
4275  0009 2705          	jreq	L3371
4276  000b 4a            	dec	a
4277  000c 2711          	jreq	L5371
4278  000e 2020          	jra	L5771
4279  0010               L3371:
4280                     ; 578     case HAL_NRF_PIPE0:
4280                     ; 579     case HAL_NRF_PIPE1:
4280                     ; 580     case HAL_NRF_TX:
4280                     ; 581       length = hal_nrf_get_address_width();
4282  0010 cd0000        	call	_hal_nrf_get_address_width
4284  0013 6b06          	ld	(OFST+6,sp),a
4285                     ; 582       CSN_LOW();
4287  0015 72135005      	bres	20485,#1
4288                     ; 583       hal_nrf_rw(WRITE_REG + RX_ADDR_P0 + reg);
4290  0019 7b01          	ld	a,(OFST+1,sp)
4291  001b ab2a          	add	a,#42
4293                     ; 584       break;
4295  001d 200e          	jp	LC009
4296  001f               L5371:
4297                     ; 586     case HAL_NRF_TX_PLOAD:
4297                     ; 587       CSN_LOW();
4299  001f 72135005      	bres	20485,#1
4300                     ; 588       hal_nrf_rw(WR_TX_PLOAD);
4302  0023 a6a0          	ld	a,#160
4304                     ; 589       break;      
4306  0025 2006          	jp	LC009
4307                     ; 590     default:
4307                     ; 591       break;
4310  0027               L3771:
4311                     ; 596     hal_nrf_rw(*pbuf++);
4313  0027 1e04          	ldw	x,(OFST+4,sp)
4314  0029 f6            	ld	a,(x)
4315  002a 5c            	incw	x
4316  002b 1f04          	ldw	(OFST+4,sp),x
4317  002d               LC009:
4318  002d cd0000        	call	_hal_nrf_rw
4320  0030               L5771:
4321                     ; 594   while(length--)
4323  0030 7b06          	ld	a,(OFST+6,sp)
4324  0032 0a06          	dec	(OFST+6,sp)
4325  0034 4d            	tnz	a
4326  0035 26f0          	jrne	L3771
4327                     ; 599   CSN_HIGH();
4329  0037 72125005      	bset	20485,#1
4330                     ; 600 }
4333  003b 84            	pop	a
4334  003c 81            	ret	
4347                     	xdef	_hal_nrf_get_fifo_status
4348                     	xref	_hal_nrf_rw
4349                     	xdef	_hal_nrf_write_multibyte_reg
4350                     	xdef	_hal_nrf_read_multibyte_reg
4351                     	xdef	_hal_nrf_write_reg
4352                     	xdef	_hal_nrf_read_reg
4353                     	xdef	_hal_nrf_get_lna_gain
4354                     	xdef	_hal_nrf_set_lna_gain
4355                     	xdef	_hal_nrf_get_pll_mode
4356                     	xdef	_hal_nrf_set_pll_mode
4357                     	xdef	_hal_nrf_nop
4358                     	xdef	_hal_nrf_flush_tx
4359                     	xdef	_hal_nrf_flush_rx
4360                     	xdef	_hal_nrf_get_reuse_tx_status
4361                     	xdef	_hal_nrf_reuse_tx
4362                     	xdef	_hal_nrf_write_tx_pload
4363                     	xdef	_hal_nrf_read_rx_pload
4364                     	xdef	_hal_nrf_get_rx_data_source
4365                     	xdef	_hal_nrf_get_carrier_detect
4366                     	xdef	_hal_nrf_get_transmit_attempts
4367                     	xdef	_hal_nrf_rx_fifo_full
4368                     	xdef	_hal_nrf_rx_fifo_empty
4369                     	xdef	_hal_nrf_get_rx_fifo_status
4370                     	xdef	_hal_nrf_tx_fifo_full
4371                     	xdef	_hal_nrf_tx_fifo_empty
4372                     	xdef	_hal_nrf_get_tx_fifo_status
4373                     	xdef	_hal_nrf_get_datarate
4374                     	xdef	_hal_nrf_get_output_power
4375                     	xdef	_hal_nrf_get_rf_channel
4376                     	xdef	_hal_nrf_get_power_mode
4377                     	xdef	_hal_nrf_get_operation_mode
4378                     	xdef	_hal_nrf_set_datarate
4379                     	xdef	_hal_nrf_set_output_power
4380                     	xdef	_hal_nrf_set_rf_channel
4381                     	xdef	_hal_nrf_set_power_mode
4382                     	xdef	_hal_nrf_set_operation_mode
4383                     	xdef	_hal_nrf_get_rx_pload_width
4384                     	xdef	_hal_nrf_get_address_width
4385                     	xdef	_hal_nrf_get_packet_lost_ctr
4386                     	xdef	_hal_nrf_get_auto_retr_status
4387                     	xdef	_hal_nrf_get_address
4388                     	xdef	_hal_nrf_get_pipe_status
4389                     	xdef	_hal_nrf_get_crc_mode
4390                     	xdef	_hal_nrf_get_irq_flags
4391                     	xdef	_hal_nrf_get_irq_mode
4392                     	xdef	_hal_nrf_set_rx_pload_width
4393                     	xdef	_hal_nrf_set_address_width
4394                     	xdef	_hal_nrf_set_auto_retr
4395                     	xdef	_hal_nrf_set_address
4396                     	xdef	_hal_nrf_close_pipe
4397                     	xdef	_hal_nrf_open_pipe
4398                     	xdef	_hal_nrf_set_crc_mode
4399                     	xdef	_hal_nrf_clear_irq_flag
4400                     	xdef	_hal_nrf_get_clear_irq_flags
4401                     	xdef	_hal_nrf_disable_dynamic_ack
4402                     	xdef	_hal_nrf_enable_dynamic_ack
4403                     	xdef	_hal_nrf_write_ack_pload
4404                     	xdef	_hal_nrf_read_rx_pl_w
4405                     	xdef	_hal_nrf_setup_dyn_pl
4406                     	xdef	_hal_nrf_disable_dynamic_pl
4407                     	xdef	_hal_nrf_enable_dynamic_pl
4408                     	xdef	_hal_nrf_disable_ack_pl
4409                     	xdef	_hal_nrf_enable_ack_pl
4410                     	xdef	_hal_nrf_lock_unlock
4411                     	xdef	_hal_nrf_set_irq_mode
4430                     	end
