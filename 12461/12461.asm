INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
   num dw ? 
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
 
while:    
    call scan_num    ; input n
    printn           ; print newline
    mov num, cx       
    cmp cx, 0        ; cmp n and 0
    je Exit          ;if n=0 ten exit
    printn "1/2"     ; print 1/2
    
  jmp while          ; jmp while
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS   ;define
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



