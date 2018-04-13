* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c17.c-
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
 43:    LDC  3,5(6)	Load integer constant 
 44:     ST  3,-2(1)	Save index 
 45:    LDC  3,333(6)	Load integer constant 
 46:     LD  4,-2(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
 50:    LDC  3,7(6)	Load integer constant 
 51:     ST  3,-2(1)	Save index 
 52:    LDC  3,444(6)	Load integer constant 
 53:     LD  4,-2(1)	Restore index 
 54:    LDA  5,-9(0)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable y
* EXPRESSION
 57:    LDC  3,5(6)	Load integer constant 
 58:     ST  3,-2(1)	Save index 
 59:    LDA  3,-9(0)	Load address of base of array y
 60:     ST  3,-3(1)	Save left side 
 61:    LDC  3,7(6)	Load integer constant 
 62:     LD  4,-3(1)	Load left into ac1 
 63:    SUB  3,4,3	compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     LD  4,-2(1)	Restore index 
 66:    LDA  5,-1(0)	Load address of base of array x
 67:    SUB  5,5,4	Compute offset of value 
 68:     LD  4,0(5)	load lhs variable x
 69:    ADD  3,4,3	op += 
 70:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 71:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 72:    LDA  3,-1(0)	Load address of base of array x
 73:     ST  3,-4(1)	Save left side 
 74:    LDC  3,5(6)	Load integer constant 
 75:     LD  4,-4(1)	Load left into ac1 
 76:    SUB  3,4,3	compute location from index 
 77:     LD  3,0(3)	Load array element 
 78:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-2(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 83:    LDC  3,7(6)	Load integer constant 
 84:     ST  3,-2(1)	Save index 
 85:    LDA  3,-1(0)	Load address of base of array x
 86:     ST  3,-3(1)	Save left side 
 87:    LDC  3,5(6)	Load integer constant 
 88:     LD  4,-3(1)	Load left into ac1 
 89:    SUB  3,4,3	compute location from index 
 90:     LD  3,0(3)	Load array element 
 91:     LD  4,-2(1)	Restore index 
 92:    LDA  5,-9(0)	Load address of base of array y
 93:    SUB  5,5,4	Compute offset of value 
 94:     LD  4,0(5)	load lhs variable y
 95:    SUB  3,4,3	op -= 
 96:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDA  3,-9(0)	Load address of base of array y
 99:     ST  3,-4(1)	Save left side 
100:    LDC  3,7(6)	Load integer constant 
101:     LD  4,-4(1)	Load left into ac1 
102:    SUB  3,4,3	compute location from index 
103:     LD  3,0(3)	Load array element 
104:     ST  3,-4(1)	Store parameter 
*                       Jump to output
105:    LDA  1,-2(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
109:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-76(7)	CALL outnl
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
114:    LDC  2,0(6)	Set return value to 0 
115:     LD  3,-1(1)	Load return address 
116:     LD  1,0(1)	Adjust fp 
117:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,117(7)	Jump to init [backpatch] 
* INIT
118:     LD  0,0(0)	Set the global pointer 
119:    LDA  1,-18(0)	set first frame at end of globals 
120:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
121:    LDC  3,7(6)	load size of array x
122:     ST  3,0(0)	save size of array x
123:    LDC  3,9(6)	load size of array y
124:     ST  3,-8(0)	save size of array y
* END INIT GLOBALS AND STATICS
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-85(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
