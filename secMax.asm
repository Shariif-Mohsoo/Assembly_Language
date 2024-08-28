
getInput macro arr1,msg1,c1
    mov cx,9
    mov si,offset arr1
    l1:    
        mov dx,offset msg1
        mov ah,9
        int 21h  
        mov ah,1
        int 21h
        cmp al,13
        je next
        mov [si],al
        inc si
        inc c1
        call nextLine
    loop l1   
    call nextLine
endm             
display macro arr2,msg2,c2
   mov ch,0
   mov cl,c2
   mov dx,offset msg2
   mov ah,9
   int 21h
   mov si,offset arr2
   l2:    
       mov dl,[si]
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h
       inc si 
   loop l2    
   call nextLine
endm 
findMax macro arr3,msg3,c3,max
    mov ch,0
    mov cl,c3
    mov si,offset arr3
    mov bl,[si]
    l3:    
        cmp [si],bl
        jge upDateMax
        back:
        inc si
    loop l3   
    lea dx,msg3
    mov ah,9
    int 21h
    mov max,bl
    mov dl,max
    mov ah,2
    int 21h     
    jmp sec
        upDateMax:
        mov bl,[si]
        jmp back
endm
findSecMax macro arr3,msg4,c4,max 
    call nextLine
    mov ch,0
    mov cl,c4
    mov si,offset arr3
    mov bl,[si]
    mov dl,max 
    cmp dl,bl
    je incr
    l4:    
        cmp [si],bl
        jge upDate  
        bak:
        inc si
    loop l4
    mov dx,offset msg4
    mov ah,9
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    jmp stop       
        upDate:
            cmp [si],dl
            je incr
            mov bl,[si]
            jmp bak
        incr:
            inc si
            mov bl,[si]
            dec cl
            jmp l4    
endm
.model small
.stack 100h
.data      
    arr db 9 dup(?)
    msg1 db "Enter input:$ "
    msg2 db "You entered: $"
    msg3 db "Maximum: $"
    msg4 db "Second Maximum: $"
    count db 0
    max db ?    
.code
main proc   
     mov ax,@data
     mov ds,ax
     getInput arr,msg1,count     
     next:
     display arr,msg2,count 
     findMax arr,msg3,count,max
     sec:
     findSecMax arr,msg4,count,max    
     stop: 
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


