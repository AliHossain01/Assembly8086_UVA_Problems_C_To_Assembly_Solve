include 'emu8086.inc'
.model small
.stack 100h
.data           ; data section
    u db ?  
    t db ?
.code
main proc
    mov ax, @data
    mov ds, ax
                ;while(scanf("%d%d", &u, &t)==2)
 for:
    mov s, 0     ; s=0
    mov ah, 1    ; input u
    int 21h
    mov u, al
    sub u, 48    ; u-=48
    print ' '
    mov ah, 1    ; input t
    int 21h
    printn       ; displaying newline 
    mov t, al
    sub t, 48    ; t-=48
    
    mov al, 2    ; al=2
    mul u        ; ax = al*u
    xor ah, ah   ; ah=0
    mul t        ; ax=al*t
    xor ah, ah   ; ah=0
    mov ah, 2
    mov dl, al   ; result
    add dl, 48   ; dl+=48
    int 21h
    
   mov ah, 4ch
   int 21h 
     
   main endp
end main

