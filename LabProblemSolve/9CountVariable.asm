.MODEL SMALL
.STACK 100H
.DATA
    inputString DB 'Assembly is fun and educational$', 0
    vowelCount  DB 0
    vowels      DB 'aeiouAEIOU$',   ; ??? ? ?? ????? vowel ????
    
    msg         DB 13,10,'Vowel Count: $'
    result      DB '0','$'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; SI = pointer to input string
    LEA SI, inputString
    MOV CL, 0                ; CL will hold vowel count

NEXT_CHAR:
    MOV AL, [SI]
    CMP AL, '$'              ; End of string?
    JE  DONE_COUNT

    ; Check if AL is vowel
    LEA DI, vowels

CHECK_VOWEL:
    MOV AH, [DI]
    CMP AH, '$'              ; End of vowel list?
    JE  NOT_VOWEL
    CMP AL, AH
    JE  IS_VOWEL
    INC DI
    JMP CHECK_VOWEL

IS_VOWEL:
    INC CL                  ; Count this as vowel

NOT_VOWEL:
    INC SI                  ; Move to next character
    JMP NEXT_CHAR

DONE_COUNT:
    ADD CL, '0'             ; Convert to ASCII
    MOV result, CL

    ; Print message
    LEA DX, msg
    MOV AH, 09H
    INT 21H

    ; Print result (number of vowels)
    LEA DX, result
    MOV AH, 09H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
END MAIN
