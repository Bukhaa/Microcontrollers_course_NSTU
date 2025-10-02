; abs (sub two 8-bit numbers (unsigned))

.INCLUDE "2313def.inc"

; define reg ()
.DEF A0 = R16 
.DEF B0 = R17 
.DEF CARRY = R18

.CSEG
rjmp Reset

Reset:
    
	; init a = 0X1E
    ldi A0, 0x1E ;1E
    
    ; init b = 0X32
    ldi B0, 0x32
    
    ; sub A - B
    sub A0, B0
	brcc no_carry_flag ; go to no_carry if A >= B
	
	com A0
	inc A0
	ldi CARRY, 0x01
	rjmp loop

no_carry_flag:
	ldi CARRY, 0x00
	
loop:
    rjmp loop
