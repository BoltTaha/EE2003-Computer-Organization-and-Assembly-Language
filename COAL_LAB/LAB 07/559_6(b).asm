[org 0x0100]

jmp start       

data: dw   2, 4, 6, 5
swap: db   0    ; use this as a flag 

start: 
     ; mov  cx, 4                          ; make passes, has to be outside the loop! 

    outerloop: 
        mov  bx, 0    
        mov  byte [swap], 0             ; Specifying byte in the mov instruction clarifies the operation as byte-sized and ensures type safety by preventing misuse with larger data sizes.
    
        innerloop: 
            mov  ax, [data + bx]
            cmp  ax, [data + bx + 2]    ; We move the value to AX because comparisons must be made using registers, as direct memory-to-memory comparisons aren't allowed.
            
            jbe  noswap                 ; if we don't have to swap, we just jump over the swap thing 

                ; the swap potion  
                mov  dx, [data + bx + 2]      ; Memory-to-memory moves aren't allowed in assembly, so values are first transferred to a register before being moved to another memory location.
                mov  [data + bx + 2], ax    ; We move the value to DX to store it temporarily because we need to swap it with the value in AX, which is being moved to the second memory location.
                mov  [data + bx], dx
                mov  byte [swap], 1 

            noswap:
            add  bx, 2
            cmp  bx, 6
            jne  innerloop

        ; if we didn't swap even once, we should be done 
        cmp  byte [swap], 1     ; No, we don’t need to use a register because the cmp instruction can compare a memory value directly with a number, like 1.
        je   outerloop 

        ; check outer loop termination 
        ; sub cx, 1 
        ; jnz outerloop 


    ; exit system call 
    mov  ax, 0x4c00
    int  0x21



