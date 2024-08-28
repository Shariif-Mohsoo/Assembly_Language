dosseg
.model small
.stack 100h
.data
.code
	main proc
		
		mov ah,1
		int 21h	
		mov cl,al
		
		mov ah,1
		int 21h
		mov bl,al
		
		mov dl,10
		mov ah,2
		int 21h
		
			
		sub cl,bl
		add cl,48
		
		mov dl,cl
		mov ah,2
		int 21h
		
		mov ah,4ch
		int 21h
		
	main endp
end main
