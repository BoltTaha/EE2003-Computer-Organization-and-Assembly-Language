[org 0x0100]

mov ah,00000111db
mov dh,00001000db   
mov dl,00000010db


or ah,dh ; ah = 00001111
and ah,dh ; ah = 0001111
xor ah,dl ; ah = 0001101
ax,0001111db 
test ah,dh



mov ax,0x4c00
int o