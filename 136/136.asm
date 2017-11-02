INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section

.CODE             ; code section
MAIN PROC         ; main proc start
    printn "The 1500'th ugly number is 859963392"
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
END MAIN



