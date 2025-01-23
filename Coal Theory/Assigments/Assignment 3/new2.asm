[org 0x0100]

mov ax,6
mov bx,99     


mov dx,1         

mov cx,ax
sub cx,1
l1:

shl dx,1
sub cx,1
jnz l1
             
xor bx,dx                           

mov ax,0x4c00
int 0x021
