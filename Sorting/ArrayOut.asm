.MODEL SMALL

.STACK 100h

.DATA

    PROMPT1 DB 'Enter Input Array: $'
    
    W DB 1,3,45,6

    

.CODE


MAIN PROC
    
    MOV AX , @DATA
    MOV DS , AX
    
    
    LEA DX , PROMPT1
    MOV AH , 9
    INT 21H
    
     
    XOR AX , AX
    LEA SI , W
    MOV BX , 4
     
    MOV CL , [SI]
   
   PRINT:
    DEC BX  
    MOV AH , 2
    MOV DL ,CL
    ADD DL , 48
    INT 21H
    
    MOV DL ,' '
    INT 21H
    
    ADD SI , 2
    MOV CL , [SI]
    CMP BX , 0
    JNE PRINT
    
  @BEGIN_OUT:  
    ;MOV AX , [SI]
     
    OR AX , AX
    JGE @ELSE_IF
    
    PUSH AX
    MOV DL , '-'
    MOV AH , 2
    INT 21H
    POP AX
    NEG AX
    
  @ELSE_IF:
    XOR CX , CX  ;SET CX = 0
    MOV BX , 10H
    
  @GET_DIGITS:
    XOR DX, DX ; CLEARING DX
    DIV BX 
    PUSH DX
    INC CX  ;INCREMENT CX
    
    
    OR AX , AX
    JNE @GET_DIGITS
    
    MOV AH , 2 
   
   @PRINT:
    POP DX
    ADD DL ,48 ; CONV TO CHAR
    INT 21H
    LOOP @PRINT
    
   ; ADD SI , 2
   ;JMP @BEGIN_OUT 
    
       
     
     ;STRING REVERSE PG - 184
    ; MOV DI , SI
    ; MOV CX , BX
    ; DEC BX
    ; SHL BX , 1
    ; ADD DI , BX
    ; SHR CX , 1
     
   ; XCHG_LOOP:
   ;  MOV AX , [SI]
   ;  XCHG AX , [DI]
   ;  MOV [SI],AX
    ; ADD SI , 2
    ; SUB DI , 2
    ; 
    ; LOOP XCHG_LOOP
     
    ; POP DI
    ; POP SI
    ; POP CX
    ; POP BX
    ; POP AX 
     
     
     ;ADD SI , 2
     ;POP SI
     
     ;SORT:
       ; CALL OUTPUT
       ; INNER:
    ;      ADD SI , 2
         ;  MOV BX , [SI]
         ;  CMP AX , BX
         ;  JG INNER
        
        ;JMP INNER
     
     ;LOOP SORT
    
   
MAIN ENDP




END MAIN