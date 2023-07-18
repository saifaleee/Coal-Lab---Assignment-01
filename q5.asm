.model small
.stack 100h
.data
	array1 db 1,4,3,4,5,6,7
	array2 db 2,8,5,2,1,5,5
	total_size dw ?
.code 

mov ax, @data
mov ds, ax
mov ax, 0


mov si, offset array1
mov di, offset array2
mov total_size, lengthof array1
mov cx, total_size
add di, 6
l1:

	mov al, [si]
	mov bl, [di]


	mov dx,0
	add dl,al
	add dl,bl
	mov [si],dl     
	inc si      
	dec di

loop l1




exit:
mov ah,4ch
int 21h
end

