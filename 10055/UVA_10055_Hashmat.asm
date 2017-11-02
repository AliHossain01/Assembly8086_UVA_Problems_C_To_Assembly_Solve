include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
                    ; variable section

.CODE               ; main code section

MAIN PROC           ; main procedure  
                    ; this program takes two (Single digit) integer
                    ; and show the difference of these two digit.  
 start:
                    ; first input from user
    MOV AH, 1       
    INT 21H         
    MOV CL, AL      ; move data AL into CL
                
                    ; Display a single space   
    MOV DL, ' '     
    MOV AH, 2      
    INT 21H        
                
                    ; second input from user                
    MOV AH, 1      
    INT 21H        
    MOV BL, AL      ; move data AL into BL
                
                    ; displaying newline
    MOV DL, 10      ; 10 = newline
    MOV AH, 2      
    INT 21H     
    MOV DL, 13      ; 13 = cret
    INT 21H      
                
                    ; comparing CL and BL , CL-BL
    CMP CL, BL      
    JG first_grater_than_second ; if first > second then jump to 
                                ; first_grater_than_second 
                    ; else
    SUB BL, CL      ; BL=BL-CL
    ADD BL, 48      ; BL=BL-48 for transfer ascii to decimal number  
                
                    ; displaying result
    MOV DL, BL      ; set BL into DL for dispaying
    MOV AH, 2      
    INT 21H         
                 
                    ; displaying newline
    MOV DL, 10      ; 10 = newline
    MOV AH, 2      
    INT 21H     
    MOV DL, 13      ; 13 = cret
    INT 21H      
      
    JMP start  
                
                    ; if first > second then
first_grater_than_second:  ; label for jump instruction     
    SUB CL, BL      ; CL=CL-BL
    ADD CL, 48      ; CL=CL+48 for transfer ascii to decimal number 
    MOV DL, CL      ; move CL into DL for displaying
    MOV AH, 2       ; set 2 function for displaying
    INT 21H         ; interrupt 21H  
    
                    ; displaying newline     
    MOV DL, 10
    INT 21H
    
    MOV DL, 13
    INT 21H  
    
    JMP start
    
EXIT:               ; Exit from the programe
    MOV AH, 4CH     
    INT 21H         
    
    MAIN ENDP
END MAIN