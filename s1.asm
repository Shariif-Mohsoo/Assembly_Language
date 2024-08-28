getInputEven macro ms1,ms2,n1
   again:
   call nextLine
   lea dx,ms1
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   
   sub al,48
   mov cl,al
   mov ah,0
   mov bl,2
   
   div bl
   cmp ah,0
   je even
   jne again     
        even:
           call nextLine
           mov n1,cl
           lea dx,ms2
           mov ah,9
           int 21h
           call nextLine
           jmp next
endm
getInputOdd macro ms3,ms4,n2
   again1:
   call nextLine
   lea dx,ms3
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   
   sub al,48
   mov cl,al
   mov ah,0
   mov bl,2
   
   div bl
   cmp ah,0
   jne odd
   je again1     
        odd:
           call nextLine
           mov n2,cl
           lea dx,ms4
           mov ah,9
           int 21h
           call nextLine
           jmp next1
endm 
getMul macro n3,n4,msg5
    call nextLine
    mov al,n3
    mov bl,n4
    mul bl
    aam
    mov cx,ax
    lea dx,msg5
    mov ah,9
    int 21h
    mov dl,ch
    add dl,48
    mov ah,2
    int 21h
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
endm
.model small
.stack 100h
.data                          
    arr db 9 dup(?)
    msg1 db "Enter Even Number: $"
    msg2 db "Number is even $"  
    msg3 db "Enter Odd Number: $"
    msg4 db "Number is odd: $"
    msg5 db "Product: $"
    num1 db ?
    num2 db ? 
   
.code
    main proc    
        mov ax,@data
        mov ds,ax
        getInputEven msg1,msg2,num1
        next:
        getInputOdd msg3,msg4,num2
        next1:
        getMul num1,num2,msg5
        mov ah,4ch
        int 21h
    main endp
    ;next line
    nextLine proc
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
        
        ret 
    nextLine endp
    space proc
        mov dl,32
        mov ah,2
        int 21h
       
        
        ret
    space endp
end main