.MODEL SMALL

.STACK 100h

.DATA

    PROMPT1 DB 'Enter Input Array: $'
    
    W DW ?

    

.CODE

INPUT PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX , BX
    XOR CX , CX
    
@BEGIN: 
    
    
    MOV AH , 1
    INT 21H
    
    CMP AL , '-'
    JE @MINUS
    CMP AL , '+'
    JE @PLUS
    
    JMP @GET_NUMBER
    
@MINUS:
    MOV CX , 1
@PLUS:
    INT 21H ;READ ANOTHER CHAR
@GET_NUMBER:
    CMP AL , '0'
    JNGE @NOT_DIGIT ;ILLEGAL
    CMP AL , '9'
    JNLE @NOT_DIGIT
    
    XOR AH , AH
    SUB AX , 48
    PUSH AX
    
    MOV AX, 10
    MUL BX
    POP BX        
    ADD BX , AX
    
    JMP @BEGIN
    
    OR CX, CX ; NEGATIVE NUMBER
    JE @BEGIN
    NEG BX

@NOT_DIGIT:
    CMP AL , 'x'
    JE @EXIT
    
    
    
    CMP AL , ' '
    JNE @EXIT
        
    
@INSERT_IN_ARRAY:
    MOV [SI] , BX
    ADD SI , 2
    XOR BX , BX
    XOR CX , CX
    JMP @BEGIN

@EXIT:
    RET    
            
INPUT ENDP

MAIN PROC
    
    MOV AX , @DATA
    MOV DS , AX
    
    
    LEA DX , PROMPT1
    MOV AH , 9
    INT 21H
    
     
     XOR AX , AX
     LEA SI , W
     MOV BX , 5
     
     CALL INPUT
     LEA SI , W
     MOV AX , [SI]
      

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
  
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