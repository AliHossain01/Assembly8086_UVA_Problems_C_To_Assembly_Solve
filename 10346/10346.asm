include 'emu8086.inc'
.model small
.stack 100h
.data          ; data section
    n db ? 
    i db ?
    k db ?
.code
main proc
    mov ax, @data    ; import data
    mov ds, ax
                    ;while(scanf("%d%d",&N, &k)==1 && k>1)
while_start:
    mov ah, 1       ; input N
    int 21h 
    sub al, 48      ; al-=48
    mov n, al       ; N=al
    mov i, al
    print ' '       ; print single space
    mov ah, 1       ; input k
    int 21h 
    sub al, 48      ; al-=48
    mov k, al       ; k=al
    cmp al, 1       ;if k<=1
    jle Exit        ; then exit
    printn
                    ;while(n>=k)
while2:    
     mov al, n      ; al=n
     cmp al, k      ; compare al and k
     jl exit_while2 ; if al<k then exit while2
     mov al, n      ; al=n
     xor ah, ah     ; ah=0
     mov dl, k      ; dl=k
     div dl         ; al=ax/dl
     add i, al      ; i+=al
     mov n, al      ; n=(n/k)+(n%k)
     add n, ah
     jmp while2 
         
exit_while2:
    printn           ; displaying newline
    mov dl, i        ; displaying result
    add dl, 48
    mov ah, 2
    int 21h 
    printn
    jmp while_start  ; jump to while_start
Exit:    
    mov ah, 4ch
    int 21h 
    main endp
end main