.MODEL SMALL

.DATA

    MSG1 DB 'Enter 1st Number: $'
    MSG2 DB 'Enter 2nd Number: $'
    MSG3 DB 'You have entered: $'
    MSG4 DB 'After Swapping: $'
        

.CODE
MAIN PROC
    ;Problem - 3
    
    ;Input two single digit numbers from console and store those
    ;in CH and CL. Now show the two numbers consecutively, 
    ;separated by a space, in the console.Now,swap the numbers
    ;without using any intermediate registers. 
    ;Then again show the two numbers consecutively, 
    ;separated by a space, in the console.
    
    
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
    
    MOV AH , 2
    MOV DL , CH
    INT 21H
    
    MOV AH , 2
    MOV DL , ' '
    INT 21H
    
    MOV AH , 2
    MOV DL , CL
    INT 21H
    
    XCHG CH , CL
    
    ;AFTER SWAPPING 
    
    
    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    ;NEW LINE
    
    LEA DX , MSG4
    MOV AH , 9
    INT 21H
    
    MOV AH , 2
    MOV DL , CH
    INT 21H
    
    MOV AH , 2
    MOV DL , ' '
    INT 21H
    
    MOV AH , 2
    MOV DL , CL
    INT 21H
    
    
    
    
    
MAIN ENDP

END MAIN