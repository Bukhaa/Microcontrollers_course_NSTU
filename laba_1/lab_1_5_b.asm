; abs (sub two 8-bit numbers (signed))

.INCLUDE "2313def.inc"

; define reg ()
.DEF A0 = R16 
.DEF B0 = R17 
.DEF SIGN = R18

.CSEG
rjmp Reset

Reset:
    
	; init a = 0XE2 or a =0xCE
    ldi A0, 0xCE
    
    ; init b = 0XCE or b = 0XE2

    ldi B0, 0xE2
    
    ; sub A - B
    sub A0, B0
	sbrs A0, 7          ; Skip next if bit7=1 (negative)
    rjmp positive_result
	neg A0              ; Make absolute value
    ldi SIGN, 0x01
	rjmp loop

positive_result:
	ldi SIGN, 0x00
	
loop:
    rjmp loop
