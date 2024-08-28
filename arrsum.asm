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
      mov dx,offset msg2
      mov ah,9
      int 21h
      mov ch,0
      mov cl,c2
      mov si,offset arr2 
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
sum macro arr2,msg3,c3
    mov ch,0
    mov cl,c3
    mov si,offset arr2
    mov al,0
    mov ah,0  
    l3:            
        add al,[si]
        aaa
        inc si 
    loop l3 
    ;add al,48
    ;add ah,48

    
    
    mov cx,ax     
   
    
    mov dx,offset msg3
    mov ah,9
    int 21h  
           
    mov dl,ch
    mov ah,2
    int 21h
    mov dl,cl
    mov ah,2
    int 21h
        
      
    
endm
.model small
.stack 100h
.data          
    arr db 9 dup(?)
    count db 0
    msg1 db "Enter input: $"
    msg2 db "You enter: $"
    msg3 db "Sum: $"
.code
    main proc
        mov ax,@data
        mov ds,ax
        getInput arr,msg1,count
        next:
        display arr,msg2,count
        sum arr,msg3,count
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
endm