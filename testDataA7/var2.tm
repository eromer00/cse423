* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  var2.c-
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
 43:    LDC  3,222(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable y
 45:    LDC  3,333(6)	Load integer constant 
 46:     ST  3,-4(1)	Store variable z
* Compound Body
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,-2(1)	Load variable x
 49:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-5(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 54:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 55:    LDA  1,-5(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-21(7)	CALL outnl
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-4(1)	Load variable z
 61:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-5(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 66:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 67:    LDA  1,-5(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-33(7)	CALL outnl
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 71:     LD  3,-3(1)	Load variable y
 72:     ST  3,-2(1)	Store variable x
* EXPRESSION
 73:     LD  3,0(0)	Load variable g
 74:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
 75:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 76:     LD  3,-2(1)	Load variable x
 77:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 78:    LDA  1,-5(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-75(7)	CALL output
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 82:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 83:    LDA  1,-5(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-49(7)	CALL outnl
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-4(1)	Load variable z
 89:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-5(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 94:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 95:    LDA  1,-5(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-61(7)	CALL outnl
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
 99:     LD  3,-4(1)	Load variable z
100:    LDA  2,0(3)	Copy result to rt register 
101:     LD  3,-1(1)	Load return address 
102:     LD  1,0(1)	Adjust fp 
103:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
104:    LDC  2,0(6)	Set return value to 0 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
108:     ST  3,-1(1)	Store return address. 
* COMPOUND
109:    LDC  3,444(6)	Load integer constant 
110:     ST  3,-2(1)	Store variable m
111:    LDC  3,555(6)	Load integer constant 
112:     ST  3,-3(1)	Store variable z
* Compound Body
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
114:    LDA  3,-2(0)	Load address of base of array h
115:     LD  3,1(3)	Load array size 
116:     ST  3,-6(1)	Store parameter 
*                       Jump to output
117:    LDA  1,-4(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
121:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
122:     LD  3,0(0)	Load variable g
123:     ST  3,-6(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-4(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-2(1)	Load variable m
130:     ST  3,-6(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-4(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
135:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
136:     LD  3,-3(1)	Load variable z
137:     ST  3,-6(1)	Store parameter 
*                       Jump to output
138:    LDA  1,-4(1)	Load address of new frame 
139:    LDA  3,1(7)	Return address in ac 
140:    LDA  7,-135(7)	CALL output
141:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
142:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
143:    LDA  1,-4(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-109(7)	CALL outnl
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  dog
147:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
148:     LD  3,-2(1)	Load variable m
149:     ST  3,-6(1)	Store parameter 
*                       Jump to dog
150:    LDA  1,-4(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-111(7)	CALL dog
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
154:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
155:     LD  3,-3(1)	Load variable z
156:     ST  3,-6(1)	Store parameter 
*                       Jump to output
157:    LDA  1,-4(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-154(7)	CALL output
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
161:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
162:    LDA  1,-4(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-128(7)	CALL outnl
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
166:    LDC  2,0(6)	Set return value to 0 
167:     LD  3,-1(1)	Load return address 
168:     LD  1,0(1)	Adjust fp 
169:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,169(7)	Jump to init [backpatch] 
* INIT
170:     LD  0,0(0)	Set the global pointer 
171:    LDA  1,-10(0)	set first frame at end of globals 
172:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
173:    LDC  3,111(6)	Load integer constant 
174:     ST  3,-4(1)	Save left side 
175:    LDC  3,22(6)	Load integer constant 
176:     ST  3,-5(1)	Save left side 
177:    LDC  3,33(6)	Load integer constant 
178:     LD  4,-5(1)	Load left into ac1 
179:    MUL  3,4,3	Op * 
180:     LD  4,-4(1)	Load left into ac1 
181:    ADD  3,4,3	Op + 
182:     ST  3,0(0)	Store variable g
183:    LDC  3,8(6)	load size of array h
184:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-79(7)	Jump to main 
187:   HALT  0,0,0	DONE! 
* END INIT
