getInput macro arr1,msg1,c1
    mov cx,9
    mov si,offset arr1
    l1:    
        mov dx,offset msg1
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        cmp al,13
        je next
        mov [si],al
        inc si
        inc c1
        call nextLine               
    loop l1      
    call nextLine
endm  
display macro arr2,msg2,c2  
    call nextLine
    lea dx,msg2
    mov ah,9
    int 21h
    mov si,offset arr2
    mov ch,0          
    mov cl,c2
    l2:    
       mov dl,[si]
       mov ah,2
       int 21h
       mov dl,32
       mov ah,2
       int 21h 
       inc si
    loop l2   
    call nextLine
endm  
findMin macro arr3,msg3,c3,m
    mov si,offset arr3
    mov ch,0
    mov cl,c3
    mov bl,[si]
    l3:    
       cmp [si],bl
       jle upDateMin
       back:
       inc si         
    loop l3
                    
    mov min,bl
    mov dx,offset msg3
    mov ah,9        
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    jmp next1
           
    
     upDateMin:
        mov bl,[si] 
        jmp back
endm   
findSecMin macro arr4,msg4,c4,m1
    call nextLine
    mov si,offset arr4
    mov ch,0
    mov cl,c4     
    mov bl,[si] 
    mov dl,m1
   
    
    l4:     
       cmp [si],bl
       jle upDate
       b:
       inc si
    loop l4      
     
    mov dx,offset msg4
    mov ah,9
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
     
    mov ah,4ch
    int 21h  
    
    upDate:         
        cmp [si],dl
        je second
        mov bl,[si]
        jmp b
       
    second:        
        inc si
        mov bl,[si]
        dec cl
        jmp l4

endm
.model small
.stack 100h
.data   
    arr db 9 dup(?)
    msg1 db "Enter input: $"
    msg2 db "You entered: $"
    msg3 db "Smallest Number: $"
    msg4 db "Second Smallest Number: $"
    count db 0  
    min db ?
.code   
    main proc  
        mov ax,@data
        mov ds,ax
            getInput arr,msg1,count
            next:
            display arr,msg2,count 
            findMin arr,msg3,count,min
            next1:                    
            findSecMin arr,msg4,count,min
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