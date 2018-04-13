* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  mastermind.c-
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
* FUNCTION rand
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
 43:     LD  3,-1(0)	Load variable n
 44:     ST  3,-2(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-2(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
 49:     LD  3,-1(0)	Load variable n
 50:    LDC  4,0(6)	Load 0 
 51:    SUB  3,4,3	Op unary - 
 52:     ST  3,-1(0)	Store variable n
 48:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 53:     LD  3,-1(0)	Load variable n
 54:     ST  3,-2(1)	Save left side 
 55:    LDC  3,128(6)	Load integer constant 
 56:     LD  4,-2(1)	Load left into ac1 
 57:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
 59:     LD  3,-1(0)	Load variable n
 60:     ST  3,-2(1)	Save left side 
 61:    LDC  3,128(6)	Load integer constant 
 62:     LD  4,-2(1)	Load left into ac1 
 63:    DIV  5,4,3	Op % 
 64:    MUL  5,5,3	 
 65:    SUB  3,4,5	 
 66:     ST  3,-1(0)	Store variable n
 58:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 67:     LD  3,-1(0)	load lhs variable n
 68:    LDA  3,1(3)	increment value of n
 69:     ST  3,-1(0)	Store variable n
* EXPRESSION
 70:     LD  3,-1(0)	Load variable n
 71:     ST  3,-2(1)	Save index 
 72:    LDC  3,1366(6)	Load integer constant 
 73:     ST  3,-3(1)	Save left side 
 74:    LDA  3,-3(0)	Load address of base of array r
 75:     ST  3,-4(1)	Save left side 
 76:     LD  3,-1(0)	Load variable n
 77:     ST  3,-5(1)	Save left side 
 78:    LDC  3,1(6)	Load integer constant 
 79:     LD  4,-5(1)	Load left into ac1 
 80:    SUB  3,4,3	Op - 
 81:     LD  4,-4(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     LD  4,-3(1)	Load left into ac1 
 85:    MUL  3,4,3	Op * 
 86:     ST  3,-3(1)	Save left side 
 87:    LDC  3,150889(6)	Load integer constant 
 88:     LD  4,-3(1)	Load left into ac1 
 89:    ADD  3,4,3	Op + 
 90:     ST  3,-3(1)	Save left side 
 91:    LDC  3,714025(6)	Load integer constant 
 92:     LD  4,-3(1)	Load left into ac1 
 93:    DIV  5,4,3	Op % 
 94:    MUL  5,5,3	 
 95:    SUB  3,4,5	 
 96:     LD  4,-2(1)	Restore index 
 97:    LDA  5,-3(0)	Load address of base of array r
 98:    SUB  5,5,4	Compute offset of value 
 99:     ST  3,0(5)	Store variable r
* RETURN
100:    LDA  3,-3(0)	Load address of base of array r
101:     ST  3,-2(1)	Save left side 
102:     LD  3,-1(0)	Load variable n
103:     LD  4,-2(1)	Load left into ac1 
104:    SUB  3,4,3	compute location from index 
105:     LD  3,0(3)	Load array element 
106:    LDA  2,0(3)	Copy result to rt register 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* END FUNCTION rand
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION search
114:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
115:    LDC  3,0(6)	Load integer constant 
116:     ST  3,-4(1)	Store variable i
* WHILE
117:     LD  3,-4(1)	Load variable i
118:     ST  3,-5(1)	Save left side 
119:    LDC  3,4(6)	Load integer constant 
120:     LD  4,-5(1)	Load left into ac1 
121:    TLT  3,4,3	Op < 
122:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
124:     LD  3,-2(1)	Load address of base of array a
125:     ST  3,-5(1)	Save left side 
126:     LD  3,-4(1)	Load variable i
127:     LD  4,-5(1)	Load left into ac1 
128:    SUB  3,4,3	compute location from index 
129:     LD  3,0(3)	Load array element 
130:     ST  3,-5(1)	Save left side 
131:     LD  3,-3(1)	Load variable k
132:     LD  4,-5(1)	Load left into ac1 
133:    TEQ  3,4,3	Op == 
* THEN
* RETURN
135:    LDC  3,1(6)	Load Boolean constant 
136:    LDA  2,0(3)	Copy result to rt register 
137:     LD  3,-1(1)	Load return address 
138:     LD  1,0(1)	Adjust fp 
139:    LDA  7,0(3)	Return 
134:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
140:     LD  3,-4(1)	load lhs variable i
141:    LDA  3,1(3)	increment value of i
142:     ST  3,-4(1)	Store variable i
* END COMPOUND
143:    LDA  7,-27(7)	go to beginning of loop 
123:    LDA  7,20(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
144:    LDC  3,0(6)	Load Boolean constant 
145:    LDA  2,0(3)	Copy result to rt register 
146:     LD  3,-1(1)	Load return address 
147:     LD  1,0(1)	Adjust fp 
148:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
149:    LDC  2,0(6)	Set return value to 0 
150:     LD  3,-1(1)	Load return address 
151:     LD  1,0(1)	Adjust fp 
152:    LDA  7,0(3)	Return 
* END FUNCTION search
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION check
153:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
154:    LDC  3,0(6)	Load integer constant 
155:     ST  3,-4(1)	Store variable c2
156:     ST  3,-3(1)	Store variable c1
157:     ST  3,-2(1)	Store variable i
* WHILE
158:     LD  3,-2(1)	Load variable i
159:     ST  3,-5(1)	Save left side 
160:    LDC  3,4(6)	Load integer constant 
161:     LD  4,-5(1)	Load left into ac1 
162:    TLT  3,4,3	Op < 
163:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
165:    LDA  3,-132(0)	Load address of base of array known
166:     ST  3,-5(1)	Save left side 
167:     LD  3,-2(1)	Load variable i
168:     LD  4,-5(1)	Load left into ac1 
169:    SUB  3,4,3	compute location from index 
170:     LD  3,0(3)	Load array element 
171:     ST  3,-5(1)	Save left side 
172:    LDA  3,-137(0)	Load address of base of array guess
173:     ST  3,-6(1)	Save left side 
174:     LD  3,-2(1)	Load variable i
175:     LD  4,-6(1)	Load left into ac1 
176:    SUB  3,4,3	compute location from index 
177:     LD  3,0(3)	Load array element 
178:     LD  4,-5(1)	Load left into ac1 
179:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
181:     LD  3,-4(1)	load lhs variable c2
182:    LDA  3,1(3)	increment value of c2
183:     ST  3,-4(1)	Store variable c2
180:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  search
185:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
186:    LDA  3,-132(0)	Load address of base of array known
187:     ST  3,-7(1)	Store parameter 
*                       Load param 2
188:    LDA  3,-137(0)	Load address of base of array guess
189:     ST  3,-8(1)	Save left side 
190:     LD  3,-2(1)	Load variable i
191:     LD  4,-8(1)	Load left into ac1 
192:    SUB  3,4,3	compute location from index 
193:     LD  3,0(3)	Load array element 
194:     ST  3,-8(1)	Store parameter 
*                       Jump to search
195:    LDA  1,-5(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-84(7)	CALL search
198:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
* THEN
* EXPRESSION
200:     LD  3,-3(1)	load lhs variable c1
201:    LDA  3,1(3)	increment value of c1
202:     ST  3,-3(1)	Store variable c1
199:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
184:    LDA  7,18(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
203:     LD  3,-2(1)	load lhs variable i
204:    LDA  3,1(3)	increment value of i
205:     ST  3,-2(1)	Store variable i
* END COMPOUND
206:    LDA  7,-49(7)	go to beginning of loop 
164:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
208:     LD  3,-3(1)	Load variable c1
209:     ST  3,-7(1)	Store parameter 
*                       Jump to output
210:    LDA  1,-5(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
214:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
215:     LD  3,-4(1)	Load variable c2
216:     ST  3,-7(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-5(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
221:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
222:    LDA  1,-5(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
226:     LD  3,-4(1)	Load variable c2
227:     ST  3,-5(1)	Save left side 
228:    LDC  3,4(6)	Load integer constant 
229:     LD  4,-5(1)	Load left into ac1 
230:    TEQ  3,4,3	Op == 
* THEN
* RETURN
232:    LDC  3,1(6)	Load Boolean constant 
233:    LDA  2,0(3)	Copy result to rt register 
234:     LD  3,-1(1)	Load return address 
235:     LD  1,0(1)	Adjust fp 
236:    LDA  7,0(3)	Return 
231:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
238:    LDC  3,0(6)	Load Boolean constant 
239:    LDA  2,0(3)	Copy result to rt register 
240:     LD  3,-1(1)	Load return address 
241:     LD  1,0(1)	Adjust fp 
242:    LDA  7,0(3)	Return 
237:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
243:    LDC  2,0(6)	Set return value to 0 
244:     LD  3,-1(1)	Load return address 
245:     LD  1,0(1)	Adjust fp 
246:    LDA  7,0(3)	Return 
* END FUNCTION check
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION turn
247:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
248:     LD  3,0(0)	load lhs variable turns
249:    LDA  3,1(3)	increment value of turns
250:     ST  3,0(0)	Store variable turns
* EXPRESSION
*                       Begin call to  output
251:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
252:     LD  3,0(0)	Load variable turns
253:     ST  3,-5(1)	Store parameter 
*                       Jump to output
254:    LDA  1,-3(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-251(7)	CALL output
257:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
258:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
259:    LDA  1,-3(1)	Load address of new frame 
260:    LDA  3,1(7)	Return address in ac 
261:    LDA  7,-225(7)	CALL outnl
262:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
263:     LD  3,0(0)	Load variable turns
264:     ST  3,-3(1)	Save left side 
265:    LDC  3,20(6)	Load integer constant 
266:     LD  4,-3(1)	Load left into ac1 
267:    TLE  3,4,3	Op <= 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
269:    LDC  3,0(6)	Load integer constant 
270:     ST  3,-2(1)	Store variable i
* WHILE
271:     LD  3,-2(1)	Load variable i
272:     ST  3,-3(1)	Save left side 
273:    LDC  3,4(6)	Load integer constant 
274:     LD  4,-3(1)	Load left into ac1 
275:    TLT  3,4,3	Op < 
276:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
278:     LD  3,-2(1)	Load variable i
279:     ST  3,-3(1)	Save index 
*                       Begin call to  input
280:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
281:    LDA  1,-4(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-283(7)	CALL input
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
285:     LD  4,-3(1)	Restore index 
286:    LDA  5,-137(0)	Load address of base of array guess
287:    SUB  5,5,4	Compute offset of value 
288:     ST  3,0(5)	Store variable guess
* IF
289:    LDA  3,-137(0)	Load address of base of array guess
290:     ST  3,-3(1)	Save left side 
291:     LD  3,-2(1)	Load variable i
292:     LD  4,-3(1)	Load left into ac1 
293:    SUB  3,4,3	compute location from index 
294:     LD  3,0(3)	Load array element 
295:     ST  3,-3(1)	Save left side 
296:    LDC  3,0(6)	Load integer constant 
297:     LD  4,-3(1)	Load left into ac1 
298:    TLT  3,4,3	Op < 
* THEN
* RETURN
300:    LDC  3,0(6)	Load Boolean constant 
301:    LDA  2,0(3)	Copy result to rt register 
302:     LD  3,-1(1)	Load return address 
303:     LD  1,0(1)	Adjust fp 
304:    LDA  7,0(3)	Return 
299:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
305:    LDA  3,-137(0)	Load address of base of array guess
306:     ST  3,-3(1)	Save left side 
307:     LD  3,-2(1)	Load variable i
308:     LD  4,-3(1)	Load left into ac1 
309:    SUB  3,4,3	compute location from index 
310:     LD  3,0(3)	Load array element 
311:     ST  3,-3(1)	Save left side 
312:    LDC  3,10(6)	Load integer constant 
313:     LD  4,-3(1)	Load left into ac1 
314:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
316:     LD  3,-2(1)	Load variable i
317:     ST  3,-3(1)	Save index 
318:    LDA  3,-137(0)	Load address of base of array guess
319:     ST  3,-4(1)	Save left side 
320:     LD  3,-2(1)	Load variable i
321:     LD  4,-4(1)	Load left into ac1 
322:    SUB  3,4,3	compute location from index 
323:     LD  3,0(3)	Load array element 
324:     ST  3,-4(1)	Save left side 
325:    LDC  3,10(6)	Load integer constant 
326:     LD  4,-4(1)	Load left into ac1 
327:    DIV  5,4,3	Op % 
328:    MUL  5,5,3	 
329:    SUB  3,4,5	 
330:     LD  4,-3(1)	Restore index 
331:    LDA  5,-137(0)	Load address of base of array guess
332:    SUB  5,5,4	Compute offset of value 
333:     ST  3,0(5)	Store variable guess
315:    JZR  3,18(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
334:     LD  3,-2(1)	load lhs variable i
335:    LDA  3,1(3)	increment value of i
336:     ST  3,-2(1)	Store variable i
* END COMPOUND
337:    LDA  7,-67(7)	go to beginning of loop 
277:    LDA  7,60(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
*                       Begin call to  check
338:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to check
339:    LDA  1,-3(1)	Load address of new frame 
340:    LDA  3,1(7)	Return address in ac 
341:    LDA  7,-189(7)	CALL check
342:    LDA  3,0(2)	Save the result in ac 
*                       End call to check
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
344:    LDC  3,0(6)	Load integer constant 
345:     ST  3,-2(1)	Store variable i
* WHILE
346:     LD  3,-2(1)	Load variable i
347:     ST  3,-3(1)	Save left side 
348:    LDC  3,10(6)	Load integer constant 
349:     LD  4,-3(1)	Load left into ac1 
350:    TLT  3,4,3	Op < 
351:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
353:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
354:    LDC  3,1(6)	Load Boolean constant 
355:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
356:    LDA  1,-3(1)	Load address of new frame 
357:    LDA  3,1(7)	Return address in ac 
358:    LDA  7,-341(7)	CALL outputb
359:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
360:     LD  3,-2(1)	load lhs variable i
361:    LDA  3,1(3)	increment value of i
362:     ST  3,-2(1)	Store variable i
* END COMPOUND
363:    LDA  7,-18(7)	go to beginning of loop 
352:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
364:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
365:    LDA  1,-3(1)	Load address of new frame 
366:    LDA  3,1(7)	Return address in ac 
367:    LDA  7,-331(7)	CALL outnl
368:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
369:    LDC  3,0(6)	Load Boolean constant 
370:    LDA  2,0(3)	Copy result to rt register 
371:     LD  3,-1(1)	Load return address 
372:     LD  1,0(1)	Adjust fp 
373:    LDA  7,0(3)	Return 
* END COMPOUND
343:    JZR  3,31(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* RETURN
375:    LDC  3,1(6)	Load Boolean constant 
376:    LDA  2,0(3)	Copy result to rt register 
377:     LD  3,-1(1)	Load return address 
378:     LD  1,0(1)	Adjust fp 
379:    LDA  7,0(3)	Return 
* END COMPOUND
374:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
268:    JZR  3,111(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
380:    LDC  3,0(6)	Load integer constant 
381:     ST  3,-2(1)	Store variable i
* WHILE
382:     LD  3,-2(1)	Load variable i
383:     ST  3,-3(1)	Save left side 
384:    LDC  3,10(6)	Load integer constant 
385:     LD  4,-3(1)	Load left into ac1 
386:    TLT  3,4,3	Op < 
387:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
389:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
390:    LDC  3,0(6)	Load Boolean constant 
391:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
392:    LDA  1,-3(1)	Load address of new frame 
393:    LDA  3,1(7)	Return address in ac 
394:    LDA  7,-377(7)	CALL outputb
395:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
396:     LD  3,-2(1)	load lhs variable i
397:    LDA  3,1(3)	increment value of i
398:     ST  3,-2(1)	Store variable i
* END COMPOUND
399:    LDA  7,-18(7)	go to beginning of loop 
388:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
400:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
401:    LDA  1,-3(1)	Load address of new frame 
402:    LDA  3,1(7)	Return address in ac 
403:    LDA  7,-367(7)	CALL outnl
404:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
405:    LDC  3,0(6)	Load Boolean constant 
406:    LDA  2,0(3)	Copy result to rt register 
407:     LD  3,-1(1)	Load return address 
408:     LD  1,0(1)	Adjust fp 
409:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
410:    LDC  2,0(6)	Set return value to 0 
411:     LD  3,-1(1)	Load return address 
412:     LD  1,0(1)	Adjust fp 
413:    LDA  7,0(3)	Return 
* END FUNCTION turn
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
414:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
415:    LDC  3,0(6)	Load integer constant 
416:     ST  3,-1(0)	Store variable n
* EXPRESSION
417:    LDC  3,0(6)	Load integer constant 
418:     ST  3,-3(1)	Save index 
*                       Begin call to  input
419:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
420:    LDA  1,-4(1)	Load address of new frame 
421:    LDA  3,1(7)	Return address in ac 
422:    LDA  7,-422(7)	CALL input
423:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
424:     LD  4,-3(1)	Restore index 
425:    LDA  5,-3(0)	Load address of base of array r
426:    SUB  5,5,4	Compute offset of value 
427:     ST  3,0(5)	Store variable r
* EXPRESSION
*                       Begin call to  outnl
428:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
429:    LDA  1,-3(1)	Load address of new frame 
430:    LDA  3,1(7)	Return address in ac 
431:    LDA  7,-395(7)	CALL outnl
432:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
433:    LDC  3,0(6)	Load integer constant 
434:     ST  3,-2(1)	Store variable i
* WHILE
435:     LD  3,-2(1)	Load variable i
436:     ST  3,-3(1)	Save left side 
437:    LDC  3,4(6)	Load integer constant 
438:     LD  4,-3(1)	Load left into ac1 
439:    TLT  3,4,3	Op < 
440:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
442:     LD  3,-2(1)	Load variable i
443:     ST  3,-3(1)	Save index 
*                       Begin call to  rand
444:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to rand
445:    LDA  1,-4(1)	Load address of new frame 
446:    LDA  3,1(7)	Return address in ac 
447:    LDA  7,-406(7)	CALL rand
448:    LDA  3,0(2)	Save the result in ac 
*                       End call to rand
449:     ST  3,-4(1)	Save left side 
450:    LDC  3,10(6)	Load integer constant 
451:     LD  4,-4(1)	Load left into ac1 
452:    DIV  5,4,3	Op % 
453:    MUL  5,5,3	 
454:    SUB  3,4,5	 
455:     LD  4,-3(1)	Restore index 
456:    LDA  5,-132(0)	Load address of base of array known
457:    SUB  5,5,4	Compute offset of value 
458:     ST  3,0(5)	Store variable known
* EXPRESSION
459:     LD  3,-2(1)	load lhs variable i
460:    LDA  3,1(3)	increment value of i
461:     ST  3,-2(1)	Store variable i
* END COMPOUND
462:    LDA  7,-28(7)	go to beginning of loop 
441:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
463:    LDC  3,0(6)	Load integer constant 
464:     ST  3,0(0)	Store variable turns
* WHILE
*                       Begin call to  turn
465:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to turn
466:    LDA  1,-3(1)	Load address of new frame 
467:    LDA  3,1(7)	Return address in ac 
468:    LDA  7,-222(7)	CALL turn
469:    LDA  3,0(2)	Save the result in ac 
*                       End call to turn
470:    JNZ  3,1(7)	Jump to while part 
* DO
472:    LDA  7,-8(7)	go to beginning of loop 
471:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
473:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
474:    LDA  1,-3(1)	Load address of new frame 
475:    LDA  3,1(7)	Return address in ac 
476:    LDA  7,-440(7)	CALL outnl
477:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
478:    LDC  3,0(6)	Load integer constant 
479:     ST  3,-2(1)	Store variable i
* WHILE
480:     LD  3,-2(1)	Load variable i
481:     ST  3,-3(1)	Save left side 
482:    LDC  3,4(6)	Load integer constant 
483:     LD  4,-3(1)	Load left into ac1 
484:    TLT  3,4,3	Op < 
485:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
487:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
488:    LDA  3,-132(0)	Load address of base of array known
489:     ST  3,-5(1)	Save left side 
490:     LD  3,-2(1)	Load variable i
491:     LD  4,-5(1)	Load left into ac1 
492:    SUB  3,4,3	compute location from index 
493:     LD  3,0(3)	Load array element 
494:     ST  3,-5(1)	Store parameter 
*                       Jump to output
495:    LDA  1,-3(1)	Load address of new frame 
496:    LDA  3,1(7)	Return address in ac 
497:    LDA  7,-492(7)	CALL output
498:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
499:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
500:    LDA  1,-3(1)	Load address of new frame 
501:    LDA  3,1(7)	Return address in ac 
502:    LDA  7,-466(7)	CALL outnl
503:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
504:     LD  3,-2(1)	load lhs variable i
505:    LDA  3,1(3)	increment value of i
506:     ST  3,-2(1)	Store variable i
* END COMPOUND
507:    LDA  7,-28(7)	go to beginning of loop 
486:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
508:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
509:    LDA  1,-3(1)	Load address of new frame 
510:    LDA  3,1(7)	Return address in ac 
511:    LDA  7,-475(7)	CALL outnl
512:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
513:    LDC  2,0(6)	Set return value to 0 
514:     LD  3,-1(1)	Load return address 
515:     LD  1,0(1)	Adjust fp 
516:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,516(7)	Jump to init [backpatch] 
* INIT
517:     LD  0,0(0)	Set the global pointer 
518:    LDA  1,-141(0)	set first frame at end of globals 
519:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
520:    LDC  3,4(6)	load size of array guess
521:     ST  3,-136(0)	save size of array guess
522:    LDC  3,4(6)	load size of array known
523:     ST  3,-131(0)	save size of array known
524:    LDC  3,128(6)	load size of array r
525:     ST  3,-2(0)	save size of array r
* END INIT GLOBALS AND STATICS
526:    LDA  3,1(7)	Return address in ac 
527:    LDA  7,-114(7)	Jump to main 
528:   HALT  0,0,0	DONE! 
* END INIT
