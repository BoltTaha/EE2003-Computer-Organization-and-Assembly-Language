; Carry Flag
[org 0x0100]

mov ah, 11111111b     ; Carry flag = 0
add ah, 1             ; Carry flag = 1
mov al, 00001111b     ; Carry flag = 1
add al, 1             ; Carry flag = 0
mov ax, 0x4c00        ; Carry flag = 0
int 0x21              ; Carry flag = 0
