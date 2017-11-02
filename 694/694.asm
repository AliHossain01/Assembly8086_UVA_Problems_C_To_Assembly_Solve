INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    A dw ?
    L dw ?
    count dw ?
    temp dw ?
    T dw ?
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    
while:
    mov T, 0 
     call scan_num
     mov A, cx
     printn
     call scan_num
     mov L, cx
     printn
     mov ax, A
     cmp ax, 0
     je check_L
     jmp after
check_L:
     mov ax, L
     cmp ax, 0
     je Exit     

after:
     mov ax, A
     mov temp, ax
     mov count, 0     
     
while2:
    mov ax, A
    cmp ax, L
    jg exit_while2
    
    mov ax, A
    cmp ax, 1
    je break_count
    xor dx, dx
    mov ax, A
    mov cx, 2
    div cx
    cmp dx, 0
    je AandCount
    mov ax, A
    mov cx, 2
    div cx
    cmp dx, 1
    je AandCount2
    jmp after2
AandCount:
    inc count    
    mov ax, A
    mov cx, 2
    div cx
    mov A, ax
    jmp after2
AandCount2:
    inc count
    mov ax, A
    mov cx, 3
    mul cx
    add ax, 1 
    mov A, ax
    jmp after2      
break_count:  
    inc count 
    jmp exit_while2
    
after2:
    jmp while2     
exit_while2:
    print "Case "
    inc T
    mov ax, T
    call print_num
    print ": A = "
     mov ax, temp
     call print_num
     print ", limit = "
     mov ax, L
     call print_num
     print ", number of terms = "
     mov ax, count
     call print_num
     printn
          
     jmp while
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



