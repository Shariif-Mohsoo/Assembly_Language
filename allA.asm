;write program to take an input from the user and display it also make sure to find the greatest element  and also find smallest element
getInput macro ar1,ms1,c1
    mov cx,9
    mov si,offset ar1
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
    lea dx,ms2
    mov ah,9
    int 21h
    mov cl,c2
    mov ch,0     
    mov si,offset ar2
    l2:          
        mov dl,[si]
        mov ah,2
        int 21h
        mov dl,32
        mov ah,2
        int 21h 
        inc si
    loop l2    
    call nextLIne
endm  
findMax macro ar3,ms3,c3,max
    mov si,offset ar3    
    mov cl,c3
    mov ch,0
    mov bl,[si]
    l3:    
        cmp [si],bl
        jge upDateMax
        back1:
        inc si
       
    loop l3         
    
    
    mov dx,offset ms3
    mov ah,9
    int 21h
    
    mov max,bl
    mov dl,bl
    mov ah,2
    int 21h
    call nextLine
    jmp next1
    
    
        upDateMax:
            mov bl,[si]
            jmp back1
       
endm
findMin macro ar4,ms4,c4,min 
   mov cl,c4
   mov ch,0 
   mov si,offset ar4
   mov bl,[si]
   l4: 
        cmp [si],bl
        jle upDateMin
        
        back2:
        inc si
   loop l4             
                       
   mov dx,offset ms4
   mov ah,9
   int 21h  
   mov min,bl                  
   mov dl,bl
   mov ah,2
   int 21h
   call nextLine
   jmp next2
   
   
        upDateMin:
            mov bl,[si]
            jmp back2
   
endm 
findSecMax macro ar5,ms5,c5,max
      mov cl,c5
      mov ch,0 ;setting the counter
      mov si,offset ar5
      mov bl,[si]
      mov dl,max
     ; cmp dl,bl
      ;je upDate
      
      l5:
        cmp [si],bl
        jge upDateSec1
        back3:
        inc si
      loop l5
                 
      
      mov dx,offset ms5
      mov ah,9
      int 21h
      mov dl,bl
      mov ah,2
      int 21h
       
      call nextLine 
      jmp next3
                 
         upDateSec1:
            cmp [si],dl
            je upDate1
            mov bl,[si]
            jmp back3
         
         
         
         
         upDate1:
            inc si
            mov bl,[si]
            dec cl
            jmp l5
      
      
endm  
findSecMin macro ar6,ms6,c6,min
        mov si,offset ar6
        mov cl,c6
        mov ch,0
        mov bl,[si]
        mov dl,min
        
        cmp bl,dl
        je upDate2
        
        l6:    
            cmp [si],bl
            jle upDateSec2
            back4:
            inc si    
        loop l6
        
        mov dx,offset ms6
        mov ah,9
        int 21h
        mov dl,bl
        mov ah,2
        int 21h 
        call nextLine
        jmp next4
        
            upDateSec2:
                cmp [si],dl
                je upDate2
                mov bl,[si]
                jmp back4 
                
            upDate2:
                inc si
                mov bl,[si]
                dec cl
                jmp l6
        
        
endm  
sum macro ar7,ms7,c7
    call nextLine
    mov cl,c7
    mov ch,0
    mov si,offset ar7
    
    mov al,0
    mov ah,0
    l7:
       add al,[si]
       aaa ;ascii adjust after addition
       inc si 
    loop l7
        mov cx,ax
        
        lea dx,ms7
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
        
        call end
endm
.model small
.stack 100h
.data
    arr db 9 dup(?)
    count db 0          
    msg1 db "Enter input: $"
    msg2 db "Array: $"
    msg3 db "Maximum: $"           
    msg4 db "Minimum: $"
    msg5 db "Second Max: $"
    msg6 db "Second Min: $" 
    msg7 db "Sum: $"
    mini db ?
    maxi db ?
.code                      
    main proc  
        mov ax,@data
        mov ds,ax
        getInput arr,msg1,count 
        next:      
        display arr,msg2,count
        findMax arr,msg3,count,maxi       
        next1:
        findMin arr,msg4,count,mini
        next2: 
        ;findSecMax arr,msg5,count,maxi 
        next3:
        ;findSecMin arr,msg6,count,mini 
        next4:
        sum arr,msg7,count  
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