* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  arraysizeold.c-
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0(6)	Set return to 0 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust fp 
 12:    LDA  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 13:     ST  3,-1(1)	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1(1)	Load return address 
 16:     LD  1,0(1)	Adjust fp 
 17:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 18:     ST  3,-1(1)	Store return address 
 19:     LD  3,-2(1)	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0(6)	Set return to 0 
 22:     LD  3,-1(1)	Load return address 
 23:     LD  1,0(1)	Adjust fp 
 24:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 25:     ST  3,-1(1)	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1(1)	Load return address 
 28:     LD  1,0(1)	Adjust fp 
 29:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 30:     ST  3,-1(1)	Store return address 
 31:     LD  3,-2(1)	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0(6)	Set return to 0 
 34:     LD  3,-1(1)	Load return address 
 35:     LD  1,0(1)	Adjust fp 
 36:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 37:     ST  3,-1(1)	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1(1)	Load return address 
 40:     LD  1,0(1)	Adjust fp 
 41:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION ford
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,13(6)	load size of array y
 44:     ST  3,-4(1)	save size of array y
* Compound Body
* EXPRESSION
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-18(1)	Save index 
 47:    LDC  3,666(6)	Load integer constant 
 48:     LD  4,-18(1)	Restore index 
 49:    LDA  5,-5(1)	Load address of base of array y
 50:    SUB  5,5,4	Compute offset of value 
 51:     ST  3,0(5)	Store variable y
* EXPRESSION
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-18(1)	Save index 
 54:    LDC  3,888(6)	Load integer constant 
 55:     LD  4,-18(1)	Restore index 
 56:    LDA  5,-1(0)	Load address of base of array g
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable g
* END COMPOUND
* Add standard closing in case there is no return statement
 59:    LDC  2,0(6)	Set return value to 0 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    LDA  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 63:     ST  3,-1(1)	Store return address. 
* COMPOUND
 64:    LDC  3,11(6)	load size of array m
 65:     ST  3,-2(1)	save size of array m
* Compound Body
* EXPRESSION
 66:    LDC  3,0(6)	Load integer constant 
 67:     ST  3,-14(1)	Save index 
 68:    LDC  3,777(6)	Load integer constant 
 69:     LD  4,-14(1)	Restore index 
 70:    LDA  5,-3(1)	Load address of base of array m
 71:    SUB  5,5,4	Compute offset of value 
 72:     ST  3,0(5)	Store variable m
* EXPRESSION
*                       Begin call to  ford
 73:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 74:    LDA  3,-3(1)	Load address of base of array m
 75:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
 76:    LDA  1,-14(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-37(7)	CALL ford
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  ford
 80:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDA  3,-1(0)	Load address of base of array g
 82:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
 83:    LDA  1,-14(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	CALL ford
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,90(7)	Jump to init [backpatch] 
* INIT
 91:     LD  0,0(0)	Set the global pointer 
 92:    LDA  1,-13(0)	set first frame at end of globals 
 93:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 94:    LDC  3,12(6)	load size of array g
 95:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-35(7)	Jump to main 
 98:   HALT  0,0,0	DONE! 
* END INIT
