.MODEL SMALL 

.STACK 100H

.DATA
  
  PROMPT1 DB 'ENTER X: $'
  PROMPT2 DB 0DH,0AH,'ENTER Y: $'
  PROMPT3 DB 0DH,0AH,'ENTER C: $'
  PROMPT4 DB 0DH,0AH, 'The user has input $'
  PROMPT5 DB ' AND $'
  PROMPT6 DB 0DH,0AH,'The previous and next character of $'
  
  X DB ?
  Y DB ?
  C DW ?,'$'
  
.CODE
MAIN PROC 
   
    
    
  MOV AX , @DATA
  MOV DS , AX
  
  LEA DX , PROMPT1
  MOV AH , 9
  INT 21H
  
  MOV AH , 1
  INT 21H
  MOV X , AL
  
  
  LEA DX , PROMPT2
  MOV AH , 9
  INT 21H
  
  MOV AH , 1
  INT 21H
  MOV Y , AL
  
  LEA DX , PROMPT3
  MOV AH , 9
  INT 21H
  
  MOV AH , 1
  INT 21H
  MOV BL , AL
  MOV C , BX
 
 
  
  LEA DX , PROMPT4
  MOV AH , 9
  INT 21H
  
  
  MOV AH , 2
  MOV DL , X
  INT 21H
  
  MOV AH , 2
  MOV DL , ' '
  INT 21H
  
  MOV AH , 2
  MOV DL , Y
  INT 21H
  
  LEA DX , PROMPT5
  MOV AH , 9
  INT 21H
  
  MOV AH , 2
  MOV DL , BL
  INT 21H
  ;user has INPUT
  
  
  MOV CH , X
  SUB CH , 48
  ADD CH , Y
  SUB CH , 48
  
  MOV CL , X
  SUB CL , Y
  
  MOV BX , C
  MOV C , CX
  
  
  LEA DX , PROMPT6
  MOV AH , 9
  INT 21H
  
  MOV AH , 2
  MOV DL , BL
  INT 21H
   
  MOV AH , 2
  MOV DL , '-'
  INT 21H

  SUB BL , 1
  
  MOV AH , 2
  MOV DL , BL
  INT 21H
  
  
  MOV AH , 2
  MOV DL , ' '
  INT 21H
    
  ADD BL , 2
    
  MOV AH , 2
  MOV DL , BL
  INT 21H
  
  
  
  MOV AH , 4CH
  INT 21H
    
    
MAIN ENDP
END MAIN
