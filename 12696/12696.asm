include 'emu8086.inc'
.model small
.stack 100h
.data             ; data section
  length dw ?
  width dw ?
  depth dw ?
  weight dw ?
  count dw ?
  i dw ?
  t dw ? 
  flag1 dw ?
  flag2 dw ?
.code             ; code section
main proc
    mov ax, @data   ; import data
    mov ds, ax
    
while:          ;while(scanf("%d", &t)==1)
     CALL SCAN_NUM   ; input t
     mov t, cx
     printn
     mov count, 0
     mov i, 0
 for:
    CALL SCAN_NUM   ; input lendth
    MOV length, CX
    printn
    
    CALL SCAN_NUM   ; input width
    MOV width, CX
    printn
    
    CALL SCAN_NUM   ; input depth
    MOV depth, CX
    printn
    
    CALL SCAN_NUM   ; input weight
    MOV weight, CX
    printn
    
    mov flag1, 0    ; flag1=0
    mov flag2, 0    ; flag2=0
    
    mov ax, length  ; check length
    cmp ax, 56
    jle width_check
    jmp after
width_check:        ; check width
    mov ax, width
    cmp ax, 45
    jle check_depth
    jmp after 
check_depth:        ; check depth
    mov ax, depth
    cmp ax, 25
    jle flag1_change
    jmp after
flag1_change:       ; flag1 change
    mov flag1, 1        
after:              ; second check for flag2
     mov ax, length ; ax=length 
     add ax, width  ; ax+=width
     add ax, depth  ; ax+=depth
     
     cmp ax, 125    ; length+width+depth)<=125
     jle check_weight
     jmp after2
     
check_weight:        ; weigth check
     mov ax, weight
     cmp ax, 7
     jle flag2_change
     jmp after2
flag2_change:        ; flag2 change
     mov flag2, 1
after2:
      mov ax, flag1  ; ax=flag1
      or ax, flag2   ; flag1 || flag2
      cmp ax, 0
      je else
      printn "1"     ; printf("1\n")
      inc count      ; count++
      jmp after3
else:                ; printf("0\n")
    printn "0"         
after3:
    inc i            ; i++
    mov ax, i
    cmp ax, t        ; check i and t
    jge print_count
    jmp for
 print_count:        ; printf("%d\n", count)
    mov ax, count
    CALL PRINT_NUM_UNS
    printn
       
     jmp while       ; jumpt to while
Exit:    
    mov ah, 4ch
    int 21h
    main endp
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
end main