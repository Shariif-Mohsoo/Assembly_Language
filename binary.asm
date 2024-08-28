print macro ms
    lea dx,ms
    mov ah,9
    int 21h
endm
getInput macro ms1,ar1,c1,pow,deci,ms2
     ;same like array input
     print ms1
     mov cx,30
     l1:
            mov ah,1
            int 21h
            cmp al,13
            je next
            mov [si],al
            inc si
            inc c1
     loop l1      
     next: 
     ;same like reverse
     dec si
     mov cl,c1
     mov ch,0d
     
     l2:
        push cx  ;store the counter in stack 
        ;algo to find power
        mov cl,pow
        mov ch,0d  
        
        mov bl,1d
        mov bh,0d
        
        mov al,2d
        mov ah,0d
        
        cmp cx,0d
       
        je new
        l3:
           mul bx
           mov bx,ax
           mov ax,2d
        loop l3
        ;inoff
        
        new:    
        ;moving exponent to ax
        ;mov al,bl 
        ;mov ah,0 
        
        mov ax,bx
        ;mov ax,bx
        ;moving index value to bl
        
        mov bl,[si] 
        ;must adjust the ascii
        sub bl,48  
        mov bh,0d
        mul bx
         
        ;result will be in ax
        add deci,ax
        
        
        inc pow
        dec si
        pop cx
     loop l2
      
     ;algo for conversion
     call nextLine  
     print ms2
     mov ax,deci
     mov dx,0
     mov bx,10
     mov cx,0
     
     l4:
         div bx
         push dx
         mov dx,0
         mov ah,0
         inc cx
         cmp ax,0
     jne l4 
     l5:
         pop dx
         add dx,48
         mov ah,2
         int 21h
     loop l5
    
endm
.model small
.stack 100h
.data  
    arrb db 30 dup(?)
    count db 0
    msg1 db 10,13,"Enter binary: $" 
    msg2 db 10,13,"Decimal: $"
    pow db 0      
    decimal dw 0
.code
    main proc
       mov ax,@data
       mov ds,ax
        getInput msg1,arrb,count,pow,decimal,msg2 
        
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