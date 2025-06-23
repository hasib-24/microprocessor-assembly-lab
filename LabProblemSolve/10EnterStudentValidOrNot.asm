.MODEL SMALL
.STACK 100H
.DATA
    promptMsg    DB 'Enter username: $'
    validMsg     DB 13,10,'The username is valid$'
    invalidMsg   DB 13,10,'Invalid username$'
    inputBuffer  DB 20 DUP('$')           ; Buffer to hold user input
    validUser    DB 'student$'            ; Correct username

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; --- Print prompt message ---
    LEA DX, promptMsg
    MOV AH, 09H
    INT 21H

    ; --- Read input string from keyboard (character by character) ---
    LEA SI, inputBuffer

READ_LOOP:
    MOV AH, 01H       ; Read one character
    INT 21H
    CMP AL, 13        ; Check if Enter is pressed (Carriage Return)
    JE  DONE_INPUT
    MOV [SI], AL
    INC SI
    JMP READ_LOOP

DONE_INPUT:
    MOV [SI], '$'     ; End input string with '$'

    ; --- Compare with 'student' ---
    LEA SI, inputBuffer
    LEA DI, validUser

COMPARE_LOOP:
    MOV AL, [SI]
    CMP AL, [DI]
    JNE INVALID
    CMP AL, '$'
    JE VALID
    INC SI
    INC DI
    JMP COMPARE_LOOP

VALID:
    LEA DX, validMsg
    MOV AH, 09H
    INT 21H
    JMP EXIT

INVALID:
    LEA DX, invalidMsg
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN
