* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  exp3.c-
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
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
 45:    LDC  3,10(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable frodo
* EXPRESSION
 47:    LDC  3,100(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable sam
* EXPRESSION
 49:    LDC  3,1000(6)	Load integer constant 
 50:     ST  3,-5(1)	Store variable merry
* EXPRESSION
 51:    LDC  3,10000(6)	Load integer constant 
 52:     ST  3,-6(1)	Store variable pippin
* EXPRESSION
 53:     LD  3,-3(1)	Load variable bilbo
 54:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
*                       Begin call to  output
 55:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 56:     LD  3,-3(1)	Load variable bilbo
 57:     ST  3,-10(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-8(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-8(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 67:     LD  3,-3(1)	Load variable bilbo
 68:     ST  3,-8(1)	Save left side 
 69:    LDC  3,1(6)	Load integer constant 
 70:     LD  4,-8(1)	Load left into ac1 
 71:    ADD  3,4,3	Op + 
 72:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-3(1)	Load variable bilbo
 75:     ST  3,-10(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-8(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 80:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
 81:    LDA  1,-8(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-47(7)	CALL outnl
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 85:     LD  3,-2(1)	Load variable frodo
 86:     ST  3,-8(1)	Save left side 
 87:     LD  3,-3(1)	Load variable bilbo
 88:     ST  3,-9(1)	Save left side 
 89:     LD  3,-4(1)	Load variable sam
 90:     ST  3,-10(1)	Save left side 
 91:     LD  3,-5(1)	Load variable merry
 92:     ST  3,-11(1)	Save left side 
 93:     LD  3,-6(1)	Load variable pippin
 94:     LD  4,-11(1)	Load left into ac1 
 95:    MUL  3,4,3	Op * 
 96:     LD  4,-10(1)	Load left into ac1 
 97:    ADD  3,4,3	Op + 
 98:     LD  4,-9(1)	Load left into ac1 
 99:    MUL  3,4,3	Op * 
100:     LD  4,-8(1)	Load left into ac1 
101:    ADD  3,4,3	Op + 
102:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
*                       Begin call to  output
103:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
104:     LD  3,-3(1)	Load variable bilbo
105:     ST  3,-10(1)	Store parameter 
*                       Jump to output
106:    LDA  1,-8(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
110:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
111:    LDA  1,-8(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
115:     LD  3,-5(1)	Load variable merry
116:     ST  3,-8(1)	Save left side 
117:     LD  3,-6(1)	Load variable pippin
118:     LD  4,-8(1)	Load left into ac1 
119:    MUL  3,4,3	Op * 
120:     ST  3,-8(1)	Save left side 
121:     LD  3,-4(1)	Load variable sam
122:     LD  4,-8(1)	Load left into ac1 
123:    ADD  3,4,3	Op + 
124:     ST  3,-8(1)	Save left side 
125:     LD  3,-3(1)	Load variable bilbo
126:     LD  4,-8(1)	Load left into ac1 
127:    MUL  3,4,3	Op * 
128:     ST  3,-8(1)	Save left side 
129:     LD  3,-2(1)	Load variable frodo
130:     LD  4,-8(1)	Load left into ac1 
131:    ADD  3,4,3	Op + 
132:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
*                       Begin call to  output
133:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
134:     LD  3,-3(1)	Load variable bilbo
135:     ST  3,-10(1)	Store parameter 
*                       Jump to output
136:    LDA  1,-8(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
140:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
141:    LDA  1,-8(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-107(7)	CALL outnl
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
145:     LD  3,-3(1)	Load variable bilbo
146:     ST  3,-8(1)	Save left side 
147:     LD  3,-3(1)	Load variable bilbo
148:     ST  3,-9(1)	Save left side 
149:     LD  3,-3(1)	Load variable bilbo
150:     ST  3,-10(1)	Save left side 
151:     LD  3,-3(1)	Load variable bilbo
152:     ST  3,-11(1)	Save left side 
153:     LD  3,-3(1)	Load variable bilbo
154:     ST  3,-12(1)	Save left side 
155:     LD  3,-3(1)	Load variable bilbo
156:     LD  4,-12(1)	Load left into ac1 
157:    ADD  3,4,3	Op + 
158:     LD  4,-11(1)	Load left into ac1 
159:    SUB  3,4,3	Op - 
160:     LD  4,-10(1)	Load left into ac1 
161:    ADD  3,4,3	Op + 
162:     LD  4,-9(1)	Load left into ac1 
163:    SUB  3,4,3	Op - 
164:     LD  4,-8(1)	Load left into ac1 
165:    ADD  3,4,3	Op + 
166:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
*                       Begin call to  output
167:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
168:     LD  3,-3(1)	Load variable bilbo
169:     ST  3,-10(1)	Store parameter 
*                       Jump to output
170:    LDA  1,-8(1)	Load address of new frame 
171:    LDA  3,1(7)	Return address in ac 
172:    LDA  7,-167(7)	CALL output
173:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
174:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
175:    LDA  1,-8(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-141(7)	CALL outnl
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
179:    LDC  3,1(6)	Load Boolean constant 
180:     ST  3,-7(1)	Store variable arwen
* EXPRESSION
*                       Begin call to  output
181:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
182:     LD  3,-5(1)	Load variable merry
183:    LDC  4,0(6)	Load 0 
184:    SUB  3,4,3	Op unary - 
185:     ST  3,-10(1)	Save left side 
186:     LD  3,-4(1)	Load variable sam
187:    LDC  4,0(6)	Load 0 
188:    SUB  3,4,3	Op unary - 
189:     LD  4,-10(1)	Load left into ac1 
190:    MUL  3,4,3	Op * 
191:     ST  3,-10(1)	Save left side 
192:     LD  3,-6(1)	Load variable pippin
193:     LD  4,-10(1)	Load left into ac1 
194:    ADD  3,4,3	Op + 
195:     ST  3,-10(1)	Store parameter 
*                       Jump to output
196:    LDA  1,-8(1)	Load address of new frame 
197:    LDA  3,1(7)	Return address in ac 
198:    LDA  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
200:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
201:     LD  3,-3(1)	Load variable bilbo
202:     ST  3,-10(1)	Save left side 
203:     LD  3,-2(1)	Load variable frodo
204:     ST  3,-11(1)	Save left side 
205:     LD  3,-2(1)	Load variable frodo
206:    LDC  4,0(6)	Load 0 
207:    SUB  3,4,3	Op unary - 
208:     LD  4,-11(1)	Load left into ac1 
209:    MUL  3,4,3	Op * 
210:     LD  4,-10(1)	Load left into ac1 
211:    ADD  3,4,3	Op + 
212:     ST  3,-10(1)	Store parameter 
*                       Jump to output
213:    LDA  1,-8(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
217:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
218:    LDC  3,0(6)	Load Boolean constant 
219:     ST  3,-10(1)	Save left side 
220:     LD  3,-7(1)	Load variable arwen
221:     ST  3,-11(1)	Save left side 
222:    LDC  3,0(6)	Load Boolean constant 
223:    LDC  4,1(6)	Load 1 
224:    XOR  3,3,4	Op NOT 
225:     LD  4,-11(1)	Load left into ac1 
226:    AND  3,4,3	Op AND 
227:     LD  4,-10(1)	Load left into ac1 
228:     OR  3,4,3	Op OR 
229:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
230:    LDA  1,-8(1)	Load address of new frame 
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-215(7)	CALL outputb
233:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
234:    LDC  3,0(6)	Load Boolean constant 
235:     ST  3,-8(1)	Save left side 
236:     LD  3,-7(1)	Load variable arwen
237:     ST  3,-9(1)	Save left side 
238:     LD  3,-5(1)	Load variable merry
239:    LDC  4,0(6)	Load 0 
240:    SUB  3,4,3	Op unary - 
241:     ST  3,-10(1)	Save left side 
242:     LD  3,-4(1)	Load variable sam
243:    LDC  4,0(6)	Load 0 
244:    SUB  3,4,3	Op unary - 
245:     LD  4,-10(1)	Load left into ac1 
246:    MUL  3,4,3	Op * 
247:     ST  3,-10(1)	Save left side 
248:     LD  3,-6(1)	Load variable pippin
249:     LD  4,-10(1)	Load left into ac1 
250:    ADD  3,4,3	Op + 
251:     ST  3,-10(1)	Save left side 
252:     LD  3,-3(1)	Load variable bilbo
253:     ST  3,-11(1)	Save left side 
254:     LD  3,-2(1)	Load variable frodo
255:     ST  3,-12(1)	Save left side 
256:     LD  3,-2(1)	Load variable frodo
257:    LDC  4,0(6)	Load 0 
258:    SUB  3,4,3	Op unary - 
259:     LD  4,-12(1)	Load left into ac1 
260:    MUL  3,4,3	Op * 
261:     LD  4,-11(1)	Load left into ac1 
262:    ADD  3,4,3	Op + 
263:     LD  4,-10(1)	Load left into ac1 
264:    TGE  3,4,3	Op >= 
265:    LDC  4,1(6)	Load 1 
266:    XOR  3,3,4	Op NOT 
267:     LD  4,-9(1)	Load left into ac1 
268:    AND  3,4,3	Op AND 
269:     LD  4,-8(1)	Load left into ac1 
270:     OR  3,4,3	Op OR 
271:     ST  3,-7(1)	Store variable arwen
* EXPRESSION
*                       Begin call to  outputb
272:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
273:     LD  3,-7(1)	Load variable arwen
274:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
275:    LDA  1,-8(1)	Load address of new frame 
276:    LDA  3,1(7)	Return address in ac 
277:    LDA  7,-260(7)	CALL outputb
278:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
279:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
280:    LDA  1,-8(1)	Load address of new frame 
281:    LDA  3,1(7)	Return address in ac 
282:    LDA  7,-246(7)	CALL outnl
283:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
284:    LDC  2,0(6)	Set return value to 0 
285:     LD  3,-1(1)	Load return address 
286:     LD  1,0(1)	Adjust fp 
287:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,287(7)	Jump to init [backpatch] 
* INIT
288:     LD  0,0(0)	Set the global pointer 
289:    LDA  1,0(0)	set first frame at end of globals 
290:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
291:    LDA  3,1(7)	Return address in ac 
292:    LDA  7,-251(7)	Jump to main 
293:   HALT  0,0,0	DONE! 
* END INIT
