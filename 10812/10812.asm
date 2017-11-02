include 'emu8086.inc'  ; include library function
.model small
.stack 100h
.data             ; data section
   T dw ?
   s dw ?
   d dw ?
   x dw ?
   y dw ?
   i dw ? 
    
.code             ; code section
main proc         ; main proc start
    mov ax, @data ; import data
    mov ds, ax
    
 while:
      call scan_num    ; input T
      mov T, cx
      printn
      mov i, 0     ; i=0
  
  for:
    mov ax, i      ;ax=i
    cmp ax, T      ;ax=T
    je exit_for
    
    call scan_num  ;input s
    mov s, cx      ;s=cx
    printn
    call scan_num   ;input d
    mov d, cx
    printn        ;newline
    
 mov ax, s       ;ax=d
 cmp ax, d       ;compare s and d, s<d
 jg print_impossible
 
 xor dx, dx     ;dx=0
 mov ax, s      ;(s-d)%2!=0
 sub ax, d
 mov cx, 2
 div cx
 cmp dx, 0
 jne print_impossible
 jmp else
 
print_impossible:
   printn "impossible" ;displaying impossible
   jmp after
else:             
    xor dx, dx
    mov ax, s     ;ax=s
    sub ax, d     ;ax=s-d
    mov cx, 2     ;c=2
    div cx        ;ax=ax/cx
    mov y, ax     ;y=ax
    
    mov ax, s     ;ax=s
    add ax, d     ;ax+=d
    mov cx, 2
    div cx
    mov x, ax
    
    mov ax, x     ;displaying x
    call print_num
    print " "      ;displaying space
    mov ax, y
    call print_num  ;displaying y
    printn 
after:  
    inc i ;i++      ;i++
  jmp for  ; jump to for  

exit_for: 
 jmp while  ;jump to while 
    
exit:    
    mov ah, 4ch   ; exit
    int 21h
    main endp      ; main proc end
                   ;define build in function
    define_print_num_uns
    define_print_num
    define_scan_num
end main



