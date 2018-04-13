* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  miller.c-
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
* FUNCTION showIntArray
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-4(1)	Store variable i
* WHILE
 45:     LD  3,-4(1)	Load variable i
 46:     ST  3,-5(1)	Save left side 
 47:     LD  3,-3(1)	Load variable size
 48:     LD  4,-5(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-2(1)	Load address of base of array x
 54:     ST  3,-7(1)	Save left side 
 55:     LD  3,-4(1)	Load variable i
 56:     LD  4,-7(1)	Load left into ac1 
 57:    SUB  3,4,3	compute location from index 
 58:     LD  3,0(3)	Load array element 
 59:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-5(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 64:     LD  3,-4(1)	Load variable i
 65:     ST  3,-5(1)	Save left side 
 66:    LDC  3,1(6)	Load integer constant 
 67:     LD  4,-5(1)	Load left into ac1 
 68:    ADD  3,4,3	Op + 
 69:     ST  3,-4(1)	Store variable i
* END COMPOUND
 70:    LDA  7,-26(7)	go to beginning of loop 
 51:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 71:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 72:    LDA  1,-5(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-38(7)	CALL outnl
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END FUNCTION showIntArray
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 80:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 81:     LD  3,-2(1)	Load variable a
 82:     ST  3,-2(1)	Store variable a
* EXPRESSION
 83:    LDC  3,7(6)	Load integer constant 
 84:     ST  3,-4(1)	Save index 
 85:     LD  3,-3(1)	Load address of base of array b
 86:     ST  3,-5(1)	Save left side 
 87:    LDC  3,9(6)	Load integer constant 
 88:     LD  4,-5(1)	Load left into ac1 
 89:    SUB  3,4,3	compute location from index 
 90:     LD  3,0(3)	Load array element 
 91:     LD  4,-4(1)	Restore index 
 92:     LD  5,-3(1)	Load address of base of array b
 93:    SUB  5,5,4	Compute offset of value 
 94:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-2(1)	Load variable a
 97:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-4(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-4(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
107:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
108:     LD  3,-3(1)	Load address of base of array b
109:     ST  3,-6(1)	Save left side 
110:    LDC  3,7(6)	Load integer constant 
111:     LD  4,-6(1)	Load left into ac1 
112:    SUB  3,4,3	compute location from index 
113:     LD  3,0(3)	Load array element 
114:     ST  3,-6(1)	Store parameter 
*                       Jump to output
115:    LDA  1,-4(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-112(7)	CALL output
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
119:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
120:    LDA  1,-4(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-86(7)	CALL outnl
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
124:    LDC  2,0(6)	Set return value to 0 
125:     LD  3,-1(1)	Load return address 
126:     LD  1,0(1)	Adjust fp 
127:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getnxtindex
128:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
129:     LD  3,-2(1)	Load variable x
130:     ST  3,-3(1)	Save left side 
131:    LDC  3,1(6)	Load integer constant 
132:     LD  4,-3(1)	Load left into ac1 
133:    ADD  3,4,3	Op + 
134:    LDA  2,0(3)	Copy result to rt register 
135:     LD  3,-1(1)	Load return address 
136:     LD  1,0(1)	Adjust fp 
137:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
138:    LDC  2,0(6)	Set return value to 0 
139:     LD  3,-1(1)	Load return address 
140:     LD  1,0(1)	Adjust fp 
141:    LDA  7,0(3)	Return 
* END FUNCTION getnxtindex
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
142:     ST  3,-1(1)	Store return address. 
* COMPOUND
143:    LDC  3,10(6)	load size of array c
144:     ST  3,-3(1)	save size of array c
145:    LDC  3,10(6)	load size of array d
146:     ST  3,-14(1)	save size of array d
147:    LDC  3,10(6)	load size of array y
148:     ST  3,-25(1)	save size of array y
149:    LDC  3,10(6)	load size of array z
150:     ST  3,-36(1)	save size of array z
151:    LDC  3,10(6)	load size of array w
152:     ST  3,-47(1)	save size of array w
* Compound Body
* EXPRESSION
153:    LDC  3,0(6)	Load integer constant 
154:     ST  3,-58(1)	Save index 
155:    LDC  3,3(6)	Load integer constant 
156:     LD  4,-58(1)	Restore index 
157:    LDA  5,-4(1)	Load address of base of array c
158:    SUB  5,5,4	Compute offset of value 
159:     ST  3,0(5)	Store variable c
* EXPRESSION
160:    LDC  3,3(6)	Load integer constant 
161:     ST  3,-58(1)	Save index 
162:    LDC  3,5(6)	Load integer constant 
163:     LD  4,-58(1)	Restore index 
164:    LDA  5,-15(1)	Load address of base of array d
165:    SUB  5,5,4	Compute offset of value 
166:     ST  3,0(5)	Store variable d
* EXPRESSION
167:    LDC  3,4(6)	Load integer constant 
168:     ST  3,-58(1)	Save index 
169:    LDC  3,9(6)	Load integer constant 
170:     LD  4,-58(1)	Restore index 
171:    LDA  5,-15(1)	Load address of base of array d
172:    SUB  5,5,4	Compute offset of value 
173:     ST  3,0(5)	Store variable d
* EXPRESSION
174:    LDC  3,5(6)	Load integer constant 
175:     ST  3,-58(1)	Save index 
176:    LDC  3,100(6)	Load integer constant 
177:     LD  4,-58(1)	Restore index 
178:    LDA  5,-26(1)	Load address of base of array y
179:    SUB  5,5,4	Compute offset of value 
180:     ST  3,0(5)	Store variable y
* EXPRESSION
181:    LDC  3,9(6)	Load integer constant 
182:     ST  3,-58(1)	Save index 
183:    LDC  3,50(6)	Load integer constant 
184:     LD  4,-58(1)	Restore index 
185:    LDA  5,-48(1)	Load address of base of array w
186:    SUB  5,5,4	Compute offset of value 
187:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  dog
188:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
189:    LDA  3,-26(1)	Load address of base of array y
190:     ST  3,-60(1)	Save left side 
191:    LDC  3,5(6)	Load integer constant 
192:     LD  4,-60(1)	Load left into ac1 
193:    SUB  3,4,3	compute location from index 
194:     LD  3,0(3)	Load array element 
195:     ST  3,-60(1)	Store parameter 
*                       Load param 2
196:    LDA  3,-48(1)	Load address of base of array w
197:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
198:    LDA  1,-58(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-121(7)	CALL dog
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
202:    LDC  3,9(6)	Load integer constant 
203:     ST  3,-58(1)	Save index 
204:    LDC  3,12(6)	Load integer constant 
205:     LD  4,-58(1)	Restore index 
206:    LDA  5,-48(1)	Load address of base of array w
207:    SUB  5,5,4	Compute offset of value 
208:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  dog
209:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
210:    LDA  3,-26(1)	Load address of base of array y
211:     ST  3,-60(1)	Save left side 
212:    LDA  3,-15(1)	Load address of base of array d
213:     ST  3,-61(1)	Save left side 
214:    LDC  3,3(6)	Load integer constant 
215:     LD  4,-61(1)	Load left into ac1 
216:    SUB  3,4,3	compute location from index 
217:     LD  3,0(3)	Load array element 
218:     LD  4,-60(1)	Load left into ac1 
219:    SUB  3,4,3	compute location from index 
220:     LD  3,0(3)	Load array element 
221:     ST  3,-60(1)	Store parameter 
*                       Load param 2
222:    LDA  3,-48(1)	Load address of base of array w
223:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
224:    LDA  1,-58(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-147(7)	CALL dog
227:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
228:    LDC  3,8(6)	Load integer constant 
229:     ST  3,-58(1)	Save index 
230:    LDC  3,4(6)	Load integer constant 
231:     LD  4,-58(1)	Restore index 
232:    LDA  5,-4(1)	Load address of base of array c
233:    SUB  5,5,4	Compute offset of value 
234:     ST  3,0(5)	Store variable c
* EXPRESSION
235:    LDC  3,9(6)	Load integer constant 
236:     ST  3,-58(1)	Save index 
237:    LDC  3,25(6)	Load integer constant 
238:     LD  4,-58(1)	Restore index 
239:    LDA  5,-4(1)	Load address of base of array c
240:    SUB  5,5,4	Compute offset of value 
241:     ST  3,0(5)	Store variable c
* EXPRESSION
242:    LDC  3,9(6)	Load integer constant 
243:     ST  3,-58(1)	Save index 
244:    LDC  3,66(6)	Load integer constant 
245:     LD  4,-58(1)	Restore index 
246:    LDA  5,-26(1)	Load address of base of array y
247:    SUB  5,5,4	Compute offset of value 
248:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
249:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
250:    LDA  3,-26(1)	Load address of base of array y
251:     ST  3,-60(1)	Save left side 
252:    LDA  3,-15(1)	Load address of base of array d
253:     ST  3,-61(1)	Save left side 
254:    LDA  3,-4(1)	Load address of base of array c
255:     ST  3,-62(1)	Save left side 
256:    LDC  3,8(6)	Load integer constant 
257:     LD  4,-62(1)	Load left into ac1 
258:    SUB  3,4,3	compute location from index 
259:     LD  3,0(3)	Load array element 
260:     LD  4,-61(1)	Load left into ac1 
261:    SUB  3,4,3	compute location from index 
262:     LD  3,0(3)	Load array element 
263:     LD  4,-60(1)	Load left into ac1 
264:    SUB  3,4,3	compute location from index 
265:     LD  3,0(3)	Load array element 
266:     ST  3,-60(1)	Store parameter 
*                       Load param 2
267:    LDA  3,-4(1)	Load address of base of array c
268:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
269:    LDA  1,-58(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-192(7)	CALL dog
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
273:    LDC  3,777(6)	Load integer constant 
274:     ST  3,-2(1)	Store variable x
* EXPRESSION
275:    LDC  3,7(6)	Load integer constant 
276:     ST  3,-58(1)	Save index 
277:    LDC  3,123(6)	Load integer constant 
278:     LD  4,-58(1)	Restore index 
279:    LDA  5,-26(1)	Load address of base of array y
280:    SUB  5,5,4	Compute offset of value 
281:     ST  3,0(5)	Store variable y
* EXPRESSION
282:    LDC  3,9(6)	Load integer constant 
283:     ST  3,-58(1)	Save index 
284:    LDA  3,-26(1)	Load address of base of array y
285:     ST  3,-59(1)	Save left side 
286:    LDC  3,7(6)	Load integer constant 
287:     LD  4,-59(1)	Load left into ac1 
288:    SUB  3,4,3	compute location from index 
289:     LD  3,0(3)	Load array element 
290:     LD  4,-58(1)	Restore index 
291:    LDA  5,-26(1)	Load address of base of array y
292:    SUB  5,5,4	Compute offset of value 
293:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
294:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
295:     LD  3,-2(1)	Load variable x
296:     ST  3,-60(1)	Store parameter 
*                       Load param 2
297:    LDA  3,-26(1)	Load address of base of array y
298:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
299:    LDA  1,-58(1)	Load address of new frame 
300:    LDA  3,1(7)	Return address in ac 
301:    LDA  7,-222(7)	CALL dog
302:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
303:     LD  3,-2(1)	Load variable x
304:     ST  3,-2(1)	Store variable x
* EXPRESSION
305:    LDC  3,9(6)	Load integer constant 
306:     ST  3,-58(1)	Save index 
307:     LD  3,-2(1)	Load variable x
308:     LD  4,-58(1)	Restore index 
309:    LDA  5,-4(1)	Load address of base of array c
310:    SUB  5,5,4	Compute offset of value 
311:     ST  3,0(5)	Store variable c
* EXPRESSION
312:    LDC  3,888(6)	Load integer constant 
313:     ST  3,-11(0)	Store variable glx
* EXPRESSION
314:    LDC  3,7(6)	Load integer constant 
315:     ST  3,-58(1)	Save index 
316:     LD  3,-11(0)	Load variable glx
317:     LD  4,-58(1)	Restore index 
318:    LDA  5,-26(1)	Load address of base of array y
319:    SUB  5,5,4	Compute offset of value 
320:     ST  3,0(5)	Store variable y
* EXPRESSION
321:    LDC  3,6(6)	Load integer constant 
322:     ST  3,-58(1)	Save index 
323:    LDC  3,2(6)	Load integer constant 
324:     LD  4,-58(1)	Restore index 
325:    LDA  5,-15(1)	Load address of base of array d
326:    SUB  5,5,4	Compute offset of value 
327:     ST  3,0(5)	Store variable d
* EXPRESSION
328:    LDC  3,2(6)	Load integer constant 
329:     ST  3,-58(1)	Save index 
330:    LDC  3,4(6)	Load integer constant 
331:     LD  4,-58(1)	Restore index 
332:    LDA  5,-4(1)	Load address of base of array c
333:    SUB  5,5,4	Compute offset of value 
334:     ST  3,0(5)	Store variable c
* EXPRESSION
335:    LDC  3,4(6)	Load integer constant 
336:     ST  3,-58(1)	Save index 
337:    LDC  3,7(6)	Load integer constant 
338:     LD  4,-58(1)	Restore index 
339:    LDA  5,-15(1)	Load address of base of array d
340:    SUB  5,5,4	Compute offset of value 
341:     ST  3,0(5)	Store variable d
* EXPRESSION
342:    LDC  3,2(6)	Load integer constant 
343:     ST  3,-58(1)	Save index 
344:    LDA  3,-26(1)	Load address of base of array y
345:     ST  3,-59(1)	Save left side 
346:    LDA  3,-15(1)	Load address of base of array d
347:     ST  3,-60(1)	Save left side 
348:    LDA  3,-4(1)	Load address of base of array c
349:     ST  3,-61(1)	Save left side 
350:    LDA  3,-15(1)	Load address of base of array d
351:     ST  3,-62(1)	Save left side 
352:    LDC  3,6(6)	Load integer constant 
353:     LD  4,-62(1)	Load left into ac1 
354:    SUB  3,4,3	compute location from index 
355:     LD  3,0(3)	Load array element 
356:     LD  4,-61(1)	Load left into ac1 
357:    SUB  3,4,3	compute location from index 
358:     LD  3,0(3)	Load array element 
359:     LD  4,-60(1)	Load left into ac1 
360:    SUB  3,4,3	compute location from index 
361:     LD  3,0(3)	Load array element 
362:     LD  4,-59(1)	Load left into ac1 
363:    SUB  3,4,3	compute location from index 
364:     LD  3,0(3)	Load array element 
365:     LD  4,-58(1)	Restore index 
366:    LDA  5,-15(1)	Load address of base of array d
367:    SUB  5,5,4	Compute offset of value 
368:     ST  3,0(5)	Store variable d
* EXPRESSION
*                       Begin call to  dog
369:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
370:    LDA  3,-26(1)	Load address of base of array y
371:     ST  3,-60(1)	Save left side 
372:    LDA  3,-15(1)	Load address of base of array d
373:     ST  3,-61(1)	Save left side 
374:    LDA  3,-4(1)	Load address of base of array c
375:     ST  3,-62(1)	Save left side 
376:    LDC  3,8(6)	Load integer constant 
377:     LD  4,-62(1)	Load left into ac1 
378:    SUB  3,4,3	compute location from index 
379:     LD  3,0(3)	Load array element 
380:     LD  4,-61(1)	Load left into ac1 
381:    SUB  3,4,3	compute location from index 
382:     LD  3,0(3)	Load array element 
383:     LD  4,-60(1)	Load left into ac1 
384:    SUB  3,4,3	compute location from index 
385:     LD  3,0(3)	Load array element 
386:     ST  3,-60(1)	Store parameter 
*                       Load param 2
387:    LDA  3,-4(1)	Load address of base of array c
388:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
389:    LDA  1,-58(1)	Load address of new frame 
390:    LDA  3,1(7)	Return address in ac 
391:    LDA  7,-312(7)	CALL dog
392:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
393:    LDC  3,2(6)	Load integer constant 
394:     ST  3,-58(1)	Save index 
395:    LDA  3,-4(1)	Load address of base of array c
396:     ST  3,-59(1)	Save left side 
397:    LDC  3,3(6)	Load integer constant 
398:     LD  4,-59(1)	Load left into ac1 
399:    SUB  3,4,3	compute location from index 
400:     LD  3,0(3)	Load array element 
401:     LD  4,-58(1)	Restore index 
402:    LDA  5,-15(1)	Load address of base of array d
403:    SUB  5,5,4	Compute offset of value 
404:     ST  3,0(5)	Store variable d
* EXPRESSION
405:    LDC  3,7(6)	Load integer constant 
406:     ST  3,-58(1)	Save index 
407:    LDA  3,-26(1)	Load address of base of array y
408:     ST  3,-59(1)	Save left side 
409:    LDC  3,9(6)	Load integer constant 
410:     LD  4,-59(1)	Load left into ac1 
411:    SUB  3,4,3	compute location from index 
412:     LD  3,0(3)	Load array element 
413:     LD  4,-58(1)	Restore index 
414:    LDA  5,-26(1)	Load address of base of array y
415:    SUB  5,5,4	Compute offset of value 
416:     ST  3,0(5)	Store variable y
* EXPRESSION
417:    LDC  3,2(6)	Load integer constant 
418:     ST  3,-58(1)	Save index 
419:    LDC  3,3(6)	Load integer constant 
420:     LD  4,-58(1)	Restore index 
421:    LDA  5,-1(0)	Load address of base of array gl
422:    SUB  5,5,4	Compute offset of value 
423:     ST  3,0(5)	Store variable gl
* EXPRESSION
424:    LDA  3,-1(0)	Load address of base of array gl
425:     ST  3,-58(1)	Save left side 
426:    LDC  3,2(6)	Load integer constant 
427:     LD  4,-58(1)	Load left into ac1 
428:    SUB  3,4,3	compute location from index 
429:     LD  3,0(3)	Load array element 
430:     ST  3,-2(1)	Store variable x
* EXPRESSION
431:    LDC  3,7(6)	Load integer constant 
432:     ST  3,-58(1)	Save index 
433:    LDA  3,-1(0)	Load address of base of array gl
434:     ST  3,-59(1)	Save left side 
435:    LDC  3,9(6)	Load integer constant 
436:     LD  4,-59(1)	Load left into ac1 
437:    SUB  3,4,3	compute location from index 
438:     LD  3,0(3)	Load array element 
439:     LD  4,-58(1)	Restore index 
440:    LDA  5,-26(1)	Load address of base of array y
441:    SUB  5,5,4	Compute offset of value 
442:     ST  3,0(5)	Store variable y
* EXPRESSION
443:    LDC  3,7(6)	Load integer constant 
444:     ST  3,-58(1)	Save index 
445:    LDA  3,-26(1)	Load address of base of array y
446:     ST  3,-59(1)	Save left side 
447:    LDC  3,9(6)	Load integer constant 
448:     LD  4,-59(1)	Load left into ac1 
449:    SUB  3,4,3	compute location from index 
450:     LD  3,0(3)	Load array element 
451:     LD  4,-58(1)	Restore index 
452:    LDA  5,-1(0)	Load address of base of array gl
453:    SUB  5,5,4	Compute offset of value 
454:     ST  3,0(5)	Store variable gl
* EXPRESSION
455:    LDC  3,0(6)	Load integer constant 
456:     ST  3,-58(1)	Save index 
457:    LDC  3,5(6)	Load integer constant 
458:     LD  4,-58(1)	Restore index 
459:    LDA  5,-26(1)	Load address of base of array y
460:    SUB  5,5,4	Compute offset of value 
461:     ST  3,0(5)	Store variable y
* EXPRESSION
462:    LDC  3,5(6)	Load integer constant 
463:     ST  3,-58(1)	Save index 
464:    LDC  3,3(6)	Load integer constant 
465:     LD  4,-58(1)	Restore index 
466:    LDA  5,-15(1)	Load address of base of array d
467:    SUB  5,5,4	Compute offset of value 
468:     ST  3,0(5)	Store variable d
* EXPRESSION
469:    LDC  3,8(6)	Load integer constant 
470:     ST  3,-58(1)	Save index 
471:    LDA  3,-15(1)	Load address of base of array d
472:     ST  3,-59(1)	Save left side 
473:    LDA  3,-26(1)	Load address of base of array y
474:     ST  3,-60(1)	Save left side 
475:    LDC  3,0(6)	Load integer constant 
476:     LD  4,-60(1)	Load left into ac1 
477:    SUB  3,4,3	compute location from index 
478:     LD  3,0(3)	Load array element 
479:     LD  4,-59(1)	Load left into ac1 
480:    SUB  3,4,3	compute location from index 
481:     LD  3,0(3)	Load array element 
482:     LD  4,-58(1)	Restore index 
483:    LDA  5,-4(1)	Load address of base of array c
484:    SUB  5,5,4	Compute offset of value 
485:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  output
486:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
487:    LDA  3,-4(1)	Load address of base of array c
488:     ST  3,-60(1)	Save left side 
489:    LDC  3,8(6)	Load integer constant 
490:     LD  4,-60(1)	Load left into ac1 
491:    SUB  3,4,3	compute location from index 
492:     LD  3,0(3)	Load array element 
493:     ST  3,-60(1)	Store parameter 
*                       Jump to output
494:    LDA  1,-58(1)	Load address of new frame 
495:    LDA  3,1(7)	Return address in ac 
496:    LDA  7,-491(7)	CALL output
497:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
498:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Jump to outnl
499:    LDA  1,-58(1)	Load address of new frame 
500:    LDA  3,1(7)	Return address in ac 
501:    LDA  7,-465(7)	CALL outnl
502:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
503:    LDC  3,3(6)	Load integer constant 
504:     ST  3,-58(1)	Save index 
505:    LDC  3,4(6)	Load integer constant 
506:     LD  4,-58(1)	Restore index 
507:    LDA  5,-15(1)	Load address of base of array d
508:    SUB  5,5,4	Compute offset of value 
509:     ST  3,0(5)	Store variable d
* EXPRESSION
510:    LDC  3,4(6)	Load integer constant 
511:     ST  3,-58(1)	Save index 
512:    LDC  3,987(6)	Load integer constant 
513:     LD  4,-58(1)	Restore index 
514:    LDA  5,-26(1)	Load address of base of array y
515:    SUB  5,5,4	Compute offset of value 
516:     ST  3,0(5)	Store variable y
* EXPRESSION
517:    LDC  3,9(6)	Load integer constant 
518:     ST  3,-58(1)	Save index 
519:    LDC  3,3(6)	Load integer constant 
520:     LD  4,-58(1)	Restore index 
521:    LDA  5,-4(1)	Load address of base of array c
522:    SUB  5,5,4	Compute offset of value 
523:     LD  4,0(5)	load lhs variable c
524:    SUB  3,4,3	op -= 
525:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  dog
526:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
527:    LDA  3,-26(1)	Load address of base of array y
528:     ST  3,-60(1)	Save left side 
529:    LDA  3,-15(1)	Load address of base of array d
530:     ST  3,-61(1)	Save left side 
531:    LDA  3,-4(1)	Load address of base of array c
532:     ST  3,-62(1)	Save left side 
533:    LDC  3,8(6)	Load integer constant 
534:     LD  4,-62(1)	Load left into ac1 
535:    SUB  3,4,3	compute location from index 
536:     LD  3,0(3)	Load array element 
537:     LD  4,-61(1)	Load left into ac1 
538:    SUB  3,4,3	compute location from index 
539:     LD  3,0(3)	Load array element 
540:     LD  4,-60(1)	Load left into ac1 
541:    SUB  3,4,3	compute location from index 
542:     LD  3,0(3)	Load array element 
543:     ST  3,-60(1)	Store parameter 
*                       Load param 2
544:    LDA  3,-4(1)	Load address of base of array c
545:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
546:    LDA  1,-58(1)	Load address of new frame 
547:    LDA  3,1(7)	Return address in ac 
548:    LDA  7,-469(7)	CALL dog
549:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
550:    LDA  3,-4(1)	Load address of base of array c
551:     ST  3,-58(1)	Save left side 
552:    LDC  3,9(6)	Load integer constant 
553:     LD  4,-58(1)	Load left into ac1 
554:    SUB  3,4,3	compute location from index 
555:     LD  3,0(3)	Load array element 
556:     LD  4,-2(1)	load lhs variable x
557:    ADD  3,4,3	op += 
558:     ST  3,-2(1)	Store variable x
* EXPRESSION
559:    LDA  3,-4(1)	Load address of base of array c
560:     ST  3,-58(1)	Save left side 
561:    LDC  3,9(6)	Load integer constant 
562:     LD  4,-58(1)	Load left into ac1 
563:    SUB  3,4,3	compute location from index 
564:     LD  3,0(3)	Load array element 
565:     LD  4,-2(1)	load lhs variable x
566:    SUB  3,4,3	op -= 
567:     ST  3,-2(1)	Store variable x
* EXPRESSION
568:    LDC  3,8(6)	Load integer constant 
569:     ST  3,-58(1)	Save index 
570:    LDC  3,8(6)	Load integer constant 
571:     LD  4,-58(1)	Restore index 
572:    LDA  5,-26(1)	Load address of base of array y
573:    SUB  5,5,4	Compute offset of value 
574:     ST  3,0(5)	Store variable y
* EXPRESSION
575:    LDC  3,9(6)	Load integer constant 
576:     ST  3,-58(1)	Save index 
577:    LDA  3,-26(1)	Load address of base of array y
578:     ST  3,-59(1)	Save left side 
*                       Begin call to  getnxtindex
579:     ST  1,-60(1)	Store old fp in ghost frame 
*                       Load param 1
580:    LDC  3,7(6)	Load integer constant 
581:     ST  3,-62(1)	Store parameter 
*                       Jump to getnxtindex
582:    LDA  1,-60(1)	Load address of new frame 
583:    LDA  3,1(7)	Return address in ac 
584:    LDA  7,-457(7)	CALL getnxtindex
585:    LDA  3,0(2)	Save the result in ac 
*                       End call to getnxtindex
586:     LD  4,-59(1)	Load left into ac1 
587:    SUB  3,4,3	compute location from index 
588:     LD  3,0(3)	Load array element 
589:     ST  3,-59(1)	Save left side 
590:    LDC  3,1(6)	Load integer constant 
591:     LD  4,-59(1)	Load left into ac1 
592:    ADD  3,4,3	Op + 
593:     LD  4,-58(1)	Restore index 
594:    LDA  5,-26(1)	Load address of base of array y
595:    SUB  5,5,4	Compute offset of value 
596:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
597:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
598:    LDA  3,-26(1)	Load address of base of array y
599:     ST  3,-60(1)	Save left side 
600:    LDC  3,4(6)	Load integer constant 
601:     LD  4,-60(1)	Load left into ac1 
602:    SUB  3,4,3	compute location from index 
603:     LD  3,0(3)	Load array element 
604:     ST  3,-60(1)	Store parameter 
*                       Load param 2
605:    LDA  3,-26(1)	Load address of base of array y
606:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
607:    LDA  1,-58(1)	Load address of new frame 
608:    LDA  3,1(7)	Return address in ac 
609:    LDA  7,-530(7)	CALL dog
610:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
611:    LDC  3,5(6)	Load integer constant 
612:     ST  3,-58(1)	Save index 
613:    LDC  3,0(6)	Load integer constant 
614:     LD  4,-58(1)	Restore index 
615:    LDA  5,-4(1)	Load address of base of array c
616:    SUB  5,5,4	Compute offset of value 
617:     ST  3,0(5)	Store variable c
* EXPRESSION
618:    LDC  3,0(6)	Load integer constant 
619:     ST  3,-58(1)	Save index 
620:    LDC  3,3(6)	Load integer constant 
621:     LD  4,-58(1)	Restore index 
622:    LDA  5,-48(1)	Load address of base of array w
623:    SUB  5,5,4	Compute offset of value 
624:     ST  3,0(5)	Store variable w
* EXPRESSION
625:    LDC  3,3(6)	Load integer constant 
626:     ST  3,-58(1)	Save index 
627:    LDC  3,9(6)	Load integer constant 
628:     LD  4,-58(1)	Restore index 
629:    LDA  5,-37(1)	Load address of base of array z
630:    SUB  5,5,4	Compute offset of value 
631:     ST  3,0(5)	Store variable z
* EXPRESSION
632:    LDC  3,9(6)	Load integer constant 
633:     ST  3,-58(1)	Save index 
634:    LDC  3,1(6)	Load integer constant 
635:     LD  4,-58(1)	Restore index 
636:    LDA  5,-26(1)	Load address of base of array y
637:    SUB  5,5,4	Compute offset of value 
638:     ST  3,0(5)	Store variable y
* EXPRESSION
639:    LDA  3,-26(1)	Load address of base of array y
640:     ST  3,-58(1)	Save left side 
641:    LDA  3,-37(1)	Load address of base of array z
642:     ST  3,-59(1)	Save left side 
643:    LDA  3,-48(1)	Load address of base of array w
644:     ST  3,-60(1)	Save left side 
645:    LDA  3,-4(1)	Load address of base of array c
646:     ST  3,-61(1)	Save left side 
647:    LDC  3,5(6)	Load integer constant 
648:     LD  4,-61(1)	Load left into ac1 
649:    SUB  3,4,3	compute location from index 
650:     LD  3,0(3)	Load array element 
651:     LD  4,-60(1)	Load left into ac1 
652:    SUB  3,4,3	compute location from index 
653:     LD  3,0(3)	Load array element 
654:     LD  4,-59(1)	Load left into ac1 
655:    SUB  3,4,3	compute location from index 
656:     LD  3,0(3)	Load array element 
657:     LD  4,-58(1)	Load left into ac1 
658:    SUB  3,4,3	compute location from index 
659:     LD  3,0(3)	Load array element 
660:     ST  3,-58(1)	Save index 
661:    LDC  3,77(6)	Load integer constant 
662:     LD  4,-58(1)	Restore index 
663:    LDA  5,-15(1)	Load address of base of array d
664:    SUB  5,5,4	Compute offset of value 
665:     ST  3,0(5)	Store variable d
* EXPRESSION
666:    LDC  3,9(6)	Load integer constant 
667:     ST  3,-58(1)	Save index 
668:    LDA  3,-15(1)	Load address of base of array d
669:     ST  3,-59(1)	Save left side 
670:    LDC  3,1(6)	Load integer constant 
671:     LD  4,-59(1)	Load left into ac1 
672:    SUB  3,4,3	compute location from index 
673:     LD  3,0(3)	Load array element 
674:     LD  4,-58(1)	Restore index 
675:    LDA  5,-4(1)	Load address of base of array c
676:    SUB  5,5,4	Compute offset of value 
677:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  dog
678:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
679:    LDC  3,66(6)	Load integer constant 
680:     ST  3,-60(1)	Store parameter 
*                       Load param 2
681:    LDA  3,-4(1)	Load address of base of array c
682:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
683:    LDA  1,-58(1)	Load address of new frame 
684:    LDA  3,1(7)	Return address in ac 
685:    LDA  7,-606(7)	CALL dog
686:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* COMPOUND
* Compound Body
* EXPRESSION
687:    LDC  3,0(6)	Load integer constant 
688:     ST  3,-58(1)	Store variable p
* WHILE
689:     LD  3,-58(1)	Load variable p
690:     ST  3,-60(1)	Save left side 
691:    LDC  3,10(6)	Load integer constant 
692:     LD  4,-60(1)	Load left into ac1 
693:    TLT  3,4,3	Op < 
694:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
696:     LD  3,-58(1)	Load variable p
697:     ST  3,-59(1)	Store variable q
* EXPRESSION
698:    LDC  3,9(6)	Load integer constant 
699:     ST  3,-60(1)	Save left side 
700:     LD  3,-59(1)	Load variable q
701:     LD  4,-60(1)	Load left into ac1 
702:    SUB  3,4,3	Op - 
703:     ST  3,-60(1)	Save index 
704:    LDC  3,1(6)	Load integer constant 
705:     LD  4,-58(1)	load lhs variable p
706:    ADD  3,4,3	op += 
707:     ST  3,-58(1)	Store variable p
708:     LD  4,-60(1)	Restore index 
709:    LDA  5,-4(1)	Load address of base of array c
710:    SUB  5,5,4	Compute offset of value 
711:     ST  3,0(5)	Store variable c
* END COMPOUND
712:    LDA  7,-24(7)	go to beginning of loop 
695:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* EXPRESSION
*                       Begin call to  showIntArray
713:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
714:    LDA  3,-4(1)	Load address of base of array c
715:     ST  3,-60(1)	Store parameter 
*                       Load param 2
716:    LDC  3,10(6)	Load integer constant 
717:     ST  3,-61(1)	Store parameter 
*                       Jump to showIntArray
718:    LDA  1,-58(1)	Load address of new frame 
719:    LDA  3,1(7)	Return address in ac 
720:    LDA  7,-679(7)	CALL showIntArray
721:    LDA  3,0(2)	Save the result in ac 
*                       End call to showIntArray
* END COMPOUND
* Add standard closing in case there is no return statement
722:    LDC  2,0(6)	Set return value to 0 
723:     LD  3,-1(1)	Load return address 
724:     LD  1,0(1)	Adjust fp 
725:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,725(7)	Jump to init [backpatch] 
* INIT
726:     LD  0,0(0)	Set the global pointer 
727:    LDA  1,-12(0)	set first frame at end of globals 
728:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
729:    LDC  3,10(6)	load size of array gl
730:     ST  3,0(0)	save size of array gl
* END INIT GLOBALS AND STATICS
731:    LDA  3,1(7)	Return address in ac 
732:    LDA  7,-591(7)	Jump to main 
733:   HALT  0,0,0	DONE! 
* END INIT
