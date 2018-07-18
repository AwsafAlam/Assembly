                                  .MODEL SMALL
.STACK 100H

.DATA

  MSG1 DB 'Hello World$'
  
.CODE
main PROC

   MOV AX , @DATA
   MOV DS, AX

   LEA DX , MSG1
   MOV AH , 9
   INT 21H

   
   MOV AH , 4CH
   INT 21H


main ENDP 
END MAIN
