.model small
.stack 100h
.data

Rowsize DW 3
Array DB 5,2,3
      DB 2,6,1,
      DB 3,10,1

row db 1;
maximum db 0
minimum db 127 
left_diagonal db ?
right_diagonal db ?

.code

mov ax, @data
mov ds, ax

mov ax,0
MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
ADD bx, Rowsize ; Choose second row
MOV si,0 ;Choose third column

mov cx,Rowsize ; sum of 2nd row
l1:
add al, [bx+si] ;get the value at 0157
inc si
loop l1

mov ax,0
MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
;ADD bx, Rowsize ; Choose second row


mov cx,Rowsize ; sum of 1st column
l2:
add al, [bx] 
ADD bx, Rowsize
loop l2

mov ax,0
mov bx,0

MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
ADD bx, Rowsize ; Choose second row
MOV si,0

mov cx,Rowsize ; sum of 2nd row
l3:
mov al, [bx+si] ;get the value at 0157
cmp al,maximum
jng skip

mov maximum,al

skip:
inc si
loop l3

mov ax,0
mov bx,0
MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
;ADD bx, Rowsize ; Choose second row


mov cx,Rowsize ; sum of 1st column
l4:
mov al, [bx]
cmp al,minimum
jnl skip2

mov minimum,al

skip2:
ADD bx, Rowsize
loop l4

mov ax,0
mov bx,0

MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
MOV si,0

mov cx,Rowsize ; sum of 2nd row
l5:
add al, [bx+si] ;get the value at 0157

inc si
inc si
inc si 
inc si
loop l5
mov left_diagonal,al

mov ax,0
mov bx,0

MOV bx, offset array ;Point to the array at 0150 (as starting address is 0150)
MOV si,2

mov cx,Rowsize ; sum of 2nd row
l6:
add al, [bx+si] ;get the value at 0157

inc si
inc si
loop l6
mov right_diagonal,al

mov ah, 4ch
int 21h
end