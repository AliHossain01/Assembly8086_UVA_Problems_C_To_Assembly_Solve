INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    sum DW ?      ; sum=0
    t DB ?        ; t=0 
    t2 DB ?       ; t2=0
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    
                   ;scanf("%d", &t)
    MOV AH, 1      ; AH=1
    INT 21H
    MOV t, AL      ; t=AL
    SUB t, 48      ; t=t-48
    MOV t2, 1      ; t2=1
TEST_CASE:
     PRINTN        ; print newline
     MOV AL, t     ; AL=t
     CMP t2, AL    ; compare t2 and t
     JG EXIT  ; jump if greater   
                   ; scanf("%d%d", &a, &b)
    MOV AH, 1      ; AH=1 
    INT 21H
    MOV BL, AL     ; BL=AL
    SUB BL, 48     ; BL-=48
    CBW            ; convert byte to word
    PRINT " "      ; print single space
    MOV AH, 1      ; AH=1
    INT 21H
    SUB AL, 48     ; AL-=48
    CBW            ; convert byte to word
    MOV CX, AX     ;CX=AX
    MOV sum,0      ; sum = 0
                   ;for(j=a; j<=b; j++) 
FOR_START:
    CMP BX,CX      ; compare BX and CX
    JG EXIT_FOR    ; jump if greater
    MOV AX,BX      ; AX=BX
    MOV DL,2       ; DL=2
    DIV DL         ; AX/DL
    CMP AH,0       ; AH=(AX%DL), compare AH and 0
    JE IncreamentAndBackToforLoop: ; jump equal
    ADD SUM, BX    ; sum+=BX
IncreamentAndBackToforLoop:
 INC BX             ; BX++
 JMP FOR_START      ; jump to FOR_START
     
EXIT_FOR:        
    PRINTN          ; print newline
     PRINT "CASE "  ; displaying "CASE "
      MOV AH, 2     ; AH=2
     MOV DL, t2     ; DL=t2
     ADD DL, 48     ; DL+=48
     INT 21H
     PRINT " :"     ; displaying " :"
      MOV AH, 2     ; AH=2
     MOV DX, sum    ; DX=sum
     ADD DL, 48     ; DL+=48
     INT 21H
     INC t2         ; t2++
     JMP TEST_CASE  ; jump to TEST_CASE
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main prc end
END MAIN



