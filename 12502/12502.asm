include 'emu8086.inc'
.model small
.data
    t dw ?
    a dw ?
    ans1 dw ?
    b dw ?
    c dw ?
.code
main proc
    call scan_num
    printn
    mov t, cx
while:
    mov ax, t
    cmp ax, 0
    je exit
    call scan_num  ; cin>a
    printn
    mov a, cx
    call scan_num    ;cin>b
    printn
    mov b, cx
    call scan_num  ;cin>c
    printn
    mov c, cx
                ;c*(2*a*b)/(a+b)
    mov ax, a
    mov cx, 2
    mul cx     ;cx=a*2
    sub ax, b  ;cx-=b
    mov cx, c
    mul cx     ;ax=c*cx
    
    xor dx, dx ;dx=0
    mov bx, a  ;bx=a
    add bx, b  ;bx+=b
    div bx     ;ax=ax/bx
               ;displaying result
    call print_num
    printn
    
    dec t
  jmp while    

exit:
    mov ah, 4ch
    int 21h    
    
    main endp
define_scan_num
define_print_num
define_print_num_uns
end main