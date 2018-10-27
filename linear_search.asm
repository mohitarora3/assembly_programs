;........................................................................

data segment
    
    array db 1,2,3,4,5
    ele db 2		;ele variable stores the element to be searched
    FOUND db  'ELEMENT FOUND $'
    NOT_FOUND db 'ELEMENT NOT FOUND $'
    
data ends

;...........................................................................


;............................................................................

code segment
    
    assume ds:data,cs:code
    
    start:
         mov ax,data
         mov ds,ax
          
         xor ax,ax		;initializing ax register with value 0
         mov cx,5
         mov bl,2		
         mov si,-1
			
    
    next: 
        inc si       
        mov al,array[si]		;fetching next array element	
        cmp al,ele
        je present			;if search is successful
        loop next
   
        mov dx,offset NOT_FOUND		;if element is not present in arrray
            mov ah,9
            int 21h 
            jmp exit 
            
     present: mov dx,offset FOUND
            mov ah,9
            int 21h
       
            
     exit:hlt  
        
code ends
   end start        
   
;.............................................................
          
