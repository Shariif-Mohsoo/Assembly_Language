getInput macro ms1,n
    lea dx,ms1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov ah,0;clearing the garbage
    sub al,48
    mov n,ax
    call nextLine
endm
getBinary macro ms2,n2
    mov cx,0 ;counter
    mov dx,0
    mov bx,8
    mov ax,n2
    l1:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
    jne l1
    lea dx,msg2
    mov ah,9
    int 21h
    l2:
        pop dx
        add dx,48
        mov ah,2
        int 21h
    loop l2
    call nextLine
endm
dosseg
.model small
.stack 100h
.data
    msg1 db "Enter Decimal Number: $"
    msg2 db "Octal: $"
    num dw ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        getInput msg1,num
        getBinary msg2,num
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