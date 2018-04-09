.MODEL SMALL 

.DATA
    X DB 67

.CODE
MAIN PROC 
    
    MOV AX , @DATA
    MOV DS, AX
    
    MOV AH , 1
    INT 21H
    
    MOV BH , AL
    
    
    MOV AH , 2
    MOV DL , BH
    INT 21H

    MOV AH , 2
    MOV DL , 0DH
    INT 21H
    
    MOV DL , 0AH
    INT 21H
    
    MOV AH , 2
    MOV DL , X
    INT 21H

    


    MOV AH ,4CH
    INT 21H

    
MAIN ENDP
END MAIN


