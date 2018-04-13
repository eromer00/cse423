* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  unarystar.c-
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
 43:    LDC  3,7(6)	load size of array n
 44:     ST  3,-3(1)	save size of array n
 45:    LDC  3,34(6)	load size of array a
 46:     ST  3,-12(1)	save size of array a
* Compound Body
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
 48:    LDA  3,-4(1)	Load address of base of array n
 49:     LD  3,1(3)	Load array size 
 50:     ST  3,-49(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-47(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 55:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
 56:    LDA  3,-13(1)	Load address of base of array a
 57:     LD  3,1(3)	Load array size 
 58:     ST  3,-49(1)	Store parameter 
*                       Jump to output
 59:    LDA  1,-47(1)	Load address of new frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    LDA  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 63:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Jump to outnl
 64:    LDA  1,-47(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-30(7)	CALL outnl
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
 69:    LDA  3,-4(1)	Load address of base of array n
 70:     LD  3,1(3)	Load array size 
 71:     ST  3,-49(1)	Save left side 
 72:    LDC  3,10(6)	Load integer constant 
 73:     LD  4,-49(1)	Load left into ac1 
 74:    ADD  3,4,3	Op + 
 75:     ST  3,-49(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-47(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 80:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDA  3,-13(1)	Load address of base of array a
 82:     LD  3,1(3)	Load array size 
 83:     ST  3,-49(1)	Save left side 
 84:    LDC  3,10(6)	Load integer constant 
 85:     LD  4,-49(1)	Load left into ac1 
 86:    ADD  3,4,3	Op + 
 87:     ST  3,-49(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-47(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 92:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Jump to outnl
 93:    LDA  1,-47(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-59(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDA  3,-4(1)	Load address of base of array n
 99:     ST  3,-49(1)	Save left side 
100:    LDA  3,-4(1)	Load address of base of array n
101:     LD  3,1(3)	Load array size 
102:     LD  4,-49(1)	Load left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-49(1)	Store parameter 
*                       Jump to output
106:    LDA  1,-47(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
110:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
111:    LDA  3,-4(1)	Load address of base of array n
112:     ST  3,-49(1)	Save left side 
113:    LDC  3,1984(6)	Load integer constant 
114:     LD  4,-49(1)	Load left into ac1 
115:    SUB  3,4,3	compute location from index 
116:     LD  3,0(3)	Load array element 
117:     ST  3,-49(1)	Store parameter 
*                       Jump to output
118:    LDA  1,-47(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
122:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Load param 1
123:    LDA  3,-13(1)	Load address of base of array a
124:     LD  3,1(3)	Load array size 
125:     ST  3,-49(1)	Save left side 
126:    LDA  3,-4(1)	Load address of base of array n
127:     LD  3,1(3)	Load array size 
128:     LD  4,-49(1)	Load left into ac1 
129:    MUL  3,4,3	Op * 
130:     ST  3,-49(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-47(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
135:     ST  1,-47(1)	Store old fp in ghost frame 
*                       Jump to outnl
136:    LDA  1,-47(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-102(7)	CALL outnl
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
140:    LDA  3,-4(1)	Load address of base of array n
141:     LD  3,1(3)	Load array size 
142:    LDA  2,0(3)	Copy result to rt register 
143:     LD  3,-1(1)	Load return address 
144:     LD  1,0(1)	Adjust fp 
145:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
146:    LDC  2,0(6)	Set return value to 0 
147:     LD  3,-1(1)	Load return address 
148:     LD  1,0(1)	Adjust fp 
149:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,149(7)	Jump to init [backpatch] 
* INIT
150:     LD  0,0(0)	Set the global pointer 
151:    LDA  1,0(0)	set first frame at end of globals 
152:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-113(7)	Jump to main 
155:   HALT  0,0,0	DONE! 
* END INIT
