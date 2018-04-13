* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  assign3.c-
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
 43:    LDC  3,8(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,7(6)	load size of array y
 46:     ST  3,-11(1)	save size of array y
* Compound Body
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-19(1)	Save index 
 49:    LDC  3,111(6)	Load integer constant 
 50:     LD  4,-19(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     LD  4,0(5)	load lhs variable x
 54:    ADD  3,4,3	op += 
 55:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 56:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
 57:    LDA  3,-3(1)	Load address of base of array x
 58:     ST  3,-21(1)	Save left side 
 59:    LDC  3,5(6)	Load integer constant 
 60:     LD  4,-21(1)	Load left into ac1 
 61:    SUB  3,4,3	compute location from index 
 62:     LD  3,0(3)	Load array element 
 63:     ST  3,-21(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-19(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 68:    LDC  3,4(6)	Load integer constant 
 69:     ST  3,-19(1)	Save index 
 70:    LDC  3,222(6)	Load integer constant 
 71:     LD  4,-19(1)	Restore index 
 72:    LDA  5,-12(1)	Load address of base of array y
 73:    SUB  5,5,4	Compute offset of value 
 74:     LD  4,0(5)	load lhs variable y
 75:    ADD  3,4,3	op += 
 76:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDA  3,-12(1)	Load address of base of array y
 79:     ST  3,-21(1)	Save left side 
 80:    LDC  3,4(6)	Load integer constant 
 81:     LD  4,-21(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     ST  3,-21(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-19(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 89:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
 90:    LDA  1,-19(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-56(7)	CALL outnl
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 94:    LDC  3,5(6)	Load integer constant 
 95:     ST  3,-19(1)	Save index 
 96:    LDC  3,333(6)	Load integer constant 
 97:     LD  4,-19(1)	Restore index 
 98:    LDA  5,-1(0)	Load address of base of array gx
 99:    SUB  5,5,4	Compute offset of value 
100:     LD  4,0(5)	load lhs variable gx
101:    ADD  3,4,3	op += 
102:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
103:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
104:    LDA  3,-1(0)	Load address of base of array gx
105:     ST  3,-21(1)	Save left side 
106:    LDC  3,5(6)	Load integer constant 
107:     LD  4,-21(1)	Load left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
110:     ST  3,-21(1)	Store parameter 
*                       Jump to output
111:    LDA  1,-19(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
115:    LDC  3,4(6)	Load integer constant 
116:     ST  3,-19(1)	Save index 
117:    LDC  3,444(6)	Load integer constant 
118:     LD  4,-19(1)	Restore index 
119:    LDA  5,-9(0)	Load address of base of array gy
120:    SUB  5,5,4	Compute offset of value 
121:     LD  4,0(5)	load lhs variable gy
122:    ADD  3,4,3	op += 
123:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
124:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
125:    LDA  3,-9(0)	Load address of base of array gy
126:     ST  3,-21(1)	Save left side 
127:    LDC  3,4(6)	Load integer constant 
128:     LD  4,-21(1)	Load left into ac1 
129:    SUB  3,4,3	compute location from index 
130:     LD  3,0(3)	Load array element 
131:     ST  3,-21(1)	Store parameter 
*                       Jump to output
132:    LDA  1,-19(1)	Load address of new frame 
133:    LDA  3,1(7)	Return address in ac 
134:    LDA  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
136:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
137:    LDA  1,-19(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-103(7)	CALL outnl
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
141:    LDC  3,5(6)	Load integer constant 
142:     ST  3,-19(1)	Save index 
143:    LDA  3,-12(1)	Load address of base of array y
144:     ST  3,-20(1)	Save left side 
145:    LDC  3,4(6)	Load integer constant 
146:     LD  4,-20(1)	Load left into ac1 
147:    SUB  3,4,3	compute location from index 
148:     LD  3,0(3)	Load array element 
149:     LD  4,-19(1)	Restore index 
150:    LDA  5,-3(1)	Load address of base of array x
151:    SUB  5,5,4	Compute offset of value 
152:     LD  4,0(5)	load lhs variable x
153:    ADD  3,4,3	op += 
154:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
155:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
156:    LDA  3,-3(1)	Load address of base of array x
157:     ST  3,-21(1)	Save left side 
158:    LDC  3,5(6)	Load integer constant 
159:     LD  4,-21(1)	Load left into ac1 
160:    SUB  3,4,3	compute location from index 
161:     LD  3,0(3)	Load array element 
162:     ST  3,-21(1)	Store parameter 
*                       Jump to output
163:    LDA  1,-19(1)	Load address of new frame 
164:    LDA  3,1(7)	Return address in ac 
165:    LDA  7,-160(7)	CALL output
166:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
167:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
168:    LDA  1,-19(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-134(7)	CALL outnl
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
172:    LDC  3,5(6)	Load integer constant 
173:     ST  3,-19(1)	Save index 
174:    LDA  3,-9(0)	Load address of base of array gy
175:     ST  3,-20(1)	Save left side 
176:    LDC  3,4(6)	Load integer constant 
177:     LD  4,-20(1)	Load left into ac1 
178:    SUB  3,4,3	compute location from index 
179:     LD  3,0(3)	Load array element 
180:     LD  4,-19(1)	Restore index 
181:    LDA  5,-1(0)	Load address of base of array gx
182:    SUB  5,5,4	Compute offset of value 
183:     LD  4,0(5)	load lhs variable gx
184:    ADD  3,4,3	op += 
185:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
186:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
187:    LDA  3,-1(0)	Load address of base of array gx
188:     ST  3,-21(1)	Save left side 
189:    LDC  3,5(6)	Load integer constant 
190:     LD  4,-21(1)	Load left into ac1 
191:    SUB  3,4,3	compute location from index 
192:     LD  3,0(3)	Load array element 
193:     ST  3,-21(1)	Store parameter 
*                       Jump to output
194:    LDA  1,-19(1)	Load address of new frame 
195:    LDA  3,1(7)	Return address in ac 
196:    LDA  7,-191(7)	CALL output
197:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
198:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
199:    LDA  1,-19(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-165(7)	CALL outnl
202:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
203:    LDC  3,5(6)	Load integer constant 
204:     ST  3,-19(1)	Save index 
205:    LDC  3,111(6)	Load integer constant 
206:     LD  4,-19(1)	Restore index 
207:    LDA  5,-3(1)	Load address of base of array x
208:    SUB  5,5,4	Compute offset of value 
209:     LD  4,0(5)	load lhs variable x
210:    SUB  3,4,3	op -= 
211:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
212:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
213:    LDA  3,-3(1)	Load address of base of array x
214:     ST  3,-21(1)	Save left side 
215:    LDC  3,5(6)	Load integer constant 
216:     LD  4,-21(1)	Load left into ac1 
217:    SUB  3,4,3	compute location from index 
218:     LD  3,0(3)	Load array element 
219:     ST  3,-21(1)	Store parameter 
*                       Jump to output
220:    LDA  1,-19(1)	Load address of new frame 
221:    LDA  3,1(7)	Return address in ac 
222:    LDA  7,-217(7)	CALL output
223:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
224:    LDC  3,4(6)	Load integer constant 
225:     ST  3,-19(1)	Save index 
226:    LDC  3,222(6)	Load integer constant 
227:     LD  4,-19(1)	Restore index 
228:    LDA  5,-12(1)	Load address of base of array y
229:    SUB  5,5,4	Compute offset of value 
230:     LD  4,0(5)	load lhs variable y
231:    SUB  3,4,3	op -= 
232:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
233:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
234:    LDA  3,-12(1)	Load address of base of array y
235:     ST  3,-21(1)	Save left side 
236:    LDC  3,4(6)	Load integer constant 
237:     LD  4,-21(1)	Load left into ac1 
238:    SUB  3,4,3	compute location from index 
239:     LD  3,0(3)	Load array element 
240:     ST  3,-21(1)	Store parameter 
*                       Jump to output
241:    LDA  1,-19(1)	Load address of new frame 
242:    LDA  3,1(7)	Return address in ac 
243:    LDA  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
245:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
246:    LDA  1,-19(1)	Load address of new frame 
247:    LDA  3,1(7)	Return address in ac 
248:    LDA  7,-212(7)	CALL outnl
249:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
250:    LDC  3,5(6)	Load integer constant 
251:     ST  3,-19(1)	Save index 
252:    LDC  3,333(6)	Load integer constant 
253:     LD  4,-19(1)	Restore index 
254:    LDA  5,-1(0)	Load address of base of array gx
255:    SUB  5,5,4	Compute offset of value 
256:     LD  4,0(5)	load lhs variable gx
257:    SUB  3,4,3	op -= 
258:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
259:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
260:    LDA  3,-1(0)	Load address of base of array gx
261:     ST  3,-21(1)	Save left side 
262:    LDC  3,5(6)	Load integer constant 
263:     LD  4,-21(1)	Load left into ac1 
264:    SUB  3,4,3	compute location from index 
265:     LD  3,0(3)	Load array element 
266:     ST  3,-21(1)	Store parameter 
*                       Jump to output
267:    LDA  1,-19(1)	Load address of new frame 
268:    LDA  3,1(7)	Return address in ac 
269:    LDA  7,-264(7)	CALL output
270:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
271:    LDC  3,4(6)	Load integer constant 
272:     ST  3,-19(1)	Save index 
273:    LDC  3,444(6)	Load integer constant 
274:     LD  4,-19(1)	Restore index 
275:    LDA  5,-9(0)	Load address of base of array gy
276:    SUB  5,5,4	Compute offset of value 
277:     LD  4,0(5)	load lhs variable gy
278:    SUB  3,4,3	op -= 
279:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
280:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
281:    LDA  3,-9(0)	Load address of base of array gy
282:     ST  3,-21(1)	Save left side 
283:    LDC  3,4(6)	Load integer constant 
284:     LD  4,-21(1)	Load left into ac1 
285:    SUB  3,4,3	compute location from index 
286:     LD  3,0(3)	Load array element 
287:     ST  3,-21(1)	Store parameter 
*                       Jump to output
288:    LDA  1,-19(1)	Load address of new frame 
289:    LDA  3,1(7)	Return address in ac 
290:    LDA  7,-285(7)	CALL output
291:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
292:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
293:    LDA  1,-19(1)	Load address of new frame 
294:    LDA  3,1(7)	Return address in ac 
295:    LDA  7,-259(7)	CALL outnl
296:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
297:    LDC  3,5(6)	Load integer constant 
298:     ST  3,-19(1)	Save index 
299:    LDA  3,-12(1)	Load address of base of array y
300:     ST  3,-20(1)	Save left side 
301:    LDC  3,4(6)	Load integer constant 
302:     LD  4,-20(1)	Load left into ac1 
303:    SUB  3,4,3	compute location from index 
304:     LD  3,0(3)	Load array element 
305:     LD  4,-19(1)	Restore index 
306:    LDA  5,-3(1)	Load address of base of array x
307:    SUB  5,5,4	Compute offset of value 
308:     LD  4,0(5)	load lhs variable x
309:    SUB  3,4,3	op -= 
310:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
311:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
312:    LDA  3,-3(1)	Load address of base of array x
313:     ST  3,-21(1)	Save left side 
314:    LDC  3,5(6)	Load integer constant 
315:     LD  4,-21(1)	Load left into ac1 
316:    SUB  3,4,3	compute location from index 
317:     LD  3,0(3)	Load array element 
318:     ST  3,-21(1)	Store parameter 
*                       Jump to output
319:    LDA  1,-19(1)	Load address of new frame 
320:    LDA  3,1(7)	Return address in ac 
321:    LDA  7,-316(7)	CALL output
322:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
323:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
324:    LDA  1,-19(1)	Load address of new frame 
325:    LDA  3,1(7)	Return address in ac 
326:    LDA  7,-290(7)	CALL outnl
327:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
328:    LDC  3,5(6)	Load integer constant 
329:     ST  3,-19(1)	Save index 
330:    LDA  3,-9(0)	Load address of base of array gy
331:     ST  3,-20(1)	Save left side 
332:    LDC  3,4(6)	Load integer constant 
333:     LD  4,-20(1)	Load left into ac1 
334:    SUB  3,4,3	compute location from index 
335:     LD  3,0(3)	Load array element 
336:     LD  4,-19(1)	Restore index 
337:    LDA  5,-1(0)	Load address of base of array gx
338:    SUB  5,5,4	Compute offset of value 
339:     LD  4,0(5)	load lhs variable gx
340:    SUB  3,4,3	op -= 
341:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
342:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
343:    LDA  3,-1(0)	Load address of base of array gx
344:     ST  3,-21(1)	Save left side 
345:    LDC  3,5(6)	Load integer constant 
346:     LD  4,-21(1)	Load left into ac1 
347:    SUB  3,4,3	compute location from index 
348:     LD  3,0(3)	Load array element 
349:     ST  3,-21(1)	Store parameter 
*                       Jump to output
350:    LDA  1,-19(1)	Load address of new frame 
351:    LDA  3,1(7)	Return address in ac 
352:    LDA  7,-347(7)	CALL output
353:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
354:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
355:    LDA  1,-19(1)	Load address of new frame 
356:    LDA  3,1(7)	Return address in ac 
357:    LDA  7,-321(7)	CALL outnl
358:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
359:     LD  3,-1(1)	Load return address 
360:     LD  1,0(1)	Adjust fp 
361:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
362:    LDC  2,0(6)	Set return value to 0 
363:     LD  3,-1(1)	Load return address 
364:     LD  1,0(1)	Adjust fp 
365:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,365(7)	Jump to init [backpatch] 
* INIT
366:     LD  0,0(0)	Set the global pointer 
367:    LDA  1,-15(0)	set first frame at end of globals 
368:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
369:    LDC  3,7(6)	load size of array gx
370:     ST  3,0(0)	save size of array gx
371:    LDC  3,6(6)	load size of array gy
372:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
373:    LDA  3,1(7)	Return address in ac 
374:    LDA  7,-333(7)	Jump to main 
375:   HALT  0,0,0	DONE! 
* END INIT
