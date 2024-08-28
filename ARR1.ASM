dosseg
.model small
.stack 100h
.data
arr db "C","O","M","P","U","T","E","R"
.code 
main proc
mov ax,@data
mov ds,ax
;pointing to the first index of an array
mov si,offset arr
mov cx,8 
    l1:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l1

mov ah,4ch
int 21h
main endp
end main

