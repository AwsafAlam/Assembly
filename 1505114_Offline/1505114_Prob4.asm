.MODEL SMALL

.DATA
  
  PROMPT DB 'ENTER TWO SINGLE DIGIT NUMBERS: $'
  
.CODE
MAIN PROC 
    ;Problem - 4
    
    ;Input two single digit numbers from console and store
    ;those in two registers. Swap the numbers using 
    ;only arithmetic operators. 
    ;You can use other registers if needed
    
    
  MOV AX , @DATA
  MOV DS , AX
  
  LEA DX , PROMPT
  MOV AH , 9
  INT 21H
  
  MOV AH , 1
  INT 21H
  MOV CH , AL
  
  MOV AH , 2
  MOV DL , ' '
  INT 21H
  
  MOV AH , 1
  INT 21H
  MOV CL , AL ;INPUT DONE
  
  
  MOV AH , 2
  MOV DL , 0DH
  INT 21H
  
  MOV AH , 2
  MOV DL, 0AH
  INT 21H ;ADDED NEW LINE
  
  ADD CH , CL
  SUB CL , CH
  ADD CH , CL
  NEG CL
  

  ;MOV BH , CH
  ;MOV CH , CL
  ;MOV CL , BH
  
  MOV AH , 2
  MOV DL , CH
  INT 21H
  
  MOV AH , 2
  MOV DL , ' '
  INT 21H
  
  MOV AH , 2
  MOV DL , CL
  INT 21H
  
  
  
  MOV AH , 4CH
  INT 21H
    
    
MAIN ENDP
END MAIN
