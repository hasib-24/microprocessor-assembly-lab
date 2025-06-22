.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN:
MOV AH,01H  ;TAKE 1ST INPUT
INT 21H
MOV BL,AL
           
mov AH,01H   ;TAKE 2ND INPT
INT 21H
MOV BH,AL 

ADD BL,BH    ;Operate sum like: a=a+b 

 SUB BL,48   ;convert ascii to decimal so subtract 48
           
MOV AH,02H
MOV DL,BL
INT 21H

MOV AH,4CH
INT 21H
END MAIN