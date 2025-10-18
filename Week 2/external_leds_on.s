.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0X04

.org 0 

main:   
    ldi r16, 0
    out SREG, r16

    ldi r16, 0x0F       ; Set bits 0-3 in output mode.
    out DDRB, r16

    ldi r16, 0x0D       ; Send signal to bits 0 and 2-3.
    out PORTB, r16

mainloop: rjmp mainloop