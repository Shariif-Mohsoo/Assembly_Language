dosseg
.model small
.stack 100h
.data
	n1 dw ?
.code
	main proc
		mov cx,5
		mov bx,4
		mov n1,1
		;first loop
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
				mov dl,"*"
				mov ah,2
				int 21h
				mov dl,32
				mov ah,2
				int 21h
			loop l3
			call nextLine
			dec bx
			inc n1
			pop cx
		loop l1
	main endp
	mov ah,4ch
	int 21h
	;defining the new procedure
	nextLine proc
		mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
		ret
	nextLine endp
	
	;exiting

end main
