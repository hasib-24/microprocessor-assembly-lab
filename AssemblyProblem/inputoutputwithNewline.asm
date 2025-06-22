.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN:   
    ;Take input:
    MOV AH,01H
    INT 21H
    MOV BL,AL
     
    MOV DL,10
    MOV AH,02H   ;FOR NEW LINE';
    INT 21H 
    
    MOV DL,13
    MOV AH,02H    ;FOR RETURN CARAGE
    INT 21H       
        
    ;show output         
    MOV DL,BL
    MOV AH,02H
    INT 21H 
             
    ;exit from main function       
    MOV AH,4CH
    INT 21H

END MAIN
