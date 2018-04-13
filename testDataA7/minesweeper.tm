* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  minesweeper.c-
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
* FUNCTION Random
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,0(0)	Load variable seed
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,333331(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:     ST  3,-3(1)	Save left side 
 49:    LDC  3,3331(6)	Load integer constant 
 50:     LD  4,-3(1)	Load left into ac1 
 51:    ADD  3,4,3	Op + 
 52:     ST  3,0(0)	Store variable seed
* IF
 53:     LD  3,0(0)	Load variable seed
 54:     ST  3,-3(1)	Save left side 
 55:    LDC  3,0(6)	Load integer constant 
 56:     LD  4,-3(1)	Load left into ac1 
 57:    TLT  3,4,3	Op < 
* THEN
* RETURN
 59:     LD  3,0(0)	Load variable seed
 60:    LDC  4,0(6)	Load 0 
 61:    SUB  3,4,3	Op unary - 
 62:     ST  3,-3(1)	Save left side 
 63:    LDC  3,100(6)	Load integer constant 
 64:     LD  4,-3(1)	Load left into ac1 
 65:    DIV  5,4,3	Op % 
 66:    MUL  5,5,3	 
 67:    SUB  3,4,5	 
 68:    LDA  2,0(3)	Copy result to rt register 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    LDA  7,0(3)	Return 
 58:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 73:     LD  3,0(0)	Load variable seed
 74:     ST  3,-3(1)	Save left side 
 75:    LDC  3,100(6)	Load integer constant 
 76:     LD  4,-3(1)	Load left into ac1 
 77:    DIV  5,4,3	Op % 
 78:    MUL  5,5,3	 
 79:    SUB  3,4,5	 
 80:    LDA  2,0(3)	Copy result to rt register 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
 72:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END FUNCTION Random
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION CreateBoard
 88:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 89:    LDC  3,0(6)	Load integer constant 
 90:     ST  3,-2(1)	Store variable i
* WHILE
 91:     LD  3,-2(1)	Load variable i
 92:     ST  3,-4(1)	Save left side 
 93:    LDC  3,100(6)	Load integer constant 
 94:     LD  4,-4(1)	Load left into ac1 
 95:    TLT  3,4,3	Op < 
 96:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 98:     LD  3,-2(1)	Load variable i
 99:     ST  3,-4(1)	Save index 
100:    LDC  3,0(6)	Load Boolean constant 
101:     LD  4,-4(1)	Restore index 
102:    LDA  5,-103(0)	Load address of base of array guess
103:    SUB  5,5,4	Compute offset of value 
104:     ST  3,0(5)	Store variable guess
* EXPRESSION
105:    LDC  3,1(6)	Load integer constant 
106:     LD  4,-2(1)	load lhs variable i
107:    ADD  3,4,3	op += 
108:     ST  3,-2(1)	Store variable i
* END COMPOUND
109:    LDA  7,-19(7)	go to beginning of loop 
 97:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
110:    LDC  3,0(6)	Load integer constant 
111:     ST  3,-2(1)	Store variable i
* WHILE
112:     LD  3,-2(1)	Load variable i
113:     ST  3,-4(1)	Save left side 
114:    LDC  3,100(6)	Load integer constant 
115:     LD  4,-4(1)	Load left into ac1 
116:    TLT  3,4,3	Op < 
117:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
119:     LD  3,-2(1)	Load variable i
120:     ST  3,-4(1)	Save index 
121:    LDC  3,0(6)	Load integer constant 
122:     LD  4,-4(1)	Restore index 
123:    LDA  5,-2(0)	Load address of base of array board
124:    SUB  5,5,4	Compute offset of value 
125:     ST  3,0(5)	Store variable board
* EXPRESSION
126:    LDC  3,1(6)	Load integer constant 
127:     LD  4,-2(1)	load lhs variable i
128:    ADD  3,4,3	op += 
129:     ST  3,-2(1)	Store variable i
* END COMPOUND
130:    LDA  7,-19(7)	go to beginning of loop 
118:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
131:    LDC  3,0(6)	Load integer constant 
132:     ST  3,-2(1)	Store variable i
* WHILE
133:     LD  3,-2(1)	Load variable i
134:     ST  3,-4(1)	Save left side 
135:    LDC  3,15(6)	Load integer constant 
136:     LD  4,-4(1)	Load left into ac1 
137:    TLE  3,4,3	Op <= 
138:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* WHILE
140:    LDC  3,1(6)	Load Boolean constant 
141:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  Random
143:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to Random
144:    LDA  1,-5(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-105(7)	CALL Random
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to Random
148:     ST  3,-4(1)	Store variable rand
* IF
149:    LDA  3,-2(0)	Load address of base of array board
150:     ST  3,-5(1)	Save left side 
151:     LD  3,-4(1)	Load variable rand
152:     LD  4,-5(1)	Load left into ac1 
153:    SUB  3,4,3	compute location from index 
154:     LD  3,0(3)	Load array element 
155:     ST  3,-5(1)	Save left side 
156:    LDC  3,1(6)	Load integer constant 
157:    LDC  4,0(6)	Load 0 
158:    SUB  3,4,3	Op unary - 
159:     LD  4,-5(1)	Load left into ac1 
160:    TNE  3,4,3	Op != 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
162:     LD  3,-4(1)	Load variable rand
163:     ST  3,-5(1)	Save index 
164:    LDC  3,1(6)	Load integer constant 
165:    LDC  4,0(6)	Load 0 
166:    SUB  3,4,3	Op unary - 
167:     LD  4,-5(1)	Restore index 
168:    LDA  5,-2(0)	Load address of base of array board
169:    SUB  5,5,4	Compute offset of value 
170:     ST  3,0(5)	Store variable board
* IF
171:     LD  3,-4(1)	Load variable rand
172:     ST  3,-5(1)	Save left side 
173:    LDC  3,10(6)	Load integer constant 
174:     LD  4,-5(1)	Load left into ac1 
175:    DIV  5,4,3	Op % 
176:    MUL  5,5,3	 
177:    SUB  3,4,5	 
178:     ST  3,-5(1)	Save left side 
179:    LDC  3,0(6)	Load integer constant 
180:     LD  4,-5(1)	Load left into ac1 
181:    TNE  3,4,3	Op != 
182:     ST  3,-5(1)	Save left side 
183:     LD  3,-4(1)	Load variable rand
184:     ST  3,-6(1)	Save left side 
185:    LDC  3,9(6)	Load integer constant 
186:     LD  4,-6(1)	Load left into ac1 
187:    TGT  3,4,3	Op > 
188:     LD  4,-5(1)	Load left into ac1 
189:    AND  3,4,3	Op AND 
* THEN
* IF
191:    LDA  3,-2(0)	Load address of base of array board
192:     ST  3,-5(1)	Save left side 
193:     LD  3,-4(1)	Load variable rand
194:     ST  3,-6(1)	Save left side 
195:    LDC  3,11(6)	Load integer constant 
196:     LD  4,-6(1)	Load left into ac1 
197:    SUB  3,4,3	Op - 
198:     LD  4,-5(1)	Load left into ac1 
199:    SUB  3,4,3	compute location from index 
200:     LD  3,0(3)	Load array element 
201:     ST  3,-5(1)	Save left side 
202:    LDC  3,1(6)	Load integer constant 
203:    LDC  4,0(6)	Load 0 
204:    SUB  3,4,3	Op unary - 
205:     LD  4,-5(1)	Load left into ac1 
206:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
208:     LD  3,-4(1)	Load variable rand
209:     ST  3,-5(1)	Save left side 
210:    LDC  3,11(6)	Load integer constant 
211:     LD  4,-5(1)	Load left into ac1 
212:    SUB  3,4,3	Op - 
213:     ST  3,-5(1)	Save index 
214:    LDC  3,1(6)	Load integer constant 
215:     LD  4,-5(1)	Restore index 
216:    LDA  5,-2(0)	Load address of base of array board
217:    SUB  5,5,4	Compute offset of value 
218:     LD  4,0(5)	load lhs variable board
219:    ADD  3,4,3	op += 
220:     ST  3,0(5)	Store variable board
207:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
190:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
221:     LD  3,-4(1)	Load variable rand
222:     ST  3,-5(1)	Save left side 
223:    LDC  3,9(6)	Load integer constant 
224:     LD  4,-5(1)	Load left into ac1 
225:    TGT  3,4,3	Op > 
* THEN
* IF
227:    LDA  3,-2(0)	Load address of base of array board
228:     ST  3,-5(1)	Save left side 
229:     LD  3,-4(1)	Load variable rand
230:     ST  3,-6(1)	Save left side 
231:    LDC  3,10(6)	Load integer constant 
232:     LD  4,-6(1)	Load left into ac1 
233:    SUB  3,4,3	Op - 
234:     LD  4,-5(1)	Load left into ac1 
235:    SUB  3,4,3	compute location from index 
236:     LD  3,0(3)	Load array element 
237:     ST  3,-5(1)	Save left side 
238:    LDC  3,1(6)	Load integer constant 
239:    LDC  4,0(6)	Load 0 
240:    SUB  3,4,3	Op unary - 
241:     LD  4,-5(1)	Load left into ac1 
242:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
244:     LD  3,-4(1)	Load variable rand
245:     ST  3,-5(1)	Save left side 
246:    LDC  3,10(6)	Load integer constant 
247:     LD  4,-5(1)	Load left into ac1 
248:    SUB  3,4,3	Op - 
249:     ST  3,-5(1)	Save index 
250:    LDC  3,1(6)	Load integer constant 
251:     LD  4,-5(1)	Restore index 
252:    LDA  5,-2(0)	Load address of base of array board
253:    SUB  5,5,4	Compute offset of value 
254:     LD  4,0(5)	load lhs variable board
255:    ADD  3,4,3	op += 
256:     ST  3,0(5)	Store variable board
243:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
226:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
257:     LD  3,-4(1)	Load variable rand
258:     ST  3,-5(1)	Save left side 
259:    LDC  3,9(6)	Load integer constant 
260:     LD  4,-5(1)	Load left into ac1 
261:    DIV  5,4,3	Op % 
262:    MUL  5,5,3	 
263:    SUB  3,4,5	 
264:     ST  3,-5(1)	Save left side 
265:    LDC  3,0(6)	Load integer constant 
266:     LD  4,-5(1)	Load left into ac1 
267:    TNE  3,4,3	Op != 
268:     ST  3,-5(1)	Save left side 
269:     LD  3,-4(1)	Load variable rand
270:     ST  3,-6(1)	Save left side 
271:    LDC  3,9(6)	Load integer constant 
272:     LD  4,-6(1)	Load left into ac1 
273:    TGT  3,4,3	Op > 
274:     LD  4,-5(1)	Load left into ac1 
275:    AND  3,4,3	Op AND 
* THEN
* IF
277:    LDA  3,-2(0)	Load address of base of array board
278:     ST  3,-5(1)	Save left side 
279:     LD  3,-4(1)	Load variable rand
280:     ST  3,-6(1)	Save left side 
281:    LDC  3,9(6)	Load integer constant 
282:     LD  4,-6(1)	Load left into ac1 
283:    SUB  3,4,3	Op - 
284:     LD  4,-5(1)	Load left into ac1 
285:    SUB  3,4,3	compute location from index 
286:     LD  3,0(3)	Load array element 
287:     ST  3,-5(1)	Save left side 
288:    LDC  3,1(6)	Load integer constant 
289:    LDC  4,0(6)	Load 0 
290:    SUB  3,4,3	Op unary - 
291:     LD  4,-5(1)	Load left into ac1 
292:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
294:     LD  3,-4(1)	Load variable rand
295:     ST  3,-5(1)	Save left side 
296:    LDC  3,9(6)	Load integer constant 
297:     LD  4,-5(1)	Load left into ac1 
298:    SUB  3,4,3	Op - 
299:     ST  3,-5(1)	Save index 
300:    LDC  3,1(6)	Load integer constant 
301:     LD  4,-5(1)	Restore index 
302:    LDA  5,-2(0)	Load address of base of array board
303:    SUB  5,5,4	Compute offset of value 
304:     LD  4,0(5)	load lhs variable board
305:    ADD  3,4,3	op += 
306:     ST  3,0(5)	Store variable board
293:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
276:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
307:     LD  3,-4(1)	Load variable rand
308:     ST  3,-5(1)	Save left side 
309:    LDC  3,10(6)	Load integer constant 
310:     LD  4,-5(1)	Load left into ac1 
311:    DIV  5,4,3	Op % 
312:    MUL  5,5,3	 
313:    SUB  3,4,5	 
314:     ST  3,-5(1)	Save left side 
315:    LDC  3,0(6)	Load integer constant 
316:     LD  4,-5(1)	Load left into ac1 
317:    TNE  3,4,3	Op != 
* THEN
* IF
319:    LDA  3,-2(0)	Load address of base of array board
320:     ST  3,-5(1)	Save left side 
321:     LD  3,-4(1)	Load variable rand
322:     ST  3,-6(1)	Save left side 
323:    LDC  3,1(6)	Load integer constant 
324:     LD  4,-6(1)	Load left into ac1 
325:    SUB  3,4,3	Op - 
326:     LD  4,-5(1)	Load left into ac1 
327:    SUB  3,4,3	compute location from index 
328:     LD  3,0(3)	Load array element 
329:     ST  3,-5(1)	Save left side 
330:    LDC  3,1(6)	Load integer constant 
331:    LDC  4,0(6)	Load 0 
332:    SUB  3,4,3	Op unary - 
333:     LD  4,-5(1)	Load left into ac1 
334:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
336:     LD  3,-4(1)	Load variable rand
337:     ST  3,-5(1)	Save left side 
338:    LDC  3,1(6)	Load integer constant 
339:     LD  4,-5(1)	Load left into ac1 
340:    SUB  3,4,3	Op - 
341:     ST  3,-5(1)	Save index 
342:    LDC  3,1(6)	Load integer constant 
343:     LD  4,-5(1)	Restore index 
344:    LDA  5,-2(0)	Load address of base of array board
345:    SUB  5,5,4	Compute offset of value 
346:     LD  4,0(5)	load lhs variable board
347:    ADD  3,4,3	op += 
348:     ST  3,0(5)	Store variable board
335:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
318:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
349:     LD  3,-4(1)	Load variable rand
350:     ST  3,-5(1)	Save left side 
351:    LDC  3,9(6)	Load integer constant 
352:     LD  4,-5(1)	Load left into ac1 
353:    DIV  5,4,3	Op % 
354:    MUL  5,5,3	 
355:    SUB  3,4,5	 
356:     ST  3,-5(1)	Save left side 
357:    LDC  3,0(6)	Load integer constant 
358:     LD  4,-5(1)	Load left into ac1 
359:    TNE  3,4,3	Op != 
360:     ST  3,-5(1)	Save left side 
361:     LD  3,-4(1)	Load variable rand
362:     ST  3,-6(1)	Save left side 
363:    LDC  3,0(6)	Load integer constant 
364:     LD  4,-6(1)	Load left into ac1 
365:    TEQ  3,4,3	Op == 
366:     LD  4,-5(1)	Load left into ac1 
367:     OR  3,4,3	Op OR 
* THEN
* IF
369:    LDA  3,-2(0)	Load address of base of array board
370:     ST  3,-5(1)	Save left side 
371:     LD  3,-4(1)	Load variable rand
372:     ST  3,-6(1)	Save left side 
373:    LDC  3,1(6)	Load integer constant 
374:     LD  4,-6(1)	Load left into ac1 
375:    ADD  3,4,3	Op + 
376:     LD  4,-5(1)	Load left into ac1 
377:    SUB  3,4,3	compute location from index 
378:     LD  3,0(3)	Load array element 
379:     ST  3,-5(1)	Save left side 
380:    LDC  3,1(6)	Load integer constant 
381:    LDC  4,0(6)	Load 0 
382:    SUB  3,4,3	Op unary - 
383:     LD  4,-5(1)	Load left into ac1 
384:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
386:     LD  3,-4(1)	Load variable rand
387:     ST  3,-5(1)	Save left side 
388:    LDC  3,1(6)	Load integer constant 
389:     LD  4,-5(1)	Load left into ac1 
390:    ADD  3,4,3	Op + 
391:     ST  3,-5(1)	Save index 
392:    LDC  3,1(6)	Load integer constant 
393:     LD  4,-5(1)	Restore index 
394:    LDA  5,-2(0)	Load address of base of array board
395:    SUB  5,5,4	Compute offset of value 
396:     LD  4,0(5)	load lhs variable board
397:    ADD  3,4,3	op += 
398:     ST  3,0(5)	Store variable board
385:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
368:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
399:     LD  3,-4(1)	Load variable rand
400:     ST  3,-5(1)	Save left side 
401:    LDC  3,10(6)	Load integer constant 
402:     LD  4,-5(1)	Load left into ac1 
403:    DIV  5,4,3	Op % 
404:    MUL  5,5,3	 
405:    SUB  3,4,5	 
406:     ST  3,-5(1)	Save left side 
407:    LDC  3,0(6)	Load integer constant 
408:     LD  4,-5(1)	Load left into ac1 
409:    TNE  3,4,3	Op != 
410:     ST  3,-5(1)	Save left side 
411:     LD  3,-4(1)	Load variable rand
412:     ST  3,-6(1)	Save left side 
413:    LDC  3,90(6)	Load integer constant 
414:     LD  4,-6(1)	Load left into ac1 
415:    TLT  3,4,3	Op < 
416:     LD  4,-5(1)	Load left into ac1 
417:    AND  3,4,3	Op AND 
* THEN
* IF
419:    LDA  3,-2(0)	Load address of base of array board
420:     ST  3,-5(1)	Save left side 
421:     LD  3,-4(1)	Load variable rand
422:     ST  3,-6(1)	Save left side 
423:    LDC  3,9(6)	Load integer constant 
424:     LD  4,-6(1)	Load left into ac1 
425:    ADD  3,4,3	Op + 
426:     LD  4,-5(1)	Load left into ac1 
427:    SUB  3,4,3	compute location from index 
428:     LD  3,0(3)	Load array element 
429:     ST  3,-5(1)	Save left side 
430:    LDC  3,1(6)	Load integer constant 
431:    LDC  4,0(6)	Load 0 
432:    SUB  3,4,3	Op unary - 
433:     LD  4,-5(1)	Load left into ac1 
434:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
436:     LD  3,-4(1)	Load variable rand
437:     ST  3,-5(1)	Save left side 
438:    LDC  3,9(6)	Load integer constant 
439:     LD  4,-5(1)	Load left into ac1 
440:    ADD  3,4,3	Op + 
441:     ST  3,-5(1)	Save index 
442:    LDC  3,1(6)	Load integer constant 
443:     LD  4,-5(1)	Restore index 
444:    LDA  5,-2(0)	Load address of base of array board
445:    SUB  5,5,4	Compute offset of value 
446:     LD  4,0(5)	load lhs variable board
447:    ADD  3,4,3	op += 
448:     ST  3,0(5)	Store variable board
435:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
418:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
449:     LD  3,-4(1)	Load variable rand
450:     ST  3,-5(1)	Save left side 
451:    LDC  3,90(6)	Load integer constant 
452:     LD  4,-5(1)	Load left into ac1 
453:    TLT  3,4,3	Op < 
* THEN
* IF
455:    LDA  3,-2(0)	Load address of base of array board
456:     ST  3,-5(1)	Save left side 
457:     LD  3,-4(1)	Load variable rand
458:     ST  3,-6(1)	Save left side 
459:    LDC  3,10(6)	Load integer constant 
460:     LD  4,-6(1)	Load left into ac1 
461:    ADD  3,4,3	Op + 
462:     LD  4,-5(1)	Load left into ac1 
463:    SUB  3,4,3	compute location from index 
464:     LD  3,0(3)	Load array element 
465:     ST  3,-5(1)	Save left side 
466:    LDC  3,1(6)	Load integer constant 
467:    LDC  4,0(6)	Load 0 
468:    SUB  3,4,3	Op unary - 
469:     LD  4,-5(1)	Load left into ac1 
470:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
472:     LD  3,-4(1)	Load variable rand
473:     ST  3,-5(1)	Save left side 
474:    LDC  3,10(6)	Load integer constant 
475:     LD  4,-5(1)	Load left into ac1 
476:    ADD  3,4,3	Op + 
477:     ST  3,-5(1)	Save index 
478:    LDC  3,1(6)	Load integer constant 
479:     LD  4,-5(1)	Restore index 
480:    LDA  5,-2(0)	Load address of base of array board
481:    SUB  5,5,4	Compute offset of value 
482:     LD  4,0(5)	load lhs variable board
483:    ADD  3,4,3	op += 
484:     ST  3,0(5)	Store variable board
471:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
454:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
485:     LD  3,-4(1)	Load variable rand
486:     ST  3,-5(1)	Save left side 
487:    LDC  3,9(6)	Load integer constant 
488:     LD  4,-5(1)	Load left into ac1 
489:    DIV  5,4,3	Op % 
490:    MUL  5,5,3	 
491:    SUB  3,4,5	 
492:     ST  3,-5(1)	Save left side 
493:    LDC  3,0(6)	Load integer constant 
494:     LD  4,-5(1)	Load left into ac1 
495:    TNE  3,4,3	Op != 
496:     ST  3,-5(1)	Save left side 
497:     LD  3,-4(1)	Load variable rand
498:     ST  3,-6(1)	Save left side 
499:    LDC  3,90(6)	Load integer constant 
500:     LD  4,-6(1)	Load left into ac1 
501:    TLT  3,4,3	Op < 
502:     LD  4,-5(1)	Load left into ac1 
503:    AND  3,4,3	Op AND 
* THEN
* IF
505:    LDA  3,-2(0)	Load address of base of array board
506:     ST  3,-5(1)	Save left side 
507:     LD  3,-4(1)	Load variable rand
508:     ST  3,-6(1)	Save left side 
509:    LDC  3,11(6)	Load integer constant 
510:     LD  4,-6(1)	Load left into ac1 
511:    ADD  3,4,3	Op + 
512:     LD  4,-5(1)	Load left into ac1 
513:    SUB  3,4,3	compute location from index 
514:     LD  3,0(3)	Load array element 
515:     ST  3,-5(1)	Save left side 
516:    LDC  3,1(6)	Load integer constant 
517:    LDC  4,0(6)	Load 0 
518:    SUB  3,4,3	Op unary - 
519:     LD  4,-5(1)	Load left into ac1 
520:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
522:     LD  3,-4(1)	Load variable rand
523:     ST  3,-5(1)	Save left side 
524:    LDC  3,11(6)	Load integer constant 
525:     LD  4,-5(1)	Load left into ac1 
526:    ADD  3,4,3	Op + 
527:     ST  3,-5(1)	Save index 
528:    LDC  3,1(6)	Load integer constant 
529:     LD  4,-5(1)	Restore index 
530:    LDA  5,-2(0)	Load address of base of array board
531:    SUB  5,5,4	Compute offset of value 
532:     LD  4,0(5)	load lhs variable board
533:    ADD  3,4,3	op += 
534:     ST  3,0(5)	Store variable board
521:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
504:    JZR  3,30(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* BREAK
535:    LDA  7,-394(7)	break 
* END COMPOUND
161:    JZR  3,374(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
536:    LDA  7,-397(7)	go to beginning of loop 
142:    LDA  7,394(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
537:    LDC  3,1(6)	Load integer constant 
538:     LD  4,-2(1)	load lhs variable i
539:    ADD  3,4,3	op += 
540:     ST  3,-2(1)	Store variable i
* END COMPOUND
541:    LDA  7,-409(7)	go to beginning of loop 
139:    LDA  7,402(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
542:    LDC  2,0(6)	Set return value to 0 
543:     LD  3,-1(1)	Load return address 
544:     LD  1,0(1)	Adjust fp 
545:    LDA  7,0(3)	Return 
* END FUNCTION CreateBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION PrintBoard
546:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
547:    LDC  3,1(6)	Load integer constant 
548:     ST  3,-2(1)	Store variable i
* EXPRESSION
*                       Begin call to  outnl
549:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
550:    LDA  1,-3(1)	Load address of new frame 
551:    LDA  3,1(7)	Return address in ac 
552:    LDA  7,-516(7)	CALL outnl
553:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* WHILE
554:     LD  3,-2(1)	Load variable i
555:     ST  3,-3(1)	Save left side 
556:    LDC  3,101(6)	Load integer constant 
557:     LD  4,-3(1)	Load left into ac1 
558:    TLT  3,4,3	Op < 
559:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
561:    LDA  3,-103(0)	Load address of base of array guess
562:     ST  3,-3(1)	Save left side 
563:     LD  3,-2(1)	Load variable i
564:     ST  3,-4(1)	Save left side 
565:    LDC  3,1(6)	Load integer constant 
566:     LD  4,-4(1)	Load left into ac1 
567:    SUB  3,4,3	Op - 
568:     LD  4,-3(1)	Load left into ac1 
569:    SUB  3,4,3	compute location from index 
570:     LD  3,0(3)	Load array element 
* THEN
* COMPOUND
* Compound Body
* IF
572:    LDA  3,-2(0)	Load address of base of array board
573:     ST  3,-3(1)	Save left side 
574:     LD  3,-2(1)	Load variable i
575:     ST  3,-4(1)	Save left side 
576:    LDC  3,1(6)	Load integer constant 
577:     LD  4,-4(1)	Load left into ac1 
578:    SUB  3,4,3	Op - 
579:     LD  4,-3(1)	Load left into ac1 
580:    SUB  3,4,3	compute location from index 
581:     LD  3,0(3)	Load array element 
582:     ST  3,-3(1)	Save left side 
583:    LDC  3,1(6)	Load integer constant 
584:    LDC  4,0(6)	Load 0 
585:    SUB  3,4,3	Op unary - 
586:     LD  4,-3(1)	Load left into ac1 
587:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  outputb
589:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
590:    LDC  3,1(6)	Load Boolean constant 
591:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
592:    LDA  1,-3(1)	Load address of new frame 
593:    LDA  3,1(7)	Return address in ac 
594:    LDA  7,-577(7)	CALL outputb
595:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
588:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
597:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
598:    LDA  3,-2(0)	Load address of base of array board
599:     ST  3,-5(1)	Save left side 
600:     LD  3,-2(1)	Load variable i
601:     ST  3,-6(1)	Save left side 
602:    LDC  3,1(6)	Load integer constant 
603:     LD  4,-6(1)	Load left into ac1 
604:    SUB  3,4,3	Op - 
605:     LD  4,-5(1)	Load left into ac1 
606:    SUB  3,4,3	compute location from index 
607:     LD  3,0(3)	Load array element 
608:     ST  3,-5(1)	Store parameter 
*                       Jump to output
609:    LDA  1,-3(1)	Load address of new frame 
610:    LDA  3,1(7)	Return address in ac 
611:    LDA  7,-606(7)	CALL output
612:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
596:    LDA  7,16(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
571:    JZR  3,42(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  outputb
614:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
615:    LDC  3,0(6)	Load Boolean constant 
616:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
617:    LDA  1,-3(1)	Load address of new frame 
618:    LDA  3,1(7)	Return address in ac 
619:    LDA  7,-602(7)	CALL outputb
620:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
613:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
621:     LD  3,-2(1)	Load variable i
622:     ST  3,-3(1)	Save left side 
623:    LDC  3,10(6)	Load integer constant 
624:     LD  4,-3(1)	Load left into ac1 
625:    DIV  5,4,3	Op % 
626:    MUL  5,5,3	 
627:    SUB  3,4,5	 
628:     ST  3,-3(1)	Save left side 
629:    LDC  3,0(6)	Load integer constant 
630:     LD  4,-3(1)	Load left into ac1 
631:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  outnl
633:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
634:    LDA  1,-3(1)	Load address of new frame 
635:    LDA  3,1(7)	Return address in ac 
636:    LDA  7,-600(7)	CALL outnl
637:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
632:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
638:    LDC  3,1(6)	Load integer constant 
639:     LD  4,-2(1)	load lhs variable i
640:    ADD  3,4,3	op += 
641:     ST  3,-2(1)	Store variable i
* END COMPOUND
642:    LDA  7,-89(7)	go to beginning of loop 
560:    LDA  7,82(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
643:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
644:    LDA  1,-3(1)	Load address of new frame 
645:    LDA  3,1(7)	Return address in ac 
646:    LDA  7,-610(7)	CALL outnl
647:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
648:    LDC  2,0(6)	Set return value to 0 
649:     LD  3,-1(1)	Load return address 
650:     LD  1,0(1)	Adjust fp 
651:    LDA  7,0(3)	Return 
* END FUNCTION PrintBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Move
652:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
653:     LD  3,-2(1)	Load variable m
654:     ST  3,-3(1)	Save index 
655:    LDC  3,1(6)	Load Boolean constant 
656:     LD  4,-3(1)	Restore index 
657:    LDA  5,-103(0)	Load address of base of array guess
658:    SUB  5,5,4	Compute offset of value 
659:     ST  3,0(5)	Store variable guess
* IF
660:    LDA  3,-2(0)	Load address of base of array board
661:     ST  3,-3(1)	Save left side 
662:     LD  3,-2(1)	Load variable m
663:     LD  4,-3(1)	Load left into ac1 
664:    SUB  3,4,3	compute location from index 
665:     LD  3,0(3)	Load array element 
666:     ST  3,-3(1)	Save left side 
667:    LDC  3,0(6)	Load integer constant 
668:     LD  4,-3(1)	Load left into ac1 
669:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* IF
671:     LD  3,-2(1)	Load variable m
672:     ST  3,-3(1)	Save left side 
673:    LDC  3,9(6)	Load integer constant 
674:     LD  4,-3(1)	Load left into ac1 
675:    TGT  3,4,3	Op > 
* THEN
* IF
677:    LDA  3,-2(0)	Load address of base of array board
678:     ST  3,-3(1)	Save left side 
679:     LD  3,-2(1)	Load variable m
680:     ST  3,-4(1)	Save left side 
681:    LDC  3,10(6)	Load integer constant 
682:     LD  4,-4(1)	Load left into ac1 
683:    SUB  3,4,3	Op - 
684:     LD  4,-3(1)	Load left into ac1 
685:    SUB  3,4,3	compute location from index 
686:     LD  3,0(3)	Load array element 
687:     ST  3,-3(1)	Save left side 
688:    LDC  3,0(6)	Load integer constant 
689:     LD  4,-3(1)	Load left into ac1 
690:    TEQ  3,4,3	Op == 
691:     ST  3,-3(1)	Save left side 
692:    LDA  3,-103(0)	Load address of base of array guess
693:     ST  3,-4(1)	Save left side 
694:     LD  3,-2(1)	Load variable m
695:     ST  3,-5(1)	Save left side 
696:    LDC  3,10(6)	Load integer constant 
697:     LD  4,-5(1)	Load left into ac1 
698:    SUB  3,4,3	Op - 
699:     LD  4,-4(1)	Load left into ac1 
700:    SUB  3,4,3	compute location from index 
701:     LD  3,0(3)	Load array element 
702:    LDC  4,1(6)	Load 1 
703:    XOR  3,3,4	Op NOT 
704:     LD  4,-3(1)	Load left into ac1 
705:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
707:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
708:     LD  3,-2(1)	Load variable m
709:     ST  3,-5(1)	Save left side 
710:    LDC  3,10(6)	Load integer constant 
711:     LD  4,-5(1)	Load left into ac1 
712:    SUB  3,4,3	Op - 
713:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
714:    LDA  1,-3(1)	Load address of new frame 
715:    LDA  3,1(7)	Return address in ac 
716:    LDA  7,-65(7)	CALL Move
717:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
706:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
676:    JZR  3,41(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
718:     LD  3,-2(1)	Load variable m
719:     ST  3,-3(1)	Save left side 
720:    LDC  3,10(6)	Load integer constant 
721:     LD  4,-3(1)	Load left into ac1 
722:    DIV  5,4,3	Op % 
723:    MUL  5,5,3	 
724:    SUB  3,4,5	 
725:     ST  3,-3(1)	Save left side 
726:    LDC  3,0(6)	Load integer constant 
727:     LD  4,-3(1)	Load left into ac1 
728:    TNE  3,4,3	Op != 
* THEN
* IF
730:    LDA  3,-2(0)	Load address of base of array board
731:     ST  3,-3(1)	Save left side 
732:     LD  3,-2(1)	Load variable m
733:     ST  3,-4(1)	Save left side 
734:    LDC  3,1(6)	Load integer constant 
735:     LD  4,-4(1)	Load left into ac1 
736:    SUB  3,4,3	Op - 
737:     LD  4,-3(1)	Load left into ac1 
738:    SUB  3,4,3	compute location from index 
739:     LD  3,0(3)	Load array element 
740:     ST  3,-3(1)	Save left side 
741:    LDC  3,0(6)	Load integer constant 
742:     LD  4,-3(1)	Load left into ac1 
743:    TEQ  3,4,3	Op == 
744:     ST  3,-3(1)	Save left side 
745:    LDA  3,-103(0)	Load address of base of array guess
746:     ST  3,-4(1)	Save left side 
747:     LD  3,-2(1)	Load variable m
748:     ST  3,-5(1)	Save left side 
749:    LDC  3,1(6)	Load integer constant 
750:     LD  4,-5(1)	Load left into ac1 
751:    SUB  3,4,3	Op - 
752:     LD  4,-4(1)	Load left into ac1 
753:    SUB  3,4,3	compute location from index 
754:     LD  3,0(3)	Load array element 
755:    LDC  4,1(6)	Load 1 
756:    XOR  3,3,4	Op NOT 
757:     LD  4,-3(1)	Load left into ac1 
758:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
760:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
761:     LD  3,-2(1)	Load variable m
762:     ST  3,-5(1)	Save left side 
763:    LDC  3,1(6)	Load integer constant 
764:     LD  4,-5(1)	Load left into ac1 
765:    SUB  3,4,3	Op - 
766:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
767:    LDA  1,-3(1)	Load address of new frame 
768:    LDA  3,1(7)	Return address in ac 
769:    LDA  7,-118(7)	CALL Move
770:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
759:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
729:    JZR  3,41(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
771:     LD  3,-2(1)	Load variable m
772:     ST  3,-3(1)	Save left side 
773:    LDC  3,9(6)	Load integer constant 
774:     LD  4,-3(1)	Load left into ac1 
775:    DIV  5,4,3	Op % 
776:    MUL  5,5,3	 
777:    SUB  3,4,5	 
778:     ST  3,-3(1)	Save left side 
779:    LDC  3,0(6)	Load integer constant 
780:     LD  4,-3(1)	Load left into ac1 
781:    TNE  3,4,3	Op != 
782:     ST  3,-3(1)	Save left side 
783:     LD  3,-2(1)	Load variable m
784:     ST  3,-4(1)	Save left side 
785:    LDC  3,0(6)	Load integer constant 
786:     LD  4,-4(1)	Load left into ac1 
787:    TEQ  3,4,3	Op == 
788:     LD  4,-3(1)	Load left into ac1 
789:     OR  3,4,3	Op OR 
* THEN
* IF
791:    LDA  3,-2(0)	Load address of base of array board
792:     ST  3,-3(1)	Save left side 
793:     LD  3,-2(1)	Load variable m
794:     ST  3,-4(1)	Save left side 
795:    LDC  3,1(6)	Load integer constant 
796:     LD  4,-4(1)	Load left into ac1 
797:    ADD  3,4,3	Op + 
798:     LD  4,-3(1)	Load left into ac1 
799:    SUB  3,4,3	compute location from index 
800:     LD  3,0(3)	Load array element 
801:     ST  3,-3(1)	Save left side 
802:    LDC  3,0(6)	Load integer constant 
803:     LD  4,-3(1)	Load left into ac1 
804:    TEQ  3,4,3	Op == 
805:     ST  3,-3(1)	Save left side 
806:    LDA  3,-103(0)	Load address of base of array guess
807:     ST  3,-4(1)	Save left side 
808:     LD  3,-2(1)	Load variable m
809:     ST  3,-5(1)	Save left side 
810:    LDC  3,1(6)	Load integer constant 
811:     LD  4,-5(1)	Load left into ac1 
812:    ADD  3,4,3	Op + 
813:     LD  4,-4(1)	Load left into ac1 
814:    SUB  3,4,3	compute location from index 
815:     LD  3,0(3)	Load array element 
816:    LDC  4,1(6)	Load 1 
817:    XOR  3,3,4	Op NOT 
818:     LD  4,-3(1)	Load left into ac1 
819:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
821:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
822:     LD  3,-2(1)	Load variable m
823:     ST  3,-5(1)	Save left side 
824:    LDC  3,1(6)	Load integer constant 
825:     LD  4,-5(1)	Load left into ac1 
826:    ADD  3,4,3	Op + 
827:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
828:    LDA  1,-3(1)	Load address of new frame 
829:    LDA  3,1(7)	Return address in ac 
830:    LDA  7,-179(7)	CALL Move
831:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
820:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
790:    JZR  3,41(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
832:     LD  3,-2(1)	Load variable m
833:     ST  3,-3(1)	Save left side 
834:    LDC  3,90(6)	Load integer constant 
835:     LD  4,-3(1)	Load left into ac1 
836:    TLT  3,4,3	Op < 
* THEN
* IF
838:    LDA  3,-2(0)	Load address of base of array board
839:     ST  3,-3(1)	Save left side 
840:     LD  3,-2(1)	Load variable m
841:     ST  3,-4(1)	Save left side 
842:    LDC  3,10(6)	Load integer constant 
843:     LD  4,-4(1)	Load left into ac1 
844:    ADD  3,4,3	Op + 
845:     LD  4,-3(1)	Load left into ac1 
846:    SUB  3,4,3	compute location from index 
847:     LD  3,0(3)	Load array element 
848:     ST  3,-3(1)	Save left side 
849:    LDC  3,0(6)	Load integer constant 
850:     LD  4,-3(1)	Load left into ac1 
851:    TEQ  3,4,3	Op == 
852:     ST  3,-3(1)	Save left side 
853:    LDA  3,-103(0)	Load address of base of array guess
854:     ST  3,-4(1)	Save left side 
855:     LD  3,-2(1)	Load variable m
856:     ST  3,-5(1)	Save left side 
857:    LDC  3,10(6)	Load integer constant 
858:     LD  4,-5(1)	Load left into ac1 
859:    ADD  3,4,3	Op + 
860:     LD  4,-4(1)	Load left into ac1 
861:    SUB  3,4,3	compute location from index 
862:     LD  3,0(3)	Load array element 
863:    LDC  4,1(6)	Load 1 
864:    XOR  3,3,4	Op NOT 
865:     LD  4,-3(1)	Load left into ac1 
866:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
868:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
869:     LD  3,-2(1)	Load variable m
870:     ST  3,-5(1)	Save left side 
871:    LDC  3,10(6)	Load integer constant 
872:     LD  4,-5(1)	Load left into ac1 
873:    ADD  3,4,3	Op + 
874:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
875:    LDA  1,-3(1)	Load address of new frame 
876:    LDA  3,1(7)	Return address in ac 
877:    LDA  7,-226(7)	CALL Move
878:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
867:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
837:    JZR  3,41(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
670:    JZR  3,208(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
879:    LDC  2,0(6)	Set return value to 0 
880:     LD  3,-1(1)	Load return address 
881:     LD  1,0(1)	Adjust fp 
882:    LDA  7,0(3)	Return 
* END FUNCTION Move
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
883:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  input
884:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
885:    LDA  1,-5(1)	Load address of new frame 
886:    LDA  3,1(7)	Return address in ac 
887:    LDA  7,-887(7)	CALL input
888:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
889:     ST  3,0(0)	Store variable seed
* EXPRESSION
*                       Begin call to  CreateBoard
890:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to CreateBoard
891:    LDA  1,-5(1)	Load address of new frame 
892:    LDA  3,1(7)	Return address in ac 
893:    LDA  7,-806(7)	CALL CreateBoard
894:    LDA  3,0(2)	Save the result in ac 
*                       End call to CreateBoard
* WHILE
895:    LDC  3,1(6)	Load Boolean constant 
896:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  PrintBoard
898:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
899:    LDA  1,-5(1)	Load address of new frame 
900:    LDA  3,1(7)	Return address in ac 
901:    LDA  7,-356(7)	CALL PrintBoard
902:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  input
903:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
904:    LDA  1,-5(1)	Load address of new frame 
905:    LDA  3,1(7)	Return address in ac 
906:    LDA  7,-906(7)	CALL input
907:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
908:     ST  3,-5(1)	Save left side 
909:    LDC  3,1(6)	Load integer constant 
910:     LD  4,-5(1)	Load left into ac1 
911:    SUB  3,4,3	Op - 
912:     ST  3,-3(1)	Store variable x
* EXPRESSION
*                       Begin call to  input
913:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
914:    LDA  1,-5(1)	Load address of new frame 
915:    LDA  3,1(7)	Return address in ac 
916:    LDA  7,-916(7)	CALL input
917:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
918:     ST  3,-5(1)	Save left side 
919:    LDC  3,1(6)	Load integer constant 
920:     LD  4,-5(1)	Load left into ac1 
921:    SUB  3,4,3	Op - 
922:     ST  3,-4(1)	Store variable y
* IF
923:     LD  3,-3(1)	Load variable x
924:     ST  3,-5(1)	Save left side 
925:    LDC  3,9(6)	Load integer constant 
926:     LD  4,-5(1)	Load left into ac1 
927:    TGT  3,4,3	Op > 
928:     ST  3,-5(1)	Save left side 
929:     LD  3,-4(1)	Load variable y
930:     ST  3,-6(1)	Save left side 
931:    LDC  3,9(6)	Load integer constant 
932:     LD  4,-6(1)	Load left into ac1 
933:    TGT  3,4,3	Op > 
934:     LD  4,-5(1)	Load left into ac1 
935:     OR  3,4,3	Op OR 
936:     ST  3,-5(1)	Save left side 
937:     LD  3,-3(1)	Load variable x
938:     ST  3,-6(1)	Save left side 
939:    LDC  3,0(6)	Load integer constant 
940:     LD  4,-6(1)	Load left into ac1 
941:    TLT  3,4,3	Op < 
942:     LD  4,-5(1)	Load left into ac1 
943:     OR  3,4,3	Op OR 
944:     ST  3,-5(1)	Save left side 
945:     LD  3,-4(1)	Load variable y
946:     ST  3,-6(1)	Save left side 
947:    LDC  3,0(6)	Load integer constant 
948:     LD  4,-6(1)	Load left into ac1 
949:    TLT  3,4,3	Op < 
950:     LD  4,-5(1)	Load left into ac1 
951:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputc
953:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
954:    LDC  3,66(6)	Load char constant 
955:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
956:    LDA  1,-5(1)	Load address of new frame 
957:    LDA  3,1(7)	Return address in ac 
958:    LDA  7,-929(7)	CALL outputc
959:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
960:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
961:    LDC  3,89(6)	Load char constant 
962:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
963:    LDA  1,-5(1)	Load address of new frame 
964:    LDA  3,1(7)	Return address in ac 
965:    LDA  7,-936(7)	CALL outputc
966:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
967:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
968:    LDC  3,69(6)	Load char constant 
969:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
970:    LDA  1,-5(1)	Load address of new frame 
971:    LDA  3,1(7)	Return address in ac 
972:    LDA  7,-943(7)	CALL outputc
973:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
974:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
975:    LDA  1,-5(1)	Load address of new frame 
976:    LDA  3,1(7)	Return address in ac 
977:    LDA  7,-941(7)	CALL outnl
978:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
979:    LDA  7,-83(7)	break 
* END COMPOUND
952:    JZR  3,27(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
980:    LDA  3,-2(0)	Load address of base of array board
981:     ST  3,-5(1)	Save left side 
982:     LD  3,-3(1)	Load variable x
983:     ST  3,-6(1)	Save left side 
984:    LDC  3,10(6)	Load integer constant 
985:     LD  4,-6(1)	Load left into ac1 
986:    MUL  3,4,3	Op * 
987:     ST  3,-6(1)	Save left side 
988:     LD  3,-4(1)	Load variable y
989:     LD  4,-6(1)	Load left into ac1 
990:    ADD  3,4,3	Op + 
991:     LD  4,-5(1)	Load left into ac1 
992:    SUB  3,4,3	compute location from index 
993:     LD  3,0(3)	Load array element 
994:     ST  3,-5(1)	Save left side 
995:    LDC  3,1(6)	Load integer constant 
996:    LDC  4,0(6)	Load 0 
997:    SUB  3,4,3	Op unary - 
998:     LD  4,-5(1)	Load left into ac1 
999:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1001:    LDC  3,0(6)	Load integer constant 
1002:     ST  3,-2(1)	Store variable i
* WHILE
1003:     LD  3,-2(1)	Load variable i
1004:     ST  3,-5(1)	Save left side 
1005:    LDC  3,100(6)	Load integer constant 
1006:     LD  4,-5(1)	Load left into ac1 
1007:    TLT  3,4,3	Op < 
1008:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
1010:     LD  3,-2(1)	Load variable i
1011:     ST  3,-5(1)	Save index 
1012:    LDC  3,1(6)	Load Boolean constant 
1013:     LD  4,-5(1)	Restore index 
1014:    LDA  5,-103(0)	Load address of base of array guess
1015:    SUB  5,5,4	Compute offset of value 
1016:     ST  3,0(5)	Store variable guess
* EXPRESSION
1017:    LDC  3,1(6)	Load integer constant 
1018:     LD  4,-2(1)	load lhs variable i
1019:    ADD  3,4,3	op += 
1020:     ST  3,-2(1)	Store variable i
* END COMPOUND
1021:    LDA  7,-19(7)	go to beginning of loop 
1009:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  PrintBoard
1022:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
1023:    LDA  1,-5(1)	Load address of new frame 
1024:    LDA  3,1(7)	Return address in ac 
1025:    LDA  7,-480(7)	CALL PrintBoard
1026:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  outputc
1027:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1028:    LDC  3,66(6)	Load char constant 
1029:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1030:    LDA  1,-5(1)	Load address of new frame 
1031:    LDA  3,1(7)	Return address in ac 
1032:    LDA  7,-1003(7)	CALL outputc
1033:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1034:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1035:    LDC  3,79(6)	Load char constant 
1036:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1037:    LDA  1,-5(1)	Load address of new frame 
1038:    LDA  3,1(7)	Return address in ac 
1039:    LDA  7,-1010(7)	CALL outputc
1040:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1041:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1042:    LDC  3,79(6)	Load char constant 
1043:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1044:    LDA  1,-5(1)	Load address of new frame 
1045:    LDA  3,1(7)	Return address in ac 
1046:    LDA  7,-1017(7)	CALL outputc
1047:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1048:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1049:    LDC  3,77(6)	Load char constant 
1050:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1051:    LDA  1,-5(1)	Load address of new frame 
1052:    LDA  3,1(7)	Return address in ac 
1053:    LDA  7,-1024(7)	CALL outputc
1054:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1055:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1056:    LDC  3,33(6)	Load char constant 
1057:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1058:    LDA  1,-5(1)	Load address of new frame 
1059:    LDA  3,1(7)	Return address in ac 
1060:    LDA  7,-1031(7)	CALL outputc
1061:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
1062:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
1063:    LDA  1,-5(1)	Load address of new frame 
1064:    LDA  3,1(7)	Return address in ac 
1065:    LDA  7,-1029(7)	CALL outnl
1066:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
1067:    LDA  7,-171(7)	break 
* END COMPOUND
1000:    JZR  3,67(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
1068:    LDC  3,0(6)	Load integer constant 
1069:     ST  3,-2(1)	Store variable i
* WHILE
1070:    LDA  3,-103(0)	Load address of base of array guess
1071:     ST  3,-5(1)	Save left side 
1072:     LD  3,-2(1)	Load variable i
1073:     LD  4,-5(1)	Load left into ac1 
1074:    SUB  3,4,3	compute location from index 
1075:     LD  3,0(3)	Load array element 
1076:     ST  3,-5(1)	Save left side 
1077:    LDC  3,1(6)	Load Boolean constant 
1078:     LD  4,-5(1)	Load left into ac1 
1079:    TEQ  3,4,3	Op == 
1080:     ST  3,-5(1)	Save left side 
1081:     LD  3,-2(1)	Load variable i
1082:     ST  3,-6(1)	Save left side 
1083:    LDC  3,100(6)	Load integer constant 
1084:     LD  4,-6(1)	Load left into ac1 
1085:    TLT  3,4,3	Op < 
1086:     LD  4,-5(1)	Load left into ac1 
1087:    AND  3,4,3	Op AND 
1088:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
1090:    LDC  3,1(6)	Load integer constant 
1091:     LD  4,-2(1)	load lhs variable i
1092:    ADD  3,4,3	op += 
1093:     ST  3,-2(1)	Store variable i
1094:    LDA  7,-25(7)	go to beginning of loop 
1089:    LDA  7,5(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
1095:     LD  3,-2(1)	Load variable i
1096:     ST  3,-5(1)	Save left side 
1097:    LDC  3,100(6)	Load integer constant 
1098:     LD  4,-5(1)	Load left into ac1 
1099:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  PrintBoard
1101:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
1102:    LDA  1,-5(1)	Load address of new frame 
1103:    LDA  3,1(7)	Return address in ac 
1104:    LDA  7,-559(7)	CALL PrintBoard
1105:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  outputc
1106:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1107:    LDC  3,89(6)	Load char constant 
1108:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1109:    LDA  1,-5(1)	Load address of new frame 
1110:    LDA  3,1(7)	Return address in ac 
1111:    LDA  7,-1082(7)	CALL outputc
1112:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1113:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1114:    LDC  3,65(6)	Load char constant 
1115:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1116:    LDA  1,-5(1)	Load address of new frame 
1117:    LDA  3,1(7)	Return address in ac 
1118:    LDA  7,-1089(7)	CALL outputc
1119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1120:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1121:    LDC  3,89(6)	Load char constant 
1122:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1123:    LDA  1,-5(1)	Load address of new frame 
1124:    LDA  3,1(7)	Return address in ac 
1125:    LDA  7,-1096(7)	CALL outputc
1126:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1127:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1128:    LDC  3,33(6)	Load char constant 
1129:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1130:    LDA  1,-5(1)	Load address of new frame 
1131:    LDA  3,1(7)	Return address in ac 
1132:    LDA  7,-1103(7)	CALL outputc
1133:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
1134:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
1135:    LDA  1,-5(1)	Load address of new frame 
1136:    LDA  3,1(7)	Return address in ac 
1137:    LDA  7,-1101(7)	CALL outnl
1138:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
1139:    LDA  7,-243(7)	break 
* END COMPOUND
1100:    JZR  3,39(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  Move
1140:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1141:     LD  3,-3(1)	Load variable x
1142:     ST  3,-7(1)	Save left side 
1143:     LD  3,-4(1)	Load variable y
1144:     ST  3,-8(1)	Save left side 
1145:    LDC  3,10(6)	Load integer constant 
1146:     LD  4,-8(1)	Load left into ac1 
1147:    MUL  3,4,3	Op * 
1148:     LD  4,-7(1)	Load left into ac1 
1149:    ADD  3,4,3	Op + 
1150:     ST  3,-7(1)	Store parameter 
*                       Jump to Move
1151:    LDA  1,-5(1)	Load address of new frame 
1152:    LDA  3,1(7)	Return address in ac 
1153:    LDA  7,-502(7)	CALL Move
1154:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
* END COMPOUND
1155:    LDA  7,-261(7)	go to beginning of loop 
897:    LDA  7,258(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
1156:    LDC  2,0(6)	Set return value to 0 
1157:     LD  3,-1(1)	Load return address 
1158:     LD  1,0(1)	Adjust fp 
1159:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,1159(7)	Jump to init [backpatch] 
* INIT
1160:     LD  0,0(0)	Set the global pointer 
1161:    LDA  1,-203(0)	set first frame at end of globals 
1162:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
1163:    LDC  3,100(6)	load size of array board
1164:     ST  3,-1(0)	save size of array board
1165:    LDC  3,100(6)	load size of array guess
1166:     ST  3,-102(0)	save size of array guess
* END INIT GLOBALS AND STATICS
1167:    LDA  3,1(7)	Return address in ac 
1168:    LDA  7,-286(7)	Jump to main 
1169:   HALT  0,0,0	DONE! 
* END INIT
