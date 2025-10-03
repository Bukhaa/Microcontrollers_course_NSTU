.INCLUDE "2313def.inc"

.DEF A_L = R0
.DEF A_H = R1
.DEF B_L = R2  
.DEF B_H = R3
.DEF TEMP = R16
.DEF RES_L = R17
.DEF RES_H = R18

.CSEG
rjmp Reset

Reset:
    ldi TEMP, 0x12    
	mov A_H, TEMP     

	ldi TEMP, 0x34  
	mov A_L, TEMP     

	ldi TEMP, 0xF2
	mov B_H, TEMP     

	ldi TEMP, 0x34
	mov B_L, TEMP     
    
    cp   A_L, B_L      
    cpc  A_H, B_H     
    breq case_equal   ; br if equal
     
    mov  TEMP, A_H
    eor  TEMP, B_H    ; xor => 1 if sign 1 and 0 or 0 and 1
    sbrc TEMP, 7      ; Skip Next Instruction if Bit 7 in TEMP is Clear
    rjmp case_diff_signs 

	rjmp case_else

case_equal:
    add A_L, B_L     
    adc A_H, B_H     
   
    mov  RES_L, A_L
    mov  RES_H, A_H
    rjmp loop

case_diff_signs:
    sub A_L, B_L     
    sbc A_H, B_H     
 
    mov  RES_L, A_L
    mov  RES_H, A_H
    rjmp loop

case_else:        ; a + (0xFFFF - B) => A - B + 0XFFFF
    sub A_L, B_L     
    sbc A_H, B_H     
    
    ldi TEMP, 0xFF
    add A_L, TEMP    
    adc A_H, TEMP    
    
    mov RES_L, A_L
    mov RES_H, A_H

loop:
    rjmp loop
