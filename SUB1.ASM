dosseg
.model small
.stack 100h
.data
.code
        main proc
        mov bh,5
        mov ch,8
        sub ch,bh
        add ch,48
        mov dl,ch
        mov ah,2
        int 21h
        mov ah,4ch
        int 21h
        main endp
end main
