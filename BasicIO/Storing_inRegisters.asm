.MODEL SMALL


.DATA
   X DW 899
   Y DW 7633

.CODE
MAIN PROC
   ;Problem - 10
   
   ;Store two numbers in AX and BX. 
   ;Compute their sum and store in CX. 
    
   MOV AX , @DATA
   MOV DS , AX
    
   
   
   MOV BX , X
   MOV AX , Y
   
   ADD BX , AX
   MOV CX , BX
   
   
   ;MOV AH , 2
   ;MOV DL , AX
   ;INT 21H
    
    
MAIN ENDP
END MAIN