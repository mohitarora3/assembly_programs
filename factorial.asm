
;...............................................................

data segment                                                    
    
    number db 4
    result dw ?    
    
data ends 

;................................................................


;.................................................................

code segment
  
assume    ds:data, cs:code

      
      start:
            mov ax,data
            mov ds,ax
            
            
            
            mov cl,number   
            mov bl,number 
            mov al,bl
            dec cl  
            
            
            next:
                
                 dec bl
                 mul bl
                 loop next
                 mov result,ax
                 hlt
                 
code ends

end start


;............................................................................    