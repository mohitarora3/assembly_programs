data segment
    
    array db 5,4,3,2,1,9,100,78,0
    size dw 9
    
 data ends



code segment 
    
    assume ds:data, cs:code
    
    start:
            mov ax,data
            mov ds,ax
            
            
            mov cx,size
            dec cx
          
            
            l1:   
                push cx
                mov si,0
                mov di,1 
                
                dec word ptr size
                cmp size,0
                je end
                mov cx,size
               
                
            l2:
                mov al,array[si]
                cmp al,array[di]
                jle next
                mov al,array[si]
                xchg al,array[di]
                mov array[si],al
                
             next:  inc si
                    inc di
                    loop l2 
                    
                    pop cx
                    loop l1 
                    
             end:hlt
             
  code ends

    end start