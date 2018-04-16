.MODEL SMALL

.DATA

    MSG1 DB 'Enter 1st Number: $'
    MSG2 DB 'Enter 2nd Number: $'
    MSG3 DB 'Enter 3rd Number: $'
    MSG4 DB 'Enter 4th Number: $'
    
    MSG5 DB 'Your sum is: $'
        

.CODE
MAIN PROC
    ;Problem - 8
    
    ;Input four single digit numbers(with a sum less than 10)
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
    
    LEA DX , MSG3
    MOV AH , 9
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV BL , AL
    ;END OF THIRD INPUT
    
    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    LEA DX , MSG4
    MOV AH , 9
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV BH , AL
    ;END OF FOURTH INPUT
    
    
    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    ;NEWLINE 
    
    LEA DX , MSG5
    MOV AH , 9
    INT 21H
    
    ;Adding
    SUB CH , 48
    SUB CL , 48
    SUB BL , 48
    SUB BH , 48
    
    ADD CH , CL
    ADD CH , BL
    ADD CH , BH
    
    ADD CH , 48
    
    
    MOV AH , 2
    MOV DL , CH
    INT 21H
    
    
        
    
MAIN ENDP

END MAIN