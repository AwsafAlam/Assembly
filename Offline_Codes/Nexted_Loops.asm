.MODEL SMALL
.STACK 100H
.DATA
a dw ?
b dw ?
i dw ?
t0 dw ?
t1 dw ?
t2 dw ?
t3 dw ?
.CODE

main PROC
MOV AX,@DATA
MOV DS,AX

MOV AX,0
MOV b,AX

MOV AX,0
MOV i,AX

L4:
MOV AX,i
CMP AX,4
JL L0
MOV t0,0
JMP L1
L0:
MOV t0,1
L1:

MOV AX,t0
CMP AX,0
JE L5
MOV AX,3
MOV a,AX

L2:
MOV AX,a
DEC AX
MOV a,AX
MOV AX,a
CMP AX,0
JE L3
MOV AX,b
INC AX
MOV t3,AX


JMP L2
L3:
MOV AX,i
INC AX
MOV t1,AX

JMP L4
L5:
LEA DX,a
MOV AH,09H
INT 21H
MOV AH,02H
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H
LEA DX,b
MOV AH,09H
INT 21H
MOV AH,02H
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H
MOV AX,6
MOV b,AX


main ENDP
END MAIN