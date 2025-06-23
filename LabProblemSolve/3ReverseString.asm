.MODEL SMALL
.STACK 100H
.DATA
    inputString DB 'HELLO$', 0          ; Input string (must end with $)
    revMsg      DB 13,10, 'Reversed string: $'
    reversedStr DB 20 DUP('$')          ; Holds reversed string

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Find length of input string (excluding $)
    LEA SI, inputString
    MOV CX, 0

FIND_LENGTH:
    MOV AL, [SI]
    CMP AL, '$'
    JE  STORE_LENGTH
    INC CX
    INC SI
    JMP FIND_LENGTH

STORE_LENGTH:
    ; CX now has the length of string
    ; SI points at '$' (end), so we go back to last character
    DEC SI

    LEA DI, reversedStr

REVERSE_LOOP:
    MOV AL, [SI]        ; Load char from end
    MOV [DI], AL        ; Store to reversed string
    INC DI
    DEC SI
    LOOP REVERSE_LOOP

    ; Append '$' at the end of reversed string
    MOV AL, '$'
    MOV [DI], AL

    ; Print message
    LEA DX, revMsg
    MOV AH, 09H
    INT 21H

    ; Print reversed string
    LEA DX, reversedStr
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

END MAIN
