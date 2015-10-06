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
 104  000d 72165005      	bset	20485,#3
 106  0011               L15:
 109  0011 7b01          	ld	a,(OFST+0,sp)
 110  0013 0a01          	dec	(OFST+0,sp)
 111  0015 4d            	tnz	a
 112  0016 26f9          	jrne	L15
 115  0018 72175005      	bres	20485,#3
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
 341                     ; 66   switch(hal_nrf_get_clear_irq_flags ())
 343  0000 cd0000        	call	_hal_nrf_get_clear_irq_flags
 346                     ; 93       default:
 346                     ; 94         break;    
 347  0003 a010          	sub	a,#16
 348  0005 270d          	jreq	L141
 349  0007 a010          	sub	a,#16
 350  0009 2710          	jreq	L341
 351  000b a020          	sub	a,#32
 352  000d 2716          	jreq	L171
 353  000f a020          	sub	a,#32
 354  0011 2722          	jreq	L771
 356  0013 81            	ret	
 357  0014               L141:
 358                     ; 68     case (1<<HAL_NRF_MAX_RT):                 // Max retries reached
 358                     ; 69       hal_nrf_flush_tx();                     // flush tx fifo, avoid fifo jam
 360  0014 cd0000        	call	_hal_nrf_flush_tx
 362                     ; 70       radio_set_status (RF_MAX_RT);
 364  0017 a601          	ld	a,#1
 366                     ; 71       break;
 368  0019 2022          	jp	LC001
 369  001b               L341:
 370                     ; 73     case (1<<HAL_NRF_TX_DS):                  // Packet sent
 370                     ; 74       radio_set_status (RF_TX_DS);
 372  001b a602          	ld	a,#2
 374                     ; 75       break;
 376  001d 201e          	jp	LC001
 377  001f               L761:
 378                     ; 80         hal_nrf_read_rx_pload(pload);
 380  001f ae0001        	ldw	x,#L3_pload
 381  0022 cd0000        	call	_hal_nrf_read_rx_pload
 383  0025               L171:
 384                     ; 77     case (1<<HAL_NRF_RX_DR):                  // Packet received
 384                     ; 78       while (!hal_nrf_rx_fifo_empty ())
 386  0025 cd0000        	call	_hal_nrf_rx_fifo_empty
 388  0028 4d            	tnz	a
 389  0029 27f4          	jreq	L761
 390                     ; 82       radio_set_status (RF_RX_DR);
 392  002b a603          	ld	a,#3
 394                     ; 83       break;
 396  002d 200e          	jp	LC001
 397  002f               L571:
 398                     ; 88         hal_nrf_read_rx_pload(pload);
 400  002f ae0001        	ldw	x,#L3_pload
 401  0032 cd0000        	call	_hal_nrf_read_rx_pload
 403  0035               L771:
 404                     ; 85     case ((1<<HAL_NRF_RX_DR)|(1<<HAL_NRF_TX_DS)): // Ack payload recieved
 404                     ; 86       while (!hal_nrf_rx_fifo_empty ())
 406  0035 cd0000        	call	_hal_nrf_rx_fifo_empty
 408  0038 4d            	tnz	a
 409  0039 27f4          	jreq	L571
 410                     ; 90       radio_set_status (RF_TX_AP);
 412  003b a604          	ld	a,#4
 413  003d               LC001:
 415                     ; 91       break;
 417                     ; 93       default:
 417                     ; 94         break;    
 419                     ; 96 }
 422  003d cc0000        	jp	_radio_set_status
 457                     	switch	.ubsct
 458  0000               L5_status:
 459  0000 00            	ds.b	1
 460  0001               L3_pload:
 461  0001 000000000000  	ds.b	6
 462                     	xdef	_radio_irq
 463                     	xdef	_radio_send_packet
 464                     	xdef	_radio_get_pload_byte
 465                     	xdef	_radio_set_status
 466                     	xdef	_radio_get_status
 467                     	xref	_hal_nrf_flush_tx
 468                     	xref	_hal_nrf_write_tx_pload
 469                     	xref	_hal_nrf_read_rx_pload
 470                     	xref	_hal_nrf_rx_fifo_empty
 471                     	xref	_hal_nrf_get_clear_irq_flags
 491                     	end
