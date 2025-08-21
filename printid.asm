
	
	.model small
	.data
		;setting id arrays
		ID1 DB 1,1,3,4,5,5,4,2,1
		ID2 DB 2,1,3,6,1,2,3,2,4
		COLORS DB 1,2,3,4,5,6,7,8,1
		;setting pointers for the id arrays
		POINTERS DW OFFSET ID1, OFFSET ID2
	.stack 100h
	.code
	START:
		;setting data segment
		mov ax, @data
		mov ds, ax
		;setting extra segment to screen mem
		mov ax,0b800h 
		mov es, ax 
		mov cx, 9 ;number of iterations (id len)
		mov si, 0 ;index in id array
		mov di ,3520d ;place on screen- line 23
		
		PRINT_ID1: 
			mov bx, POINTERS ;setting bx to the first id array
			mov al, [bx+si] ;setting al to the ralevent index in id array
			mov ah, al ;coping num to the set the color
			shl ah,1 ;shifting the color number to the beckground bits
			shl ah,1
			shl ah,1
			shl ah,1
			add al, '0' ;adding 30h to get the right hscii table value
			mov es:[di], ax ;printing
			inc si ;inc the index 
			add di, 2d ;inc the place on the screen
			LOOP PRINT_ID1
		
		;doing the same for id2
		mov cx, 9 
		mov si, 0
		mov di ,3680d ;line 24
		
		PRINT_ID2: 
			mov bx, POINTERS+2 ;setting bx to id2
			mov al, [bx+si]
			mov ah, al
			shl ah,1
			shl ah,1
			shl ah,1
			shl ah,1
			add al, '0'
			mov es:[di], ax 
			inc si
			add di, 2d
			LOOP PRINT_ID2
			
		

		mov dx, 0 ;carry flag  
		mov cx, 9 
		mov di, POINTERS[0] ;setting bp to id1
		add di, 8
		mov bx, POINTERS[2] ;setting bx to id2
		add bx, 8
		mov bp ,3856d ;line 25
		mov si, offset COLORS
		
		
		
		
		SUM:
			mov al, [bx]
			add al, [di]
			
			add al, dh ;add the carry
			mov dh, 0 ;set carry to zero
			
			cmp al, 10 ;checks if sum > 10
			jb END_OF_SUM_LOOP ;if sum < 10 jump to print the number
		
			mov dh, 1 ;if sum >= 10 set carry flag to 1
			sub al, 10 ;and do sum-=10
			
			
			END_OF_SUM_LOOP:
			
			mov ah, [si]
			
			shl ah,1
			shl ah,1
			shl ah,1
			shl ah,1
			
			add al, 30h
			
			mov es:[bp], ax 
			sub bp, 2
			dec bx
			dec di
			inc si
			dec cx
			jnz SUM
		

		;return to OS
		mov ax, 4c00h
		int 21h
	End START
