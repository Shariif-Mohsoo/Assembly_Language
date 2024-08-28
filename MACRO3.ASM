getChar macro msg1,ch
	lea dx,msg1
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov ch,al
	call nextLine
endm
convertAlpha macro msg2,ch
	lea dx,msg2
	mov ah,9
	int 21h
	add ch,32
	mov dl,ch
	mov ah,2
	int 21h
endm
dosseg
.model small
.stack 100h
.data
	msg1 db "Enter captial alphabet: $"
	msg2 db "Lower alphabet is: $"
	char db ?
.code
	main proc
	mov ax,@data
	mov ds,ax
	getChar msg1,char
	;convertAlpha 
	convertAlpha msg2,char
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
