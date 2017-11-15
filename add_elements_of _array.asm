
;...................................................

data SEGMENT

    array db 01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah

data ENDS   

;....................................................


;....................................................

code SEGMENT

assume ds:data,cs:code

start:
    mov ax,data
    mov ds,ax 
 
    xor ax,ax			;initializing ax register with 0
    mov cx,0Ah
    mov si,0
    mov al,0

    next:
    adc al,array[si]		 
    inc si		
    loop next
    hlt

code ENDS
end start

;........................................................