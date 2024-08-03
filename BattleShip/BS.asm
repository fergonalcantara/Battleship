.model small
.stack
.data
	msg1 db "Bienvenid@ a BattleShip",10,13,'$'
	msg2 db "Ingrese si desea ser 1.Host o 2.Guest (Ingrese el digito)",10,13,'$'
	msg3 db "Ingrese si desea ser 1.Federacion o 2.Colectivo Borg (Ingrese el digito",10,13,'$'

.code

disp proc
	push ax
	mov ah,09
	lea dx, msg1
	int 21h
	pop ax
ret
disp endp

start:
	mov dx, @data
	mov ds,dx
	
	call disp
	mov ax, 4c00h
	int 21h
end start