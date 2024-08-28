dosseg
.model small
.stack 100h
.data
	msg1 db "Enter number: $"
	msg2 db 10,13,"Number is even$"
	msg3 db 10,13,"Number is odd$"
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		lea dx,msg1
		mov ah,9
		int 21h
		mov ah,1
		int 21h
		mov bl,2
		div bl
		cmp ah,0
		je evN
		lea dx,msg3
		mov ah,9
		int 21h
		mov ah,4ch
		int 21h
		evN:
		lea dx,msg2
		mov ah,9
		int 21h
		mov ah,4ch
		int 21h
		
		
		main endp
end main
