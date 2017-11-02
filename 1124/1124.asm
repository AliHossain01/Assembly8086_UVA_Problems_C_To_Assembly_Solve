include 'emu8086.inc'
.model small
.data
    str db 100 DUP (?)
    char db ?
.code
main proc   
    
while:    
   mov bx, 0
for:    
    mov ah, 1   ;input from user
    int 21h
    mov char, al ;char=al
    cmp al, 13
    je exit_for  ;if enter then exit
    mov al, char
    mov str[bx], al ;str[bx]=char
    inc bx        ;bx++
    jmp for       ;jump to for
exit_for:
   printn         ;newline
   mov si, bx     ; si=bx
   mov bx, 0      ;bx=0
for2:
    mov cx, bx
    cmp cx, si    ;compare cx, si
    je after      ; jump equal
    mov ah, 2
    mov dl, str[bx] ; output
    int 21h
    inc bx
    jmp for2       ; jump to for2
    
after:
    printn
    jmp while      ; jump to while
Exit:
    mov ah, 4ch
    int 21h   
    main endp
end main