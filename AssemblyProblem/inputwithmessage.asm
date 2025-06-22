.MODEL SMALL
.STACK 100H

.DATA
    msg   DB "ENTER ANY NUMBER:$"      ; Input prompt message
    omsg  DB 13, 10, "Output is: $"    ; Output message (with newline)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Show input prompt
    LEA DX, msg
    MOV AH, 09H
    INT 21H  

    ; Take single character input from user
    MOV AH, 01H       ; Function 01H - Read character
    INT 21H
    MOV BL, AL        ; Store input character in BL

    ; Show output message
    LEA DX, omsg
    MOV AH, 09H
    INT 21H

    ; Print the character stored in BL
    MOV DL, BL        ; Move character to DL for output
    MOV AH, 02H       ; Function 02H - Print character in DL
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
