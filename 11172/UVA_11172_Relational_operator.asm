INCLUE 'emu8086.inc'

.MODEL SMALL
.STACK 100h
.DATA               ; data section
    
.CODE               ; code section
MAIN PROC           ; main procedure start
                    
    MOV AH, 1       ; input for test case from user
    INT 21H
    MOV CL, AL      ; CL = AL 
    SUB CL, 48		; CL-=48
    
    PRINTN          ; displaying newline
    
 start_loop:        
                    ; first input from user for each test case
    MOV AH, 1
    INT 21h
    MOV BL, AL
    PRINT " "       ; displying a single space
    
    MOV AH, 1       ; second input from user for each test case 
    INT 21H
    
    PRINTN          ; displaying newline
    
    CMP BL, AL      ; comparing bl and al
    JG greater      ; jump if greater than
    JE equal        ; jump if equal
                    ; else
    PRINT "<"      ; displaying '<' with neline
    JMP last_testCase_check
    
greater:
    PRINT ">"      ; displaying '>' with newline
    JMP last_testCase_check
equal:
    PRINTN "="       ; displaying '=' with newline
    JMP last_testCase_check

last_testCase_check:
    DEC cl
    JZ exit
    JMP start_loop       
 
 exit:
    MOV AH, 4CH
    INT 21H 
    
    MAIN ENDP
END MAIN