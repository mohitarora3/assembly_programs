                
;...............................................
  
data segment 
   table dw 3 dup(?)
  array dw 1h,2h,3h,4h,5h
  element dw 2
  size dw 5  
  found    db 'Element found$'    
  notfound db 'Element not found$'       
data ends


;..................................................
            
         
;....................................................
  
code segment
    
assume    ds:data, cs:code 
     
      start:
            mov ax,data
            mov ds,ax  
            
            
            mov table,offset array
            mov table+2,offset size
            mov table+4,offset element
            mov bx,offset table 
            
            call Search           ;calling procedure Search
            hlt      
            
;........................................................            
   Search proc near
           
            
    push ax
    push dx
    push cx
    push si
    
     
     mov si,[bx]
     mov di,[bx+2]
     mov cx,[di]
     mov di,[bx+4]
    
    next: 
        xor ax,ax  
        mov al,[si]
        cmp al,[di]
        je f 
        inc si
        inc si
        loop next 
        jmp n
        
     f: mov dx,offset found
        mov ah,9
        int 21h
        jmp e
        
     n: mov dx,offset notfound
        mov ah,9
        int 21h
       
     e:pop si
       pop cx
       pop dx
       pop ax
       ret
      
           
Search endp
  
;.....................................................                        
code ends
             
end start

;.....................................................




  

            

 

           
        
        
     
    