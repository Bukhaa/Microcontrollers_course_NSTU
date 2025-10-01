.INCLUDE "..\appnotes\2313def.inc"

.CSEG
rjmp Reset

Reset:
	ser r17
	mov r0, r17
	ldi r16, 0x55
	subi r16, 0x11
	add r16, r0

loop:
	rjmp loop
