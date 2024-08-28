getData macro arr,msg
    mov cx,7
    mov si,offset arr
    l1:

        lea dx,msg
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        mov [si],al
        inc si
        call nextLine
    loop l1
    call nextLine
endm
printData macro arr,ms
    lea dx,ms
    mov ah,9
    int 21h
    mov cx,7
    mov si,offset arr
    l2:
        mov dx,[si]
        mov ah,2
        int 21h
        inc si
        call space
    loop l2
    call nextLine
endm
findMin macro arr,ms
   mov si, offset arr
   mov cx,7
   mov bl,[si]
   l4:
    cmp [si],bl
    jbe small
    cmpe:
    inc si
   loop l4
   lea dx,ms
   mov ah,9
   int 21H
   mov dl,bl
    mov ah,2
    int 21H
    mov ah,4ch
    int 21h
   small:
   mov bl,[si]
   jmp cmpe
endm

.model small
.stack 100H
.data
    msg1 db "Enter quiz mark: $"
    msg2 db "Array: $"
    msg3 db "Minimun Number: $"
    arr db 7 dup("?")
.code 
main proc
    mov ax,@data
    mov ds,ax
    getData arr,msg1
    printData arr,msg2
    findMin arr,msg3
    mov ah,4ch
    int 21H
main endp
nextLine proc
    mov dl,10
    mov ah,2
    int 21H
    mov dl,13
    mov ah,2
    int 21H
ret
nextLine endp
space proc
    mov dl,32
    mov ah,2
    int 21h
ret
space endp
end main