dosseg
.model small
.stack 100h
.data
msg1 db "Input first number: $"
msg2 db "Input second number: $"
msg3 db " Number is smaller$"
msg4 db " Number is greater$"
msg5 db " Numbers are equal$"
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	;first value
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
	;second value
	lea dx,msg2
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov cl,al
	;breaking
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	;comparison
	cmp bl,cl
	jg greater
	jl lower
	;equal
	lea dx,msg5
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
	lower:
	mov dl,bl
	mov ah,2
	int 21h
	lea dx,msg3
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
	greater:
	mov dl,bl
	mov ah,2
	int 21h
	lea dx,msg4
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
	main endp
end main
