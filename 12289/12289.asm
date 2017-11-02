include 'emu8086.inc'  ; include library function
.model small
.stack 100h
.data             ; data section
   T dw ?
   str_s db 1000 dup (?)
   count dw 0 
   length dw 0 
.code             ; code section
main proc         ; main proc start
    mov ax, @data ; import data
    mov ds, ax
    call scan_num
    mov T, cx
    printn
while:
   mov ax, T     ;input t 
   cmp ax, 0
   je exit
    
   mov length, 0 ;length=0
   mov bx, 0 
input_string:
   mov ah, 1     ;input string
   int 21h
   cmp al, 13
   je exit_input
   mov str_s[bx], al ; insert data into array   
   inc length         ;length++
   inc bx             ;bx++
jmp input_string     
   exit_input:
   printn
   mov ax, length
   cmp ax, 5        ;if(s.length() == 5)
   jne else
    printn "3"       ;cout<<3<<endl;
   jmp after
else:
    mov bx, 0
    mov al, str_s[bx]
    cmp al, 't'         ;if(s[0]== 't')
    jne if2
    inc count
 if2:
    mov bx, 1
    mov al, str_s[bx]
    cmp al, 'w'          ;if(s[1]== 'w')
    jne if3
    inc count
    
  if3:
    mov bx, 2
    mov al, str_s[bx]
    cmp al, 'o'        ;if(s[2]=='o')
    jne if4
    inc count
 if4:   
  mov ax, count
  cmp ax, 2       ; if(count>=2)
  jl else4
  printn "2"       ;print 2
     jmp after
else4:
    printn "1"     ;cout<<1<<endl     
   
after:
 jmp while
    
exit:    
    mov ah, 4ch   ; exit
    int 21h
    main endp      ; main proc end
    define_print_num_uns
    define_print_num
    define_scan_num
end main



