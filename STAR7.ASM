printStar1 macro n,num
	mov cx,3
	mov bx,4
	mov n,1
	mov num,53
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
			mov dl,num
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop l3
		call nextLine
		add n,2
		dec num
		sub bx,2
	pop cx
	loop l1
endm
;2nd 
printStar2 macro n,num
	mov cx,2
	mov bx,2
	mov n,3
	mov num,50
	ln1:
	push cx
		mov cx,bx
		ln2:
			mov dl,32
			mov ah,2
			int 21h
		loop ln2
		mov cx,n
		ln3:
			mov dl,num
			mov ah,2
			int 21h
			mov dl,32
			mov ah,2
			int 21h
		loop ln3
		call nextLine
		dec num
		sub n,2
		add bx,2
	pop cx
	loop ln1
endm
dosseg
.model small
.stack 100h
.data
	n dw ?
	num db ?
.code
	main proc
		mov ax,@data
		mov ds,ax
		printStar1 n,num
		printStar2 n,num
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
