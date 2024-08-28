printStar macro n1
	mov cx,5
	mov bx,8
	mov n1,1
	l1:
	push cx
		mov cx,bx
		cmp bx,0
		je loop3
		l2:
			mov dl,32
			mov ah,2
			int 21h
		loop l2
		loop3:
		mov cx,n1
		l3:
			mov dl,"*"
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop l3
		call nextLine
		add n1,2
		sub bx,2
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
	printStar n
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
