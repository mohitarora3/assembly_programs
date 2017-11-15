
;..............................................................................
data segment                                                                   
    
    unpacked db 01H,02H,03H,04h,05h,06h,07h,08h,09h,0AH,0BH,0CH,0DH,0Eh,0Fh,00h
    packed db 8 dup(?)

data ends


;.............................................................................

;................................................................................          
code segment                                                                     
    
    assume  ds:data,cs:code
    
    start:
            mov ax,data
            mov ds,ax
            
            xor ax,ax		;initializing ax register to 0
            mov cx,8
            mov si,0 
            mov di,0
            
     next:  mov ax,word ptr unpacked[si]
            shl al,4
            shr ax,4
            mov packed[di],al
            inc si 
            inc si
            inc di
            loop next
          
     hlt
code ends
end start
    
    
;............................................................................            