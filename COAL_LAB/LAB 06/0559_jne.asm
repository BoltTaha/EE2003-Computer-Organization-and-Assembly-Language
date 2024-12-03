[org 0x0100]
 
 jmp start
num1: dw 0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10
num2: dw 16
result: dw 0

start:

mov ax,[num1]
mov bx,2
l1:
add ax,[num1+bx]
add bx,2
cmp bx,[num2]    ; Compare the current index (BX) with the value of num2 (16)


jne l1        If BX is not equal to num2, jump back to l1 to add the next element

mov [result],ax
mov ax, 0x4c00        
int 0x21 
