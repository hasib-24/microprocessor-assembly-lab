.MODEL SMALL
.STACK 100H
.DATA
    dataBlock DB 12, 25, 7, 33, 18, 5, 44, 21, 3, 10   ; 10 numbers
    length    DB 0AH                                  ; Total = 10 elements
    Result    DB 0                                    ; To store maximum

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize SI to start of array
    LEA SI, dataBlock

    ; Load first number as initial max
    MOV AL, [SI]
    INC SI
    MOV CL, length
    DEC CL                ; Already used first item

FIND_MAX_LOOP:
    MOV BL, [SI]          ; Load next number
    CMP BL, AL
    JBE SKIP              ; If BL <= AL, skip
    MOV AL, BL            ; Else, update max

SKIP:
    INC SI
    LOOP FIND_MAX_LOOP

    ; Store result in memory
    MOV Result, AL

    ; Exit program
    MOV AH, 4CH
    INT 21H

END MAIN
