* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c13.c-
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
 43:    LDC  3,300(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 45:    LDC  3,5(6)	Load integer constant 
 46:     ST  3,-303(1)	Store variable z
* EXPRESSION
 47:     LD  3,-303(1)	Load variable z
 48:     ST  3,-304(1)	Save index 
 49:    LDC  3,73(6)	Load integer constant 
 50:     LD  4,-304(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 54:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDA  3,-3(1)	Load address of base of array x
 56:     ST  3,-306(1)	Save left side 
 57:     LD  3,-303(1)	Load variable z
 58:     LD  4,-306(1)	Load left into ac1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
 61:     ST  3,-306(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-304(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 66:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
 67:    LDA  1,-304(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-33(7)	CALL outnl
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 71:    LDC  3,5(6)	Load integer constant 
 72:     ST  3,-303(1)	Store variable z
* EXPRESSION
 73:     LD  3,-303(1)	Load variable z
 74:     ST  3,-304(1)	Save index 
 75:    LDC  3,17(6)	Load integer constant 
 76:     LD  4,-304(1)	Restore index 
 77:    LDA  5,-3(1)	Load address of base of array x
 78:    SUB  5,5,4	Compute offset of value 
 79:     ST  3,0(5)	Store variable x
* EXPRESSION
 80:    LDC  3,17(6)	Load integer constant 
 81:     ST  3,-303(1)	Store variable z
* EXPRESSION
 82:     LD  3,-303(1)	Load variable z
 83:     ST  3,-304(1)	Save index 
 84:    LDC  3,5(6)	Load integer constant 
 85:     LD  4,-304(1)	Restore index 
 86:    LDA  5,-3(1)	Load address of base of array x
 87:    SUB  5,5,4	Compute offset of value 
 88:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDA  3,-3(1)	Load address of base of array x
 91:     ST  3,-306(1)	Save left side 
 92:     LD  3,-303(1)	Load variable z
 93:     LD  4,-306(1)	Load left into ac1 
 94:    SUB  3,4,3	compute location from index 
 95:     LD  3,0(3)	Load array element 
 96:     ST  3,-306(1)	Store parameter 
*                       Jump to output
 97:    LDA  1,-304(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
101:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
102:    LDA  1,-304(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-68(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
106:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
107:    LDA  3,-3(1)	Load address of base of array x
108:     ST  3,-306(1)	Save left side 
109:    LDA  3,-3(1)	Load address of base of array x
110:     ST  3,-307(1)	Save left side 
111:     LD  3,-303(1)	Load variable z
112:     LD  4,-307(1)	Load left into ac1 
113:    SUB  3,4,3	compute location from index 
114:     LD  3,0(3)	Load array element 
115:     LD  4,-306(1)	Load left into ac1 
116:    SUB  3,4,3	compute location from index 
117:     LD  3,0(3)	Load array element 
118:     ST  3,-306(1)	Store parameter 
*                       Jump to output
119:    LDA  1,-304(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
123:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
124:    LDA  1,-304(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-90(7)	CALL outnl
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
129:    LDA  3,-3(1)	Load address of base of array x
130:     ST  3,-306(1)	Save left side 
131:    LDA  3,-3(1)	Load address of base of array x
132:     ST  3,-307(1)	Save left side 
133:    LDA  3,-3(1)	Load address of base of array x
134:     ST  3,-308(1)	Save left side 
135:     LD  3,-303(1)	Load variable z
136:     LD  4,-308(1)	Load left into ac1 
137:    SUB  3,4,3	compute location from index 
138:     LD  3,0(3)	Load array element 
139:     LD  4,-307(1)	Load left into ac1 
140:    SUB  3,4,3	compute location from index 
141:     LD  3,0(3)	Load array element 
142:     LD  4,-306(1)	Load left into ac1 
143:    SUB  3,4,3	compute location from index 
144:     LD  3,0(3)	Load array element 
145:     ST  3,-306(1)	Store parameter 
*                       Jump to output
146:    LDA  1,-304(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-143(7)	CALL output
149:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
150:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
151:    LDA  1,-304(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-117(7)	CALL outnl
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
155:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
156:    LDA  3,-3(1)	Load address of base of array x
157:     ST  3,-306(1)	Save left side 
158:    LDA  3,-3(1)	Load address of base of array x
159:     ST  3,-307(1)	Save left side 
160:    LDA  3,-3(1)	Load address of base of array x
161:     ST  3,-308(1)	Save left side 
162:    LDA  3,-3(1)	Load address of base of array x
163:     ST  3,-309(1)	Save left side 
164:     LD  3,-303(1)	Load variable z
165:     LD  4,-309(1)	Load left into ac1 
166:    SUB  3,4,3	compute location from index 
167:     LD  3,0(3)	Load array element 
168:     LD  4,-308(1)	Load left into ac1 
169:    SUB  3,4,3	compute location from index 
170:     LD  3,0(3)	Load array element 
171:     LD  4,-307(1)	Load left into ac1 
172:    SUB  3,4,3	compute location from index 
173:     LD  3,0(3)	Load array element 
174:     LD  4,-306(1)	Load left into ac1 
175:    SUB  3,4,3	compute location from index 
176:     LD  3,0(3)	Load array element 
177:     ST  3,-306(1)	Store parameter 
*                       Jump to output
178:    LDA  1,-304(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-175(7)	CALL output
181:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
182:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
183:    LDA  1,-304(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-149(7)	CALL outnl
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
187:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
188:    LDA  3,-3(1)	Load address of base of array x
189:     ST  3,-306(1)	Save left side 
190:    LDA  3,-3(1)	Load address of base of array x
191:     ST  3,-307(1)	Save left side 
192:    LDA  3,-3(1)	Load address of base of array x
193:     ST  3,-308(1)	Save left side 
194:    LDA  3,-3(1)	Load address of base of array x
195:     ST  3,-309(1)	Save left side 
196:    LDA  3,-3(1)	Load address of base of array x
197:     ST  3,-310(1)	Save left side 
198:     LD  3,-303(1)	Load variable z
199:     LD  4,-310(1)	Load left into ac1 
200:    SUB  3,4,3	compute location from index 
201:     LD  3,0(3)	Load array element 
202:     LD  4,-309(1)	Load left into ac1 
203:    SUB  3,4,3	compute location from index 
204:     LD  3,0(3)	Load array element 
205:     LD  4,-308(1)	Load left into ac1 
206:    SUB  3,4,3	compute location from index 
207:     LD  3,0(3)	Load array element 
208:     LD  4,-307(1)	Load left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
211:     LD  4,-306(1)	Load left into ac1 
212:    SUB  3,4,3	compute location from index 
213:     LD  3,0(3)	Load array element 
214:     ST  3,-306(1)	Store parameter 
*                       Jump to output
215:    LDA  1,-304(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-212(7)	CALL output
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
219:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
220:    LDA  1,-304(1)	Load address of new frame 
221:    LDA  3,1(7)	Return address in ac 
222:    LDA  7,-186(7)	CALL outnl
223:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
224:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
225:    LDA  3,-3(1)	Load address of base of array x
226:     ST  3,-306(1)	Save left side 
227:    LDA  3,-3(1)	Load address of base of array x
228:     ST  3,-307(1)	Save left side 
229:    LDA  3,-3(1)	Load address of base of array x
230:     ST  3,-308(1)	Save left side 
231:    LDA  3,-3(1)	Load address of base of array x
232:     ST  3,-309(1)	Save left side 
233:    LDA  3,-3(1)	Load address of base of array x
234:     ST  3,-310(1)	Save left side 
235:    LDA  3,-3(1)	Load address of base of array x
236:     ST  3,-311(1)	Save left side 
237:     LD  3,-303(1)	Load variable z
238:     LD  4,-311(1)	Load left into ac1 
239:    SUB  3,4,3	compute location from index 
240:     LD  3,0(3)	Load array element 
241:     LD  4,-310(1)	Load left into ac1 
242:    SUB  3,4,3	compute location from index 
243:     LD  3,0(3)	Load array element 
244:     LD  4,-309(1)	Load left into ac1 
245:    SUB  3,4,3	compute location from index 
246:     LD  3,0(3)	Load array element 
247:     LD  4,-308(1)	Load left into ac1 
248:    SUB  3,4,3	compute location from index 
249:     LD  3,0(3)	Load array element 
250:     LD  4,-307(1)	Load left into ac1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     LD  4,-306(1)	Load left into ac1 
254:    SUB  3,4,3	compute location from index 
255:     LD  3,0(3)	Load array element 
256:     ST  3,-306(1)	Store parameter 
*                       Jump to output
257:    LDA  1,-304(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-254(7)	CALL output
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
261:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
262:    LDA  1,-304(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-228(7)	CALL outnl
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
266:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
267:    LDA  3,-3(1)	Load address of base of array x
268:     ST  3,-306(1)	Save left side 
269:    LDA  3,-3(1)	Load address of base of array x
270:     ST  3,-307(1)	Save left side 
271:    LDA  3,-3(1)	Load address of base of array x
272:     ST  3,-308(1)	Save left side 
273:    LDA  3,-3(1)	Load address of base of array x
274:     ST  3,-309(1)	Save left side 
275:    LDA  3,-3(1)	Load address of base of array x
276:     ST  3,-310(1)	Save left side 
277:    LDA  3,-3(1)	Load address of base of array x
278:     ST  3,-311(1)	Save left side 
279:    LDA  3,-3(1)	Load address of base of array x
280:     ST  3,-312(1)	Save left side 
281:     LD  3,-303(1)	Load variable z
282:     LD  4,-312(1)	Load left into ac1 
283:    SUB  3,4,3	compute location from index 
284:     LD  3,0(3)	Load array element 
285:     LD  4,-311(1)	Load left into ac1 
286:    SUB  3,4,3	compute location from index 
287:     LD  3,0(3)	Load array element 
288:     LD  4,-310(1)	Load left into ac1 
289:    SUB  3,4,3	compute location from index 
290:     LD  3,0(3)	Load array element 
291:     LD  4,-309(1)	Load left into ac1 
292:    SUB  3,4,3	compute location from index 
293:     LD  3,0(3)	Load array element 
294:     LD  4,-308(1)	Load left into ac1 
295:    SUB  3,4,3	compute location from index 
296:     LD  3,0(3)	Load array element 
297:     LD  4,-307(1)	Load left into ac1 
298:    SUB  3,4,3	compute location from index 
299:     LD  3,0(3)	Load array element 
300:     LD  4,-306(1)	Load left into ac1 
301:    SUB  3,4,3	compute location from index 
302:     LD  3,0(3)	Load array element 
303:     ST  3,-306(1)	Store parameter 
*                       Jump to output
304:    LDA  1,-304(1)	Load address of new frame 
305:    LDA  3,1(7)	Return address in ac 
306:    LDA  7,-301(7)	CALL output
307:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
308:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
309:    LDA  1,-304(1)	Load address of new frame 
310:    LDA  3,1(7)	Return address in ac 
311:    LDA  7,-275(7)	CALL outnl
312:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
313:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
314:    LDA  3,-3(1)	Load address of base of array x
315:     ST  3,-306(1)	Save left side 
316:    LDA  3,-3(1)	Load address of base of array x
317:     ST  3,-307(1)	Save left side 
318:    LDA  3,-3(1)	Load address of base of array x
319:     ST  3,-308(1)	Save left side 
320:    LDA  3,-3(1)	Load address of base of array x
321:     ST  3,-309(1)	Save left side 
322:    LDA  3,-3(1)	Load address of base of array x
323:     ST  3,-310(1)	Save left side 
324:    LDA  3,-3(1)	Load address of base of array x
325:     ST  3,-311(1)	Save left side 
326:    LDA  3,-3(1)	Load address of base of array x
327:     ST  3,-312(1)	Save left side 
328:    LDA  3,-3(1)	Load address of base of array x
329:     ST  3,-313(1)	Save left side 
330:     LD  3,-303(1)	Load variable z
331:     LD  4,-313(1)	Load left into ac1 
332:    SUB  3,4,3	compute location from index 
333:     LD  3,0(3)	Load array element 
334:     LD  4,-312(1)	Load left into ac1 
335:    SUB  3,4,3	compute location from index 
336:     LD  3,0(3)	Load array element 
337:     LD  4,-311(1)	Load left into ac1 
338:    SUB  3,4,3	compute location from index 
339:     LD  3,0(3)	Load array element 
340:     LD  4,-310(1)	Load left into ac1 
341:    SUB  3,4,3	compute location from index 
342:     LD  3,0(3)	Load array element 
343:     LD  4,-309(1)	Load left into ac1 
344:    SUB  3,4,3	compute location from index 
345:     LD  3,0(3)	Load array element 
346:     LD  4,-308(1)	Load left into ac1 
347:    SUB  3,4,3	compute location from index 
348:     LD  3,0(3)	Load array element 
349:     LD  4,-307(1)	Load left into ac1 
350:    SUB  3,4,3	compute location from index 
351:     LD  3,0(3)	Load array element 
352:     LD  4,-306(1)	Load left into ac1 
353:    SUB  3,4,3	compute location from index 
354:     LD  3,0(3)	Load array element 
355:     ST  3,-306(1)	Store parameter 
*                       Jump to output
356:    LDA  1,-304(1)	Load address of new frame 
357:    LDA  3,1(7)	Return address in ac 
358:    LDA  7,-353(7)	CALL output
359:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
360:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
361:    LDA  1,-304(1)	Load address of new frame 
362:    LDA  3,1(7)	Return address in ac 
363:    LDA  7,-327(7)	CALL outnl
364:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
365:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
366:    LDA  3,-3(1)	Load address of base of array x
367:     ST  3,-306(1)	Save left side 
368:    LDA  3,-3(1)	Load address of base of array x
369:     ST  3,-307(1)	Save left side 
370:    LDA  3,-3(1)	Load address of base of array x
371:     ST  3,-308(1)	Save left side 
372:    LDA  3,-3(1)	Load address of base of array x
373:     ST  3,-309(1)	Save left side 
374:    LDA  3,-3(1)	Load address of base of array x
375:     ST  3,-310(1)	Save left side 
376:    LDA  3,-3(1)	Load address of base of array x
377:     ST  3,-311(1)	Save left side 
378:    LDA  3,-3(1)	Load address of base of array x
379:     ST  3,-312(1)	Save left side 
380:    LDA  3,-3(1)	Load address of base of array x
381:     ST  3,-313(1)	Save left side 
382:    LDA  3,-3(1)	Load address of base of array x
383:     ST  3,-314(1)	Save left side 
384:     LD  3,-303(1)	Load variable z
385:     LD  4,-314(1)	Load left into ac1 
386:    SUB  3,4,3	compute location from index 
387:     LD  3,0(3)	Load array element 
388:     LD  4,-313(1)	Load left into ac1 
389:    SUB  3,4,3	compute location from index 
390:     LD  3,0(3)	Load array element 
391:     LD  4,-312(1)	Load left into ac1 
392:    SUB  3,4,3	compute location from index 
393:     LD  3,0(3)	Load array element 
394:     LD  4,-311(1)	Load left into ac1 
395:    SUB  3,4,3	compute location from index 
396:     LD  3,0(3)	Load array element 
397:     LD  4,-310(1)	Load left into ac1 
398:    SUB  3,4,3	compute location from index 
399:     LD  3,0(3)	Load array element 
400:     LD  4,-309(1)	Load left into ac1 
401:    SUB  3,4,3	compute location from index 
402:     LD  3,0(3)	Load array element 
403:     LD  4,-308(1)	Load left into ac1 
404:    SUB  3,4,3	compute location from index 
405:     LD  3,0(3)	Load array element 
406:     LD  4,-307(1)	Load left into ac1 
407:    SUB  3,4,3	compute location from index 
408:     LD  3,0(3)	Load array element 
409:     LD  4,-306(1)	Load left into ac1 
410:    SUB  3,4,3	compute location from index 
411:     LD  3,0(3)	Load array element 
412:     ST  3,-306(1)	Store parameter 
*                       Jump to output
413:    LDA  1,-304(1)	Load address of new frame 
414:    LDA  3,1(7)	Return address in ac 
415:    LDA  7,-410(7)	CALL output
416:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
417:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
418:    LDA  1,-304(1)	Load address of new frame 
419:    LDA  3,1(7)	Return address in ac 
420:    LDA  7,-384(7)	CALL outnl
421:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
422:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
423:    LDA  3,-3(1)	Load address of base of array x
424:     ST  3,-306(1)	Save left side 
425:    LDA  3,-3(1)	Load address of base of array x
426:     ST  3,-307(1)	Save left side 
427:    LDA  3,-3(1)	Load address of base of array x
428:     ST  3,-308(1)	Save left side 
429:    LDA  3,-3(1)	Load address of base of array x
430:     ST  3,-309(1)	Save left side 
431:    LDA  3,-3(1)	Load address of base of array x
432:     ST  3,-310(1)	Save left side 
433:    LDA  3,-3(1)	Load address of base of array x
434:     ST  3,-311(1)	Save left side 
435:    LDA  3,-3(1)	Load address of base of array x
436:     ST  3,-312(1)	Save left side 
437:    LDA  3,-3(1)	Load address of base of array x
438:     ST  3,-313(1)	Save left side 
439:    LDA  3,-3(1)	Load address of base of array x
440:     ST  3,-314(1)	Save left side 
441:    LDA  3,-3(1)	Load address of base of array x
442:     ST  3,-315(1)	Save left side 
443:     LD  3,-303(1)	Load variable z
444:     LD  4,-315(1)	Load left into ac1 
445:    SUB  3,4,3	compute location from index 
446:     LD  3,0(3)	Load array element 
447:     LD  4,-314(1)	Load left into ac1 
448:    SUB  3,4,3	compute location from index 
449:     LD  3,0(3)	Load array element 
450:     LD  4,-313(1)	Load left into ac1 
451:    SUB  3,4,3	compute location from index 
452:     LD  3,0(3)	Load array element 
453:     LD  4,-312(1)	Load left into ac1 
454:    SUB  3,4,3	compute location from index 
455:     LD  3,0(3)	Load array element 
456:     LD  4,-311(1)	Load left into ac1 
457:    SUB  3,4,3	compute location from index 
458:     LD  3,0(3)	Load array element 
459:     LD  4,-310(1)	Load left into ac1 
460:    SUB  3,4,3	compute location from index 
461:     LD  3,0(3)	Load array element 
462:     LD  4,-309(1)	Load left into ac1 
463:    SUB  3,4,3	compute location from index 
464:     LD  3,0(3)	Load array element 
465:     LD  4,-308(1)	Load left into ac1 
466:    SUB  3,4,3	compute location from index 
467:     LD  3,0(3)	Load array element 
468:     LD  4,-307(1)	Load left into ac1 
469:    SUB  3,4,3	compute location from index 
470:     LD  3,0(3)	Load array element 
471:     LD  4,-306(1)	Load left into ac1 
472:    SUB  3,4,3	compute location from index 
473:     LD  3,0(3)	Load array element 
474:     ST  3,-306(1)	Store parameter 
*                       Jump to output
475:    LDA  1,-304(1)	Load address of new frame 
476:    LDA  3,1(7)	Return address in ac 
477:    LDA  7,-472(7)	CALL output
478:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
479:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
480:    LDA  1,-304(1)	Load address of new frame 
481:    LDA  3,1(7)	Return address in ac 
482:    LDA  7,-446(7)	CALL outnl
483:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
484:    LDC  2,0(6)	Set return value to 0 
485:     LD  3,-1(1)	Load return address 
486:     LD  1,0(1)	Adjust fp 
487:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,487(7)	Jump to init [backpatch] 
* INIT
488:     LD  0,0(0)	Set the global pointer 
489:    LDA  1,0(0)	set first frame at end of globals 
490:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
491:    LDA  3,1(7)	Return address in ac 
492:    LDA  7,-451(7)	Jump to main 
493:   HALT  0,0,0	DONE! 
* END INIT
