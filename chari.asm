getData macro arr,msg1,msg2
    mov si,offset arr
    repeat:    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov [si],al
    inc si
    call nextLine 
     
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    cmp al,1  
    call nextLine
   
    je repeat
    jne next
    
endm
display macro arr,msg3,count
    lea dx,msg3             
    mov ah,9
    int 21h
             
    mov si,offset arr
    mov cx,5
    l1:
        mov dl,[si]
        mov ah,2
        int 21h
        mov dl,32
        mov ah,2
        int 21h
        inc si
    loop l1    
    call nextLine
endm
addTotal macro arr,msg4 
    mov cx,5
    mov ax,0
    mov ah,0
    l2:    
        add ax,[si]  
        aaa
        inc si
    loop l2     
    add al,48
    add ah,48  
    mov bx,ax
    mov dx,offset msg4
    mov ah,9
    int 21h
    mov dl,bh
    mov ah,2
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    
endm
.model small
.stack 100h
.data   
    msg1 db "Enter odd amount to donate: $"
    msg2 db "To continue press 1: $"
    msg3 db "Amounts: $" 
    msg4 db "Total Amount in Dollars: $"
    arr dw 5 dup("?")
    count dw 0
.code
    main proc  
        mov ax,@data
        mov ds,ax
        getData arr,msg1,msg2
        next:
        display arr,msg3   
        addTotal arr,msg4
       
        mov ah,4ch
        int 21h
    main endp    
    nextLine proc
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
       ret
    nextLine endp
end main