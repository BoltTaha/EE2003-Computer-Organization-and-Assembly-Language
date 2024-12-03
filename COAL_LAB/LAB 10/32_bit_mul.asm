[org 0x0100]             ; Origin for .COM file, starts at offset 0x100

jmp start                ; Jump to the start of the program

multiplicand_low:  dd 60000         ; Lower 32 bits of the multiplicand
multiplicand_high: dd 0             ; Upper 32 bits of the multiplicand (set to 0)
multiplier:        dd 1300          ; 32-bit multiplier
result_low:        dd 0             ; Lower 32 bits of the result
result_high:       dd 0             ; Upper 32 bits of the result

start:
    mov cx, 32                       ; Initialize loop counter (32 bits for 32-bit multiplication)
    mov eax, [multiplier]            ; Load the multiplier into EAX

checkbit:
    shr eax, 1                       ; Shift the multiplier right by 1 bit
    jnc skip                         ; If no carry (current bit is 0), skip addition

    ; Perform addition if the current multiplier bit is 1
    mov edx, [multiplicand_low]      ; Load the lower 32 bits of the multiplicand
    add [result_low], edx            ; Add to the lower 32 bits of the result

    mov edx, [multiplicand_high]     ; Load the upper 32 bits of the multiplicand
    adc [result_high], edx           ; Add with carry to the upper 32 bits of the result

skip:
    shl dword [multiplicand_low], 1  ; Shift left the lower 32 bits of the multiplicand
    rcl dword [multiplicand_high], 1 ; Rotate carry into the upper 32 bits of the multiplicand
    dec cx                           ; Decrement loop counter
    jnz checkbit                     ; Repeat for 32 iterations

exit:
    mov ax, 0x4c00                   ; DOS interrupt to terminate the program
    int 0x21
