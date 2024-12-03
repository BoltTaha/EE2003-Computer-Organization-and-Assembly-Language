[org 0x0100]

;mov ah,'t'
;mov al,'a'

;mov dh,'h'
;mov dl,'a'
jmp start
lowercase: db 't','a','h','a'   ;after performing the opearations characters are change to the lower case to the upper case
uppercase: db 'T','A','H','A'
result: db 0
start:
mov cx,4
mov si,0
l1:
mov bh,[lowercase + si]
sub bh,[uppercase + si]     ; create mask by just sub uppercase from lower case

xor [lowercase + si],bh
add si,1
sub cx,1
jnz l1


mov ax,0x4c00
int 0x21