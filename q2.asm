.model small
.stack 100h
.data

   
.code ; program that will generate a random number btw , 0-5

l1:
mov AH, 00h 
int 1AH    ; dx contain random values  


   MOV BH, 48   
   MOV al, dl   
   CMP al, bh ; 0 min range   
   JB l1       
                
   MOV bh, 53 ; 5 max range  
   MOV al, dl  
   CMP al, bh  
   JA l1  

mov ah,4ch
int 21h
end

