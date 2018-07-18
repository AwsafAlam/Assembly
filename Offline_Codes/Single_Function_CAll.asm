.MODEL SMALL
.STACK 100H
.DATA
t0 DW ?
a2 DW ?
a3 DW ?
b3 DW ?
t1 DW ?
t2 DW ?
t3 DW ?
c3 DW 3 DUP (?)
.CODE
f PROC
PUSH BP
MOV BP,SP
MOV AX,[BP+4]
MOV a2,AX
MOV AX,2
MOV BX,a2
MUL BX
MOV t0,AX

MOV AX,t0

POP BP
RET 4
f ENDP
main PROC
MOV AX,@DATA
MOV DS,AX

MOV AX,1
MOV a3,AX

MOV BX,2
ADD BX,BX
MOV AX,c3[BX]
MOV t1,AX

MOV AX,2
MOV c3[BX],AX

MOV BX,2
ADD BX,BX
MOV AX,c3[BX]
MOV t2,AX

PUSH t2
CALL f
MOV t3,AX

MOV AX,t3
MOV a3,AX

MOV AX,a3
CALL PRINT
MOV AX,0

MOV AH,4CH
INT 21H
main ENDP

PRINT PROC

	push ax
	push bx
	push cx
	push dx
	or ax,ax
 	jge enddif
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax
	neg ax
enddif:
	xor cx,cx
	mov bx,10d
repeat:
	xor dx,dx
	div bx
	 push dx
	inc cx
	or ax,ax
	jne repeat
	mov ah,2
print_loop:
	pop dx
	or dl,30h
	int 21h
	loop print_loop
	pop dx
	pop cx
	pop bx
	pop ax
	ret
PRINT ENDP


END MAIN
