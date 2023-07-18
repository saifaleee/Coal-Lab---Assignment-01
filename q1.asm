.model small
.stack 100h
.data
Name db "Saif Ali Khan's CV"
details db "I am a 19 year old student studying in my 2nd year at FAST NUCES Islamabad, and my degree is Computer Science." 
detail2 db "My future Goal is to be a cybersecurity engineer"
heading db "Skills:"
skills db "Python -> Basic, Coding: Data Structures,OOP - in C++, Python, bash scripting"
heading db " Experiences:  "
experience db "- Head of Red Team in Cyber Space Legion and member in multiple societies - Took part in multiple programming competitions for students"

.code

mov ax, @data
mov ds, ax

mov ah, 4ch
int 21h
end