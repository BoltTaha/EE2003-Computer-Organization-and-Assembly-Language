; Sign Flag
[org 0x0100]

mov cx,0              ; Sign flag = 0
sub cx,1              ; Sign flag = 1
add cx,2              ; Sign flag = 0
dec cx                ; Sign flag = 0
inc cx                ; Sign flag = 0
mov al,0              ; Sign flag = 0
sub al,1              ; Sign flag = 1
add al,2              ; Sign flag = 0
mov ax,0x4c00         ; Sign flag = 0
int 0x21              ; Sign flag = 0