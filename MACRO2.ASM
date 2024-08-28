sum macro msg1,n1,n2
	add n1,n2
	sub n1,48
	lea dx,msg1
	mov ah,9
	int 21h
	mov dl,n1
	mov ah,2
	int 21h
endm
minus macro msg2,n1,n2
	sub n1,n2
	add n1,48
	lea dx,msg2
	mov ah,9
	int 21h
	mov dl,n1
	mov ah,2
	int 21h
	call nextLine
endm
dosseg
.model small
.stack 100h
.data
	msg1 db "Enter first number = $"
	msg2 db "Enter second number = $"
	msg3 db "Sum of numbers = $"
	msg4 db "Minus of numbers = $"
	n db ?
.code
	main proc
		mov ax,@data
		mov ds,ax
		;get data
			lea dx,msg1
			mov ah,9
			int 21h
			mov ah,1
			int 21h
			mov bl,al
			call nextLine
			lea dx,msg2
			mov ah,9
			int 21h
			mov ah,1
			int 21h
			mov cl,al
			call nextLine
		;add
		mov n,bl
		sum msg3,bl,cl
		call nextLine
		;subtract
		mov bl,n
		minus msg4,bl,cl
		mov ah,4ch
		int 21h
	main endp
	;procedure
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
