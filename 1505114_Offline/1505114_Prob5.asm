.MODEL SMALL 

.DATA
    X DB 49

.CODE
MAIN PROC 
    ; Problem -5  
           
    ;Store a number, x in the register CL 
    ;(i.e., directly in the code). Show the 
    ;character in the console of which the ASCII value is x.       
           
    MOV AX , @DATA
    MOV DS, AX
    
    ;MOV AH , 1
    ;INT 21H
    
    ;MOV BH , AL
    
    
    ;MOV AH , 2
    ;MOV DL , BH
    ;INT 21H

    
    
    MOV AH , 2
    MOV DL , X
    INT 21H

    


    MOV AH ,4CH
    INT 21H

    
MAIN ENDP
END MAIN


