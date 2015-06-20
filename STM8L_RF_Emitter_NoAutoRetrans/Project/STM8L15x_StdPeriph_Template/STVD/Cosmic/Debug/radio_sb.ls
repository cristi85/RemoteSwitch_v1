   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 104                     ; 28 void radio_sb_init (const uint8_t *address, hal_nrf_operation_mode_t operational_mode)
 104                     ; 29 {
 106                     .text:	section	.text,new
 107  0000               _radio_sb_init:
 109  0000 89            	pushw	x
 110       00000000      OFST:	set	0
 113                     ; 30   hal_nrf_close_pipe(HAL_NRF_ALL);               // First close all radio pipes
 115  0001 a6ff          	ld	a,#255
 116  0003 cd0000        	call	_hal_nrf_close_pipe
 118                     ; 32   hal_nrf_open_pipe(HAL_NRF_PIPE0, FALSE);       // Open pipe0, without/autoack
 120  0006 5f            	clrw	x
 121  0007 cd0000        	call	_hal_nrf_open_pipe
 123                     ; 34   hal_nrf_set_crc_mode(HAL_NRF_CRC_16BIT);       // Operates in 16bits CRC mode
 125  000a a603          	ld	a,#3
 126  000c cd0000        	call	_hal_nrf_set_crc_mode
 128                     ; 35   hal_nrf_set_auto_retr(0, RF_RETRANS_DELAY);    // Disables auto retransmit
 130  000f ae00fa        	ldw	x,#250
 131  0012 89            	pushw	x
 132  0013 4f            	clr	a
 133  0014 cd0000        	call	_hal_nrf_set_auto_retr
 135  0017 a605          	ld	a,#5
 136  0019 85            	popw	x
 137                     ; 37   hal_nrf_set_address_width(HAL_NRF_AW_5BYTES);  // 5 bytes address width
 139  001a cd0000        	call	_hal_nrf_set_address_width
 141                     ; 38   hal_nrf_set_address(HAL_NRF_TX, address);      // Set device's addresses
 143  001d 1e01          	ldw	x,(OFST+1,sp)
 144  001f 89            	pushw	x
 145  0020 a606          	ld	a,#6
 146  0022 cd0000        	call	_hal_nrf_set_address
 148  0025 85            	popw	x
 149                     ; 39   hal_nrf_set_address(HAL_NRF_PIPE0, address);   // Sets recieving address on 
 151  0026 1e01          	ldw	x,(OFST+1,sp)
 152  0028 89            	pushw	x
 153  0029 4f            	clr	a
 154  002a cd0000        	call	_hal_nrf_set_address
 156  002d 85            	popw	x
 157                     ; 42   if(operational_mode == HAL_NRF_PTX)            // Mode depentant settings
 159  002e 7b05          	ld	a,(OFST+5,sp)
 160  0030 2605          	jrne	L34
 161                     ; 44     hal_nrf_set_operation_mode(HAL_NRF_PTX);     // Enter TX mode
 163  0032 cd0000        	call	_hal_nrf_set_operation_mode
 166  0035 200b          	jra	L54
 167  0037               L34:
 168                     ; 48     hal_nrf_set_operation_mode(HAL_NRF_PRX);     // Enter RX mode
 170  0037 a601          	ld	a,#1
 171  0039 cd0000        	call	_hal_nrf_set_operation_mode
 173                     ; 49     hal_nrf_set_rx_pload_width((uint8_t)HAL_NRF_PIPE0, RF_PAYLOAD_LENGTH);
 175  003c ae0006        	ldw	x,#6
 176  003f cd0000        	call	_hal_nrf_set_rx_pload_width
 178  0042               L54:
 179                     ; 55   hal_nrf_set_rf_channel(RF_CHANNEL);            // Operating on static channel 
 181  0042 a628          	ld	a,#40
 182  0044 cd0000        	call	_hal_nrf_set_rf_channel
 184                     ; 59   hal_nrf_set_power_mode(HAL_NRF_PWR_UP);        // Power up device
 186  0047 a601          	ld	a,#1
 187  0049 cd0000        	call	_hal_nrf_set_power_mode
 189                     ; 61   hal_nrf_set_datarate(HAL_NRF_250KBPS);         // Uncomment this line for 
 191  004c 4f            	clr	a
 192  004d cd0000        	call	_hal_nrf_set_datarate
 194                     ; 67   DELAY5MS_START;
 196  0050 ae0201        	ldw	x,#513
 197  0053 cd0000        	call	_CLK_PeripheralClockConfig
 201  0056 350b52e8      	mov	21224,#11
 204  005a 350552e9      	mov	21225,#5
 207  005e 725f52e7      	clr	21223
 210  0062 721152e5      	bres	21221,#0
 213  0066 721052e0      	bset	21216,#0
 216  006a               L15:
 217                     ; 68   while(!DELAY_EXPIRED);
 219  006a 720152e5fb    	btjf	21221,#0,L15
 220                     ; 69   DELAY_STOP;
 222  006f 721152e0      	bres	21216,#0
 225  0073 ae0200        	ldw	x,#512
 226  0076 cd0000        	call	_CLK_PeripheralClockConfig
 228                     ; 71   radio_set_status (RF_IDLE);                    // Radio now ready
 231  0079 4f            	clr	a
 232  007a cd0000        	call	_radio_set_status
 234                     ; 72 }                                                
 237  007d 85            	popw	x
 238  007e 81            	ret	
 251                     	xref	_radio_set_status
 252                     	xdef	_radio_sb_init
 253                     	xref	_hal_nrf_set_datarate
 254                     	xref	_hal_nrf_set_rf_channel
 255                     	xref	_hal_nrf_set_power_mode
 256                     	xref	_hal_nrf_set_operation_mode
 257                     	xref	_hal_nrf_set_rx_pload_width
 258                     	xref	_hal_nrf_set_address_width
 259                     	xref	_hal_nrf_set_auto_retr
 260                     	xref	_hal_nrf_set_address
 261                     	xref	_hal_nrf_close_pipe
 262                     	xref	_hal_nrf_open_pipe
 263                     	xref	_hal_nrf_set_crc_mode
 264                     	xref	_CLK_PeripheralClockConfig
 283                     	end
