dosseg
.model small
.stack 100h
.data
	msg1 db 65
	msg2 db 97
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov cx,26
	l1:
	mov dl,msg1
	mov ah,2
	int 21h	
	mov dl,msg2
	mov ah,2
	int 21h	
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h	
	inc msg1
	inc msg2
	loop l1
	mov ah,4ch
	int 21h
	main endp
end main
