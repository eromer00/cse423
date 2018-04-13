* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  sudoku.c-
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
* FUNCTION initBoard
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,81(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 52:     LD  3,-2(1)	Load variable i
 53:     ST  3,-3(1)	Save index 
 54:    LDC  3,0(6)	Load integer constant 
 55:     LD  4,-3(1)	Restore index 
 56:    LDA  5,-1(0)	Load address of base of array board
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable board
* EXPRESSION
 59:     LD  3,-2(1)	Load variable i
 60:     ST  3,-3(1)	Save index 
 61:    LDC  3,0(6)	Load Boolean constant 
 62:     LD  4,-3(1)	Restore index 
 63:    LDA  5,-83(0)	Load address of base of array locked
 64:    SUB  5,5,4	Compute offset of value 
 65:     ST  3,0(5)	Store variable locked
* EXPRESSION
 66:     LD  3,-2(1)	load lhs variable i
 67:    LDA  3,1(3)	increment value of i
 68:     ST  3,-2(1)	Store variable i
* END COMPOUND
 69:    LDA  7,-25(7)	go to beginning of loop 
 51:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 70:    LDC  2,0(6)	Set return value to 0 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    LDA  7,0(3)	Return 
* END FUNCTION initBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION setValue
 74:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 75:     LD  3,-2(1)	Load variable row
 76:     ST  3,-5(1)	Save left side 
 77:    LDC  3,9(6)	Load integer constant 
 78:     LD  4,-5(1)	Load left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,-5(1)	Save left side 
 81:     LD  3,-3(1)	Load variable col
 82:     LD  4,-5(1)	Load left into ac1 
 83:    ADD  3,4,3	Op + 
 84:     ST  3,-5(1)	Save index 
 85:     LD  3,-4(1)	Load variable value
 86:     LD  4,-5(1)	Restore index 
 87:    LDA  5,-1(0)	Load address of base of array board
 88:    SUB  5,5,4	Compute offset of value 
 89:     ST  3,0(5)	Store variable board
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END FUNCTION setValue
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getValue
 94:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 95:    LDA  3,-1(0)	Load address of base of array board
 96:     ST  3,-4(1)	Save left side 
 97:     LD  3,-2(1)	Load variable row
 98:     ST  3,-5(1)	Save left side 
 99:    LDC  3,9(6)	Load integer constant 
100:     LD  4,-5(1)	Load left into ac1 
101:    MUL  3,4,3	Op * 
102:     ST  3,-5(1)	Save left side 
103:     LD  3,-3(1)	Load variable col
104:     LD  4,-5(1)	Load left into ac1 
105:    ADD  3,4,3	Op + 
106:     LD  4,-4(1)	Load left into ac1 
107:    SUB  3,4,3	compute location from index 
108:     LD  3,0(3)	Load array element 
109:    LDA  2,0(3)	Copy result to rt register 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    LDA  7,0(3)	Return 
* END FUNCTION getValue
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION setLocked
117:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
118:     LD  3,-2(1)	Load variable row
119:     ST  3,-5(1)	Save left side 
120:    LDC  3,9(6)	Load integer constant 
121:     LD  4,-5(1)	Load left into ac1 
122:    MUL  3,4,3	Op * 
123:     ST  3,-5(1)	Save left side 
124:     LD  3,-3(1)	Load variable col
125:     LD  4,-5(1)	Load left into ac1 
126:    ADD  3,4,3	Op + 
127:     ST  3,-5(1)	Save index 
128:     LD  3,-4(1)	Load variable value
129:     LD  4,-5(1)	Restore index 
130:    LDA  5,-83(0)	Load address of base of array locked
131:    SUB  5,5,4	Compute offset of value 
132:     ST  3,0(5)	Store variable locked
* END COMPOUND
* Add standard closing in case there is no return statement
133:    LDC  2,0(6)	Set return value to 0 
134:     LD  3,-1(1)	Load return address 
135:     LD  1,0(1)	Adjust fp 
136:    LDA  7,0(3)	Return 
* END FUNCTION setLocked
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getLocked
137:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
138:    LDA  3,-83(0)	Load address of base of array locked
139:     ST  3,-4(1)	Save left side 
140:     LD  3,-2(1)	Load variable row
141:     ST  3,-5(1)	Save left side 
142:    LDC  3,9(6)	Load integer constant 
143:     LD  4,-5(1)	Load left into ac1 
144:    MUL  3,4,3	Op * 
145:     ST  3,-5(1)	Save left side 
146:     LD  3,-3(1)	Load variable col
147:     LD  4,-5(1)	Load left into ac1 
148:    ADD  3,4,3	Op + 
149:     LD  4,-4(1)	Load left into ac1 
150:    SUB  3,4,3	compute location from index 
151:     LD  3,0(3)	Load array element 
152:    LDA  2,0(3)	Copy result to rt register 
153:     LD  3,-1(1)	Load return address 
154:     LD  1,0(1)	Adjust fp 
155:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
156:    LDC  2,0(6)	Set return value to 0 
157:     LD  3,-1(1)	Load return address 
158:     LD  1,0(1)	Adjust fp 
159:    LDA  7,0(3)	Return 
* END FUNCTION getLocked
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION isOkAt
160:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
161:    LDC  3,0(6)	Load integer constant 
162:     ST  3,-5(1)	Store variable i
* WHILE
163:     LD  3,-5(1)	Load variable i
164:     ST  3,-9(1)	Save left side 
165:    LDC  3,9(6)	Load integer constant 
166:     LD  4,-9(1)	Load left into ac1 
167:    TLT  3,4,3	Op < 
168:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  getValue
170:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
171:     LD  3,-5(1)	Load variable i
172:     ST  3,-11(1)	Store parameter 
*                       Load param 2
173:     LD  3,-3(1)	Load variable col
174:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
175:    LDA  1,-9(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-84(7)	CALL getValue
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
179:     ST  3,-9(1)	Save left side 
180:     LD  3,-4(1)	Load variable value
181:     LD  4,-9(1)	Load left into ac1 
182:    TEQ  3,4,3	Op == 
* THEN
* RETURN
184:    LDC  3,0(6)	Load Boolean constant 
185:    LDA  2,0(3)	Copy result to rt register 
186:     LD  3,-1(1)	Load return address 
187:     LD  1,0(1)	Adjust fp 
188:    LDA  7,0(3)	Return 
183:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
*                       Begin call to  getValue
189:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
190:     LD  3,-2(1)	Load variable row
191:     ST  3,-11(1)	Store parameter 
*                       Load param 2
192:     LD  3,-5(1)	Load variable i
193:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
194:    LDA  1,-9(1)	Load address of new frame 
195:    LDA  3,1(7)	Return address in ac 
196:    LDA  7,-103(7)	CALL getValue
197:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
198:     ST  3,-9(1)	Save left side 
199:     LD  3,-4(1)	Load variable value
200:     LD  4,-9(1)	Load left into ac1 
201:    TEQ  3,4,3	Op == 
* THEN
* RETURN
203:    LDC  3,0(6)	Load Boolean constant 
204:    LDA  2,0(3)	Copy result to rt register 
205:     LD  3,-1(1)	Load return address 
206:     LD  1,0(1)	Adjust fp 
207:    LDA  7,0(3)	Return 
202:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
208:     LD  3,-5(1)	load lhs variable i
209:    LDA  3,1(3)	increment value of i
210:     ST  3,-5(1)	Store variable i
* END COMPOUND
211:    LDA  7,-49(7)	go to beginning of loop 
169:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
212:     LD  3,-2(1)	Load variable row
213:     ST  3,-9(1)	Save left side 
214:    LDC  3,3(6)	Load integer constant 
215:     LD  4,-9(1)	Load left into ac1 
216:    DIV  3,4,3	Op / 
217:     ST  3,-9(1)	Save left side 
218:    LDC  3,3(6)	Load integer constant 
219:     LD  4,-9(1)	Load left into ac1 
220:    MUL  3,4,3	Op * 
221:     ST  3,-7(1)	Store variable boxRowStart
* EXPRESSION
222:     LD  3,-3(1)	Load variable col
223:     ST  3,-9(1)	Save left side 
224:    LDC  3,3(6)	Load integer constant 
225:     LD  4,-9(1)	Load left into ac1 
226:    DIV  3,4,3	Op / 
227:     ST  3,-9(1)	Save left side 
228:    LDC  3,3(6)	Load integer constant 
229:     LD  4,-9(1)	Load left into ac1 
230:    MUL  3,4,3	Op * 
231:     ST  3,-8(1)	Store variable boxColStart
* EXPRESSION
232:    LDC  3,0(6)	Load integer constant 
233:     ST  3,-5(1)	Store variable i
* WHILE
234:     LD  3,-5(1)	Load variable i
235:     ST  3,-9(1)	Save left side 
236:    LDC  3,3(6)	Load integer constant 
237:     LD  4,-9(1)	Load left into ac1 
238:    TLT  3,4,3	Op < 
239:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
241:    LDC  3,0(6)	Load integer constant 
242:     ST  3,-6(1)	Store variable j
* WHILE
243:     LD  3,-6(1)	Load variable j
244:     ST  3,-9(1)	Save left side 
245:    LDC  3,3(6)	Load integer constant 
246:     LD  4,-9(1)	Load left into ac1 
247:    TLT  3,4,3	Op < 
248:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  getValue
250:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
251:     LD  3,-7(1)	Load variable boxRowStart
252:     ST  3,-11(1)	Save left side 
253:     LD  3,-5(1)	Load variable i
254:     LD  4,-11(1)	Load left into ac1 
255:    ADD  3,4,3	Op + 
256:     ST  3,-11(1)	Store parameter 
*                       Load param 2
257:     LD  3,-8(1)	Load variable boxColStart
258:     ST  3,-12(1)	Save left side 
259:     LD  3,-6(1)	Load variable j
260:     LD  4,-12(1)	Load left into ac1 
261:    ADD  3,4,3	Op + 
262:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
263:    LDA  1,-9(1)	Load address of new frame 
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-172(7)	CALL getValue
266:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
267:     ST  3,-9(1)	Save left side 
268:     LD  3,-4(1)	Load variable value
269:     LD  4,-9(1)	Load left into ac1 
270:    TEQ  3,4,3	Op == 
* THEN
* RETURN
272:    LDC  3,0(6)	Load Boolean constant 
273:    LDA  2,0(3)	Copy result to rt register 
274:     LD  3,-1(1)	Load return address 
275:     LD  1,0(1)	Adjust fp 
276:    LDA  7,0(3)	Return 
271:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
277:     LD  3,-6(1)	load lhs variable j
278:    LDA  3,1(3)	increment value of j
279:     ST  3,-6(1)	Store variable j
* END COMPOUND
280:    LDA  7,-38(7)	go to beginning of loop 
249:    LDA  7,31(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
281:     LD  3,-5(1)	load lhs variable i
282:    LDA  3,1(3)	increment value of i
283:     ST  3,-5(1)	Store variable i
* END COMPOUND
284:    LDA  7,-51(7)	go to beginning of loop 
240:    LDA  7,44(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
285:    LDC  3,1(6)	Load Boolean constant 
286:    LDA  2,0(3)	Copy result to rt register 
287:     LD  3,-1(1)	Load return address 
288:     LD  1,0(1)	Adjust fp 
289:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
290:    LDC  2,0(6)	Set return value to 0 
291:     LD  3,-1(1)	Load return address 
292:     LD  1,0(1)	Adjust fp 
293:    LDA  7,0(3)	Return 
* END FUNCTION isOkAt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION search
294:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
*                       Begin call to  getLocked
295:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
296:     LD  3,-2(1)	Load variable i
297:     ST  3,-6(1)	Store parameter 
*                       Load param 2
298:     LD  3,-3(1)	Load variable j
299:     ST  3,-7(1)	Store parameter 
*                       Jump to getLocked
300:    LDA  1,-4(1)	Load address of new frame 
301:    LDA  3,1(7)	Return address in ac 
302:    LDA  7,-166(7)	CALL getLocked
303:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
* THEN
* COMPOUND
* Compound Body
* IF
305:     LD  3,-2(1)	Load variable i
306:     ST  3,-4(1)	Save left side 
307:    LDC  3,8(6)	Load integer constant 
308:     LD  4,-4(1)	Load left into ac1 
309:    TEQ  3,4,3	Op == 
310:     ST  3,-4(1)	Save left side 
311:     LD  3,-3(1)	Load variable j
312:     ST  3,-5(1)	Save left side 
313:    LDC  3,8(6)	Load integer constant 
314:     LD  4,-5(1)	Load left into ac1 
315:    TEQ  3,4,3	Op == 
316:     LD  4,-4(1)	Load left into ac1 
317:    AND  3,4,3	Op AND 
* THEN
* RETURN
319:    LDC  3,1(6)	Load Boolean constant 
320:    LDA  2,0(3)	Copy result to rt register 
321:     LD  3,-1(1)	Load return address 
322:     LD  1,0(1)	Adjust fp 
323:    LDA  7,0(3)	Return 
318:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
325:     LD  3,-3(1)	Load variable j
326:     ST  3,-4(1)	Save left side 
327:    LDC  3,8(6)	Load integer constant 
328:     LD  4,-4(1)	Load left into ac1 
329:    TEQ  3,4,3	Op == 
* THEN
* RETURN
*                       Begin call to  search
331:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
332:     LD  3,-2(1)	Load variable i
333:     ST  3,-6(1)	Save left side 
334:    LDC  3,1(6)	Load integer constant 
335:     LD  4,-6(1)	Load left into ac1 
336:    ADD  3,4,3	Op + 
337:     ST  3,-6(1)	Store parameter 
*                       Load param 2
338:    LDC  3,0(6)	Load integer constant 
339:     ST  3,-7(1)	Store parameter 
*                       Jump to search
340:    LDA  1,-4(1)	Load address of new frame 
341:    LDA  3,1(7)	Return address in ac 
342:    LDA  7,-49(7)	CALL search
343:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
344:    LDA  2,0(3)	Copy result to rt register 
345:     LD  3,-1(1)	Load return address 
346:     LD  1,0(1)	Adjust fp 
347:    LDA  7,0(3)	Return 
330:    JZR  3,18(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
*                       Begin call to  search
349:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
350:     LD  3,-2(1)	Load variable i
351:     ST  3,-6(1)	Store parameter 
*                       Load param 2
352:     LD  3,-3(1)	Load variable j
353:     ST  3,-7(1)	Save left side 
354:    LDC  3,1(6)	Load integer constant 
355:     LD  4,-7(1)	Load left into ac1 
356:    ADD  3,4,3	Op + 
357:     ST  3,-7(1)	Store parameter 
*                       Jump to search
358:    LDA  1,-4(1)	Load address of new frame 
359:    LDA  3,1(7)	Return address in ac 
360:    LDA  7,-67(7)	CALL search
361:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
362:    LDA  2,0(3)	Copy result to rt register 
363:     LD  3,-1(1)	Load return address 
364:     LD  1,0(1)	Adjust fp 
365:    LDA  7,0(3)	Return 
348:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* ENDIF
324:    LDA  7,41(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
304:    JZR  3,62(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
367:    LDC  3,1(6)	Load integer constant 
368:     ST  3,-4(1)	Store variable n
* WHILE
369:     LD  3,-4(1)	Load variable n
370:     ST  3,-6(1)	Save left side 
371:    LDC  3,9(6)	Load integer constant 
372:     LD  4,-6(1)	Load left into ac1 
373:    TLE  3,4,3	Op <= 
374:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  isOkAt
376:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
377:     LD  3,-2(1)	Load variable i
378:     ST  3,-8(1)	Store parameter 
*                       Load param 2
379:     LD  3,-3(1)	Load variable j
380:     ST  3,-9(1)	Store parameter 
*                       Load param 3
381:     LD  3,-4(1)	Load variable n
382:     ST  3,-10(1)	Store parameter 
*                       Jump to isOkAt
383:    LDA  1,-6(1)	Load address of new frame 
384:    LDA  3,1(7)	Return address in ac 
385:    LDA  7,-226(7)	CALL isOkAt
386:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  setValue
388:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
389:     LD  3,-2(1)	Load variable i
390:     ST  3,-8(1)	Store parameter 
*                       Load param 2
391:     LD  3,-3(1)	Load variable j
392:     ST  3,-9(1)	Store parameter 
*                       Load param 3
393:     LD  3,-4(1)	Load variable n
394:     ST  3,-10(1)	Store parameter 
*                       Jump to setValue
395:    LDA  1,-6(1)	Load address of new frame 
396:    LDA  3,1(7)	Return address in ac 
397:    LDA  7,-324(7)	CALL setValue
398:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* IF
399:     LD  3,-2(1)	Load variable i
400:     ST  3,-6(1)	Save left side 
401:    LDC  3,8(6)	Load integer constant 
402:     LD  4,-6(1)	Load left into ac1 
403:    TEQ  3,4,3	Op == 
404:     ST  3,-6(1)	Save left side 
405:     LD  3,-3(1)	Load variable j
406:     ST  3,-7(1)	Save left side 
407:    LDC  3,8(6)	Load integer constant 
408:     LD  4,-7(1)	Load left into ac1 
409:    TEQ  3,4,3	Op == 
410:     LD  4,-6(1)	Load left into ac1 
411:    AND  3,4,3	Op AND 
* THEN
* RETURN
413:    LDC  3,1(6)	Load Boolean constant 
414:    LDA  2,0(3)	Copy result to rt register 
415:     LD  3,-1(1)	Load return address 
416:     LD  1,0(1)	Adjust fp 
417:    LDA  7,0(3)	Return 
412:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
419:     LD  3,-3(1)	Load variable j
420:     ST  3,-6(1)	Save left side 
421:    LDC  3,8(6)	Load integer constant 
422:     LD  4,-6(1)	Load left into ac1 
423:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  search
425:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
426:     LD  3,-2(1)	Load variable i
427:     ST  3,-8(1)	Save left side 
428:    LDC  3,1(6)	Load integer constant 
429:     LD  4,-8(1)	Load left into ac1 
430:    ADD  3,4,3	Op + 
431:     ST  3,-8(1)	Store parameter 
*                       Load param 2
432:    LDC  3,0(6)	Load integer constant 
433:     ST  3,-9(1)	Store parameter 
*                       Jump to search
434:    LDA  1,-6(1)	Load address of new frame 
435:    LDA  3,1(7)	Return address in ac 
436:    LDA  7,-143(7)	CALL search
437:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
438:     ST  3,-5(1)	Store variable foundOne
424:    JZR  3,15(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  search
440:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
441:     LD  3,-2(1)	Load variable i
442:     ST  3,-8(1)	Store parameter 
*                       Load param 2
443:     LD  3,-3(1)	Load variable j
444:     ST  3,-9(1)	Save left side 
445:    LDC  3,1(6)	Load integer constant 
446:     LD  4,-9(1)	Load left into ac1 
447:    ADD  3,4,3	Op + 
448:     ST  3,-9(1)	Store parameter 
*                       Jump to search
449:    LDA  1,-6(1)	Load address of new frame 
450:    LDA  3,1(7)	Return address in ac 
451:    LDA  7,-158(7)	CALL search
452:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
453:     ST  3,-5(1)	Store variable foundOne
439:    LDA  7,14(7)	Jump around the ELSE [backpatch] 
* ENDIF
418:    LDA  7,35(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
454:     LD  3,-5(1)	Load variable foundOne
* THEN
* RETURN
456:    LDC  3,1(6)	Load Boolean constant 
457:    LDA  2,0(3)	Copy result to rt register 
458:     LD  3,-1(1)	Load return address 
459:     LD  1,0(1)	Adjust fp 
460:    LDA  7,0(3)	Return 
455:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  setValue
462:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
463:     LD  3,-2(1)	Load variable i
464:     ST  3,-8(1)	Store parameter 
*                       Load param 2
465:     LD  3,-3(1)	Load variable j
466:     ST  3,-9(1)	Store parameter 
*                       Load param 3
467:    LDC  3,0(6)	Load integer constant 
468:     ST  3,-10(1)	Store parameter 
*                       Jump to setValue
469:    LDA  1,-6(1)	Load address of new frame 
470:    LDA  3,1(7)	Return address in ac 
471:    LDA  7,-398(7)	CALL setValue
472:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
461:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
387:    JZR  3,85(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
473:     LD  3,-4(1)	load lhs variable n
474:    LDA  3,1(3)	increment value of n
475:     ST  3,-4(1)	Store variable n
* END COMPOUND
476:    LDA  7,-108(7)	go to beginning of loop 
375:    LDA  7,101(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
366:    LDA  7,110(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
477:    LDC  3,0(6)	Load Boolean constant 
478:    LDA  2,0(3)	Copy result to rt register 
479:     LD  3,-1(1)	Load return address 
480:     LD  1,0(1)	Adjust fp 
481:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
482:    LDC  2,0(6)	Set return value to 0 
483:     LD  3,-1(1)	Load return address 
484:     LD  1,0(1)	Adjust fp 
485:    LDA  7,0(3)	Return 
* END FUNCTION search
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION searchTrivial
486:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
487:    LDC  3,1(6)	Load Boolean constant 
488:     ST  3,-6(1)	Store variable changed
* WHILE
489:     LD  3,-6(1)	Load variable changed
490:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
492:    LDC  3,0(6)	Load Boolean constant 
493:     ST  3,-6(1)	Store variable changed
* EXPRESSION
494:    LDC  3,0(6)	Load integer constant 
495:     ST  3,-2(1)	Store variable i
* WHILE
496:     LD  3,-2(1)	Load variable i
497:     ST  3,-8(1)	Save left side 
498:    LDC  3,9(6)	Load integer constant 
499:     LD  4,-8(1)	Load left into ac1 
500:    TLT  3,4,3	Op < 
501:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
503:    LDC  3,0(6)	Load integer constant 
504:     ST  3,-3(1)	Store variable j
* WHILE
505:     LD  3,-3(1)	Load variable j
506:     ST  3,-8(1)	Save left side 
507:    LDC  3,9(6)	Load integer constant 
508:     LD  4,-8(1)	Load left into ac1 
509:    TLT  3,4,3	Op < 
510:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  getLocked
512:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
513:     LD  3,-2(1)	Load variable i
514:     ST  3,-10(1)	Store parameter 
*                       Load param 2
515:     LD  3,-3(1)	Load variable j
516:     ST  3,-11(1)	Store parameter 
*                       Jump to getLocked
517:    LDA  1,-8(1)	Load address of new frame 
518:    LDA  3,1(7)	Return address in ac 
519:    LDA  7,-383(7)	CALL getLocked
520:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
521:     ST  3,-8(1)	Save left side 
522:    LDC  3,0(6)	Load Boolean constant 
523:     LD  4,-8(1)	Load left into ac1 
524:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
526:    LDC  3,1(6)	Load integer constant 
527:     ST  3,-4(1)	Store variable test
* EXPRESSION
528:    LDC  3,0(6)	Load Boolean constant 
529:     ST  3,-7(1)	Store variable foundOne
* WHILE
530:     LD  3,-4(1)	Load variable test
531:     ST  3,-8(1)	Save left side 
532:    LDC  3,9(6)	Load integer constant 
533:     LD  4,-8(1)	Load left into ac1 
534:    TLE  3,4,3	Op <= 
535:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  isOkAt
537:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
538:     LD  3,-2(1)	Load variable i
539:     ST  3,-10(1)	Store parameter 
*                       Load param 2
540:     LD  3,-3(1)	Load variable j
541:     ST  3,-11(1)	Store parameter 
*                       Load param 3
542:     LD  3,-4(1)	Load variable test
543:     ST  3,-12(1)	Store parameter 
*                       Jump to isOkAt
544:    LDA  1,-8(1)	Load address of new frame 
545:    LDA  3,1(7)	Return address in ac 
546:    LDA  7,-387(7)	CALL isOkAt
547:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
* THEN
* COMPOUND
* Compound Body
* IF
549:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
551:    LDC  3,0(6)	Load Boolean constant 
552:     ST  3,-7(1)	Store variable foundOne
* BREAK
553:    LDA  7,-18(7)	break 
* END COMPOUND
550:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
555:    LDC  3,1(6)	Load Boolean constant 
556:     ST  3,-7(1)	Store variable foundOne
* EXPRESSION
557:     LD  3,-4(1)	Load variable test
558:     ST  3,-5(1)	Store variable value
* END COMPOUND
554:    LDA  7,4(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
548:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
559:     LD  3,-4(1)	load lhs variable test
560:    LDA  3,1(3)	increment value of test
561:     ST  3,-4(1)	Store variable test
* END COMPOUND
562:    LDA  7,-33(7)	go to beginning of loop 
536:    LDA  7,26(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
563:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  setValue
565:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
566:     LD  3,-2(1)	Load variable i
567:     ST  3,-10(1)	Store parameter 
*                       Load param 2
568:     LD  3,-3(1)	Load variable j
569:     ST  3,-11(1)	Store parameter 
*                       Load param 3
570:     LD  3,-5(1)	Load variable value
571:     ST  3,-12(1)	Store parameter 
*                       Jump to setValue
572:    LDA  1,-8(1)	Load address of new frame 
573:    LDA  3,1(7)	Return address in ac 
574:    LDA  7,-501(7)	CALL setValue
575:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
*                       Begin call to  setLocked
576:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
577:     LD  3,-2(1)	Load variable i
578:     ST  3,-10(1)	Store parameter 
*                       Load param 2
579:     LD  3,-3(1)	Load variable j
580:     ST  3,-11(1)	Store parameter 
*                       Load param 3
581:    LDC  3,1(6)	Load Boolean constant 
582:     ST  3,-12(1)	Store parameter 
*                       Jump to setLocked
583:    LDA  1,-8(1)	Load address of new frame 
584:    LDA  3,1(7)	Return address in ac 
585:    LDA  7,-469(7)	CALL setLocked
586:    LDA  3,0(2)	Save the result in ac 
*                       End call to setLocked
* EXPRESSION
587:    LDC  3,1(6)	Load Boolean constant 
588:     ST  3,-6(1)	Store variable changed
* END COMPOUND
564:    JZR  3,24(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
525:    JZR  3,63(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
589:     LD  3,-3(1)	load lhs variable j
590:    LDA  3,1(3)	increment value of j
591:     ST  3,-3(1)	Store variable j
* END COMPOUND
592:    LDA  7,-88(7)	go to beginning of loop 
511:    LDA  7,81(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
593:     LD  3,-2(1)	load lhs variable i
594:    LDA  3,1(3)	increment value of i
595:     ST  3,-2(1)	Store variable i
* END COMPOUND
596:    LDA  7,-101(7)	go to beginning of loop 
502:    LDA  7,94(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
597:    LDA  7,-109(7)	go to beginning of loop 
491:    LDA  7,106(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
598:    LDC  2,0(6)	Set return value to 0 
599:     LD  3,-1(1)	Load return address 
600:     LD  1,0(1)	Adjust fp 
601:    LDA  7,0(3)	Return 
* END FUNCTION searchTrivial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION solve
602:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
603:    LDC  3,0(6)	Load integer constant 
604:     ST  3,-2(1)	Store variable i
* WHILE
605:     LD  3,-2(1)	Load variable i
606:     ST  3,-5(1)	Save left side 
607:    LDC  3,9(6)	Load integer constant 
608:     LD  4,-5(1)	Load left into ac1 
609:    TLT  3,4,3	Op < 
610:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
612:    LDC  3,0(6)	Load integer constant 
613:     ST  3,-3(1)	Store variable j
* WHILE
614:     LD  3,-3(1)	Load variable j
615:     ST  3,-5(1)	Save left side 
616:    LDC  3,9(6)	Load integer constant 
617:     LD  4,-5(1)	Load left into ac1 
618:    TLT  3,4,3	Op < 
619:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  getValue
621:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
622:     LD  3,-2(1)	Load variable i
623:     ST  3,-7(1)	Store parameter 
*                       Load param 2
624:     LD  3,-3(1)	Load variable j
625:     ST  3,-8(1)	Store parameter 
*                       Jump to getValue
626:    LDA  1,-5(1)	Load address of new frame 
627:    LDA  3,1(7)	Return address in ac 
628:    LDA  7,-535(7)	CALL getValue
629:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
630:     ST  3,-4(1)	Store variable n
* EXPRESSION
*                       Begin call to  setValue
631:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
632:     LD  3,-2(1)	Load variable i
633:     ST  3,-7(1)	Store parameter 
*                       Load param 2
634:     LD  3,-3(1)	Load variable j
635:     ST  3,-8(1)	Store parameter 
*                       Load param 3
636:    LDC  3,0(6)	Load integer constant 
637:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
638:    LDA  1,-5(1)	Load address of new frame 
639:    LDA  3,1(7)	Return address in ac 
640:    LDA  7,-567(7)	CALL setValue
641:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* IF
*                       Begin call to  getLocked
642:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
643:     LD  3,-2(1)	Load variable i
644:     ST  3,-7(1)	Store parameter 
*                       Load param 2
645:     LD  3,-3(1)	Load variable j
646:     ST  3,-8(1)	Store parameter 
*                       Jump to getLocked
647:    LDA  1,-5(1)	Load address of new frame 
648:    LDA  3,1(7)	Return address in ac 
649:    LDA  7,-513(7)	CALL getLocked
650:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
651:     ST  3,-5(1)	Save left side 
652:    LDC  3,1(6)	Load Boolean constant 
653:     LD  4,-5(1)	Load left into ac1 
654:    TEQ  3,4,3	Op == 
655:     ST  3,-5(1)	Save left side 
*                       Begin call to  isOkAt
656:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
657:     LD  3,-2(1)	Load variable i
658:     ST  3,-8(1)	Store parameter 
*                       Load param 2
659:     LD  3,-3(1)	Load variable j
660:     ST  3,-9(1)	Store parameter 
*                       Load param 3
661:     LD  3,-4(1)	Load variable n
662:     ST  3,-10(1)	Store parameter 
*                       Jump to isOkAt
663:    LDA  1,-6(1)	Load address of new frame 
664:    LDA  3,1(7)	Return address in ac 
665:    LDA  7,-506(7)	CALL isOkAt
666:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
667:     ST  3,-6(1)	Save left side 
668:    LDC  3,0(6)	Load Boolean constant 
669:     LD  4,-6(1)	Load left into ac1 
670:    TEQ  3,4,3	Op == 
671:     LD  4,-5(1)	Load left into ac1 
672:    AND  3,4,3	Op AND 
* THEN
* RETURN
674:    LDC  3,0(6)	Load Boolean constant 
675:    LDA  2,0(3)	Copy result to rt register 
676:     LD  3,-1(1)	Load return address 
677:     LD  1,0(1)	Adjust fp 
678:    LDA  7,0(3)	Return 
673:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  setValue
679:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
680:     LD  3,-2(1)	Load variable i
681:     ST  3,-7(1)	Store parameter 
*                       Load param 2
682:     LD  3,-3(1)	Load variable j
683:     ST  3,-8(1)	Store parameter 
*                       Load param 3
684:     LD  3,-4(1)	Load variable n
685:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
686:    LDA  1,-5(1)	Load address of new frame 
687:    LDA  3,1(7)	Return address in ac 
688:    LDA  7,-615(7)	CALL setValue
689:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
690:     LD  3,-3(1)	load lhs variable j
691:    LDA  3,1(3)	increment value of j
692:     ST  3,-3(1)	Store variable j
* END COMPOUND
693:    LDA  7,-80(7)	go to beginning of loop 
620:    LDA  7,73(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
694:     LD  3,-2(1)	load lhs variable i
695:    LDA  3,1(3)	increment value of i
696:     ST  3,-2(1)	Store variable i
* END COMPOUND
697:    LDA  7,-93(7)	go to beginning of loop 
611:    LDA  7,86(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  searchTrivial
698:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to searchTrivial
699:    LDA  1,-5(1)	Load address of new frame 
700:    LDA  3,1(7)	Return address in ac 
701:    LDA  7,-216(7)	CALL searchTrivial
702:    LDA  3,0(2)	Save the result in ac 
*                       End call to searchTrivial
* RETURN
*                       Begin call to  search
703:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
704:    LDC  3,0(6)	Load integer constant 
705:     ST  3,-7(1)	Store parameter 
*                       Load param 2
706:    LDC  3,0(6)	Load integer constant 
707:     ST  3,-8(1)	Store parameter 
*                       Jump to search
708:    LDA  1,-5(1)	Load address of new frame 
709:    LDA  3,1(7)	Return address in ac 
710:    LDA  7,-417(7)	CALL search
711:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
712:    LDA  2,0(3)	Copy result to rt register 
713:     LD  3,-1(1)	Load return address 
714:     LD  1,0(1)	Adjust fp 
715:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
716:    LDC  2,0(6)	Set return value to 0 
717:     LD  3,-1(1)	Load return address 
718:     LD  1,0(1)	Adjust fp 
719:    LDA  7,0(3)	Return 
* END FUNCTION solve
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showBoard
720:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outnl
721:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
722:    LDA  1,-4(1)	Load address of new frame 
723:    LDA  3,1(7)	Return address in ac 
724:    LDA  7,-688(7)	CALL outnl
725:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
726:    LDC  3,0(6)	Load integer constant 
727:     ST  3,-2(1)	Store variable i
* WHILE
728:     LD  3,-2(1)	Load variable i
729:     ST  3,-4(1)	Save left side 
730:    LDC  3,9(6)	Load integer constant 
731:     LD  4,-4(1)	Load left into ac1 
732:    TLT  3,4,3	Op < 
733:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
735:    LDC  3,0(6)	Load integer constant 
736:     ST  3,-3(1)	Store variable j
* WHILE
737:     LD  3,-3(1)	Load variable j
738:     ST  3,-4(1)	Save left side 
739:    LDC  3,9(6)	Load integer constant 
740:     LD  4,-4(1)	Load left into ac1 
741:    TLT  3,4,3	Op < 
742:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
744:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  getValue
745:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
746:     LD  3,-2(1)	Load variable i
747:     ST  3,-8(1)	Store parameter 
*                       Load param 2
748:     LD  3,-3(1)	Load variable j
749:     ST  3,-9(1)	Store parameter 
*                       Jump to getValue
750:    LDA  1,-6(1)	Load address of new frame 
751:    LDA  3,1(7)	Return address in ac 
752:    LDA  7,-659(7)	CALL getValue
753:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
754:     ST  3,-6(1)	Store parameter 
*                       Jump to output
755:    LDA  1,-4(1)	Load address of new frame 
756:    LDA  3,1(7)	Return address in ac 
757:    LDA  7,-752(7)	CALL output
758:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
759:     LD  3,-3(1)	load lhs variable j
760:    LDA  3,1(3)	increment value of j
761:     ST  3,-3(1)	Store variable j
* END COMPOUND
762:    LDA  7,-26(7)	go to beginning of loop 
743:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
763:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
764:    LDA  1,-4(1)	Load address of new frame 
765:    LDA  3,1(7)	Return address in ac 
766:    LDA  7,-730(7)	CALL outnl
767:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
768:     LD  3,-2(1)	load lhs variable i
769:    LDA  3,1(3)	increment value of i
770:     ST  3,-2(1)	Store variable i
* END COMPOUND
771:    LDA  7,-44(7)	go to beginning of loop 
734:    LDA  7,37(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
772:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
773:    LDA  1,-4(1)	Load address of new frame 
774:    LDA  3,1(7)	Return address in ac 
775:    LDA  7,-739(7)	CALL outnl
776:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
777:    LDC  2,0(6)	Set return value to 0 
778:     LD  3,-1(1)	Load return address 
779:     LD  1,0(1)	Adjust fp 
780:    LDA  7,0(3)	Return 
* END FUNCTION showBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getInput
781:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
782:    LDC  3,0(6)	Load integer constant 
783:     ST  3,-2(1)	Store variable i
* WHILE
784:     LD  3,-2(1)	Load variable i
785:     ST  3,-5(1)	Save left side 
786:    LDC  3,9(6)	Load integer constant 
787:     LD  4,-5(1)	Load left into ac1 
788:    TLT  3,4,3	Op < 
789:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
791:    LDC  3,0(6)	Load integer constant 
792:     ST  3,-3(1)	Store variable j
* WHILE
793:     LD  3,-3(1)	Load variable j
794:     ST  3,-5(1)	Save left side 
795:    LDC  3,9(6)	Load integer constant 
796:     LD  4,-5(1)	Load left into ac1 
797:    TLT  3,4,3	Op < 
798:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  input
800:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
801:    LDA  1,-5(1)	Load address of new frame 
802:    LDA  3,1(7)	Return address in ac 
803:    LDA  7,-803(7)	CALL input
804:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
805:     ST  3,-4(1)	Store variable inputVal
* IF
806:     LD  3,-4(1)	Load variable inputVal
807:     ST  3,-5(1)	Save left side 
808:    LDC  3,0(6)	Load integer constant 
809:     LD  4,-5(1)	Load left into ac1 
810:    TGT  3,4,3	Op > 
811:     ST  3,-5(1)	Save left side 
812:     LD  3,-4(1)	Load variable inputVal
813:     ST  3,-6(1)	Save left side 
814:    LDC  3,10(6)	Load integer constant 
815:     LD  4,-6(1)	Load left into ac1 
816:    TLT  3,4,3	Op < 
817:     LD  4,-5(1)	Load left into ac1 
818:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  setValue
820:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
821:     LD  3,-2(1)	Load variable i
822:     ST  3,-7(1)	Store parameter 
*                       Load param 2
823:     LD  3,-3(1)	Load variable j
824:     ST  3,-8(1)	Store parameter 
*                       Load param 3
825:     LD  3,-4(1)	Load variable inputVal
826:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
827:    LDA  1,-5(1)	Load address of new frame 
828:    LDA  3,1(7)	Return address in ac 
829:    LDA  7,-756(7)	CALL setValue
830:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
*                       Begin call to  setLocked
831:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
832:     LD  3,-2(1)	Load variable i
833:     ST  3,-7(1)	Store parameter 
*                       Load param 2
834:     LD  3,-3(1)	Load variable j
835:     ST  3,-8(1)	Store parameter 
*                       Load param 3
836:    LDC  3,1(6)	Load Boolean constant 
837:     ST  3,-9(1)	Store parameter 
*                       Jump to setLocked
838:    LDA  1,-5(1)	Load address of new frame 
839:    LDA  3,1(7)	Return address in ac 
840:    LDA  7,-724(7)	CALL setLocked
841:    LDA  3,0(2)	Save the result in ac 
*                       End call to setLocked
* END COMPOUND
819:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
842:     LD  3,-3(1)	load lhs variable j
843:    LDA  3,1(3)	increment value of j
844:     ST  3,-3(1)	Store variable j
* END COMPOUND
845:    LDA  7,-53(7)	go to beginning of loop 
799:    LDA  7,46(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
846:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
847:    LDA  1,-5(1)	Load address of new frame 
848:    LDA  3,1(7)	Return address in ac 
849:    LDA  7,-813(7)	CALL outnl
850:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
851:     LD  3,-2(1)	load lhs variable i
852:    LDA  3,1(3)	increment value of i
853:     ST  3,-2(1)	Store variable i
* END COMPOUND
854:    LDA  7,-71(7)	go to beginning of loop 
790:    LDA  7,64(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
855:    LDC  2,0(6)	Set return value to 0 
856:     LD  3,-1(1)	Load return address 
857:     LD  1,0(1)	Adjust fp 
858:    LDA  7,0(3)	Return 
* END FUNCTION getInput
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
859:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  initBoard
860:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to initBoard
861:    LDA  1,-2(1)	Load address of new frame 
862:    LDA  3,1(7)	Return address in ac 
863:    LDA  7,-822(7)	CALL initBoard
864:    LDA  3,0(2)	Save the result in ac 
*                       End call to initBoard
* EXPRESSION
*                       Begin call to  getInput
865:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to getInput
866:    LDA  1,-2(1)	Load address of new frame 
867:    LDA  3,1(7)	Return address in ac 
868:    LDA  7,-88(7)	CALL getInput
869:    LDA  3,0(2)	Save the result in ac 
*                       End call to getInput
* IF
*                       Begin call to  solve
870:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to solve
871:    LDA  1,-2(1)	Load address of new frame 
872:    LDA  3,1(7)	Return address in ac 
873:    LDA  7,-272(7)	CALL solve
874:    LDA  3,0(2)	Save the result in ac 
*                       End call to solve
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  showBoard
876:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to showBoard
877:    LDA  1,-2(1)	Load address of new frame 
878:    LDA  3,1(7)	Return address in ac 
879:    LDA  7,-160(7)	CALL showBoard
880:    LDA  3,0(2)	Save the result in ac 
*                       End call to showBoard
* END COMPOUND
875:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
882:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
883:    LDC  3,0(6)	Load Boolean constant 
884:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
885:    LDA  1,-2(1)	Load address of new frame 
886:    LDA  3,1(7)	Return address in ac 
887:    LDA  7,-870(7)	CALL outputb
888:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
889:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
890:    LDA  1,-2(1)	Load address of new frame 
891:    LDA  3,1(7)	Return address in ac 
892:    LDA  7,-856(7)	CALL outnl
893:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
881:    LDA  7,12(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
894:    LDC  3,0(6)	Load integer constant 
895:    LDA  2,0(3)	Copy result to rt register 
896:     LD  3,-1(1)	Load return address 
897:     LD  1,0(1)	Adjust fp 
898:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
899:    LDC  2,0(6)	Set return value to 0 
900:     LD  3,-1(1)	Load return address 
901:     LD  1,0(1)	Adjust fp 
902:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,902(7)	Jump to init [backpatch] 
* INIT
903:     LD  0,0(0)	Set the global pointer 
904:    LDA  1,-164(0)	set first frame at end of globals 
905:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
906:    LDC  3,81(6)	load size of array board
907:     ST  3,0(0)	save size of array board
908:    LDC  3,81(6)	load size of array locked
909:     ST  3,-82(0)	save size of array locked
* END INIT GLOBALS AND STATICS
910:    LDA  3,1(7)	Return address in ac 
911:    LDA  7,-53(7)	Jump to main 
912:   HALT  0,0,0	DONE! 
* END INIT
