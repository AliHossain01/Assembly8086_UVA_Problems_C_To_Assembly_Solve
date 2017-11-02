INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    x dw ?
    y dw ?
    z dw ?
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    
while:
    call scan_num  ; input x
    mov x, cx
    printn
    call scan_num  ;input y
    mov y, cx
    printn
    call scan_num  ;input z
    mov z, cx
    printn
    
 mov ax, z      ; ax=z
 sub ax, y      ; ax-=y
 cmp ax, x
 jl else
 printn "Props win!" ; if
 jmp after
 
else:
 printn "Hunters win!" ;else
after:    
jmp while
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



