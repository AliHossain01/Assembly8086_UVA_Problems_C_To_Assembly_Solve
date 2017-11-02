include 'emu8086.inc'
.model small
.stack 100h
.data        ; data section
    N dw 0
    j dw 0
    gt dw 0
    st dw 0
    i dw 0
    p dw 0
.code        ; code section
main proc
       mov ax, @data
       mov ds, ax
       
       mov j, 1
 while1:     ; while(cin>>N) 
       CALL SCAN_NUM
       mov N, cx
       printn
       cmp cx, 0
       je Exit
       
       mov gt, 0
       mov st, 0
       mov i, 0
                  ;for(int i=0; i<N; i++)
 For_start:
       CALL SCAN_NUM
       printn      ; print newline
       cmp cx, 0
       je gt_Inc
       inc st       ; st++
       jmp after
 gt_Inc:
        inc gt   ; gt++      
 after: 
        inc i    ; i++
        mov ax, i
        cmp ax, N
        jge exit_for
        jmp For_start
 exit_for:           
                   ; output
    print "Case "
    mov ax, j
    CALL PRINT_NUM_UNS
    inc j         ; j++
    
    print ": "
    
    mov ax, st
    sub ax, gt     ; ax=st-gt
    CALL PRINT_NUM_UNS
    
    jmp while1
               
 Exit:
    mov ah, 4ch
    int 21h   
    main endp
    
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM
end main