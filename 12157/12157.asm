INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
   T dw ?
   N dw ?
   sec dw ?
   amMile dw ?
   amJuice dw ?
   i dw ?
   j dw ?
   temp dw ? 
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX
    call scan_num   ;cin>>T
    mov T, cx
    printn
    mov i, 1
for:              ;for(int i=1; i<=T; i++)
    mov ax, i
    cmp ax, T
    jg Exit
    
    call scan_num  ;cin>>N
    mov N, cx      
    printn
    mov amMile, 0   ;amMile=0
    mov amJuice, 0  ;amJuice=0
    mov j, 1
for2:
    mov ax, j
    cmp ax, N
    jg exit_for2
    
    call scan_num   ;cin>>second
    mov sec, cx
    printn
    
    mov ax, sec     ;temp=second
    mov temp, ax
    
    xor dx, dx      ;amMile+=(sec/30)*10+10
    mov ax, sec
    mov cx, 30
    div cx
    mov cx, 10
    mul cx
    add ax, 10
    add ax, amMile
    mov amMile, ax
    
    xor dx, dx      ;amJuice+=(sec/60)*15+15
    mov ax, sec
    mov cx, 60
    div cx
    mov cx, 15
    mul cx
    add ax, 15
    add ax, amJuice
    mov amJuice, ax
    
    inc j
    jmp for2
exit_for2:         ;if(amountJuice==amountMile) 
    mov ax, amMile
    cmp ax, amJuice
    je first_print
    mov ax, amJuice
    cmp ax, amMile
    jg sec_print     ;else if(amountJuice>amountMile)
    
    print "Case "    ;cout<<"Case "<<i<<": Juice "<<amountJuice<<endl;
    mov ax, i
    call print_num
    print ": Juice "
    mov ax, amJuice 
    call print_num
    printn
    jmp after
                   ;cout<<"Case "<<i<<": Mile Juice "<<amountJuice<<endl
first_print:
    print "Case "
    mov ax, i
    call print_num
    print ": Mile Juice "
    mov ax, amJuice
    call print_num
    printn
    jmp after:
                  ;cout<<"Case "<<i<<": Mile "<<amountMile<<endl;
sec_print:
    print "Case "
    mov ax, i
    call print_num
    print ": Mile "
    mov ax, amMile
    call print_num
    printn
    jmp after
       
after:
    inc i    
    jmp for       
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main proc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    DEFINE_SCAN_NUM
END MAIN



