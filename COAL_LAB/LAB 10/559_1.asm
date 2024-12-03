[org 0x0100]
jmp start

data: 
    dw 60, 55, 45, 50, 40, 35, 25, 30, 10, 0 
swap: 
    db 0 

bubblesort: 
    dec cx               
    shl cx, 1            

mainloop: 
    mov si, 0            
    mov byte [swap], 0   

innerloop: 
    mov ax, [bx+si]      
    cmp ax, [bx+si+2]    
    jbe noswap           

    mov dx, [bx+si+2]    
    mov [bx+si], dx      
    mov [bx+si+2], ax    
    mov byte [swap], 1   

noswap: 
    add si, 2            
    cmp si, cx           
    jne innerloop        

    cmp byte [swap], 1   
    je mainloop          
    ret                  

start: 
    mov bx, [data]         
    mov cx, 10           
    call bubblesort      

    mov ax, 0x4c00       
    int 0x21
