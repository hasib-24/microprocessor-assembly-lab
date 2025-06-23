.MODEL SMALL
.STACK 100H
.DATA
    ; Nothing here, all data in segment 2000h as per problem
.CODE

ASSUME DS:DATA_SEG

START:
    ; Initialize DS with segment 2000h
    MOV AX, 2000h
    MOV DS, AX

    ; Load array size n from [2000:500]
    MOV SI, 500h         ; offset 500h
    MOV CL, [SI]         ; CL = n (size of array)

    CMP CL, 1
    JBE DONE_SORT        ; If n <= 1, already sorted

    ; Set data segment for array start
    ; Array starts at offset 501h
    MOV BX, 501h         ; BX = start offset of array elements

    ; Outer loop counter (number of passes)
    MOV CH, CL           ; CH = n
    DEC CH               ; passes = n-1

OUTER_LOOP:
    PUSH CX              ; Save outer loop counter
    MOV CX, CH           ; Inner loop counter = passes remaining

    ; SI points to start of array in DS segment
    MOV SI, BX           ; SI = offset to first element

INNER_LOOP:
    MOV AL, [SI]         ; AL = current element
    MOV DL, [SI+1]       ; DL = next element

    CMP AL, DL
    JBE NO_SWAP          ; If current <= next, no swap

    ; Swap AL and DL
    MOV [SI], DL
    MOV [SI+1], AL

NO_SWAP:
    INC SI               ; Move to next element
    LOOP INNER_LOOP

    POP CX               ; Restore outer loop counter
    DEC CH               ; Decrease passes
    JNZ OUTER_LOOP       ; Repeat passes

DONE_SORT:
    ; Terminate program (DOS interrupt)
    MOV AH, 4Ch
    INT 21h

END START
