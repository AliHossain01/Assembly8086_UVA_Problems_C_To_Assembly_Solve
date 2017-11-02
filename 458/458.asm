include 'emu8086.inc'
.model small
.stack 100h
.data
    char db 1000 DUP(?)
.code
main proc
   mov ax, @data
   mov ds, ax
   mov bx, 0  ;bx=0
Input:        ;get the string
   mov ah, 1  ;input
   int 21h
   cmp al, 13  
   je after    ;if enter then exit
   sub al, 7
   mov char[bx], al
   inc bx      ;bx++
   jmp Input   ;jumpt to input

after:
    mov si, 0  ;si=0
    printn     ;newline
 Output:       ;output
    cmp si, bx ;si=bx then exit
    je exit
    mov dl, char[si]
    mov ah, 2
    int 21h
    inc si      ;si++
    jmp output    
 
exit:
    mov ah, 4ch
    int 21h    
    main endp
end main
