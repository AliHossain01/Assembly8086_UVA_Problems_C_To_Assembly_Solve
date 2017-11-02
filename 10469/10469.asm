include 'emu8086.inc'
.model small
.stack 100h
.data
    a dw ?
.code
main proc
 while: 
    call scan_num
    mov a, cx
    printn    
    call scan_num
    printn
    
    xor cx, a
    mov ax, cx
    call print_num
    printn       
    jmp while           
        
    mov ah,4ch
    int 21h
       
    main endp
                   ; define build in function
define_scan_num
define_print_num
define_print_num_uns
end main