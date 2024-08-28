dosseg
.model small
.stack 100h
.data
	firstName db "TASUEEQ UL $"
	lastName  db "HASSAN$"
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		lea dx,firstName
		mov ah,9
		int 21h
		
		lea dx,lastName
		mov ah,9
		int 21h
		
		mov ah,4ch
		int 21h
	main endp
end main
