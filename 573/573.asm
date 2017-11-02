INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    ini dw ?
    dayCount dw ?
    H dw ?
    U dw ?
    D dw ?
    F dw ?
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
while:
    call scan_num  ;input H
    mov H, cx
    printn
    
    call scan_num  ;input U
    mov U, cx
    printn
    
    call scan_num ;input D
    mov D, cx
    printn
    
    call scan_num ;input F
    mov F, cx
    printn
                 
    mov ax, H    ; if H==0 then exit
    cmp ax, 0
    je Exit
                 ;F=U*F/100
    mov ax, U
    mov cx, F
    mul cx
    mov cx, 100
    div cx
    mov F, ax
    mov dayCount, 0  ;daycount=0
    mov ini, 0       ;ini=0
    
while2:               ;while(1)
    inc dayCount      ;daycount++
    mov ax, U
    jle if2            ;if(U>0)
    mov ax, ini
    add ax, U          ;initial+=U
    mov ini, ax
    
 if2:              ;if(initial>H)
    mov ax, U
    sub ax, F
    mov U, ax      ;U-=F
    
    mov ax, ini
    cmp ax, H
    jle after
                          ; result
    print "success on day "
    mov ax, dayCount
    jmp exit_while2
    
after:               ; ini-=D
    mov ax, ini
    sub ax, D
    mov ini, ax
    cmp ax, 0         ;if(ini<0)
    jge after2
                       ;result2
    print "failure on day "
    mov ax, dayCount
    jmp exit_while2     
    
after2:    
    jmp while2
exit_while2:    
    jmp while
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



