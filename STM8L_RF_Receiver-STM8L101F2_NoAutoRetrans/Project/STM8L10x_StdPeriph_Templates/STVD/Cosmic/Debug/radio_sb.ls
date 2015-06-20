   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 105                     ; 28 void radio_sb_init (const uint8_t *address, hal_nrf_operation_mode_t operational_mode)
 105                     ; 29 {
 107                     .text:	section	.text,new
 108  0000               _radio_sb_init:
 110  0000 89            	pushw	x
 111       00000000      OFST:	set	0
 114                     ; 30   hal_nrf_close_pipe(HAL_NRF_ALL);               // First close all radio pipes
 116  0001 a6ff          	ld	a,#255
 117  0003 cd0000        	call	_hal_nrf_close_pipe
 119                     ; 32   hal_nrf_open_pipe(HAL_NRF_PIPE0, FALSE);       // Open pipe0, without/autoack
 121  0006 5f            	clrw	x
 122  0007 cd0000        	call	_hal_nrf_open_pipe
 124                     ; 34   hal_nrf_set_crc_mode(HAL_NRF_CRC_16BIT);       // Operates in 16bits CRC mode
 126  000a a603          	ld	a,#3
 127  000c cd0000        	call	_hal_nrf_set_crc_mode
 129                     ; 35   hal_nrf_set_auto_retr(0, RF_RETRANS_DELAY);    // Disables auto retransmit
 131  000f ae00fa        	ldw	x,#250
 132  0012 89            	pushw	x
 133  0013 4f            	clr	a
 134  0014 cd0000        	call	_hal_nrf_set_auto_retr
 136  0017 a605          	ld	a,#5
 137  0019 85            	popw	x
 138                     ; 37   hal_nrf_set_address_width(HAL_NRF_AW_5BYTES);  // 5 bytes address width
 140  001a cd0000        	call	_hal_nrf_set_address_width
 142                     ; 38   hal_nrf_set_address(HAL_NRF_TX, address);      // Set device's addresses
 144  001d 1e01          	ldw	x,(OFST+1,sp)
 145  001f 89            	pushw	x
 146  0020 a606          	ld	a,#6
 147  0022 cd0000        	call	_hal_nrf_set_address
 149  0025 85            	popw	x
 150                     ; 39   hal_nrf_set_address(HAL_NRF_PIPE0, address);   // Sets recieving address on 
 152  0026 1e01          	ldw	x,(OFST+1,sp)
 153  0028 89            	pushw	x
 154  0029 4f            	clr	a
 155  002a cd0000        	call	_hal_nrf_set_address
 157  002d 85            	popw	x
 158                     ; 42   if(operational_mode == HAL_NRF_PTX)            // Mode depentant settings
 160  002e 7b05          	ld	a,(OFST+5,sp)
 161  0030 2605          	jrne	L34
 162                     ; 44     hal_nrf_set_operation_mode(HAL_NRF_PTX);     // Enter TX mode
 164  0032 cd0000        	call	_hal_nrf_set_operation_mode
 167  0035 200b          	jra	L54
 168  0037               L34:
 169                     ; 48     hal_nrf_set_operation_mode(HAL_NRF_PRX);     // Enter RX mode
 171  0037 a601          	ld	a,#1
 172  0039 cd0000        	call	_hal_nrf_set_operation_mode
 174                     ; 49     hal_nrf_set_rx_pload_width((uint8_t)HAL_NRF_PIPE0, RF_PAYLOAD_LENGTH);
 176  003c ae0006        	ldw	x,#6
 177  003f cd0000        	call	_hal_nrf_set_rx_pload_width
 179  0042               L54:
 180                     ; 55   hal_nrf_set_rf_channel(RF_CHANNEL);            // Operating on static channel 
 182  0042 a628          	ld	a,#40
 183  0044 cd0000        	call	_hal_nrf_set_rf_channel
 185                     ; 59   hal_nrf_set_power_mode(HAL_NRF_PWR_UP);        // Power up device
 187  0047 a601          	ld	a,#1
 188  0049 cd0000        	call	_hal_nrf_set_power_mode
 190                     ; 61   hal_nrf_set_datarate(HAL_NRF_250KBPS);         // Uncomment this line for 
 192  004c 4f            	clr	a
 193  004d cd0000        	call	_hal_nrf_set_datarate
 195                     ; 67   Timeout_SetTimeout2(5);
 197  0050 ae0005        	ldw	x,#5
 198  0053 cd0000        	call	_Timeout_SetTimeout2
 201  0056               L15:
 202                     ; 68   while(!Timeout_IsTimeout2());
 204  0056 cd0000        	call	_Timeout_IsTimeout2
 206  0059 4d            	tnz	a
 207  005a 27fa          	jreq	L15
 208                     ; 70   radio_set_status (RF_IDLE);                    // Radio now ready
 210  005c 4f            	clr	a
 211  005d cd0000        	call	_radio_set_status
 213                     ; 71 }                                                
 216  0060 85            	popw	x
 217  0061 81            	ret	
 230                     	xref	_Timeout_IsTimeout2
 231                     	xref	_Timeout_SetTimeout2
 232                     	xref	_radio_set_status
 233                     	xdef	_radio_sb_init
 234                     	xref	_hal_nrf_set_datarate
 235                     	xref	_hal_nrf_set_rf_channel
 236                     	xref	_hal_nrf_set_power_mode
 237                     	xref	_hal_nrf_set_operation_mode
 238                     	xref	_hal_nrf_set_rx_pload_width
 239                     	xref	_hal_nrf_set_address_width
 240                     	xref	_hal_nrf_set_auto_retr
 241                     	xref	_hal_nrf_set_address
 242                     	xref	_hal_nrf_close_pipe
 243                     	xref	_hal_nrf_open_pipe
 244                     	xref	_hal_nrf_set_crc_mode
 263                     	end
