include 'emu8086.inc'
.model small
.stack 100h
.data
    t dw ?
    ans dw ?
    char db 100 dup(?)
    num dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
   call scan_num
   mov t, cx         ; input test case
   printn
   mov ans, 0     ;ans=0
 
 while:
    mov ax, t
    cmp ax, 0    ;if t=0 then exit
    je exit
    mov bx, 0    ;bx=0
 input_string:   ;sting input
    mov ah, 1
    int 21h      ;input letter
    cmp al, 13
    je break_input ; if newline then stop taking input
    cmp al, ' '
    je break_input  ;if space then stop taking input   
    mov char[bx], al ;add in array
    inc bx           ;bx++
 jmp input_string 
  
 break_input: 
    mov bx, 0     ;bx=0
    cmp char[bx], 'd'  ;if char[0]=d
    je if             ;then jump to if
    mov ax, ans       ; else
    printn            ;newline
    call print_num    ;print ans
    printn            ;newline
    jmp after  
if:                   ;if
  print " "
  call scan_num      ;taking new num
  add cx, ans        ; add ans and num
  mov ans, cx        ;ans+=num
  printn             ;newline

after:     
    dec t            ;t--
 jmp while
    

exit:
    mov ah, 4ch
    int 21h    
    main endp        
                ;define build in function
define_scan_num
define_print_num
define_print_num_uns
end main