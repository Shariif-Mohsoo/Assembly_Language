getInput macro ms1,ms2   
    lea dx,ms1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    ;second input
    call nextLine
    lea dx,ms2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    call nextLine    
endm             
sum macro ms9
    lea dx,ms9
    mov ah,9
    int 21h
    mov al,bl
    add al,cl
    mov ah,0
    aaa
    
    add al,48
    add ah,48
    
    mov bx,ax
    mov dl,bh
    mov ah,2
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
  
    call nextLine
endm             
diff macro ms10
   lea dx,ms10
   mov ah,9
   int 21h
   sub bl,cl
   mov dl,bl
   add dl,48
   mov ah,2
   int 21h
   call nextLine    
endm             
product macro ms12
    lea dx,ms12
    mov ah,9
    int 21h
    mov al,bl
    mul cl
    aam; ascii adjust after mutliplication
    mov cx,ax
    add ch,48
    add cl,48
    mov dl,ch
    mov ah,2
    int 21h
    mov dl,cl
    mov ah,2
    int 21h
    call nextLine    
endm             
division macro ms11
    lea dx,ms11
    mov ah,9
    int 21h 
    ;
    mov bh,0 
    mov ax,bx
    div cl
     ;reminder
    mov ch,ah
    add ch,48
    mov dl,ch
    mov ah,2
    int 21h
    call nextLine
endm  
printMess macro ms
    call nextLine
    lea dx,ms
    mov ah,9
    int 21h
    call nextLine
endm
.model small
.stack 100h
.data    
   p1 db "=====================================$"
   msg1 db "Enter 1 to perform addition$"
   msg2 db "Enter 2 to perform subtraction$"
   msg3 db "Enter 3 to perform multiplication$"
   msg4 db "Enter 4 to perform division$"
   msg6 db "Enter 5 to exit $"
   p2 db "=====================================$"
   msg5 db "Enter yor choice: $"
   
   msg7 db "Enter first number: $"
   msg8 db "Enter second number: $"
   msg9 db "Addition: $"
   msg10 db "Subtraction: $"
   msg11 db "Divison: $"
   msg12 db "Multiplication: $"
   ;msg13 db "Invalid input$"
.code
    main proc
        mov ax,@data
        mov ds,ax
        back: 
        printMess p1
        printMess msg1
        printMess msg2
        printMess msg3
        printMess msg4
        printMess msg6
        printMess p2
        printMess msg5
        mov ah,1
        int 21h
        sub al,48
        cmp al,1
        je summ
        cmp al,2
        je dif
        cmp al,3
        je mull
        cmp al,4
        je divi
        cmp al,5
        je end
        jmp end
        summ:    
            getInput msg7,msg8
            sum msg9
            jmp back
        dif: 
            getInput msg7,msg8
            diff msg10
            jmp back
        mull:    
            getInput msg7,msg8   
            product msg12
            jmp back
        divi:
            getInput msg7,msg8
            division msg11
            jmp back
        
        
        
        
       
           
        end:       
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