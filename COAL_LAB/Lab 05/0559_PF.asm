; Parity Flag
[org 0x0100]

mov al, 00001110b     ; Parity flag = 0
add al, 00000001b     ; Parity flag = 1
mov ax, 0x4c00        ; Parity flag = 1
int 0x21              ; Parity flag = 1
