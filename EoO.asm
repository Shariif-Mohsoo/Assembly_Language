;write an assembly program to check whether the element in the array is odd or even
getInput macro ar1,ms1,c1 
    mov si,offset ar1
    mov cx,9
    l1:    
        mov dx,offset ms1
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
display macro ar2,ms2,c2
    mov si,offset ar2
    mov ch,0
    mov cl,c2 
    lea dx,ms2
    mov ah,9
    int 21h
    l2:    
        mov dl,[si]
        mov ah,2
        int 21h
        inc si   
        call space
    loop l2
    call nextLine
endm 
getEoO macro ar3,ms3,ms4,c3
    call nextLine
    mov si,offset ar3
    mov ch,0
    mov cl,c3
    mov bl,2  
    l3:        
        mov al,[si]
        mov ah,0
        div bl
        cmp ah,0
        je even
        jne odd 
        back:
        inc si
    loop l3
    ;for even  
    jmp end 
    even:
        mov dx,offset ms3
        mov ah,9
        int 21h      
        mov dl,[si]
        mov ah,2
        int 21h      
        call nextLine
        jmp back
    odd:
        mov dx,offset ms4
        mov ah,9
        int 21h      
        mov dl,[si]
        mov ah,2
        int 21h
        call nextLine
        jmp back
        
endm
.model small
.stack 100h
.data           
    msg1 db "Enter input: $"
    msg2 db "Even: $"
    msg3 db "Odd: $"
    msg4 db "Array: $"
    arr db 9 dup(?)              
    count db 0
.code                          
    main proc
        mov ax,@data
        mov ds,ax
        getInput arr,msg1,count
        next:
        display arr,msg4,count
        getEoO arr,msg2,msg3,count
        end:
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
    space proc
        mov dl,32
        mov ah,2
        int 21h
        ret
    space endp
end main