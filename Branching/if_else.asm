.MODEL COMPACT
.DATA
    MSG DW "hELLO WORLDDD!$" 
    X DB 7
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS , AX
    
    LEA DX, MSG , ;LOAD EFFECTIVE ADDRESS
    MOV AH , 09H
    INT 21H
    
    ;MOV AH , 00  ;CLEAR SCREEN
    ;MOV AL , 02
    ;INT 10H
    
    MOV AH , 09H
    MOV DX, OFFSET MSG
    INT 21H
          
    MOV BH , X
    NEG BH
    
    MOV AH , 2
    MOV DL , BH
    ADD DL , '0'
    INT 21H
          
    MOV AH , 4CH
    INT 21H
    
MAIN ENDP
END MAIN