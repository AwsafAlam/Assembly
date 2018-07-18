                      .MODEL SMALL
.STACK 100H
.DATA
t0 DW ?
a2 DW ?
x3 DW ?
t1 DW ?
t2 DW ?
t3 DW ?
a3 DW ?
b3 DW ?
a4 DW ?
b4 DW ?
t4 DW ?
.CODE
f PROC
JMP L1
L0:
POP BP
RET 2
L1:
PUSH BP
MOV BP,SP
MOV AX,[BP+4]
MOV a2,AX
MOV AX,2
MOV BX,a2
MUL BX
MOV t0,AX

MOV AX,t0
JMP L0
MOV AX,9
MOV a2,AX


JMP L0
f ENDP
g PROC
JMP L3
L2:
POP BP
RET 2
L3:
PUSH BP
MOV BP,SP
MOV AX,[BP+4]
MOV a3,AX
MOV AX,[BP+6]
MOV b3,AX
PUSH a3
CALL f
MOV t1,AX

MOV AX,a3
MOV BX,t1
ADD BX,AX
MOV t2,BX

MOV AX,b3
MOV BX,t2
ADD BX,AX
MOV t3,BX

MOV AX,t3
MOV x3,AX

MOV AX,x3
JMP L2

JMP L2
g ENDP
main PROC
MOV AX,@DATA
MOV DS,AX

JMP L5
L4:
MOV AH,4CH
INT 21H
L5:
MOV AX,1
MOV a4,AX

MOV AX,2
MOV b4,AX

PUSH b4
PUSH a4
CALL g
MOV t4,AX

MOV AX,t4
MOV a4,AX

MOV AX,a4
CALL PRINT
MOV AX,0
JMP L4

main ENDP

PRINT PROC

PUSH DX
PUSH CX
PUSH BX
PUSH AX
OR AX,AX
JGE check_NEG
PUSH AX
MOV DL,'-'
MOV AH,2
INT 21H
POP AX
NEG AX
check_NEG:
XOR CX,CX
MOV BX,10D
print_char:
XOR DX,DX
DIV BX
 PUSH DX
INC CX
OR AX,AX
JNE print_char
MOV AH,2
print_loop:
POP DX
OR DL,30H
INT 21H
loop print_loop
POP DX
POP CX
POP BX
POP AX
RET 2
PRINT ENDP


END MAIN
