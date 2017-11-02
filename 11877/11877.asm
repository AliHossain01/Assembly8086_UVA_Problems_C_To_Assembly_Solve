include 'emu8086.inc'
.model small
.stack 100h
.data             ; data section
    temp dw ?
    flag dw ?
    e dw ?
    N dw ? 
    ans dw ?
.code
main proc         ; main proceure
    mov ax, @data ; data import
    mov ds, ax
    
while1:           ; while(scanf("%d", &N)==1)
    CALL SCAN_NUM ; input N
    MOV N, CX
    add cx, 1
    mov temp, cx
    printn        ; print newline
    mov flag, 1   ; flag=1
    mov e, 0      ; e=0
    
    xor ax, ax    ; ax=0
    mov ax, N     ; ax=N
    cmp ax, 0
    jne else
    mov flag, 1
    jmp after
else:             ; else
     while2:      ; while(temp>=3)
                  ;e=e+(temp/3)
        xor dx, dx
        mov ax, temp
        mov cx, 3
        div cx
        mov ans, ax  ; ans=temp/3
        add ax, e
        mov e, ax
                   ;temp=(temp%3)+(temp/3)
        xor ax, ax
        mov ax, ans
        add ax, dx
        mov temp, ax 
        mov flag, 0 ; flag=0
        
        xor ax, ax   ; ax=0
        mov ax, temp
        cmp ax, 3
        jge while2    ; jump to while2
        
        xor ax, ax    ; if(flag==0)
        mov ax, flag
        cmp ax, 0
        je print_e
        jmp after
print_e:              ; printf("%d\n", e);
    mov ax, e
    CALL PRINT_NUM_UNS  ; displaying result
            
after:               ; print newline
    printn
    jmp while1       ; jump to while1
 
 Exit:   
    mov ah, 4ch
    int 21h
    main endp 
    DEFINE_SCAN_NUM  ; define build in function
    DEFINE_PRINT_NUM_UNS
end main