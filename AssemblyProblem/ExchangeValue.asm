.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN:
MOV AH,01H    ;Take first input:
INT 21H
MOV BL,AL

MOV AH,01H    ;take 2nd input
INT 21H
MOV BH,AL


XCHG BL,BH   ;Exchange value 


MOV AH,02H   ;FOR NEW LINE
MOV DL,10
INT 21H
MOV DL,13
INT 21H


MOV AH,02H     ;Print exchanged value:
MOV DL,BL
INT 21H
MOV DL,BH
INT 21H

MOV AH,4CH     ;Exit main programme
INT 21H

END MAIN