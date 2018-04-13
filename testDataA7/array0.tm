* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  array0.c-
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
* FUNCTION show
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load address of base of array z
 45:     ST  3,-6(1)	Save left side 
 46:     LD  3,-3(1)	Load variable n
 47:     LD  4,-6(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-4(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
 55:     LD  3,-2(1)	Load address of base of array z
 56:     ST  3,-4(1)	Save left side 
 57:     LD  3,-3(1)	Load variable n
 58:     LD  4,-4(1)	Load left into ac1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
 61:    LDA  2,0(3)	Copy result to rt register 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    LDA  7,0(3)	Return 
* END FUNCTION show
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 69:     ST  3,-1(1)	Store return address. 
* COMPOUND
 70:    LDC  3,4(6)	load size of array a
 71:     ST  3,-2(1)	save size of array a
* Compound Body
* EXPRESSION
 72:    LDC  3,1(6)	Load integer constant 
 73:     ST  3,-7(1)	Save index 
 74:    LDC  3,666(6)	Load integer constant 
 75:     LD  4,-7(1)	Restore index 
 76:    LDA  5,-1(0)	Load address of base of array g
 77:    SUB  5,5,4	Compute offset of value 
 78:     ST  3,0(5)	Store variable g
* EXPRESSION
 79:    LDC  3,1(6)	Load integer constant 
 80:     ST  3,-7(1)	Save index 
 81:    LDC  3,777(6)	Load integer constant 
 82:     LD  4,-7(1)	Restore index 
 83:    LDA  5,-3(1)	Load address of base of array a
 84:    SUB  5,5,4	Compute offset of value 
 85:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  output
 86:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 87:    LDA  3,-3(1)	Load address of base of array a
 88:     ST  3,-9(1)	Save left side 
 89:    LDC  3,1(6)	Load integer constant 
 90:     LD  4,-9(1)	Load left into ac1 
 91:    SUB  3,4,3	compute location from index 
 92:     LD  3,0(3)	Load array element 
 93:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 94:    LDA  1,-7(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 98:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 99:    LDA  3,-1(0)	Load address of base of array g
100:     ST  3,-9(1)	Save left side 
101:    LDC  3,1(6)	Load integer constant 
102:     LD  4,-9(1)	Load left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-9(1)	Store parameter 
*                       Jump to output
106:    LDA  1,-7(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
110:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
111:    LDA  1,-7(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  show
115:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
116:    LDA  3,-3(1)	Load address of base of array a
117:     ST  3,-9(1)	Store parameter 
*                       Load param 2
118:    LDC  3,1(6)	Load integer constant 
119:     ST  3,-10(1)	Store parameter 
*                       Jump to show
120:    LDA  1,-7(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-81(7)	CALL show
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
* EXPRESSION
*                       Begin call to  show
124:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
125:    LDA  3,-1(0)	Load address of base of array g
126:     ST  3,-9(1)	Store parameter 
*                       Load param 2
127:    LDC  3,1(6)	Load integer constant 
128:     ST  3,-10(1)	Store parameter 
*                       Jump to show
129:    LDA  1,-7(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-90(7)	CALL show
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
* EXPRESSION
*                       Begin call to  outnl
133:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
134:    LDA  1,-7(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-100(7)	CALL outnl
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
138:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  show
139:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
140:    LDA  3,-3(1)	Load address of base of array a
141:     ST  3,-11(1)	Store parameter 
*                       Load param 2
142:    LDC  3,1(6)	Load integer constant 
143:     ST  3,-12(1)	Store parameter 
*                       Jump to show
144:    LDA  1,-9(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-105(7)	CALL show
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
148:     ST  3,-9(1)	Store parameter 
*                       Jump to output
149:    LDA  1,-7(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
153:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  show
154:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
155:    LDA  3,-1(0)	Load address of base of array g
156:     ST  3,-11(1)	Store parameter 
*                       Load param 2
157:    LDC  3,1(6)	Load integer constant 
158:     ST  3,-12(1)	Store parameter 
*                       Jump to show
159:    LDA  1,-9(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-120(7)	CALL show
162:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
163:     ST  3,-9(1)	Store parameter 
*                       Jump to output
164:    LDA  1,-7(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-161(7)	CALL output
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
168:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
169:    LDA  1,-7(1)	Load address of new frame 
170:    LDA  3,1(7)	Return address in ac 
171:    LDA  7,-135(7)	CALL outnl
172:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
173:    LDC  3,1(6)	Load integer constant 
174:     ST  3,-7(1)	Save index 
175:    LDC  3,4(6)	Load integer constant 
176:     LD  4,-7(1)	Restore index 
177:    LDA  5,-1(0)	Load address of base of array g
178:    SUB  5,5,4	Compute offset of value 
179:     LD  4,0(5)	load lhs variable g
180:    ADD  3,4,3	op += 
181:     ST  3,0(5)	Store variable g
* EXPRESSION
182:    LDC  3,1(6)	Load integer constant 
183:     ST  3,-7(1)	Save index 
184:    LDC  3,3(6)	Load integer constant 
185:     LD  4,-7(1)	Restore index 
186:    LDA  5,-3(1)	Load address of base of array a
187:    SUB  5,5,4	Compute offset of value 
188:     LD  4,0(5)	load lhs variable a
189:    ADD  3,4,3	op += 
190:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  output
191:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
192:    LDA  3,-3(1)	Load address of base of array a
193:     ST  3,-9(1)	Save left side 
194:    LDC  3,1(6)	Load integer constant 
195:     LD  4,-9(1)	Load left into ac1 
196:    SUB  3,4,3	compute location from index 
197:     LD  3,0(3)	Load array element 
198:     ST  3,-9(1)	Store parameter 
*                       Jump to output
199:    LDA  1,-7(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
203:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
204:    LDA  3,-1(0)	Load address of base of array g
205:     ST  3,-9(1)	Save left side 
206:    LDC  3,1(6)	Load integer constant 
207:     LD  4,-9(1)	Load left into ac1 
208:    SUB  3,4,3	compute location from index 
209:     LD  3,0(3)	Load array element 
210:     ST  3,-9(1)	Store parameter 
*                       Jump to output
211:    LDA  1,-7(1)	Load address of new frame 
212:    LDA  3,1(7)	Return address in ac 
213:    LDA  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
215:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
216:    LDA  1,-7(1)	Load address of new frame 
217:    LDA  3,1(7)	Return address in ac 
218:    LDA  7,-182(7)	CALL outnl
219:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
220:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
221:    LDC  3,1(6)	Load integer constant 
222:     ST  3,-9(1)	Save index 
223:    LDC  3,100(6)	Load integer constant 
224:     LD  4,-9(1)	Restore index 
225:    LDA  5,-3(1)	Load address of base of array a
226:    SUB  5,5,4	Compute offset of value 
227:     LD  4,0(5)	load lhs variable a
228:    ADD  3,4,3	op += 
229:     ST  3,0(5)	Store variable a
230:     ST  3,-9(1)	Store parameter 
*                       Jump to output
231:    LDA  1,-7(1)	Load address of new frame 
232:    LDA  3,1(7)	Return address in ac 
233:    LDA  7,-228(7)	CALL output
234:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
235:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
236:    LDC  3,1(6)	Load integer constant 
237:     ST  3,-9(1)	Save index 
238:    LDC  3,100(6)	Load integer constant 
239:     LD  4,-9(1)	Restore index 
240:    LDA  5,-1(0)	Load address of base of array g
241:    SUB  5,5,4	Compute offset of value 
242:     LD  4,0(5)	load lhs variable g
243:    ADD  3,4,3	op += 
244:     ST  3,0(5)	Store variable g
245:     ST  3,-9(1)	Store parameter 
*                       Jump to output
246:    LDA  1,-7(1)	Load address of new frame 
247:    LDA  3,1(7)	Return address in ac 
248:    LDA  7,-243(7)	CALL output
249:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
250:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
251:    LDA  1,-7(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-217(7)	CALL outnl
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
255:    LDC  2,0(6)	Set return value to 0 
256:     LD  3,-1(1)	Load return address 
257:     LD  1,0(1)	Adjust fp 
258:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,258(7)	Jump to init [backpatch] 
* INIT
259:     LD  0,0(0)	Set the global pointer 
260:    LDA  1,-5(0)	set first frame at end of globals 
261:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
262:    LDC  3,4(6)	load size of array g
263:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-197(7)	Jump to main 
266:   HALT  0,0,0	DONE! 
* END INIT
