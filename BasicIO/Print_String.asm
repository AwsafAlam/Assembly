.MODEL SMALL


.DATA
  
  MSG DB 'THIS IS A MESSAGE$'
  
.CODE
MAIN PROC
   
   MOV AX , @DATA
   MOV DS, AX
   
   LEA DX , MSG
   MOV AH , 9 
   INT 21H 
    
MAIN ENDP

END MAIN



