.MODEL SMALL


.DATA
   MSG DB 'CONVERTED LETTER: $'
.CODE
MAIN PROC
   MOV AX, @DATA
   MOV DS , AX
    
   MOV AH , 1
   INT 21H
   
   ADD AL , 32
   MOV CL , AL
   
   
   MOV AH , 2
   MOV DL , 0DH
   INT 21H
   
   MOV AH , 2
   MOV DL , 0AH
   INT 21H
   
   LEA DX , MSG
   MOV AH, 9
   INT 21H
   
   
   MOV AH , 2
   MOV DL , CL
   INT 21H
   
   MOV AH , 4CH
   INT 21H    
    
    
MAIN ENDP
END MAIN