INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX

while:             ;while start
    call scan_num
    printn
    cmp cx, 0
    jl Exit
                   ;piece = (N*(N+1))/2 + 1
    mov ax, cx
    add ax, 1
    mul cx
    mov dl, 2
    div dl
    add ax, 1
    
    call print_num
    printn
       
    jmp while
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main prc end
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM
END MAIN



