; Reads value from PORTC and writes to PORTB

.equ SREG, 0x3f

.equ PORTB, 0x05
.equ DDRB, 0X04

.equ DDRC, 0x07
.equ PINC, 0x06

.org 0 

main:   
    ldi r16, 0
    out SREG, r16

    ldi r16, 0x0F       ; Set bits 0-3 of PORTB in output mode.
    out DDRB, r16

    ldi r16, 0xF0       ; Set bits 0-3 of PORTC in input mode and 4-7 in output mode.
    out DDRC, r16

    in r16, PINC        ; Read input from external pins of PORTC to r16.

    ldi r17, 1
    sub r16, r17        ; Subtract r17 from r16;

    out PORTB, r16      ; Send signal to bit 0 and 2-3 of PORTB.

mainloop: rjmp mainloop