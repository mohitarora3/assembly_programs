;............................................................................

data segment
     
    array db 1,2,3,4,5
    FOUND db 'ELEMENT FOUND $'
    NOT_FOUND db 'ELEMENT NOT FOUND $'
    ele db 2				    ;ele variable stores the element to be searched
    first dw 0
    last dw 4 
    two db 2
    
data ends 

;............................................................................


;.............................................................................

 
code segment
    assume ds:data, cs:code
    
    start:
        mov ax,data
        mov ds,ax
       
     next:  
        mov ah,0
        mov ax,first
        add ax,last
        div two    			    ;performing divide operation      
        
        mov ah,0
        mov si,ax
        mov al,array[si]
        cmp al,ele 
        je present
        		            	;if element is present in the array
        jl  right_half 			;search in right half
        dec si				
        mov last,si 
        jmp next1
        
        right_half:
                    inc si
                    mov first,si

        next1:
                mov ah,0
                mov ax,first
                cmp ax,last
                jle next
	            mov dx,offset NOT_FOUND
	            mov ah,9
	            int 21h
	            jmp exit
       
        
        
        
    
     
        present:
            mov dx,offset FOUND
		    mov ah,9 
		    int 21h
     
     
       
    exit: hlt
     
code ends

end start
        
        
;...............................................................        
        
     