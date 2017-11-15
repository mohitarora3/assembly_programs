;...........................................................

data segment
    
    matric1 dw 1,2,3
            dw 4,5,6
           
    matric2 dw 2,3,4
            dw 5,6,7
           
    matric3 dw dup 6(?)
    
data ends

;.............................................................


;.............................................................
code segment
   assume ds:data cs:code
   
   start:
            mov ax,data
            mov ds,ax
           
            
            mov dx,0
            mov si,0 
            mov cx,2
            
      next1:        
            push cx 
            mov si,0 
            mov cx,3
            
      next2: 
            xor ax,ax
            mov ax,matric1[bx][si]
            add ax,matric2[bx][si]
            mov matric3[bx][si],ax
            inc si    
            inc si
            loop next2 
            add bx,6
            pop cx
            loop next1 
            hlt
code ends

end start
            
            
;........................................................          
            
            
            
            