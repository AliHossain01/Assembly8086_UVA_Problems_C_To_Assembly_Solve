include 'emu8086.inc'  ; include library function
.model small
.stack 100h
.data             ; data section
    char db 1000 dup(?)
    length dw ?
    i dw ?
    
.code             ; code section
main proc         ; main proc start
    mov ax, @data ; import data
    mov ds, ax
 
while:
    
    mov bx, 0 
string_input:    ; input string
    mov ah, 1
    int 21h
    cmp al, 13
    je exit_s_i
    char[bx], al
    inc bx
    jmp string_input 
exit_s_i:
    mov length, bx    ;length=bx
    mov i, 0          ;i=0
 for:
    mov ax, i        ;ax=i
    cmp ax, length   ;compare ax, length
    je exit_for      ;switch, case
    
    mov al, s[bx]   
    cmp al, 'W'
    je pQ
 
    mov al, s[bx]   
    cmp al, 'E'
    je pW

     mov al, s[bx]   
    cmp al, 'R'
    je pE
 
     mov al, s[bx]   
    cmp al, 'T'
    je pR
 
     mov al, s[bx]   
    cmp al, 'Y'
    je pT
   
     mov al, s[bx]   
    cmp al, 'U'
    je pY

     mov al, s[bx]   
    cmp al, 'I'
    je pU
 
     mov al, s[bx]   
    cmp al, 'O'
    je pI

     mov al, s[bx]   
    cmp al, 'P'
    je pO

           
     mov al, s[bx]   
    cmp al, 'S'
    je pA
   
     mov al, s[bx]   
    cmp al, 'D'
    je pS
  
     mov al, s[bx]   
    cmp al, 'F'
    je pD 
    
     mov al, s[bx]   
    cmp al, 'G'
    je pF
   
     mov al, s[bx]   
    cmp al, 'H'
    je pG
   
     mov al, s[bx]   
    cmp al, 'J'
    je pH

     mov al, s[bx]   
    cmp al, 'K'
    je pJ

    
     mov al, s[bx]   
    cmp al, 'L'
    je pK     
  
     mov al, s[bx]   
    cmp al, 'X'
    je pZ
 
     mov al, s[bx]   
    cmp al, 'C'
    je pX
 
     mov al, s[bx]   
    cmp al, 'V'
    je pC
  
     mov al, s[bx]   
    cmp al, 'B'
    je pV   
    
 
     mov al, s[bx]   
    cmp al, 'N'
    je pB

     mov al, s[bx]   
    cmp al, 'M'
    je pN
 
     mov al, s[bx]   
    cmp al, '2'
    je p1
  
     mov al, s[bx]   
    cmp al, '3'
    je p2

    
     mov al, s[bx]   
    cmp al, 4
    je p3

     mov al, s[bx]   
    cmp al, 5
    je p4

    
     mov al, s[bx]   
    cmp al, 6
    je p5
    
     mov al, s[bx]   
    cmp al, 7
    je p6

    
     mov al, s[bx]   
    cmp al, 8
    je p7
    
     mov al, s[bx]   
    cmp al, 9
    je p8
  
     mov al, s[bx]   
    cmp al, 0
    je p9
 
     mov al, s[bx]   
    cmp al, '-'
    je p0
      
     mov al, s[bx]   
    cmp al, '='
    je pHypen

    
     mov al, s[bx]   
    cmp al, '['
    je pP
    
 
    
     mov al, s[bx]   
    cmp al, ']'
    je pSthird
    
     mov al, s[bx]   
    cmp al, '\'
    je pFthird     
    
     mov al, s[bx]   
    cmp al, ';'
    je pL
    
     mov al, s[bx]   
    cmp al, 1
    je pBef1
    
     mov al, s[bx]   
    cmp al, ','
    je pM
    
     mov al, s[bx]   
    cmp al, '.'
    je pComma
    
     mov al, s[bx]   
    cmp al, '/'
    je pDot
    
     mov al, s[bx]   
    cmp al, ' '
    je pSpace
    
    print ";"
    jmp after 

 pS:
    print "S"
    jmp after
 pD:
    print "D"
    jmp after
pF:
    print "F"
    jmp after
 pG:
    print "G"
    jmp after
    
 pA:
    print "A"
    jmp after
 pO:
    print "O"
    jmp after
   pI:
    print "I"
    jmp after
   pU:
    print "U"
    jmp after
  pY:
    print "Y"
    jmp after
 pT:
    print "T"
    jmp after
 pR:
    print "R"
    jmp after
 pE:
    print "E"
    jmp after
    
 pK:
    print "K"
    jmp after
 
 pH:
    print "H"
    jmp after
    
 pZ:
    print "Z"
    jmp after
   
pJ:
    print "J"
    jmp after
    
 pV:
    print "V"
    jmp after

    
 pX:
    print "X"
    jmp after
  
pC:
    print "C"
    jmp after
  
pB:
    print "B"
    jmp after
    
pN:
    print "N"
    jmp after
   
p1:
    print "1"
    jmp after
  
p2:
    print "2"
    jmp after


p3:
    print "3"
    jmp after
    

p4:
    print "4"
    jmp after


p5:
    print "5"
    jmp after


p6:
    print "6"
    jmp after

p7:
    print "7"
    jmp after



p8:
    print "8"
    jmp after
    
p9:
    print "9"
    jmp after
   
p0:
    print "0"
    jmp after
  

pHypen:
    print "-"
    jmp after

pP:
    print "P"
    jmp after
pSthird:
    print "["
    jmp after
        
pFthird:
    print "]"
    jmp after
pW:
    print "W"
    jmp after
        
pL:
    print "L"
    jmp after
    
pBef1:
    print "`"
    jmp after
    
pM:
    print "M"
    jmp after

pComma:
    print ","
    jmp after

pdot:
    print "."
    jmp after    
pSpace:
    print " "
    jmp after
    
 pQ:
    print "Q"
    jmp after
      
 
 after: 
    printn       
    int i
 jmp for       
   
exit_for:    
    jmp while
    
exit:    
    mov ah, 4ch   ; exit
    int 21h
    main endp      ; main proc end
    define_print_num_uns
    define_print_num
    define_scan_num
end main



