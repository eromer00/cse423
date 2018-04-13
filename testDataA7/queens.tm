* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  queens.c-
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
* FUNCTION printboard
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable i
* WHILE
 45:     LD  3,-3(1)	Load variable i
 46:     ST  3,-4(1)	Save left side 
 47:     LD  3,-78(0)	Load variable n
 48:     LD  4,-4(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-2(1)	Load address of base of array col
 54:     ST  3,-6(1)	Save left side 
 55:     LD  3,-3(1)	Load variable i
 56:     LD  4,-6(1)	Load left into ac1 
 57:    SUB  3,4,3	compute location from index 
 58:     LD  3,0(3)	Load array element 
 59:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-4(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 64:     LD  3,-3(1)	load lhs variable i
 65:    LDA  3,1(3)	increment value of i
 66:     ST  3,-3(1)	Store variable i
* END COMPOUND
 67:    LDA  7,-23(7)	go to beginning of loop 
 51:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 68:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 69:    LDA  1,-4(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-35(7)	CALL outnl
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 73:     LD  3,-79(0)	load lhs variable count
 74:    LDA  3,1(3)	increment value of count
 75:     ST  3,-79(0)	Store variable count
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END FUNCTION printboard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION try
 80:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
 81:     LD  3,-2(1)	Load variable c
 82:     ST  3,-4(1)	Save left side 
 83:     LD  3,-78(0)	Load variable n
 84:     LD  4,-4(1)	Load left into ac1 
 85:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  printboard
 87:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDA  3,-14(0)	Load address of base of array col
 89:     ST  3,-6(1)	Store parameter 
*                       Jump to printboard
 90:    LDA  1,-4(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL printboard
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
 86:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
 95:    LDC  3,0(6)	Load integer constant 
 96:     ST  3,-3(1)	Store variable r
* WHILE
 97:     LD  3,-3(1)	Load variable r
 98:     ST  3,-4(1)	Save left side 
 99:     LD  3,-78(0)	Load variable n
100:     LD  4,-4(1)	Load left into ac1 
101:    TLT  3,4,3	Op < 
102:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
104:    LDA  3,-1(0)	Load address of base of array row
105:     ST  3,-4(1)	Save left side 
106:     LD  3,-3(1)	Load variable r
107:     LD  4,-4(1)	Load left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
110:     ST  3,-4(1)	Save left side 
111:    LDC  3,0(6)	Load integer constant 
112:     LD  4,-4(1)	Load left into ac1 
113:    TEQ  3,4,3	Op == 
114:     ST  3,-4(1)	Save left side 
115:    LDA  3,-27(0)	Load address of base of array diagone
116:     ST  3,-5(1)	Save left side 
117:     LD  3,-3(1)	Load variable r
118:     ST  3,-6(1)	Save left side 
119:     LD  3,-2(1)	Load variable c
120:     LD  4,-6(1)	Load left into ac1 
121:    ADD  3,4,3	Op + 
122:     LD  4,-5(1)	Load left into ac1 
123:    SUB  3,4,3	compute location from index 
124:     LD  3,0(3)	Load array element 
125:     ST  3,-5(1)	Save left side 
126:    LDC  3,0(6)	Load integer constant 
127:     LD  4,-5(1)	Load left into ac1 
128:    TEQ  3,4,3	Op == 
129:     LD  4,-4(1)	Load left into ac1 
130:    AND  3,4,3	Op AND 
131:     ST  3,-4(1)	Save left side 
132:    LDA  3,-53(0)	Load address of base of array diagtwo
133:     ST  3,-5(1)	Save left side 
134:     LD  3,-3(1)	Load variable r
135:     ST  3,-6(1)	Save left side 
136:     LD  3,-78(0)	Load variable n
137:     ST  3,-7(1)	Save left side 
138:    LDC  3,1(6)	Load integer constant 
139:     LD  4,-7(1)	Load left into ac1 
140:    SUB  3,4,3	Op - 
141:     LD  4,-6(1)	Load left into ac1 
142:    ADD  3,4,3	Op + 
143:     ST  3,-6(1)	Save left side 
144:     LD  3,-2(1)	Load variable c
145:     LD  4,-6(1)	Load left into ac1 
146:    SUB  3,4,3	Op - 
147:     LD  4,-5(1)	Load left into ac1 
148:    SUB  3,4,3	compute location from index 
149:     LD  3,0(3)	Load array element 
150:     ST  3,-5(1)	Save left side 
151:    LDC  3,0(6)	Load integer constant 
152:     LD  4,-5(1)	Load left into ac1 
153:    TEQ  3,4,3	Op == 
154:     LD  4,-4(1)	Load left into ac1 
155:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
157:     LD  3,-3(1)	Load variable r
158:     ST  3,-4(1)	Save index 
159:    LDC  3,1(6)	Load integer constant 
160:     LD  4,-4(1)	Restore index 
161:    LDA  5,-1(0)	Load address of base of array row
162:    SUB  5,5,4	Compute offset of value 
163:     ST  3,0(5)	Store variable row
* EXPRESSION
164:     LD  3,-2(1)	Load variable c
165:     ST  3,-4(1)	Save index 
166:     LD  3,-3(1)	Load variable r
167:     LD  4,-4(1)	Restore index 
168:    LDA  5,-14(0)	Load address of base of array col
169:    SUB  5,5,4	Compute offset of value 
170:     ST  3,0(5)	Store variable col
* EXPRESSION
171:     LD  3,-3(1)	Load variable r
172:     ST  3,-4(1)	Save left side 
173:     LD  3,-2(1)	Load variable c
174:     LD  4,-4(1)	Load left into ac1 
175:    ADD  3,4,3	Op + 
176:     ST  3,-4(1)	Save index 
177:    LDC  3,1(6)	Load integer constant 
178:     LD  4,-4(1)	Restore index 
179:    LDA  5,-27(0)	Load address of base of array diagone
180:    SUB  5,5,4	Compute offset of value 
181:     ST  3,0(5)	Store variable diagone
* EXPRESSION
182:     LD  3,-3(1)	Load variable r
183:     ST  3,-4(1)	Save left side 
184:     LD  3,-78(0)	Load variable n
185:     ST  3,-5(1)	Save left side 
186:    LDC  3,1(6)	Load integer constant 
187:     LD  4,-5(1)	Load left into ac1 
188:    SUB  3,4,3	Op - 
189:     LD  4,-4(1)	Load left into ac1 
190:    ADD  3,4,3	Op + 
191:     ST  3,-4(1)	Save left side 
192:     LD  3,-2(1)	Load variable c
193:     LD  4,-4(1)	Load left into ac1 
194:    SUB  3,4,3	Op - 
195:     ST  3,-4(1)	Save index 
196:    LDC  3,1(6)	Load integer constant 
197:     LD  4,-4(1)	Restore index 
198:    LDA  5,-53(0)	Load address of base of array diagtwo
199:    SUB  5,5,4	Compute offset of value 
200:     ST  3,0(5)	Store variable diagtwo
* EXPRESSION
*                       Begin call to  try
201:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
202:     LD  3,-2(1)	Load variable c
203:     ST  3,-6(1)	Save left side 
204:    LDC  3,1(6)	Load integer constant 
205:     LD  4,-6(1)	Load left into ac1 
206:    ADD  3,4,3	Op + 
207:     ST  3,-6(1)	Store parameter 
*                       Jump to try
208:    LDA  1,-4(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-131(7)	CALL try
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to try
* EXPRESSION
212:     LD  3,-3(1)	Load variable r
213:     ST  3,-4(1)	Save index 
214:    LDC  3,0(6)	Load integer constant 
215:     LD  4,-4(1)	Restore index 
216:    LDA  5,-1(0)	Load address of base of array row
217:    SUB  5,5,4	Compute offset of value 
218:     ST  3,0(5)	Store variable row
* EXPRESSION
219:     LD  3,-3(1)	Load variable r
220:     ST  3,-4(1)	Save left side 
221:     LD  3,-2(1)	Load variable c
222:     LD  4,-4(1)	Load left into ac1 
223:    ADD  3,4,3	Op + 
224:     ST  3,-4(1)	Save index 
225:    LDC  3,0(6)	Load integer constant 
226:     LD  4,-4(1)	Restore index 
227:    LDA  5,-27(0)	Load address of base of array diagone
228:    SUB  5,5,4	Compute offset of value 
229:     ST  3,0(5)	Store variable diagone
* EXPRESSION
230:     LD  3,-3(1)	Load variable r
231:     ST  3,-4(1)	Save left side 
232:     LD  3,-78(0)	Load variable n
233:     ST  3,-5(1)	Save left side 
234:    LDC  3,1(6)	Load integer constant 
235:     LD  4,-5(1)	Load left into ac1 
236:    SUB  3,4,3	Op - 
237:     LD  4,-4(1)	Load left into ac1 
238:    ADD  3,4,3	Op + 
239:     ST  3,-4(1)	Save left side 
240:     LD  3,-2(1)	Load variable c
241:     LD  4,-4(1)	Load left into ac1 
242:    SUB  3,4,3	Op - 
243:     ST  3,-4(1)	Save index 
244:    LDC  3,0(6)	Load integer constant 
245:     LD  4,-4(1)	Restore index 
246:    LDA  5,-53(0)	Load address of base of array diagtwo
247:    SUB  5,5,4	Compute offset of value 
248:     ST  3,0(5)	Store variable diagtwo
* END COMPOUND
156:    JZR  3,92(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
249:     LD  3,-3(1)	load lhs variable r
250:    LDA  3,1(3)	increment value of r
251:     ST  3,-3(1)	Store variable r
* END COMPOUND
252:    LDA  7,-156(7)	go to beginning of loop 
103:    LDA  7,149(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
 94:    LDA  7,158(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
253:    LDC  2,0(6)	Set return value to 0 
254:     LD  3,-1(1)	Load return address 
255:     LD  1,0(1)	Adjust fp 
256:    LDA  7,0(3)	Return 
* END FUNCTION try
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION solve
257:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
258:     LD  3,-2(1)	Load variable num
259:     ST  3,-78(0)	Store variable n
* EXPRESSION
260:    LDC  3,0(6)	Load integer constant 
261:     ST  3,-79(0)	Store variable count
* EXPRESSION
*                       Begin call to  try
262:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
263:    LDC  3,0(6)	Load integer constant 
264:     ST  3,-5(1)	Store parameter 
*                       Jump to try
265:    LDA  1,-3(1)	Load address of new frame 
266:    LDA  3,1(7)	Return address in ac 
267:    LDA  7,-188(7)	CALL try
268:    LDA  3,0(2)	Save the result in ac 
*                       End call to try
* RETURN
269:     LD  3,-79(0)	Load variable count
270:    LDA  2,0(3)	Copy result to rt register 
271:     LD  3,-1(1)	Load return address 
272:     LD  1,0(1)	Adjust fp 
273:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
274:    LDC  2,0(6)	Set return value to 0 
275:     LD  3,-1(1)	Load return address 
276:     LD  1,0(1)	Adjust fp 
277:    LDA  7,0(3)	Return 
* END FUNCTION solve
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
278:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* WHILE
*                       Begin call to  input
279:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
280:    LDA  1,-3(1)	Load address of new frame 
281:    LDA  3,1(7)	Return address in ac 
282:    LDA  7,-282(7)	CALL input
283:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
284:     ST  3,-2(1)	Store variable num
285:     ST  3,-3(1)	Save left side 
286:    LDC  3,0(6)	Load integer constant 
287:     LD  4,-3(1)	Load left into ac1 
288:    TGT  3,4,3	Op > 
289:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
291:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  solve
292:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
293:     LD  3,-2(1)	Load variable num
294:     ST  3,-7(1)	Store parameter 
*                       Jump to solve
295:    LDA  1,-5(1)	Load address of new frame 
296:    LDA  3,1(7)	Return address in ac 
297:    LDA  7,-41(7)	CALL solve
298:    LDA  3,0(2)	Save the result in ac 
*                       End call to solve
299:     ST  3,-5(1)	Store parameter 
*                       Jump to output
300:    LDA  1,-3(1)	Load address of new frame 
301:    LDA  3,1(7)	Return address in ac 
302:    LDA  7,-297(7)	CALL output
303:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
304:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
305:    LDA  1,-3(1)	Load address of new frame 
306:    LDA  3,1(7)	Return address in ac 
307:    LDA  7,-271(7)	CALL outnl
308:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
309:    LDA  7,-31(7)	go to beginning of loop 
290:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
310:    LDC  2,0(6)	Set return value to 0 
311:     LD  3,-1(1)	Load return address 
312:     LD  1,0(1)	Adjust fp 
313:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,313(7)	Jump to init [backpatch] 
* INIT
314:     LD  0,0(0)	Set the global pointer 
315:    LDA  1,-80(0)	set first frame at end of globals 
316:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
317:    LDC  3,12(6)	load size of array col
318:     ST  3,-13(0)	save size of array col
319:    LDC  3,25(6)	load size of array diagone
320:     ST  3,-26(0)	save size of array diagone
321:    LDC  3,25(6)	load size of array diagtwo
322:     ST  3,-52(0)	save size of array diagtwo
323:    LDC  3,12(6)	load size of array row
324:     ST  3,0(0)	save size of array row
* END INIT GLOBALS AND STATICS
325:    LDA  3,1(7)	Return address in ac 
326:    LDA  7,-49(7)	Jump to main 
327:   HALT  0,0,0	DONE! 
* END INIT
