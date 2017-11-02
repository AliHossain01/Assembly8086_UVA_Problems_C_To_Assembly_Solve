INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    N dw ?
    i dw ?
    a dw ?
    b dw ?
    c dw ?
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    
while:
    call scan_num  ;input N
    mov N, ax      ;N=ax
    mov i, 1       ;i=1
    printn
for:               ;for start
    mov ax, i
    cmp ax, N
    jg exit_for
    
    call scan_num  ;input a
    mov a, cx
    printn
    
    call scan_num  ;input b
    mov b, cx
    printn
    
    call scan_num  ;input c
    mov c, cx
    printn
                   ;if((a+b)>c)
    mov ax, a
    add ax, b
    cmp ax, c
    jle else
    printn "OK"
    jmp after
 else:             ; else
    printn "Wrong!!"
    
after:   
    inc i
    jmp for
exit_for:     
jmp while    
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM
END MAIN



