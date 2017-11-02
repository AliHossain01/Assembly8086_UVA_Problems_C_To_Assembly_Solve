include 'emu8086.inc'
.model small
.stack 100h
.data                   ; data section
    Term1 dw ?
    Term2 dw ?
    Final dw ?
    Attendance dw ?
    Class_Test1 dw ?
    Class_Test2 dw ?
    Class_Test3 dw ?
    T dw ?
    m1 dw ?
    AvgClassTest dw ?
    totalMarks dw ?
    i dw ?  
    
.code                 ; code section
main proc
    mov ax, @data     ; import data
    mov ds, ax
while_start:          ; while(scanf("%d", &T)==1)
    call SCAN_NUM
    mov t, cx 
    printn
    
    mov i, 1
 for:                 ; for(i=1; i<=T; i++)
   mov m1, 0
   mov AvgClassTest, 0
   mov totalMarks, 0 
   ; scanf("%d%d%d%d%d%d%d", &Term1, &Term2, &Final, &Attendance, &Class_Test1, &Class_Test2, &Class_Test3);         
   xor cx, cx          
   CALL SCAN_NUM        
   mov Term1, cx 
   printn
    
   xor cx, cx
   CALL SCAN_NUM
   mov Term2, cx
   printn
     
   xor cx, cx
   CALL SCAN_NUM
   mov Final, cx 
   printn
    
   xor cx, cx
   CALL SCAN_NUM
   mov Attendance, cx 
   printn
    
   xor cx, cx
   CALL SCAN_NUM
   mov Class_Test1, cx
   printn
    
   xor cx, cx
   CALL SCAN_NUM
   mov Class_Test2, cx
   printn
    
   xor cx, cx
   CALL SCAN_NUM
   mov Class_Test3, cx
   printn              
                       ; find minimum ClassTest Mark 
   mov ax, Class_Test1
   cmp ax, Class_Test2
   jg greater_than2
   cmp ax, Class_Test3
   jg minimum_C3 
   mov ax, Class_Test1
   mov m1, ax
   jmp check_end
 
greater_than2:
    mov ax, Class_Test2
    cmp ax, Class_Test3
    jle minimum_c2
    mov ax, Class_Test3
    mov m1, ax
    jmp check_end
minimum_C3:
    mov ax, Class_Test3
    mov m1, ax
    jmp check_end    

minimum_c2:
    mov ax, Class_Test2
    mov m1, ax
check_end:               ; AvgClassTest = ((Class_Test1+Class_Test2+Class_Test3) - m2)/2;
    mov ax, Class_Test1
    add ax, Class_Test2
    add ax, Class_Test3
    sub ax, m1
    mov dl, 2
    div dl
    xor ah, ah
    mov AvgClassTest, ax
                         ;
    mov ax, Term1
    add ax, Term2
    add ax, Attendance
    add ax, Final
    add ax, AvgClassTest
    mov totalMarks, ax
              ;totalMarks = Term1+Term2+Attendance+Final+AvgClassTest;
    mov ax, totalMarks
               ; check grade 
    cmp ax, 60
    jl lessThan60
    cmp ax, 70
    jl lessThan70
    cmp ax, 80
    jl lessThan80
    cmp ax, 90
    jl lessThan90
    cmp ax, 100
    jle lessOrEqual100
    jmp check
    
 lessOrEqual100:
    print "Case "
    mov ax, i
    CALL PRINT_NUM_UNS
    printn ": A" 
    jmp check
    
lessThan90:
    print "Case "
    mov ax, i
    CALL PRINT_NUM_UNS
    printn ": B" 
    jmp check
    
lessThan80:
    print "Case "
    mov ax, i
    CALL PRINT_NUM_UNS
    printn ": C"    
    jmp check
    
lessThan70:
    print "Case "
    mov ax, i
    CALL PRINT_NUM_UNS
    printn ": D"
    jmp check
    
lessThan60:
    print "Case "
    mov ax, i
    CALL PRINT_NUM_UNS
    printn ": F"
check:   
    inc i
    mov ax, i
    cmp ax, T
    jg exit_for
    jmp for
    
 exit_for:   
jmp while_start    
    
Exit:
    mov ah, 4ch
    int 21h    
    
    main endp
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
end main