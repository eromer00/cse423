* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  funcaa.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-2(1)	Load address of base of array z
 44:     LD  3,1(3)	Load array size 
* EXPRESSION
 45:     LD  3,-2(1)	Load address of base of array z
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,7(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    SUB  3,4,3	compute location from index 
 50:     LD  3,0(3)	Load array element 
* END COMPOUND
* Add standard closing in case there is no return statement
 51:    LDC  2,0(6)	Set return value to 0 
 52:     LD  3,-1(1)	Load return address 
 53:     LD  1,0(1)	Adjust fp 
 54:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 55:     ST  3,-1(1)	Store return address. 
* COMPOUND
 56:    LDC  3,23(6)	load size of array y
 57:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
 58:     LD  3,-2(1)	Load address of base of array x
 59:     LD  3,1(3)	Load array size 
* EXPRESSION
 60:    LDA  3,-4(1)	Load address of base of array y
 61:     LD  3,1(3)	Load array size 
* EXPRESSION
 62:    LDC  3,7(6)	Load integer constant 
 63:     ST  3,-27(1)	Save index 
 64:    LDC  3,666(6)	Load integer constant 
 65:     LD  4,-27(1)	Restore index 
 66:    LDA  5,-4(1)	Load address of base of array y
 67:    SUB  5,5,4	Compute offset of value 
 68:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  cat
 69:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-2(1)	Load address of base of array x
 71:     ST  3,-29(1)	Store parameter 
*                       Jump to cat
 72:    LDA  1,-27(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-33(7)	CALL cat
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  cat
 76:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDA  3,-4(1)	Load address of base of array y
 78:     ST  3,-29(1)	Store parameter 
*                       Jump to cat
 79:    LDA  1,-27(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-40(7)	CALL cat
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
 83:    LDC  2,0(6)	Set return value to 0 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 87:     ST  3,-1(1)	Store return address. 
* COMPOUND
 88:    LDC  3,17(6)	load size of array a
 89:     ST  3,-2(1)	save size of array a
* Compound Body
* EXPRESSION
 90:    LDC  3,7(6)	Load integer constant 
 91:     ST  3,-20(1)	Save index 
 92:    LDC  3,444(6)	Load integer constant 
 93:     LD  4,-20(1)	Restore index 
 94:    LDA  5,-3(1)	Load address of base of array a
 95:    SUB  5,5,4	Compute offset of value 
 96:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  dog
 97:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDA  3,-3(1)	Load address of base of array a
 99:     ST  3,-22(1)	Store parameter 
*                       Jump to dog
100:    LDA  1,-20(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-48(7)	CALL dog
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
104:    LDC  2,0(6)	Set return value to 0 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,107(7)	Jump to init [backpatch] 
* INIT
108:     LD  0,0(0)	Set the global pointer 
109:    LDA  1,0(0)	set first frame at end of globals 
110:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-26(7)	Jump to main 
113:   HALT  0,0,0	DONE! 
* END INIT
