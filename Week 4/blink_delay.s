.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0X04

.org 0 

main:   
    ldi r16, 0
    out SREG, r16

    ldi r16, 0x01       ; Set bits 0 in output mode.
    out DDRB, r16

    ldi r16, 0x01       ; Send signal to bit 0.
    out PORTB, r16
    
    call halfsec

    ldi r20, 0x00
    out PORTB, r20

    call halfsec

rjmp main

; inner loop is 5 cycles so delay is - 
; 5 cycles * 200 * 200 * 40 = 8000000 cycles
; 8000000 cycles / 16,000,000 = 0.5 seconds 
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