INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    s dw ?
    i dw ?
    j dw ?
    k dw ?
    a dw ?
    b dw ?
    c dw ?
    l dw ?
        
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
while:
    call scan_num   ;input i
    mov i, cx
    printn
    
    mov j, 0
for1:
    mov ax, j      
    cmp ax, i
    jge exit_for1
    
    mov s, 0
    call scan_num  ;input k
    mov k, cx
    mov l, 0 
    printn
for2:
    mov ax, l     ;ax=l
    cmp ax, k
    jge exit_for2
    
    call scan_num  ;input a
    mov a, cx
    printn
    call scan_num  ;input b
    mov b, cx
    printn
    call scan_num  ;input c
    mov c, cx
    printn
                   ;s+=a*c
    mov ax, a
    mov dx, c
    mul dx
    add ax, s
    mov s, ax
    inc l
    jmp for2
    
exit_for2:  
               ;displaying result
    mov ax, s  ; ax=s
    call print_num
    printn
    inc j
    jmp for1 
exit_for1:   
    jmp while
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
END MAIN



