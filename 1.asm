%include "io.inc"

section .text
global CMAIN
CMAIN:
    MOV EBP, ESP
    XOR ECX, ECX   
    LEA EBX, [a]
    MOV EDI, 5
    MOV ESI, 0
Next:
    CMP EDI, ESI
    je End
    MOV AL, [EBX+ESI]
    CMP AL, 0
    JG Count
    INC ESI
    JMP Next
Count:
    INC ECX
    INC ESi
    JMP Next
End:
    PRINT_DEC 4, ECX
    RET
    
section .data
a: db -6, 23, 4, -3, -1 