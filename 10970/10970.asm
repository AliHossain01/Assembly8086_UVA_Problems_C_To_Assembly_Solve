include 'emu8086.inc'
.model small
.stack 100h
.data           ; data section
    totalCut dw ?
    M dw ?
    N dw ?
.code           ; code section
main proc
    mov ax, @data
    mov ds, ax
    
    call SCAN_NUM
    mov M, cx
    printn
    call SCAN_NUM
    mov N, cx
    
    printn
    mov ax, M
    mul N
    
    mov cx, ax
    sub cx, 1 
    
    mov ax, cx
    call PRINT_NUM_UNS
    
    
    mov ah, 4ch
    int 21h
    main endp 

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
end main