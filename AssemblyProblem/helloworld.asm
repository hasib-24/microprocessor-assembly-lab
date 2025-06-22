.MODEL SMALL
.STACK 100H
.DATA
msg DB "Hello word$"
.code
MAIN:
        ;initalize data block and store in DS resister
 MOV AX,@DATA
 MOV DS,AX
          
          
          
        ;load DATA BLOCK
 LEA DX,msg
 MOV AH,09H
 INT 21H  
 
 
       ;EXIT FROM MAIN FUNCTI0N
 MOV AH,4CH
 INT 21H  
 
 
 END MAIN