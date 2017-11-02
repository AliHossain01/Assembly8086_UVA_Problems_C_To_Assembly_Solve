INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
    a dw ?
    b dw ?
    clickForward dw ?
    clickBackward dw ?
    max dw ?
    min dw ?
    
.CODE               ;code section
MAIN PROC           ;main proc start
    MOV AX, @DATA   ;import data
    MOV DS, AX
    
 while:
    
    call scan_num   ;cin>>a 
    mov a, cx
    printn
    call scan_num   ;cin>b
    mov b, cx
    printn
    
   mov ax, a        ;find max
   cmp ax, b
   jge max_ini
   mov ax, b
   mov max, ax      ;max=b
   jmp after
max_ini:
    mov ax, a       ;max=a
    mov max, ax    
after:    
    mov ax, a       ;find min
    add ax, b       ;ax=a+b
    sub ax, max     ;ax=(a+b)-max
    mov min, ax     ;min=ax
    
    mov ax, max     ;clickForward=max-min
    sub ax, min
    mov clickForward, ax
    
    mov ax, 100     ;clickBackward=100-clickForward;
    sub ax, clickForward
    mov clickBackward, ax
    
    mov ax, clickForward
    cmp ax, clickBackward
    jge if_print
    mov ax, clickForward  ;cout<<clickForward;
    call print_num
    printn
    jmp after2
if_print:
    mov ax, clickBackward
    call print_num           ;cout<<clickBackward;
    printn    
    
after2:    
    jmp while             ;jump to while
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



