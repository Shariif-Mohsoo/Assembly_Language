
.model small
.stack 100h
.data
.code
        main proc
        mov cl,1
        mov bl,2
        add cl,bl
        add cl,48
        mov dl,cl
        mov ah,2
        int 21h
        mov ah,4ch
        int 21h
        main endp
end main
