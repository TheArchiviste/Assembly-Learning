.equ SREG, 0x3f             ;Define SREG label.

.org 0

main:   ldi r16, 0          ; Set register 16 to 0.
        out SREG, r16       ; Copy the content of r16 to SREG.

mainloop: rjmp mainloop     ; Jump to mainloop address.
