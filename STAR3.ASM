printStar macro n1,n2
	mov cx,5
	mov bx,0
	mov n1,5
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
		mov cx,n1
		l3:
			mov dl,n2
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop l3
		call nextLine
		dec n2
		dec n1
		inc bx
	pop cx
	loop l1
endm
dosseg
.model small
.stack 100h
.data
	num db 53
	n   dw ?
.code
main proc
	mov ax,@data
	mov ds,ax
	printStar n,num
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
