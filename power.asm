getInput macro ms1,ms2,b,p
    lea dx,ms1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,48
    mov p,al
    
    call nextLine
    
    lea dx,ms2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,48    
    mov ah,0
    mov byte ptr b,al
    
    
endm
getResult macro b1,p1,res
    mov bl,1
    mov bh,0
    mov cl,p1
    mov ch,0
    l1:     
        mul bx
        mov bx,ax
        mov ax,b1
    loop l1     
    mov res,bx

endm  
display macro ress
    call nextLine
    mov ax,ress
    
    mov cx,0
    mov bx,10
    mov dx,0
    
    l3:
       div bx
       push dx
       mov dx,0
       mov ah,0
       inc cx
       cmp ax,0
    jne l3
    
    l4:
       pop dx
       add dx,48
       mov ah,2
       int 21h
    
    loop l4
    
endm
.model small
.stack 100h
.data   
    base dw ?
    power db ?
    result dw ?
    msg1 db "Enter power: $"
    msg2 db "Enter base: $"
    msg3 db "Result: $"
.code
    main proc
     mov ax,@data
     mov ds,ax
         getInput msg1,msg2,base,power
         getResult base,power,result
         display result 
     mov ah,4ch
     int 21h   
    main endp
    ;nextLine
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