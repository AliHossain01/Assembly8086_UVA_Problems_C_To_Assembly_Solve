INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    a dw ?        
    b dw ?
    c dw ?
    i dw ?
    t dw ?
    flag1 db ?
    flag2 db ?
    flag3 db ?
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
while:
    call scan_num   ;scanf("%ld", t);
    mov t, cx
    mov i, 1
    printn
while2:            ;while start
    mov ax, i
    cmp ax, t
    jg exit_while2
    call scan_num  ;input a
    mov a, cx
    printn
    call scan_num
    mov b, cx       ;input b
    printn
    call scan_num   ;input c
    mov c, cx
    printn
    
    mov flag1, 0   ;flag1=0
    mov flag2, 0   ;flag1=0
    mov flag3, 0   ;flag1=0
    
    mov ax, a
    add ax, b
    cmp ax, c
    jle chg_fl1
    jmp after
chg_fl1:
    mov flag1, 1  ;flag1=1
after:
    mov ax, b
    add ax, c
    cmp ax, a
    jle chg_fl2
    jmp after2
chg_fl2:
    mov flag2, 1   ;flag1=1
after2:
    mov ax, c
    add ax, a
    cmp ax, b
    jle chg_fl3
    jmp if_print    
chg_fl3:
    mov flag3, 1
    xor ax, ax
    mov al, flag1    ;al=flag1
    or al, flag2     ;flag1 || flag2
    or al, flag3     ;flag1 || flag2 || flag33
    cmp al, 1
    je if_print
    jmp else1
                    ;if print
if_print:
    print "Case "
    mov ax, i
    call print_num
    print ": Invalid"
    printn
    jmp last
else1:             ;else if1 tart
    mov flag1, 0   ;flag1=0
    mov flag2, 0   ;flag2=0
    mov flag3, 0   ;flag3=0
    mov ax, a
    cmp ax, 0
    jle flag1_change
    jmp sec_check
flag1_change:
    mov flag1, 1   ;flag1=1
                   
sec_check:
    mov ax, b
    cmp ax, 0
    jle flag2_change
    jmp third_check
flag2_change:      
    mov flag2, 1  ;flag2=1                   
third_check:
    mov ax, c
    cmp ax, 0
    jle flag3_change
    jmp else2
flag3_change:
    mov flag3, 1  ;falg3=1
xor ax, ax
mov al, flag1
or al, flag2
or al, flag3
cmp al, 1
je print_else1
jmp else2
                   ;else1 print
print_else1:
    print "Case "
    mov ax, i
    call print_num
    print ": Invalid"
    printn
    jmp last

else2:             ;else2 check
    xor ax, ax
    mov al, flag1
    mov al, flag2
    mov al, flag3
    
    mov ax, a
    cmp ax, b
    je fl1_change
    jmp second_check
fl1_change:
    mov flag1, 1   ;flag1=0
    
second_check:
    mov ax, b
    cmp ax, c
    je fl2_change
    jmp after4        
fl2_change:
     mov flag2, 1  ;flag2=0
     
after4:
    xor ax, ax
    mov al, flag1
    and al, flag2
    cmp al, 1
    je else2_print
    jmp else3
else2_print:       ;else if2 print
    print "Case "
    mov ax, i
    call print_num
    print ": Equilateral"
    printn
    jmp last
                  ;else if3           
else3:
     mov ax, c
     cmp ax, a
     je fl3_change
     jmp after5
fl3_change:
    mov flag3, 1   ;flag3=1
after5:
    xor ax, ax     ;ax=0
    mov al, flag1
    or al, flag2
    or al, flag3
    cmp al, 1
    je else3_print
    jmp else4 
else3_print:        ;else if3 print
    print "Case "
    mov ax, i
    call print_num
    print ": Isosceles"
    printn
    jmp last

else4:           ;else print
     print "Case "         
    mov ax, i
    call print_num
    print ": Scalene"
    printn

last:         
    inc i                
    jmp while2   ;jump to while2
    
exit_while2:    
    jmp while    ;jump to while
        
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



