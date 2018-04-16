.MODEL SMALL

.DATA

    MSG1 DB 'Enter 1st Number: $'
    MSG2 DB 'Enter 2nd Number: $'
    MSG3 DB 'Your sum is: $'
        

.CODE
MAIN PROC
    ;Problem - 6
    
    ;Input two single digit numbers(with a sum less than 10)
    ;from console. Show their sum in the console.

    
    
    MOV AX , @DATA
    MOV DS , AX
    
    LEA DX , MSG1
    MOV AH , 9
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV CH , AL
    ;END OF FIRST INPUT
    
    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    
    LEA DX , MSG2
    MOV AH , 9
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV CL , AL
   
    ;END OF SECOND INPUT
    
    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    ;NEWLINE 
    
    LEA DX , MSG3
    MOV AH , 9
    INT 21H
    
    ;Adding
    SUB CH , 48
    SUB CL , 48
    ADD CH , CL
    ADD CH , 48
    
    MOV AH , 2
    MOV DL , CH
    INT 21H
    
    
    
MAIN ENDP

END MAIN