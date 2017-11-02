include 'emu8086.inc'
.model small
.stack 100h
.data                    ; data section
    char db 100 dup(?)
    length dw ?
    word dw ?
    count dw ?
    i dw ?
    char1 db ?
.code
main proc    
   
    mov ax, @data
    mov ds, ax
    
 while: 
    mov bx, 0
   Input_string:     ; input string
        mov ah, 1
        int 21h
        mov char1, al
        cmp al, 13      ;if press enter then exit from input
        je exit_input_string
        mov al, char1
        mov char[bx], al ; insert into array   
        inc bx
   jmp Input_string
exit_input_string:
        printn
        mov length, bx ; length=bx
        mov count, 0   ;count=0
        mov word, 1    ;word=1
        mov i, 0       ;i=0
        mov bx, 0      ;bx=0
for:
     mov ax, i
     cmp ax, length    
     je exit_for       ;if i = length hen exit
                       ;if((ch[i]>='A' && ch[i]<='Z')
     mov al, char[bx]
     cmp al, 65
     jl check_az
     cmp al, 90
     jg check_az
     
 if:              ;if(word)
    mov cx, word  
    cmp cx, 1
    jne after
    inc count     ;count++
after:
    mov word, 0   ;word=0
    jmp for_last  ;jump to last

check_az:           ;if(ch[i]>='a' && ch[i]<='z')
    mov al, char[bx]
    cmp al, 97
    jl else
    cmp al, 122
    jg else
    jmp if      ; jump to if

else:          ;word=0
    mov word, 1    

for_last:
    inc bx    ;bx++     
    inc i     ;i++
  jmp for            
exit_for:
  mov ax, count  ;ax=count
  call print_num  ;output count
  printn
 jmp while        ;jump to while
 
exit:
       mov ah, 4ch
       int 21h    
    main endp 
define_print_num    ; define build in function
define_scan_num
define_print_num_uns
end main