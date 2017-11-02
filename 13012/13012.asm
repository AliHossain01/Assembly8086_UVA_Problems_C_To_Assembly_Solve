INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
   c dw ?
   i dw ?
   n dw ? 
   t dw ?
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
while:
   call scan_num	; input t
   mov t, cx
   printn
   mov i, 1 		;i=1
   mov n, 0			;n=0
 for:
   mov ax, i
   cmp ax, 5
   jg exit_for       
   
   call scan_num
   mov c, cx
   printn 
   
   mov cx, c	;compare c and t
   cmp cx, t
   je nInc
   jmp for_jump
   
 nInc:
    inc n  
for_jump:
   inc i 
   jmp for
 exit_for: 
 mov ax, n
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



