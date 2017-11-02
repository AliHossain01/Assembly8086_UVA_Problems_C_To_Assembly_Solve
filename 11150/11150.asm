include 'emu8086.inc'
.model small
.stack 100h
.data          ; data section
    N db ? 
    temp db ?
    e db ?
.code
main proc
    mov ax, @data    ; import data
    mov ds, ax
                    ;while(scanf("%d",&N)==1)
while_start: 
    mov ah, 1       ; input N
    int 21h 
    sub al, 48      ; al-=48
    mov N, al       ; N=al
    mov temp, al    ; temp=N+1 
    add temp, 1     
    mov e, al       ; e=N
    printn
                ;while(temp>=3)
while2:    
    mov al, temp     ; al=temp
    xor ah, ah       ; ah=0
    mov dl, 3        
    div dl 
    add e, al        ; e+=(temp/3)
    xor dl, dl       ; dl=0
    add dl, ah       ; temp=(temp%3)+(temp/3)
    add dl, al            
    mov al, dl
    mov temp, dl
    cmp al, 3        ; if temp>=3
    jge while2       ; jump while2
    
    mov ah, 2
    mov dl, e        ; displaying result
    add dl, 48
    int 21h
    printn           ; displaying newline
    jmp while_start  ; jump to while_start
Exit:    
    mov ah, 4ch
    int 21h 
    main endp
end main