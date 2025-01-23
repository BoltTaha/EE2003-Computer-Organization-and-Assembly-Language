[org 0x0100] 

jmp start
arr:db 1,3,9,2,4,8,7,1,6,5
sum1: db 0,0


start:

mov dx,0

mov bx,0
l2:
mov cx,5
l1:
mov ax,[arr + dx]
add  [sum1 + bx],ax
add dx,1
sub cx,1
jnz l1
add bx,1
cmp bx,1
je l2


mov ax,0x4c00
int 0x21





