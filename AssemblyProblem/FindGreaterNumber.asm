.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN:
MOV AH,01H  ;1st Input
INT 21H
MOV BL,AL

MOV AH,01H  ;2nd Input
INT 21H
MOV BH,AL
    
MOV DL,10   ;10-->PRINT NEW LINE
MOV AH,02H
INT 21H
 
MOV DL,13   ;13-->CARRY RETURN-->OUTPUT SHIF TO LEFT SIDE
MOV AH,02H
INT 21H 
 
   
CMP BL,BH    ;compare

JG L1        ;if BL>BH--->Then jump label 1  -->Jump Greater

JMP L2       ;ELSE Then jump label 2

L1:
MOV AH,02H   ;label 1
MOV DL,BL
INT 21H
JMP exit

L2: 
MOV AH,02H   ;label 2
MOV DL,BH
INT 21H
 
exit:          ;exit label
MOV AH,4CH
INT 21H

END MAIN