; sub two 32-bit numbers

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
    
	; init a = 0X0D0C0B0A
    ldi A3, 0x0D
    ldi A2, 0x0C
    ldi A1, 0x0B
    ldi A0, 0x0A
    
    ; init b = 0X010E0304
    ldi B3, 0x01
    ldi B2, 0x0E
    ldi B1, 0x03
    ldi B0, 0x04
    
    ; sub A - B
    sub A0, B0  
    
    
    sbc A1, B1  
    sbc A2, B2  
    sbc A3, B3

	; for example: a = 0X0D0C0B0A, b = 0X001020304
	; => answer: A3:A2:A1:A0 = 0x0C0A0806
	; for example: a = 0X0D0C0B0A, b = 0X010D0304
	; => answer: A3:A2:A1:A0 = 0x0BFF0806
	; for example: a = 0X0D0C0B0A, b = 0X010E0304
	; => answer: A3:A2:A1:A0 = 0x0BFE0806

loop:
    rjmp loop
