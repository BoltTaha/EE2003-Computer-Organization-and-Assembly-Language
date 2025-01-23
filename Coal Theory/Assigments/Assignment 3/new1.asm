[org 0x0100]

mov ax, 1100010110100011b
mov bx, 0
mov cx, 0

start:
    mov dx, ax
    mov cx, 0

count_ones:
    and dx, 1
    add cx, dx
    shr dx, 1
    cmp dx, 0
    jnz count_ones

    add bx, 1
    cmp cx, 1
    jz end

    mov cx, 16
    mov dx, 0

rotate_and_check:
    rol ax, 1
    and ax, 1
    add dx, ax
    sub cx, 1
    cmp cx, 0
    jnz rotate_and_check

    cmp dx, 2
    jl start
    add bx, 1

end:
    mov ax, 0x4c00
    int 0x21
