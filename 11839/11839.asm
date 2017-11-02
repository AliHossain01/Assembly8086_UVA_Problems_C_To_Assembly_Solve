include 'emu8086.inc'
.model small
.stack 100h
.data
    N dw ?
    A dw 6 DUP(?)
    i dw ?
    k dw ?
    j dw ? 
    count dw ?
.code
main proc
     mov ax, @data  ; data import
     mov ds, ax
     
while:
     call scan_num   ;input N
     mov N, cx
     printn
     cmp cx, 0
     jle while
     
     mov i, 0  ;i=0
     
 for1:
     mov ax, i     
     cmp ax, N     ;compare i and N
     jge exit_for1
     mov count, 0  ;count=0
     mov j, 1
     for2:
        mov ax, j  ;ax=j
        cmp ax, 5  ;ax=5
        jg exit_for2
        call scan_num ; input a number
        printn
        mov bx, j
        mov A[bx], cx  ; insert into A[j]
        cmp cx, 127
        jg after 
         
        inc count     ;count++
        mov ax, j     ; ax=j
        mov k, ax     ;k=ax
    after:    
      inc j
     jmp for2
      
exit_for2:
    
    mov ax, count  ;ax=count
    cmp ax, 1      ;if(count==1)
    jne else
    
    mov ax, k
    cmp ax, 1   ;f(k==1)
    je printA
    cmp ax, 2   ;f(k==)
    je printB
    cmp ax, 3   ;f(k==3)
    je printC
    cmp ax, 4   ;f(k==4)
    je printD
    cmp ax, 5    ;f(k==4)
    je printE
    jmp after2
printA:
    printn "A"    ;display A
    jmp after2
printB:
    printn "B"    ;display B
    jmp after2
printC:
    printn "C"    ;display C
    jmp after2
printD:
    printn "D"    ;display D
    jmp after2
printE:
    printn "E"    ;display E
    jmp after2
     
    
 else:
      printn "*"  ;display *
            
after2:        
     inc i       ;i++
    jmp for1     
 exit_for1: 
  
jmp while      ;jump to while
     
  Exit:
    mov ah, 4ch
    int 21h   
    main endp   
                    ;define build in function
define_scan_num
define_print_num
define_print_num_uns
end main