.model small
.stack 100h
.data
    array db 2,2,3,1,2,1,2
    final db 0
    value db ?
.code 
  
mov ax, @data
mov ds, ax
mov ax, 0

mov si,offset array
mov di,offset array
;al =counter
;ah = value
mov cx, lengthof array
l1: 
    mov al,0
    mov dx,cx ; backup

    mov cx, lengthof array

    mov ah,[si] ; store value
    mov di,offset array
    l2:
        cmp ah,[di]
        jne skip
        inc al
        skip:

    inc di
    loop l2;

    cmp al , final
    jng skip2
    
    mov final , al 
    mov value , ah
    skip2:
    inc si

    mov cx,dx ; backup    
loop l1

   


mov ah,4ch
int 21h
end

