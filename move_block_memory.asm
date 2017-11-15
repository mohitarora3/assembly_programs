
;..................................................

data segment 

    source db 1,2,3,4,5,6,7,8,9,10 
    destination db ?

data  ends

;.....................................................


;.......................................................

code segment
    assume data:ds,code:cs
    
    start:mov ax,data
           mov ds,ax
           
          mov si,0
          mov di,0  
          mov cx,10
          xor ax,ax		;initializing ax register with value 0
          
     next:  mov al,source[si]
            mov destination[di],al	;moving data from source to destination 
            inc si
            inc di
            loop next
            
           hlt
code ends
end start
 
;...............................................................   
    
                                                            