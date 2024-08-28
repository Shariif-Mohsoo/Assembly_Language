.model large
.stack 1000h
.data

; Welcome page
welcome_msg db 10,13,'                   ******************************************$'
            db 10,13,'                   **          Welcome to Bakery           **$'
            db 10,13,'                   **         Management System            **$'
            db 10,13,'                   ******************************************$'

; Menu options
menu_options db 10,13,'                    Schedule---$'
            db 10,13,'                    Enter Your Choice: $'
            db 10,13,'                    1. Display Schedule$'
            db 10,13,'                    2. Exit$'

; Schedule list
schedule_list db 10,13,'                        1. Morning Bakery Items$'
            db 10,13,'                        2. Afternoon Bakery Items$'
            db 10,13,'                        3. Evening Bakery Items$'

; Morning Bakery Items
morning_items db 10,13,'                  ********    Morning Bakery Items    ********$'
            db 10,13,'                       1. Croissant               50/-$'
            db 10,13,'                       2. Bagel                   50/-$'
            db 10,13,'                       3. Muffin                  50/-$'
            db 10,13,'                       4. Danish Pastry           50/-$'
            db 10,13,'                       5. Cinnamon Roll           50/-$'

; Afternoon Bakery Items
afternoon_items db 10,13,'                  ********   Afternoon Bakery Items   ********$'
            db 10,13,'                       1. Sandwich                100/-$'
            db 10,13,'                       2. Pizza Slice             100/-$'
            db 10,13,'                       3. Quiche                  100/-$'
            db 10,13,'                       4. Salad                   100/-$'
            db 10,13,'                       5. Pastry                  100/-$'

; Evening Bakery Items
evening_items db 10,13,'                  ********    Evening Bakery Items    ********$'
            db 10,13,'                       1. Bread Loaf              200/-$'
            db 10,13,'                       2. Dinner Roll             200/-$'
            db 10,13,'                       3. Cake Slice              200/-$'
            db 10,13,'                       4. Pie Slice               200/-$'
            db 10,13,'                       5. Cookie                  200/-$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display welcome message
    mov ah, 9
    lea dx, welcome_msg
    int 21h

    ; New line
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    ; Display menu options
    mov ah, 9
    lea dx, menu_options
    int 21h

    ; Take user input for menu choice
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, 48

    cmp bh, 1
    je MorningItems
    cmp bh, 2
    je AfternoonItems
    cmp bh, 3
    je EveningItems
    jmp Exit

MorningItems:
    ; Display morning bakery items
    mov ah, 9
    lea dx, schedule_list
    int 21h

    ; Display morning bakery items list
    mov ah, 9
    lea dx, morning_items
    int 21h
    ; Continue with your logic for morning items...

AfternoonItems:
    ; Display afternoon bakery items
    mov ah, 9
    lea dx, schedule_list
    int 21h

    ; Display afternoon bakery items list
    mov ah, 9
    lea dx, afternoon_items
    int 21h
    ; Continue with your logic for afternoon items...

EveningItems:
    ; Display evening bakery items
    mov ah, 9
    lea dx, schedule_list
    int 21h

    ; Display evening bakery items list
    mov ah, 9
    lea dx, evening_items
    int 21h
    ; Continue with your logic for evening items...

Exit:
    ; Exit the program
    mov ah, 4ch
    int 21h

main endp
end main
