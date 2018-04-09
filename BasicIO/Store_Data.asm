.MODEL SMALL

.DATA
   
   MSG DB 'S'
   

.CODE
MAIN PROC
   
   MOV AX , @DATA
   MOV DS , AX
   
   MOV AH , 2
   MOV DL , MSG
   INT 21H 
           
           
   MOV AH , 4CH
   INT 21H
    
MAIN ENDP

END MAIN