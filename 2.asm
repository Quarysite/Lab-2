%include "io.inc"

section .text
global CMAIN
CMAIN:
    LEA ESI, [a]
    MOV AL, [ESI]
    AND AL, 0xFC
    SHR AL, 2
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    MOV DL, 0x03
    AND BL, DL
    SHL BL, 4
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xF0
    SHR AL, 4
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    AND BL, 0x0F
    SHL BL, 2
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xC0
    SHR AL, 6
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x3F
    
    PRINT_DEC 1, AL
    NEWLINE
    
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xFC
    SHR AL, 2
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    MOV DL, 0x03
    AND BL, DL
    SHL BL, 4
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xF0
    SHR AL, 4
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    AND BL, 0x0F
    SHL BL, 2
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xC0
    SHR AL, 6
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x3F
    
    PRINT_DEC 1, AL
    NEWLINE
    RET
section .data
a: db 0x84, 0xC3, 0x82, 0x54, 0x27, 0x8A

;Упаковка массива из 8 эл-тов по 6 бит:
;33     12     14     2      21     2      30     10
;100001 001100 001110 000010 010101 000010 011110 001010
;10000100 11000011 10000010  01010100 00100111 10001010
;0x84     0xC3     0x82      0x54     0x27     0x8A
