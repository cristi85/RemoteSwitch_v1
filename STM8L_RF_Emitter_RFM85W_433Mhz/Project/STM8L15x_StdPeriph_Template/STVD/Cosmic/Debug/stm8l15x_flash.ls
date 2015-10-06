   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  84                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  84                     ; 172 {
  86                     .text:	section	.text,new
  87  0000               _FLASH_SetProgrammingTime:
  91                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  93                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  95  0000 72115050      	bres	20560,#0
  96                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  98  0004 ca5050        	or	a,20560
  99  0007 c75050        	ld	20560,a
 100                     ; 178 }
 103  000a 81            	ret	
 128                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 128                     ; 186 {
 129                     .text:	section	.text,new
 130  0000               _FLASH_GetProgrammingTime:
 134                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 136  0000 c65050        	ld	a,20560
 137  0003 a401          	and	a,#1
 140  0005 81            	ret	
 196                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 196                     ; 201 {
 197                     .text:	section	.text,new
 198  0000               _FLASH_PowerWaitModeConfig:
 202                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 204                     ; 206   if (FLASH_Power != FLASH_Power_On)
 206  0000 4a            	dec	a
 207  0001 2705          	jreq	L57
 208                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 210  0003 72145050      	bset	20560,#2
 213  0007 81            	ret	
 214  0008               L57:
 215                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 217  0008 72155050      	bres	20560,#2
 218                     ; 215 }
 221  000c 81            	ret	
 244                     ; 256 void FLASH_DeInit(void)
 244                     ; 257 {
 245                     .text:	section	.text,new
 246  0000               _FLASH_DeInit:
 250                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 252  0000 725f5050      	clr	20560
 253                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 255  0004 725f5051      	clr	20561
 256                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 258  0008 35405054      	mov	20564,#64
 259                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 261  000c c65054        	ld	a,20564
 262                     ; 262 }
 265  000f 81            	ret	
 321                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 321                     ; 273 {
 322                     .text:	section	.text,new
 323  0000               _FLASH_Unlock:
 325  0000 88            	push	a
 326       00000000      OFST:	set	0
 329                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 331                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 333  0001 a1fd          	cp	a,#253
 334  0003 2608          	jrne	L731
 335                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 337  0005 35565052      	mov	20562,#86
 338                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 340  0009 35ae5052      	mov	20562,#174
 341  000d               L731:
 342                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 344  000d 7b01          	ld	a,(OFST+1,sp)
 345  000f a1f7          	cp	a,#247
 346  0011 2608          	jrne	L141
 347                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 349  0013 35ae5053      	mov	20563,#174
 350                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 352  0017 35565053      	mov	20563,#86
 353  001b               L141:
 354                     ; 290 }
 357  001b 84            	pop	a
 358  001c 81            	ret	
 393                     ; 300 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 393                     ; 301 {
 394                     .text:	section	.text,new
 395  0000               _FLASH_Lock:
 399                     ; 303   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 401                     ; 305   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 403  0000 c45054        	and	a,20564
 404  0003 c75054        	ld	20564,a
 405                     ; 306 }
 408  0006 81            	ret	
 451                     ; 314 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 451                     ; 315 {
 452                     .text:	section	.text,new
 453  0000               _FLASH_ProgramByte:
 455       00000000      OFST:	set	0
 458                     ; 317   assert_param(IS_FLASH_ADDRESS(Address));
 460                     ; 319   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 462  0000 1e05          	ldw	x,(OFST+5,sp)
 463  0002 7b07          	ld	a,(OFST+7,sp)
 464  0004 f7            	ld	(x),a
 465                     ; 320 }
 468  0005 81            	ret	
 502                     ; 327 void FLASH_EraseByte(uint32_t Address)
 502                     ; 328 {
 503                     .text:	section	.text,new
 504  0000               _FLASH_EraseByte:
 506       00000000      OFST:	set	0
 509                     ; 330   assert_param(IS_FLASH_ADDRESS(Address));
 511                     ; 332   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 513  0000 1e05          	ldw	x,(OFST+5,sp)
 514  0002 7f            	clr	(x)
 515                     ; 333 }
 518  0003 81            	ret	
 561                     ; 341 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 561                     ; 342 {
 562                     .text:	section	.text,new
 563  0000               _FLASH_ProgramWord:
 565       00000000      OFST:	set	0
 568                     ; 344   assert_param(IS_FLASH_ADDRESS(Address));
 570                     ; 346   FLASH->CR2 |= FLASH_CR2_WPRG;
 572  0000 721c5051      	bset	20561,#6
 573                     ; 349   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 575  0004 1e05          	ldw	x,(OFST+5,sp)
 576  0006 7b07          	ld	a,(OFST+7,sp)
 577  0008 f7            	ld	(x),a
 578                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 580  0009 7b08          	ld	a,(OFST+8,sp)
 581  000b e701          	ld	(1,x),a
 582                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 584  000d 7b09          	ld	a,(OFST+9,sp)
 585  000f e702          	ld	(2,x),a
 586                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 588  0011 7b0a          	ld	a,(OFST+10,sp)
 589  0013 e703          	ld	(3,x),a
 590                     ; 356 }
 593  0015 81            	ret	
 627                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 627                     ; 364 {
 628                     .text:	section	.text,new
 629  0000               _FLASH_ReadByte:
 631       00000000      OFST:	set	0
 634                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 636  0000 1e05          	ldw	x,(OFST+5,sp)
 637  0002 f6            	ld	a,(x)
 640  0003 81            	ret	
 685                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 685                     ; 414 {
 686                     .text:	section	.text,new
 687  0000               _FLASH_ProgramOptionByte:
 689  0000 89            	pushw	x
 690       00000000      OFST:	set	0
 693                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 695                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 697  0001 721e5051      	bset	20561,#7
 698                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 700  0005 1e01          	ldw	x,(OFST+1,sp)
 701  0007 7b05          	ld	a,(OFST+5,sp)
 702  0009 f7            	ld	(x),a
 703                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 705  000a a6fd          	ld	a,#253
 706  000c cd0000        	call	_FLASH_WaitForLastOperation
 708                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 710  000f 721f5051      	bres	20561,#7
 711                     ; 428 }
 714  0013 85            	popw	x
 715  0014 81            	ret	
 751                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 751                     ; 436 {
 752                     .text:	section	.text,new
 753  0000               _FLASH_EraseOptionByte:
 757                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 759                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 761  0000 721e5051      	bset	20561,#7
 762                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 764  0004 7f            	clr	(x)
 765                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 767  0005 a6fd          	ld	a,#253
 768  0007 cd0000        	call	_FLASH_WaitForLastOperation
 770                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 772  000a 721f5051      	bres	20561,#7
 773                     ; 450 }
 776  000e 81            	ret	
 833                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 833                     ; 459 {
 834                     .text:	section	.text,new
 835  0000               _FLASH_GetReadOutProtectionStatus:
 837  0000 88            	push	a
 838       00000001      OFST:	set	1
 841                     ; 460   FunctionalState state = DISABLE;
 843                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 845  0001 c64800        	ld	a,18432
 846  0004 a1aa          	cp	a,#170
 847  0006 2604          	jrne	L743
 848                     ; 465     state =  ENABLE;
 850  0008 a601          	ld	a,#1
 852  000a 2001          	jra	L153
 853  000c               L743:
 854                     ; 470     state =  DISABLE;
 856  000c 4f            	clr	a
 857  000d               L153:
 858                     ; 473   return state;
 862  000d 5b01          	addw	sp,#1
 863  000f 81            	ret	
 897                     ; 481 uint16_t FLASH_GetBootSize(void)
 897                     ; 482 {
 898                     .text:	section	.text,new
 899  0000               _FLASH_GetBootSize:
 901  0000 89            	pushw	x
 902       00000002      OFST:	set	2
 905                     ; 483   uint16_t temp = 0;
 907                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 909  0001 c64802        	ld	a,18434
 910  0004 5f            	clrw	x
 911  0005 97            	ld	xl,a
 912  0006 4f            	clr	a
 913  0007 02            	rlwa	x,a
 914  0008 44            	srl	a
 915  0009 56            	rrcw	x
 916                     ; 489   if (OPT->UBC > 0x7F)
 918  000a c64802        	ld	a,18434
 919  000d a180          	cp	a,#128
 920  000f 2503          	jrult	L173
 921                     ; 491     temp = 8192;
 923  0011 ae2000        	ldw	x,#8192
 924  0014               L173:
 925                     ; 495   return(temp);
 929  0014 5b02          	addw	sp,#2
 930  0016 81            	ret	
 964                     ; 505 uint16_t FLASH_GetCodeSize(void)
 964                     ; 506 {
 965                     .text:	section	.text,new
 966  0000               _FLASH_GetCodeSize:
 968  0000 89            	pushw	x
 969       00000002      OFST:	set	2
 972                     ; 507   uint16_t temp = 0;
 974                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 976  0001 c64807        	ld	a,18439
 977  0004 5f            	clrw	x
 978  0005 97            	ld	xl,a
 979  0006 4f            	clr	a
 980  0007 02            	rlwa	x,a
 981  0008 44            	srl	a
 982  0009 56            	rrcw	x
 983                     ; 513   if (OPT->PCODESIZE > 0x7F)
 985  000a c64807        	ld	a,18439
 986  000d a180          	cp	a,#128
 987  000f 2503          	jrult	L114
 988                     ; 515     temp = 8192;
 990  0011 ae2000        	ldw	x,#8192
 991  0014               L114:
 992                     ; 519   return(temp);
 996  0014 5b02          	addw	sp,#2
 997  0016 81            	ret	
1032                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
1032                     ; 545 {
1033                     .text:	section	.text,new
1034  0000               _FLASH_ITConfig:
1038                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1040                     ; 550   if (NewState != DISABLE)
1042  0000 4d            	tnz	a
1043  0001 2705          	jreq	L134
1044                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1046  0003 72125050      	bset	20560,#1
1049  0007 81            	ret	
1050  0008               L134:
1051                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1053  0008 72135050      	bres	20560,#1
1054                     ; 560 }
1057  000c 81            	ret	
1166                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1166                     ; 575 {
1167                     .text:	section	.text,new
1168  0000               _FLASH_GetFlagStatus:
1170  0000 88            	push	a
1171       00000001      OFST:	set	1
1174                     ; 576   FlagStatus status = RESET;
1176                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1178                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1180  0001 c45054        	and	a,20564
1181  0004 2702          	jreq	L505
1182                     ; 582     status = SET; /* Flash_FLAG is set*/
1184  0006 a601          	ld	a,#1
1186  0008               L505:
1187                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1189                     ; 590   return status;
1193  0008 5b01          	addw	sp,#1
1194  000a 81            	ret	
1230                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1230                     ; 707 {
1231                     .text:	section	.text,new
1232  0000               _FLASH_PowerRunModeConfig:
1236                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1238                     ; 711   if (FLASH_Power != FLASH_Power_On)
1240  0000 4a            	dec	a
1241  0001 2705          	jreq	L725
1242                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1244  0003 72165050      	bset	20560,#3
1247  0007 81            	ret	
1248  0008               L725:
1249                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1251  0008 72175050      	bres	20560,#3
1252                     ; 719 }
1255  000c 81            	ret	
1319                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1319                     ; 733 {
1320                     .text:	section	.text,new
1321  0000               _FLASH_GetPowerStatus:
1325                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1327  0000 c65050        	ld	a,20560
1328  0003 a40c          	and	a,#12
1331  0005 81            	ret	
1435                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1435                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1435                     ; 754 {
1436                     .text:	section	.text,new
1437  0000               _FLASH_ProgramBlock:
1439  0000 89            	pushw	x
1440  0001 5206          	subw	sp,#6
1441       00000006      OFST:	set	6
1444                     ; 755   uint16_t Count = 0;
1446                     ; 756   uint32_t startaddress = 0;
1448                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1450                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1452                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1454  0003 7b0b          	ld	a,(OFST+5,sp)
1455  0005 a1fd          	cp	a,#253
1456  0007 2605          	jrne	L136
1457                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1459                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1461  0009 ae8000        	ldw	x,#32768
1463  000c 2003          	jra	L336
1464  000e               L136:
1465                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1467                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1469  000e ae1000        	ldw	x,#4096
1470  0011               L336:
1471  0011 1f03          	ldw	(OFST-3,sp),x
1472  0013 5f            	clrw	x
1473  0014 1f01          	ldw	(OFST-5,sp),x
1474                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1476  0016 a640          	ld	a,#64
1477  0018 1e07          	ldw	x,(OFST+1,sp)
1478  001a cd0000        	call	c_cmulx
1480  001d 96            	ldw	x,sp
1481  001e 5c            	incw	x
1482  001f cd0000        	call	c_lgadd
1484                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1486  0022 7b0c          	ld	a,(OFST+6,sp)
1487  0024 2606          	jrne	L536
1488                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1490  0026 72105051      	bset	20561,#0
1492  002a 2004          	jra	L736
1493  002c               L536:
1494                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1496  002c 72185051      	bset	20561,#4
1497  0030               L736:
1498                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1500  0030 5f            	clrw	x
1501  0031 1f05          	ldw	(OFST-1,sp),x
1502  0033               L146:
1503                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1505  0033 1e0d          	ldw	x,(OFST+7,sp)
1506  0035 72fb05        	addw	x,(OFST-1,sp)
1507  0038 f6            	ld	a,(x)
1508  0039 1e03          	ldw	x,(OFST-3,sp)
1509  003b 72fb05        	addw	x,(OFST-1,sp)
1510  003e f7            	ld	(x),a
1511                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1513  003f 1e05          	ldw	x,(OFST-1,sp)
1514  0041 5c            	incw	x
1515  0042 1f05          	ldw	(OFST-1,sp),x
1518  0044 a30040        	cpw	x,#64
1519  0047 25ea          	jrult	L146
1520                     ; 792 }
1523  0049 5b08          	addw	sp,#8
1524  004b 81            	ret	
1587                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1587                     ; 805 {
1588                     .text:	section	.text,new
1589  0000               _FLASH_EraseBlock:
1591  0000 89            	pushw	x
1592  0001 5206          	subw	sp,#6
1593       00000006      OFST:	set	6
1596                     ; 806   uint32_t startaddress = 0;
1598                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1600                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1602  0003 7b0b          	ld	a,(OFST+5,sp)
1603  0005 a1fd          	cp	a,#253
1604  0007 2605          	jrne	L107
1605                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1607                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1609  0009 ae8000        	ldw	x,#32768
1611  000c 2003          	jra	L307
1612  000e               L107:
1613                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1615                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1617  000e ae1000        	ldw	x,#4096
1618  0011               L307:
1619  0011 1f05          	ldw	(OFST-1,sp),x
1620  0013 5f            	clrw	x
1621  0014 1f03          	ldw	(OFST-3,sp),x
1622                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1624  0016 a640          	ld	a,#64
1625  0018 1e07          	ldw	x,(OFST+1,sp)
1626  001a cd0000        	call	c_cmulx
1628  001d 96            	ldw	x,sp
1629  001e 1c0003        	addw	x,#OFST-3
1630  0021 cd0000        	call	c_ladd
1632  0024 be02          	ldw	x,c_lreg+2
1633  0026 1f01          	ldw	(OFST-5,sp),x
1634                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1636  0028 721a5051      	bset	20561,#5
1637                     ; 842   *pwFlash = (uint32_t)0;  
1639  002c 4f            	clr	a
1640  002d e703          	ld	(3,x),a
1641  002f e702          	ld	(2,x),a
1642  0031 e701          	ld	(1,x),a
1643  0033 f7            	ld	(x),a
1644                     ; 850 }
1647  0034 5b08          	addw	sp,#8
1648  0036 81            	ret	
1733                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1733                     ; 863 {
1734                     .text:	section	.text,new
1735  0000               _FLASH_WaitForLastOperation:
1737  0000 5205          	subw	sp,#5
1738       00000005      OFST:	set	5
1741                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1743  0002 aeffff        	ldw	x,#65535
1744  0005 1f03          	ldw	(OFST-2,sp),x
1745  0007 5f            	clrw	x
1746  0008 1f01          	ldw	(OFST-4,sp),x
1747                     ; 865   uint8_t flagstatus = 0x00;
1749  000a 0f05          	clr	(OFST+0,sp)
1750                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1752  000c a1fd          	cp	a,#253
1753  000e 262b          	jrne	L367
1755  0010 200e          	jra	L157
1756  0012               L747:
1757                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1757                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1759  0012 c65054        	ld	a,20564
1760  0015 a405          	and	a,#5
1761  0017 6b05          	ld	(OFST+0,sp),a
1762                     ; 873       timeout--;
1764  0019 96            	ldw	x,sp
1765  001a 5c            	incw	x
1766  001b a601          	ld	a,#1
1767  001d cd0000        	call	c_lgsbc
1769  0020               L157:
1770                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1772  0020 7b05          	ld	a,(OFST+0,sp)
1773  0022 2622          	jrne	L757
1775  0024 96            	ldw	x,sp
1776  0025 5c            	incw	x
1777  0026 cd0000        	call	c_lzmp
1779  0029 26e7          	jrne	L747
1780  002b 2019          	jra	L757
1781  002d               L167:
1782                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1782                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1784  002d c65054        	ld	a,20564
1785  0030 a441          	and	a,#65
1786  0032 6b05          	ld	(OFST+0,sp),a
1787                     ; 882       timeout--;
1789  0034 96            	ldw	x,sp
1790  0035 5c            	incw	x
1791  0036 a601          	ld	a,#1
1792  0038 cd0000        	call	c_lgsbc
1794  003b               L367:
1795                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1797  003b 7b05          	ld	a,(OFST+0,sp)
1798  003d 2607          	jrne	L757
1800  003f 96            	ldw	x,sp
1801  0040 5c            	incw	x
1802  0041 cd0000        	call	c_lzmp
1804  0044 26e7          	jrne	L167
1805  0046               L757:
1806                     ; 885   if (timeout == 0x00 )
1808  0046 96            	ldw	x,sp
1809  0047 5c            	incw	x
1810  0048 cd0000        	call	c_lzmp
1812  004b 2604          	jrne	L177
1813                     ; 887   flagstatus = FLASH_Status_TimeOut;
1815  004d a602          	ld	a,#2
1816  004f 6b05          	ld	(OFST+0,sp),a
1817  0051               L177:
1818                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1820  0051 7b05          	ld	a,(OFST+0,sp)
1823  0053 5b05          	addw	sp,#5
1824  0055 81            	ret	
1837                     	xdef	_FLASH_WaitForLastOperation
1838                     	xdef	_FLASH_EraseBlock
1839                     	xdef	_FLASH_ProgramBlock
1840                     	xdef	_FLASH_GetPowerStatus
1841                     	xdef	_FLASH_PowerRunModeConfig
1842                     	xdef	_FLASH_GetFlagStatus
1843                     	xdef	_FLASH_ITConfig
1844                     	xdef	_FLASH_EraseOptionByte
1845                     	xdef	_FLASH_ProgramOptionByte
1846                     	xdef	_FLASH_GetReadOutProtectionStatus
1847                     	xdef	_FLASH_GetCodeSize
1848                     	xdef	_FLASH_GetBootSize
1849                     	xdef	_FLASH_ReadByte
1850                     	xdef	_FLASH_ProgramWord
1851                     	xdef	_FLASH_EraseByte
1852                     	xdef	_FLASH_ProgramByte
1853                     	xdef	_FLASH_Lock
1854                     	xdef	_FLASH_Unlock
1855                     	xdef	_FLASH_DeInit
1856                     	xdef	_FLASH_PowerWaitModeConfig
1857                     	xdef	_FLASH_SetProgrammingTime
1858                     	xdef	_FLASH_GetProgrammingTime
1859                     	xref.b	c_lreg
1878                     	xref	c_lzmp
1879                     	xref	c_lgsbc
1880                     	xref	c_ladd
1881                     	xref	c_lgadd
1882                     	xref	c_cmulx
1883                     	end
