   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  81                     ; 38 void radio_send_packet(uint8_t *packet, uint8_t length)
  81                     ; 39 {
  83                     .text:	section	.text,new
  84  0000               _radio_send_packet:
  86  0000 89            	pushw	x
  87  0001 88            	push	a
  88       00000001      OFST:	set	1
  91                     ; 40   hal_nrf_write_tx_pload(packet, length);      // load message into radio
  93  0002 7b06          	ld	a,(OFST+5,sp)
  94  0004 88            	push	a
  95  0005 cd0000        	call	_hal_nrf_write_tx_pload
  97  0008 84            	pop	a
  98                     ; 42   CE_PULSE();                                 // send packet
 100  0009 a60f          	ld	a,#15
 101  000b 6b01          	ld	(OFST+0,sp),a
 104  000d 72145005      	bset	20485,#2
 106  0011               L15:
 109  0011 7b01          	ld	a,(OFST+0,sp)
 110  0013 0a01          	dec	(OFST+0,sp)
 111  0015 4d            	tnz	a
 112  0016 26f9          	jrne	L15
 115  0018 72155005      	bres	20485,#2
 116                     ; 46   radio_set_status (RF_BUSY);                 // trans. in progress; RF_BUSY
 118  001c a605          	ld	a,#5
 119  001e cd0000        	call	_radio_set_status
 121                     ; 47 }
 124  0021 5b03          	addw	sp,#3
 125  0023 81            	ret	
 198                     ; 49 radio_status_t radio_get_status (void)
 198                     ; 50 {
 199                     .text:	section	.text,new
 200  0000               _radio_get_status:
 204                     ; 51   return status;
 206  0000 b600          	ld	a,L5_status
 209  0002 81            	ret	
 245                     ; 54 uint8_t radio_get_pload_byte (uint8_t byte_index)
 245                     ; 55 {
 246                     .text:	section	.text,new
 247  0000               _radio_get_pload_byte:
 251                     ; 56   return pload[byte_index];
 253  0000 5f            	clrw	x
 254  0001 97            	ld	xl,a
 255  0002 e601          	ld	a,(L3_pload,x)
 258  0004 81            	ret	
 294                     ; 59 void radio_set_status (radio_status_t new_status)
 294                     ; 60 {
 295                     .text:	section	.text,new
 296  0000               _radio_set_status:
 300                     ; 61   status = new_status;
 302  0000 b700          	ld	L5_status,a
 303                     ; 62 }
 306  0002 81            	ret	
 335                     ; 64 void radio_irq(void) 
 335                     ; 65 {
 336                     .text:	section	.text,new
 337  0000               _radio_irq:
 341                     ; 66   if (RADIO_ACTIVITY())                         // Check if an interupt is
 343  0000 c6500b        	ld	a,20491
 344  0003 a410          	and	a,#16
 345  0005 5f            	clrw	x
 346  0006 02            	rlwa	x,a
 347  0007 5d            	tnzw	x
 348  0008 2640          	jrne	L361
 349                     ; 68     switch(hal_nrf_get_clear_irq_flags ())
 351  000a cd0000        	call	_hal_nrf_get_clear_irq_flags
 354                     ; 95       default:
 354                     ; 96         break;    
 355  000d a010          	sub	a,#16
 356  000f 270d          	jreq	L141
 357  0011 a010          	sub	a,#16
 358  0013 2710          	jreq	L341
 359  0015 a020          	sub	a,#32
 360  0017 2716          	jreq	L371
 361  0019 a020          	sub	a,#32
 362  001b 2722          	jreq	L102
 364  001d 81            	ret	
 365  001e               L141:
 366                     ; 70       case (1<<HAL_NRF_MAX_RT):                 // Max retries reached
 366                     ; 71         hal_nrf_flush_tx();                     // flush tx fifo, avoid fifo jam
 368  001e cd0000        	call	_hal_nrf_flush_tx
 370                     ; 72         radio_set_status (RF_MAX_RT);
 372  0021 a601          	ld	a,#1
 374                     ; 73         break;
 376  0023 2022          	jp	LC001
 377  0025               L341:
 378                     ; 75       case (1<<HAL_NRF_TX_DS):                  // Packet sent
 378                     ; 76         radio_set_status (RF_TX_DS);
 380  0025 a602          	ld	a,#2
 382                     ; 77         break;
 384  0027 201e          	jp	LC001
 385  0029               L171:
 386                     ; 82           hal_nrf_read_rx_pload(pload);
 388  0029 ae0001        	ldw	x,#L3_pload
 389  002c cd0000        	call	_hal_nrf_read_rx_pload
 391  002f               L371:
 392                     ; 79       case (1<<HAL_NRF_RX_DR):                  // Packet received
 392                     ; 80         while (!hal_nrf_rx_fifo_empty ())
 394  002f cd0000        	call	_hal_nrf_rx_fifo_empty
 396  0032 4d            	tnz	a
 397  0033 27f4          	jreq	L171
 398                     ; 84         radio_set_status (RF_RX_DR);
 400  0035 a603          	ld	a,#3
 402                     ; 85         break;
 404  0037 200e          	jp	LC001
 405  0039               L771:
 406                     ; 90           hal_nrf_read_rx_pload(pload);
 408  0039 ae0001        	ldw	x,#L3_pload
 409  003c cd0000        	call	_hal_nrf_read_rx_pload
 411  003f               L102:
 412                     ; 87       case ((1<<HAL_NRF_RX_DR)|(1<<HAL_NRF_TX_DS)): // Ack payload recieved
 412                     ; 88         while (!hal_nrf_rx_fifo_empty ())
 414  003f cd0000        	call	_hal_nrf_rx_fifo_empty
 416  0042 4d            	tnz	a
 417  0043 27f4          	jreq	L771
 418                     ; 92         radio_set_status (RF_TX_AP);
 420  0045 a604          	ld	a,#4
 421  0047               LC001:
 422  0047 cd0000        	call	_radio_set_status
 424                     ; 93         break;
 426                     ; 95       default:
 426                     ; 96         break;    
 429  004a               L361:
 430                     ; 101 }
 433  004a 81            	ret	
 468                     	switch	.ubsct
 469  0000               L5_status:
 470  0000 00            	ds.b	1
 471  0001               L3_pload:
 472  0001 000000000000  	ds.b	6
 473                     	xdef	_radio_irq
 474                     	xdef	_radio_send_packet
 475                     	xdef	_radio_get_pload_byte
 476                     	xdef	_radio_set_status
 477                     	xdef	_radio_get_status
 478                     	xref	_hal_nrf_flush_tx
 479                     	xref	_hal_nrf_write_tx_pload
 480                     	xref	_hal_nrf_read_rx_pload
 481                     	xref	_hal_nrf_rx_fifo_empty
 482                     	xref	_hal_nrf_get_clear_irq_flags
 502                     	end
