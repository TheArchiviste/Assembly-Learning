.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0X04
.equ PORTD, 0x0B
.equ DDRD, 0x0A

.org 0 

main:   
    ldi r16, 0
    out SREG, r16

    ldi r16, 0x0F
    out DDRB, r16

    ldi r16, 0xF0
    out DDRD, r16

    ldi r16, 0x81
    out PORTB, r16
    out PORTD, r16

    ldi r17, 0x0F
    and r16, r17

    out PORTB, r16
    out PORTD, r16

    lsl r16
    lsl r16
    lsl r16
    lsl r16

    out PORTB, r16
    out PORTD, r16

mainloop: rjmp mainloop