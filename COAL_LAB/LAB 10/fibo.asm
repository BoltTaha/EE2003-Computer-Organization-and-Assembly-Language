[org 0x0100]             ; Origin for .COM file, starts at offset 0x100

jmp start                ; Jump to the start of the program

result dw 0              ; Memory location to store the result (initialized to 0)

start:
    mov ax, 0            ; Initialize AX to 0 (first Fibonacci number)
    mov bx, 1            ; Initialize BX to 1 (second Fibonacci number)
    mov cx, 10           ; Set the counter to calculate the first 10 Fibonacci numbers

main: 
    add ax, bx           ; Compute the next Fibonacci number (AX = AX + BX)
    mov [result], ax     ; Store the result in memory
    mov ax, bx           ; Move the previous value of BX to AX
    mov bx, [result]     ; Move the new Fibonacci value into BX
    sub cx, 1            ; Decrement the counter
    jnz main             ; Repeat until CX reaches 0

exit:
    mov ax, 0x4c00       ; Terminate the program
    int 0x21
