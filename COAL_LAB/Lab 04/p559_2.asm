[org 0x0100]

mov ah,[num1]
mov bh,[num1 + 1]
add ah,bh
mov bh,[num1 + 2]
add ah,bh
mov [num1 + 3],ah
xor ah,ah
mov ax,0x4c00
int 0x21

num1: db 5,10,15,0
      