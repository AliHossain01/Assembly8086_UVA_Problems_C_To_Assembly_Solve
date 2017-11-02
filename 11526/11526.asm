include 'emu8086.inc'
.model small
.stack 100h
.data
    T dw ?
    i dw ?
    n dw ?
    res dw ?
    x dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    call scan_num ; input T
    mov T, cx
    printn       ;newline
 while:
    mov ax, T
    cmp ax, 0   ;compare
    je exit      ; T==0 then exit
    call scan_num ; input x
    mov x, cx
    printn        ;newline
    
    mov res, 0    ;res=0
    mov i, 1     ;i=1
 for:            ;for(i = 1; i <= n; i++ )
    mov ax, i
    cmp ax, x
    jg exit_for
    
    xor dx, dx
    mov ax, x
    mov cx, i
    div cx       ;n/i
    add ax, res   ;ax=(res + n/i)
    mov res, ax  ;res = ax 
    inc i        ;i++
 jmp for    
  
  exit_for:          ;displying result
        mov ax, res
        call print_num
        printn
    
    dec T          ; T--
 jmp while          ;jump to while
 
 Exit:
    mov ah, 4ch
    int 21h
       
    main endp     
                 ;define build in function
define_scan_num
define_print_num
define_print_num_uns
end main