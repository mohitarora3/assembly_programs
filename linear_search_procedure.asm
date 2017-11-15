;........................................................

data segment    
   
    array    db 1,2,3,4,5 
    element  db 7
    found    db 'Element found$'    
    notfound db 'Element not found$'
    
data ends

;...............................................................
            
         

;..............................................................                                                                

code segment
    
assume    ds:data, cs:code                                     

     
      start:
            mov ax,data
            mov ds,ax
            
            call Search  
            
            hlt 
              
;...............................................        
    Search proc near
    push ax
    push dx
    push cx
    push si
    
     
     mov si,-1
     mov cx,5
    
    next: 
        xor ax,ax
        inc si    
        mov al,array[si]
        cmp al,element
        je f
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

;.......................................................  
                        
code ends
             
end start

;............................................................


;..........................................................

  

            

 

           
        
        
     
    