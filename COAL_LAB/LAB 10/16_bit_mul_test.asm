; 16-bit Multiplication Algorithm (Using TEST for Bit Testing)
[org 0x0100]

jmp start  ; Jump to the start of the program

; Data Section
multiplicand: dd 1300    ; 16-bit multiplicand (stored in 32-bit space)
multiplier:   dw 500     ; 16-bit multiplier
result:       dd 0       ; 32-bit result initialized to 0

; Code Section
start:
    mov cl, 16               ; Initialize bit count to 16
    mov bx, 1                ; Initialize bit mask

checkbit:
    test bx, [multiplier]    ; Test current bit in multiplier
    jz skip                  ; Skip addition if the current bit is 0

    ; Add the multiplicand to the result
    mov ax, [multiplicand]   ; Load lower 16 bits of multiplicand into AX
    add [result], ax         ; Add lower 16 bits to result

    mov ax, [multiplicand+2] ; Load upper 16 bits of multiplicand into AX
    adc [result+2], ax       ; Add upper 16 bits with carry to result

skip:
    ; Shift multiplicand left by 1 bit
    shl word [multiplicand], 1    ; Shift lower 16 bits of multiplicand left
    rcl word [multiplicand+2], 1  ; Rotate carry into upper 16 bits of multiplicand

    ; Shift bit mask to the next bit
    shl bx, 1                ; Shift BX left to test the next bit

    dec cl                   ; Decrement bit count
    jnz checkbit             ; Repeat if bit count is not zero

    ; Terminate the program
    mov ax, 0x4c00           ; Load termination code into AX
    int 0x21                 ; BIOS interrupt to terminate the program

; End of program
