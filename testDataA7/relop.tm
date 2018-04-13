* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  relop.c-
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
* WHILE
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-8(1)	Save left side 
 45:     LD  3,-3(1)	Load variable y
 46:     LD  4,-8(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
 50:    LDA  7,-8(7)	go to beginning of loop 
 49:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 51:     LD  3,-2(1)	Load variable x
 52:     ST  3,-8(1)	Save left side 
 53:     LD  3,-3(1)	Load variable y
 54:     LD  4,-8(1)	Load left into ac1 
 55:    TGT  3,4,3	Op > 
 56:    JNZ  3,1(7)	Jump to while part 
* DO
 58:    LDA  7,-8(7)	go to beginning of loop 
 57:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 59:     LD  3,-2(1)	Load variable x
 60:     ST  3,-8(1)	Save left side 
 61:     LD  3,-3(1)	Load variable y
 62:     LD  4,-8(1)	Load left into ac1 
 63:    TLT  3,4,3	Op < 
 64:    LDC  4,1(6)	Load 1 
 65:    XOR  3,3,4	Op NOT 
 66:    JNZ  3,1(7)	Jump to while part 
* DO
 68:    LDA  7,-10(7)	go to beginning of loop 
 67:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 69:     LD  3,-2(1)	Load variable x
 70:     ST  3,-8(1)	Save left side 
 71:     LD  3,-3(1)	Load variable y
 72:     LD  4,-8(1)	Load left into ac1 
 73:    TGT  3,4,3	Op > 
 74:    JNZ  3,1(7)	Jump to while part 
* DO
 76:    LDA  7,-8(7)	go to beginning of loop 
 75:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-8(1)	Save left side 
 79:     LD  3,-3(1)	Load variable y
 80:     LD  4,-8(1)	Load left into ac1 
 81:    TEQ  3,4,3	Op == 
 82:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* END COMPOUND
 84:    LDA  7,-8(7)	go to beginning of loop 
 83:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 85:     LD  3,-2(1)	Load variable x
 86:     ST  3,-8(1)	Save left side 
 87:     LD  3,-3(1)	Load variable y
 88:     LD  4,-8(1)	Load left into ac1 
 89:    TLE  3,4,3	Op <= 
 90:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* END COMPOUND
 92:    LDA  7,-8(7)	go to beginning of loop 
 91:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
 93:     LD  3,-2(1)	Load variable x
 94:     ST  3,-8(1)	Save left side 
 95:     LD  3,-3(1)	Load variable y
 96:     LD  4,-8(1)	Load left into ac1 
 97:    TGE  3,4,3	Op >= 
 98:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
100:    LDC  3,4(6)	Load integer constant 
101:     ST  3,-9(1)	Store variable x
* END COMPOUND
102:    LDA  7,-10(7)	go to beginning of loop 
 99:    LDA  7,3(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
103:     LD  3,-2(1)	Load variable x
104:     ST  3,-8(1)	Save left side 
105:     LD  3,-3(1)	Load variable y
106:     LD  4,-8(1)	Load left into ac1 
107:    TNE  3,4,3	Op != 
108:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
110:     LD  3,-2(1)	Load variable x
111:     ST  3,-8(1)	Save left side 
112:     LD  3,-3(1)	Load variable y
113:     LD  4,-8(1)	Load left into ac1 
114:    TEQ  3,4,3	Op == 
115:    JNZ  3,1(7)	Jump to while part 
* DO
117:    LDA  7,-8(7)	go to beginning of loop 
116:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
118:    LDA  7,-16(7)	go to beginning of loop 
109:    LDA  7,9(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
119:     LD  3,-2(1)	Load variable x
120:     ST  3,-8(1)	Save left side 
121:     LD  3,-3(1)	Load variable y
122:     LD  4,-8(1)	Load left into ac1 
123:    TGT  3,4,3	Op > 
* THEN
124:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
125:     LD  3,-2(1)	Load variable x
126:     ST  3,-8(1)	Save left side 
127:     LD  3,-3(1)	Load variable y
128:     LD  4,-8(1)	Load left into ac1 
129:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* END COMPOUND
130:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
131:     LD  3,-2(1)	Load variable x
132:     ST  3,-8(1)	Save left side 
133:     LD  3,-3(1)	Load variable y
134:     LD  4,-8(1)	Load left into ac1 
135:    TLE  3,4,3	Op <= 
* THEN
* COMPOUND
* Compound Body
* END COMPOUND
136:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
137:     LD  3,-2(1)	Load variable x
138:     ST  3,-8(1)	Save left side 
139:     LD  3,-3(1)	Load variable y
140:     LD  4,-8(1)	Load left into ac1 
141:    TGE  3,4,3	Op >= 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
143:    LDC  3,4(6)	Load integer constant 
144:     ST  3,-11(1)	Store variable x
* END COMPOUND
142:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
145:     LD  3,-2(1)	Load variable x
146:     ST  3,-8(1)	Save left side 
147:     LD  3,-3(1)	Load variable y
148:     LD  4,-8(1)	Load left into ac1 
149:    TNE  3,4,3	Op != 
* THEN
* WHILE
151:     LD  3,-2(1)	Load variable x
152:     ST  3,-8(1)	Save left side 
153:     LD  3,-3(1)	Load variable y
154:     LD  4,-8(1)	Load left into ac1 
155:    TEQ  3,4,3	Op == 
156:    JNZ  3,1(7)	Jump to while part 
* DO
158:    LDA  7,-8(7)	go to beginning of loop 
157:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
150:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
159:     LD  3,-2(1)	Load variable x
160:     ST  3,-8(1)	Save left side 
161:     LD  3,-3(1)	Load variable y
162:     LD  4,-8(1)	Load left into ac1 
163:    TGT  3,4,3	Op > 
* THEN
164:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
165:     LD  3,-2(1)	Load variable x
166:     ST  3,-8(1)	Save left side 
167:     LD  3,-3(1)	Load variable y
168:     LD  4,-8(1)	Load left into ac1 
169:    TGT  3,4,3	Op > 
* THEN
170:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
171:     LD  3,-2(1)	Load variable x
172:     ST  3,-8(1)	Save left side 
173:     LD  3,-3(1)	Load variable y
174:     LD  4,-8(1)	Load left into ac1 
175:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* END COMPOUND
176:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* END COMPOUND
177:    LDA  7,0(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
178:     LD  3,-2(1)	Load variable x
179:     ST  3,-8(1)	Save left side 
180:     LD  3,-3(1)	Load variable y
181:     LD  4,-8(1)	Load left into ac1 
182:    TLT  3,4,3	Op < 
* THEN
* IF
184:     LD  3,-2(1)	Load variable x
185:     ST  3,-8(1)	Save left side 
186:     LD  3,-3(1)	Load variable y
187:     LD  4,-8(1)	Load left into ac1 
188:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
190:    LDC  3,2(6)	Load integer constant 
191:     ST  3,-2(1)	Store variable x
189:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
193:    LDC  3,3(6)	Load integer constant 
194:     ST  3,-2(1)	Store variable x
192:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
183:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
195:     LD  3,-2(1)	Load variable x
196:     ST  3,-8(1)	Save left side 
197:     LD  3,-3(1)	Load variable y
198:     LD  4,-8(1)	Load left into ac1 
199:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* IF
201:     LD  3,-2(1)	Load variable x
202:     ST  3,-12(1)	Save left side 
203:     LD  3,-3(1)	Load variable y
204:     LD  4,-12(1)	Load left into ac1 
205:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
207:    LDC  3,2(6)	Load integer constant 
208:     ST  3,-2(1)	Store variable x
206:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
200:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
210:    LDC  3,3(6)	Load integer constant 
211:     ST  3,-2(1)	Store variable x
209:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
212:     LD  3,-6(1)	Load variable b
* THEN
213:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
214:     LD  3,-6(1)	Load variable b
215:    LDC  4,1(6)	Load 1 
216:    XOR  3,3,4	Op NOT 
* THEN
217:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
218:     LD  3,-5(1)	Load variable a
219:     ST  3,-8(1)	Save left side 
220:     LD  3,-6(1)	Load variable b
221:     LD  4,-8(1)	Load left into ac1 
222:    AND  3,4,3	Op AND 
* THEN
223:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
224:     LD  3,-5(1)	Load variable a
225:     ST  3,-8(1)	Save left side 
226:     LD  3,-6(1)	Load variable b
227:     LD  4,-8(1)	Load left into ac1 
228:     OR  3,4,3	Op OR 
* THEN
229:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
230:     LD  3,-5(1)	Load variable a
231:     ST  3,-8(1)	Save left side 
232:     LD  3,-6(1)	Load variable b
233:     ST  3,-9(1)	Save left side 
234:     LD  3,-7(1)	Load variable c
235:     LD  4,-9(1)	Load left into ac1 
236:    AND  3,4,3	Op AND 
237:     LD  4,-8(1)	Load left into ac1 
238:     OR  3,4,3	Op OR 
* THEN
239:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
240:     LD  3,-5(1)	Load variable a
241:    LDC  4,1(6)	Load 1 
242:    XOR  3,3,4	Op NOT 
243:     ST  3,-8(1)	Save left side 
244:     LD  3,-6(1)	Load variable b
245:     LD  4,-8(1)	Load left into ac1 
246:     OR  3,4,3	Op OR 
* THEN
247:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
248:     LD  3,-2(1)	Load variable x
249:     ST  3,-8(1)	Save left side 
250:     LD  3,-3(1)	Load variable y
251:     LD  4,-8(1)	Load left into ac1 
252:    TGT  3,4,3	Op > 
253:     ST  3,-8(1)	Save left side 
254:     LD  3,-3(1)	Load variable y
255:     ST  3,-9(1)	Save left side 
256:     LD  3,-4(1)	Load variable z
257:     LD  4,-9(1)	Load left into ac1 
258:    TGT  3,4,3	Op > 
259:     LD  4,-8(1)	Load left into ac1 
260:    AND  3,4,3	Op AND 
* THEN
261:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
262:     LD  3,-2(1)	Load variable x
263:     ST  3,-8(1)	Save left side 
264:     LD  3,-3(1)	Load variable y
265:     LD  4,-8(1)	Load left into ac1 
266:    TGT  3,4,3	Op > 
267:     ST  3,-8(1)	Save left side 
268:     LD  3,-3(1)	Load variable y
269:     ST  3,-9(1)	Save left side 
270:     LD  3,-4(1)	Load variable z
271:     LD  4,-9(1)	Load left into ac1 
272:    TGT  3,4,3	Op > 
273:     LD  4,-8(1)	Load left into ac1 
274:     OR  3,4,3	Op OR 
* THEN
275:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
276:     LD  3,-2(1)	Load variable x
277:     ST  3,-8(1)	Save left side 
278:     LD  3,-3(1)	Load variable y
279:     LD  4,-8(1)	Load left into ac1 
280:    TGT  3,4,3	Op > 
281:     ST  3,-8(1)	Save left side 
282:     LD  3,-3(1)	Load variable y
283:     ST  3,-9(1)	Save left side 
284:     LD  3,-4(1)	Load variable z
285:     LD  4,-9(1)	Load left into ac1 
286:    TGT  3,4,3	Op > 
287:     LD  4,-8(1)	Load left into ac1 
288:    AND  3,4,3	Op AND 
289:     ST  3,-7(1)	Store variable c
* EXPRESSION
290:     LD  3,-2(1)	Load variable x
291:     ST  3,-8(1)	Save left side 
292:     LD  3,-3(1)	Load variable y
293:     LD  4,-8(1)	Load left into ac1 
294:    TGT  3,4,3	Op > 
295:     ST  3,-8(1)	Save left side 
296:     LD  3,-3(1)	Load variable y
297:     ST  3,-9(1)	Save left side 
298:     LD  3,-4(1)	Load variable z
299:     LD  4,-9(1)	Load left into ac1 
300:    TGT  3,4,3	Op > 
301:     LD  4,-8(1)	Load left into ac1 
302:     OR  3,4,3	Op OR 
303:     ST  3,-7(1)	Store variable c
* EXPRESSION
304:     LD  3,-2(1)	Load variable x
305:     ST  3,-8(1)	Save left side 
306:     LD  3,-3(1)	Load variable y
307:     LD  4,-8(1)	Load left into ac1 
308:    TGT  3,4,3	Op > 
309:    LDC  4,1(6)	Load 1 
310:    XOR  3,3,4	Op NOT 
311:     ST  3,-8(1)	Save left side 
312:     LD  3,-3(1)	Load variable y
313:     ST  3,-9(1)	Save left side 
314:     LD  3,-4(1)	Load variable z
315:     LD  4,-9(1)	Load left into ac1 
316:    TGT  3,4,3	Op > 
317:     LD  4,-8(1)	Load left into ac1 
318:    AND  3,4,3	Op AND 
319:     ST  3,-7(1)	Store variable c
* EXPRESSION
320:     LD  3,-2(1)	Load variable x
321:     ST  3,-8(1)	Save left side 
322:     LD  3,-3(1)	Load variable y
323:     LD  4,-8(1)	Load left into ac1 
324:    TGT  3,4,3	Op > 
325:    LDC  4,1(6)	Load 1 
326:    XOR  3,3,4	Op NOT 
327:     ST  3,-8(1)	Save left side 
328:     LD  3,-3(1)	Load variable y
329:     ST  3,-9(1)	Save left side 
330:     LD  3,-4(1)	Load variable z
331:     LD  4,-9(1)	Load left into ac1 
332:    TGT  3,4,3	Op > 
333:     LD  4,-8(1)	Load left into ac1 
334:     OR  3,4,3	Op OR 
335:     ST  3,-7(1)	Store variable c
* EXPRESSION
336:     LD  3,-3(1)	Load variable y
337:     ST  3,-8(1)	Save left side 
338:     LD  3,-2(1)	Load variable x
339:     LD  4,-8(1)	Load left into ac1 
340:    TEQ  3,4,3	Op == 
341:     ST  3,-8(1)	Save left side 
342:     LD  3,-2(1)	Load variable x
343:     ST  3,-9(1)	Save left side 
344:     LD  3,-3(1)	Load variable y
345:     LD  4,-9(1)	Load left into ac1 
346:    TGT  3,4,3	Op > 
347:     ST  3,-9(1)	Save left side 
348:     LD  3,-3(1)	Load variable y
349:     ST  3,-10(1)	Save left side 
350:     LD  3,-4(1)	Load variable z
351:     LD  4,-10(1)	Load left into ac1 
352:    TGT  3,4,3	Op > 
353:     LD  4,-9(1)	Load left into ac1 
354:    AND  3,4,3	Op AND 
355:     LD  4,-8(1)	Load left into ac1 
356:     OR  3,4,3	Op OR 
357:     ST  3,-7(1)	Store variable c
* IF
358:     LD  3,-6(1)	Load variable b
359:     ST  3,-8(1)	Save left side 
360:     LD  3,-2(1)	Load variable x
361:     ST  3,-9(1)	Save left side 
362:     LD  3,-3(1)	Load variable y
363:     LD  4,-9(1)	Load left into ac1 
364:    TGT  3,4,3	Op > 
365:     ST  3,-9(1)	Save left side 
366:     LD  3,-3(1)	Load variable y
367:     ST  3,-10(1)	Save left side 
368:     LD  3,-4(1)	Load variable z
369:     LD  4,-10(1)	Load left into ac1 
370:    TGT  3,4,3	Op > 
371:     LD  4,-9(1)	Load left into ac1 
372:    AND  3,4,3	Op AND 
373:     LD  4,-8(1)	Load left into ac1 
374:     OR  3,4,3	Op OR 
* THEN
375:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
376:    LDC  2,0(6)	Set return value to 0 
377:     LD  3,-1(1)	Load return address 
378:     LD  1,0(1)	Adjust fp 
379:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,379(7)	Jump to init [backpatch] 
* INIT
380:     LD  0,0(0)	Set the global pointer 
381:    LDA  1,0(0)	set first frame at end of globals 
382:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
383:    LDA  3,1(7)	Return address in ac 
384:    LDA  7,-343(7)	Jump to main 
385:   HALT  0,0,0	DONE! 
* END INIT
