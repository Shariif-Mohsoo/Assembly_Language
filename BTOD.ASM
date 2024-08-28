getInput macro ms1,c1
    lea dx,ms1
    mov ah,9
    int 21h
    mov cx,4
    l1:
        mov ah,1
        int 21h
        cmp al,13
        je next
        sub al,48
        mov ah,0
        push ax
        inc c1
    loop l1
    call nextLine
endm
getDecimal macro ms2,c2,m,towP,res,exp
    lea dx,ms2
    mov ah,9
    int 21h
    mov cl,c2 ;setting the counter
    mov ch,0
    mov m,0;exponent
    mov res,0
    ;mov exp,0
    ;first convert
    ;again
    mov bl,1
    pop dx
        inc m 
        mov al,m
        mul bl
        aam
        mov towP,al
        ;check
        mov ax,dx
        mul towP
        aam 
    add res,al
    dec cl

    mov bl,2
    l2:
        pop dx 
        ;for inner
        push cx
        mov ch,0
        mov cl,m
        l3:
            mov al,2 
            mul bl;
            aam 
            ;add exp,al
        loop l3
      
        mov towP,al
        mov al,dl
        mul towP 
        aam 
        add res,al 
        inc m
        pop cx
    loop l2
    
    ;displaying the result
    mov dl,res
    add dl,48
    mov ah,2
    int 21h
endm

dosseg
.model small
.stack 100h
.data
    count db 0
    msg1 db "Enter binary number: $"
    msg2 db "Decimal: $"
    mult db ?
    twoP db ?
    result db 0
    exp db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        getInput msg1,count
        next:
        getDecimal msg2,count,mult,twoP,result,exp
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