* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c0g.c-
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
* Compound Body
* EXPRESSION
 43:    LDC  3,3(6)	Load integer constant 
 44:     ST  3,-2(1)	Save index 
 45:    LDC  3,1023(6)	Load integer constant 
 46:     LD  4,-2(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 51:    LDC  3,3(6)	Load integer constant 
 52:    LDA  5,-1(0)	Load address of base of array x
 53:    SUB  5,5,3	Compute offset of value 
 54:     LD  3,0(5)	load lhs variable x
 55:    LDA  3,1(3)	increment value of x
 56:     ST  3,0(5)	Store variable x
 57:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-2(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 67:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 68:    LDA  3,-1(0)	Load address of base of array x
 69:     ST  3,-4(1)	Save left side 
 70:    LDC  3,3(6)	Load integer constant 
 71:     LD  4,-4(1)	Load left into ac1 
 72:    SUB  3,4,3	compute location from index 
 73:     LD  3,0(3)	Load array element 
 74:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-2(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 79:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 80:    LDA  1,-2(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-46(7)	CALL outnl
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 84:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 85:    LDC  3,3(6)	Load integer constant 
 86:    LDA  5,-1(0)	Load address of base of array x
 87:    SUB  5,5,3	Compute offset of value 
 88:     LD  3,0(5)	load lhs variable x
 89:    LDA  3,-1(3)	decrement value of x
 90:     ST  3,0(5)	Store variable x
 91:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 92:    LDA  1,-2(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-89(7)	CALL output
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 96:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 97:    LDA  1,-2(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-63(7)	CALL outnl
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
101:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
102:    LDA  3,-1(0)	Load address of base of array x
103:     ST  3,-4(1)	Save left side 
104:    LDC  3,3(6)	Load integer constant 
105:     LD  4,-4(1)	Load left into ac1 
106:    SUB  3,4,3	compute location from index 
107:     LD  3,0(3)	Load array element 
108:     ST  3,-4(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-2(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
113:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
114:    LDA  1,-2(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-80(7)	CALL outnl
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
118:    LDC  2,0(6)	Set return value to 0 
119:     LD  3,-1(1)	Load return address 
120:     LD  1,0(1)	Adjust fp 
121:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,121(7)	Jump to init [backpatch] 
* INIT
122:     LD  0,0(0)	Set the global pointer 
123:    LDA  1,-8(0)	set first frame at end of globals 
124:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
125:    LDC  3,7(6)	load size of array x
126:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-87(7)	Jump to main 
129:   HALT  0,0,0	DONE! 
* END INIT
