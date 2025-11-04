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

    call halfsec

    call bitmask_lower
    call bitshift_lower

    out PORTB, r16
    out PORTD, r16

    call halfsec

    call bitmask_upper
    call bitshift_upper

    or r17, r18

    out PORTB, r17
    out PORTD, r17

    call halfsec

rjmp main

bitmask_lower: 
    ldi r17, 0x0F
    and r17, r16

    out PORTB, r17
    out PORTD, r17

    call halfsec
    ret

bitshift_lower:
    lsl r17
    lsl r17
    lsl r17
    lsl r17

    out PORTB, r17
    out PORTD, r17

    call halfsec
    ret

bitmask_upper:
    ldi r18, 0xF0
    and r18, r16

    out PORTB, r18
    out PORTD, r18

    call halfsec
    ret

bitshift_upper:
    lsr r18
    lsr r18
    lsr r18
    lsr r18

    out PORTB, r18
    out PORTD, r18

    call halfsec
    ret

halfsec:     
    ldi r31, 200
    loop_1: 
            dec r31

            ldi r30, 200
            loop_2: 
                    dec r30

                    ldi r29, 40
                    loop_3: nop
                            dec r29
                            cpi r29, 0
                            brne loop_3

                    cpi r30, 0
                    brne loop_2 

            cpi r31, 0
            brne loop_1
     ret