// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
@i
M=0
@8191
D=A
@R0
M=D

@KBD
D=M
@KEYPRESS
D;JNE
@NOKEYPRESS
D;JEQ

(NOKEYPRESS)
@i
D=M
@SCREEN
A=D+A
M=0
@i
M=M+1
D=M
@R0
D=D-M
@NOKEYPRESS
D;JNE
@LOOP
0;JMP

(KEYPRESS)
@i
D=M
@SCREEN
A=D+A
M=-1
@i
M=M+1
D=M
@R0
D=D-M
@KEYPRESS
D;JNE
@LOOP
0;JMP