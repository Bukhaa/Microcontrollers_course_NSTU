.INCLUDE "2313def.inc"

.DEF A_L = R16
.DEF A_H = R17  
.DEF B = R18
.DEF TEMP = R19

.CSEG
rjmp Reset

Reset:
    ; A = 65535 (unsigned 16-bit) = 0xFFFF
    ldi A_H, 0xFF
    ldi A_L, 0xFF
    
    ; B = 1 (unsigned 8-bit) = 0x01
    ldi B, 0x01

    add A_L, B      
    clr TEMP         ; temp = 0x00 for unsigned
    adc A_H, TEMP    ; A_H = A_H + 0 + Carry
    
	; check on carry flag
    brcc no_carry_unsigned
    
    ; carry = true => overflow for unsigned
    rjmp carry_handler

; check    
no_carry_unsigned:
	ldi TEMP, 0x01 

carry_handler:
	ldi TEMP, 0x02

loop:
    rjmp loop

	/*
		for example not overflow for unsigned:
		A = 1000 = 0x03E8
		B = 200  = 0xC8
		A_L -> oferwflow, ok (carry = 1)
		A_H -> not overflow (A_H + TEMP + 1 != overflow int this situation)
	*/
