include 'emu8086.inc'  ; include library function
.model small
.stack 100h
.data             ; data section
  T dw ?
  i dw ?
  m dw ?
  k dw ?
  A db DUP 100 (0)
  num dw ?  
    
.code             ; code section
main proc         ; main proc start
    mov ax, @data ; import data
    mov ds, ax

while:
    call scan_num   ; input T
    mov T, cx
    printn
    mov m, 1
 for:               ;for start
    mov ax, m       ;ax=m
    cmp ax, T       ;compare m and T
    jg exit_for
    call scan_num   ;input i
    mov i, cx
    printn          ;newline
    mov k, 0        ;k=0
    mov bx, 0       ;bx=0
  for2:
    mov ax, k       ;ax=k
    cmp ax, i       ;compare k and i
    je exit_for2
    call scan_num   ;input A[k]
    printn          ; newline
    
    mov bx, k       ;bx=k
    mov A[bx], cl   ;insert value into array
    
    inc k          ;k++
   jmp for2        ;jump to for2
exit_for2:
    printn          ; dispaying result
    print "Case "
    mov ax, m
    call print_num  ; call print_num proc
    print ": "
                   
    mov ax, k 
    mov cx, 2
    div cx      ; k/2
    mov bx, ax
    xor ah, ah
    mov al, A[bx]  ; al=A[k/2]
    call print_num
    printn
     
    inc m       ;m++
 jmp for
 
 exit_for:   

jmp while    
    
exit:    
    mov ah, 4ch   ; exit
    int 21h
    main endp      ; main proc end
    define_print_num_uns
    define_print_num
    define_scan_num
end main



