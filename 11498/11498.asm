include 'emu8086.inc'
.model small
.data
    n dw ?
    px dw ?
    py dw ?
    x dw ?
    y dw ?
.code
main proc
    call scan_num  ;cin>>n
    mov n, cx
    printn         ;newline
 while:
    mov cx, n     ; compare n and 0
    cmp cx, 0
    je Exit   
    
    call scan_num
     mov px, cx    ; input px
     printn
     
     call scan_num ; input py
     mov py, cx
     printn
    
 while2:
     mov cx, n
     cmp cx, 0
     je after2 
     
     call scan_num
     mov x, cx       ; input x
     printn
     
     call scan_num
     mov y, cx      ;input y
     printn
                    ;if (x == px || y == py)
     mov ax, x
     cmp ax, px
     je print_divisa
     mov ax, y
     cmp ax, py
     je print_divisa
     jmp else_if1
             
 print_divisa:
     printn "divisa"
     jmp after
 else_if1:           ;else if (x < px && y > py)
     mov ax, x
     cmp ax, px
     jl check_py
     jmp elseif2
     
check_py:
     mov ax, y
     cmp ax, py
     jg print_NO
     jmp elseif2   
     
print_NO:
     printn "NO"
     jmp after             
 
elseif2:         ;else if (x > px && y > py)
    mov ax, x
    cmp ax, px
    jg check_py2
    jmp elseif3
    
check_py2:
    mov ax, y
    cmp ax, py
    jg print_NE
    jmp elseif3     
print_NE:
    printn "NE"
    jmp after
    
elseif3:         ;else if (x > px && y < py)
    mov ax, x
    cmp ax, px
    jg check_py3
    jmp elseif4
    
check_py3:
    mov ax, y
    cmp ax, py
    jl print_SE
    jmp elseif4     
print_SE:
    printn "SE"
    jmp after      

elseif4:           ;else if (x < px && y < py)
    mov ax, x
    cmp ax, px
    jl check_py4
    jmp after
    
check_py4:
    mov ax, y
    cmp ax, py
    jl print_SO
    jmp after     
print_SO:
    printn "SE"
          
 after:     
     dec n 
     printn       ; newline
     jmp while2   ;jump to while
     
 after2:         
    jmp while        ; jump to while
    
  Exit:
    mov ah, 4ch
    int 21h
      
    main endp
define_scan_num
define_print_num
define_print_num_uns
 end main