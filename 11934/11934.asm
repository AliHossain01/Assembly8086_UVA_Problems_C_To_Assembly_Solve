include 'emu8086.inc'
.model small
.stack 100h
.data            ;data section
    a dw ?
    b dw ?
    c dw ?
    d dw ?
    L dw ? 
    i dw ? 
    re1 dw ? 
    count dw ?
.code                 ;code section
main proc
     mov ax, @data
     mov ds, ax
     
while:
     call scan_num
     mov a, cx       ;input a
     printn
     
     call scan_num
     mov b, cx        ;input b
     printn
     
     call scan_num
     mov c, cx        ;input b\c
     printn
     
     call scan_num
     mov d, cx           ;input d
     printn
     
     call scan_num
     mov L, cx             ;input L
     printn
     
     mov ax, a
     cmp ax, 0          ; compare a and 0
     je check2
     jmp else
  
 check2:
      mov ax, b
     cmp ax, 0
     je check3         ; compare b and 0
     jmp else
     
  check3:
      mov ax, c
     cmp ax, 0        ; compare c and 0
     je check4
     jmp else     

check4:
      mov ax, d
     cmp ax, 0         ; compare d and 0
     je Exit
else:   
     mov count, 0    ;count=0
     mov i, 0         ;i=0
  for:
     mov ax, i
     cmp ax, L        ;compare i and L
     jg exit_for
     xor dx, dx      ;dx=0
     mov ax, a
     mov cx, i       
     mul cx          ;ax=a*i
     mul cx          ;ax=a*i*i
     mov re1, ax     ; re1=ax
     
     xor dx, dx      ;dx=0
     mov ax, b
     mov cx, i
     mul cx          ;ax=b*i
     add ax, re1     ;ax=ax+re1
     add ax, c       ;ax+=c
     xor dx, dx      ;dx=0
     mov cx, d       ;cx=d
     div cx          ;ax/cx
     cmp dx, 0       ;compare reminder and 0
     jne after
     inc count
  after:   
     inc i        ;i++
     jmp for      ;jump to for
exit_for:
     
     mov ax, count  ;print value of count
     call print_num
     printn
jmp while           ;jump to while
     
  Exit:
        mov ah, 4ch
        int 21h  
    main endp
                ; define build in function
define_print_num
define_print_num_uns
define_scan_num
end main