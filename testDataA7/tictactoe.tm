* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  tictactoe.c-
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
* FUNCTION move
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,9(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
 52:    LDA  3,-1(0)	Load address of base of array board
 53:     ST  3,-3(1)	Save left side 
 54:     LD  3,-2(1)	Load variable i
 55:     LD  4,-3(1)	Load left into ac1 
 56:    SUB  3,4,3	compute location from index 
 57:     LD  3,0(3)	Load array element 
 58:     ST  3,-3(1)	Save left side 
 59:    LDC  3,1(6)	Load integer constant 
 60:    LDC  4,0(6)	Load 0 
 61:    SUB  3,4,3	Op unary - 
 62:     LD  4,-3(1)	Load left into ac1 
 63:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* BREAK
 65:    LDA  7,-15(7)	break 
* END COMPOUND
 64:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 66:     LD  3,-2(1)	load lhs variable i
 67:    LDA  3,1(3)	increment value of i
 68:     ST  3,-2(1)	Store variable i
* END COMPOUND
 69:    LDA  7,-25(7)	go to beginning of loop 
 51:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
 70:     LD  3,-2(1)	Load variable i
 71:     ST  3,-3(1)	Save left side 
 72:    LDC  3,9(6)	Load integer constant 
 73:     LD  4,-3(1)	Load left into ac1 
 74:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 76:     LD  3,-2(1)	Load variable i
 77:     ST  3,-3(1)	Save index 
 78:    LDC  3,2(6)	Load integer constant 
 79:     LD  4,-3(1)	Restore index 
 80:    LDA  5,-1(0)	Load address of base of array board
 81:    SUB  5,5,4	Compute offset of value 
 82:     ST  3,0(5)	Store variable board
* EXPRESSION
 83:    LDC  3,1(6)	Load Boolean constant 
 84:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
 75:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
 86:    LDC  3,0(6)	Load Boolean constant 
 87:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
 85:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
* END FUNCTION move
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION win
 92:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
 93:    LDA  3,-1(0)	Load address of base of array board
 94:     ST  3,-2(1)	Save left side 
 95:    LDC  3,0(6)	Load integer constant 
 96:     LD  4,-2(1)	Load left into ac1 
 97:    SUB  3,4,3	compute location from index 
 98:     LD  3,0(3)	Load array element 
 99:     ST  3,-2(1)	Save left side 
100:    LDC  3,2(6)	Load integer constant 
101:     LD  4,-2(1)	Load left into ac1 
102:    TEQ  3,4,3	Op == 
103:     ST  3,-2(1)	Save left side 
104:    LDA  3,-1(0)	Load address of base of array board
105:     ST  3,-3(1)	Save left side 
106:    LDC  3,1(6)	Load integer constant 
107:     LD  4,-3(1)	Load left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
110:     ST  3,-3(1)	Save left side 
111:    LDC  3,2(6)	Load integer constant 
112:     LD  4,-3(1)	Load left into ac1 
113:    TEQ  3,4,3	Op == 
114:     LD  4,-2(1)	Load left into ac1 
115:    AND  3,4,3	Op AND 
116:     ST  3,-2(1)	Save left side 
117:    LDA  3,-1(0)	Load address of base of array board
118:     ST  3,-3(1)	Save left side 
119:    LDC  3,6(6)	Load integer constant 
120:     LD  4,-3(1)	Load left into ac1 
121:    SUB  3,4,3	compute location from index 
122:     LD  3,0(3)	Load array element 
123:     ST  3,-3(1)	Save left side 
124:    LDC  3,2(6)	Load integer constant 
125:     LD  4,-3(1)	Load left into ac1 
126:    TEQ  3,4,3	Op == 
127:     ST  3,-3(1)	Save left side 
128:    LDA  3,-1(0)	Load address of base of array board
129:     ST  3,-4(1)	Save left side 
130:    LDC  3,4(6)	Load integer constant 
131:     LD  4,-4(1)	Load left into ac1 
132:    SUB  3,4,3	compute location from index 
133:     LD  3,0(3)	Load array element 
134:     ST  3,-4(1)	Save left side 
135:    LDC  3,2(6)	Load integer constant 
136:     LD  4,-4(1)	Load left into ac1 
137:    TEQ  3,4,3	Op == 
138:     LD  4,-3(1)	Load left into ac1 
139:    AND  3,4,3	Op AND 
140:     LD  4,-2(1)	Load left into ac1 
141:     OR  3,4,3	Op OR 
142:     ST  3,-2(1)	Save left side 
143:    LDA  3,-1(0)	Load address of base of array board
144:     ST  3,-3(1)	Save left side 
145:    LDC  3,8(6)	Load integer constant 
146:     LD  4,-3(1)	Load left into ac1 
147:    SUB  3,4,3	compute location from index 
148:     LD  3,0(3)	Load array element 
149:     ST  3,-3(1)	Save left side 
150:    LDC  3,2(6)	Load integer constant 
151:     LD  4,-3(1)	Load left into ac1 
152:    TEQ  3,4,3	Op == 
153:     ST  3,-3(1)	Save left side 
154:    LDA  3,-1(0)	Load address of base of array board
155:     ST  3,-4(1)	Save left side 
156:    LDC  3,5(6)	Load integer constant 
157:     LD  4,-4(1)	Load left into ac1 
158:    SUB  3,4,3	compute location from index 
159:     LD  3,0(3)	Load array element 
160:     ST  3,-4(1)	Save left side 
161:    LDC  3,2(6)	Load integer constant 
162:     LD  4,-4(1)	Load left into ac1 
163:    TEQ  3,4,3	Op == 
164:     LD  4,-3(1)	Load left into ac1 
165:    AND  3,4,3	Op AND 
166:     LD  4,-2(1)	Load left into ac1 
167:     OR  3,4,3	Op OR 
168:     ST  3,-2(1)	Save left side 
169:    LDA  3,-1(0)	Load address of base of array board
170:     ST  3,-3(1)	Save left side 
171:    LDC  3,2(6)	Load integer constant 
172:     LD  4,-3(1)	Load left into ac1 
173:    SUB  3,4,3	compute location from index 
174:     LD  3,0(3)	Load array element 
175:     ST  3,-3(1)	Save left side 
176:    LDC  3,1(6)	Load integer constant 
177:    LDC  4,0(6)	Load 0 
178:    SUB  3,4,3	Op unary - 
179:     LD  4,-3(1)	Load left into ac1 
180:    TEQ  3,4,3	Op == 
181:     LD  4,-2(1)	Load left into ac1 
182:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
184:    LDC  3,2(6)	Load integer constant 
185:     ST  3,-2(1)	Save index 
186:    LDC  3,2(6)	Load integer constant 
187:     LD  4,-2(1)	Restore index 
188:    LDA  5,-1(0)	Load address of base of array board
189:    SUB  5,5,4	Compute offset of value 
190:     ST  3,0(5)	Store variable board
* EXPRESSION
191:    LDC  3,0(6)	Load Boolean constant 
192:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
183:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
194:    LDA  3,-1(0)	Load address of base of array board
195:     ST  3,-2(1)	Save left side 
196:    LDC  3,0(6)	Load integer constant 
197:     LD  4,-2(1)	Load left into ac1 
198:    SUB  3,4,3	compute location from index 
199:     LD  3,0(3)	Load array element 
200:     ST  3,-2(1)	Save left side 
201:    LDC  3,2(6)	Load integer constant 
202:     LD  4,-2(1)	Load left into ac1 
203:    TEQ  3,4,3	Op == 
204:     ST  3,-2(1)	Save left side 
205:    LDA  3,-1(0)	Load address of base of array board
206:     ST  3,-3(1)	Save left side 
207:    LDC  3,2(6)	Load integer constant 
208:     LD  4,-3(1)	Load left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
211:     ST  3,-3(1)	Save left side 
212:    LDC  3,2(6)	Load integer constant 
213:     LD  4,-3(1)	Load left into ac1 
214:    TEQ  3,4,3	Op == 
215:     LD  4,-2(1)	Load left into ac1 
216:    AND  3,4,3	Op AND 
217:     ST  3,-2(1)	Save left side 
218:    LDA  3,-1(0)	Load address of base of array board
219:     ST  3,-3(1)	Save left side 
220:    LDC  3,4(6)	Load integer constant 
221:     LD  4,-3(1)	Load left into ac1 
222:    SUB  3,4,3	compute location from index 
223:     LD  3,0(3)	Load array element 
224:     ST  3,-3(1)	Save left side 
225:    LDC  3,2(6)	Load integer constant 
226:     LD  4,-3(1)	Load left into ac1 
227:    TEQ  3,4,3	Op == 
228:     ST  3,-3(1)	Save left side 
229:    LDA  3,-1(0)	Load address of base of array board
230:     ST  3,-4(1)	Save left side 
231:    LDC  3,7(6)	Load integer constant 
232:     LD  4,-4(1)	Load left into ac1 
233:    SUB  3,4,3	compute location from index 
234:     LD  3,0(3)	Load array element 
235:     ST  3,-4(1)	Save left side 
236:    LDC  3,2(6)	Load integer constant 
237:     LD  4,-4(1)	Load left into ac1 
238:    TEQ  3,4,3	Op == 
239:     LD  4,-3(1)	Load left into ac1 
240:    AND  3,4,3	Op AND 
241:     LD  4,-2(1)	Load left into ac1 
242:     OR  3,4,3	Op OR 
243:     ST  3,-2(1)	Save left side 
244:    LDA  3,-1(0)	Load address of base of array board
245:     ST  3,-3(1)	Save left side 
246:    LDC  3,1(6)	Load integer constant 
247:     LD  4,-3(1)	Load left into ac1 
248:    SUB  3,4,3	compute location from index 
249:     LD  3,0(3)	Load array element 
250:     ST  3,-3(1)	Save left side 
251:    LDC  3,1(6)	Load integer constant 
252:    LDC  4,0(6)	Load 0 
253:    SUB  3,4,3	Op unary - 
254:     LD  4,-3(1)	Load left into ac1 
255:    TEQ  3,4,3	Op == 
256:     LD  4,-2(1)	Load left into ac1 
257:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
259:    LDC  3,1(6)	Load integer constant 
260:     ST  3,-2(1)	Save index 
261:    LDC  3,2(6)	Load integer constant 
262:     LD  4,-2(1)	Restore index 
263:    LDA  5,-1(0)	Load address of base of array board
264:    SUB  5,5,4	Compute offset of value 
265:     ST  3,0(5)	Store variable board
* EXPRESSION
266:    LDC  3,0(6)	Load Boolean constant 
267:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
258:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
269:    LDA  3,-1(0)	Load address of base of array board
270:     ST  3,-2(1)	Save left side 
271:    LDC  3,2(6)	Load integer constant 
272:     LD  4,-2(1)	Load left into ac1 
273:    SUB  3,4,3	compute location from index 
274:     LD  3,0(3)	Load array element 
275:     ST  3,-2(1)	Save left side 
276:    LDC  3,2(6)	Load integer constant 
277:     LD  4,-2(1)	Load left into ac1 
278:    TEQ  3,4,3	Op == 
279:     ST  3,-2(1)	Save left side 
280:    LDA  3,-1(0)	Load address of base of array board
281:     ST  3,-3(1)	Save left side 
282:    LDC  3,1(6)	Load integer constant 
283:     LD  4,-3(1)	Load left into ac1 
284:    SUB  3,4,3	compute location from index 
285:     LD  3,0(3)	Load array element 
286:     ST  3,-3(1)	Save left side 
287:    LDC  3,2(6)	Load integer constant 
288:     LD  4,-3(1)	Load left into ac1 
289:    TEQ  3,4,3	Op == 
290:     LD  4,-2(1)	Load left into ac1 
291:    AND  3,4,3	Op AND 
292:     ST  3,-2(1)	Save left side 
293:    LDA  3,-1(0)	Load address of base of array board
294:     ST  3,-3(1)	Save left side 
295:    LDC  3,6(6)	Load integer constant 
296:     LD  4,-3(1)	Load left into ac1 
297:    SUB  3,4,3	compute location from index 
298:     LD  3,0(3)	Load array element 
299:     ST  3,-3(1)	Save left side 
300:    LDC  3,2(6)	Load integer constant 
301:     LD  4,-3(1)	Load left into ac1 
302:    TEQ  3,4,3	Op == 
303:     ST  3,-3(1)	Save left side 
304:    LDA  3,-1(0)	Load address of base of array board
305:     ST  3,-4(1)	Save left side 
306:    LDC  3,3(6)	Load integer constant 
307:     LD  4,-4(1)	Load left into ac1 
308:    SUB  3,4,3	compute location from index 
309:     LD  3,0(3)	Load array element 
310:     ST  3,-4(1)	Save left side 
311:    LDC  3,2(6)	Load integer constant 
312:     LD  4,-4(1)	Load left into ac1 
313:    TEQ  3,4,3	Op == 
314:     LD  4,-3(1)	Load left into ac1 
315:    AND  3,4,3	Op AND 
316:     LD  4,-2(1)	Load left into ac1 
317:     OR  3,4,3	Op OR 
318:     ST  3,-2(1)	Save left side 
319:    LDA  3,-1(0)	Load address of base of array board
320:     ST  3,-3(1)	Save left side 
321:    LDC  3,4(6)	Load integer constant 
322:     LD  4,-3(1)	Load left into ac1 
323:    SUB  3,4,3	compute location from index 
324:     LD  3,0(3)	Load array element 
325:     ST  3,-3(1)	Save left side 
326:    LDC  3,2(6)	Load integer constant 
327:     LD  4,-3(1)	Load left into ac1 
328:    TEQ  3,4,3	Op == 
329:     ST  3,-3(1)	Save left side 
330:    LDA  3,-1(0)	Load address of base of array board
331:     ST  3,-4(1)	Save left side 
332:    LDC  3,8(6)	Load integer constant 
333:     LD  4,-4(1)	Load left into ac1 
334:    SUB  3,4,3	compute location from index 
335:     LD  3,0(3)	Load array element 
336:     ST  3,-4(1)	Save left side 
337:    LDC  3,2(6)	Load integer constant 
338:     LD  4,-4(1)	Load left into ac1 
339:    TEQ  3,4,3	Op == 
340:     LD  4,-3(1)	Load left into ac1 
341:    AND  3,4,3	Op AND 
342:     LD  4,-2(1)	Load left into ac1 
343:     OR  3,4,3	Op OR 
344:     ST  3,-2(1)	Save left side 
345:    LDA  3,-1(0)	Load address of base of array board
346:     ST  3,-3(1)	Save left side 
347:    LDC  3,0(6)	Load integer constant 
348:     LD  4,-3(1)	Load left into ac1 
349:    SUB  3,4,3	compute location from index 
350:     LD  3,0(3)	Load array element 
351:     ST  3,-3(1)	Save left side 
352:    LDC  3,1(6)	Load integer constant 
353:    LDC  4,0(6)	Load 0 
354:    SUB  3,4,3	Op unary - 
355:     LD  4,-3(1)	Load left into ac1 
356:    TEQ  3,4,3	Op == 
357:     LD  4,-2(1)	Load left into ac1 
358:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
360:    LDC  3,0(6)	Load integer constant 
361:     ST  3,-2(1)	Save index 
362:    LDC  3,2(6)	Load integer constant 
363:     LD  4,-2(1)	Restore index 
364:    LDA  5,-1(0)	Load address of base of array board
365:    SUB  5,5,4	Compute offset of value 
366:     ST  3,0(5)	Store variable board
* EXPRESSION
367:    LDC  3,0(6)	Load Boolean constant 
368:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
359:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
370:    LDA  3,-1(0)	Load address of base of array board
371:     ST  3,-2(1)	Save left side 
372:    LDC  3,3(6)	Load integer constant 
373:     LD  4,-2(1)	Load left into ac1 
374:    SUB  3,4,3	compute location from index 
375:     LD  3,0(3)	Load array element 
376:     ST  3,-2(1)	Save left side 
377:    LDC  3,2(6)	Load integer constant 
378:     LD  4,-2(1)	Load left into ac1 
379:    TEQ  3,4,3	Op == 
380:     ST  3,-2(1)	Save left side 
381:    LDA  3,-1(0)	Load address of base of array board
382:     ST  3,-3(1)	Save left side 
383:    LDC  3,4(6)	Load integer constant 
384:     LD  4,-3(1)	Load left into ac1 
385:    SUB  3,4,3	compute location from index 
386:     LD  3,0(3)	Load array element 
387:     ST  3,-3(1)	Save left side 
388:    LDC  3,2(6)	Load integer constant 
389:     LD  4,-3(1)	Load left into ac1 
390:    TEQ  3,4,3	Op == 
391:     LD  4,-2(1)	Load left into ac1 
392:    AND  3,4,3	Op AND 
393:     ST  3,-2(1)	Save left side 
394:    LDA  3,-1(0)	Load address of base of array board
395:     ST  3,-3(1)	Save left side 
396:    LDC  3,2(6)	Load integer constant 
397:     LD  4,-3(1)	Load left into ac1 
398:    SUB  3,4,3	compute location from index 
399:     LD  3,0(3)	Load array element 
400:     ST  3,-3(1)	Save left side 
401:    LDC  3,2(6)	Load integer constant 
402:     LD  4,-3(1)	Load left into ac1 
403:    TEQ  3,4,3	Op == 
404:     ST  3,-3(1)	Save left side 
405:    LDA  3,-1(0)	Load address of base of array board
406:     ST  3,-4(1)	Save left side 
407:    LDC  3,8(6)	Load integer constant 
408:     LD  4,-4(1)	Load left into ac1 
409:    SUB  3,4,3	compute location from index 
410:     LD  3,0(3)	Load array element 
411:     ST  3,-4(1)	Save left side 
412:    LDC  3,2(6)	Load integer constant 
413:     LD  4,-4(1)	Load left into ac1 
414:    TEQ  3,4,3	Op == 
415:     LD  4,-3(1)	Load left into ac1 
416:    AND  3,4,3	Op AND 
417:     LD  4,-2(1)	Load left into ac1 
418:     OR  3,4,3	Op OR 
419:     ST  3,-2(1)	Save left side 
420:    LDA  3,-1(0)	Load address of base of array board
421:     ST  3,-3(1)	Save left side 
422:    LDC  3,5(6)	Load integer constant 
423:     LD  4,-3(1)	Load left into ac1 
424:    SUB  3,4,3	compute location from index 
425:     LD  3,0(3)	Load array element 
426:     ST  3,-3(1)	Save left side 
427:    LDC  3,1(6)	Load integer constant 
428:    LDC  4,0(6)	Load 0 
429:    SUB  3,4,3	Op unary - 
430:     LD  4,-3(1)	Load left into ac1 
431:    TEQ  3,4,3	Op == 
432:     LD  4,-2(1)	Load left into ac1 
433:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
435:    LDC  3,5(6)	Load integer constant 
436:     ST  3,-2(1)	Save index 
437:    LDC  3,2(6)	Load integer constant 
438:     LD  4,-2(1)	Restore index 
439:    LDA  5,-1(0)	Load address of base of array board
440:    SUB  5,5,4	Compute offset of value 
441:     ST  3,0(5)	Store variable board
* EXPRESSION
442:    LDC  3,0(6)	Load Boolean constant 
443:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
434:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
445:    LDA  3,-1(0)	Load address of base of array board
446:     ST  3,-2(1)	Save left side 
447:    LDC  3,3(6)	Load integer constant 
448:     LD  4,-2(1)	Load left into ac1 
449:    SUB  3,4,3	compute location from index 
450:     LD  3,0(3)	Load array element 
451:     ST  3,-2(1)	Save left side 
452:    LDC  3,2(6)	Load integer constant 
453:     LD  4,-2(1)	Load left into ac1 
454:    TEQ  3,4,3	Op == 
455:     ST  3,-2(1)	Save left side 
456:    LDA  3,-1(0)	Load address of base of array board
457:     ST  3,-3(1)	Save left side 
458:    LDC  3,5(6)	Load integer constant 
459:     LD  4,-3(1)	Load left into ac1 
460:    SUB  3,4,3	compute location from index 
461:     LD  3,0(3)	Load array element 
462:     ST  3,-3(1)	Save left side 
463:    LDC  3,2(6)	Load integer constant 
464:     LD  4,-3(1)	Load left into ac1 
465:    TEQ  3,4,3	Op == 
466:     LD  4,-2(1)	Load left into ac1 
467:    AND  3,4,3	Op AND 
468:     ST  3,-2(1)	Save left side 
469:    LDA  3,-1(0)	Load address of base of array board
470:     ST  3,-3(1)	Save left side 
471:    LDC  3,0(6)	Load integer constant 
472:     LD  4,-3(1)	Load left into ac1 
473:    SUB  3,4,3	compute location from index 
474:     LD  3,0(3)	Load array element 
475:     ST  3,-3(1)	Save left side 
476:    LDC  3,2(6)	Load integer constant 
477:     LD  4,-3(1)	Load left into ac1 
478:    TEQ  3,4,3	Op == 
479:     ST  3,-3(1)	Save left side 
480:    LDA  3,-1(0)	Load address of base of array board
481:     ST  3,-4(1)	Save left side 
482:    LDC  3,8(6)	Load integer constant 
483:     LD  4,-4(1)	Load left into ac1 
484:    SUB  3,4,3	compute location from index 
485:     LD  3,0(3)	Load array element 
486:     ST  3,-4(1)	Save left side 
487:    LDC  3,2(6)	Load integer constant 
488:     LD  4,-4(1)	Load left into ac1 
489:    TEQ  3,4,3	Op == 
490:     LD  4,-3(1)	Load left into ac1 
491:    AND  3,4,3	Op AND 
492:     LD  4,-2(1)	Load left into ac1 
493:     OR  3,4,3	Op OR 
494:     ST  3,-2(1)	Save left side 
495:    LDA  3,-1(0)	Load address of base of array board
496:     ST  3,-3(1)	Save left side 
497:    LDC  3,2(6)	Load integer constant 
498:     LD  4,-3(1)	Load left into ac1 
499:    SUB  3,4,3	compute location from index 
500:     LD  3,0(3)	Load array element 
501:     ST  3,-3(1)	Save left side 
502:    LDC  3,2(6)	Load integer constant 
503:     LD  4,-3(1)	Load left into ac1 
504:    TEQ  3,4,3	Op == 
505:     ST  3,-3(1)	Save left side 
506:    LDA  3,-1(0)	Load address of base of array board
507:     ST  3,-4(1)	Save left side 
508:    LDC  3,6(6)	Load integer constant 
509:     LD  4,-4(1)	Load left into ac1 
510:    SUB  3,4,3	compute location from index 
511:     LD  3,0(3)	Load array element 
512:     ST  3,-4(1)	Save left side 
513:    LDC  3,2(6)	Load integer constant 
514:     LD  4,-4(1)	Load left into ac1 
515:    TEQ  3,4,3	Op == 
516:     LD  4,-3(1)	Load left into ac1 
517:    AND  3,4,3	Op AND 
518:     LD  4,-2(1)	Load left into ac1 
519:     OR  3,4,3	Op OR 
520:     ST  3,-2(1)	Save left side 
521:    LDA  3,-1(0)	Load address of base of array board
522:     ST  3,-3(1)	Save left side 
523:    LDC  3,1(6)	Load integer constant 
524:     LD  4,-3(1)	Load left into ac1 
525:    SUB  3,4,3	compute location from index 
526:     LD  3,0(3)	Load array element 
527:     ST  3,-3(1)	Save left side 
528:    LDC  3,2(6)	Load integer constant 
529:     LD  4,-3(1)	Load left into ac1 
530:    TEQ  3,4,3	Op == 
531:     ST  3,-3(1)	Save left side 
532:    LDA  3,-1(0)	Load address of base of array board
533:     ST  3,-4(1)	Save left side 
534:    LDC  3,7(6)	Load integer constant 
535:     LD  4,-4(1)	Load left into ac1 
536:    SUB  3,4,3	compute location from index 
537:     LD  3,0(3)	Load array element 
538:     ST  3,-4(1)	Save left side 
539:    LDC  3,2(6)	Load integer constant 
540:     LD  4,-4(1)	Load left into ac1 
541:    TEQ  3,4,3	Op == 
542:     LD  4,-3(1)	Load left into ac1 
543:    AND  3,4,3	Op AND 
544:     LD  4,-2(1)	Load left into ac1 
545:     OR  3,4,3	Op OR 
546:     ST  3,-2(1)	Save left side 
547:    LDA  3,-1(0)	Load address of base of array board
548:     ST  3,-3(1)	Save left side 
549:    LDC  3,4(6)	Load integer constant 
550:     LD  4,-3(1)	Load left into ac1 
551:    SUB  3,4,3	compute location from index 
552:     LD  3,0(3)	Load array element 
553:     ST  3,-3(1)	Save left side 
554:    LDC  3,1(6)	Load integer constant 
555:    LDC  4,0(6)	Load 0 
556:    SUB  3,4,3	Op unary - 
557:     LD  4,-3(1)	Load left into ac1 
558:    TEQ  3,4,3	Op == 
559:     LD  4,-2(1)	Load left into ac1 
560:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
562:    LDC  3,4(6)	Load integer constant 
563:     ST  3,-2(1)	Save index 
564:    LDC  3,2(6)	Load integer constant 
565:     LD  4,-2(1)	Restore index 
566:    LDA  5,-1(0)	Load address of base of array board
567:    SUB  5,5,4	Compute offset of value 
568:     ST  3,0(5)	Store variable board
* EXPRESSION
569:    LDC  3,0(6)	Load Boolean constant 
570:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
561:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
572:    LDA  3,-1(0)	Load address of base of array board
573:     ST  3,-2(1)	Save left side 
574:    LDC  3,4(6)	Load integer constant 
575:     LD  4,-2(1)	Load left into ac1 
576:    SUB  3,4,3	compute location from index 
577:     LD  3,0(3)	Load array element 
578:     ST  3,-2(1)	Save left side 
579:    LDC  3,2(6)	Load integer constant 
580:     LD  4,-2(1)	Load left into ac1 
581:    TEQ  3,4,3	Op == 
582:     ST  3,-2(1)	Save left side 
583:    LDA  3,-1(0)	Load address of base of array board
584:     ST  3,-3(1)	Save left side 
585:    LDC  3,5(6)	Load integer constant 
586:     LD  4,-3(1)	Load left into ac1 
587:    SUB  3,4,3	compute location from index 
588:     LD  3,0(3)	Load array element 
589:     ST  3,-3(1)	Save left side 
590:    LDC  3,2(6)	Load integer constant 
591:     LD  4,-3(1)	Load left into ac1 
592:    TEQ  3,4,3	Op == 
593:     LD  4,-2(1)	Load left into ac1 
594:    AND  3,4,3	Op AND 
595:     ST  3,-2(1)	Save left side 
596:    LDA  3,-1(0)	Load address of base of array board
597:     ST  3,-3(1)	Save left side 
598:    LDC  3,0(6)	Load integer constant 
599:     LD  4,-3(1)	Load left into ac1 
600:    SUB  3,4,3	compute location from index 
601:     LD  3,0(3)	Load array element 
602:     ST  3,-3(1)	Save left side 
603:    LDC  3,2(6)	Load integer constant 
604:     LD  4,-3(1)	Load left into ac1 
605:    TEQ  3,4,3	Op == 
606:     ST  3,-3(1)	Save left side 
607:    LDA  3,-1(0)	Load address of base of array board
608:     ST  3,-4(1)	Save left side 
609:    LDC  3,6(6)	Load integer constant 
610:     LD  4,-4(1)	Load left into ac1 
611:    SUB  3,4,3	compute location from index 
612:     LD  3,0(3)	Load array element 
613:     ST  3,-4(1)	Save left side 
614:    LDC  3,2(6)	Load integer constant 
615:     LD  4,-4(1)	Load left into ac1 
616:    TEQ  3,4,3	Op == 
617:     LD  4,-3(1)	Load left into ac1 
618:    AND  3,4,3	Op AND 
619:     LD  4,-2(1)	Load left into ac1 
620:     OR  3,4,3	Op OR 
621:     ST  3,-2(1)	Save left side 
622:    LDA  3,-1(0)	Load address of base of array board
623:     ST  3,-3(1)	Save left side 
624:    LDC  3,3(6)	Load integer constant 
625:     LD  4,-3(1)	Load left into ac1 
626:    SUB  3,4,3	compute location from index 
627:     LD  3,0(3)	Load array element 
628:     ST  3,-3(1)	Save left side 
629:    LDC  3,1(6)	Load integer constant 
630:    LDC  4,0(6)	Load 0 
631:    SUB  3,4,3	Op unary - 
632:     LD  4,-3(1)	Load left into ac1 
633:    TEQ  3,4,3	Op == 
634:     LD  4,-2(1)	Load left into ac1 
635:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
637:    LDC  3,3(6)	Load integer constant 
638:     ST  3,-2(1)	Save index 
639:    LDC  3,2(6)	Load integer constant 
640:     LD  4,-2(1)	Restore index 
641:    LDA  5,-1(0)	Load address of base of array board
642:    SUB  5,5,4	Compute offset of value 
643:     ST  3,0(5)	Store variable board
* EXPRESSION
644:    LDC  3,0(6)	Load Boolean constant 
645:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
636:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
647:    LDA  3,-1(0)	Load address of base of array board
648:     ST  3,-2(1)	Save left side 
649:    LDC  3,6(6)	Load integer constant 
650:     LD  4,-2(1)	Load left into ac1 
651:    SUB  3,4,3	compute location from index 
652:     LD  3,0(3)	Load array element 
653:     ST  3,-2(1)	Save left side 
654:    LDC  3,2(6)	Load integer constant 
655:     LD  4,-2(1)	Load left into ac1 
656:    TEQ  3,4,3	Op == 
657:     ST  3,-2(1)	Save left side 
658:    LDA  3,-1(0)	Load address of base of array board
659:     ST  3,-3(1)	Save left side 
660:    LDC  3,7(6)	Load integer constant 
661:     LD  4,-3(1)	Load left into ac1 
662:    SUB  3,4,3	compute location from index 
663:     LD  3,0(3)	Load array element 
664:     ST  3,-3(1)	Save left side 
665:    LDC  3,2(6)	Load integer constant 
666:     LD  4,-3(1)	Load left into ac1 
667:    TEQ  3,4,3	Op == 
668:     LD  4,-2(1)	Load left into ac1 
669:    AND  3,4,3	Op AND 
670:     ST  3,-2(1)	Save left side 
671:    LDA  3,-1(0)	Load address of base of array board
672:     ST  3,-3(1)	Save left side 
673:    LDC  3,0(6)	Load integer constant 
674:     LD  4,-3(1)	Load left into ac1 
675:    SUB  3,4,3	compute location from index 
676:     LD  3,0(3)	Load array element 
677:     ST  3,-3(1)	Save left side 
678:    LDC  3,2(6)	Load integer constant 
679:     LD  4,-3(1)	Load left into ac1 
680:    TEQ  3,4,3	Op == 
681:     ST  3,-3(1)	Save left side 
682:    LDA  3,-1(0)	Load address of base of array board
683:     ST  3,-4(1)	Save left side 
684:    LDC  3,4(6)	Load integer constant 
685:     LD  4,-4(1)	Load left into ac1 
686:    SUB  3,4,3	compute location from index 
687:     LD  3,0(3)	Load array element 
688:     ST  3,-4(1)	Save left side 
689:    LDC  3,2(6)	Load integer constant 
690:     LD  4,-4(1)	Load left into ac1 
691:    TEQ  3,4,3	Op == 
692:     LD  4,-3(1)	Load left into ac1 
693:    AND  3,4,3	Op AND 
694:     LD  4,-2(1)	Load left into ac1 
695:     OR  3,4,3	Op OR 
696:     ST  3,-2(1)	Save left side 
697:    LDA  3,-1(0)	Load address of base of array board
698:     ST  3,-3(1)	Save left side 
699:    LDC  3,2(6)	Load integer constant 
700:     LD  4,-3(1)	Load left into ac1 
701:    SUB  3,4,3	compute location from index 
702:     LD  3,0(3)	Load array element 
703:     ST  3,-3(1)	Save left side 
704:    LDC  3,2(6)	Load integer constant 
705:     LD  4,-3(1)	Load left into ac1 
706:    TEQ  3,4,3	Op == 
707:     ST  3,-3(1)	Save left side 
708:    LDA  3,-1(0)	Load address of base of array board
709:     ST  3,-4(1)	Save left side 
710:    LDC  3,5(6)	Load integer constant 
711:     LD  4,-4(1)	Load left into ac1 
712:    SUB  3,4,3	compute location from index 
713:     LD  3,0(3)	Load array element 
714:     ST  3,-4(1)	Save left side 
715:    LDC  3,2(6)	Load integer constant 
716:     LD  4,-4(1)	Load left into ac1 
717:    TEQ  3,4,3	Op == 
718:     LD  4,-3(1)	Load left into ac1 
719:    AND  3,4,3	Op AND 
720:     LD  4,-2(1)	Load left into ac1 
721:     OR  3,4,3	Op OR 
722:     ST  3,-2(1)	Save left side 
723:    LDA  3,-1(0)	Load address of base of array board
724:     ST  3,-3(1)	Save left side 
725:    LDC  3,8(6)	Load integer constant 
726:     LD  4,-3(1)	Load left into ac1 
727:    SUB  3,4,3	compute location from index 
728:     LD  3,0(3)	Load array element 
729:     ST  3,-3(1)	Save left side 
730:    LDC  3,1(6)	Load integer constant 
731:    LDC  4,0(6)	Load 0 
732:    SUB  3,4,3	Op unary - 
733:     LD  4,-3(1)	Load left into ac1 
734:    TEQ  3,4,3	Op == 
735:     LD  4,-2(1)	Load left into ac1 
736:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
738:    LDC  3,8(6)	Load integer constant 
739:     ST  3,-2(1)	Save index 
740:    LDC  3,2(6)	Load integer constant 
741:     LD  4,-2(1)	Restore index 
742:    LDA  5,-1(0)	Load address of base of array board
743:    SUB  5,5,4	Compute offset of value 
744:     ST  3,0(5)	Store variable board
* EXPRESSION
745:    LDC  3,0(6)	Load Boolean constant 
746:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
737:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
748:    LDA  3,-1(0)	Load address of base of array board
749:     ST  3,-2(1)	Save left side 
750:    LDC  3,6(6)	Load integer constant 
751:     LD  4,-2(1)	Load left into ac1 
752:    SUB  3,4,3	compute location from index 
753:     LD  3,0(3)	Load array element 
754:     ST  3,-2(1)	Save left side 
755:    LDC  3,2(6)	Load integer constant 
756:     LD  4,-2(1)	Load left into ac1 
757:    TEQ  3,4,3	Op == 
758:     ST  3,-2(1)	Save left side 
759:    LDA  3,-1(0)	Load address of base of array board
760:     ST  3,-3(1)	Save left side 
761:    LDC  3,8(6)	Load integer constant 
762:     LD  4,-3(1)	Load left into ac1 
763:    SUB  3,4,3	compute location from index 
764:     LD  3,0(3)	Load array element 
765:     ST  3,-3(1)	Save left side 
766:    LDC  3,2(6)	Load integer constant 
767:     LD  4,-3(1)	Load left into ac1 
768:    TEQ  3,4,3	Op == 
769:     LD  4,-2(1)	Load left into ac1 
770:    AND  3,4,3	Op AND 
771:     ST  3,-2(1)	Save left side 
772:    LDA  3,-1(0)	Load address of base of array board
773:     ST  3,-3(1)	Save left side 
774:    LDC  3,4(6)	Load integer constant 
775:     LD  4,-3(1)	Load left into ac1 
776:    SUB  3,4,3	compute location from index 
777:     LD  3,0(3)	Load array element 
778:     ST  3,-3(1)	Save left side 
779:    LDC  3,2(6)	Load integer constant 
780:     LD  4,-3(1)	Load left into ac1 
781:    TEQ  3,4,3	Op == 
782:     ST  3,-3(1)	Save left side 
783:    LDA  3,-1(0)	Load address of base of array board
784:     ST  3,-4(1)	Save left side 
785:    LDC  3,1(6)	Load integer constant 
786:     LD  4,-4(1)	Load left into ac1 
787:    SUB  3,4,3	compute location from index 
788:     LD  3,0(3)	Load array element 
789:     ST  3,-4(1)	Save left side 
790:    LDC  3,2(6)	Load integer constant 
791:     LD  4,-4(1)	Load left into ac1 
792:    TEQ  3,4,3	Op == 
793:     LD  4,-3(1)	Load left into ac1 
794:    AND  3,4,3	Op AND 
795:     LD  4,-2(1)	Load left into ac1 
796:     OR  3,4,3	Op OR 
797:     ST  3,-2(1)	Save left side 
798:    LDA  3,-1(0)	Load address of base of array board
799:     ST  3,-3(1)	Save left side 
800:    LDC  3,7(6)	Load integer constant 
801:     LD  4,-3(1)	Load left into ac1 
802:    SUB  3,4,3	compute location from index 
803:     LD  3,0(3)	Load array element 
804:     ST  3,-3(1)	Save left side 
805:    LDC  3,1(6)	Load integer constant 
806:    LDC  4,0(6)	Load 0 
807:    SUB  3,4,3	Op unary - 
808:     LD  4,-3(1)	Load left into ac1 
809:    TEQ  3,4,3	Op == 
810:     LD  4,-2(1)	Load left into ac1 
811:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
813:    LDC  3,7(6)	Load integer constant 
814:     ST  3,-2(1)	Save index 
815:    LDC  3,2(6)	Load integer constant 
816:     LD  4,-2(1)	Restore index 
817:    LDA  5,-1(0)	Load address of base of array board
818:    SUB  5,5,4	Compute offset of value 
819:     ST  3,0(5)	Store variable board
* EXPRESSION
820:    LDC  3,0(6)	Load Boolean constant 
821:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
812:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
823:    LDA  3,-1(0)	Load address of base of array board
824:     ST  3,-2(1)	Save left side 
825:    LDC  3,7(6)	Load integer constant 
826:     LD  4,-2(1)	Load left into ac1 
827:    SUB  3,4,3	compute location from index 
828:     LD  3,0(3)	Load array element 
829:     ST  3,-2(1)	Save left side 
830:    LDC  3,2(6)	Load integer constant 
831:     LD  4,-2(1)	Load left into ac1 
832:    TEQ  3,4,3	Op == 
833:     ST  3,-2(1)	Save left side 
834:    LDA  3,-1(0)	Load address of base of array board
835:     ST  3,-3(1)	Save left side 
836:    LDC  3,8(6)	Load integer constant 
837:     LD  4,-3(1)	Load left into ac1 
838:    SUB  3,4,3	compute location from index 
839:     LD  3,0(3)	Load array element 
840:     ST  3,-3(1)	Save left side 
841:    LDC  3,2(6)	Load integer constant 
842:     LD  4,-3(1)	Load left into ac1 
843:    TEQ  3,4,3	Op == 
844:     LD  4,-2(1)	Load left into ac1 
845:    AND  3,4,3	Op AND 
846:     ST  3,-2(1)	Save left side 
847:    LDA  3,-1(0)	Load address of base of array board
848:     ST  3,-3(1)	Save left side 
849:    LDC  3,4(6)	Load integer constant 
850:     LD  4,-3(1)	Load left into ac1 
851:    SUB  3,4,3	compute location from index 
852:     LD  3,0(3)	Load array element 
853:     ST  3,-3(1)	Save left side 
854:    LDC  3,2(6)	Load integer constant 
855:     LD  4,-3(1)	Load left into ac1 
856:    TEQ  3,4,3	Op == 
857:     ST  3,-3(1)	Save left side 
858:    LDA  3,-1(0)	Load address of base of array board
859:     ST  3,-4(1)	Save left side 
860:    LDC  3,2(6)	Load integer constant 
861:     LD  4,-4(1)	Load left into ac1 
862:    SUB  3,4,3	compute location from index 
863:     LD  3,0(3)	Load array element 
864:     ST  3,-4(1)	Save left side 
865:    LDC  3,2(6)	Load integer constant 
866:     LD  4,-4(1)	Load left into ac1 
867:    TEQ  3,4,3	Op == 
868:     LD  4,-3(1)	Load left into ac1 
869:    AND  3,4,3	Op AND 
870:     LD  4,-2(1)	Load left into ac1 
871:     OR  3,4,3	Op OR 
872:     ST  3,-2(1)	Save left side 
873:    LDA  3,-1(0)	Load address of base of array board
874:     ST  3,-3(1)	Save left side 
875:    LDC  3,0(6)	Load integer constant 
876:     LD  4,-3(1)	Load left into ac1 
877:    SUB  3,4,3	compute location from index 
878:     LD  3,0(3)	Load array element 
879:     ST  3,-3(1)	Save left side 
880:    LDC  3,2(6)	Load integer constant 
881:     LD  4,-3(1)	Load left into ac1 
882:    TEQ  3,4,3	Op == 
883:     ST  3,-3(1)	Save left side 
884:    LDA  3,-1(0)	Load address of base of array board
885:     ST  3,-4(1)	Save left side 
886:    LDC  3,3(6)	Load integer constant 
887:     LD  4,-4(1)	Load left into ac1 
888:    SUB  3,4,3	compute location from index 
889:     LD  3,0(3)	Load array element 
890:     ST  3,-4(1)	Save left side 
891:    LDC  3,2(6)	Load integer constant 
892:     LD  4,-4(1)	Load left into ac1 
893:    TEQ  3,4,3	Op == 
894:     LD  4,-3(1)	Load left into ac1 
895:    AND  3,4,3	Op AND 
896:     LD  4,-2(1)	Load left into ac1 
897:     OR  3,4,3	Op OR 
898:     ST  3,-2(1)	Save left side 
899:    LDA  3,-1(0)	Load address of base of array board
900:     ST  3,-3(1)	Save left side 
901:    LDC  3,6(6)	Load integer constant 
902:     LD  4,-3(1)	Load left into ac1 
903:    SUB  3,4,3	compute location from index 
904:     LD  3,0(3)	Load array element 
905:     ST  3,-3(1)	Save left side 
906:    LDC  3,1(6)	Load integer constant 
907:    LDC  4,0(6)	Load 0 
908:    SUB  3,4,3	Op unary - 
909:     LD  4,-3(1)	Load left into ac1 
910:    TEQ  3,4,3	Op == 
911:     LD  4,-2(1)	Load left into ac1 
912:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
914:    LDC  3,6(6)	Load integer constant 
915:     ST  3,-2(1)	Save index 
916:    LDC  3,2(6)	Load integer constant 
917:     LD  4,-2(1)	Restore index 
918:    LDA  5,-1(0)	Load address of base of array board
919:    SUB  5,5,4	Compute offset of value 
920:     ST  3,0(5)	Store variable board
* EXPRESSION
921:    LDC  3,0(6)	Load Boolean constant 
922:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
913:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
822:    LDA  7,100(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
747:    LDA  7,175(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
646:    LDA  7,276(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
571:    LDA  7,351(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
444:    LDA  7,478(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
369:    LDA  7,553(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
268:    LDA  7,654(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
193:    LDA  7,729(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
923:     LD  3,-10(0)	Load variable gamenotdone
924:     ST  3,-2(1)	Save left side 
925:    LDC  3,0(6)	Load Boolean constant 
926:     LD  4,-2(1)	Load left into ac1 
927:    TNE  3,4,3	Op != 
* THEN
* COMPOUND
* Compound Body
* RETURN
929:    LDC  3,0(6)	Load Boolean constant 
930:    LDA  2,0(3)	Copy result to rt register 
931:     LD  3,-1(1)	Load return address 
932:     LD  1,0(1)	Adjust fp 
933:    LDA  7,0(3)	Return 
* END COMPOUND
928:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
934:    LDC  3,1(6)	Load Boolean constant 
935:    LDA  2,0(3)	Copy result to rt register 
936:     LD  3,-1(1)	Load return address 
937:     LD  1,0(1)	Adjust fp 
938:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
939:    LDC  2,0(6)	Set return value to 0 
940:     LD  3,-1(1)	Load return address 
941:     LD  1,0(1)	Adjust fp 
942:    LDA  7,0(3)	Return 
* END FUNCTION win
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION blockplayer
943:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
944:    LDC  3,0(6)	Load Boolean constant 
945:     ST  3,-2(1)	Store variable blocked
* IF
946:    LDA  3,-1(0)	Load address of base of array board
947:     ST  3,-3(1)	Save left side 
948:    LDC  3,0(6)	Load integer constant 
949:     LD  4,-3(1)	Load left into ac1 
950:    SUB  3,4,3	compute location from index 
951:     LD  3,0(3)	Load array element 
952:     ST  3,-3(1)	Save left side 
953:    LDC  3,1(6)	Load integer constant 
954:     LD  4,-3(1)	Load left into ac1 
955:    TEQ  3,4,3	Op == 
956:     ST  3,-3(1)	Save left side 
957:    LDA  3,-1(0)	Load address of base of array board
958:     ST  3,-4(1)	Save left side 
959:    LDC  3,1(6)	Load integer constant 
960:     LD  4,-4(1)	Load left into ac1 
961:    SUB  3,4,3	compute location from index 
962:     LD  3,0(3)	Load array element 
963:     ST  3,-4(1)	Save left side 
964:    LDC  3,1(6)	Load integer constant 
965:     LD  4,-4(1)	Load left into ac1 
966:    TEQ  3,4,3	Op == 
967:     LD  4,-3(1)	Load left into ac1 
968:    AND  3,4,3	Op AND 
969:     ST  3,-3(1)	Save left side 
970:    LDA  3,-1(0)	Load address of base of array board
971:     ST  3,-4(1)	Save left side 
972:    LDC  3,6(6)	Load integer constant 
973:     LD  4,-4(1)	Load left into ac1 
974:    SUB  3,4,3	compute location from index 
975:     LD  3,0(3)	Load array element 
976:     ST  3,-4(1)	Save left side 
977:    LDC  3,1(6)	Load integer constant 
978:     LD  4,-4(1)	Load left into ac1 
979:    TEQ  3,4,3	Op == 
980:     ST  3,-4(1)	Save left side 
981:    LDA  3,-1(0)	Load address of base of array board
982:     ST  3,-5(1)	Save left side 
983:    LDC  3,4(6)	Load integer constant 
984:     LD  4,-5(1)	Load left into ac1 
985:    SUB  3,4,3	compute location from index 
986:     LD  3,0(3)	Load array element 
987:     ST  3,-5(1)	Save left side 
988:    LDC  3,1(6)	Load integer constant 
989:     LD  4,-5(1)	Load left into ac1 
990:    TEQ  3,4,3	Op == 
991:     LD  4,-4(1)	Load left into ac1 
992:    AND  3,4,3	Op AND 
993:     LD  4,-3(1)	Load left into ac1 
994:     OR  3,4,3	Op OR 
995:     ST  3,-3(1)	Save left side 
996:    LDA  3,-1(0)	Load address of base of array board
997:     ST  3,-4(1)	Save left side 
998:    LDC  3,8(6)	Load integer constant 
999:     LD  4,-4(1)	Load left into ac1 
1000:    SUB  3,4,3	compute location from index 
1001:     LD  3,0(3)	Load array element 
1002:     ST  3,-4(1)	Save left side 
1003:    LDC  3,1(6)	Load integer constant 
1004:     LD  4,-4(1)	Load left into ac1 
1005:    TEQ  3,4,3	Op == 
1006:     ST  3,-4(1)	Save left side 
1007:    LDA  3,-1(0)	Load address of base of array board
1008:     ST  3,-5(1)	Save left side 
1009:    LDC  3,5(6)	Load integer constant 
1010:     LD  4,-5(1)	Load left into ac1 
1011:    SUB  3,4,3	compute location from index 
1012:     LD  3,0(3)	Load array element 
1013:     ST  3,-5(1)	Save left side 
1014:    LDC  3,1(6)	Load integer constant 
1015:     LD  4,-5(1)	Load left into ac1 
1016:    TEQ  3,4,3	Op == 
1017:     LD  4,-4(1)	Load left into ac1 
1018:    AND  3,4,3	Op AND 
1019:     LD  4,-3(1)	Load left into ac1 
1020:     OR  3,4,3	Op OR 
1021:     ST  3,-3(1)	Save left side 
1022:    LDA  3,-1(0)	Load address of base of array board
1023:     ST  3,-4(1)	Save left side 
1024:    LDC  3,2(6)	Load integer constant 
1025:     LD  4,-4(1)	Load left into ac1 
1026:    SUB  3,4,3	compute location from index 
1027:     LD  3,0(3)	Load array element 
1028:     ST  3,-4(1)	Save left side 
1029:    LDC  3,1(6)	Load integer constant 
1030:    LDC  4,0(6)	Load 0 
1031:    SUB  3,4,3	Op unary - 
1032:     LD  4,-4(1)	Load left into ac1 
1033:    TEQ  3,4,3	Op == 
1034:     LD  4,-3(1)	Load left into ac1 
1035:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1037:    LDC  3,2(6)	Load integer constant 
1038:     ST  3,-3(1)	Save index 
1039:    LDC  3,2(6)	Load integer constant 
1040:     LD  4,-3(1)	Restore index 
1041:    LDA  5,-1(0)	Load address of base of array board
1042:    SUB  5,5,4	Compute offset of value 
1043:     ST  3,0(5)	Store variable board
* EXPRESSION
1044:    LDC  3,1(6)	Load Boolean constant 
1045:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1036:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1047:    LDA  3,-1(0)	Load address of base of array board
1048:     ST  3,-3(1)	Save left side 
1049:    LDC  3,0(6)	Load integer constant 
1050:     LD  4,-3(1)	Load left into ac1 
1051:    SUB  3,4,3	compute location from index 
1052:     LD  3,0(3)	Load array element 
1053:     ST  3,-3(1)	Save left side 
1054:    LDC  3,1(6)	Load integer constant 
1055:     LD  4,-3(1)	Load left into ac1 
1056:    TEQ  3,4,3	Op == 
1057:     ST  3,-3(1)	Save left side 
1058:    LDA  3,-1(0)	Load address of base of array board
1059:     ST  3,-4(1)	Save left side 
1060:    LDC  3,2(6)	Load integer constant 
1061:     LD  4,-4(1)	Load left into ac1 
1062:    SUB  3,4,3	compute location from index 
1063:     LD  3,0(3)	Load array element 
1064:     ST  3,-4(1)	Save left side 
1065:    LDC  3,1(6)	Load integer constant 
1066:     LD  4,-4(1)	Load left into ac1 
1067:    TEQ  3,4,3	Op == 
1068:     LD  4,-3(1)	Load left into ac1 
1069:    AND  3,4,3	Op AND 
1070:     ST  3,-3(1)	Save left side 
1071:    LDA  3,-1(0)	Load address of base of array board
1072:     ST  3,-4(1)	Save left side 
1073:    LDC  3,4(6)	Load integer constant 
1074:     LD  4,-4(1)	Load left into ac1 
1075:    SUB  3,4,3	compute location from index 
1076:     LD  3,0(3)	Load array element 
1077:     ST  3,-4(1)	Save left side 
1078:    LDC  3,1(6)	Load integer constant 
1079:     LD  4,-4(1)	Load left into ac1 
1080:    TEQ  3,4,3	Op == 
1081:     ST  3,-4(1)	Save left side 
1082:    LDA  3,-1(0)	Load address of base of array board
1083:     ST  3,-5(1)	Save left side 
1084:    LDC  3,7(6)	Load integer constant 
1085:     LD  4,-5(1)	Load left into ac1 
1086:    SUB  3,4,3	compute location from index 
1087:     LD  3,0(3)	Load array element 
1088:     ST  3,-5(1)	Save left side 
1089:    LDC  3,1(6)	Load integer constant 
1090:     LD  4,-5(1)	Load left into ac1 
1091:    TEQ  3,4,3	Op == 
1092:     LD  4,-4(1)	Load left into ac1 
1093:    AND  3,4,3	Op AND 
1094:     LD  4,-3(1)	Load left into ac1 
1095:     OR  3,4,3	Op OR 
1096:     ST  3,-3(1)	Save left side 
1097:    LDA  3,-1(0)	Load address of base of array board
1098:     ST  3,-4(1)	Save left side 
1099:    LDC  3,1(6)	Load integer constant 
1100:     LD  4,-4(1)	Load left into ac1 
1101:    SUB  3,4,3	compute location from index 
1102:     LD  3,0(3)	Load array element 
1103:     ST  3,-4(1)	Save left side 
1104:    LDC  3,1(6)	Load integer constant 
1105:    LDC  4,0(6)	Load 0 
1106:    SUB  3,4,3	Op unary - 
1107:     LD  4,-4(1)	Load left into ac1 
1108:    TEQ  3,4,3	Op == 
1109:     LD  4,-3(1)	Load left into ac1 
1110:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1112:    LDC  3,1(6)	Load integer constant 
1113:     ST  3,-3(1)	Save index 
1114:    LDC  3,2(6)	Load integer constant 
1115:     LD  4,-3(1)	Restore index 
1116:    LDA  5,-1(0)	Load address of base of array board
1117:    SUB  5,5,4	Compute offset of value 
1118:     ST  3,0(5)	Store variable board
* EXPRESSION
1119:    LDC  3,1(6)	Load Boolean constant 
1120:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1111:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1122:    LDA  3,-1(0)	Load address of base of array board
1123:     ST  3,-3(1)	Save left side 
1124:    LDC  3,2(6)	Load integer constant 
1125:     LD  4,-3(1)	Load left into ac1 
1126:    SUB  3,4,3	compute location from index 
1127:     LD  3,0(3)	Load array element 
1128:     ST  3,-3(1)	Save left side 
1129:    LDC  3,1(6)	Load integer constant 
1130:     LD  4,-3(1)	Load left into ac1 
1131:    TEQ  3,4,3	Op == 
1132:     ST  3,-3(1)	Save left side 
1133:    LDA  3,-1(0)	Load address of base of array board
1134:     ST  3,-4(1)	Save left side 
1135:    LDC  3,1(6)	Load integer constant 
1136:     LD  4,-4(1)	Load left into ac1 
1137:    SUB  3,4,3	compute location from index 
1138:     LD  3,0(3)	Load array element 
1139:     ST  3,-4(1)	Save left side 
1140:    LDC  3,1(6)	Load integer constant 
1141:     LD  4,-4(1)	Load left into ac1 
1142:    TEQ  3,4,3	Op == 
1143:     LD  4,-3(1)	Load left into ac1 
1144:    AND  3,4,3	Op AND 
1145:     ST  3,-3(1)	Save left side 
1146:    LDA  3,-1(0)	Load address of base of array board
1147:     ST  3,-4(1)	Save left side 
1148:    LDC  3,6(6)	Load integer constant 
1149:     LD  4,-4(1)	Load left into ac1 
1150:    SUB  3,4,3	compute location from index 
1151:     LD  3,0(3)	Load array element 
1152:     ST  3,-4(1)	Save left side 
1153:    LDC  3,1(6)	Load integer constant 
1154:     LD  4,-4(1)	Load left into ac1 
1155:    TEQ  3,4,3	Op == 
1156:     ST  3,-4(1)	Save left side 
1157:    LDA  3,-1(0)	Load address of base of array board
1158:     ST  3,-5(1)	Save left side 
1159:    LDC  3,3(6)	Load integer constant 
1160:     LD  4,-5(1)	Load left into ac1 
1161:    SUB  3,4,3	compute location from index 
1162:     LD  3,0(3)	Load array element 
1163:     ST  3,-5(1)	Save left side 
1164:    LDC  3,1(6)	Load integer constant 
1165:     LD  4,-5(1)	Load left into ac1 
1166:    TEQ  3,4,3	Op == 
1167:     LD  4,-4(1)	Load left into ac1 
1168:    AND  3,4,3	Op AND 
1169:     LD  4,-3(1)	Load left into ac1 
1170:     OR  3,4,3	Op OR 
1171:     ST  3,-3(1)	Save left side 
1172:    LDA  3,-1(0)	Load address of base of array board
1173:     ST  3,-4(1)	Save left side 
1174:    LDC  3,4(6)	Load integer constant 
1175:     LD  4,-4(1)	Load left into ac1 
1176:    SUB  3,4,3	compute location from index 
1177:     LD  3,0(3)	Load array element 
1178:     ST  3,-4(1)	Save left side 
1179:    LDC  3,1(6)	Load integer constant 
1180:     LD  4,-4(1)	Load left into ac1 
1181:    TEQ  3,4,3	Op == 
1182:     ST  3,-4(1)	Save left side 
1183:    LDA  3,-1(0)	Load address of base of array board
1184:     ST  3,-5(1)	Save left side 
1185:    LDC  3,8(6)	Load integer constant 
1186:     LD  4,-5(1)	Load left into ac1 
1187:    SUB  3,4,3	compute location from index 
1188:     LD  3,0(3)	Load array element 
1189:     ST  3,-5(1)	Save left side 
1190:    LDC  3,1(6)	Load integer constant 
1191:     LD  4,-5(1)	Load left into ac1 
1192:    TEQ  3,4,3	Op == 
1193:     LD  4,-4(1)	Load left into ac1 
1194:    AND  3,4,3	Op AND 
1195:     LD  4,-3(1)	Load left into ac1 
1196:     OR  3,4,3	Op OR 
1197:     ST  3,-3(1)	Save left side 
1198:    LDA  3,-1(0)	Load address of base of array board
1199:     ST  3,-4(1)	Save left side 
1200:    LDC  3,0(6)	Load integer constant 
1201:     LD  4,-4(1)	Load left into ac1 
1202:    SUB  3,4,3	compute location from index 
1203:     LD  3,0(3)	Load array element 
1204:     ST  3,-4(1)	Save left side 
1205:    LDC  3,1(6)	Load integer constant 
1206:    LDC  4,0(6)	Load 0 
1207:    SUB  3,4,3	Op unary - 
1208:     LD  4,-4(1)	Load left into ac1 
1209:    TEQ  3,4,3	Op == 
1210:     LD  4,-3(1)	Load left into ac1 
1211:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1213:    LDC  3,0(6)	Load integer constant 
1214:     ST  3,-3(1)	Save index 
1215:    LDC  3,2(6)	Load integer constant 
1216:     LD  4,-3(1)	Restore index 
1217:    LDA  5,-1(0)	Load address of base of array board
1218:    SUB  5,5,4	Compute offset of value 
1219:     ST  3,0(5)	Store variable board
* EXPRESSION
1220:    LDC  3,1(6)	Load Boolean constant 
1221:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1212:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1223:    LDA  3,-1(0)	Load address of base of array board
1224:     ST  3,-3(1)	Save left side 
1225:    LDC  3,3(6)	Load integer constant 
1226:     LD  4,-3(1)	Load left into ac1 
1227:    SUB  3,4,3	compute location from index 
1228:     LD  3,0(3)	Load array element 
1229:     ST  3,-3(1)	Save left side 
1230:    LDC  3,1(6)	Load integer constant 
1231:     LD  4,-3(1)	Load left into ac1 
1232:    TEQ  3,4,3	Op == 
1233:     ST  3,-3(1)	Save left side 
1234:    LDA  3,-1(0)	Load address of base of array board
1235:     ST  3,-4(1)	Save left side 
1236:    LDC  3,4(6)	Load integer constant 
1237:     LD  4,-4(1)	Load left into ac1 
1238:    SUB  3,4,3	compute location from index 
1239:     LD  3,0(3)	Load array element 
1240:     ST  3,-4(1)	Save left side 
1241:    LDC  3,1(6)	Load integer constant 
1242:     LD  4,-4(1)	Load left into ac1 
1243:    TEQ  3,4,3	Op == 
1244:     LD  4,-3(1)	Load left into ac1 
1245:    AND  3,4,3	Op AND 
1246:     ST  3,-3(1)	Save left side 
1247:    LDA  3,-1(0)	Load address of base of array board
1248:     ST  3,-4(1)	Save left side 
1249:    LDC  3,2(6)	Load integer constant 
1250:     LD  4,-4(1)	Load left into ac1 
1251:    SUB  3,4,3	compute location from index 
1252:     LD  3,0(3)	Load array element 
1253:     ST  3,-4(1)	Save left side 
1254:    LDC  3,1(6)	Load integer constant 
1255:     LD  4,-4(1)	Load left into ac1 
1256:    TEQ  3,4,3	Op == 
1257:     ST  3,-4(1)	Save left side 
1258:    LDA  3,-1(0)	Load address of base of array board
1259:     ST  3,-5(1)	Save left side 
1260:    LDC  3,8(6)	Load integer constant 
1261:     LD  4,-5(1)	Load left into ac1 
1262:    SUB  3,4,3	compute location from index 
1263:     LD  3,0(3)	Load array element 
1264:     ST  3,-5(1)	Save left side 
1265:    LDC  3,1(6)	Load integer constant 
1266:     LD  4,-5(1)	Load left into ac1 
1267:    TEQ  3,4,3	Op == 
1268:     LD  4,-4(1)	Load left into ac1 
1269:    AND  3,4,3	Op AND 
1270:     LD  4,-3(1)	Load left into ac1 
1271:     OR  3,4,3	Op OR 
1272:     ST  3,-3(1)	Save left side 
1273:    LDA  3,-1(0)	Load address of base of array board
1274:     ST  3,-4(1)	Save left side 
1275:    LDC  3,5(6)	Load integer constant 
1276:     LD  4,-4(1)	Load left into ac1 
1277:    SUB  3,4,3	compute location from index 
1278:     LD  3,0(3)	Load array element 
1279:     ST  3,-4(1)	Save left side 
1280:    LDC  3,1(6)	Load integer constant 
1281:    LDC  4,0(6)	Load 0 
1282:    SUB  3,4,3	Op unary - 
1283:     LD  4,-4(1)	Load left into ac1 
1284:    TEQ  3,4,3	Op == 
1285:     LD  4,-3(1)	Load left into ac1 
1286:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1288:    LDC  3,5(6)	Load integer constant 
1289:     ST  3,-3(1)	Save index 
1290:    LDC  3,2(6)	Load integer constant 
1291:     LD  4,-3(1)	Restore index 
1292:    LDA  5,-1(0)	Load address of base of array board
1293:    SUB  5,5,4	Compute offset of value 
1294:     ST  3,0(5)	Store variable board
* EXPRESSION
1295:    LDC  3,1(6)	Load Boolean constant 
1296:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1287:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1298:    LDA  3,-1(0)	Load address of base of array board
1299:     ST  3,-3(1)	Save left side 
1300:    LDC  3,3(6)	Load integer constant 
1301:     LD  4,-3(1)	Load left into ac1 
1302:    SUB  3,4,3	compute location from index 
1303:     LD  3,0(3)	Load array element 
1304:     ST  3,-3(1)	Save left side 
1305:    LDC  3,1(6)	Load integer constant 
1306:     LD  4,-3(1)	Load left into ac1 
1307:    TEQ  3,4,3	Op == 
1308:     ST  3,-3(1)	Save left side 
1309:    LDA  3,-1(0)	Load address of base of array board
1310:     ST  3,-4(1)	Save left side 
1311:    LDC  3,5(6)	Load integer constant 
1312:     LD  4,-4(1)	Load left into ac1 
1313:    SUB  3,4,3	compute location from index 
1314:     LD  3,0(3)	Load array element 
1315:     ST  3,-4(1)	Save left side 
1316:    LDC  3,1(6)	Load integer constant 
1317:     LD  4,-4(1)	Load left into ac1 
1318:    TEQ  3,4,3	Op == 
1319:     LD  4,-3(1)	Load left into ac1 
1320:    AND  3,4,3	Op AND 
1321:     ST  3,-3(1)	Save left side 
1322:    LDA  3,-1(0)	Load address of base of array board
1323:     ST  3,-4(1)	Save left side 
1324:    LDC  3,0(6)	Load integer constant 
1325:     LD  4,-4(1)	Load left into ac1 
1326:    SUB  3,4,3	compute location from index 
1327:     LD  3,0(3)	Load array element 
1328:     ST  3,-4(1)	Save left side 
1329:    LDC  3,1(6)	Load integer constant 
1330:     LD  4,-4(1)	Load left into ac1 
1331:    TEQ  3,4,3	Op == 
1332:     ST  3,-4(1)	Save left side 
1333:    LDA  3,-1(0)	Load address of base of array board
1334:     ST  3,-5(1)	Save left side 
1335:    LDC  3,8(6)	Load integer constant 
1336:     LD  4,-5(1)	Load left into ac1 
1337:    SUB  3,4,3	compute location from index 
1338:     LD  3,0(3)	Load array element 
1339:     ST  3,-5(1)	Save left side 
1340:    LDC  3,1(6)	Load integer constant 
1341:     LD  4,-5(1)	Load left into ac1 
1342:    TEQ  3,4,3	Op == 
1343:     LD  4,-4(1)	Load left into ac1 
1344:    AND  3,4,3	Op AND 
1345:     LD  4,-3(1)	Load left into ac1 
1346:     OR  3,4,3	Op OR 
1347:     ST  3,-3(1)	Save left side 
1348:    LDA  3,-1(0)	Load address of base of array board
1349:     ST  3,-4(1)	Save left side 
1350:    LDC  3,2(6)	Load integer constant 
1351:     LD  4,-4(1)	Load left into ac1 
1352:    SUB  3,4,3	compute location from index 
1353:     LD  3,0(3)	Load array element 
1354:     ST  3,-4(1)	Save left side 
1355:    LDC  3,1(6)	Load integer constant 
1356:     LD  4,-4(1)	Load left into ac1 
1357:    TEQ  3,4,3	Op == 
1358:     ST  3,-4(1)	Save left side 
1359:    LDA  3,-1(0)	Load address of base of array board
1360:     ST  3,-5(1)	Save left side 
1361:    LDC  3,6(6)	Load integer constant 
1362:     LD  4,-5(1)	Load left into ac1 
1363:    SUB  3,4,3	compute location from index 
1364:     LD  3,0(3)	Load array element 
1365:     ST  3,-5(1)	Save left side 
1366:    LDC  3,1(6)	Load integer constant 
1367:     LD  4,-5(1)	Load left into ac1 
1368:    TEQ  3,4,3	Op == 
1369:     LD  4,-4(1)	Load left into ac1 
1370:    AND  3,4,3	Op AND 
1371:     LD  4,-3(1)	Load left into ac1 
1372:     OR  3,4,3	Op OR 
1373:     ST  3,-3(1)	Save left side 
1374:    LDA  3,-1(0)	Load address of base of array board
1375:     ST  3,-4(1)	Save left side 
1376:    LDC  3,1(6)	Load integer constant 
1377:     LD  4,-4(1)	Load left into ac1 
1378:    SUB  3,4,3	compute location from index 
1379:     LD  3,0(3)	Load array element 
1380:     ST  3,-4(1)	Save left side 
1381:    LDC  3,1(6)	Load integer constant 
1382:     LD  4,-4(1)	Load left into ac1 
1383:    TEQ  3,4,3	Op == 
1384:     ST  3,-4(1)	Save left side 
1385:    LDA  3,-1(0)	Load address of base of array board
1386:     ST  3,-5(1)	Save left side 
1387:    LDC  3,7(6)	Load integer constant 
1388:     LD  4,-5(1)	Load left into ac1 
1389:    SUB  3,4,3	compute location from index 
1390:     LD  3,0(3)	Load array element 
1391:     ST  3,-5(1)	Save left side 
1392:    LDC  3,1(6)	Load integer constant 
1393:     LD  4,-5(1)	Load left into ac1 
1394:    TEQ  3,4,3	Op == 
1395:     LD  4,-4(1)	Load left into ac1 
1396:    AND  3,4,3	Op AND 
1397:     LD  4,-3(1)	Load left into ac1 
1398:     OR  3,4,3	Op OR 
1399:     ST  3,-3(1)	Save left side 
1400:    LDA  3,-1(0)	Load address of base of array board
1401:     ST  3,-4(1)	Save left side 
1402:    LDC  3,4(6)	Load integer constant 
1403:     LD  4,-4(1)	Load left into ac1 
1404:    SUB  3,4,3	compute location from index 
1405:     LD  3,0(3)	Load array element 
1406:     ST  3,-4(1)	Save left side 
1407:    LDC  3,1(6)	Load integer constant 
1408:    LDC  4,0(6)	Load 0 
1409:    SUB  3,4,3	Op unary - 
1410:     LD  4,-4(1)	Load left into ac1 
1411:    TEQ  3,4,3	Op == 
1412:     LD  4,-3(1)	Load left into ac1 
1413:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1415:    LDC  3,4(6)	Load integer constant 
1416:     ST  3,-3(1)	Save index 
1417:    LDC  3,2(6)	Load integer constant 
1418:     LD  4,-3(1)	Restore index 
1419:    LDA  5,-1(0)	Load address of base of array board
1420:    SUB  5,5,4	Compute offset of value 
1421:     ST  3,0(5)	Store variable board
* EXPRESSION
1422:    LDC  3,1(6)	Load Boolean constant 
1423:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1414:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1425:    LDA  3,-1(0)	Load address of base of array board
1426:     ST  3,-3(1)	Save left side 
1427:    LDC  3,4(6)	Load integer constant 
1428:     LD  4,-3(1)	Load left into ac1 
1429:    SUB  3,4,3	compute location from index 
1430:     LD  3,0(3)	Load array element 
1431:     ST  3,-3(1)	Save left side 
1432:    LDC  3,1(6)	Load integer constant 
1433:     LD  4,-3(1)	Load left into ac1 
1434:    TEQ  3,4,3	Op == 
1435:     ST  3,-3(1)	Save left side 
1436:    LDA  3,-1(0)	Load address of base of array board
1437:     ST  3,-4(1)	Save left side 
1438:    LDC  3,5(6)	Load integer constant 
1439:     LD  4,-4(1)	Load left into ac1 
1440:    SUB  3,4,3	compute location from index 
1441:     LD  3,0(3)	Load array element 
1442:     ST  3,-4(1)	Save left side 
1443:    LDC  3,1(6)	Load integer constant 
1444:     LD  4,-4(1)	Load left into ac1 
1445:    TEQ  3,4,3	Op == 
1446:     LD  4,-3(1)	Load left into ac1 
1447:    AND  3,4,3	Op AND 
1448:     ST  3,-3(1)	Save left side 
1449:    LDA  3,-1(0)	Load address of base of array board
1450:     ST  3,-4(1)	Save left side 
1451:    LDC  3,0(6)	Load integer constant 
1452:     LD  4,-4(1)	Load left into ac1 
1453:    SUB  3,4,3	compute location from index 
1454:     LD  3,0(3)	Load array element 
1455:     ST  3,-4(1)	Save left side 
1456:    LDC  3,1(6)	Load integer constant 
1457:     LD  4,-4(1)	Load left into ac1 
1458:    TEQ  3,4,3	Op == 
1459:     ST  3,-4(1)	Save left side 
1460:    LDA  3,-1(0)	Load address of base of array board
1461:     ST  3,-5(1)	Save left side 
1462:    LDC  3,6(6)	Load integer constant 
1463:     LD  4,-5(1)	Load left into ac1 
1464:    SUB  3,4,3	compute location from index 
1465:     LD  3,0(3)	Load array element 
1466:     ST  3,-5(1)	Save left side 
1467:    LDC  3,1(6)	Load integer constant 
1468:     LD  4,-5(1)	Load left into ac1 
1469:    TEQ  3,4,3	Op == 
1470:     LD  4,-4(1)	Load left into ac1 
1471:    AND  3,4,3	Op AND 
1472:     LD  4,-3(1)	Load left into ac1 
1473:     OR  3,4,3	Op OR 
1474:     ST  3,-3(1)	Save left side 
1475:    LDA  3,-1(0)	Load address of base of array board
1476:     ST  3,-4(1)	Save left side 
1477:    LDC  3,3(6)	Load integer constant 
1478:     LD  4,-4(1)	Load left into ac1 
1479:    SUB  3,4,3	compute location from index 
1480:     LD  3,0(3)	Load array element 
1481:     ST  3,-4(1)	Save left side 
1482:    LDC  3,1(6)	Load integer constant 
1483:    LDC  4,0(6)	Load 0 
1484:    SUB  3,4,3	Op unary - 
1485:     LD  4,-4(1)	Load left into ac1 
1486:    TEQ  3,4,3	Op == 
1487:     LD  4,-3(1)	Load left into ac1 
1488:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1490:    LDC  3,3(6)	Load integer constant 
1491:     ST  3,-3(1)	Save index 
1492:    LDC  3,2(6)	Load integer constant 
1493:     LD  4,-3(1)	Restore index 
1494:    LDA  5,-1(0)	Load address of base of array board
1495:    SUB  5,5,4	Compute offset of value 
1496:     ST  3,0(5)	Store variable board
* EXPRESSION
1497:    LDC  3,1(6)	Load Boolean constant 
1498:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1489:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1500:    LDA  3,-1(0)	Load address of base of array board
1501:     ST  3,-3(1)	Save left side 
1502:    LDC  3,6(6)	Load integer constant 
1503:     LD  4,-3(1)	Load left into ac1 
1504:    SUB  3,4,3	compute location from index 
1505:     LD  3,0(3)	Load array element 
1506:     ST  3,-3(1)	Save left side 
1507:    LDC  3,1(6)	Load integer constant 
1508:     LD  4,-3(1)	Load left into ac1 
1509:    TEQ  3,4,3	Op == 
1510:     ST  3,-3(1)	Save left side 
1511:    LDA  3,-1(0)	Load address of base of array board
1512:     ST  3,-4(1)	Save left side 
1513:    LDC  3,7(6)	Load integer constant 
1514:     LD  4,-4(1)	Load left into ac1 
1515:    SUB  3,4,3	compute location from index 
1516:     LD  3,0(3)	Load array element 
1517:     ST  3,-4(1)	Save left side 
1518:    LDC  3,1(6)	Load integer constant 
1519:     LD  4,-4(1)	Load left into ac1 
1520:    TEQ  3,4,3	Op == 
1521:     LD  4,-3(1)	Load left into ac1 
1522:    AND  3,4,3	Op AND 
1523:     ST  3,-3(1)	Save left side 
1524:    LDA  3,-1(0)	Load address of base of array board
1525:     ST  3,-4(1)	Save left side 
1526:    LDC  3,0(6)	Load integer constant 
1527:     LD  4,-4(1)	Load left into ac1 
1528:    SUB  3,4,3	compute location from index 
1529:     LD  3,0(3)	Load array element 
1530:     ST  3,-4(1)	Save left side 
1531:    LDC  3,1(6)	Load integer constant 
1532:     LD  4,-4(1)	Load left into ac1 
1533:    TEQ  3,4,3	Op == 
1534:     ST  3,-4(1)	Save left side 
1535:    LDA  3,-1(0)	Load address of base of array board
1536:     ST  3,-5(1)	Save left side 
1537:    LDC  3,4(6)	Load integer constant 
1538:     LD  4,-5(1)	Load left into ac1 
1539:    SUB  3,4,3	compute location from index 
1540:     LD  3,0(3)	Load array element 
1541:     ST  3,-5(1)	Save left side 
1542:    LDC  3,1(6)	Load integer constant 
1543:     LD  4,-5(1)	Load left into ac1 
1544:    TEQ  3,4,3	Op == 
1545:     LD  4,-4(1)	Load left into ac1 
1546:    AND  3,4,3	Op AND 
1547:     LD  4,-3(1)	Load left into ac1 
1548:     OR  3,4,3	Op OR 
1549:     ST  3,-3(1)	Save left side 
1550:    LDA  3,-1(0)	Load address of base of array board
1551:     ST  3,-4(1)	Save left side 
1552:    LDC  3,2(6)	Load integer constant 
1553:     LD  4,-4(1)	Load left into ac1 
1554:    SUB  3,4,3	compute location from index 
1555:     LD  3,0(3)	Load array element 
1556:     ST  3,-4(1)	Save left side 
1557:    LDC  3,1(6)	Load integer constant 
1558:     LD  4,-4(1)	Load left into ac1 
1559:    TEQ  3,4,3	Op == 
1560:     ST  3,-4(1)	Save left side 
1561:    LDA  3,-1(0)	Load address of base of array board
1562:     ST  3,-5(1)	Save left side 
1563:    LDC  3,5(6)	Load integer constant 
1564:     LD  4,-5(1)	Load left into ac1 
1565:    SUB  3,4,3	compute location from index 
1566:     LD  3,0(3)	Load array element 
1567:     ST  3,-5(1)	Save left side 
1568:    LDC  3,1(6)	Load integer constant 
1569:     LD  4,-5(1)	Load left into ac1 
1570:    TEQ  3,4,3	Op == 
1571:     LD  4,-4(1)	Load left into ac1 
1572:    AND  3,4,3	Op AND 
1573:     LD  4,-3(1)	Load left into ac1 
1574:     OR  3,4,3	Op OR 
1575:     ST  3,-3(1)	Save left side 
1576:    LDA  3,-1(0)	Load address of base of array board
1577:     ST  3,-4(1)	Save left side 
1578:    LDC  3,8(6)	Load integer constant 
1579:     LD  4,-4(1)	Load left into ac1 
1580:    SUB  3,4,3	compute location from index 
1581:     LD  3,0(3)	Load array element 
1582:     ST  3,-4(1)	Save left side 
1583:    LDC  3,1(6)	Load integer constant 
1584:    LDC  4,0(6)	Load 0 
1585:    SUB  3,4,3	Op unary - 
1586:     LD  4,-4(1)	Load left into ac1 
1587:    TEQ  3,4,3	Op == 
1588:     LD  4,-3(1)	Load left into ac1 
1589:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1591:    LDC  3,8(6)	Load integer constant 
1592:     ST  3,-3(1)	Save index 
1593:    LDC  3,2(6)	Load integer constant 
1594:     LD  4,-3(1)	Restore index 
1595:    LDA  5,-1(0)	Load address of base of array board
1596:    SUB  5,5,4	Compute offset of value 
1597:     ST  3,0(5)	Store variable board
* EXPRESSION
1598:    LDC  3,1(6)	Load Boolean constant 
1599:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1590:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1601:    LDA  3,-1(0)	Load address of base of array board
1602:     ST  3,-3(1)	Save left side 
1603:    LDC  3,6(6)	Load integer constant 
1604:     LD  4,-3(1)	Load left into ac1 
1605:    SUB  3,4,3	compute location from index 
1606:     LD  3,0(3)	Load array element 
1607:     ST  3,-3(1)	Save left side 
1608:    LDC  3,1(6)	Load integer constant 
1609:     LD  4,-3(1)	Load left into ac1 
1610:    TEQ  3,4,3	Op == 
1611:     ST  3,-3(1)	Save left side 
1612:    LDA  3,-1(0)	Load address of base of array board
1613:     ST  3,-4(1)	Save left side 
1614:    LDC  3,8(6)	Load integer constant 
1615:     LD  4,-4(1)	Load left into ac1 
1616:    SUB  3,4,3	compute location from index 
1617:     LD  3,0(3)	Load array element 
1618:     ST  3,-4(1)	Save left side 
1619:    LDC  3,1(6)	Load integer constant 
1620:     LD  4,-4(1)	Load left into ac1 
1621:    TEQ  3,4,3	Op == 
1622:     LD  4,-3(1)	Load left into ac1 
1623:    AND  3,4,3	Op AND 
1624:     ST  3,-3(1)	Save left side 
1625:    LDA  3,-1(0)	Load address of base of array board
1626:     ST  3,-4(1)	Save left side 
1627:    LDC  3,4(6)	Load integer constant 
1628:     LD  4,-4(1)	Load left into ac1 
1629:    SUB  3,4,3	compute location from index 
1630:     LD  3,0(3)	Load array element 
1631:     ST  3,-4(1)	Save left side 
1632:    LDC  3,1(6)	Load integer constant 
1633:     LD  4,-4(1)	Load left into ac1 
1634:    TEQ  3,4,3	Op == 
1635:     ST  3,-4(1)	Save left side 
1636:    LDA  3,-1(0)	Load address of base of array board
1637:     ST  3,-5(1)	Save left side 
1638:    LDC  3,1(6)	Load integer constant 
1639:     LD  4,-5(1)	Load left into ac1 
1640:    SUB  3,4,3	compute location from index 
1641:     LD  3,0(3)	Load array element 
1642:     ST  3,-5(1)	Save left side 
1643:    LDC  3,1(6)	Load integer constant 
1644:     LD  4,-5(1)	Load left into ac1 
1645:    TEQ  3,4,3	Op == 
1646:     LD  4,-4(1)	Load left into ac1 
1647:    AND  3,4,3	Op AND 
1648:     LD  4,-3(1)	Load left into ac1 
1649:     OR  3,4,3	Op OR 
1650:     ST  3,-3(1)	Save left side 
1651:    LDA  3,-1(0)	Load address of base of array board
1652:     ST  3,-4(1)	Save left side 
1653:    LDC  3,7(6)	Load integer constant 
1654:     LD  4,-4(1)	Load left into ac1 
1655:    SUB  3,4,3	compute location from index 
1656:     LD  3,0(3)	Load array element 
1657:     ST  3,-4(1)	Save left side 
1658:    LDC  3,1(6)	Load integer constant 
1659:    LDC  4,0(6)	Load 0 
1660:    SUB  3,4,3	Op unary - 
1661:     LD  4,-4(1)	Load left into ac1 
1662:    TEQ  3,4,3	Op == 
1663:     LD  4,-3(1)	Load left into ac1 
1664:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1666:    LDC  3,7(6)	Load integer constant 
1667:     ST  3,-3(1)	Save index 
1668:    LDC  3,2(6)	Load integer constant 
1669:     LD  4,-3(1)	Restore index 
1670:    LDA  5,-1(0)	Load address of base of array board
1671:    SUB  5,5,4	Compute offset of value 
1672:     ST  3,0(5)	Store variable board
* EXPRESSION
1673:    LDC  3,1(6)	Load Boolean constant 
1674:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1665:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
1676:    LDA  3,-1(0)	Load address of base of array board
1677:     ST  3,-3(1)	Save left side 
1678:    LDC  3,7(6)	Load integer constant 
1679:     LD  4,-3(1)	Load left into ac1 
1680:    SUB  3,4,3	compute location from index 
1681:     LD  3,0(3)	Load array element 
1682:     ST  3,-3(1)	Save left side 
1683:    LDC  3,1(6)	Load integer constant 
1684:     LD  4,-3(1)	Load left into ac1 
1685:    TEQ  3,4,3	Op == 
1686:     ST  3,-3(1)	Save left side 
1687:    LDA  3,-1(0)	Load address of base of array board
1688:     ST  3,-4(1)	Save left side 
1689:    LDC  3,8(6)	Load integer constant 
1690:     LD  4,-4(1)	Load left into ac1 
1691:    SUB  3,4,3	compute location from index 
1692:     LD  3,0(3)	Load array element 
1693:     ST  3,-4(1)	Save left side 
1694:    LDC  3,1(6)	Load integer constant 
1695:     LD  4,-4(1)	Load left into ac1 
1696:    TEQ  3,4,3	Op == 
1697:     LD  4,-3(1)	Load left into ac1 
1698:    AND  3,4,3	Op AND 
1699:     ST  3,-3(1)	Save left side 
1700:    LDA  3,-1(0)	Load address of base of array board
1701:     ST  3,-4(1)	Save left side 
1702:    LDC  3,4(6)	Load integer constant 
1703:     LD  4,-4(1)	Load left into ac1 
1704:    SUB  3,4,3	compute location from index 
1705:     LD  3,0(3)	Load array element 
1706:     ST  3,-4(1)	Save left side 
1707:    LDC  3,1(6)	Load integer constant 
1708:     LD  4,-4(1)	Load left into ac1 
1709:    TEQ  3,4,3	Op == 
1710:     ST  3,-4(1)	Save left side 
1711:    LDA  3,-1(0)	Load address of base of array board
1712:     ST  3,-5(1)	Save left side 
1713:    LDC  3,2(6)	Load integer constant 
1714:     LD  4,-5(1)	Load left into ac1 
1715:    SUB  3,4,3	compute location from index 
1716:     LD  3,0(3)	Load array element 
1717:     ST  3,-5(1)	Save left side 
1718:    LDC  3,1(6)	Load integer constant 
1719:     LD  4,-5(1)	Load left into ac1 
1720:    TEQ  3,4,3	Op == 
1721:     LD  4,-4(1)	Load left into ac1 
1722:    AND  3,4,3	Op AND 
1723:     LD  4,-3(1)	Load left into ac1 
1724:     OR  3,4,3	Op OR 
1725:     ST  3,-3(1)	Save left side 
1726:    LDA  3,-1(0)	Load address of base of array board
1727:     ST  3,-4(1)	Save left side 
1728:    LDC  3,0(6)	Load integer constant 
1729:     LD  4,-4(1)	Load left into ac1 
1730:    SUB  3,4,3	compute location from index 
1731:     LD  3,0(3)	Load array element 
1732:     ST  3,-4(1)	Save left side 
1733:    LDC  3,1(6)	Load integer constant 
1734:     LD  4,-4(1)	Load left into ac1 
1735:    TEQ  3,4,3	Op == 
1736:     ST  3,-4(1)	Save left side 
1737:    LDA  3,-1(0)	Load address of base of array board
1738:     ST  3,-5(1)	Save left side 
1739:    LDC  3,3(6)	Load integer constant 
1740:     LD  4,-5(1)	Load left into ac1 
1741:    SUB  3,4,3	compute location from index 
1742:     LD  3,0(3)	Load array element 
1743:     ST  3,-5(1)	Save left side 
1744:    LDC  3,1(6)	Load integer constant 
1745:     LD  4,-5(1)	Load left into ac1 
1746:    TEQ  3,4,3	Op == 
1747:     LD  4,-4(1)	Load left into ac1 
1748:    AND  3,4,3	Op AND 
1749:     LD  4,-3(1)	Load left into ac1 
1750:     OR  3,4,3	Op OR 
1751:     ST  3,-3(1)	Save left side 
1752:    LDA  3,-1(0)	Load address of base of array board
1753:     ST  3,-4(1)	Save left side 
1754:    LDC  3,6(6)	Load integer constant 
1755:     LD  4,-4(1)	Load left into ac1 
1756:    SUB  3,4,3	compute location from index 
1757:     LD  3,0(3)	Load array element 
1758:     ST  3,-4(1)	Save left side 
1759:    LDC  3,1(6)	Load integer constant 
1760:    LDC  4,0(6)	Load 0 
1761:    SUB  3,4,3	Op unary - 
1762:     LD  4,-4(1)	Load left into ac1 
1763:    TEQ  3,4,3	Op == 
1764:     LD  4,-3(1)	Load left into ac1 
1765:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1767:    LDC  3,6(6)	Load integer constant 
1768:     ST  3,-3(1)	Save index 
1769:    LDC  3,2(6)	Load integer constant 
1770:     LD  4,-3(1)	Restore index 
1771:    LDA  5,-1(0)	Load address of base of array board
1772:    SUB  5,5,4	Compute offset of value 
1773:     ST  3,0(5)	Store variable board
* EXPRESSION
1774:    LDC  3,1(6)	Load Boolean constant 
1775:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1766:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1675:    LDA  7,100(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1600:    LDA  7,175(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1499:    LDA  7,276(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1424:    LDA  7,351(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1297:    LDA  7,478(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1222:    LDA  7,553(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1121:    LDA  7,654(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1046:    LDA  7,729(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
1776:     LD  3,-2(1)	Load variable blocked
1777:    LDA  2,0(3)	Copy result to rt register 
1778:     LD  3,-1(1)	Load return address 
1779:     LD  1,0(1)	Adjust fp 
1780:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
1781:    LDC  2,0(6)	Set return value to 0 
1782:     LD  3,-1(1)	Load return address 
1783:     LD  1,0(1)	Adjust fp 
1784:    LDA  7,0(3)	Return 
* END FUNCTION blockplayer
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION placey
1785:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
*                       Begin call to  win
1786:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to win
1787:    LDA  1,-2(1)	Load address of new frame 
1788:    LDA  3,1(7)	Return address in ac 
1789:    LDA  7,-1698(7)	CALL win
1790:    LDA  3,0(2)	Save the result in ac 
*                       End call to win
1791:    LDC  4,1(6)	Load 1 
1792:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* Compound Body
* IF
*                       Begin call to  blockplayer
1794:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to blockplayer
1795:    LDA  1,-2(1)	Load address of new frame 
1796:    LDA  3,1(7)	Return address in ac 
1797:    LDA  7,-855(7)	CALL blockplayer
1798:    LDA  3,0(2)	Save the result in ac 
*                       End call to blockplayer
1799:    LDC  4,1(6)	Load 1 
1800:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  move
1802:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to move
1803:    LDA  1,-2(1)	Load address of new frame 
1804:    LDA  3,1(7)	Return address in ac 
1805:    LDA  7,-1764(7)	CALL move
1806:    LDA  3,0(2)	Save the result in ac 
*                       End call to move
* END COMPOUND
1801:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1793:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
1807:    LDC  2,0(6)	Set return value to 0 
1808:     LD  3,-1(1)	Load return address 
1809:     LD  1,0(1)	Adjust fp 
1810:    LDA  7,0(3)	Return 
* END FUNCTION placey
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION xingrid
1811:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
1812:    LDC  3,0(6)	Load Boolean constant 
1813:     ST  3,-3(1)	Store variable retval
* IF
1814:     LD  3,-2(1)	Load variable x
1815:     ST  3,-4(1)	Save left side 
1816:    LDC  3,0(6)	Load integer constant 
1817:     LD  4,-4(1)	Load left into ac1 
1818:    TGE  3,4,3	Op >= 
1819:     ST  3,-4(1)	Save left side 
1820:     LD  3,-2(1)	Load variable x
1821:     ST  3,-5(1)	Save left side 
1822:    LDC  3,8(6)	Load integer constant 
1823:     LD  4,-5(1)	Load left into ac1 
1824:    TLE  3,4,3	Op <= 
1825:     LD  4,-4(1)	Load left into ac1 
1826:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* IF
1828:    LDA  3,-1(0)	Load address of base of array board
1829:     ST  3,-4(1)	Save left side 
1830:     LD  3,-2(1)	Load variable x
1831:     LD  4,-4(1)	Load left into ac1 
1832:    SUB  3,4,3	compute location from index 
1833:     LD  3,0(3)	Load array element 
1834:     ST  3,-4(1)	Save left side 
1835:    LDC  3,1(6)	Load integer constant 
1836:     LD  4,-4(1)	Load left into ac1 
1837:    TNE  3,4,3	Op != 
1838:     ST  3,-4(1)	Save left side 
1839:    LDA  3,-1(0)	Load address of base of array board
1840:     ST  3,-5(1)	Save left side 
1841:     LD  3,-2(1)	Load variable x
1842:     LD  4,-5(1)	Load left into ac1 
1843:    SUB  3,4,3	compute location from index 
1844:     LD  3,0(3)	Load array element 
1845:     ST  3,-5(1)	Save left side 
1846:    LDC  3,2(6)	Load integer constant 
1847:     LD  4,-5(1)	Load left into ac1 
1848:    TNE  3,4,3	Op != 
1849:     LD  4,-4(1)	Load left into ac1 
1850:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
1852:     LD  3,-2(1)	Load variable x
1853:     ST  3,-4(1)	Save index 
1854:    LDC  3,1(6)	Load integer constant 
1855:     LD  4,-4(1)	Restore index 
1856:    LDA  5,-1(0)	Load address of base of array board
1857:    SUB  5,5,4	Compute offset of value 
1858:     ST  3,0(5)	Store variable board
* EXPRESSION
1859:    LDC  3,1(6)	Load Boolean constant 
1860:     ST  3,-3(1)	Store variable retval
* END COMPOUND
1851:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1827:    JZR  3,33(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
1861:     LD  3,-3(1)	Load variable retval
1862:    LDA  2,0(3)	Copy result to rt register 
1863:     LD  3,-1(1)	Load return address 
1864:     LD  1,0(1)	Adjust fp 
1865:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
1866:    LDC  2,0(6)	Set return value to 0 
1867:     LD  3,-1(1)	Load return address 
1868:     LD  1,0(1)	Adjust fp 
1869:    LDA  7,0(3)	Return 
* END FUNCTION xingrid
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION printboard
1870:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
1871:    LDC  3,0(6)	Load integer constant 
1872:     ST  3,-2(1)	Store variable i
* WHILE
1873:     LD  3,-2(1)	Load variable i
1874:     ST  3,-3(1)	Save left side 
1875:    LDC  3,9(6)	Load integer constant 
1876:     LD  4,-3(1)	Load left into ac1 
1877:    TLT  3,4,3	Op < 
1878:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
1880:    LDA  3,-1(0)	Load address of base of array board
1881:     ST  3,-3(1)	Save left side 
1882:     LD  3,-2(1)	Load variable i
1883:     LD  4,-3(1)	Load left into ac1 
1884:    SUB  3,4,3	compute location from index 
1885:     LD  3,0(3)	Load array element 
1886:     ST  3,-3(1)	Save left side 
1887:    LDC  3,1(6)	Load integer constant 
1888:     LD  4,-3(1)	Load left into ac1 
1889:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
1891:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1892:    LDC  3,1(6)	Load Boolean constant 
1893:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
1894:    LDA  1,-3(1)	Load address of new frame 
1895:    LDA  3,1(7)	Return address in ac 
1896:    LDA  7,-1879(7)	CALL outputb
1897:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
1890:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
1899:    LDA  3,-1(0)	Load address of base of array board
1900:     ST  3,-3(1)	Save left side 
1901:     LD  3,-2(1)	Load variable i
1902:     LD  4,-3(1)	Load left into ac1 
1903:    SUB  3,4,3	compute location from index 
1904:     LD  3,0(3)	Load array element 
1905:     ST  3,-3(1)	Save left side 
1906:    LDC  3,2(6)	Load integer constant 
1907:     LD  4,-3(1)	Load left into ac1 
1908:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
1910:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1911:    LDC  3,0(6)	Load Boolean constant 
1912:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
1913:    LDA  1,-3(1)	Load address of new frame 
1914:    LDA  3,1(7)	Return address in ac 
1915:    LDA  7,-1898(7)	CALL outputb
1916:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
1909:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
1918:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1919:     LD  3,-2(1)	Load variable i
1920:     ST  3,-5(1)	Store parameter 
*                       Jump to output
1921:    LDA  1,-3(1)	Load address of new frame 
1922:    LDA  3,1(7)	Return address in ac 
1923:    LDA  7,-1918(7)	CALL output
1924:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
1917:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
1898:    LDA  7,26(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
1925:     LD  3,-2(1)	Load variable i
1926:     ST  3,-3(1)	Save left side 
1927:    LDC  3,2(6)	Load integer constant 
1928:     LD  4,-3(1)	Load left into ac1 
1929:    TEQ  3,4,3	Op == 
1930:     ST  3,-3(1)	Save left side 
1931:     LD  3,-2(1)	Load variable i
1932:     ST  3,-4(1)	Save left side 
1933:    LDC  3,5(6)	Load integer constant 
1934:     LD  4,-4(1)	Load left into ac1 
1935:    TEQ  3,4,3	Op == 
1936:     LD  4,-3(1)	Load left into ac1 
1937:     OR  3,4,3	Op OR 
1938:     ST  3,-3(1)	Save left side 
1939:     LD  3,-2(1)	Load variable i
1940:     ST  3,-4(1)	Save left side 
1941:    LDC  3,8(6)	Load integer constant 
1942:     LD  4,-4(1)	Load left into ac1 
1943:    TEQ  3,4,3	Op == 
1944:     LD  4,-3(1)	Load left into ac1 
1945:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outnl
1947:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
1948:    LDA  1,-3(1)	Load address of new frame 
1949:    LDA  3,1(7)	Return address in ac 
1950:    LDA  7,-1914(7)	CALL outnl
1951:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
1946:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
1952:     LD  3,-2(1)	load lhs variable i
1953:    LDA  3,1(3)	increment value of i
1954:     ST  3,-2(1)	Store variable i
* END COMPOUND
1955:    LDA  7,-83(7)	go to beginning of loop 
1879:    LDA  7,76(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
1956:    LDC  2,0(6)	Set return value to 0 
1957:     LD  3,-1(1)	Load return address 
1958:     LD  1,0(1)	Adjust fp 
1959:    LDA  7,0(3)	Return 
* END FUNCTION printboard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION finished
1960:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
1961:    LDC  3,0(6)	Load integer constant 
1962:     ST  3,-2(1)	Store variable i
* IF
1963:    LDA  3,-1(0)	Load address of base of array board
1964:     ST  3,-3(1)	Save left side 
1965:    LDC  3,0(6)	Load integer constant 
1966:     LD  4,-3(1)	Load left into ac1 
1967:    SUB  3,4,3	compute location from index 
1968:     LD  3,0(3)	Load array element 
1969:     ST  3,-3(1)	Save left side 
1970:    LDC  3,1(6)	Load integer constant 
1971:    LDC  4,0(6)	Load 0 
1972:    SUB  3,4,3	Op unary - 
1973:     LD  4,-3(1)	Load left into ac1 
1974:    TNE  3,4,3	Op != 
1975:     ST  3,-3(1)	Save left side 
1976:    LDA  3,-1(0)	Load address of base of array board
1977:     ST  3,-4(1)	Save left side 
1978:    LDC  3,0(6)	Load integer constant 
1979:     LD  4,-4(1)	Load left into ac1 
1980:    SUB  3,4,3	compute location from index 
1981:     LD  3,0(3)	Load array element 
1982:     ST  3,-4(1)	Save left side 
1983:    LDA  3,-1(0)	Load address of base of array board
1984:     ST  3,-5(1)	Save left side 
1985:    LDC  3,1(6)	Load integer constant 
1986:     LD  4,-5(1)	Load left into ac1 
1987:    SUB  3,4,3	compute location from index 
1988:     LD  3,0(3)	Load array element 
1989:     LD  4,-4(1)	Load left into ac1 
1990:    TEQ  3,4,3	Op == 
1991:     ST  3,-4(1)	Save left side 
1992:    LDA  3,-1(0)	Load address of base of array board
1993:     ST  3,-5(1)	Save left side 
1994:    LDC  3,0(6)	Load integer constant 
1995:     LD  4,-5(1)	Load left into ac1 
1996:    SUB  3,4,3	compute location from index 
1997:     LD  3,0(3)	Load array element 
1998:     ST  3,-5(1)	Save left side 
1999:    LDA  3,-1(0)	Load address of base of array board
2000:     ST  3,-6(1)	Save left side 
2001:    LDC  3,2(6)	Load integer constant 
2002:     LD  4,-6(1)	Load left into ac1 
2003:    SUB  3,4,3	compute location from index 
2004:     LD  3,0(3)	Load array element 
2005:     LD  4,-5(1)	Load left into ac1 
2006:    TEQ  3,4,3	Op == 
2007:     LD  4,-4(1)	Load left into ac1 
2008:    AND  3,4,3	Op AND 
2009:     ST  3,-4(1)	Save left side 
2010:    LDA  3,-1(0)	Load address of base of array board
2011:     ST  3,-5(1)	Save left side 
2012:    LDC  3,0(6)	Load integer constant 
2013:     LD  4,-5(1)	Load left into ac1 
2014:    SUB  3,4,3	compute location from index 
2015:     LD  3,0(3)	Load array element 
2016:     ST  3,-5(1)	Save left side 
2017:    LDA  3,-1(0)	Load address of base of array board
2018:     ST  3,-6(1)	Save left side 
2019:    LDC  3,4(6)	Load integer constant 
2020:     LD  4,-6(1)	Load left into ac1 
2021:    SUB  3,4,3	compute location from index 
2022:     LD  3,0(3)	Load array element 
2023:     LD  4,-5(1)	Load left into ac1 
2024:    TEQ  3,4,3	Op == 
2025:     ST  3,-5(1)	Save left side 
2026:    LDA  3,-1(0)	Load address of base of array board
2027:     ST  3,-6(1)	Save left side 
2028:    LDC  3,0(6)	Load integer constant 
2029:     LD  4,-6(1)	Load left into ac1 
2030:    SUB  3,4,3	compute location from index 
2031:     LD  3,0(3)	Load array element 
2032:     ST  3,-6(1)	Save left side 
2033:    LDA  3,-1(0)	Load address of base of array board
2034:     ST  3,-7(1)	Save left side 
2035:    LDC  3,8(6)	Load integer constant 
2036:     LD  4,-7(1)	Load left into ac1 
2037:    SUB  3,4,3	compute location from index 
2038:     LD  3,0(3)	Load array element 
2039:     LD  4,-6(1)	Load left into ac1 
2040:    TEQ  3,4,3	Op == 
2041:     LD  4,-5(1)	Load left into ac1 
2042:    AND  3,4,3	Op AND 
2043:     LD  4,-4(1)	Load left into ac1 
2044:     OR  3,4,3	Op OR 
2045:     ST  3,-4(1)	Save left side 
2046:    LDA  3,-1(0)	Load address of base of array board
2047:     ST  3,-5(1)	Save left side 
2048:    LDC  3,0(6)	Load integer constant 
2049:     LD  4,-5(1)	Load left into ac1 
2050:    SUB  3,4,3	compute location from index 
2051:     LD  3,0(3)	Load array element 
2052:     ST  3,-5(1)	Save left side 
2053:    LDA  3,-1(0)	Load address of base of array board
2054:     ST  3,-6(1)	Save left side 
2055:    LDC  3,3(6)	Load integer constant 
2056:     LD  4,-6(1)	Load left into ac1 
2057:    SUB  3,4,3	compute location from index 
2058:     LD  3,0(3)	Load array element 
2059:     LD  4,-5(1)	Load left into ac1 
2060:    TEQ  3,4,3	Op == 
2061:     ST  3,-5(1)	Save left side 
2062:    LDA  3,-1(0)	Load address of base of array board
2063:     ST  3,-6(1)	Save left side 
2064:    LDC  3,0(6)	Load integer constant 
2065:     LD  4,-6(1)	Load left into ac1 
2066:    SUB  3,4,3	compute location from index 
2067:     LD  3,0(3)	Load array element 
2068:     ST  3,-6(1)	Save left side 
2069:    LDA  3,-1(0)	Load address of base of array board
2070:     ST  3,-7(1)	Save left side 
2071:    LDC  3,6(6)	Load integer constant 
2072:     LD  4,-7(1)	Load left into ac1 
2073:    SUB  3,4,3	compute location from index 
2074:     LD  3,0(3)	Load array element 
2075:     LD  4,-6(1)	Load left into ac1 
2076:    TEQ  3,4,3	Op == 
2077:     LD  4,-5(1)	Load left into ac1 
2078:    AND  3,4,3	Op AND 
2079:     LD  4,-4(1)	Load left into ac1 
2080:     OR  3,4,3	Op OR 
2081:     LD  4,-3(1)	Load left into ac1 
2082:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* RETURN
2084:    LDC  3,1(6)	Load Boolean constant 
2085:    LDA  2,0(3)	Copy result to rt register 
2086:     LD  3,-1(1)	Load return address 
2087:     LD  1,0(1)	Adjust fp 
2088:    LDA  7,0(3)	Return 
* END COMPOUND
2083:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
2089:    LDA  3,-1(0)	Load address of base of array board
2090:     ST  3,-3(1)	Save left side 
2091:    LDC  3,1(6)	Load integer constant 
2092:     LD  4,-3(1)	Load left into ac1 
2093:    SUB  3,4,3	compute location from index 
2094:     LD  3,0(3)	Load array element 
2095:     ST  3,-3(1)	Save left side 
2096:    LDC  3,1(6)	Load integer constant 
2097:    LDC  4,0(6)	Load 0 
2098:    SUB  3,4,3	Op unary - 
2099:     LD  4,-3(1)	Load left into ac1 
2100:    TNE  3,4,3	Op != 
2101:     ST  3,-3(1)	Save left side 
2102:    LDA  3,-1(0)	Load address of base of array board
2103:     ST  3,-4(1)	Save left side 
2104:    LDC  3,1(6)	Load integer constant 
2105:     LD  4,-4(1)	Load left into ac1 
2106:    SUB  3,4,3	compute location from index 
2107:     LD  3,0(3)	Load array element 
2108:     ST  3,-4(1)	Save left side 
2109:    LDA  3,-1(0)	Load address of base of array board
2110:     ST  3,-5(1)	Save left side 
2111:    LDC  3,4(6)	Load integer constant 
2112:     LD  4,-5(1)	Load left into ac1 
2113:    SUB  3,4,3	compute location from index 
2114:     LD  3,0(3)	Load array element 
2115:     LD  4,-4(1)	Load left into ac1 
2116:    TEQ  3,4,3	Op == 
2117:     ST  3,-4(1)	Save left side 
2118:    LDA  3,-1(0)	Load address of base of array board
2119:     ST  3,-5(1)	Save left side 
2120:    LDC  3,1(6)	Load integer constant 
2121:     LD  4,-5(1)	Load left into ac1 
2122:    SUB  3,4,3	compute location from index 
2123:     LD  3,0(3)	Load array element 
2124:     ST  3,-5(1)	Save left side 
2125:    LDA  3,-1(0)	Load address of base of array board
2126:     ST  3,-6(1)	Save left side 
2127:    LDC  3,7(6)	Load integer constant 
2128:     LD  4,-6(1)	Load left into ac1 
2129:    SUB  3,4,3	compute location from index 
2130:     LD  3,0(3)	Load array element 
2131:     LD  4,-5(1)	Load left into ac1 
2132:    TEQ  3,4,3	Op == 
2133:     LD  4,-4(1)	Load left into ac1 
2134:    AND  3,4,3	Op AND 
2135:     LD  4,-3(1)	Load left into ac1 
2136:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* RETURN
2138:    LDC  3,1(6)	Load Boolean constant 
2139:    LDA  2,0(3)	Copy result to rt register 
2140:     LD  3,-1(1)	Load return address 
2141:     LD  1,0(1)	Adjust fp 
2142:    LDA  7,0(3)	Return 
* END COMPOUND
2137:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
2143:    LDA  3,-1(0)	Load address of base of array board
2144:     ST  3,-3(1)	Save left side 
2145:    LDC  3,2(6)	Load integer constant 
2146:     LD  4,-3(1)	Load left into ac1 
2147:    SUB  3,4,3	compute location from index 
2148:     LD  3,0(3)	Load array element 
2149:     ST  3,-3(1)	Save left side 
2150:    LDC  3,1(6)	Load integer constant 
2151:    LDC  4,0(6)	Load 0 
2152:    SUB  3,4,3	Op unary - 
2153:     LD  4,-3(1)	Load left into ac1 
2154:    TNE  3,4,3	Op != 
2155:     ST  3,-3(1)	Save left side 
2156:    LDA  3,-1(0)	Load address of base of array board
2157:     ST  3,-4(1)	Save left side 
2158:    LDC  3,2(6)	Load integer constant 
2159:     LD  4,-4(1)	Load left into ac1 
2160:    SUB  3,4,3	compute location from index 
2161:     LD  3,0(3)	Load array element 
2162:     ST  3,-4(1)	Save left side 
2163:    LDA  3,-1(0)	Load address of base of array board
2164:     ST  3,-5(1)	Save left side 
2165:    LDC  3,4(6)	Load integer constant 
2166:     LD  4,-5(1)	Load left into ac1 
2167:    SUB  3,4,3	compute location from index 
2168:     LD  3,0(3)	Load array element 
2169:     LD  4,-4(1)	Load left into ac1 
2170:    TEQ  3,4,3	Op == 
2171:     ST  3,-4(1)	Save left side 
2172:    LDA  3,-1(0)	Load address of base of array board
2173:     ST  3,-5(1)	Save left side 
2174:    LDC  3,2(6)	Load integer constant 
2175:     LD  4,-5(1)	Load left into ac1 
2176:    SUB  3,4,3	compute location from index 
2177:     LD  3,0(3)	Load array element 
2178:     ST  3,-5(1)	Save left side 
2179:    LDA  3,-1(0)	Load address of base of array board
2180:     ST  3,-6(1)	Save left side 
2181:    LDC  3,6(6)	Load integer constant 
2182:     LD  4,-6(1)	Load left into ac1 
2183:    SUB  3,4,3	compute location from index 
2184:     LD  3,0(3)	Load array element 
2185:     LD  4,-5(1)	Load left into ac1 
2186:    TEQ  3,4,3	Op == 
2187:     LD  4,-4(1)	Load left into ac1 
2188:    AND  3,4,3	Op AND 
2189:     ST  3,-4(1)	Save left side 
2190:    LDA  3,-1(0)	Load address of base of array board
2191:     ST  3,-5(1)	Save left side 
2192:    LDC  3,2(6)	Load integer constant 
2193:     LD  4,-5(1)	Load left into ac1 
2194:    SUB  3,4,3	compute location from index 
2195:     LD  3,0(3)	Load array element 
2196:     ST  3,-5(1)	Save left side 
2197:    LDA  3,-1(0)	Load address of base of array board
2198:     ST  3,-6(1)	Save left side 
2199:    LDC  3,5(6)	Load integer constant 
2200:     LD  4,-6(1)	Load left into ac1 
2201:    SUB  3,4,3	compute location from index 
2202:     LD  3,0(3)	Load array element 
2203:     LD  4,-5(1)	Load left into ac1 
2204:    TEQ  3,4,3	Op == 
2205:     ST  3,-5(1)	Save left side 
2206:    LDA  3,-1(0)	Load address of base of array board
2207:     ST  3,-6(1)	Save left side 
2208:    LDC  3,2(6)	Load integer constant 
2209:     LD  4,-6(1)	Load left into ac1 
2210:    SUB  3,4,3	compute location from index 
2211:     LD  3,0(3)	Load array element 
2212:     ST  3,-6(1)	Save left side 
2213:    LDA  3,-1(0)	Load address of base of array board
2214:     ST  3,-7(1)	Save left side 
2215:    LDC  3,8(6)	Load integer constant 
2216:     LD  4,-7(1)	Load left into ac1 
2217:    SUB  3,4,3	compute location from index 
2218:     LD  3,0(3)	Load array element 
2219:     LD  4,-6(1)	Load left into ac1 
2220:    TEQ  3,4,3	Op == 
2221:     LD  4,-5(1)	Load left into ac1 
2222:    AND  3,4,3	Op AND 
2223:     LD  4,-4(1)	Load left into ac1 
2224:     OR  3,4,3	Op OR 
2225:     LD  4,-3(1)	Load left into ac1 
2226:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* RETURN
2228:    LDC  3,1(6)	Load Boolean constant 
2229:    LDA  2,0(3)	Copy result to rt register 
2230:     LD  3,-1(1)	Load return address 
2231:     LD  1,0(1)	Adjust fp 
2232:    LDA  7,0(3)	Return 
* END COMPOUND
2227:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
2233:    LDA  3,-1(0)	Load address of base of array board
2234:     ST  3,-3(1)	Save left side 
2235:    LDC  3,3(6)	Load integer constant 
2236:     LD  4,-3(1)	Load left into ac1 
2237:    SUB  3,4,3	compute location from index 
2238:     LD  3,0(3)	Load array element 
2239:     ST  3,-3(1)	Save left side 
2240:    LDC  3,1(6)	Load integer constant 
2241:    LDC  4,0(6)	Load 0 
2242:    SUB  3,4,3	Op unary - 
2243:     LD  4,-3(1)	Load left into ac1 
2244:    TNE  3,4,3	Op != 
2245:     ST  3,-3(1)	Save left side 
2246:    LDA  3,-1(0)	Load address of base of array board
2247:     ST  3,-4(1)	Save left side 
2248:    LDC  3,3(6)	Load integer constant 
2249:     LD  4,-4(1)	Load left into ac1 
2250:    SUB  3,4,3	compute location from index 
2251:     LD  3,0(3)	Load array element 
2252:     ST  3,-4(1)	Save left side 
2253:    LDA  3,-1(0)	Load address of base of array board
2254:     ST  3,-5(1)	Save left side 
2255:    LDC  3,4(6)	Load integer constant 
2256:     LD  4,-5(1)	Load left into ac1 
2257:    SUB  3,4,3	compute location from index 
2258:     LD  3,0(3)	Load array element 
2259:     LD  4,-4(1)	Load left into ac1 
2260:    TEQ  3,4,3	Op == 
2261:     ST  3,-4(1)	Save left side 
2262:    LDA  3,-1(0)	Load address of base of array board
2263:     ST  3,-5(1)	Save left side 
2264:    LDC  3,3(6)	Load integer constant 
2265:     LD  4,-5(1)	Load left into ac1 
2266:    SUB  3,4,3	compute location from index 
2267:     LD  3,0(3)	Load array element 
2268:     ST  3,-5(1)	Save left side 
2269:    LDA  3,-1(0)	Load address of base of array board
2270:     ST  3,-6(1)	Save left side 
2271:    LDC  3,5(6)	Load integer constant 
2272:     LD  4,-6(1)	Load left into ac1 
2273:    SUB  3,4,3	compute location from index 
2274:     LD  3,0(3)	Load array element 
2275:     LD  4,-5(1)	Load left into ac1 
2276:    TEQ  3,4,3	Op == 
2277:     LD  4,-4(1)	Load left into ac1 
2278:    AND  3,4,3	Op AND 
2279:     LD  4,-3(1)	Load left into ac1 
2280:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* RETURN
2282:    LDC  3,1(6)	Load Boolean constant 
2283:    LDA  2,0(3)	Copy result to rt register 
2284:     LD  3,-1(1)	Load return address 
2285:     LD  1,0(1)	Adjust fp 
2286:    LDA  7,0(3)	Return 
* END COMPOUND
2281:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
2287:    LDA  3,-1(0)	Load address of base of array board
2288:     ST  3,-3(1)	Save left side 
2289:    LDC  3,6(6)	Load integer constant 
2290:     LD  4,-3(1)	Load left into ac1 
2291:    SUB  3,4,3	compute location from index 
2292:     LD  3,0(3)	Load array element 
2293:     ST  3,-3(1)	Save left side 
2294:    LDC  3,1(6)	Load integer constant 
2295:    LDC  4,0(6)	Load 0 
2296:    SUB  3,4,3	Op unary - 
2297:     LD  4,-3(1)	Load left into ac1 
2298:    TNE  3,4,3	Op != 
2299:     ST  3,-3(1)	Save left side 
2300:    LDA  3,-1(0)	Load address of base of array board
2301:     ST  3,-4(1)	Save left side 
2302:    LDC  3,6(6)	Load integer constant 
2303:     LD  4,-4(1)	Load left into ac1 
2304:    SUB  3,4,3	compute location from index 
2305:     LD  3,0(3)	Load array element 
2306:     ST  3,-4(1)	Save left side 
2307:    LDA  3,-1(0)	Load address of base of array board
2308:     ST  3,-5(1)	Save left side 
2309:    LDC  3,7(6)	Load integer constant 
2310:     LD  4,-5(1)	Load left into ac1 
2311:    SUB  3,4,3	compute location from index 
2312:     LD  3,0(3)	Load array element 
2313:     LD  4,-4(1)	Load left into ac1 
2314:    TEQ  3,4,3	Op == 
2315:     ST  3,-4(1)	Save left side 
2316:    LDA  3,-1(0)	Load address of base of array board
2317:     ST  3,-5(1)	Save left side 
2318:    LDC  3,6(6)	Load integer constant 
2319:     LD  4,-5(1)	Load left into ac1 
2320:    SUB  3,4,3	compute location from index 
2321:     LD  3,0(3)	Load array element 
2322:     ST  3,-5(1)	Save left side 
2323:    LDA  3,-1(0)	Load address of base of array board
2324:     ST  3,-6(1)	Save left side 
2325:    LDC  3,8(6)	Load integer constant 
2326:     LD  4,-6(1)	Load left into ac1 
2327:    SUB  3,4,3	compute location from index 
2328:     LD  3,0(3)	Load array element 
2329:     LD  4,-5(1)	Load left into ac1 
2330:    TEQ  3,4,3	Op == 
2331:     LD  4,-4(1)	Load left into ac1 
2332:    AND  3,4,3	Op AND 
2333:     LD  4,-3(1)	Load left into ac1 
2334:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* RETURN
2336:    LDC  3,1(6)	Load Boolean constant 
2337:    LDA  2,0(3)	Copy result to rt register 
2338:     LD  3,-1(1)	Load return address 
2339:     LD  1,0(1)	Adjust fp 
2340:    LDA  7,0(3)	Return 
* END COMPOUND
2335:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* WHILE
2341:    LDA  3,-1(0)	Load address of base of array board
2342:     ST  3,-3(1)	Save left side 
2343:     LD  3,-2(1)	Load variable i
2344:     LD  4,-3(1)	Load left into ac1 
2345:    SUB  3,4,3	compute location from index 
2346:     LD  3,0(3)	Load array element 
2347:     ST  3,-3(1)	Save left side 
2348:    LDC  3,1(6)	Load integer constant 
2349:    LDC  4,0(6)	Load 0 
2350:    SUB  3,4,3	Op unary - 
2351:     LD  4,-3(1)	Load left into ac1 
2352:    TNE  3,4,3	Op != 
2353:     ST  3,-3(1)	Save left side 
2354:     LD  3,-2(1)	Load variable i
2355:     ST  3,-4(1)	Save left side 
2356:    LDC  3,9(6)	Load integer constant 
2357:     LD  4,-4(1)	Load left into ac1 
2358:    TLT  3,4,3	Op < 
2359:     LD  4,-3(1)	Load left into ac1 
2360:    AND  3,4,3	Op AND 
2361:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
2363:     LD  3,-2(1)	load lhs variable i
2364:    LDA  3,1(3)	increment value of i
2365:     ST  3,-2(1)	Store variable i
* END COMPOUND
2366:    LDA  7,-26(7)	go to beginning of loop 
2362:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
2367:     LD  3,-2(1)	Load variable i
2368:     ST  3,-3(1)	Save left side 
2369:    LDC  3,9(6)	Load integer constant 
2370:     LD  4,-3(1)	Load left into ac1 
2371:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* RETURN
2373:    LDC  3,1(6)	Load Boolean constant 
2374:    LDA  2,0(3)	Copy result to rt register 
2375:     LD  3,-1(1)	Load return address 
2376:     LD  1,0(1)	Adjust fp 
2377:    LDA  7,0(3)	Return 
* END COMPOUND
2372:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* RETURN
2379:    LDC  3,0(6)	Load Boolean constant 
2380:    LDA  2,0(3)	Copy result to rt register 
2381:     LD  3,-1(1)	Load return address 
2382:     LD  1,0(1)	Adjust fp 
2383:    LDA  7,0(3)	Return 
* END COMPOUND
2378:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
2384:    LDC  2,0(6)	Set return value to 0 
2385:     LD  3,-1(1)	Load return address 
2386:     LD  1,0(1)	Adjust fp 
2387:    LDA  7,0(3)	Return 
* END FUNCTION finished
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION playgame
2388:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
2389:    LDC  3,9(6)	Load integer constant 
2390:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  outnl
2391:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2392:    LDA  1,-3(1)	Load address of new frame 
2393:    LDA  3,1(7)	Return address in ac 
2394:    LDA  7,-2358(7)	CALL outnl
2395:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2396:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2397:    LDA  1,-3(1)	Load address of new frame 
2398:    LDA  3,1(7)	Return address in ac 
2399:    LDA  7,-530(7)	CALL printboard
2400:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* WHILE
*                       Begin call to  finished
2401:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to finished
2402:    LDA  1,-3(1)	Load address of new frame 
2403:    LDA  3,1(7)	Return address in ac 
2404:    LDA  7,-445(7)	CALL finished
2405:    LDA  3,0(2)	Save the result in ac 
*                       End call to finished
2406:    LDC  4,1(6)	Load 1 
2407:    XOR  3,3,4	Op NOT 
2408:     ST  3,-3(1)	Save left side 
2409:     LD  3,-10(0)	Load variable gamenotdone
2410:     ST  3,-4(1)	Save left side 
2411:    LDC  3,1(6)	Load Boolean constant 
2412:     LD  4,-4(1)	Load left into ac1 
2413:    TEQ  3,4,3	Op == 
2414:     LD  4,-3(1)	Load left into ac1 
2415:    AND  3,4,3	Op AND 
2416:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  input
2418:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
2419:    LDA  1,-3(1)	Load address of new frame 
2420:    LDA  3,1(7)	Return address in ac 
2421:    LDA  7,-2421(7)	CALL input
2422:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
2423:     ST  3,-2(1)	Store variable x
* IF
*                       Begin call to  xingrid
2424:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
2425:     LD  3,-2(1)	Load variable x
2426:     ST  3,-5(1)	Store parameter 
*                       Jump to xingrid
2427:    LDA  1,-3(1)	Load address of new frame 
2428:    LDA  3,1(7)	Return address in ac 
2429:    LDA  7,-619(7)	CALL xingrid
2430:    LDA  3,0(2)	Save the result in ac 
*                       End call to xingrid
2431:     ST  3,-3(1)	Save left side 
*                       Begin call to  finished
2432:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to finished
2433:    LDA  1,-4(1)	Load address of new frame 
2434:    LDA  3,1(7)	Return address in ac 
2435:    LDA  7,-476(7)	CALL finished
2436:    LDA  3,0(2)	Save the result in ac 
*                       End call to finished
2437:    LDC  4,1(6)	Load 1 
2438:    XOR  3,3,4	Op NOT 
2439:     LD  4,-3(1)	Load left into ac1 
2440:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  placey
2442:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to placey
2443:    LDA  1,-3(1)	Load address of new frame 
2444:    LDA  3,1(7)	Return address in ac 
2445:    LDA  7,-661(7)	CALL placey
2446:    LDA  3,0(2)	Save the result in ac 
*                       End call to placey
* EXPRESSION
*                       Begin call to  outnl
2447:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2448:    LDA  1,-3(1)	Load address of new frame 
2449:    LDA  3,1(7)	Return address in ac 
2450:    LDA  7,-2414(7)	CALL outnl
2451:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2452:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2453:    LDA  1,-3(1)	Load address of new frame 
2454:    LDA  3,1(7)	Return address in ac 
2455:    LDA  7,-586(7)	CALL printboard
2456:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* EXPRESSION
*                       Begin call to  outnl
2457:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2458:    LDA  1,-3(1)	Load address of new frame 
2459:    LDA  3,1(7)	Return address in ac 
2460:    LDA  7,-2424(7)	CALL outnl
2461:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
2441:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
2462:    LDA  7,-62(7)	go to beginning of loop 
2417:    LDA  7,45(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
2463:    LDC  2,0(6)	Set return value to 0 
2464:     LD  3,-1(1)	Load return address 
2465:     LD  1,0(1)	Adjust fp 
2466:    LDA  7,0(3)	Return 
* END FUNCTION playgame
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
2467:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
2468:    LDC  3,0(6)	Load integer constant 
2469:     ST  3,-2(1)	Store variable i
* WHILE
2470:     LD  3,-2(1)	Load variable i
2471:     ST  3,-3(1)	Save left side 
2472:    LDC  3,9(6)	Load integer constant 
2473:     LD  4,-3(1)	Load left into ac1 
2474:    TLT  3,4,3	Op < 
2475:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
2477:     LD  3,-2(1)	Load variable i
2478:     ST  3,-3(1)	Save index 
2479:    LDC  3,1(6)	Load integer constant 
2480:    LDC  4,0(6)	Load 0 
2481:    SUB  3,4,3	Op unary - 
2482:     LD  4,-3(1)	Restore index 
2483:    LDA  5,-1(0)	Load address of base of array board
2484:    SUB  5,5,4	Compute offset of value 
2485:     ST  3,0(5)	Store variable board
* EXPRESSION
2486:     LD  3,-2(1)	load lhs variable i
2487:    LDA  3,1(3)	increment value of i
2488:     ST  3,-2(1)	Store variable i
* END COMPOUND
2489:    LDA  7,-20(7)	go to beginning of loop 
2476:    LDA  7,13(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
2490:    LDC  3,1(6)	Load Boolean constant 
2491:     ST  3,-10(0)	Store variable gamenotdone
* EXPRESSION
*                       Begin call to  playgame
2492:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to playgame
2493:    LDA  1,-3(1)	Load address of new frame 
2494:    LDA  3,1(7)	Return address in ac 
2495:    LDA  7,-108(7)	CALL playgame
2496:    LDA  3,0(2)	Save the result in ac 
*                       End call to playgame
* EXPRESSION
*                       Begin call to  outnl
2497:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2498:    LDA  1,-3(1)	Load address of new frame 
2499:    LDA  3,1(7)	Return address in ac 
2500:    LDA  7,-2464(7)	CALL outnl
2501:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2502:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2503:    LDA  1,-3(1)	Load address of new frame 
2504:    LDA  3,1(7)	Return address in ac 
2505:    LDA  7,-636(7)	CALL printboard
2506:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* EXPRESSION
*                       Begin call to  outnl
2507:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2508:    LDA  1,-3(1)	Load address of new frame 
2509:    LDA  3,1(7)	Return address in ac 
2510:    LDA  7,-2474(7)	CALL outnl
2511:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
2512:    LDC  2,0(6)	Set return value to 0 
2513:     LD  3,-1(1)	Load return address 
2514:     LD  1,0(1)	Adjust fp 
2515:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,2515(7)	Jump to init [backpatch] 
* INIT
2516:     LD  0,0(0)	Set the global pointer 
2517:    LDA  1,-11(0)	set first frame at end of globals 
2518:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
2519:    LDC  3,9(6)	load size of array board
2520:     ST  3,0(0)	save size of array board
* END INIT GLOBALS AND STATICS
2521:    LDA  3,1(7)	Return address in ac 
2522:    LDA  7,-56(7)	Jump to main 
2523:   HALT  0,0,0	DONE! 
* END INIT
