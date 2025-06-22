.MODEL SMALL
.STACK 100H   
.DATA
a db 5
b db ?
.CODE
MAIN:
MOV AX,@DATA
MOV DS,AX
  
  MOV AH,01H ;INPUT VALUE OF B:
  INT 21H
  MOV b,AL
          
  MOV DL,a    ;PRINT VALUE OF A
  ADD DL,48
  MOV AH,02H  
  INT 21H
   
  
  MOV DL,b     ;PRINT B:
  MOV AH,02H
  INT 21H
        
        
     
  MOV AH,4CH
  INT 21H
  
  END MAIN
  

 