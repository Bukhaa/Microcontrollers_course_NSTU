; adding two 32-bit numbers

.INCLUDE "2313def.inc"

; define reg ()
.DEF A0 = R16    ; the least significant byte of the number A
.DEF A1 = R17
.DEF A2 = R18
.DEF A3 = R19    ; the highest byte of the number A

.DEF B0 = R20  
.DEF B1 = R21
.DEF B2 = R22
.DEF B3 = R23

.CSEG
rjmp Reset

Reset:
    
	; init a = 0X12345678
    ldi A3, 0x12
    ldi A2, 0x34
    ldi A1, 0x56
    ldi A0, 0x78
    
    ; init b = 0X0A0B0C0D
    ldi B3, 0x0A
    ldi B2, 0x0B
    ldi B1, 0x0C
    ldi B0, 0x0D
    
    ; sum A + B
    add A0, B0  
    
    
    adc A1, B1  
    adc A2, B2  
    adc A3, B3

	; answer: A3:A2:A1:A0 = 0x1C3F6285

loop:
    rjmp loop
