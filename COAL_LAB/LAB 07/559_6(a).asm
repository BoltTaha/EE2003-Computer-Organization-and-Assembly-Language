[org 0x0100]

jmp start       

data: dw  6, 4, 5, 2


start: 
    mov  cx, 4                          ; make 4 passes, has to be outside the loop! 

    outerloop: 
        mov  bx, 0            
        
        innerloop: 
            mov  ax, [data + bx]
            cmp  ax, [data + bx + 2]    ; The direct move from memory to memory is not Possible, so for this we firstly move data to register from memory. 
                                        ; and then compare the data register to memory
	
            jbe  noswap                 ; if we don't have to swap, we just jump over the swap thing 
                                        ; think of this as the "if"

                ; the swap potion 
                mov  dx, [data + bx + 2]   ; ; We move the value to DX to store it temporarily because we need to swap it with the value in AX, which is being moved to the second memory location.
                mov  [data + bx + 2], ax   ; Memory-to-memory moves aren't allowed in assembly, so values are first transferred to a register before being moved to another memory location.
             
                mov  [data + bx], dx

            noswap:
            add  bx, 2
            cmp  bx, 6
            jne  innerloop

        ; check outer loop termination 
        sub cx, 1 
        jnz outerloop 


    ; exit system call 
    mov  ax, 0x4c00
    int  0x21



