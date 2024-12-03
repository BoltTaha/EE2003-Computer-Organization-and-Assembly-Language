; Hello World Program in Assembly Language
[org 0x0100]

jmp start  ; Jump to the start of the program

; Data Section
message: db 'hello world'    ; String to be printed
length:  dw 11               ; Length of the string

; Subroutine to clear the screen
clrscr:
    push es
    push ax
    push di

    mov ax, 0xb800           ; Set video base address
    mov es, ax               ; Point ES to video base
    mov di, 0                ; Point DI to top left column

nextloc:
    mov word [es:di], 0x0720 ; Clear next char on screen (space with attribute)
    add di, 2                ; Move to next screen location
    cmp di, 4000             ; Check if the whole screen is cleared
    jne nextloc              ; If not, clear the next position

    pop di
    pop ax
    pop es
    ret                      ; Return from subroutine

; Subroutine to print a string at the top-left of the screen
; Parameters:
;   [bp+6] - Address of the string
;   [bp+4] - Length of the string
printstr:
    push bp
    mov bp, sp
    push es
    push ax
    push cx
    push si
    push di

    mov ax, 0xb800           ; Set video base address
    mov es, ax               ; Point ES to video base
    mov di, 0                ; Point DI to top-left column

    mov si, [bp+6]           ; Load string address into SI
    mov cx, [bp+4]           ; Load string length into CX
    mov ah, 0x07             ; Normal attribute

nextchar:
    mov al, [si]             ; Load next character from the string
    mov [es:di], ax          ; Display character on the screen
    add di, 2                ; Move to the next screen location
    add si, 1                ; Move to the next character in the string
    loop nextchar            ; Repeat for all characters in the string

    pop di
    pop si
    pop cx
    pop ax
    pop es
    pop bp
    ret 4                    ; Return from subroutine and clean up parameters

; Main Program
start:
    call clrscr              ; Clear the screen
    mov ax, message          ; Load the address of the message
    push ax                  ; Push the address of the message
    push word [length]       ; Push the length of the message
    call printstr            ; Call the printstr subroutine

    mov ax, 0x4c00           ; Terminate program
    int 0x21                 ; DOS interrupt for program termination
