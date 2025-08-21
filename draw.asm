; Tal Ajami 

.model small
.stack 100h
.data
.code
START:
    ;setting data segment
    mov ax, @data
    mov ds, ax
	
    ;setting extra segment to screen mem
    mov ax,0b800h 
    mov es, ax 
	
	;printing the yellow square
	
	mov di, 698
	mov cx, 23
	mov ah, 6
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov al, 32
	
	PRINT_SQUARE1:
	mov es:[di], ax 
	mov es:[di+1760], ax 
	add di, 2
	loop PRINT_SQUARE1
	
	mov di, 698
	mov cx, 12
	
	PRINT_SQUARE2:
	mov es:[di], ax 
	mov es:[di+46], ax 
	add di, 160
	loop PRINT_SQUARE2
	
	;printing the grey rhombus
	
	mov di, 1028
	mov cx, 5
	mov ah, 7
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	
	PRINT_RHOMBUS1:
	mov es:[di], ax 
	mov es:[di+26], ax 
	mov es:[di+648], ax 
	mov es:[di+674], ax 
	add di, 158
	loop PRINT_RHOMBUS1
	
	
	mov di, 1028
	mov cx, 5
	
	PRINT_RHOMBUS2:
	mov es:[di], ax 
	mov es:[di+26], ax 
	mov es:[di+632], ax 
	mov es:[di+658], ax 
	add di, 162
	loop PRINT_RHOMBUS2
	
	;print the lines
	mov di, 1290
	mov cx, 13
	
	PRINT_lINES1:
	;print the green line
	mov ah, 2
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di], ax 
	mov es:[di+2], ax 
	mov es:[di+4], ax 
	;print the red line
	mov ah, 4
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di+320], ax 
	mov es:[di+322], ax 
	mov es:[di+324], ax 
	;print the blue line
	mov ah, 9
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di+640], ax 
	mov es:[di+642], ax 
	mov es:[di+644], ax 
	add di, 166
	loop PRINT_lines1
	
	sub di, 172
	mov cx, 13
	
	PRINT_lINES2:
	
	;print the green line
	mov ah, 2
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di], ax 
	mov es:[di+2], ax 
	mov es:[di+4], ax 
	;print the red line
	mov ah, 4
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di+320], ax 
	mov es:[di+322], ax 
	mov es:[di+324], ax 
	;print the blue line
	mov ah, 9
	shl ah, 1
	shl ah, 1
	shl ah, 1
	shl ah, 1
	mov es:[di+640], ax 
	mov es:[di+642], ax 
	mov es:[di+644], ax 
	sub di, 154
	loop PRINT_lines2
	
	





    ;return to OS
    mov ax, 4c00h
    int 21h

 End START
