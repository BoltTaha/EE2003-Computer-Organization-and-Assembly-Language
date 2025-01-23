[org 0x0100]
 
 jmp start;
 
   sum: db 0
 
 start:  
    mov dx,0
 
 while_lable:
 inc dx
 mov cx,dx
 shr cx,1
 jnc l1
 

 cmp dx,10
 jbe while_lable
 jmp exit
  l1:
  add byte [sum],2
  jmp while_lable
  
 exit:
mov ax,0x4c00
int 0x21
