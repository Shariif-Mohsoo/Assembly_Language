getData macro msg,arr
    mov cx,9         
    lea dx, msg
    mov ah,9
    int 21h
    call nextLine    
    mov si,offset arr    
    l1: 
        mov ah,1             
        int 21h
        mov [si],al
        inc si
        call nextLine   
    loop l1
endm 
showData macro msg,arr
    call nextLine
    mov cx,9          
    lea dx,msg
    mov ah,9
    int 21h
    mov si,offset arr
    l2:
        mov dx,[si]
        mov ah,2
        int 21h
        mov dl,32
        mov ah,2
        int 21h 
        inc si
    loop l2
endm         
getMax macro msg,arr
    call nextLine
    mov cx,9   
    mov si,offset arr
    mov bl,[si]      
    l3:    
       cmp [si],bl
       jge large
       back:
       inc si 
    loop l3     
    
    lea dx,msg
    mov ah,9
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    jmp exit
    large:
     mov bl,[si]
     jmp back
endm 

.model small
.stack 100h
.data  
    arr db 9 dup<'?')
    msg1 db "Enter scores: $"
    msg2 db "Highest score: $"
    msg3 db "Array: $"
.code
    main proc
       mov ax,@data
       mov ds,ax
        
       getData msg1,arr 
       showData msg3,arr  
       getMax msg2,arr
    exit:
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


