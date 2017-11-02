include 'emu8086.inc'
.model small
.stack 100h
.data           ; data section
    initial dw ?
    first dw ?
    second dw ?
    third dw ?
    g1 dw ?
    g2 dw ?
    g3 dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
while:              ; while start
    CALL SCAN_NUM   ; input initial
    mov initial, cx
    printn
    
    CALL SCAN_NUM   ; input first
    mov first, cx
    printn
    
    CALL SCAN_NUM   ; input second
    mov second, cx
    printn 
    
    CALL SCAN_NUM   ; input third
    mov third, cx
    printn
                     ;if start
    mov ax, initial
    cmp ax, 0
    je check_first
    jmp else 
    
 check_first:      
    mov ax, first
    cmp ax, 0
    je check_second
    jmp else
    
 check_second:
    mov ax, second
    cmp ax, 0
    je check_third
    jmp else
 
 check_third:
    mov ax, third
    cmp ax, 0
    je Exit:             
  
 else:
   if1:                ; if(initial > first)
        mov ax, initial
        cmp ax, first
        jle else1
        mov ax, initial
        sub ax, first
        mov cx, 9
        mul cx
        mov g1, ax
        jmp if2
   else1:
         xor dx, dx
         mov ax, initial
         sub ax, first
         add ax, 40
         mov cx, 9
         mul cx
         mov g1, ax
   if2:                  ; if(second>first)
        mov ax, second
        cmp ax, first
        jle else2
        
        mov ax, second
        sub ax, first
        mov cx, 9
        mul cx
        mov g2, ax
        jmp if3
   else2:
        mov ax, second
        sub ax, first
        add ax, 40
        mov cx, 9
        mul cx
        mov g2, ax
        
   if3:               ; if(third>second)
        mov ax, third
        cmp ax, second
        jle else3
        mov ax, second
        sub ax, third
        add ax, 40
        mov cx, 9  
        mul cx
        mov g3, ax
        jmp after
   else3:
        mov ax, second
        sub ax, third
        mov cx, 9
        mul cx
        mov g3, ax          
  after:              ;cout<<720+360+g1+g2+g3<<endl; 
        mov ax, 1080
        add ax, g1
        add ax, g2
        add ax, g3
        CALL PRINT_NUM_UNS
        printn
        jmp while          
              
    
 Exit:
    mov ah, 4ch
    int 21h
    
    main endp
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
end main