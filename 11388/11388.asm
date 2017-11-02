INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    i dw ?
    j dw ?
    g dw ?
    l dw ?
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    
    call scan_num
    mov i, cx     ;i=cx
    printn
    mov j, 1    ;j=1
    
for:
    mov ax, j       ;ax=j
    cmp ax, i    
    jg Exit
    
    call scan_num
    mov g, cx
    printn
    call scan_num
    mov l, cx
     
 if:
    xor dx, dx
    mov ax, l
    mov cx, g
    mul cx
    
    cmp dx, 0
    je print_if
 else:   
    printn "-1"
    jmp after 
print_if:
    mov ax, g
    call print_num
    print " "
    mov ax, l
    call print_num
    printn 
after:       
    inc j
    jmp for
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN