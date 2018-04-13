* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  arraysize.c-
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
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-2(1)	Load address of base of array x
 61:     ST  3,-20(1)	Save left side 
 62:    LDC  3,0(6)	Load integer constant 
 63:     LD  4,-20(1)	Load left into ac1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
 66:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 67:    LDA  1,-18(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 71:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 72:     LD  3,-2(1)	Load address of base of array x
 73:     LD  3,1(3)	Load array size 
 74:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-18(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 80:    LDA  3,-1(0)	Load address of base of array g
 81:     ST  3,-20(1)	Save left side 
 82:    LDC  3,0(6)	Load integer constant 
 83:     LD  4,-20(1)	Load left into ac1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
 86:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 87:    LDA  1,-18(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 91:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 92:    LDA  3,-1(0)	Load address of base of array g
 93:     ST  3,-20(1)	Save left side 
 94:    LDC  3,1(6)	Load integer constant 
 95:    LDC  4,0(6)	Load 0 
 96:    SUB  3,4,3	Op unary - 
 97:     LD  4,-20(1)	Load left into ac1 
 98:    SUB  3,4,3	compute location from index 
 99:     LD  3,0(3)	Load array element 
100:     ST  3,-20(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-18(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
105:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
106:    LDA  1,-18(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-72(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
110:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
111:    LDA  3,-5(1)	Load address of base of array y
112:     ST  3,-20(1)	Save left side 
113:    LDC  3,0(6)	Load integer constant 
114:     LD  4,-20(1)	Load left into ac1 
115:    SUB  3,4,3	compute location from index 
116:     LD  3,0(3)	Load array element 
117:     ST  3,-20(1)	Store parameter 
*                       Jump to output
118:    LDA  1,-18(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
122:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
123:    LDA  3,-5(1)	Load address of base of array y
124:     LD  3,1(3)	Load array size 
125:     ST  3,-20(1)	Store parameter 
*                       Jump to output
126:    LDA  1,-18(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
130:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
131:    LDA  1,-18(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-97(7)	CALL outnl
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
135:    LDC  2,0(6)	Set return value to 0 
136:     LD  3,-1(1)	Load return address 
137:     LD  1,0(1)	Adjust fp 
138:    LDA  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
139:     ST  3,-1(1)	Store return address. 
* COMPOUND
140:    LDC  3,11(6)	load size of array m
141:     ST  3,-2(1)	save size of array m
* Compound Body
* EXPRESSION
142:    LDC  3,0(6)	Load integer constant 
143:     ST  3,-14(1)	Save index 
144:    LDC  3,777(6)	Load integer constant 
145:     LD  4,-14(1)	Restore index 
146:    LDA  5,-3(1)	Load address of base of array m
147:    SUB  5,5,4	Compute offset of value 
148:     ST  3,0(5)	Store variable m
* EXPRESSION
*                       Begin call to  output
149:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
150:    LDA  3,-3(1)	Load address of base of array m
151:     ST  3,-16(1)	Save left side 
152:    LDC  3,0(6)	Load integer constant 
153:     LD  4,-16(1)	Load left into ac1 
154:    SUB  3,4,3	compute location from index 
155:     LD  3,0(3)	Load array element 
156:     ST  3,-16(1)	Store parameter 
*                       Jump to output
157:    LDA  1,-14(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-154(7)	CALL output
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
161:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDA  3,-3(1)	Load address of base of array m
163:     LD  3,1(3)	Load array size 
164:     ST  3,-16(1)	Store parameter 
*                       Jump to output
165:    LDA  1,-14(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
169:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
170:    LDA  3,-1(0)	Load address of base of array g
171:     ST  3,-16(1)	Save left side 
172:    LDC  3,0(6)	Load integer constant 
173:     LD  4,-16(1)	Load left into ac1 
174:    SUB  3,4,3	compute location from index 
175:     LD  3,0(3)	Load array element 
176:     ST  3,-16(1)	Store parameter 
*                       Jump to output
177:    LDA  1,-14(1)	Load address of new frame 
178:    LDA  3,1(7)	Return address in ac 
179:    LDA  7,-174(7)	CALL output
180:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
181:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
182:    LDA  3,-1(0)	Load address of base of array g
183:     LD  3,1(3)	Load array size 
184:     ST  3,-16(1)	Store parameter 
*                       Jump to output
185:    LDA  1,-14(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-182(7)	CALL output
188:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
189:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
190:    LDA  1,-14(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-156(7)	CALL outnl
193:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  ford
194:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
195:    LDA  3,-3(1)	Load address of base of array m
196:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
197:    LDA  1,-14(1)	Load address of new frame 
198:    LDA  3,1(7)	Return address in ac 
199:    LDA  7,-158(7)	CALL ford
200:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  ford
201:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
202:    LDA  3,-1(0)	Load address of base of array g
203:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
204:    LDA  1,-14(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-165(7)	CALL ford
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  output
208:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
209:    LDA  3,-3(1)	Load address of base of array m
210:     LD  3,1(3)	Load array size 
211:     ST  3,-16(1)	Save left side 
212:    LDA  3,-1(0)	Load address of base of array g
213:     LD  3,1(3)	Load array size 
214:     LD  4,-16(1)	Load left into ac1 
215:    MUL  3,4,3	Op * 
216:     ST  3,-16(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-14(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
221:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
222:    LDA  1,-14(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
226:    LDC  2,0(6)	Set return value to 0 
227:     LD  3,-1(1)	Load return address 
228:     LD  1,0(1)	Adjust fp 
229:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,229(7)	Jump to init [backpatch] 
* INIT
230:     LD  0,0(0)	Set the global pointer 
231:    LDA  1,-37(0)	set first frame at end of globals 
232:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
233:    LDC  3,12(6)	load size of array g
234:     ST  3,0(0)	save size of array g
235:    LDC  3,23(6)	load size of array h
236:     ST  3,-13(0)	save size of array h
* END INIT GLOBALS AND STATICS
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-100(7)	Jump to main 
239:   HALT  0,0,0	DONE! 
* END INIT
