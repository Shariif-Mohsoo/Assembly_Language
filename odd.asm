.model small
.stack 100h
.data   
    am db "Total Amount: $"
    do db " Dollar $" 
    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov cx,49
        mov ax,1 
        mov ah,0
        l1:    
            add ax,2
            aaa
        loop l1     
        add al,48
        add ah,48
        mov dl ,ah
        mov ah,2
        int 21h 
        mov dl,al
        mov ah,2
        int 21h
        
        mov ah,4ch
        int 21h   
    main endp
end main