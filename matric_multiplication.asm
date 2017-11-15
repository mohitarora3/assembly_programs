

;.......................................................

data segment
    matric1 db 1,2,3
            db 4,5,6
            db 1,1,1
            
    matric2 db 2,3,4
            db 5,6,7
            db 1,1,1 
           
    matric3 db 9 dup(?)  
    
    three db 3
           
data ends

;.........................................................




;.........................................................

code segment
    assume ds:data,cs:code
    
    start:
            mov ax,data
            mov ds,ax
            mov bp,0
            
            mov cx,3     
       
      next1:push cx 
            mov bx,0
            mov cx,3
     
      next2: 
            push cx
            mov si,0
            mov cx,3
           
      
            
       next3: 
     
            mov al,matric1[bp][si] 
            push si                
            push ax
            mov ax,si
            mul three
            mov si,ax 
            pop ax
            mul matric2[si][bx]
            pop si 
            mov di,bp
            add matric3[di][bx],al
            inc si
            loop next3
            inc bx
            pop cx 
            loop next2
            add bp,3
            pop cx
            loop next1
            
      exit: hlt
            
            
code ends

end start
              
;.............................................................            
            