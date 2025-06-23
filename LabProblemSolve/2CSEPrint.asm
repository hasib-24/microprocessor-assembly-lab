.MODEL SMALL
.STACK 100H
.DATA
    myMessage DB 'Computer Science and Engineering$', 0

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Load address of string into DX
    LEA DX, myMessage

    ; INT 21H service 09H – display string
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

END MAIN
