; 4-bit Multiplication Algorithm
; Course: Computer Architecture & Assembly Language Programming
; Course Code: CS401
; Institution: Virtual University of Pakistan

[org 0x100]  ; Origin point of the program in memory

jmp start    ; Jump to start label

; Data Section
multiplicand: db 13      ; 4-bit multiplicand stored in an 8-bit space
multiplier:   db 5       ; 4-bit multiplier stored in an 8-bit space
result:       db 0       ; 8-bit result initialized to 0

; Code Section
start:
    mov cl, 4           ; Initialize bit count to 4
    mov bl, [multiplicand] ; Load multiplicand into BL
    mov dl, [multiplier]   ; Load multiplier into DL

checkbit:
    shr dl, 1           ; Shift right DL (move rightmost bit into carry)
    jnc skip            ; Skip addition if carry is clear (bit is 0)
    add [result], bl    ; Add BL (multiplicand) to result

skip:
    shl bl, 1           ; Shift BL (multiplicand) left
    dec cl              ; Decrement bit count
    jnz checkbit        ; Repeat if bit count is not zero

    mov ax, 0x4c00      ; Terminate program
    int 0x21            ; BIOS interrupt to exit

; End of program
