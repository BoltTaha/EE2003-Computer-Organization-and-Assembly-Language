[org 0x0100]

; start of code Task 1

mov  ax, 0x1234              
mov  bx, 0xABFC             
mov cx, 0xB100
mov dx, 0xB800


mov  ax, 0x4c00         ; exit .. 
int  0x21               ; .. is what the OS should do for me





; watch the listing carefully 