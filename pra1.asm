print macro ms
	lea dx,ms
	mov ah,9
	int 21h
endm
getInput macro ms1,ms2,b,p,res
	print ms1
	mov ah,1
	int 21h
	sub al,48
	mov ah,0
	mov b,ax
	
	print ms2
	mov ah,1
	int 21h
	sub al,48
	mov ah,0
	mov p,ax
	
	mov cx,p
	mov bl,1
	mov bh,0
	mov ax,b
	l1:
		mul bx
		mov bx,ax
		mov ax,b
	loop l1
	mov res,bx
endm
getRes macro res1,ms2
	mov ax,res1
	mov bx,10
	mov cx,0
	mov dx,0
	l2:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
	jne l2
	
	print ms2
	l3:
		pop dx
		add dx,48
		mov ah,2
		int 21h
	loop l3
endm

dosseg
.model small
.stack 100h
.data
	msg1 db 10,13,"Enter base: $"
	msg2 db 10,13,"Enter power: $"
	msg3 db 10,13,"Result: $"
	pow dw ?
	base dw ?
	result dw ?
.code
	main proc
		mov ax,@data
		mov ds,ax
			getInput msg1,msg2,base,pow,result
			getRes result,msg3
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
