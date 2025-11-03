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

    ldi r16, 0x55
    out PORTB, r16
    out PORTD, r16

    call halfsec

    lsl r16
    out PORTB, r16
    out PORTD, r16

    call halfsec

    lsr r16
    out PORTB, r16
    out PORTD, r16

    rjmp main

halfsec:     
    ldi r17, 200
    loop_1: 
            dec r17

            ldi r18, 200
            loop_2: 
                    dec r18

                    ldi r19, 40
                    loop_3: nop
                            dec r19
                            cpi r19, 0
                            brne loop_3

                    cpi r18, 0
                    brne loop_2 

            cpi r17, 0
            brne loop_1
     ret