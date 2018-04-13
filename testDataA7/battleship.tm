* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  battleship.c-
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
* FUNCTION Print
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable what
 45:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-3(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
* END FUNCTION Print
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION NewLine
 54:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-2(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 60:    LDC  2,0(6)	Set return value to 0 
 61:     LD  3,-1(1)	Load return address 
 62:     LD  1,0(1)	Adjust fp 
 63:    LDA  7,0(3)	Return 
* END FUNCTION NewLine
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Display
 64:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 65:    LDC  3,0(6)	Load integer constant 
 66:     ST  3,-4(1)	Store variable r
* EXPRESSION
*                       Begin call to  NewLine
 67:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
 68:    LDA  1,-6(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-17(7)	CALL NewLine
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  Print
 72:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-1(0)	Load variable NumShots
 74:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
 75:    LDA  1,-6(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-36(7)	CALL Print
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
* EXPRESSION
*                       Begin call to  NewLine
 79:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
 80:    LDA  1,-6(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-29(7)	CALL NewLine
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* WHILE
 84:     LD  3,-4(1)	Load variable r
 85:     ST  3,-6(1)	Save left side 
 86:     LD  3,-3(1)	Load variable dimension
 87:     LD  4,-6(1)	Load left into ac1 
 88:    TLT  3,4,3	Op < 
 89:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 91:    LDC  3,0(6)	Load integer constant 
 92:     ST  3,-5(1)	Store variable c
* WHILE
 93:     LD  3,-5(1)	Load variable c
 94:     ST  3,-6(1)	Save left side 
 95:     LD  3,-3(1)	Load variable dimension
 96:     LD  4,-6(1)	Load left into ac1 
 97:    TLT  3,4,3	Op < 
 98:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
100:     LD  3,-2(1)	Load address of base of array arr
101:     ST  3,-6(1)	Save left side 
102:     LD  3,-4(1)	Load variable r
103:     ST  3,-7(1)	Save left side 
104:    LDC  3,10(6)	Load integer constant 
105:     LD  4,-7(1)	Load left into ac1 
106:    MUL  3,4,3	Op * 
107:     ST  3,-7(1)	Save left side 
108:     LD  3,-5(1)	Load variable c
109:     LD  4,-7(1)	Load left into ac1 
110:    ADD  3,4,3	Op + 
111:     LD  4,-6(1)	Load left into ac1 
112:    SUB  3,4,3	compute location from index 
113:     LD  3,0(3)	Load array element 
114:     ST  3,-6(1)	Save left side 
115:    LDC  3,7(6)	Load integer constant 
116:     LD  4,-6(1)	Load left into ac1 
117:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  Print
119:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
120:    LDC  3,4(6)	Load integer constant 
121:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
122:    LDA  1,-6(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-83(7)	CALL Print
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
118:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
127:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
128:     LD  3,-2(1)	Load address of base of array arr
129:     ST  3,-8(1)	Save left side 
130:     LD  3,-4(1)	Load variable r
131:     ST  3,-9(1)	Save left side 
132:    LDC  3,10(6)	Load integer constant 
133:     LD  4,-9(1)	Load left into ac1 
134:    MUL  3,4,3	Op * 
135:     ST  3,-9(1)	Save left side 
136:     LD  3,-5(1)	Load variable c
137:     LD  4,-9(1)	Load left into ac1 
138:    ADD  3,4,3	Op + 
139:     LD  4,-8(1)	Load left into ac1 
140:    SUB  3,4,3	compute location from index 
141:     LD  3,0(3)	Load array element 
142:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
143:    LDA  1,-6(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-104(7)	CALL Print
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
126:    LDA  7,20(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
147:     LD  3,-5(1)	Load variable c
148:     ST  3,-6(1)	Save left side 
149:    LDC  3,1(6)	Load integer constant 
150:     LD  4,-6(1)	Load left into ac1 
151:    ADD  3,4,3	Op + 
152:     ST  3,-5(1)	Store variable c
* END COMPOUND
153:    LDA  7,-61(7)	go to beginning of loop 
 99:    LDA  7,54(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
154:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
155:    LDA  1,-6(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-104(7)	CALL NewLine
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
159:     LD  3,-4(1)	load lhs variable r
160:    LDA  3,1(3)	increment value of r
161:     ST  3,-4(1)	Store variable r
* END COMPOUND
162:    LDA  7,-79(7)	go to beginning of loop 
 90:    LDA  7,72(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
163:    LDC  2,0(6)	Set return value to 0 
164:     LD  3,-1(1)	Load return address 
165:     LD  1,0(1)	Adjust fp 
166:    LDA  7,0(3)	Return 
* END FUNCTION Display
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Randomize
167:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
168:     LD  3,-2(1)	Load variable seed
169:     ST  3,-4(1)	Save left side 
170:    LDC  3,2(6)	Load integer constant 
171:     LD  4,-4(1)	Load left into ac1 
172:    DIV  5,4,3	Op % 
173:    MUL  5,5,3	 
174:    SUB  3,4,5	 
175:     ST  3,-4(1)	Save left side 
176:    LDC  3,0(6)	Load integer constant 
177:     LD  4,-4(1)	Load left into ac1 
178:    TEQ  3,4,3	Op == 
179:     ST  3,-3(0)	Store variable iseven
* EXPRESSION
180:     LD  3,-3(1)	Load variable dim
181:     LD  4,-2(1)	load lhs variable seed
182:    ADD  3,4,3	op += 
183:     ST  3,-2(1)	Store variable seed
* EXPRESSION
184:    LDC  3,17(6)	Load integer constant 
185:     ST  3,-4(1)	Save left side 
186:     LD  3,-2(1)	Load variable seed
187:     LD  4,-4(1)	Load left into ac1 
188:    MUL  3,4,3	Op * 
189:     ST  3,-4(1)	Save left side 
190:    LDC  3,11(6)	Load integer constant 
191:     LD  4,-4(1)	Load left into ac1 
192:    ADD  3,4,3	Op + 
193:     ST  3,-2(1)	Store variable seed
* EXPRESSION
194:     LD  3,-2(1)	Load variable seed
195:     ST  3,-4(1)	Save left side 
196:     LD  3,-3(1)	Load variable dim
197:     ST  3,-5(1)	Save left side 
198:     LD  3,-3(1)	Load variable dim
199:     LD  4,-5(1)	Load left into ac1 
200:    MUL  3,4,3	Op * 
201:     LD  4,-4(1)	Load left into ac1 
202:    DIV  5,4,3	Op % 
203:    MUL  5,5,3	 
204:    SUB  3,4,5	 
205:     ST  3,-2(1)	Store variable seed
* RETURN
206:     LD  3,-2(1)	Load variable seed
207:    LDA  2,0(3)	Copy result to rt register 
208:     LD  3,-1(1)	Load return address 
209:     LD  1,0(1)	Adjust fp 
210:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
211:    LDC  2,0(6)	Set return value to 0 
212:     LD  3,-1(1)	Load return address 
213:     LD  1,0(1)	Adjust fp 
214:    LDA  7,0(3)	Return 
* END FUNCTION Randomize
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION HideShip
215:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  Randomize
216:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  input
217:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to input
218:    LDA  1,-10(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-220(7)	CALL input
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
222:     ST  3,-10(1)	Store parameter 
*                       Load param 2
223:     LD  3,-3(1)	Load variable dimen
224:     ST  3,-11(1)	Store parameter 
*                       Jump to Randomize
225:    LDA  1,-8(1)	Load address of new frame 
226:    LDA  3,1(7)	Return address in ac 
227:    LDA  7,-61(7)	CALL Randomize
228:    LDA  3,0(2)	Save the result in ac 
*                       End call to Randomize
229:     ST  3,-4(1)	Store variable pos
* EXPRESSION
230:     LD  3,-4(1)	Load variable pos
231:     ST  3,-8(1)	Save left side 
232:     LD  3,-3(1)	Load variable dimen
233:     LD  4,-8(1)	Load left into ac1 
234:    DIV  3,4,3	Op / 
235:     ST  3,-5(1)	Store variable row
* EXPRESSION
236:     LD  3,-4(1)	Load variable pos
237:     ST  3,-8(1)	Save left side 
238:     LD  3,-4(1)	Load variable pos
239:     ST  3,-9(1)	Save left side 
240:     LD  3,-3(1)	Load variable dimen
241:     LD  4,-9(1)	Load left into ac1 
242:    DIV  3,4,3	Op / 
243:     ST  3,-9(1)	Save left side 
244:     LD  3,-3(1)	Load variable dimen
245:     LD  4,-9(1)	Load left into ac1 
246:    MUL  3,4,3	Op * 
247:     LD  4,-8(1)	Load left into ac1 
248:    SUB  3,4,3	Op - 
249:     ST  3,-6(1)	Store variable col
* IF
250:     LD  3,-3(0)	Load variable iseven
* THEN
* COMPOUND
* Compound Body
* IF
252:     LD  3,-6(1)	Load variable col
253:     ST  3,-8(1)	Save left side 
254:     LD  3,-3(1)	Load variable dimen
255:     ST  3,-9(1)	Save left side 
256:     LD  3,0(0)	Load variable shipsize
257:     LD  4,-9(1)	Load left into ac1 
258:    SUB  3,4,3	Op - 
259:     LD  4,-8(1)	Load left into ac1 
260:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
262:     LD  3,-3(1)	Load variable dimen
263:     ST  3,-8(1)	Save left side 
264:     LD  3,0(0)	Load variable shipsize
265:     LD  4,-8(1)	Load left into ac1 
266:    SUB  3,4,3	Op - 
267:     ST  3,-6(1)	Store variable col
261:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
268:    LDC  3,0(6)	Load integer constant 
269:     ST  3,-7(1)	Store variable i
* WHILE
270:     LD  3,-7(1)	Load variable i
271:     ST  3,-8(1)	Save left side 
272:     LD  3,0(0)	Load variable shipsize
273:     LD  4,-8(1)	Load left into ac1 
274:    TLT  3,4,3	Op < 
275:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
277:     LD  3,-5(1)	Load variable row
278:     ST  3,-8(1)	Save left side 
279:     LD  3,-3(1)	Load variable dimen
280:     LD  4,-8(1)	Load left into ac1 
281:    MUL  3,4,3	Op * 
282:     ST  3,-8(1)	Save left side 
283:     LD  3,-6(1)	Load variable col
284:     LD  4,-8(1)	Load left into ac1 
285:    ADD  3,4,3	Op + 
286:     ST  3,-8(1)	Save index 
287:    LDC  3,7(6)	Load integer constant 
288:     LD  4,-8(1)	Restore index 
289:     LD  5,-2(1)	Load address of base of array arr
290:    SUB  5,5,4	Compute offset of value 
291:     ST  3,0(5)	Store variable arr
* EXPRESSION
292:     LD  3,-6(1)	load lhs variable col
293:    LDA  3,1(3)	increment value of col
294:     ST  3,-6(1)	Store variable col
* EXPRESSION
295:     LD  3,-7(1)	load lhs variable i
296:    LDA  3,1(3)	increment value of i
297:     ST  3,-7(1)	Store variable i
* END COMPOUND
298:    LDA  7,-29(7)	go to beginning of loop 
276:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
251:    JZR  3,48(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
300:     LD  3,-5(1)	Load variable row
301:     ST  3,-8(1)	Save left side 
302:     LD  3,-3(1)	Load variable dimen
303:     ST  3,-9(1)	Save left side 
304:     LD  3,0(0)	Load variable shipsize
305:     LD  4,-9(1)	Load left into ac1 
306:    SUB  3,4,3	Op - 
307:     LD  4,-8(1)	Load left into ac1 
308:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
310:     LD  3,-3(1)	Load variable dimen
311:     ST  3,-8(1)	Save left side 
312:     LD  3,0(0)	Load variable shipsize
313:     LD  4,-8(1)	Load left into ac1 
314:    SUB  3,4,3	Op - 
315:     ST  3,-5(1)	Store variable row
309:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
316:    LDC  3,0(6)	Load integer constant 
317:     ST  3,-7(1)	Store variable i
* WHILE
318:     LD  3,-7(1)	Load variable i
319:     ST  3,-8(1)	Save left side 
320:     LD  3,0(0)	Load variable shipsize
321:     LD  4,-8(1)	Load left into ac1 
322:    TLT  3,4,3	Op < 
323:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
325:     LD  3,-5(1)	Load variable row
326:     ST  3,-8(1)	Save left side 
327:     LD  3,-3(1)	Load variable dimen
328:     LD  4,-8(1)	Load left into ac1 
329:    MUL  3,4,3	Op * 
330:     ST  3,-8(1)	Save left side 
331:     LD  3,-6(1)	Load variable col
332:     LD  4,-8(1)	Load left into ac1 
333:    ADD  3,4,3	Op + 
334:     ST  3,-8(1)	Save index 
335:    LDC  3,7(6)	Load integer constant 
336:     LD  4,-8(1)	Restore index 
337:     LD  5,-2(1)	Load address of base of array arr
338:    SUB  5,5,4	Compute offset of value 
339:     ST  3,0(5)	Store variable arr
* EXPRESSION
340:     LD  3,-3(1)	Load variable dimen
341:     LD  4,-6(1)	load lhs variable col
342:    ADD  3,4,3	op += 
343:     ST  3,-6(1)	Store variable col
* EXPRESSION
344:     LD  3,-7(1)	load lhs variable i
345:    LDA  3,1(3)	increment value of i
346:     ST  3,-7(1)	Store variable i
* END COMPOUND
347:    LDA  7,-30(7)	go to beginning of loop 
324:    LDA  7,23(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
299:    LDA  7,48(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
348:    LDC  2,0(6)	Set return value to 0 
349:     LD  3,-1(1)	Load return address 
350:     LD  1,0(1)	Adjust fp 
351:    LDA  7,0(3)	Return 
* END FUNCTION HideShip
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Aim
352:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
353:    LDC  3,666(6)	Load integer constant 
354:    LDC  4,0(6)	Load 0 
355:    SUB  3,4,3	Op unary - 
356:     ST  3,-2(1)	Store variable shot
* WHILE
357:     LD  3,-2(1)	Load variable shot
358:     ST  3,-3(1)	Save left side 
359:    LDC  3,666(6)	Load integer constant 
360:    LDC  4,0(6)	Load 0 
361:    SUB  3,4,3	Op unary - 
362:     LD  4,-3(1)	Load left into ac1 
363:    TEQ  3,4,3	Op == 
364:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  input
366:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
367:    LDA  1,-3(1)	Load address of new frame 
368:    LDA  3,1(7)	Return address in ac 
369:    LDA  7,-369(7)	CALL input
370:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
371:     ST  3,-2(1)	Store variable shot
* IF
372:     LD  3,-2(1)	Load variable shot
373:     ST  3,-3(1)	Save left side 
374:    LDC  3,0(6)	Load integer constant 
375:     LD  4,-3(1)	Load left into ac1 
376:    TLT  3,4,3	Op < 
377:     ST  3,-3(1)	Save left side 
378:     LD  3,-2(1)	Load variable shot
379:     ST  3,-4(1)	Save left side 
380:    LDC  3,99(6)	Load integer constant 
381:     LD  4,-4(1)	Load left into ac1 
382:    TGT  3,4,3	Op > 
383:     LD  4,-3(1)	Load left into ac1 
384:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
386:    LDC  3,666(6)	Load integer constant 
387:    LDC  4,0(6)	Load 0 
388:    SUB  3,4,3	Op unary - 
389:     ST  3,-2(1)	Store variable shot
* EXPRESSION
*                       Begin call to  NewLine
390:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
391:    LDA  1,-3(1)	Load address of new frame 
392:    LDA  3,1(7)	Return address in ac 
393:    LDA  7,-340(7)	CALL NewLine
394:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  Print
395:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
396:     LD  3,-2(1)	Load variable shot
397:     ST  3,-5(1)	Store parameter 
*                       Jump to Print
398:    LDA  1,-3(1)	Load address of new frame 
399:    LDA  3,1(7)	Return address in ac 
400:    LDA  7,-359(7)	CALL Print
401:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
* EXPRESSION
*                       Begin call to  NewLine
402:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
403:    LDA  1,-3(1)	Load address of new frame 
404:    LDA  3,1(7)	Return address in ac 
405:    LDA  7,-352(7)	CALL NewLine
406:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* END COMPOUND
385:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
407:    LDA  7,-51(7)	go to beginning of loop 
365:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
408:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
409:    LDA  1,-3(1)	Load address of new frame 
410:    LDA  3,1(7)	Return address in ac 
411:    LDA  7,-358(7)	CALL NewLine
412:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* RETURN
413:     LD  3,-2(1)	Load variable shot
414:    LDA  2,0(3)	Copy result to rt register 
415:     LD  3,-1(1)	Load return address 
416:     LD  1,0(1)	Adjust fp 
417:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
418:    LDC  2,0(6)	Set return value to 0 
419:     LD  3,-1(1)	Load return address 
420:     LD  1,0(1)	Adjust fp 
421:    LDA  7,0(3)	Return 
* END FUNCTION Aim
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION RevealShip
422:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
423:    LDC  3,0(6)	Load integer constant 
424:     ST  3,-4(1)	Store variable r
* EXPRESSION
*                       Begin call to  NewLine
425:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
426:    LDA  1,-6(1)	Load address of new frame 
427:    LDA  3,1(7)	Return address in ac 
428:    LDA  7,-375(7)	CALL NewLine
429:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* WHILE
430:     LD  3,-4(1)	Load variable r
431:     ST  3,-6(1)	Save left side 
432:     LD  3,-3(1)	Load variable dimension
433:     LD  4,-6(1)	Load left into ac1 
434:    TLT  3,4,3	Op < 
435:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
437:    LDC  3,0(6)	Load integer constant 
438:     ST  3,-5(1)	Store variable c
* WHILE
439:     LD  3,-5(1)	Load variable c
440:     ST  3,-6(1)	Save left side 
441:     LD  3,-3(1)	Load variable dimension
442:     LD  4,-6(1)	Load left into ac1 
443:    TLT  3,4,3	Op < 
444:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
446:     LD  3,-2(1)	Load address of base of array arr
447:     ST  3,-6(1)	Save left side 
448:     LD  3,-4(1)	Load variable r
449:     ST  3,-7(1)	Save left side 
450:    LDC  3,10(6)	Load integer constant 
451:     LD  4,-7(1)	Load left into ac1 
452:    MUL  3,4,3	Op * 
453:     ST  3,-7(1)	Save left side 
454:     LD  3,-5(1)	Load variable c
455:     LD  4,-7(1)	Load left into ac1 
456:    ADD  3,4,3	Op + 
457:     LD  4,-6(1)	Load left into ac1 
458:    SUB  3,4,3	compute location from index 
459:     LD  3,0(3)	Load array element 
460:     ST  3,-6(1)	Save left side 
461:    LDC  3,4(6)	Load integer constant 
462:     LD  4,-6(1)	Load left into ac1 
463:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  Print
465:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
466:    LDC  3,2(6)	Load integer constant 
467:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
468:    LDA  1,-6(1)	Load address of new frame 
469:    LDA  3,1(7)	Return address in ac 
470:    LDA  7,-429(7)	CALL Print
471:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
464:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
473:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
474:     LD  3,-2(1)	Load address of base of array arr
475:     ST  3,-8(1)	Save left side 
476:     LD  3,-4(1)	Load variable r
477:     ST  3,-9(1)	Save left side 
478:    LDC  3,10(6)	Load integer constant 
479:     LD  4,-9(1)	Load left into ac1 
480:    MUL  3,4,3	Op * 
481:     ST  3,-9(1)	Save left side 
482:     LD  3,-5(1)	Load variable c
483:     LD  4,-9(1)	Load left into ac1 
484:    ADD  3,4,3	Op + 
485:     LD  4,-8(1)	Load left into ac1 
486:    SUB  3,4,3	compute location from index 
487:     LD  3,0(3)	Load array element 
488:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
489:    LDA  1,-6(1)	Load address of new frame 
490:    LDA  3,1(7)	Return address in ac 
491:    LDA  7,-450(7)	CALL Print
492:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
472:    LDA  7,20(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
493:     LD  3,-5(1)	Load variable c
494:     ST  3,-6(1)	Save left side 
495:    LDC  3,1(6)	Load integer constant 
496:     LD  4,-6(1)	Load left into ac1 
497:    ADD  3,4,3	Op + 
498:     ST  3,-5(1)	Store variable c
* END COMPOUND
499:    LDA  7,-61(7)	go to beginning of loop 
445:    LDA  7,54(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
500:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
501:    LDA  1,-6(1)	Load address of new frame 
502:    LDA  3,1(7)	Return address in ac 
503:    LDA  7,-450(7)	CALL NewLine
504:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
505:     LD  3,-4(1)	load lhs variable r
506:    LDA  3,1(3)	increment value of r
507:     ST  3,-4(1)	Store variable r
* END COMPOUND
508:    LDA  7,-79(7)	go to beginning of loop 
436:    LDA  7,72(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
509:    LDC  2,0(6)	Set return value to 0 
510:     LD  3,-1(1)	Load return address 
511:     LD  1,0(1)	Adjust fp 
512:    LDA  7,0(3)	Return 
* END FUNCTION RevealShip
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Fire
513:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
514:     LD  3,-2(1)	Load address of base of array arr
515:     ST  3,-4(1)	Save left side 
516:     LD  3,-3(1)	Load variable shot
517:     LD  4,-4(1)	Load left into ac1 
518:    SUB  3,4,3	compute location from index 
519:     LD  3,0(3)	Load array element 
520:     ST  3,-4(1)	Save left side 
521:    LDC  3,7(6)	Load integer constant 
522:     LD  4,-4(1)	Load left into ac1 
523:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
525:     LD  3,-3(1)	Load variable shot
526:     ST  3,-4(1)	Save index 
527:    LDC  3,1(6)	Load integer constant 
528:     LD  4,-4(1)	Restore index 
529:     LD  5,-2(1)	Load address of base of array arr
530:    SUB  5,5,4	Compute offset of value 
531:     ST  3,0(5)	Store variable arr
* EXPRESSION
532:     LD  3,-2(0)	load lhs variable NumHits
533:    LDA  3,1(3)	increment value of NumHits
534:     ST  3,-2(0)	Store variable NumHits
* IF
535:     LD  3,-1(0)	Load variable NumShots
536:     ST  3,-4(1)	Save left side 
537:    LDC  3,1(6)	Load integer constant 
538:     LD  4,-4(1)	Load left into ac1 
539:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
541:     LD  3,-1(0)	Load variable NumShots
542:     ST  3,-4(1)	Save left side 
543:    LDC  3,1(6)	Load integer constant 
544:     LD  4,-4(1)	Load left into ac1 
545:    ADD  3,4,3	Op + 
546:     ST  3,-1(0)	Store variable NumShots
540:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
524:    JZR  3,23(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
548:     LD  3,-3(1)	Load variable shot
549:     ST  3,-4(1)	Save index 
550:    LDC  3,0(6)	Load integer constant 
551:     LD  4,-4(1)	Restore index 
552:     LD  5,-2(1)	Load address of base of array arr
553:    SUB  5,5,4	Compute offset of value 
554:     ST  3,0(5)	Store variable arr
* END COMPOUND
547:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
555:     LD  3,-2(0)	Load variable NumHits
556:    LDA  2,0(3)	Copy result to rt register 
557:     LD  3,-1(1)	Load return address 
558:     LD  1,0(1)	Adjust fp 
559:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
560:    LDC  2,0(6)	Set return value to 0 
561:     LD  3,-1(1)	Load return address 
562:     LD  1,0(1)	Adjust fp 
563:    LDA  7,0(3)	Return 
* END FUNCTION Fire
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
564:     ST  3,-1(1)	Store return address. 
* COMPOUND
565:    LDC  3,100(6)	load size of array Ocean
566:     ST  3,-2(1)	save size of array Ocean
* Compound Body
* EXPRESSION
567:    LDC  3,4(6)	Load integer constant 
568:     ST  3,0(0)	Store variable shipsize
* EXPRESSION
569:    LDC  3,0(6)	Load integer constant 
570:     ST  3,-103(1)	Store variable i
* WHILE
571:     LD  3,-103(1)	Load variable i
572:     ST  3,-106(1)	Save left side 
573:    LDC  3,100(6)	Load integer constant 
574:     LD  4,-106(1)	Load left into ac1 
575:    TLT  3,4,3	Op < 
576:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
578:     LD  3,-103(1)	Load variable i
579:     ST  3,-106(1)	Save index 
580:    LDC  3,4(6)	Load integer constant 
581:     LD  4,-106(1)	Restore index 
582:    LDA  5,-3(1)	Load address of base of array Ocean
583:    SUB  5,5,4	Compute offset of value 
584:     ST  3,0(5)	Store variable Ocean
* EXPRESSION
585:     LD  3,-103(1)	load lhs variable i
586:    LDA  3,1(3)	increment value of i
587:     ST  3,-103(1)	Store variable i
* END COMPOUND
588:    LDA  7,-18(7)	go to beginning of loop 
577:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  HideShip
589:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
590:    LDA  3,-3(1)	Load address of base of array Ocean
591:     ST  3,-108(1)	Store parameter 
*                       Load param 2
592:    LDC  3,10(6)	Load integer constant 
593:     ST  3,-109(1)	Store parameter 
*                       Jump to HideShip
594:    LDA  1,-106(1)	Load address of new frame 
595:    LDA  3,1(7)	Return address in ac 
596:    LDA  7,-382(7)	CALL HideShip
597:    LDA  3,0(2)	Save the result in ac 
*                       End call to HideShip
* EXPRESSION
598:    LDC  3,0(6)	Load Boolean constant 
599:     ST  3,-105(1)	Store variable bGotit
* EXPRESSION
600:    LDC  3,10(6)	Load integer constant 
601:     ST  3,-1(0)	Store variable NumShots
* EXPRESSION
602:    LDC  3,0(6)	Load integer constant 
603:     ST  3,-2(0)	Store variable NumHits
* WHILE
604:     LD  3,-1(0)	Load variable NumShots
605:     ST  3,-106(1)	Save left side 
606:    LDC  3,0(6)	Load integer constant 
607:     LD  4,-106(1)	Load left into ac1 
608:    TGT  3,4,3	Op > 
609:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  Display
611:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
612:    LDA  3,-3(1)	Load address of base of array Ocean
613:     ST  3,-108(1)	Store parameter 
*                       Load param 2
614:    LDC  3,10(6)	Load integer constant 
615:     ST  3,-109(1)	Store parameter 
*                       Jump to Display
616:    LDA  1,-106(1)	Load address of new frame 
617:    LDA  3,1(7)	Return address in ac 
618:    LDA  7,-555(7)	CALL Display
619:    LDA  3,0(2)	Save the result in ac 
*                       End call to Display
* EXPRESSION
*                       Begin call to  Aim
620:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to Aim
621:    LDA  1,-106(1)	Load address of new frame 
622:    LDA  3,1(7)	Return address in ac 
623:    LDA  7,-272(7)	CALL Aim
624:    LDA  3,0(2)	Save the result in ac 
*                       End call to Aim
625:     ST  3,-104(1)	Store variable Shot
* IF
*                       Begin call to  Fire
626:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
627:    LDA  3,-3(1)	Load address of base of array Ocean
628:     ST  3,-108(1)	Store parameter 
*                       Load param 2
629:     LD  3,-104(1)	Load variable Shot
630:     ST  3,-109(1)	Store parameter 
*                       Jump to Fire
631:    LDA  1,-106(1)	Load address of new frame 
632:    LDA  3,1(7)	Return address in ac 
633:    LDA  7,-121(7)	CALL Fire
634:    LDA  3,0(2)	Save the result in ac 
*                       End call to Fire
635:     ST  3,-106(1)	Save left side 
636:     LD  3,0(0)	Load variable shipsize
637:     LD  4,-106(1)	Load left into ac1 
638:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
640:    LDC  3,1(6)	Load Boolean constant 
641:     ST  3,-105(1)	Store variable bGotit
* BREAK
642:    LDA  7,-33(7)	break 
* END COMPOUND
639:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
643:    LDC  3,1(6)	Load integer constant 
644:     LD  4,-1(0)	load lhs variable NumShots
645:    SUB  3,4,3	op -= 
646:     ST  3,-1(0)	Store variable NumShots
* END COMPOUND
647:    LDA  7,-44(7)	go to beginning of loop 
610:    LDA  7,37(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
648:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to NewLine
649:    LDA  1,-106(1)	Load address of new frame 
650:    LDA  3,1(7)	Return address in ac 
651:    LDA  7,-598(7)	CALL NewLine
652:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
653:    LDC  3,0(6)	Load integer constant 
654:     ST  3,-103(1)	Store variable i
* WHILE
655:     LD  3,-103(1)	Load variable i
656:     ST  3,-106(1)	Save left side 
657:    LDC  3,20(6)	Load integer constant 
658:     LD  4,-106(1)	Load left into ac1 
659:    TLT  3,4,3	Op < 
660:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
662:     LD  3,-105(1)	Load variable bGotit
* THEN
* EXPRESSION
*                       Begin call to  Print
664:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
665:    LDC  3,1(6)	Load integer constant 
666:     ST  3,-108(1)	Store parameter 
*                       Jump to Print
667:    LDA  1,-106(1)	Load address of new frame 
668:    LDA  3,1(7)	Return address in ac 
669:    LDA  7,-628(7)	CALL Print
670:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
663:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
672:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
673:    LDC  3,0(6)	Load integer constant 
674:     ST  3,-108(1)	Store parameter 
*                       Jump to Print
675:    LDA  1,-106(1)	Load address of new frame 
676:    LDA  3,1(7)	Return address in ac 
677:    LDA  7,-636(7)	CALL Print
678:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
671:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
679:     LD  3,-103(1)	load lhs variable i
680:    LDA  3,1(3)	increment value of i
681:     ST  3,-103(1)	Store variable i
* END COMPOUND
682:    LDA  7,-28(7)	go to beginning of loop 
661:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
683:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to NewLine
684:    LDA  1,-106(1)	Load address of new frame 
685:    LDA  3,1(7)	Return address in ac 
686:    LDA  7,-633(7)	CALL NewLine
687:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  RevealShip
688:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
689:    LDA  3,-3(1)	Load address of base of array Ocean
690:     ST  3,-108(1)	Store parameter 
*                       Load param 2
691:    LDC  3,10(6)	Load integer constant 
692:     ST  3,-109(1)	Store parameter 
*                       Jump to RevealShip
693:    LDA  1,-106(1)	Load address of new frame 
694:    LDA  3,1(7)	Return address in ac 
695:    LDA  7,-274(7)	CALL RevealShip
696:    LDA  3,0(2)	Save the result in ac 
*                       End call to RevealShip
* END COMPOUND
* Add standard closing in case there is no return statement
697:    LDC  2,0(6)	Set return value to 0 
698:     LD  3,-1(1)	Load return address 
699:     LD  1,0(1)	Adjust fp 
700:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,700(7)	Jump to init [backpatch] 
* INIT
701:     LD  0,0(0)	Set the global pointer 
702:    LDA  1,-4(0)	set first frame at end of globals 
703:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
704:    LDA  3,1(7)	Return address in ac 
705:    LDA  7,-142(7)	Jump to main 
706:   HALT  0,0,0	DONE! 
* END INIT
