.MODEL SMALL
.STACK 100H
.DATA
    inputString DB 'exercise$', 0   ; String to search (ending with $)
    Answer      DB 0                ; To store count of 'e'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, inputString     ; SI points to start of string
    MOV CL, 0               ; CL will hold count of 'e'

COUNT_LOOP:
    MOV AL, [SI]            ; Load current character
    CMP AL, '$'             ; End of string?
    JE  DONE

    CMP AL, 'e'             ; Is it 'e'?
    JNE SKIP
    INC CL                  ; If yes, increment count

SKIP:
    INC SI                  ; Move to next character
    JMP COUNT_LOOP

DONE:
    MOV Answer, CL          ; Store result in memory

    ; Exit program
    MOV AH, 4CH
    INT 21H

END MAIN
