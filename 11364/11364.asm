include 'emu8086.inc'
.model small
.stack 100h
.data              ; data section
    testCase dw 0  ; testCase=0
    noOfStores dw 0; noOfStores=0
    max dw 0       ; max=0
    min dw 99      ; min=99
    x dw 0         ; x=0
.code              ; code section
main proc          ; main proc
    mov ax, @data  ; data import
    mov ds, ax
    
    mov ah, 1      ; cin>>testCase;
    int 21h
    sub al, 48
    xor ah, ah
    mov testCase, ax 
    printn
 while1:           ; while(testCase--)
    mov ah, 1
    int 21h 
    sub al, 48
    xor ah, ah
    mov noOfStores, ax 
    printn
    
   while2:         ; while(noOfStores--)
   
    call SCAN_NUM  ; cin>>x;
    mov x, cx 
    printn
    
    mov ax, max
    cmp ax, x
    jl max_lebel ; if(max<x)
    mov ax, min
    cmp ax, x
    jg min_lebel  ; if(min>x)
  max_lebel:
      MOV ax, x
      mov max, ax 
      jmp after
  min_lebel:
    mov ax, x     ; max=x;
    mov min, ax    
 after:   
    dec noOfStores
    cmp noOfStores, 0
    je Exit_while2
    jmp while2
  Exit_while2:
    mov ax, max
    sub ax, min
    mov dl, 2
    mul dl
                    ; cout<<(max-min)*2<<endl;
    call PRINT_NUM_UNS
    
    dec testCase
    cmp testCase, 0
    je Exit
    printn
    jmp while1   
Exit:
    mov ah, 4ch
    int 21h    
    
    main endp
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

end main