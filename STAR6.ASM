printStar1 macro n
	mov cx,3
	mov bx,4
	mov n,1
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
		add n,2
		sub bx,2
	pop cx
	loop l1
endm
;2nd
printStar2 macro n
	mov cx,2
	mov bx,2
	mov n,3
	ln1:
	push cx
		mov cx,bx
		ln2:
			mov dl,32
			mov ah,2
			int 21h
		loop ln2
		mov cx,n1
		ln3:
			mov dl,"*"
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop ln3
		call nextLine
		sub n,2
		add bx,2
	pop cx
	loop ln1
endm
dosseg
.model small
.stack 100h
.data
	n1 dw ?
.code
	main proc
		mov ax,@data
		mov ds,ax
		printStar1 n1
		printStar2 n1
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
