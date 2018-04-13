* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  assign6.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array b
 44:     ST  3,-5(1)	save size of array b
* Compound Body
* EXPRESSION
 45:    LDC  3,777(6)	Load integer constant 
 46:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,-4(1)	Load variable a
 49:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-17(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 54:    LDC  3,666(6)	Load integer constant 
 55:     LD  4,-4(1)	load lhs variable a
 56:    ADD  3,4,3	op += 
 57:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 59:     LD  3,-4(1)	Load variable a
 60:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-17(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 65:    LDC  3,666(6)	Load integer constant 
 66:     LD  4,-4(1)	load lhs variable a
 67:    SUB  3,4,3	op -= 
 68:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-4(1)	Load variable a
 71:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 72:    LDA  1,-17(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 76:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
 77:    LDA  1,-17(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-43(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 81:    LDC  3,777(6)	Load integer constant 
 82:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 84:     LD  3,0(0)	Load variable g
 85:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 86:    LDA  1,-17(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 90:    LDC  3,666(6)	Load integer constant 
 91:     LD  4,0(0)	load lhs variable g
 92:    ADD  3,4,3	op += 
 93:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
 94:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 95:     LD  3,0(0)	Load variable g
 96:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 97:    LDA  1,-17(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
101:    LDC  3,666(6)	Load integer constant 
102:     LD  4,0(0)	load lhs variable g
103:    SUB  3,4,3	op -= 
104:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
105:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
106:     LD  3,0(0)	Load variable g
107:     ST  3,-19(1)	Store parameter 
*                       Jump to output
108:    LDA  1,-17(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
112:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
113:    LDA  1,-17(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-79(7)	CALL outnl
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
117:    LDC  3,777(6)	Load integer constant 
118:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
119:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
120:     LD  3,-2(1)	Load variable p
121:     ST  3,-19(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-17(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
126:    LDC  3,666(6)	Load integer constant 
127:     LD  4,-2(1)	load lhs variable p
128:    ADD  3,4,3	op += 
129:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,-2(1)	Load variable p
132:     ST  3,-19(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-17(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
137:    LDC  3,666(6)	Load integer constant 
138:     LD  4,-2(1)	load lhs variable p
139:    SUB  3,4,3	op -= 
140:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
142:     LD  3,-2(1)	Load variable p
143:     ST  3,-19(1)	Store parameter 
*                       Jump to output
144:    LDA  1,-17(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
148:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
149:    LDA  1,-17(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-115(7)	CALL outnl
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
153:    LDC  3,1(6)	Load integer constant 
154:     ST  3,-17(1)	Save index 
155:    LDC  3,777(6)	Load integer constant 
156:     LD  4,-17(1)	Restore index 
157:    LDA  5,-6(1)	Load address of base of array b
158:    SUB  5,5,4	Compute offset of value 
159:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
160:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
161:    LDA  3,-6(1)	Load address of base of array b
162:     ST  3,-19(1)	Save left side 
163:    LDC  3,1(6)	Load integer constant 
164:     LD  4,-19(1)	Load left into ac1 
165:    SUB  3,4,3	compute location from index 
166:     LD  3,0(3)	Load array element 
167:     ST  3,-19(1)	Store parameter 
*                       Jump to output
168:    LDA  1,-17(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
172:    LDC  3,1(6)	Load integer constant 
173:     ST  3,-17(1)	Save index 
174:    LDC  3,666(6)	Load integer constant 
175:     LD  4,-17(1)	Restore index 
176:    LDA  5,-6(1)	Load address of base of array b
177:    SUB  5,5,4	Compute offset of value 
178:     LD  4,0(5)	load lhs variable b
179:    ADD  3,4,3	op += 
180:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
181:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
182:    LDA  3,-6(1)	Load address of base of array b
183:     ST  3,-19(1)	Save left side 
184:    LDC  3,1(6)	Load integer constant 
185:     LD  4,-19(1)	Load left into ac1 
186:    SUB  3,4,3	compute location from index 
187:     LD  3,0(3)	Load array element 
188:     ST  3,-19(1)	Store parameter 
*                       Jump to output
189:    LDA  1,-17(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
193:    LDC  3,1(6)	Load integer constant 
194:     ST  3,-17(1)	Save index 
195:    LDC  3,666(6)	Load integer constant 
196:     LD  4,-17(1)	Restore index 
197:    LDA  5,-6(1)	Load address of base of array b
198:    SUB  5,5,4	Compute offset of value 
199:     LD  4,0(5)	load lhs variable b
200:    SUB  3,4,3	op -= 
201:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
202:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
203:    LDA  3,-6(1)	Load address of base of array b
204:     ST  3,-19(1)	Save left side 
205:    LDC  3,1(6)	Load integer constant 
206:     LD  4,-19(1)	Load left into ac1 
207:    SUB  3,4,3	compute location from index 
208:     LD  3,0(3)	Load array element 
209:     ST  3,-19(1)	Store parameter 
*                       Jump to output
210:    LDA  1,-17(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
214:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
215:    LDA  1,-17(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-181(7)	CALL outnl
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
219:    LDC  3,1(6)	Load integer constant 
220:     ST  3,-17(1)	Save index 
221:    LDC  3,777(6)	Load integer constant 
222:     LD  4,-17(1)	Restore index 
223:    LDA  5,-2(0)	Load address of base of array h
224:    SUB  5,5,4	Compute offset of value 
225:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
226:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
227:    LDA  3,-2(0)	Load address of base of array h
228:     ST  3,-19(1)	Save left side 
229:    LDC  3,1(6)	Load integer constant 
230:     LD  4,-19(1)	Load left into ac1 
231:    SUB  3,4,3	compute location from index 
232:     LD  3,0(3)	Load array element 
233:     ST  3,-19(1)	Store parameter 
*                       Jump to output
234:    LDA  1,-17(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
238:    LDC  3,1(6)	Load integer constant 
239:     ST  3,-17(1)	Save index 
240:    LDC  3,666(6)	Load integer constant 
241:     LD  4,-17(1)	Restore index 
242:    LDA  5,-2(0)	Load address of base of array h
243:    SUB  5,5,4	Compute offset of value 
244:     LD  4,0(5)	load lhs variable h
245:    ADD  3,4,3	op += 
246:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
247:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
248:    LDA  3,-2(0)	Load address of base of array h
249:     ST  3,-19(1)	Save left side 
250:    LDC  3,1(6)	Load integer constant 
251:     LD  4,-19(1)	Load left into ac1 
252:    SUB  3,4,3	compute location from index 
253:     LD  3,0(3)	Load array element 
254:     ST  3,-19(1)	Store parameter 
*                       Jump to output
255:    LDA  1,-17(1)	Load address of new frame 
256:    LDA  3,1(7)	Return address in ac 
257:    LDA  7,-252(7)	CALL output
258:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
259:    LDC  3,1(6)	Load integer constant 
260:     ST  3,-17(1)	Save index 
261:    LDC  3,666(6)	Load integer constant 
262:     LD  4,-17(1)	Restore index 
263:    LDA  5,-2(0)	Load address of base of array h
264:    SUB  5,5,4	Compute offset of value 
265:     LD  4,0(5)	load lhs variable h
266:    SUB  3,4,3	op -= 
267:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
268:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
269:    LDA  3,-2(0)	Load address of base of array h
270:     ST  3,-19(1)	Save left side 
271:    LDC  3,1(6)	Load integer constant 
272:     LD  4,-19(1)	Load left into ac1 
273:    SUB  3,4,3	compute location from index 
274:     LD  3,0(3)	Load array element 
275:     ST  3,-19(1)	Store parameter 
*                       Jump to output
276:    LDA  1,-17(1)	Load address of new frame 
277:    LDA  3,1(7)	Return address in ac 
278:    LDA  7,-273(7)	CALL output
279:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
280:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
281:    LDA  1,-17(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-247(7)	CALL outnl
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
285:    LDC  3,1(6)	Load integer constant 
286:     ST  3,-17(1)	Save index 
287:    LDC  3,777(6)	Load integer constant 
288:     LD  4,-17(1)	Restore index 
289:     LD  5,-3(1)	Load address of base of array q
290:    SUB  5,5,4	Compute offset of value 
291:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
292:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
293:     LD  3,-3(1)	Load address of base of array q
294:     ST  3,-19(1)	Save left side 
295:    LDC  3,1(6)	Load integer constant 
296:     LD  4,-19(1)	Load left into ac1 
297:    SUB  3,4,3	compute location from index 
298:     LD  3,0(3)	Load array element 
299:     ST  3,-19(1)	Store parameter 
*                       Jump to output
300:    LDA  1,-17(1)	Load address of new frame 
301:    LDA  3,1(7)	Return address in ac 
302:    LDA  7,-297(7)	CALL output
303:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
304:    LDC  3,1(6)	Load integer constant 
305:     ST  3,-17(1)	Save index 
306:    LDC  3,666(6)	Load integer constant 
307:     LD  4,-17(1)	Restore index 
308:     LD  5,-3(1)	Load address of base of array q
309:    SUB  5,5,4	Compute offset of value 
310:     LD  4,0(5)	load lhs variable q
311:    ADD  3,4,3	op += 
312:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
313:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
314:     LD  3,-3(1)	Load address of base of array q
315:     ST  3,-19(1)	Save left side 
316:    LDC  3,1(6)	Load integer constant 
317:     LD  4,-19(1)	Load left into ac1 
318:    SUB  3,4,3	compute location from index 
319:     LD  3,0(3)	Load array element 
320:     ST  3,-19(1)	Store parameter 
*                       Jump to output
321:    LDA  1,-17(1)	Load address of new frame 
322:    LDA  3,1(7)	Return address in ac 
323:    LDA  7,-318(7)	CALL output
324:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
325:    LDC  3,1(6)	Load integer constant 
326:     ST  3,-17(1)	Save index 
327:    LDC  3,666(6)	Load integer constant 
328:     LD  4,-17(1)	Restore index 
329:     LD  5,-3(1)	Load address of base of array q
330:    SUB  5,5,4	Compute offset of value 
331:     LD  4,0(5)	load lhs variable q
332:    SUB  3,4,3	op -= 
333:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
334:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
335:     LD  3,-3(1)	Load address of base of array q
336:     ST  3,-19(1)	Save left side 
337:    LDC  3,1(6)	Load integer constant 
338:     LD  4,-19(1)	Load left into ac1 
339:    SUB  3,4,3	compute location from index 
340:     LD  3,0(3)	Load array element 
341:     ST  3,-19(1)	Store parameter 
*                       Jump to output
342:    LDA  1,-17(1)	Load address of new frame 
343:    LDA  3,1(7)	Return address in ac 
344:    LDA  7,-339(7)	CALL output
345:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
346:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
347:    LDA  1,-17(1)	Load address of new frame 
348:    LDA  3,1(7)	Return address in ac 
349:    LDA  7,-313(7)	CALL outnl
350:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
351:    LDC  3,1(6)	Load integer constant 
352:     ST  3,-17(1)	Save index 
353:    LDC  3,3(6)	Load integer constant 
354:     LD  4,-17(1)	Restore index 
355:    LDA  5,-6(1)	Load address of base of array b
356:    SUB  5,5,4	Compute offset of value 
357:     ST  3,0(5)	Store variable b
* EXPRESSION
358:    LDA  3,-6(1)	Load address of base of array b
359:     ST  3,-17(1)	Save left side 
360:    LDC  3,1(6)	Load integer constant 
361:     LD  4,-17(1)	Load left into ac1 
362:    SUB  3,4,3	compute location from index 
363:     LD  3,0(3)	Load array element 
364:     ST  3,-17(1)	Save left side 
365:    LDC  3,1(6)	Load integer constant 
366:     LD  4,-17(1)	Load left into ac1 
367:    ADD  3,4,3	Op + 
368:     ST  3,-17(1)	Save index 
369:    LDC  3,777(6)	Load integer constant 
370:     LD  4,-17(1)	Restore index 
371:     LD  5,-3(1)	Load address of base of array q
372:    SUB  5,5,4	Compute offset of value 
373:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
374:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
375:     LD  3,-3(1)	Load address of base of array q
376:     ST  3,-19(1)	Save left side 
377:    LDA  3,-6(1)	Load address of base of array b
378:     ST  3,-20(1)	Save left side 
379:    LDC  3,1(6)	Load integer constant 
380:     LD  4,-20(1)	Load left into ac1 
381:    SUB  3,4,3	compute location from index 
382:     LD  3,0(3)	Load array element 
383:     ST  3,-20(1)	Save left side 
384:    LDC  3,1(6)	Load integer constant 
385:     LD  4,-20(1)	Load left into ac1 
386:    ADD  3,4,3	Op + 
387:     LD  4,-19(1)	Load left into ac1 
388:    SUB  3,4,3	compute location from index 
389:     LD  3,0(3)	Load array element 
390:     ST  3,-19(1)	Store parameter 
*                       Jump to output
391:    LDA  1,-17(1)	Load address of new frame 
392:    LDA  3,1(7)	Return address in ac 
393:    LDA  7,-388(7)	CALL output
394:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
395:    LDA  3,-6(1)	Load address of base of array b
396:     ST  3,-17(1)	Save left side 
397:    LDC  3,1(6)	Load integer constant 
398:     LD  4,-17(1)	Load left into ac1 
399:    SUB  3,4,3	compute location from index 
400:     LD  3,0(3)	Load array element 
401:     ST  3,-17(1)	Save left side 
402:    LDC  3,1(6)	Load integer constant 
403:     LD  4,-17(1)	Load left into ac1 
404:    ADD  3,4,3	Op + 
405:     ST  3,-17(1)	Save index 
406:    LDC  3,666(6)	Load integer constant 
407:     LD  4,-17(1)	Restore index 
408:     LD  5,-3(1)	Load address of base of array q
409:    SUB  5,5,4	Compute offset of value 
410:     LD  4,0(5)	load lhs variable q
411:    ADD  3,4,3	op += 
412:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
413:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
414:     LD  3,-3(1)	Load address of base of array q
415:     ST  3,-19(1)	Save left side 
416:    LDA  3,-6(1)	Load address of base of array b
417:     ST  3,-20(1)	Save left side 
418:    LDC  3,1(6)	Load integer constant 
419:     LD  4,-20(1)	Load left into ac1 
420:    SUB  3,4,3	compute location from index 
421:     LD  3,0(3)	Load array element 
422:     ST  3,-20(1)	Save left side 
423:    LDC  3,1(6)	Load integer constant 
424:     LD  4,-20(1)	Load left into ac1 
425:    ADD  3,4,3	Op + 
426:     LD  4,-19(1)	Load left into ac1 
427:    SUB  3,4,3	compute location from index 
428:     LD  3,0(3)	Load array element 
429:     ST  3,-19(1)	Store parameter 
*                       Jump to output
430:    LDA  1,-17(1)	Load address of new frame 
431:    LDA  3,1(7)	Return address in ac 
432:    LDA  7,-427(7)	CALL output
433:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
434:    LDA  3,-6(1)	Load address of base of array b
435:     ST  3,-17(1)	Save left side 
436:    LDC  3,1(6)	Load integer constant 
437:     LD  4,-17(1)	Load left into ac1 
438:    SUB  3,4,3	compute location from index 
439:     LD  3,0(3)	Load array element 
440:     ST  3,-17(1)	Save left side 
441:    LDC  3,1(6)	Load integer constant 
442:     LD  4,-17(1)	Load left into ac1 
443:    ADD  3,4,3	Op + 
444:     ST  3,-17(1)	Save index 
445:    LDC  3,666(6)	Load integer constant 
446:     LD  4,-17(1)	Restore index 
447:     LD  5,-3(1)	Load address of base of array q
448:    SUB  5,5,4	Compute offset of value 
449:     LD  4,0(5)	load lhs variable q
450:    SUB  3,4,3	op -= 
451:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
452:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
453:     LD  3,-3(1)	Load address of base of array q
454:     ST  3,-19(1)	Save left side 
455:    LDA  3,-6(1)	Load address of base of array b
456:     ST  3,-20(1)	Save left side 
457:    LDC  3,1(6)	Load integer constant 
458:     LD  4,-20(1)	Load left into ac1 
459:    SUB  3,4,3	compute location from index 
460:     LD  3,0(3)	Load array element 
461:     ST  3,-20(1)	Save left side 
462:    LDC  3,1(6)	Load integer constant 
463:     LD  4,-20(1)	Load left into ac1 
464:    ADD  3,4,3	Op + 
465:     LD  4,-19(1)	Load left into ac1 
466:    SUB  3,4,3	compute location from index 
467:     LD  3,0(3)	Load array element 
468:     ST  3,-19(1)	Store parameter 
*                       Jump to output
469:    LDA  1,-17(1)	Load address of new frame 
470:    LDA  3,1(7)	Return address in ac 
471:    LDA  7,-466(7)	CALL output
472:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
473:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
474:    LDA  1,-17(1)	Load address of new frame 
475:    LDA  3,1(7)	Return address in ac 
476:    LDA  7,-440(7)	CALL outnl
477:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
478:    LDC  3,777(6)	Load integer constant 
479:     ST  3,-4(1)	Store variable a
480:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
481:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
482:     LD  3,-16(1)	Load variable x
483:     ST  3,-19(1)	Store parameter 
*                       Jump to output
484:    LDA  1,-17(1)	Load address of new frame 
485:    LDA  3,1(7)	Return address in ac 
486:    LDA  7,-481(7)	CALL output
487:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
488:    LDC  3,666(6)	Load integer constant 
489:     LD  4,-4(1)	load lhs variable a
490:    ADD  3,4,3	op += 
491:     ST  3,-4(1)	Store variable a
492:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
493:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
494:     LD  3,-16(1)	Load variable x
495:     ST  3,-19(1)	Store parameter 
*                       Jump to output
496:    LDA  1,-17(1)	Load address of new frame 
497:    LDA  3,1(7)	Return address in ac 
498:    LDA  7,-493(7)	CALL output
499:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
500:    LDC  3,666(6)	Load integer constant 
501:     LD  4,-4(1)	load lhs variable a
502:    SUB  3,4,3	op -= 
503:     ST  3,-4(1)	Store variable a
504:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
505:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
506:     LD  3,-16(1)	Load variable x
507:     ST  3,-19(1)	Store parameter 
*                       Jump to output
508:    LDA  1,-17(1)	Load address of new frame 
509:    LDA  3,1(7)	Return address in ac 
510:    LDA  7,-505(7)	CALL output
511:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
512:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
513:    LDA  1,-17(1)	Load address of new frame 
514:    LDA  3,1(7)	Return address in ac 
515:    LDA  7,-479(7)	CALL outnl
516:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
517:    LDC  3,1(6)	Load integer constant 
518:     ST  3,-17(1)	Save index 
519:    LDC  3,2(6)	Load integer constant 
520:     ST  3,-18(1)	Save index 
521:    LDC  3,777(6)	Load integer constant 
522:     LD  4,-18(1)	Restore index 
523:    LDA  5,-6(1)	Load address of base of array b
524:    SUB  5,5,4	Compute offset of value 
525:     ST  3,0(5)	Store variable b
526:     LD  4,-17(1)	Restore index 
527:    LDA  5,-6(1)	Load address of base of array b
528:    SUB  5,5,4	Compute offset of value 
529:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
530:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
531:    LDA  3,-6(1)	Load address of base of array b
532:     ST  3,-19(1)	Save left side 
533:    LDC  3,1(6)	Load integer constant 
534:     LD  4,-19(1)	Load left into ac1 
535:    SUB  3,4,3	compute location from index 
536:     LD  3,0(3)	Load array element 
537:     ST  3,-19(1)	Store parameter 
*                       Jump to output
538:    LDA  1,-17(1)	Load address of new frame 
539:    LDA  3,1(7)	Return address in ac 
540:    LDA  7,-535(7)	CALL output
541:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
542:    LDC  3,1(6)	Load integer constant 
543:     ST  3,-17(1)	Save index 
544:    LDC  3,2(6)	Load integer constant 
545:     ST  3,-18(1)	Save index 
546:    LDC  3,666(6)	Load integer constant 
547:     LD  4,-18(1)	Restore index 
548:    LDA  5,-6(1)	Load address of base of array b
549:    SUB  5,5,4	Compute offset of value 
550:     LD  4,0(5)	load lhs variable b
551:    ADD  3,4,3	op += 
552:     ST  3,0(5)	Store variable b
553:     LD  4,-17(1)	Restore index 
554:    LDA  5,-6(1)	Load address of base of array b
555:    SUB  5,5,4	Compute offset of value 
556:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
557:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
558:    LDA  3,-6(1)	Load address of base of array b
559:     ST  3,-19(1)	Save left side 
560:    LDC  3,1(6)	Load integer constant 
561:     LD  4,-19(1)	Load left into ac1 
562:    SUB  3,4,3	compute location from index 
563:     LD  3,0(3)	Load array element 
564:     ST  3,-19(1)	Store parameter 
*                       Jump to output
565:    LDA  1,-17(1)	Load address of new frame 
566:    LDA  3,1(7)	Return address in ac 
567:    LDA  7,-562(7)	CALL output
568:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
569:    LDC  3,1(6)	Load integer constant 
570:     ST  3,-17(1)	Save index 
571:    LDC  3,2(6)	Load integer constant 
572:     ST  3,-18(1)	Save index 
573:    LDC  3,666(6)	Load integer constant 
574:     LD  4,-18(1)	Restore index 
575:    LDA  5,-6(1)	Load address of base of array b
576:    SUB  5,5,4	Compute offset of value 
577:     LD  4,0(5)	load lhs variable b
578:    SUB  3,4,3	op -= 
579:     ST  3,0(5)	Store variable b
580:     LD  4,-17(1)	Restore index 
581:    LDA  5,-6(1)	Load address of base of array b
582:    SUB  5,5,4	Compute offset of value 
583:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
584:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
585:    LDA  3,-6(1)	Load address of base of array b
586:     ST  3,-19(1)	Save left side 
587:    LDC  3,1(6)	Load integer constant 
588:     LD  4,-19(1)	Load left into ac1 
589:    SUB  3,4,3	compute location from index 
590:     LD  3,0(3)	Load array element 
591:     ST  3,-19(1)	Store parameter 
*                       Jump to output
592:    LDA  1,-17(1)	Load address of new frame 
593:    LDA  3,1(7)	Return address in ac 
594:    LDA  7,-589(7)	CALL output
595:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
596:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
597:    LDA  1,-17(1)	Load address of new frame 
598:    LDA  3,1(7)	Return address in ac 
599:    LDA  7,-563(7)	CALL outnl
600:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
601:     LD  3,-4(1)	Load variable a
602:     ST  3,-17(1)	Save left side 
603:     LD  3,-16(1)	Load variable x
604:     LD  4,-17(1)	Load left into ac1 
605:    MUL  3,4,3	Op * 
606:     LD  4,-4(1)	load lhs variable a
607:    ADD  3,4,3	op += 
608:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
609:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
610:     LD  3,-4(1)	Load variable a
611:     ST  3,-19(1)	Store parameter 
*                       Jump to output
612:    LDA  1,-17(1)	Load address of new frame 
613:    LDA  3,1(7)	Return address in ac 
614:    LDA  7,-609(7)	CALL output
615:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
616:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
617:    LDA  1,-17(1)	Load address of new frame 
618:    LDA  3,1(7)	Return address in ac 
619:    LDA  7,-583(7)	CALL outnl
620:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
621:    LDC  2,0(6)	Set return value to 0 
622:     LD  3,-1(1)	Load return address 
623:     LD  1,0(1)	Adjust fp 
624:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
625:     ST  3,-1(1)	Store return address. 
* COMPOUND
626:    LDC  3,20(6)	load size of array qq
627:     ST  3,-3(1)	save size of array qq
* Compound Body
* EXPRESSION
628:    LDC  3,888(6)	Load integer constant 
629:     ST  3,-2(1)	Store variable pp
* EXPRESSION
630:    LDC  3,1(6)	Load integer constant 
631:     ST  3,-24(1)	Save index 
632:    LDC  3,999(6)	Load integer constant 
633:     LD  4,-24(1)	Restore index 
634:    LDA  5,-4(1)	Load address of base of array qq
635:    SUB  5,5,4	Compute offset of value 
636:     ST  3,0(5)	Store variable qq
* EXPRESSION
*                       Begin call to  dog
637:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
638:     LD  3,-2(1)	Load variable pp
639:     ST  3,-26(1)	Store parameter 
*                       Load param 2
640:    LDA  3,-4(1)	Load address of base of array qq
641:     ST  3,-27(1)	Store parameter 
*                       Jump to dog
642:    LDA  1,-24(1)	Load address of new frame 
643:    LDA  3,1(7)	Return address in ac 
644:    LDA  7,-603(7)	CALL dog
645:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
646:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
647:     LD  3,-2(1)	Load variable pp
648:     ST  3,-26(1)	Store parameter 
*                       Jump to output
649:    LDA  1,-24(1)	Load address of new frame 
650:    LDA  3,1(7)	Return address in ac 
651:    LDA  7,-646(7)	CALL output
652:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
653:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
654:    LDA  3,-4(1)	Load address of base of array qq
655:     ST  3,-26(1)	Save left side 
656:    LDC  3,1(6)	Load integer constant 
657:     LD  4,-26(1)	Load left into ac1 
658:    SUB  3,4,3	compute location from index 
659:     LD  3,0(3)	Load array element 
660:     ST  3,-26(1)	Store parameter 
*                       Jump to output
661:    LDA  1,-24(1)	Load address of new frame 
662:    LDA  3,1(7)	Return address in ac 
663:    LDA  7,-658(7)	CALL output
664:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
665:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Jump to outnl
666:    LDA  1,-24(1)	Load address of new frame 
667:    LDA  3,1(7)	Return address in ac 
668:    LDA  7,-632(7)	CALL outnl
669:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
670:    LDC  2,0(6)	Set return value to 0 
671:     LD  3,-1(1)	Load return address 
672:     LD  1,0(1)	Adjust fp 
673:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,673(7)	Jump to init [backpatch] 
* INIT
674:     LD  0,0(0)	Set the global pointer 
675:    LDA  1,-12(0)	set first frame at end of globals 
676:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
677:    LDC  3,10(6)	load size of array h
678:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
679:    LDA  3,1(7)	Return address in ac 
680:    LDA  7,-56(7)	Jump to main 
681:   HALT  0,0,0	DONE! 
* END INIT
