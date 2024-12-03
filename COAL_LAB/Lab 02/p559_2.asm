[org 0x0100]

; start code Task 2


 mov bl,10   
 mov dx,5
 
 mov cl,bl
 mov ax,dx
 
 mov al,0x12
 mov ax,0x1234
 mov ax,0xffff
 
 mov  ax, 0x4c00 
 int  0x21
 