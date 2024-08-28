print macro ms
    lea dx,ms
    mov ah,9
    int 21h
endm       
getInput macro ms1,num
    print ms1
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    
    mov ah,1
    int 21h
    ;cmp al,13
    ;je next
    sub al,48
    mov bl,al
    
    mov dl,10
    mov al,cl
    mul dl
    
    add al,bl
    
    mov ah,0
    mov num,ax   
    ;next:
   
endm


getAdd macro n1,n2,r2
         mov ax,n1
         mov bx,n2
         add ax,bx
         mov r2,ax    
endm


getSub macro n1,n2,r2
         mov ax,n1
         mov bx,n2
         sub ax,bx
         mov r2,ax    
endm
getMul macro n1,n2,r2
       mov ax,n1
       mov bx,n2
       mul bx
       mov r2,ax
endm
getDiv macro nu1,nu2,re2
       mov ax,nu1
       mov bx,nu2
       div bx
       mov re2,dx
       
      
endm
display macro n,ms2
    print ms2
    call nextLine
    mov ax,n 
    mov dx,0
    mov bx,10
    mov cx,0
    l1:
       div bx
       push dx
       mov dx,0
       mov ah,0
       inc cx
       cmp ax,0
    jne l1   
    
    l2:
       pop dx
       add dx,48
       mov ah,2
       int 21h
    loop l2
   
endm
.model small
.stack 100h
.data
    msg1 db  10,13,"Enter input: $" 
    msg2 db 10,13,"Result: $"
    pt1 db 10,13,"===========================$"
    p1 db 10,13,"Enter 1 for addition: $"
    p2 db 10,13,"Enter 2 for subtraction: $"
    p3 db 10,13,"Enter 3 to product: $"
    p4 db 10,13,"Enter 4 to divide:  $"
    p6 db 10,13,"Enter your choice: $"
    p5 db 10,13,"Enter 5 to exit $"
    p7 db 10,13,"Invalid Input: $" 
    pt2 db 10,13,"===========================$"
    num1 dw ?
    num2 dw ?
    res dw ?
.code
    main proc
     mov ax,@data
     mov ds,ax   
        back:
         print pt1
         print p1
         print p2
         print p3
         print p4
         print p5
         print p6 
         print pt2
         mov ah,1
         int 21h
         sub al,48
         cmp al,1
         je addition
         cmp al,2
         je subtraction
         cmp al,3
         je product
         cmp al,4
         je divison
         cmp al,5
         je exit
         print p7
         jmp back
         
         
         getInput msg1,num1
         getInput msg1,num2
         addition:
         
         getInput msg1,num1
         getInput msg1,num2
         getAdd num1,num2,res
         jmp result
         
         subtraction:
         
         getInput msg1,num1
         getInput msg1,num2
         getSub num1,num2,res
         jmp result
         
         product:          
         
         getInput msg1,num1
         getInput msg1,num2
         getMul num1,num2,res
         jmp result
         
         divison:
         
         getInput msg1,num1
         getInput msg1,num2
         getDiv num1,num2,res
         jmp result
         
         result:
         display res,msg2
         jmp back
         
         exit:
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