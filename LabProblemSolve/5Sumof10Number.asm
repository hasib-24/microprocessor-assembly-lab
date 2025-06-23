.MODEL SMALL
.STACK 100H
.DATA
    numbers DB 10, 20, 5, 8, 12, 15, 7, 9, 4, 6    ; 10 numbers
    Total   DB 0                                   ; To store the sum

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Set pointers and counters
    LEA SI, numbers        ; SI points to first number
    MOV CX, 10             ; Loop counter = 10 numbers
    MOV AL, 0              ; AL will hold sum

SUM_LOOP:
    ADD AL, [SI]           ; AL = AL + numbers[i]
    INC SI                 ; Move to next number
    LOOP SUM_LOOP          ; Repeat until CX = 0

    MOV Total, AL          ; Store result in memory

    ; Exit program
    MOV AH, 4CH
    INT 21H

END MAIN
