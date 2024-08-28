getNum macro msg
call nextLine
   lea dx,msg
   mov ah,9
   int 21h
   
   mov ax,cx
   
   mov cx,0
   mov bx,10
   mov dx,0
   l2:
      div bx
      push dx
      mov dx,0      
      inc cx  
      cmp ax,0
   jne l2     
   
   l3:
      pop dx
      add dx,48
      mov ah,2
      int 21h   
   loop l3 
   jmp exit
 ;mov bl,num
endm
.model small
.stack 100h
.data      
    msg1 db "Factorial: $"
    result db ?
.code   
    main proc
        mov ax,@data
        mov ds,ax
           mov ah,1
           int 21h
           sub al,48 
           mov ah,0
           mov bx,ax
           cmp bx,1
           je last1
           cmp bx,0
           je last1
           fact:
             dec bx
             mul bx
             cmp bx,1
           jne fact
           mov cx,ax
           getNum msg1
           last1:
            lea dx,msg1
            mov ah,9
            int 21h
            mov dl,49
            mov ah,2
            int 21h
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
    space proc
        mov dl,32
        mov ah,2
        int 21h
        ret
    space endp
    
end main