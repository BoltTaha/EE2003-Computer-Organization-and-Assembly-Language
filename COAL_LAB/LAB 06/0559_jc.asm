[org 0x0100]
 
 jmp start
num1: dw 0x50,0x100
result: dw 0

start:

mov ax,[num1]
l1:
add ax,[num1+2]
cmp ax,0x255

; Jump if carry flag is set (if AX < 0x255)

jc l1    ; If the carry flag is set, go back to l1 and repeat the addition
mov [result],ax
mov ax, 0x4c00        
int 0x21 


