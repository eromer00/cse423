* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  inc.c-
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
 43:    LDC  3,1(6)	load size of array z
 44:     ST  3,-3(1)	save size of array z
* Compound Body
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDC  3,0(6)	Load integer constant 
 47:     LD  5,-2(1)	Load address of base of array y
 48:    SUB  5,5,3	Compute offset of value 
 49:     LD  3,0(5)	load lhs variable y
 50:    LDA  3,1(3)	increment value of y
 51:     ST  3,0(5)	Store variable y
 52:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 53:    LDA  1,-6(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-50(7)	CALL output
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 57:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 58:     LD  3,-2(1)	Load address of base of array y
 59:     ST  3,-8(1)	Save left side 
 60:    LDC  3,0(6)	Load integer constant 
 61:     LD  4,-8(1)	Load left into ac1 
 62:    SUB  3,4,3	compute location from index 
 63:     LD  3,0(3)	Load array element 
 64:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 65:    LDA  1,-6(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 69:    LDC  3,777(6)	Load integer constant 
 70:     ST  3,-5(1)	Store variable w
* EXPRESSION
 71:    LDC  3,0(6)	Load integer constant 
 72:     ST  3,-6(1)	Save index 
 73:    LDC  3,888(6)	Load integer constant 
 74:     LD  4,-6(1)	Restore index 
 75:    LDA  5,-4(1)	Load address of base of array z
 76:    SUB  5,5,4	Compute offset of value 
 77:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  output
 78:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 79:     LD  3,-5(1)	load lhs variable w
 80:    LDA  3,1(3)	increment value of w
 81:     ST  3,-5(1)	Store variable w
 82:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-6(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-5(1)	Load variable w
 89:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-6(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 94:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 95:    LDC  3,0(6)	Load integer constant 
 96:    LDA  5,-4(1)	Load address of base of array z
 97:    SUB  5,5,3	Compute offset of value 
 98:     LD  3,0(5)	load lhs variable z
 99:    LDA  3,1(3)	increment value of z
100:     ST  3,0(5)	Store variable z
101:     ST  3,-8(1)	Store parameter 
*                       Jump to output
102:    LDA  1,-6(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
106:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
107:    LDA  3,-4(1)	Load address of base of array z
108:     ST  3,-8(1)	Save left side 
109:    LDC  3,0(6)	Load integer constant 
110:     LD  4,-8(1)	Load left into ac1 
111:    SUB  3,4,3	compute location from index 
112:     LD  3,0(3)	Load array element 
113:     ST  3,-8(1)	Store parameter 
*                       Jump to output
114:    LDA  1,-6(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
118:    LDC  3,1023(6)	Load integer constant 
119:     ST  3,0(0)	Store variable g
* EXPRESSION
120:     LD  3,0(0)	load lhs variable g
121:    LDA  3,1(3)	increment value of g
122:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
123:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
124:     LD  3,0(0)	Load variable g
125:     ST  3,-8(1)	Store parameter 
*                       Jump to output
126:    LDA  1,-6(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,0(0)	load lhs variable g
132:    LDA  3,1(3)	increment value of g
133:     ST  3,0(0)	Store variable g
134:     ST  3,-8(1)	Store parameter 
*                       Jump to output
135:    LDA  1,-6(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
139:    LDC  2,0(6)	Set return value to 0 
140:     LD  3,-1(1)	Load return address 
141:     LD  1,0(1)	Adjust fp 
142:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
143:     ST  3,-1(1)	Store return address. 
* COMPOUND
144:    LDC  3,1(6)	load size of array x
145:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
146:    LDC  3,0(6)	Load integer constant 
147:     ST  3,-5(1)	Save index 
148:    LDC  3,666(6)	Load integer constant 
149:     LD  4,-5(1)	Restore index 
150:    LDA  5,-3(1)	Load address of base of array x
151:    SUB  5,5,4	Compute offset of value 
152:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
153:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDA  3,-3(1)	Load address of base of array x
155:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
156:    LDA  1,-5(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-117(7)	CALL cat
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  output
160:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
161:    LDA  3,-3(1)	Load address of base of array x
162:     ST  3,-7(1)	Save left side 
163:    LDC  3,0(6)	Load integer constant 
164:     LD  4,-7(1)	Load left into ac1 
165:    SUB  3,4,3	compute location from index 
166:     LD  3,0(3)	Load array element 
167:     ST  3,-7(1)	Store parameter 
*                       Jump to output
168:    LDA  1,-5(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
172:    LDC  3,1023(6)	Load integer constant 
173:     ST  3,-4(1)	Store variable s
* EXPRESSION
174:     LD  3,-4(1)	load lhs variable s
175:    LDA  3,1(3)	increment value of s
176:     ST  3,-4(1)	Store variable s
* EXPRESSION
*                       Begin call to  output
177:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
178:     LD  3,-4(1)	Load variable s
179:     ST  3,-7(1)	Store parameter 
*                       Jump to output
180:    LDA  1,-5(1)	Load address of new frame 
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-177(7)	CALL output
183:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
184:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
185:     LD  3,-4(1)	load lhs variable s
186:    LDA  3,1(3)	increment value of s
187:     ST  3,-4(1)	Store variable s
188:     ST  3,-7(1)	Store parameter 
*                       Jump to output
189:    LDA  1,-5(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
193:    LDC  3,0(6)	Load integer constant 
194:    LDA  2,0(3)	Copy result to rt register 
195:     LD  3,-1(1)	Load return address 
196:     LD  1,0(1)	Adjust fp 
197:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
198:    LDC  2,0(6)	Set return value to 0 
199:     LD  3,-1(1)	Load return address 
200:     LD  1,0(1)	Adjust fp 
201:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,201(7)	Jump to init [backpatch] 
* INIT
202:     LD  0,0(0)	Set the global pointer 
203:    LDA  1,-1(0)	set first frame at end of globals 
204:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-64(7)	Jump to main 
207:   HALT  0,0,0	DONE! 
* END INIT
