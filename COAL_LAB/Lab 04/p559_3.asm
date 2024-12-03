[org 0x0100]
  
 
  mov ax , [num1] 
  
  add [num1 + 8 ] , ax
  
  mov ax , [num1 + 2]  
  
  add [num1 + 8 ] , ax
  
  mov ax , [num1 + 4]  
  
  add [num1 + 8] , ax  
  
  mov ax , [num1 + 6]  
  
  add [num1 + 8] , ax  
   
  xor ax,ax
  
  mov ax , 0x4c00
  int 0x21
  
  num1 : dw 1 , 2 , 3, 4 , 0