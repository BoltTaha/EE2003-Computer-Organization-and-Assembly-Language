; Zero Flag
[org 0x0100]

mov cx,1              ; Zero flag = 0
sub cx,1              ; Zero flag = 1
mov ax,0xFFFF         ; Zero flag = 1
inc ax                ; Zero flag = 1
inc ax                ; Zero flag = 0
mov ax,0x4c00         ; Zero flag = 0
int 0x21              ; Zero flag = 0
