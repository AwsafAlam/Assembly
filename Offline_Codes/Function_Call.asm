.MODEL SMALL
.STACK 100H
.DATA
a DW ?
b DW ?

.CODE
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

FUNC PROC
PUSH BP
MOV BP , SP

mov ax,[bp+6]
add ax,[bp+4]

pop bp
ret 4    
FUNC ENDP

main PROC
MOV AX,@DATA
MOV DS,AX

MOV AX,2
MOV b,AX

MOV AX,3
MOV a,AX

MOV AX,a
CALL PRINT
MOV AX,b
CALL PRINT

PUSH a
PUSH b
CALL FUNC
CALL PRINT
MOV AX,0
POP BP
RET
MOV AH,4CH
INT 21H
main ENDP


END MAIN
