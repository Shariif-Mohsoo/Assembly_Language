dosseg
.model small
.stack 100h
.data
	msg db "HELLO_KICSIT$"
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov cl,3
	callMe:
		lea dx,msg
		mov ah,9
		int 21h
		mov dl,10
		mov ah,2
		int 21h
	loop callMe
	mov ah,4ch
	int 21h
	main endp
end main
