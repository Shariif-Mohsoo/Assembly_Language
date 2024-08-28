getData macro msg,arr
lea dx,msg
mov ah,9
int 21h
mov cx,5
mov si,offset arr
l1:
mov ah,1
int 21h
mov [si],al
inc si
loop l1
call nextLine
endm
printData macro ms,arr
lea dx,ms
mov ah,9
int 21h
mov cx,5
mov si,offset arr
l2:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l2
call nextLine
endm
dosseg
.model small
.stack 100h
.data
arr db 5 dup('?')
msg db "Enter vowels: $"
ms db "Vowels: $"
.code
main proc
mov ax,@data
mov ds,ax
getData msg,arr
printData ms,arr
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


