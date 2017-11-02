include 'emu8086.inc'  ; include library function
.model small
.stack 100h
.data             ; data section
 N dw ?   
    
.code             ; code section
main proc         ; main proc start
    mov ax, @data ; import data
    mov ds, ax
    
  while:
        call scan_num  ;input N
        mov N, cx 
        printn
        cmp cx, 0   ;compare cx and 0
        je exit
        
        cmp cx, 100
        jg if        ; if greater than 100 then jump to if
        print "f91("
        mov ax, N
        call print_num
        printn ") = 91"  ;printf("f91(%d) = 91\n", N);
        jmp while
        
  if:                 ;printf("f91(%d) = %d\n", N, N-10);
        print "f91("
        mov ax, N
        call print_num
        print ") = "
        mov ax, N
        sub ax, 10
        call print_num
        printn       
  
    jmp while  
    
exit:    
    mov ah, 4ch   ; exit
    int 21h
    main endp      ; main proc end
    define_print_num_uns
    define_print_num
    define_scan_num
end main



