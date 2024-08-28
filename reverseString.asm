getInput macro ar1,ms1,ms2,c1
     lea dx,ms1
     mov ah,9
     int 21h
     mov cx,30
     l1:
        mov ah,1
        int 21h
        cmp al,13
        je next
        mov [si],al
        inc c1
        inc si
     loop l1 
     
     next:   
    dec si
    call nextLine
    mov dx, offset ms2
    mov ah,9
    int 21h
    
    
    mov cl,c1
    mov ch,0
    
    l2:
        mov dl,[si]
        mov ah,2
        int 21h
        dec si
    loop l2
endm

.model small
.stack 100h
.data           
    msg1 db "Enter string: $"
    msg2 db "Reverse: $"
    arr db 30 dup(?)
    count db 0
.code   
    main proc
        mov ax,@data
        mov ds,ax
          getInput arr,msg1,msg2,count  
          
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