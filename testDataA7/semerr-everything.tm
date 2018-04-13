* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  semerr-everything.c-
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
* FUNCTION wallace
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-4(1)	Load variable close
* EXPRESSION
 44:     LD  3,-5(1)	Load variable shave
 45:     ST  3,-4(1)	Store variable close
* EXPRESSION
 46:     LD  3,-3(1)	Load variable trousers
 47:     ST  3,-6(1)	Save left side 
 48:    LDC  3,666(6)	Load integer constant 
 49:     ST  3,-7(1)	Save left side 
 50:     LD  3,-2(1)	Load variable wrong
 51:     LD  4,-7(1)	Load left into ac1 
 52:    DIV  3,4,3	Op / 
 53:     LD  4,-6(1)	Load left into ac1 
 54:    DIV  5,4,3	Op % 
 55:    MUL  5,5,3	 
 56:    SUB  3,4,5	 
 57:     ST  3,-2(1)	Store variable wrong
* EXPRESSION
 58:     LD  3,-2(1)	Load variable wrong
 59:     ST  3,-6(1)	Save left side 
 60:     LD  3,-3(1)	Load variable trousers
 61:     LD  4,-6(1)	Load left into ac1 
 62:    MUL  3,4,3	Op * 
 63:     ST  3,-6(1)	Save left side 
 64:     LD  3,0(0)	Load variable gromit
 65:     LD  4,-6(1)	Load left into ac1 
 66:    SUB  3,4,3	Op - 
 67:     ST  3,-6(1)	Save left side 
 68:    LDC  3,42(6)	Load integer constant 
 69:    LDC  4,0(6)	Load 0 
 70:    SUB  3,4,3	Op unary - 
 71:     LD  4,-6(1)	Load left into ac1 
 72:    ADD  3,4,3	Op + 
 73:     ST  3,0(0)	Store variable gromit
* EXPRESSION
 74:    LDC  3,27182818(6)	Load integer constant 
 75:     LD  4,0(0)	load lhs variable gromit
 76:    ADD  3,4,3	op += 
 77:     ST  3,0(0)	Store variable gromit
* EXPRESSION
 78:    LDC  3,31415927(6)	Load integer constant 
 79:     LD  4,0(0)	load lhs variable gromit
 80:    SUB  3,4,3	op -= 
 81:     ST  3,0(0)	Store variable gromit
* EXPRESSION
 82:     LD  3,-2(1)	Load variable wrong
 83:     ST  3,-6(1)	Save left side 
 84:     LD  3,-3(1)	Load variable trousers
 85:     LD  4,-6(1)	Load left into ac1 
 86:    TLT  3,4,3	Op < 
 87:     ST  3,-6(1)	Save left side 
 88:     LD  3,-3(1)	Load variable trousers
 89:     ST  3,-7(1)	Save left side 
 90:     LD  3,0(0)	Load variable gromit
 91:     LD  4,-7(1)	Load left into ac1 
 92:    TLE  3,4,3	Op <= 
 93:     LD  4,-6(1)	Load left into ac1 
 94:    AND  3,4,3	Op AND 
 95:     ST  3,-4(1)	Store variable close
* EXPRESSION
 96:     LD  3,-2(1)	Load variable wrong
 97:     ST  3,-6(1)	Save left side 
 98:     LD  3,-3(1)	Load variable trousers
 99:     LD  4,-6(1)	Load left into ac1 
100:    TGT  3,4,3	Op > 
101:     ST  3,-6(1)	Save left side 
102:     LD  3,-3(1)	Load variable trousers
103:     ST  3,-7(1)	Save left side 
104:     LD  3,0(0)	Load variable gromit
105:     LD  4,-7(1)	Load left into ac1 
106:    TGE  3,4,3	Op >= 
107:     LD  4,-6(1)	Load left into ac1 
108:    AND  3,4,3	Op AND 
109:     ST  3,-5(1)	Store variable shave
* COMPOUND
* Compound Body
* EXPRESSION
110:     LD  3,-9(1)	Load variable out
111:     LD  4,-8(1)	load lhs variable day
112:    SUB  3,4,3	op -= 
113:     ST  3,-8(1)	Store variable day
114:     LD  4,-7(1)	load lhs variable grand
115:    ADD  3,4,3	op += 
116:     ST  3,-7(1)	Store variable grand
117:     ST  3,-6(1)	Store variable a
* END COMPOUND
* EXPRESSION
118:    LDC  3,1(6)	Load integer constant 
119:    LDC  4,0(6)	Load 0 
120:    SUB  3,4,3	Op unary - 
121:     ST  3,-6(1)	Save left side 
122:    LDC  3,2(6)	Load integer constant 
123:     LD  4,-6(1)	Load left into ac1 
124:    MUL  3,4,3	Op * 
125:     ST  3,-6(1)	Save left side 
126:    LDC  3,3(6)	Load integer constant 
127:     LD  4,-6(1)	Load left into ac1 
128:    ADD  3,4,3	Op + 
129:     ST  3,-6(1)	Save left side 
130:    LDC  3,4(6)	Load integer constant 
131:     ST  3,-7(1)	Save left side 
132:    LDC  3,5(6)	Load integer constant 
133:     LD  4,-7(1)	Load left into ac1 
134:    MUL  3,4,3	Op * 
135:     LD  4,-6(1)	Load left into ac1 
136:    TLT  3,4,3	Op < 
137:     ST  3,-6(1)	Save left side 
138:    LDC  3,6(6)	Load integer constant 
139:     ST  3,-7(1)	Save left side 
140:    LDC  3,7(6)	Load integer constant 
141:     LD  4,-7(1)	Load left into ac1 
142:    ADD  3,4,3	Op + 
143:     ST  3,-7(1)	Save left side 
144:    LDC  3,3(6)	Load integer constant 
145:    LDC  4,0(6)	Load 0 
146:    SUB  3,4,3	Op unary - 
147:     LD  4,-7(1)	Load left into ac1 
148:    TGT  3,4,3	Op > 
149:     LD  4,-6(1)	Load left into ac1 
150:    AND  3,4,3	Op AND 
151:     ST  3,-4(1)	Store variable close
* EXPRESSION
152:    LDC  3,1(6)	Load Boolean constant 
153:     ST  3,-6(1)	Save left side 
154:    LDC  3,1(6)	Load integer constant 
155:     ST  3,-7(1)	Save left side 
156:    LDC  3,2(6)	Load integer constant 
157:     ST  3,-8(1)	Save left side 
158:    LDC  3,3(6)	Load integer constant 
159:     LD  4,-8(1)	Load left into ac1 
160:    ADD  3,4,3	Op + 
161:     LD  4,-7(1)	Load left into ac1 
162:    MUL  3,4,3	Op * 
163:    LDC  4,0(6)	Load 0 
164:    SUB  3,4,3	Op unary - 
165:     ST  3,-7(1)	Save left side 
166:    LDC  3,4(6)	Load integer constant 
167:     ST  3,-8(1)	Save left side 
168:    LDC  3,5(6)	Load integer constant 
169:     LD  4,-8(1)	Load left into ac1 
170:    MUL  3,4,3	Op * 
171:     LD  4,-7(1)	Load left into ac1 
172:    TLT  3,4,3	Op < 
173:     ST  3,-7(1)	Save left side 
174:    LDC  3,6(6)	Load integer constant 
175:     ST  3,-8(1)	Save left side 
176:    LDC  3,7(6)	Load integer constant 
177:     LD  4,-8(1)	Load left into ac1 
178:    ADD  3,4,3	Op + 
179:     ST  3,-8(1)	Save left side 
180:    LDC  3,3(6)	Load integer constant 
181:    LDC  4,0(6)	Load 0 
182:    SUB  3,4,3	Op unary - 
183:     LD  4,-8(1)	Load left into ac1 
184:    TGT  3,4,3	Op > 
185:     LD  4,-7(1)	Load left into ac1 
186:    AND  3,4,3	Op AND 
187:     LD  4,-6(1)	Load left into ac1 
188:     OR  3,4,3	Op OR 
189:     ST  3,-5(1)	Store variable shave
* IF
190:     LD  3,-5(1)	Load variable shave
191:     ST  3,-6(1)	Save left side 
192:     LD  3,-4(1)	Load variable close
193:     LD  4,-6(1)	Load left into ac1 
194:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
196:     LD  3,-4(1)	Load variable close
197:    LDC  4,1(6)	Load 1 
198:    XOR  3,3,4	Op NOT 
199:     ST  3,-5(1)	Store variable shave
195:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
200:     LD  3,-5(1)	Load variable shave
201:     ST  3,-6(1)	Save left side 
202:     LD  3,-4(1)	Load variable close
203:     LD  4,-6(1)	Load left into ac1 
204:    TEQ  3,4,3	Op == 
205:    LDC  4,1(6)	Load 1 
206:    XOR  3,3,4	Op NOT 
207:     ST  3,-6(1)	Save left side 
208:     LD  3,-4(1)	Load variable close
209:    LDC  4,1(6)	Load 1 
210:    XOR  3,3,4	Op NOT 
211:     LD  4,-6(1)	Load left into ac1 
212:     OR  3,4,3	Op OR 
* THEN
* EXPRESSION
214:    LDC  3,1(6)	Load Boolean constant 
215:     ST  3,-5(1)	Store variable shave
213:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
217:    LDC  3,0(6)	Load Boolean constant 
218:     ST  3,-4(1)	Store variable close
216:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* WHILE
219:     LD  3,-5(1)	Load variable shave
220:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
222:    LDC  3,10(6)	load size of array sheep
223:     ST  3,-12(1)	save size of array sheep
* Compound Body
* EXPRESSION
224:    LDC  3,2(6)	Load integer constant 
225:     ST  3,-23(1)	Save index 
226:    LDC  3,1618(6)	Load integer constant 
227:     LD  4,-23(1)	Restore index 
228:    LDA  5,-13(1)	Load address of base of array sheep
229:    SUB  5,5,4	Compute offset of value 
230:     ST  3,0(5)	Store variable sheep
* IF
231:    LDA  3,-13(1)	Load address of base of array sheep
232:     ST  3,-23(1)	Save left side 
233:    LDC  3,2(6)	Load integer constant 
234:     LD  4,-23(1)	Load left into ac1 
235:    SUB  3,4,3	compute location from index 
236:     LD  3,0(3)	Load array element 
237:     ST  3,-23(1)	Save left side 
238:    LDC  3,496(6)	Load integer constant 
239:     LD  4,-23(1)	Load left into ac1 
240:    TLT  3,4,3	Op < 
* THEN
* BREAK
242:    LDA  7,-22(7)	break 
241:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  wallace
243:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
244:     LD  3,0(0)	load lhs variable gromit
245:    LDA  3,-1(3)	decrement value of gromit
246:     ST  3,0(0)	Store variable gromit
247:     ST  3,-25(1)	Store parameter 
*                       Load param 2
248:     LD  3,-10(1)	Load variable were
249:     ST  3,-26(1)	Save left side 
250:     LD  3,-11(1)	Load variable rabbit
251:     LD  4,-26(1)	Load left into ac1 
252:    SUB  3,4,3	Op - 
253:     ST  3,-26(1)	Store parameter 
*                       Jump to wallace
254:    LDA  1,-23(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-215(7)	CALL wallace
257:    LDA  3,0(2)	Save the result in ac 
*                       End call to wallace
* COMPOUND
* Compound Body
* EXPRESSION
258:     LD  3,-25(1)	load lhs variable trousers
259:    LDA  3,1(3)	increment value of trousers
260:     ST  3,-25(1)	Store variable trousers
261:     LD  4,-24(1)	load lhs variable wrong
262:    ADD  3,4,3	op += 
263:     ST  3,-24(1)	Store variable wrong
264:     ST  3,-23(1)	Store variable the
* IF
265:     LD  3,-10(1)	Load variable were
266:     ST  3,-26(1)	Save left side 
267:     LD  3,-11(1)	Load variable rabbit
268:     LD  4,-26(1)	Load left into ac1 
269:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
271:     LD  3,-24(1)	load lhs variable wrong
272:    LDA  3,-1(3)	decrement value of wrong
273:     ST  3,-24(1)	Store variable wrong
274:     ST  3,-10(1)	Store variable were
270:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* END COMPOUND
275:    LDA  7,-57(7)	go to beginning of loop 
221:    LDA  7,54(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
276:     LD  3,-1(1)	Load return address 
277:     LD  1,0(1)	Adjust fp 
278:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
279:    LDC  2,0(6)	Set return value to 0 
280:     LD  3,-1(1)	Load return address 
281:     LD  1,0(1)	Adjust fp 
282:    LDA  7,0(3)	Return 
* END FUNCTION wallace
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Wendolene
283:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
284:     LD  3,-2(1)	Load variable wool
285:     ST  3,-6(1)	Save left side 
286:     LD  3,-4(1)	Load address of base of array yarn
287:     ST  3,-7(1)	Save left side 
288:    LDC  3,0(6)	Load integer constant 
289:     LD  4,-7(1)	Load left into ac1 
290:    SUB  3,4,3	compute location from index 
291:     LD  3,0(3)	Load array element 
292:     LD  4,-6(1)	Load left into ac1 
293:    ADD  3,4,3	Op + 
294:     ST  3,-6(1)	Save left side 
295:     LD  3,-4(1)	Load address of base of array yarn
296:     LD  3,1(3)	Load array size 
297:     LD  4,-6(1)	Load left into ac1 
298:    ADD  3,4,3	Op + 
299:     ST  3,-6(1)	Save left side 
300:     LD  3,-4(1)	Load address of base of array yarn
301:     ST  3,-7(1)	Save left side 
302:    LDC  3,7(6)	Load integer constant 
303:     ST  3,-8(1)	Save left side 
304:     LD  3,-2(1)	Load variable wool
305:     LD  4,-8(1)	Load left into ac1 
306:    MUL  3,4,3	Op * 
307:     LD  4,-7(1)	Load left into ac1 
308:    SUB  3,4,3	compute location from index 
309:     LD  3,0(3)	Load array element 
310:     LD  4,-6(1)	Load left into ac1 
311:    ADD  3,4,3	Op + 
312:    LDA  2,0(3)	Copy result to rt register 
313:     LD  3,-1(1)	Load return address 
314:     LD  1,0(1)	Adjust fp 
315:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
316:    LDC  2,0(6)	Set return value to 0 
317:     LD  3,-1(1)	Load return address 
318:     LD  1,0(1)	Adjust fp 
319:    LDA  7,0(3)	Return 
* END FUNCTION Wendolene
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION ramsBottom
320:     ST  3,-1(1)	Store return address. 
* COMPOUND
321:    LDC  3,2(6)	load size of array chicken
322:     ST  3,-2(1)	save size of array chicken
323:    LDC  3,3(6)	load size of array run
324:     ST  3,-5(1)	save size of array run
325:    LDC  3,2(6)	load size of array wallace
326:     ST  3,-9(1)	save size of array wallace
327:    LDC  3,3(6)	load size of array gromit
328:     ST  3,-12(1)	save size of array gromit
* Compound Body
* EXPRESSION
329:    LDC  3,42(6)	Load integer constant 
330:     ST  3,-16(1)	Save left side 
*                       Begin call to  Wendolene
331:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
332:    LDC  3,1(6)	Load integer constant 
333:     ST  3,-19(1)	Save left side 
334:    LDC  3,2(6)	Load integer constant 
335:     LD  4,-19(1)	Load left into ac1 
336:    ADD  3,4,3	Op + 
337:     ST  3,-19(1)	Save left side 
338:    LDC  3,3(6)	Load integer constant 
339:     LD  4,-19(1)	Load left into ac1 
340:    ADD  3,4,3	Op + 
341:     ST  3,-19(1)	Store parameter 
*                       Load param 2
342:    LDC  3,1(6)	Load Boolean constant 
343:    LDC  4,1(6)	Load 1 
344:    XOR  3,3,4	Op NOT 
345:     ST  3,-20(1)	Save left side 
346:    LDC  3,1(6)	Load Boolean constant 
347:     ST  3,-21(1)	Save left side 
348:    LDC  3,0(6)	Load Boolean constant 
349:     LD  4,-21(1)	Load left into ac1 
350:    AND  3,4,3	Op AND 
351:     LD  4,-20(1)	Load left into ac1 
352:     OR  3,4,3	Op OR 
353:     ST  3,-20(1)	Store parameter 
*                       Load param 3
354:    LDA  3,-3(1)	Load address of base of array chicken
355:     ST  3,-21(1)	Store parameter 
*                       Load param 4
356:    LDA  3,-6(1)	Load address of base of array run
357:     ST  3,-22(1)	Store parameter 
*                       Jump to Wendolene
358:    LDA  1,-17(1)	Load address of new frame 
359:    LDA  3,1(7)	Return address in ac 
360:    LDA  7,-78(7)	CALL Wendolene
361:    LDA  3,0(2)	Save the result in ac 
*                       End call to Wendolene
362:     LD  4,-16(1)	Load left into ac1 
363:    MUL  3,4,3	Op * 
* EXPRESSION
364:    LDA  3,-6(1)	Load address of base of array run
365:     ST  3,-16(1)	Save left side 
366:    LDA  3,-6(1)	Load address of base of array run
367:     LD  3,1(3)	Load array size 
368:     ST  3,-17(1)	Save left side 
369:    LDC  3,1(6)	Load integer constant 
370:     LD  4,-17(1)	Load left into ac1 
371:    SUB  3,4,3	Op - 
372:     LD  4,-16(1)	Load left into ac1 
373:    SUB  3,4,3	compute location from index 
374:     LD  3,0(3)	Load array element 
* RETURN
375:    LDA  3,-10(1)	Load address of base of array wallace
376:     ST  3,-16(1)	Save left side 
377:    LDC  3,1(6)	Load integer constant 
378:     LD  4,-16(1)	Load left into ac1 
379:    SUB  3,4,3	compute location from index 
380:     LD  3,0(3)	Load array element 
381:     ST  3,-16(1)	Save left side 
382:    LDA  3,-13(1)	Load address of base of array gromit
383:     ST  3,-17(1)	Save left side 
384:    LDC  3,2(6)	Load integer constant 
385:     LD  4,-17(1)	Load left into ac1 
386:    SUB  3,4,3	compute location from index 
387:     LD  3,0(3)	Load array element 
388:    LDC  4,0(6)	Load 0 
389:    SUB  3,4,3	Op unary - 
390:     ST  3,-17(1)	Save left side 
391:    LDC  3,3(6)	Load integer constant 
392:     LD  4,-17(1)	Load left into ac1 
393:    MUL  3,4,3	Op * 
394:     LD  4,-16(1)	Load left into ac1 
395:    TGE  3,4,3	Op >= 
396:    LDC  4,1(6)	Load 1 
397:    XOR  3,3,4	Op NOT 
398:    LDA  2,0(3)	Copy result to rt register 
399:     LD  3,-1(1)	Load return address 
400:     LD  1,0(1)	Adjust fp 
401:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
402:    LDC  2,0(6)	Set return value to 0 
403:     LD  3,-1(1)	Load return address 
404:     LD  1,0(1)	Adjust fp 
405:    LDA  7,0(3)	Return 
* END FUNCTION ramsBottom
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cheese
406:     ST  3,-1(1)	Store return address. 
* WHILE
407:     LD  3,-2(1)	Load variable x
408:     ST  3,-4(1)	Save left side 
409:    LDC  3,0(6)	Load integer constant 
410:     LD  4,-4(1)	Load left into ac1 
411:    TGT  3,4,3	Op > 
412:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
414:     LD  3,-3(1)	Load variable y
415:     ST  3,-4(1)	Save left side 
416:    LDC  3,3(6)	Load integer constant 
417:     LD  4,-4(1)	Load left into ac1 
418:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
420:     LD  3,-2(1)	load lhs variable x
421:    LDA  3,-1(3)	decrement value of x
422:     ST  3,-2(1)	Store variable x
419:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
424:     LD  3,-2(1)	Load variable x
425:     ST  3,-4(1)	Save left side 
426:     LD  3,-2(1)	Load variable x
427:     LD  4,-4(1)	Load left into ac1 
428:    MUL  3,4,3	Op * 
429:     ST  3,-4(1)	Save left side 
430:     LD  3,-3(1)	Load variable y
431:     LD  4,-4(1)	Load left into ac1 
432:    DIV  5,4,3	Op % 
433:    MUL  5,5,3	 
434:    SUB  3,4,5	 
435:    LDA  2,0(3)	Copy result to rt register 
436:     LD  3,-1(1)	Load return address 
437:     LD  1,0(1)	Adjust fp 
438:    LDA  7,0(3)	Return 
423:    LDA  7,15(7)	Jump around the ELSE [backpatch] 
* ENDIF
439:    LDA  7,-33(7)	go to beginning of loop 
413:    LDA  7,26(7)	Jump past loop [backpatch] 
* ENDWHILE
* Add standard closing in case there is no return statement
440:    LDC  2,0(6)	Set return value to 0 
441:     LD  3,-1(1)	Load return address 
442:     LD  1,0(1)	Adjust fp 
443:    LDA  7,0(3)	Return 
* END FUNCTION cheese
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Wensleydale
444:     ST  3,-1(1)	Store return address. 
* RETURN
*                       Begin call to  cheese
445:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
446:     LD  3,-2(1)	Load variable x
447:     ST  3,-6(1)	Store parameter 
*                       Load param 2
448:     LD  3,0(0)	Load variable gromit
449:     ST  3,-7(1)	Store parameter 
*                       Jump to cheese
450:    LDA  1,-4(1)	Load address of new frame 
451:    LDA  3,1(7)	Return address in ac 
452:    LDA  7,-47(7)	CALL cheese
453:    LDA  3,0(2)	Save the result in ac 
*                       End call to cheese
454:    LDA  2,0(3)	Copy result to rt register 
455:     LD  3,-1(1)	Load return address 
456:     LD  1,0(1)	Adjust fp 
457:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
458:    LDC  2,0(6)	Set return value to 0 
459:     LD  3,-1(1)	Load return address 
460:     LD  1,0(1)	Adjust fp 
461:    LDA  7,0(3)	Return 
* END FUNCTION Wensleydale
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
462:     ST  3,-1(1)	Store return address. 
* COMPOUND
463:    LDC  3,113(6)	load size of array yarn
464:     ST  3,-3(1)	save size of array yarn
465:    LDC  3,22(6)	load size of array preston
466:     ST  3,-118(1)	save size of array preston
* Compound Body
* EXPRESSION
*                       Begin call to  wallace
467:     ST  1,-141(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cheese
468:     ST  1,-143(1)	Store old fp in ghost frame 
*                       Load param 1
469:    LDC  3,61(6)	Load integer constant 
470:     ST  3,-145(1)	Store parameter 
*                       Load param 2
471:    LDC  3,73(6)	Load integer constant 
472:     ST  3,-146(1)	Store parameter 
*                       Jump to cheese
473:    LDA  1,-143(1)	Load address of new frame 
474:    LDA  3,1(7)	Return address in ac 
475:    LDA  7,-70(7)	CALL cheese
476:    LDA  3,0(2)	Save the result in ac 
*                       End call to cheese
477:     ST  3,-143(1)	Store parameter 
*                       Load param 2
478:     LD  3,0(0)	Load variable gromit
479:     ST  3,-144(1)	Store parameter 
*                       Jump to wallace
480:    LDA  1,-141(1)	Load address of new frame 
481:    LDA  3,1(7)	Return address in ac 
482:    LDA  7,-441(7)	CALL wallace
483:    LDA  3,0(2)	Save the result in ac 
*                       End call to wallace
* RETURN
*                       Begin call to  Wendolene
484:     ST  1,-141(1)	Store old fp in ghost frame 
*                       Load param 1
485:    LDA  3,-119(1)	Load address of base of array preston
486:     LD  3,1(3)	Load array size 
487:     ST  3,-143(1)	Save left side 
488:    LDA  3,-4(1)	Load address of base of array yarn
489:     LD  3,1(3)	Load array size 
490:     LD  4,-143(1)	Load left into ac1 
491:    MUL  3,4,3	Op * 
492:     ST  3,-143(1)	Store parameter 
*                       Load param 2
493:     LD  3,-117(1)	Load variable shawn
494:     ST  3,-144(1)	Store parameter 
*                       Load param 3
495:    LDA  3,-4(1)	Load address of base of array yarn
496:     ST  3,-145(1)	Store parameter 
*                       Load param 4
497:    LDA  3,-119(1)	Load address of base of array preston
498:     ST  3,-146(1)	Store parameter 
*                       Jump to Wendolene
499:    LDA  1,-141(1)	Load address of new frame 
500:    LDA  3,1(7)	Return address in ac 
501:    LDA  7,-219(7)	CALL Wendolene
502:    LDA  3,0(2)	Save the result in ac 
*                       End call to Wendolene
503:    LDA  2,0(3)	Copy result to rt register 
504:     LD  3,-1(1)	Load return address 
505:     LD  1,0(1)	Adjust fp 
506:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
507:    LDC  2,0(6)	Set return value to 0 
508:     LD  3,-1(1)	Load return address 
509:     LD  1,0(1)	Adjust fp 
510:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,510(7)	Jump to init [backpatch] 
* INIT
511:     LD  0,0(0)	Set the global pointer 
512:    LDA  1,-1(0)	set first frame at end of globals 
513:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
514:    LDA  3,1(7)	Return address in ac 
515:    LDA  7,-54(7)	Jump to main 
516:   HALT  0,0,0	DONE! 
* END INIT
