%include "io.inc"

section .text
global CMAIN
CMAIN:
    LEA ESI, [a]           
    LEA EDX, [ESI]          
    LEA EDI, [5+ESI]        ;N = length(a)
MN:                         ;for(int i = 0;i<= N-1;i++)
    CMP EDI, ESI
    JE END                  
    MOV EBX, ESI            ;min = i
    MOV ECX, ESI
    INC ECX                 ;j = i+1
SUBMN:                      ;for(int j = i+1; j<= N;j++)
    MOV AH, [ECX]           
    MOV AL, [EBX]           
    CMP EDI, ECX
    JE COMPARISON           ;if j = N
    CMP AH, AL      
    JA INCJ                 ;if(a[j] > a[min])
    MOV EBX, ECX            ;min = j
INCJ:
    INC ECX
    JMP SUBMN        
COMPARISON:
    MOV AH, [ESI]
    CMP ESI, EBX            
    JE INCI                 ;if i = min
    MOV [ESI], AL           
    MOV [EBX], AH           ;swap(a[i], a[min])
INCI:
    INC ESI
    JMP MN    
END:
    PRINT_DEC 1, [EDX]
    NEWLINE
    INC EDX
    CMP EDI, EDX
    JA END
    RET 

    
section .data
a: db 31, 14, 56, 49, 9