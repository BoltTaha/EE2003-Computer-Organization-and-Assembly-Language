[org 0x0100]
 
 jmp start
num1: dw 0x500,0x100
num2: dw 0x1500
result: dw 0

start:

mov ax,[num1]
l1:
add ax,[num1+2]
cmp[num2],ax      ; Compare the current value of AX with num2 (0x1500)

jnc l1             ; If AX is less than num2, jump back to the l1 label to continue adding
mov [result],ax
mov ax, 0x4c00        
int 0x21 
