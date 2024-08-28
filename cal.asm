print macro ms
	lea dx,ms
	mov ah,9
	int 21h
endm
getInput macro ms1,n1
	print ms1
	mov ah,1
	int 21h
	sub al,48
	mov bl,al ;first input
	
	mov ah,1
	int 21h
	sub al,48 
	mov cl,al ;second input
	mov dl,10
	mov al,bl
	mul dl
	add al,cl
	mov ah,0
	mov n1,ax
endm
display macro ms2,rs
	mov ax,rs
	mov cx,0
	mov dx,0
	mov bx,10
	lo1:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
	jne lo1
	print ms2
	lo2:
		pop dx
		add dx,48
		mov ah,2
		int 21h
	loop lo2
endm
sum macro nu1,nu2,re1
	mov ax,nu1
	mov bx,nu2
	add ax,bx
	mov re1,ax
endm
diff macro nu3,nu4,re2
	mov ax,nu3
	mov bx,nu4
	sub ax,bx
	mov re2,ax
endm
product macro nu5,nu6,re3
	mov ax,nu5
	mov bx,nu6
	mul bx
	mov re3,ax
endm
division macro ms1,ms2,ms3
	print ms1
	mov ah,1
	int 21h
	sub al,48
	mov bl,al ;first input
	
	mov ah,1
	int 21h
	sub al,48 
	mov cl,al ;second input
	mov dl,10
	mov al,bl
	mul dl
	add al,cl
	mov ah,0
	mov cx,ax
	
	print ms2
	mov ah,1
	int 21h
	sub al,48
	mov bl,al
	mov ax,cx
	div bl
	
	mov cx,ax
	
	print ms3
	mov dl,ch
	add dl,48
	mov ah,2
	int 21h
endm
getFact macro ms1,res
	print ms1
	mov ah,1
	int 21h
	sub al,48
	mov ah,0
	mov bx,ax
	cmp bx,0
	je next
	cmp bx,1
	je next
	
	l3:
		dec bx
		mul bx
		cmp bx,1
	jne l3
	
	mov res,ax
	jmp back1
	next:
		mov res,1
endm
DtoB macro num1,msg1
	mov ax,num1
	mov cx,0
	mov dx,0
	mov bx,2
	l1:
		div bx
		push dx
		mov dx,0
		mov ah,0
		inc cx
		cmp ax,0
	jne l1
	print msg1
	l2:
		pop dx
		add dx,48
		mov ah,2
		int 21h
	loop l2
endm
getPow macro ms1,ms2,b,p,res
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
	power:
		mul bx
		mov bx,ax
		mov ax,b
	loop power
	mov res,bx
endm
;cube
getCube macro ms1,b,res
	print ms1
	mov ah,1
	int 21h
	sub al,48
	mov ah,0
	mov b,ax
	
	mov cx,3
	mov bl,1
	mov bh,0
	mov ax,b
	cube:
		mul bx
		mov bx,ax
		mov ax,b
	loop cube
	mov res,bx
endm
;binary to decimal
BtoD macro ar1,ms1,c1,res,p1
	;for input
	mov p1,0
	mov res,0
	mov si,offset ar1
	mov cx,30
	print ms1
	bin:
		mov ah,1
		int 21h
		cmp al,13
		je below
		mov [si],al
		inc si
		inc c1
	loop bin
	;for conversion
	below:
	dec si
	mov cl,c1
	mov ch,0
	outerLoop:
		push cx
		;for power
		mov cx,p1
		mov bl,1
		mov bh,0
		mov al,2
		mov ah,0
		cmp cx,0
		je down
			innerLoop:
				mul bx
				mov bx,ax
				mov ax,2
			loop innerLoop
		;for real conversion
		down:
		mov ax,bx
		mov bl,[si]
		sub bl,48
		mov bh,0
		mul bx
		inc pow
		add res,ax
		pop cx
	loop outerLoop

endm
dosseg
.model small
.stack 100h
.data
	msg1 db 10,13,"Enter Input: $"
	msg2 db 10,13,"Result: $"
	msg3 db 10,13,"Enter Numerator: $"
	msg4 db 10,13,"Enter denominator: $"
	msg5 db 10,13,"Enter num to get factorial: $"
	msg6 db 10,13,"Enter base: $"
	msg7 db 10,13,"Enter power: $"
	arr db 30 dup(?)
	pow dw ?
	base dw ?
	num1 dw ?
	num2 dw ?
	result dw ?
	count db 0
	pt1 db 10,13,"=============================================$"
	p1 db 10,13,"Enter 1 for addition $"
	p2 db 10,13,"Enter 2 for subtraction $"
	p3 db 10,13,"Enter 3 for multiplication $"
	p4 db 10,13,"Enter 4 for division $"
	p5 db 10,13,"Enter 5 for finding cube$"
	p6 db 10,13,"Enter 6 for finding power$"
	p7 db 10,13,"Enter 7 for Decimal to Binary conversion$"
	p8 db 10,13,"Enter 8 for Binary to Decimal conversion$"
	p12 db 10,13,"Enter 9 for factorial$" 
	p9 db 10,13,"Press any key to exit$"
	pt2 db 10,13,"=============================================$"
	p10 db 10,13,"Enter your choice: $"
	p11 db 10,13,"Invalid Input $"
.code
	main proc
	mov ax,@data
	mov ds,ax
	again:
	
	print pt1
	print p1
	print p2
	print p3
	print p4
	print p5
	print p6
	print p7
	print p8
	print p9
	print pt2
	
	;get choice
	print p10
	mov ah,1
	int 21h
	sub al,48
	cmp al,1
	je addition
	
	cmp al,2
	je subtraction
	
	cmp al,3
	je multi
	
	cmp al,4
	je divi
	
	cmp al,5
	je cubi
	
	cmp al,6
	je fPower
	
	cmp al,7
	je Cdtob
	
	cmp al,8
	je Cbtod
	
	cmp al,9
	je facto
	
	jmp exit
	
	addition:
		getInput msg1,num1
		getInput msg1,num2
		sum num1,num2,result
		jmp show
	
	subtraction:
		getInput msg1,num1
		getInput msg1,num2
		diff num1,num2,result
		jmp show
		
	multi:
		getInput msg1,num1
		getInput msg1,num2
		product num1,num2,result
		jmp show
	divi:	
		division msg3,msg4,msg2
		jmp again
	cubi:
		getCube  msg6,base,result
		jmp show
	fPower:
		getPow  msg6,msg7,base,pow,result
		jmp show
		
	Cdtob:
		getInput msg1,num1	
		DtoB num1,msg1
		jmp again
	Cbtod:
	 	BtoD arr,msg1,count,result,pow
		jmp show
	facto:
		getFact msg5,result
		back1:
		jmp show
		
	 
	 show:
	 display msg2,result
	 jmp again
	 
	 exit:	
	mov ah,4ch
	int 21h
	main endp
	
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
