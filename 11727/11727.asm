include 'emu8086.inc'
.model small
.stack 100h
.data              ;data section
    t dw ?
    i dw ?
    first dw ?
    sec dw ?
    third dw ?
    Survives dw ? 
    large dw ?
    min dw ?
.code               ;code section
main proc           ;main procedure
    mov ax, @data   ;import data
    mov ds, ax
while:              ;while start
    call scan_num   ;input t
    mov t, cx 
    printn
    mov i, 1        ;i=1
    
for:                ;for start
    mov ax, i
    cmp ax, t
    jg exit_for
                   ;input firstEmployee
    call scan_num
    mov first, cx
    printn
    call scan_num  ;input secEmployee
    mov sec, cx
    printn
    call scan_num  ;input thirdEmployee
    mov third, cx
    printn
m1: mov ax, first   ;find large
    cmp ax, sec     ; check first and sec
    jg check1And3Max
    mov ax, sec
    cmp ax, third   ;check sec and third
    jg large_sec
    mov ax, third   
    mov large, ax   ;large=third
    jmp find_min
check1And3Max:      ;check first and third
    mov ax, first
    cmp ax, third
    jg large_first
    jmp find_min
large_first:
    mov ax, first
    mov large, ax   ;large=first
    jmp find_min
large_sec:
    mov ax, sec
    mov large, ax   ;large=sec         
find_min:           ;find min
    mov ax, first
    cmp ax, sec     ;check first and sec
    jl check1And3Min
    mov ax, sec
    cmp ax, third   ;check sec and third
    jl min_sec
    mov ax, third
    mov min, ax     ;min=third
    jmp survive
check1And3Min:
    mov ax, first
    cmp ax, third   ;check first and third
    jl first_min
    mov ax, third
    mov min, ax     ;min=third
    jmp survive
first_min:
    mov ax, first
    mov min, ax    ;min=first
    jmp survive
min_sec: 
    mov ax, sec
    mov min, ax    ;min=sec
survive:
    mov ax, first  ;ax=first
    add ax, sec    ;ax+=sec
    add ax, third  ;ax+=third
    sub ax, large  ;ax-=large
    sub ax, min    ;ax-=min
    mov survives, ax ;result
                    ;displaying result
    print "Case "
    mov ax, i
    call print_num_uns
    print ": " 
    mov ax, survives
    call print_num_uns
    printn 
    inc i 
    
    jmp for
 
 exit_for:       
    jmp while    
    
    mov ah, 4ch
    int 21h
    main endp
    define_scan_num
    define_print_num_uns
end main