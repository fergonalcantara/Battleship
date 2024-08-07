.model small
.stack
.data
	msg1 db "Bienvenid@ a BattleShip",10,13,'$'
	msg2 db "Ingrese si desea ser 1.Host o 2.Guest (Ingrese el digito)",10,13,'$'
	msg3 db "Ingrese si desea ser 1.Federacion o 2.Colectivo Borg (Ingrese el digito)",10,13,'$'
	msg4 db "Error.Ingrese la entrada correcta",10,13,'$'
.code

disp proc
	push ax
	push dx
disp_ciclo1:
	mov ah,09
	lea dx, msg1
	int 21h
	mov ah,09
	lea dx, msg2
	int 21h

	mov ah, 01h
	int 21h
	sub al, '0'

	cmp al, 1
	je host
	cmp al, 2
	je guest

	lea dx, msg4
	mov ah, 09h
	int 21h
jmp disp_ciclo1

	pop dx
	pop ax	
ret
disp endp

host proc
	push ax
	push dx
	
	mov ah, 09
	lea dx, msg3
	int 21h

	mov ah, 01
	int 21h

	pop dx
	pop ax
ret
host endp

guest proc
ret
guest endp

start:
	mov dx, @data
	mov ds,dx
	
	call disp
	mov ax, 4c00h
	int 21h
end start
