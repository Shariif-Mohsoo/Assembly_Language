getChar macro msg1,char
	lea dx,msg1
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov char,al
	call nextLine
endm
transformAlpha macro msg2,char
	lea dx,msg2
	mov ah,9
	int 21h
	sub char,32
	mov dl,char
	mov ah,2
	int 21h
endm
dosseg
.model small
.stack 100h
.data
	msg1 db "Enter lowercase alphabet: $"
	msg2 db "Uppercase alphabet is: $"	
	char db ?
.code
	main proc
		mov ax,@data
		mov ds,ax
		getChar msg1,char
		transformAlpha msg2,char
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
