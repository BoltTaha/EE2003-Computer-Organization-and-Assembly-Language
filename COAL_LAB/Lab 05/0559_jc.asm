[org 0x0100]
 
 jmp start
num1: dw 50,100
result: dw 0

start:

mov ax,[num1]
add ax,[num1+2]
cmp ax,255
jnc start
mov [result],ax
mov ax, 0x4c00        
int 0x21 













mov ax, 0x4c00        
int 0x21 