[org 0x0100]

jmp start

result dw 1          ; Reserve a word in memory for the result

start:
    mov ax, 5        ; Change this value to calculate factorial of a different number
    cmp ax, 0        ; Check if the number is 0
    jne not_zero     ; If not zero, continue with the factorial calculation

    ; Handle 0! = 1
    mov ax, 1        ; Set AX = 1 since 0! = 1
    mov [result], ax ; Store the result
    jmp done         ; Skip the factorial calculation

not_zero:
    mov bx, ax       ; Copy the number into BX for loop control

factorial_loop:
    cmp bx, 1        ; Check if BX is 1 (factorial loop end condition)
    je done          ; If BX == 1, exit loop

    dec bx           ; Decrement BX
    mul bx           ; Multiply AX by BX (AX = AX * BX)
    jmp factorial_loop ; Repeat the loop

done:
    mov [result], ax ; Store the final result

    ; Exit program
    mov ax, 0x4c00
    int 0x21
