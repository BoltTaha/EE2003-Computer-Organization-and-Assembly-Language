[org 0x1000]

mov ax, 0x0000
start: inc ax     ; Increment the value in AX by 1
        JE start  ; Jump to the start label if the zero flag is set (if AX is 0)
        mov ax,0x4c00
        int 0x21
        
        