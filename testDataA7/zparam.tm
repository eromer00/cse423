* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  zparam.c-
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
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-4(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 51:     LD  3,-3(1)	Load address of base of array y
 52:     ST  3,-6(1)	Save left side 
 53:    LDC  3,3(6)	Load integer constant 
 54:     LD  4,-6(1)	Load left into ac1 
 55:    SUB  3,4,3	compute location from index 
 56:     LD  3,0(3)	Load array element 
 57:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-4(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-4(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
 71:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 72:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-2(1)	Load variable x
 74:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-4(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 80:     LD  3,-3(1)	Load address of base of array y
 81:     ST  3,-6(1)	Save left side 
 82:    LDC  3,3(6)	Load integer constant 
 83:     LD  4,-6(1)	Load left into ac1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
 86:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 87:    LDA  1,-4(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 91:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 92:    LDA  1,-4(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-58(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  dog
 96:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 97:     LD  3,-2(1)	Load variable x
 98:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 99:     LD  3,-3(1)	Load address of base of array y
100:     ST  3,-7(1)	Store parameter 
*                       Jump to dog
101:    LDA  1,-4(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-62(7)	CALL dog
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
109:     ST  3,-1(1)	Store return address. 
* COMPOUND
110:    LDC  3,10(6)	load size of array y
111:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
112:    LDC  3,666(6)	Load integer constant 
113:     ST  3,-2(1)	Store variable x
* EXPRESSION
114:    LDC  3,3(6)	Load integer constant 
115:     ST  3,-14(1)	Save index 
116:    LDC  3,777(6)	Load integer constant 
117:     LD  4,-14(1)	Restore index 
118:    LDA  5,-4(1)	Load address of base of array y
119:    SUB  5,5,4	Compute offset of value 
120:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
121:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
122:     LD  3,-2(1)	Load variable x
123:     ST  3,-16(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-14(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
129:    LDA  3,-4(1)	Load address of base of array y
130:     ST  3,-16(1)	Save left side 
131:    LDC  3,3(6)	Load integer constant 
132:     LD  4,-16(1)	Load left into ac1 
133:    SUB  3,4,3	compute location from index 
134:     LD  3,0(3)	Load array element 
135:     ST  3,-16(1)	Store parameter 
*                       Jump to output
136:    LDA  1,-14(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
140:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
141:    LDA  1,-14(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-107(7)	CALL outnl
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  cat
145:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
146:     LD  3,-2(1)	Load variable x
147:     ST  3,-16(1)	Store parameter 
*                       Load param 2
148:    LDA  3,-4(1)	Load address of base of array y
149:     ST  3,-17(1)	Store parameter 
*                       Jump to cat
150:    LDA  1,-14(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-82(7)	CALL cat
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
154:    LDC  2,0(6)	Set return value to 0 
155:     LD  3,-1(1)	Load return address 
156:     LD  1,0(1)	Adjust fp 
157:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,157(7)	Jump to init [backpatch] 
* INIT
158:     LD  0,0(0)	Set the global pointer 
159:    LDA  1,0(0)	set first frame at end of globals 
160:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-54(7)	Jump to main 
163:   HALT  0,0,0	DONE! 
* END INIT
