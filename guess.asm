printMessage macro msg
     lea dx,msg
     mov ah,9
     int 21h
endm 
;for fifty
getFifty macro N1,am1
    cmp N1,1
    je sum50
    cmp N1,2
    je sum100
    cmp N1,3
    je sum150
    cmp N1,4
    je sum200
    cmp N1,5
    je sum250
    cmp N1,6
    je sum300
    cmp N1,7
    je sum350
    cmp N1,8
    je sum400
    cmp N1,9
    je sum450
    
    sum50:
        add am1,50
        jmp nextf

    sum100:
        add am1,100
        jmp nextf

    sum150:
        add am1,150
        jmp nextf

    sum200:
        add am1,200
        jmp nextf

    sum250:
        add am1,250
        jmp nextf

    sum300:
        add am1,300
        jmp nextf

    sum350:
        add am1,350
        jmp nextf

    sum400:
        add am1,400
        jmp nextf

    sum450:
        add am1,450
        jmp nextf


endm
;for hundred
getHundreds macro N,am  
    cmp N,1
    je add100
    cmp N,2
    je add200
    cmp N,3
    je add300
    cmp N,4
    je add400
    cmp N,5
    je add500
    cmp N,6
    je add600
    cmp N,7
    je add700
    cmp N,8
    je add800
    cmp N,9
    je add900
    
    add100:
        add am,100
        jmp next
    add200:
        add am,200
        jmp next
    add300:
        add am,300
        jmp next
    add400:
        add am,400
        jmp next
    add500:
        add am,500
        jmp next
    add600:
        add am,600
        jmp next
    add700:
        add am,700
        jmp next
    add800:
        add am,800
        jmp next
    add900:
        add am,900
        jmp next
                            
endm  
;get 2Hundred
getTwoHundreds macro N2,am2
    cmp N2,1
    je plus200
    cmp N2,2
    je plus400
    cmp N2,3
    je plus600
    cmp N2,4
    je plus800
    cmp N2,5
    je plus1000
    cmp N2,6
    je plus1200
    cmp N2,7
    je plus1400
    cmp N2,8
    je plus1600
    cmp N2,9
    je plus1800
    
    plus200:
        add am2,200
        jmp nextT
    plus400:
        add am2,400
        jmp nextT
    plus600:
        add am2,600
        jmp nextT
    plus800:
        add am2,800
        jmp nextT
    plus1000:
        add am2,1000
        jmp nextT
    plus1200:
        add am2,1200
        jmp nextT
    plus1400:
        add am2,1400
        jmp nextT
    plus1600:
        add am2,1600
        jmp nextT
    plus1800:
        add am2,1800
        jmp nextT
                                        
endm
getTotal macro am1  
  
    
    mov ax,am1 
    mov dx,0
    mov cx,0
    mov bx,10
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
    call nextLine
endm
.model large
.stack 1000h
.data   
;for the end
H db ?  
F db ?
H2 db ?
total dw 0 
tS1   db 10,13,'       (==========================================================)$'
tBill db 10,13,'                        Total Bill Is Rs.$'
ts2   db 10,13,'       (==========================================================)$'
;wecome page
a1 db 10,13,'                   <==========================================$'
a2 db 10,13,'                   |*|                 Welcome              |*|$'
a3 db 10,13,'                   |*|                    To                |*|$'
a4 db 10,13,'                   |*|            Bakery Management         |*|$'
a5 db 10,13,'                   |*|                  System              |*|$'
a6 db 10,13,'                   ===========================================>$'

;choose
a7 db 10,13,'                    (================Schedule===============)$'
a8 db 10,13,'                    Kindly Enter Your Choice: $'
a19 db 10,13,'                          Enter 1 to Display Schedule: $'
a34 db 10,13,'                            Select Your Item: $'
a35 db 10,13,'                            Enter Quantity: $'
a36 db 10,13,'                        Invalid Input !! Rerun the Program$'
a37 db 10,13,'                            Total Price: $'
a38 db 10,13,'                    1.Schedule: $'
a39 db 10,13,'                    2.Exit: $'


;Schedulelist
a9 db 10,13,'                         1.Morning Bakery Items$'
a10 db 10,13,'                        2.Afternoon Bakery Items$'
a11 db 10,13,'                        3.Evening Bakery Items$'

;Breakfast List
a12 db 10,13,'                  ********      Breakfast List      ********$'
a13 db 10,13,'                       1.Croissant               50/-$'
a14 db 10,13,'                       2.Bagel                   50/-$'
a15 db 10,13,'                       3.Muffin                  50/-$'
a16 db 10,13,'                       4.Danish Pastry           50/-$'
a17 db 10,13,'                       5.Cinnamon Roll           50/-$'
a18 db 10,13,'                       6.Naan Khatai             50/-$'


;Lunch List
a20 db 10,13,'                  ********        Lunch List        ********$'
a21 db 10,13,'                       1.Sandwich                100/-$'
a22 db 10,13,'                       2.Pizza Slice             100/-$'
a23 db 10,13,'                       3.Quiche                  100/-$'
a24 db 10,13,'                       4.Salad                   100/-$'
a25 db 10,13,'                       5.Pastry                  100/-$'
a26 db 10,13,'                       6.Chicken Patties         100/-$'


;Dinner List
a27 db 10,13,'                  ********        Dinner List       ********$'
a28 db 10,13,'                       1.Bread Loaf              200/-$'
a29 db 10,13,'                       2.Dinner Roll             200/-$'
a30 db 10,13,'                       3.Cake Slice              200/-$'
a31 db 10,13,'                       4.Pie Slice               200/-$'
a32 db 10,13,'                       5.Cookie                  200/-$'
a33 db 10,13,'                       6.Chicken Roll            200/-$'


.code
main proc

mov ax,@data
mov ds,ax

;welcome page
printMessage a1
printMessage a2
printMessage a3
printMessage a4
printMessage a5
printMessage a6

;new line
call nextLine
call nextLine

;take input to start
mov ah,9
lea dx,a19
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Schedule
jmp Invalid


Schedule:
;new line
call nextLine
call nextLine


printMessage a7
printMessage a9
printMessage a10
printMessage a11

;list choose
printMessage a8
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Breakfast

cmp bh,2
je Lunch

cmp bh,3
je Dinner

jmp Invalid


;Breakfast list
Breakfast:

;new line
call nextLine
call nextLine

;List Start
printMessage a12
call nextLine

printMessage a13
printMessage a14
printMessage a15
printMessage a16
printMessage a17
printMessage a18

;condition checking
printMessage a34

mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je Fifty

cmp bl,2
je fifty

cmp bl,3
je fifty

cmp bl,4
je fifty

cmp bl,5
je fifty

cmp bl,6
je fifty

jmp Invalid



Lunch:
;new line
call nextLine

call nextLine

;List Start
printMessage a20
call nextLine

printMessage a21
printMessage a22
printMessage a23
printMessage a24
printMessage a25
printMessage a26


;condition checking
printMessage a34


mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je Hundred

cmp bl,2
je Hundred

cmp bl,3
je Hundred

cmp bl,4
je Hundred

cmp bl,5
je Hundred

cmp bl,6
je Hundred

jmp Invalid

;for exit
call nextLine
printMessage a38


mov ah,1
int 21h
mov bh,al

cmp bh,1
jmp Exit


Dinner:
;new line
call nextLine
call nextLine
;List Start   
printMessage a27
call nextLine

printMessage a28
printMessage a29
printMessage a30
printMessage a31
printMessage a32
printMessage a33

;condition checking
printMessage a34

mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je TwoHundred

cmp bl,2
je TwoHundred

cmp bl,3
je TwoHundred

cmp bl,4
je TwoHundred

cmp bl,5
je TwoHundred

cmp bl,6
je TwoHundred

jmp Invalid


Fifty:
mov bl,5
printMessage a35


mov ah,1
int 21h
sub al,48

mov F,al
getFifty F,total
 
nextF:
mul bl
aam

mov cx,ax
add ch,48
add cl,48

printMessage a37


mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;for exit or main menu
call nextLine

mov ah,9
lea dx,a38
int 21h

mov ah,9
lea dx,a39
int 21h

mov ah,9
lea dx,a8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid


Hundred:
mov bl,10
lea dx,a35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
      
mov H,al
getHundreds H,total

next:
mul bl
aam

mov cx,ax
add ch,48
add cl,48


lea dx,a37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;for exit
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,a38
int 21h

mov ah,9
lea dx,a39
int 21h

mov ah,9
lea dx,a8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid


TwoHundred:
mov bl,20
lea dx,a35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mov H2,al
getTwoHundreds H2,total

nextT:
mul bl
aam

mov cx,ax
add ch,48
add cl,48


lea dx,a37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;for exit
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,a38
int 21h

mov ah,9
lea dx,a39
int 21h

mov ah,9
lea dx,a8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid


Invalid:
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h


mov ah,9
lea dx,a36
int 21h
jmp Exit


Exit:    
printMessage tS1
printMessage tBill
call nextLine
getTotal total  
printMessage tS2
mov ah,4ch
int 21h
main endp  
;defining the next line proc
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




