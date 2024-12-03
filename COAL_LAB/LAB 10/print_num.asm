; Number Printing Algorithm
[org 0x0100]

jmp start  ; Jump to the start of the program

; Subroutine: Clear Screen
clrscr:
    push es
    push ax
    push di

    mov ax, 0xb800           ; Set video base address
    mov es, ax               ; Point ES to video memory
    mov di, 0                ; Point DI to the top-left corner of the screen

nextloc:
    mov word [es:di], 0x0720 ; Clear screen with space and attribute
    add di, 2                ; Move to the next screen position
    cmp di, 4000             ; Check if the entire screen is cleared
    jne nextloc              ; If not, continue clearing

    pop di
    pop ax
    pop es
    ret                      ; Return from subroutine

; Subroutine: Print Number
; Parameters:
;   [bp+4] - Number to be printed
printnum:
    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di

    mov ax, 0xb800           ; Set video base address
    mov es, ax               ; Point ES to video memory

    mov ax, [bp+4]           ; Load number into AX
    mov bx, 10               ; Set base 10 for division
    mov cx, 0                ; Initialize digit count

nextdigit:
    mov dx, 0                ; Zero upper half of the dividend
    div bx                   ; Divide AX by 10
    add dl, 0x30             ; Convert remainder to ASCII
    push dx                  ; Push ASCII value onto the stack
    inc cx                   ; Increment digit count
    cmp ax, 0                ; Check if quotient is zero
    jnz nextdigit            ; If not, process the next digit

    mov di, 0                ; Start printing at the top-left corner

nextpos:
    pop dx                   ; Pop a digit from the stack
    mov dh, 0x07             ; Set normal attribute
    mov [es:di], dx          ; Write character to screen
    add di, 2                ; Move to the next screen position
    loop nextpos             ; Repeat until all digits are printed

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret 2                    ; Return from subroutine, clean up parameters

; Main Program
start:
    call clrscr              ; Clear the screen
    mov ax, 4529             ; Load the number to be printed
    push ax                  ; Push number onto the stack
    call printnum            ; Call the printnum subroutine

    mov ax, 0x4c00           ; Terminate program
    int 0x21                 ; DOS interrupt for program termination
