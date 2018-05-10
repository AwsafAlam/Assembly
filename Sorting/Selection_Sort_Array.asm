.MODEL SMALLL


.STACK 100H

.DATA
    A DB 5,3,2,1
    PROMPT1 DB 'Enter Input Array: $'
    W DW ?

.CODE
SELECT PROC 

PUSH BX
PUSH CX
PUSH DX
PUSH SI
DEC BX
JE END_SORT
MOV DX , SI

SORT_LOOP:
    MOV SI, DX
    MOV CX , BX
    MOV DI , SI
    MOV AL, [DI]

FIND_BIG:
    INC SI
    CMP [SI],AL
    JNG NEXT
    MOV DI , SI
    MOV AL , [DI]
    
NEXT:
    LOOP FIND_BIG
    
    CALL SWAP
    DEC BX
    JNE SORT_LOOP
END_SORT:

    POP SI
    POP DX
    POP CX
    POP BX
    RET
SELECT ENDP

SWAP PROC
    PUSH AX
    MOV AL , [SI]
    XCHG AL, [DI]
    MOV [SI],AL
    POP AX
    RET
  
SWAP ENDP

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
     
    LEA SI ,A
    MOV BX , 5
    CALL SELECT
    
    MOV AH , 4CH
    INT 21H
    
MAIN ENDP
END MAIN