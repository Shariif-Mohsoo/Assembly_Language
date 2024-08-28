printBio macro msg1,msg2,msg3
	lea dx,msg1
	mov ah,9
	int 21h 
	call nextLine
	lea dx,msg2
	mov ah,9
	int 21h
	call nextLine
	lea dx,msg3
	mov ah,9
	int 21h
endm
dosseg
.model small
.stack 100h
.data
	nme db "My name is ahmed$"
	roll db "My roll no is 01$"
	semester db "My semester is III$"
.code
	main proc
	mov ax,@data
	mov ds,ax
	printBio nme,roll,semester
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
