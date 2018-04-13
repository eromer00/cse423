* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c0h.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,3(6)	Load integer constant 
 45:     LD  5,-2(1)	Load address of base of array x
 46:    SUB  5,5,3	Compute offset of value 
 47:     LD  3,0(5)	load lhs variable x
 48:    LDA  3,1(3)	increment value of x
 49:     ST  3,0(5)	Store variable x
 50:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-3(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 60:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 61:     LD  3,-2(1)	Load address of base of array x
 62:     ST  3,-5(1)	Save left side 
 63:    LDC  3,3(6)	Load integer constant 
 64:     LD  4,-5(1)	Load left into ac1 
 65:    SUB  3,4,3	compute location from index 
 66:     LD  3,0(3)	Load array element 
 67:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 68:    LDA  1,-3(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 72:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 73:    LDA  1,-3(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-39(7)	CALL outnl
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDC  3,3(6)	Load integer constant 
 79:     LD  5,-2(1)	Load address of base of array x
 80:    SUB  5,5,3	Compute offset of value 
 81:     LD  3,0(5)	load lhs variable x
 82:    LDA  3,-1(3)	decrement value of x
 83:     ST  3,0(5)	Store variable x
 84:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-3(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 89:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-56(7)	CALL outnl
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 94:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 95:     LD  3,-2(1)	Load address of base of array x
 96:     ST  3,-5(1)	Save left side 
 97:    LDC  3,3(6)	Load integer constant 
 98:     LD  4,-5(1)	Load left into ac1 
 99:    SUB  3,4,3	compute location from index 
100:     LD  3,0(3)	Load array element 
101:     ST  3,-5(1)	Store parameter 
*                       Jump to output
102:    LDA  1,-3(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
106:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
107:    LDA  1,-3(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-73(7)	CALL outnl
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
111:    LDC  2,0(6)	Set return value to 0 
112:     LD  3,-1(1)	Load return address 
113:     LD  1,0(1)	Adjust fp 
114:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
115:     ST  3,-1(1)	Store return address. 
* COMPOUND
116:    LDC  3,7(6)	load size of array x
117:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
118:    LDC  3,3(6)	Load integer constant 
119:     ST  3,-10(1)	Save index 
120:    LDC  3,1023(6)	Load integer constant 
121:     LD  4,-10(1)	Restore index 
122:    LDA  5,-3(1)	Load address of base of array x
123:    SUB  5,5,4	Compute offset of value 
124:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  dog
125:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
126:    LDA  3,-3(1)	Load address of base of array x
127:     ST  3,-12(1)	Store parameter 
*                       Jump to dog
128:    LDA  1,-10(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-89(7)	CALL dog
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
132:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
133:    LDA  3,-3(1)	Load address of base of array x
134:     ST  3,-12(1)	Save left side 
135:    LDC  3,3(6)	Load integer constant 
136:     LD  4,-12(1)	Load left into ac1 
137:    SUB  3,4,3	compute location from index 
138:     LD  3,0(3)	Load array element 
139:     ST  3,-12(1)	Store parameter 
*                       Jump to output
140:    LDA  1,-10(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust fp 
147:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,147(7)	Jump to init [backpatch] 
* INIT
148:     LD  0,0(0)	Set the global pointer 
149:    LDA  1,0(0)	set first frame at end of globals 
150:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-38(7)	Jump to main 
153:   HALT  0,0,0	DONE! 
* END INIT
