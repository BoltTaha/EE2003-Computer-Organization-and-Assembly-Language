[org 0x0100]

mov al,50    ;00110010

mov dl,   00110000b    ; mask

xor al,dl    ;00000010   which is equal to 2 in ASCII

mov al,48 ;  00110000   

xor al,dl ; 00000000

mov al,54 ;00110110

xor al,dl ; 00000110       which is equal to 6 in ASCII




mov ax,0x4c00
int 0x21