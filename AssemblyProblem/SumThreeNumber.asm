.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN:
MOV AH,01    ;1st input:
INT 21H
MOV BL,AL

MOV AH,01    ;2nd input:
INT 21H
MOV BH,AL

MOV AH,01    ;3rd input:
INT 21H
MOV CL,AL 
          

MOV AH,02H  ;Print new line
MOV DL,10
INT 21H
MOV DL,13
INT 21H
          
ADD BL,BH    ;1st=1st+2nd
ADD CL,BH    ;3rd=3rd+1st
SUB CL,46    ;convert this resultin decimal by subtract 28

MOV AH,02H    ;Print result
MOV DL,CL
INT 21H

MOV AH,4CH    ;Exit main programme
INT 21H

END MAIN


 