;program to reverse the input string
getInput macro arr1,msg1,c1
    mov cx,15
    mov si,offset arr1
    mov dx,offset msg1
    mov ah,9
    int 21h
    l1:    
          mov ah,1
          int 21h
          cmp al,13
          je next
          mov [si],al
          push [si]
          inc si 
          inc c1
    loop l1 
    call nextLine
endm 
display macro arr2,msg2,msg3,c2
    call nextLine
    mov cl,c2
    mov ch,0
    mov si,offset arr2
    mov dx,offset msg3
    mov ah,9
    int 21h 
    
    l2:    
        mov dl,[si]
        mov ah,2
        int 21h 
        inc si
    loop l2 
    call nextLine
    mov dx,offset msg2
    mov ah,9
    int 21h 
    mov cl,c2
    mov ch,0
    l3:    
        pop dx
        mov ah,2
        int 21h
    loop l3
    call nextLine
endm
.model small
.stack 100h
.data   
    msg1 db "Enter string: $"
    msg2 db "Reverse: $"
    msg3 db "Original: $"
    arr db 15 dup(?)
    count db ?
.code
    main proc  
        mov ax,@data
        mov ds,ax
        getInput arr,msg1,count  
        next:  
        display arr,msg2,msg3,count
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