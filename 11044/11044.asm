include 'emu8086.inc'
.model small
.stack 100h
.data              ; data section
    first db ?
    second db ? 
    t db ?
.code              ; code section
main proc
    mov ax, @data  ; import data
    mov ds, ax
    
    mov ah, 1       ; input t
    int 21h
    sub al, 48
    mov t, al  
    printn
 
 while:
    xor ax, ax
    xor cx, cx
    xor dx, dx   
    mov ah, 1      ; first input
    int 21h
    sub al, 48     ; al-=48
    xor ah, ah     ; ah = 0
    mov dl, 3      ; dl=3
    div dl         ; al = ax/dl
    mov first, al  ; first=al
    
    print " "      ; print single space
    
    mov ah, 1      ; second input
    int 21h
    sub al, 48     ; al-=48
    xor ah, ah     ; ah=0
    mov dl, 3      ; dl=3
    div dl         ; al=ax/dl
    mov second, al ; second=al
    printn         ; print newline
    
    mov al, first  
    mov dl, second  
    mul dl         ; ax=al*cl
    mov ah, 2      ; output
    mov dl, al     ; dl=al
    add dl, 48     ; dl+=48
    int 21h
    dec t
    mov al, t
    dec al
    cmp al, 0
    jl Exit
    printn
    jmp while 

Exit:
    mov ah, 4ch
    int 21h    
    main endp
end main