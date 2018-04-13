* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  walsh.c-
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
* FUNCTION pow
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-5(1)	Store variable ans
* EXPRESSION
 45:     LD  3,-2(1)	Load variable n
 46:     ST  3,-4(1)	Store variable sqr
* WHILE
 47:    LDC  3,1(6)	Load Boolean constant 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
 50:     LD  3,-3(1)	Load variable p
 51:     ST  3,-6(1)	Save left side 
 52:    LDC  3,2(6)	Load integer constant 
 53:     LD  4,-6(1)	Load left into ac1 
 54:    DIV  5,4,3	Op % 
 55:    MUL  5,5,3	 
 56:    SUB  3,4,5	 
 57:     ST  3,-6(1)	Save left side 
 58:    LDC  3,1(6)	Load integer constant 
 59:     LD  4,-6(1)	Load left into ac1 
 60:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
 62:     LD  3,-5(1)	Load variable ans
 63:     ST  3,-6(1)	Save left side 
 64:     LD  3,-4(1)	Load variable sqr
 65:     LD  4,-6(1)	Load left into ac1 
 66:    MUL  3,4,3	Op * 
 67:     ST  3,-5(1)	Store variable ans
 61:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 68:     LD  3,-3(1)	Load variable p
 69:     ST  3,-6(1)	Save left side 
 70:    LDC  3,2(6)	Load integer constant 
 71:     LD  4,-6(1)	Load left into ac1 
 72:    DIV  3,4,3	Op / 
 73:     ST  3,-3(1)	Store variable p
* IF
 74:     LD  3,-3(1)	Load variable p
 75:     ST  3,-6(1)	Save left side 
 76:    LDC  3,0(6)	Load integer constant 
 77:     LD  4,-6(1)	Load left into ac1 
 78:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 80:     LD  3,-5(1)	Load variable ans
 81:    LDA  2,0(3)	Copy result to rt register 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    LDA  7,0(3)	Return 
 79:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 85:     LD  3,-4(1)	Load variable sqr
 86:     ST  3,-6(1)	Save left side 
 87:     LD  3,-4(1)	Load variable sqr
 88:     LD  4,-6(1)	Load left into ac1 
 89:    MUL  3,4,3	Op * 
 90:     ST  3,-4(1)	Store variable sqr
* END COMPOUND
 91:    LDA  7,-45(7)	go to beginning of loop 
 49:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    LDA  7,0(3)	Return 
* END FUNCTION pow
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getFunc
 96:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
*                       Begin call to  input
 97:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to input
 98:    LDA  1,-6(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-100(7)	CALL input
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
102:     ST  3,-3(1)	Store variable numbits
103:     ST  3,-6(1)	Save left side 
104:    LDC  3,0(6)	Load integer constant 
105:     LD  4,-6(1)	Load left into ac1 
106:    TEQ  3,4,3	Op == 
* THEN
* RETURN
108:    LDC  3,0(6)	Load integer constant 
109:    LDA  2,0(3)	Copy result to rt register 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
107:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  pow
113:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
114:    LDC  3,2(6)	Load integer constant 
115:     ST  3,-8(1)	Store parameter 
*                       Load param 2
116:     LD  3,-3(1)	Load variable numbits
117:     ST  3,-9(1)	Store parameter 
*                       Jump to pow
118:    LDA  1,-6(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-79(7)	CALL pow
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to pow
122:     ST  3,-5(1)	Store variable size
* EXPRESSION
123:    LDC  3,0(6)	Load integer constant 
124:     ST  3,-4(1)	Store variable i
* WHILE
125:     LD  3,-4(1)	Load variable i
126:     ST  3,-6(1)	Save left side 
127:     LD  3,-5(1)	Load variable size
128:     LD  4,-6(1)	Load left into ac1 
129:    TLT  3,4,3	Op < 
130:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
132:     LD  3,-4(1)	Load variable i
133:     ST  3,-6(1)	Save index 
*                       Begin call to  input
134:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to input
135:    LDA  1,-7(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-137(7)	CALL input
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
139:     LD  4,-6(1)	Restore index 
140:     LD  5,-2(1)	Load address of base of array f
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable f
* EXPRESSION
143:     LD  3,-4(1)	Load variable i
144:     ST  3,-6(1)	Save left side 
145:    LDC  3,1(6)	Load integer constant 
146:     LD  4,-6(1)	Load left into ac1 
147:    ADD  3,4,3	Op + 
148:     ST  3,-4(1)	Store variable i
* END COMPOUND
149:    LDA  7,-25(7)	go to beginning of loop 
131:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
150:     LD  3,-3(1)	Load variable numbits
151:    LDA  2,0(3)	Copy result to rt register 
152:     LD  3,-1(1)	Load return address 
153:     LD  1,0(1)	Adjust fp 
154:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
155:    LDC  2,0(6)	Set return value to 0 
156:     LD  3,-1(1)	Load return address 
157:     LD  1,0(1)	Adjust fp 
158:    LDA  7,0(3)	Return 
* END FUNCTION getFunc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION printFunc
159:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
160:    LDC  3,0(6)	Load integer constant 
161:     ST  3,-4(1)	Store variable i
* WHILE
162:     LD  3,-4(1)	Load variable i
163:     ST  3,-5(1)	Save left side 
164:     LD  3,-3(1)	Load variable size
165:     LD  4,-5(1)	Load left into ac1 
166:    TLT  3,4,3	Op < 
167:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
169:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
170:     LD  3,-2(1)	Load address of base of array f
171:     ST  3,-7(1)	Save left side 
172:     LD  3,-4(1)	Load variable i
173:     LD  4,-7(1)	Load left into ac1 
174:    SUB  3,4,3	compute location from index 
175:     LD  3,0(3)	Load array element 
176:     ST  3,-7(1)	Store parameter 
*                       Jump to output
177:    LDA  1,-5(1)	Load address of new frame 
178:    LDA  3,1(7)	Return address in ac 
179:    LDA  7,-174(7)	CALL output
180:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
181:     LD  3,-4(1)	Load variable i
182:     ST  3,-5(1)	Save left side 
183:    LDC  3,1(6)	Load integer constant 
184:     LD  4,-5(1)	Load left into ac1 
185:    ADD  3,4,3	Op + 
186:     ST  3,-4(1)	Store variable i
* END COMPOUND
187:    LDA  7,-26(7)	go to beginning of loop 
168:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
188:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
189:    LDA  1,-5(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-155(7)	CALL outnl
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
193:    LDC  2,0(6)	Set return value to 0 
194:     LD  3,-1(1)	Load return address 
195:     LD  1,0(1)	Adjust fp 
196:    LDA  7,0(3)	Return 
* END FUNCTION printFunc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fwt
197:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
198:     LD  3,-4(1)	Load variable size
199:     ST  3,-8(1)	Save left side 
200:    LDC  3,2(6)	Load integer constant 
201:     LD  4,-8(1)	Load left into ac1 
202:    DIV  3,4,3	Op / 
203:     ST  3,-4(1)	Store variable size
* IF
204:     LD  3,-4(1)	Load variable size
205:     ST  3,-8(1)	Save left side 
206:    LDC  3,1(6)	Load integer constant 
207:     LD  4,-8(1)	Load left into ac1 
208:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  fwt
210:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
211:     LD  3,-2(1)	Load address of base of array w
212:     ST  3,-10(1)	Store parameter 
*                       Load param 2
213:     LD  3,-3(1)	Load variable start
214:     ST  3,-11(1)	Store parameter 
*                       Load param 3
215:     LD  3,-4(1)	Load variable size
216:     ST  3,-12(1)	Store parameter 
*                       Jump to fwt
217:    LDA  1,-8(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-23(7)	CALL fwt
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  fwt
221:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
222:     LD  3,-2(1)	Load address of base of array w
223:     ST  3,-10(1)	Store parameter 
*                       Load param 2
224:     LD  3,-3(1)	Load variable start
225:     ST  3,-11(1)	Save left side 
226:     LD  3,-4(1)	Load variable size
227:     LD  4,-11(1)	Load left into ac1 
228:    ADD  3,4,3	Op + 
229:     ST  3,-11(1)	Store parameter 
*                       Load param 3
230:     LD  3,-4(1)	Load variable size
231:     ST  3,-12(1)	Store parameter 
*                       Jump to fwt
232:    LDA  1,-8(1)	Load address of new frame 
233:    LDA  3,1(7)	Return address in ac 
234:    LDA  7,-38(7)	CALL fwt
235:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* END COMPOUND
209:    JZR  3,26(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
236:     LD  3,-3(1)	Load variable start
237:     ST  3,-5(1)	Store variable a
* EXPRESSION
238:     LD  3,-3(1)	Load variable start
239:     ST  3,-8(1)	Save left side 
240:     LD  3,-4(1)	Load variable size
241:     LD  4,-8(1)	Load left into ac1 
242:    ADD  3,4,3	Op + 
243:     ST  3,-6(1)	Store variable b
* WHILE
244:     LD  3,-5(1)	Load variable a
245:     ST  3,-8(1)	Save left side 
246:     LD  3,-3(1)	Load variable start
247:     ST  3,-9(1)	Save left side 
248:     LD  3,-4(1)	Load variable size
249:     LD  4,-9(1)	Load left into ac1 
250:    ADD  3,4,3	Op + 
251:     LD  4,-8(1)	Load left into ac1 
252:    TLT  3,4,3	Op < 
253:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
255:     LD  3,-2(1)	Load address of base of array w
256:     ST  3,-8(1)	Save left side 
257:     LD  3,-5(1)	Load variable a
258:     LD  4,-8(1)	Load left into ac1 
259:    SUB  3,4,3	compute location from index 
260:     LD  3,0(3)	Load array element 
261:     ST  3,-7(1)	Store variable tmp
* EXPRESSION
262:     LD  3,-5(1)	Load variable a
263:     ST  3,-8(1)	Save index 
264:     LD  3,-2(1)	Load address of base of array w
265:     ST  3,-9(1)	Save left side 
266:     LD  3,-5(1)	Load variable a
267:     LD  4,-9(1)	Load left into ac1 
268:    SUB  3,4,3	compute location from index 
269:     LD  3,0(3)	Load array element 
270:     ST  3,-9(1)	Save left side 
271:     LD  3,-2(1)	Load address of base of array w
272:     ST  3,-10(1)	Save left side 
273:     LD  3,-6(1)	Load variable b
274:     LD  4,-10(1)	Load left into ac1 
275:    SUB  3,4,3	compute location from index 
276:     LD  3,0(3)	Load array element 
277:     LD  4,-9(1)	Load left into ac1 
278:    ADD  3,4,3	Op + 
279:     LD  4,-8(1)	Restore index 
280:     LD  5,-2(1)	Load address of base of array w
281:    SUB  5,5,4	Compute offset of value 
282:     ST  3,0(5)	Store variable w
* EXPRESSION
283:     LD  3,-6(1)	Load variable b
284:     ST  3,-8(1)	Save index 
285:     LD  3,-7(1)	Load variable tmp
286:     ST  3,-9(1)	Save left side 
287:     LD  3,-2(1)	Load address of base of array w
288:     ST  3,-10(1)	Save left side 
289:     LD  3,-6(1)	Load variable b
290:     LD  4,-10(1)	Load left into ac1 
291:    SUB  3,4,3	compute location from index 
292:     LD  3,0(3)	Load array element 
293:     LD  4,-9(1)	Load left into ac1 
294:    SUB  3,4,3	Op - 
295:     LD  4,-8(1)	Restore index 
296:     LD  5,-2(1)	Load address of base of array w
297:    SUB  5,5,4	Compute offset of value 
298:     ST  3,0(5)	Store variable w
* EXPRESSION
299:     LD  3,-5(1)	Load variable a
300:     ST  3,-8(1)	Save left side 
301:    LDC  3,1(6)	Load integer constant 
302:     LD  4,-8(1)	Load left into ac1 
303:    ADD  3,4,3	Op + 
304:     ST  3,-5(1)	Store variable a
* EXPRESSION
305:     LD  3,-6(1)	Load variable b
306:     ST  3,-8(1)	Save left side 
307:    LDC  3,1(6)	Load integer constant 
308:     LD  4,-8(1)	Load left into ac1 
309:    ADD  3,4,3	Op + 
310:     ST  3,-6(1)	Store variable b
* END COMPOUND
311:    LDA  7,-68(7)	go to beginning of loop 
254:    LDA  7,57(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
312:    LDC  2,0(6)	Set return value to 0 
313:     LD  3,-1(1)	Load return address 
314:     LD  1,0(1)	Adjust fp 
315:    LDA  7,0(3)	Return 
* END FUNCTION fwt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION div
316:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
317:    LDC  3,0(6)	Load integer constant 
318:     ST  3,-4(1)	Store variable i
* WHILE
319:     LD  3,-4(1)	Load variable i
320:     ST  3,-5(1)	Save left side 
321:     LD  3,-3(1)	Load variable size
322:     LD  4,-5(1)	Load left into ac1 
323:    TLT  3,4,3	Op < 
324:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
326:     LD  3,-4(1)	Load variable i
327:     ST  3,-5(1)	Save index 
328:     LD  3,-2(1)	Load address of base of array f
329:     ST  3,-6(1)	Save left side 
330:     LD  3,-4(1)	Load variable i
331:     LD  4,-6(1)	Load left into ac1 
332:    SUB  3,4,3	compute location from index 
333:     LD  3,0(3)	Load array element 
334:     ST  3,-6(1)	Save left side 
335:     LD  3,-3(1)	Load variable size
336:     LD  4,-6(1)	Load left into ac1 
337:    DIV  3,4,3	Op / 
338:     LD  4,-5(1)	Restore index 
339:     LD  5,-2(1)	Load address of base of array f
340:    SUB  5,5,4	Compute offset of value 
341:     ST  3,0(5)	Store variable f
* EXPRESSION
342:     LD  3,-4(1)	load lhs variable i
343:    LDA  3,1(3)	increment value of i
344:     ST  3,-4(1)	Store variable i
* END COMPOUND
345:    LDA  7,-27(7)	go to beginning of loop 
325:    LDA  7,20(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
346:    LDC  2,0(6)	Set return value to 0 
347:     LD  3,-1(1)	Load return address 
348:     LD  1,0(1)	Adjust fp 
349:    LDA  7,0(3)	Return 
* END FUNCTION div
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
350:     ST  3,-1(1)	Store return address. 
* COMPOUND
351:    LDC  3,256(6)	load size of array f
352:     ST  3,-2(1)	save size of array f
* Compound Body
* WHILE
353:    LDC  3,1(6)	Load Boolean constant 
354:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
*                       Begin call to  getFunc
356:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
357:    LDA  3,-3(1)	Load address of base of array f
358:     ST  3,-265(1)	Store parameter 
*                       Jump to getFunc
359:    LDA  1,-263(1)	Load address of new frame 
360:    LDA  3,1(7)	Return address in ac 
361:    LDA  7,-266(7)	CALL getFunc
362:    LDA  3,0(2)	Save the result in ac 
*                       End call to getFunc
363:     ST  3,-261(1)	Store variable numbits
364:     ST  3,-263(1)	Save left side 
365:    LDC  3,0(6)	Load integer constant 
366:     LD  4,-263(1)	Load left into ac1 
367:    TEQ  3,4,3	Op == 
* THEN
* RETURN
369:    LDC  3,0(6)	Load integer constant 
370:    LDA  2,0(3)	Copy result to rt register 
371:     LD  3,-1(1)	Load return address 
372:     LD  1,0(1)	Adjust fp 
373:    LDA  7,0(3)	Return 
368:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  pow
374:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
375:    LDC  3,2(6)	Load integer constant 
376:     ST  3,-265(1)	Store parameter 
*                       Load param 2
377:     LD  3,-261(1)	Load variable numbits
378:     ST  3,-266(1)	Store parameter 
*                       Jump to pow
379:    LDA  1,-263(1)	Load address of new frame 
380:    LDA  3,1(7)	Return address in ac 
381:    LDA  7,-340(7)	CALL pow
382:    LDA  3,0(2)	Save the result in ac 
*                       End call to pow
383:     ST  3,-260(1)	Store variable size
* EXPRESSION
384:     LD  3,-260(1)	Load variable size
385:     ST  3,-263(1)	Save left side 
386:    LDC  3,2(6)	Load integer constant 
387:     LD  4,-263(1)	Load left into ac1 
388:    DIV  3,4,3	Op / 
389:     ST  3,-262(1)	Store variable half
* EXPRESSION
*                       Begin call to  fwt
390:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
391:    LDA  3,-3(1)	Load address of base of array f
392:     ST  3,-265(1)	Store parameter 
*                       Load param 2
393:    LDC  3,0(6)	Load integer constant 
394:     ST  3,-266(1)	Store parameter 
*                       Load param 3
395:     LD  3,-260(1)	Load variable size
396:     ST  3,-267(1)	Store parameter 
*                       Jump to fwt
397:    LDA  1,-263(1)	Load address of new frame 
398:    LDA  3,1(7)	Return address in ac 
399:    LDA  7,-203(7)	CALL fwt
400:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  printFunc
401:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
402:    LDA  3,-3(1)	Load address of base of array f
403:     ST  3,-265(1)	Store parameter 
*                       Load param 2
404:     LD  3,-260(1)	Load variable size
405:     ST  3,-266(1)	Store parameter 
*                       Jump to printFunc
406:    LDA  1,-263(1)	Load address of new frame 
407:    LDA  3,1(7)	Return address in ac 
408:    LDA  7,-250(7)	CALL printFunc
409:    LDA  3,0(2)	Save the result in ac 
*                       End call to printFunc
* EXPRESSION
*                       Begin call to  fwt
410:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
411:    LDA  3,-3(1)	Load address of base of array f
412:     ST  3,-265(1)	Store parameter 
*                       Load param 2
413:    LDC  3,0(6)	Load integer constant 
414:     ST  3,-266(1)	Store parameter 
*                       Load param 3
415:     LD  3,-260(1)	Load variable size
416:     ST  3,-267(1)	Store parameter 
*                       Jump to fwt
417:    LDA  1,-263(1)	Load address of new frame 
418:    LDA  3,1(7)	Return address in ac 
419:    LDA  7,-223(7)	CALL fwt
420:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  div
421:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
422:    LDA  3,-3(1)	Load address of base of array f
423:     ST  3,-265(1)	Store parameter 
*                       Load param 2
424:     LD  3,-260(1)	Load variable size
425:     ST  3,-266(1)	Store parameter 
*                       Jump to div
426:    LDA  1,-263(1)	Load address of new frame 
427:    LDA  3,1(7)	Return address in ac 
428:    LDA  7,-113(7)	CALL div
429:    LDA  3,0(2)	Save the result in ac 
*                       End call to div
* EXPRESSION
*                       Begin call to  printFunc
430:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
431:    LDA  3,-3(1)	Load address of base of array f
432:     ST  3,-265(1)	Store parameter 
*                       Load param 2
433:     LD  3,-260(1)	Load variable size
434:     ST  3,-266(1)	Store parameter 
*                       Jump to printFunc
435:    LDA  1,-263(1)	Load address of new frame 
436:    LDA  3,1(7)	Return address in ac 
437:    LDA  7,-279(7)	CALL printFunc
438:    LDA  3,0(2)	Save the result in ac 
*                       End call to printFunc
* END COMPOUND
439:    LDA  7,-87(7)	go to beginning of loop 
355:    LDA  7,84(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
440:    LDC  3,0(6)	Load integer constant 
441:    LDA  2,0(3)	Copy result to rt register 
442:     LD  3,-1(1)	Load return address 
443:     LD  1,0(1)	Adjust fp 
444:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
445:    LDC  2,0(6)	Set return value to 0 
446:     LD  3,-1(1)	Load return address 
447:     LD  1,0(1)	Adjust fp 
448:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,448(7)	Jump to init [backpatch] 
* INIT
449:     LD  0,0(0)	Set the global pointer 
450:    LDA  1,0(0)	set first frame at end of globals 
451:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
452:    LDA  3,1(7)	Return address in ac 
453:    LDA  7,-104(7)	Jump to main 
454:   HALT  0,0,0	DONE! 
* END INIT
