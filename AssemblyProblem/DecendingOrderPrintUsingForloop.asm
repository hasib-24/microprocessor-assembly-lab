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
MOV CL,BL


;create lavel
for: 

;compare
CMP CL,'0'
JE EXIT:  
        
;print    
MOV AH,02H
MOV DL,CL
INT 21H 

DEC CL 
jmp for:
    
    
    
EXIT:
MOV AH,4CH
INT 21H
END MAIN


