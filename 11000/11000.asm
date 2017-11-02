include  'emu8086.inc'
.model small
.stack 100h
.data            ; data section
    total dw ?
    female dw ?
    male dw ?
    x dw ?
    N dw ?
    i dw ?
.code
main proc 
    mov ax, @data
    mov ds, ax
 while:            ;while(scanf("%lld", &N) == 1)
    CALL SCAN_NUM  ; input N
    mov N, cx
    cmp cx, 0
    jl after
    mov female, 1
    mov male, 0
    mov total, 1
    mov i, 0 
    printn
  for:             ; for start
    mov ax, i
    cmp ax, N
    jge print_res
    mov ax, male   
    mov x, ax      ; x = male
    mov ax, total
    mov male, ax   ; male = total
    add ax, x
    add ax, 1
    mov total, ax   ; total = male + x + 1
    inc i
    jmp for
  print_res:        ; displaying result
    mov ax, male
    CALL PRINT_NUM_UNS    ; display
    print " "
    mov ax, total
    CALL PRINT_NUM_UNS    ; display
  after:
    printn 
    jmp while
 Exit:   
    mov ah, 4ch
    int 21h
    main endp
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
end main
