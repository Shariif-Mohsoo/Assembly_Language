dosseg
.model small
.stack 100h
.data
	msg db "Enter The Vowels $"
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	lea dx,msg
	mov ah,9
	int 21h
	
	mov dl,10
	mov ah,2
	int 21h
	;1st time
	mov ah,1
	int 21h
	mov cl,al
	 
	mov dl,10
	mov ah,2
	int 21h
	
	mov dl,13
	mov ah,2
	int 21h
	
	mov dl,cl
	mov ah,2
	int 21h
	
	;2nd time
	mov dl,10
	mov ah,2
	int 21h
	
	mov ah,1
	int 21h
	mov cl,al
	 
	mov dl,10
	mov ah,2
	int 21h
	
	mov dl,13
	mov ah,2
	int 21h
	
	mov dl,cl
	mov ah,2
	int 21h
	
	;3rd time
	mov dl,10
	mov ah,2
	int 21h
	
	mov ah,1
	int 21h
	mov cl,al
	 
	mov dl,10
	mov ah,2
	int 21h
	
	mov dl,13
	mov ah,2
	int 21h
	
	mov dl,cl
	mov ah,2
	int 21h
	
	;4th time
	mov dl,10
	mov ah,2
	int 21h
	
	mov ah,1
	int 21h
	mov cl,al
	 
	mov dl,10
	mov ah,2
	int 21h
	
	mov dl,13
	mov ah,2
	int 21h
	
	mov dl,cl
	mov ah,2
	int 21h
	
	;5th time
	mov dl,10
	mov ah,2
	int 21h
	
	mov ah,1
	int 21h
	mov cl,al
	 
	mov dl,10
	mov ah,2
	int 21h
	
	mov dl,13
	mov ah,2
	int 21h
	
	mov dl,cl
	mov ah,2
	int 21h
	

	mov ah,4ch
	int 21h
	main endp
end main
