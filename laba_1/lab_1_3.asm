.INCLUDE "2313def.inc"

.DEF A_L = R16
.DEF A_H = R17  
.DEF B = R18
.DEF TEMP = R19

.CSEG
rjmp Reset

Reset:
    ; A = -32768 (dop code) = 0x8000
    ldi A_H, 0x80
    ldi A_L, 0x00
    
    ; B = -1(dop code) = 0xFF
    ldi B, 0xFF

	/*
		10000000  (0x80)
	  + 11111111  (0xFF)
	  +        0  (Carry)
		-----------
	   101111111		 
	*/

    add A_L, B      
    clr TEMP
	sbrc B, 7        ; Skip the next command if bit 7 = 0 (sign extension)
					 ; If B is a sign, extend it as F, otherwise extend it as 0
    ldi TEMP, 0xFF         
    adc A_H, TEMP
	
    
	; not overflow
    brvc no_overflow_sign
    
    ; overflow
    rjmp overflow_handler

; check    
no_overflow_sign:
	ldi TEMP, 0x01 

overflow_handler:
	ldi TEMP, 0x02

loop:
    rjmp loop
