[org 0x0100]

jmp start
num: db 3,8,9,6
evenflag: db 0
oddflag: db 0
start:

mov bh,00000001     ;mask
mov si,0
mov cx,4

loop1:
mov ah,[num + si]
and ah,bh
jz l1

mov byte[evenflag],0
mov byte[oddflag],1
 
jmp final

l1:
mov byte[evenflag],1
mov byte[oddflag],0

final:
add si,1
sub cx,1
jnz loop1









mov ax,0x4c00
int 0x21