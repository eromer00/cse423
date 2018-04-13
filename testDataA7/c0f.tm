* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c0f.c-
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
* FUNCTION main
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,7(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 45:    LDC  3,3(6)	Load integer constant 
 46:     ST  3,-10(1)	Save index 
 47:    LDC  3,1023(6)	Load integer constant 
 48:     LD  4,-10(1)	Restore index 
 49:    LDA  5,-3(1)	Load address of base of array x
 50:    SUB  5,5,4	Compute offset of value 
 51:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 53:    LDC  3,3(6)	Load integer constant 
 54:    LDA  5,-3(1)	Load address of base of array x
 55:    SUB  5,5,3	Compute offset of value 
 56:     LD  3,0(5)	load lhs variable x
 57:    LDA  3,1(3)	increment value of x
 58:     ST  3,0(5)	Store variable x
 59:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-10(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 64:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 65:    LDA  1,-10(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 70:    LDA  3,-3(1)	Load address of base of array x
 71:     ST  3,-12(1)	Save left side 
 72:    LDC  3,3(6)	Load integer constant 
 73:     LD  4,-12(1)	Load left into ac1 
 74:    SUB  3,4,3	compute location from index 
 75:     LD  3,0(3)	Load array element 
 76:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 77:    LDA  1,-10(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 81:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 82:    LDA  1,-10(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-48(7)	CALL outnl
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 86:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 87:    LDC  3,3(6)	Load integer constant 
 88:    LDA  5,-3(1)	Load address of base of array x
 89:    SUB  5,5,3	Compute offset of value 
 90:     LD  3,0(5)	load lhs variable x
 91:    LDA  3,-1(3)	decrement value of x
 92:     ST  3,0(5)	Store variable x
 93:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 94:    LDA  1,-10(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 98:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 99:    LDA  1,-10(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-65(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
103:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
104:    LDA  3,-3(1)	Load address of base of array x
105:     ST  3,-12(1)	Save left side 
106:    LDC  3,3(6)	Load integer constant 
107:     LD  4,-12(1)	Load left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
110:     ST  3,-12(1)	Store parameter 
*                       Jump to output
111:    LDA  1,-10(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
115:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
116:    LDA  1,-10(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-82(7)	CALL outnl
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,123(7)	Jump to init [backpatch] 
* INIT
124:     LD  0,0(0)	Set the global pointer 
125:    LDA  1,0(0)	set first frame at end of globals 
126:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-87(7)	Jump to main 
129:   HALT  0,0,0	DONE! 
* END INIT
