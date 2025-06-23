.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN: 

;TAKE ONE INPUT:
MOV AH,01H
INT 21H
MOV BL,AL 


;PRINT NEW LINE

MOV AH, 02H
MOV DL, 13
INT 21H         

MOV AH, 02H
MOV DL, 10
INT 21H        


;Initialize
MOV CL,'1'


;create lavel
while:

;compare
CMP CL,BL
JG EXIT:  
        
;print    
MOV AH,02H
MOV DL,CL
INT 21H 

INC CL 
jmp while:
    
    
    
EXIT:
MOV AH,4CH
INT 21H
END MAIN


