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
		l1:
		push cx
		mov cx,bx
		cmp cx,0
		je loop3
		l2:
		mov dl,' '
		mov ah,2
		int 21h
		loop l2
		
		loop3:
		mov cx,n1
		l3:
			mov dl,'*'
			mov ah,2
			int 21h
		loop l3
		
		mov dl,10
		mov ah,2
		int 21h	
		mov dl,13
		mov ah,2
		int 21h
		
		inc n1
		dec bx
		pop cx
		loop l1		
		
			
		mov ah,4ch 
		int 21h
	
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
	
	main endp
end main
