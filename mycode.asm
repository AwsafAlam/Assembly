.MODEL SMALL


.CODE 


MAIN PROC 
    
    ;Input and printing a character

    MOV AH, 1
    INT 21h
    
    MOV AH , 2
    MOV DL , AL   ; prints to a DL
    INT 21h
    
    MOV AH, 4CH
    INT 21h
    

MAIN ENDP

END MAIN
