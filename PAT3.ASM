dosseg
.model small
.stack 100h
.data
	num db ?
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov cx,7
	mov bx,7
	l1:
		push cx
		mov cx,bx
		mov num,49
		l2:
		mov dl,num
		mov ah,2
		int 21h
		inc num
		loop l2
		mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
		dec bx
		pop cx
	loop l1
	mov ah,4ch
	int 21h
	main endp
end main
