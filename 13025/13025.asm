INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
.CODE             ; code section
MAIN PROC         ; main proc start 
                   ; diplaying result 
    printn "May 29, 2013 Wednesday"
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
END MAIN



