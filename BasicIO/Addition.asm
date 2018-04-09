.MODEL SMALL


.DATA
  
  MSG1 DB 'ENTER TWO NUMBERS : $'
  MSG2 DB 'THE SUM IS : $'
  
  X DB 5
  Y DB 4
  
.CODE
MAIN PROC
   
   MOV AX , @DATA
   MOV DS, AX
   
   LEA DX , MSG1
   MOV AH , 9 
   INT 21H
   
   MOV AH , 1
   INT 21H
   MOV BL , AL
   
   MOV AH , 1
   INT 21H
   
   SUB AL , 48
   SUB BL , 48
   
   ADD BL , AL
   ADD BL , 48
   
   LEA DX , MSG2
   MOV AH , 9 
   INT 21H
   
   ;MOV CH , X
   ;ADD CH , Y
   ;ADD CH , 48
   
   
   MOV AH , 2
   MOV DL , BL
   INT 21H
   
   MOV AH , 4CH
   INT 21H
    
    
MAIN ENDP

END MAIN



