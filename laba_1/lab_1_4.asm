; adding 32-bit number with constant

.INCLUDE "2313def.inc"

; define reg ()
.DEF A0 = R16    ; the least significant byte of the number A
.DEF A1 = R17
.DEF A2 = R18
.DEF A3 = R19    ; the highest byte of the number A
.DEF CONST = R20

.CSEG
rjmp Reset

Reset:
    
	; init a = 0X22334455
    ldi A3, 0x22
    ldi A2, 0x33
    ldi A1, 0x44
    ldi A0, 0x55
    
    ; init constant
    ldi CONST, 0x66
	; R21 = 0
	clr R21

    ; sum A + CONST
    add A0, CONST
    adc A1, R21  
    adc A2, R21 
    adc A3, R21

	; answer: A3:A2:A1:A0 = 0x223344BB

loop:
    rjmp loop
