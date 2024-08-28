dosseg
.model small
.stack 100h
.data
msg1 db "Enter Number 1: $"
msg2 db "Enter Number 2: $"
msg3 db "Equal$"
msg4 db "NotEqual$"
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	;input a value
	lea dx,msg1
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov bl,al
	;breaking
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	;input a value
	lea dx,msg2
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov cl,al
	;comparison
	cmp bl,cl
	je equal
	;if not equal
	;breaking
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	lea dx,msg4
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
	;if equal
	equal:
	;breaking
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	lea dx,msg3
	mov ah,9
	int 21h
	;exiting
	mov ah,4ch
	int 21h
	main endp
end main
