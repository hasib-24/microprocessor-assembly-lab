.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN:
  MOV AH,01H ;Take input:
  INT 21H
  MOV BL,AL
  
  ADD BL,32  ;convert upper to lower:
  
  MOV DL,BL
  MOV AH,02H   ;Print value
  INT 21H
  
  MOV AH,4CH   ;Exit main
  INT 21H
  
  END MAIN