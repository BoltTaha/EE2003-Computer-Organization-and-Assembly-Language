[org 0x0100]

mov ah,00000111b
mov dh,00001000b   
mov dl,00000010b


or ah,dh ; ah = 00001111
and ah,dh ; ah = 0001000
xor ah,dl ; ah = 0001010
mov ah,0001111b 
test dh,ah



mov ax,0x4c00
int 0x21