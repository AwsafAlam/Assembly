.MODEL SMALLL


.STACK 100H

.DATA

A DB 21,5,16,40,7
DECR DB ?

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
    
    MOV SI , DX
    MOV CX , BX
    MOV DI , SI
    MOV AL , [DI]

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

MAIN PROC
    
    MOV AX , @DATA
    MOV DS , AX
    
    LEA SI ,A
    MOV BX , 5
    CALL SELECT
    
    MOV AL , [SI]
    ;ADD SI , 2
    ;MOV AX , [SI]
    
    MOV BX , 5
  
   OUTPU_T:
    DEC BX
    PUSH BX
    
    MOV AH , 2
    MOV DL , AL
    ADD DL ,48 ; CONV TO CHAR
    INT 21H
    
    
    MOV DL , ' '
    INT 21H
    POP BX
    ADD SI , 2
    MOV AL , [SI]
    
    CMP BX , 0
    JNE OUTPU_T
     
    
    
    MOV AH , 4CH
    INT 21H
    
END MAIN
MAIN ENDP