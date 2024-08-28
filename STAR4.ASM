printStar macro n
	mov cx,5
	mov bx,0
	mov n,9
	l1:
	push cx
		mov cx,bx
		cmp cx,0
		je loop3
		l2:
			mov dl,32
			mov ah,2
			int 21h
		loop l2
		loop3:
		mov cx,n
		l3:
			mov dl,"*"
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop l3
		call nextLine
		sub n,2
		add bx,2
	pop cx
	loop l1
endm
dosseg
.model small
.stack 100h
.data
	n dw ?
.code
	main proc
		mov ax,@data
		mov ds,ax
		printStar n
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
