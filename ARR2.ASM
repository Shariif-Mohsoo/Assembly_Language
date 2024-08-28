printData macro arr
mov cx,10
l1:
push cx
mov cx,5
mov si,offset arr
        l2:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l2
call nextLine
pop cx
loop l1
endm
dosseg
.model small
.stack 100h
.data
arr db 5 dup(53)
.code
main proc
mov ax,@data
mov ds,ax
printData arr
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

