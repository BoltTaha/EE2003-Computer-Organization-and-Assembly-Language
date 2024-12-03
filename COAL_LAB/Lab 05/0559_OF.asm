; Overflow Flag
[org 0x0100]

mov al, 127           ; Overflow flag = 0
sub al, 1             ; Overflow flag = 0
mov ax, 0x4c00        ; Overflow flag = 0
int 0x21              ; Overflow flag = 0
