* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  ops.c-
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
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-6(1)	Save index 
 45:    LDC  3,50(6)	Load integer constant 
 46:     LD  4,-6(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array y
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable y
* EXPRESSION
 50:    LDC  3,5(6)	Load integer constant 
 51:     ST  3,-6(1)	Save index 
 52:    LDC  3,1(6)	Load integer constant 
 53:     LD  4,-6(1)	Restore index 
 54:    LDA  5,-1(0)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable y
* EXPRESSION
 57:    LDC  3,8(6)	Load integer constant 
 58:     ST  3,-6(1)	Save index 
 59:    LDC  3,2(6)	Load integer constant 
 60:     LD  4,-6(1)	Restore index 
 61:    LDA  5,-1(0)	Load address of base of array y
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable y
* EXPRESSION
 64:    LDC  3,50(6)	Load integer constant 
 65:     ST  3,-2(1)	Store variable a
* EXPRESSION
 66:    LDC  3,1(6)	Load integer constant 
 67:     ST  3,-3(1)	Store variable b
* EXPRESSION
 68:    LDC  3,8(6)	Load integer constant 
 69:     ST  3,-4(1)	Store variable c
* EXPRESSION
 70:    LDC  3,0(6)	Load Boolean constant 
 71:     ST  3,-11(0)	Store variable x
* EXPRESSION
 72:    LDC  3,1(6)	Load Boolean constant 
 73:     ST  3,-5(1)	Store variable z
* EXPRESSION
*                       Begin call to  outputb
 74:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 75:     LD  3,-2(1)	Load variable a
 76:     ST  3,-8(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-8(1)	Load left into ac1 
 79:    TLE  3,4,3	Op <= 
 80:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 81:    LDA  1,-6(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-66(7)	CALL outputb
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 85:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,-3(1)	Load variable b
 87:     ST  3,-8(1)	Save left side 
 88:    LDC  3,50(6)	Load integer constant 
 89:     LD  4,-8(1)	Load left into ac1 
 90:    TLE  3,4,3	Op <= 
 91:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 92:    LDA  1,-6(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-77(7)	CALL outputb
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 96:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 97:    LDC  3,50(6)	Load integer constant 
 98:     ST  3,-8(1)	Save left side 
 99:    LDC  3,50(6)	Load integer constant 
100:     LD  4,-8(1)	Load left into ac1 
101:    TLE  3,4,3	Op <= 
102:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
103:    LDA  1,-6(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-88(7)	CALL outputb
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
107:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
108:    LDA  1,-6(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-74(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
112:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
113:    LDC  3,50(6)	Load integer constant 
114:     ST  3,-8(1)	Save left side 
115:    LDC  3,1(6)	Load integer constant 
116:     LD  4,-8(1)	Load left into ac1 
117:    TLT  3,4,3	Op < 
118:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
119:    LDA  1,-6(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-104(7)	CALL outputb
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
123:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
124:     LD  3,-3(1)	Load variable b
125:     ST  3,-8(1)	Save left side 
126:     LD  3,-2(1)	Load variable a
127:     LD  4,-8(1)	Load left into ac1 
128:    TLT  3,4,3	Op < 
129:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
130:    LDA  1,-6(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-115(7)	CALL outputb
133:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
134:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
135:     LD  3,-2(1)	Load variable a
136:     ST  3,-8(1)	Save left side 
137:     LD  3,-2(1)	Load variable a
138:     LD  4,-8(1)	Load left into ac1 
139:    TLT  3,4,3	Op < 
140:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
141:    LDA  1,-6(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-126(7)	CALL outputb
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
145:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
146:    LDA  1,-6(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-112(7)	CALL outnl
149:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
150:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
151:    LDC  3,50(6)	Load integer constant 
152:     ST  3,-8(1)	Save left side 
153:    LDC  3,1(6)	Load integer constant 
154:     LD  4,-8(1)	Load left into ac1 
155:    TGT  3,4,3	Op > 
156:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
157:    LDA  1,-6(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-142(7)	CALL outputb
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
161:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDC  3,1(6)	Load integer constant 
163:     ST  3,-8(1)	Save left side 
164:    LDC  3,50(6)	Load integer constant 
165:     LD  4,-8(1)	Load left into ac1 
166:    TGT  3,4,3	Op > 
167:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
168:    LDA  1,-6(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-153(7)	CALL outputb
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
172:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,50(6)	Load integer constant 
174:     ST  3,-8(1)	Save left side 
175:    LDC  3,50(6)	Load integer constant 
176:     LD  4,-8(1)	Load left into ac1 
177:    TGT  3,4,3	Op > 
178:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
179:    LDA  1,-6(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-164(7)	CALL outputb
182:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
183:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
184:    LDA  1,-6(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-150(7)	CALL outnl
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
188:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
189:    LDC  3,50(6)	Load integer constant 
190:     ST  3,-8(1)	Save left side 
191:    LDC  3,1(6)	Load integer constant 
192:     LD  4,-8(1)	Load left into ac1 
193:    TGE  3,4,3	Op >= 
194:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
195:    LDA  1,-6(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-180(7)	CALL outputb
198:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
199:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
200:    LDC  3,1(6)	Load integer constant 
201:     ST  3,-8(1)	Save left side 
202:    LDC  3,50(6)	Load integer constant 
203:     LD  4,-8(1)	Load left into ac1 
204:    TGE  3,4,3	Op >= 
205:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
206:    LDA  1,-6(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-191(7)	CALL outputb
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
210:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
211:    LDC  3,50(6)	Load integer constant 
212:     ST  3,-8(1)	Save left side 
213:    LDC  3,50(6)	Load integer constant 
214:     LD  4,-8(1)	Load left into ac1 
215:    TGE  3,4,3	Op >= 
216:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
217:    LDA  1,-6(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-202(7)	CALL outputb
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
221:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
222:    LDA  1,-6(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
226:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
227:    LDA  3,-1(0)	Load address of base of array y
228:     ST  3,-8(1)	Save left side 
229:    LDC  3,0(6)	Load integer constant 
230:     LD  4,-8(1)	Load left into ac1 
231:    SUB  3,4,3	compute location from index 
232:     LD  3,0(3)	Load array element 
233:     ST  3,-8(1)	Save left side 
234:     LD  3,-3(1)	Load variable b
235:     LD  4,-8(1)	Load left into ac1 
236:    TEQ  3,4,3	Op == 
237:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
238:    LDA  1,-6(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-223(7)	CALL outputb
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
242:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
243:     LD  3,-2(1)	Load variable a
244:     ST  3,-8(1)	Save left side 
245:     LD  3,-3(1)	Load variable b
246:     LD  4,-8(1)	Load left into ac1 
247:    TEQ  3,4,3	Op == 
248:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
249:    LDA  1,-6(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-234(7)	CALL outputb
252:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
253:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
254:     LD  3,-3(1)	Load variable b
255:     ST  3,-8(1)	Save left side 
256:     LD  3,-3(1)	Load variable b
257:     LD  4,-8(1)	Load left into ac1 
258:    TEQ  3,4,3	Op == 
259:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
260:    LDA  1,-6(1)	Load address of new frame 
261:    LDA  3,1(7)	Return address in ac 
262:    LDA  7,-245(7)	CALL outputb
263:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
264:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
265:    LDA  1,-6(1)	Load address of new frame 
266:    LDA  3,1(7)	Return address in ac 
267:    LDA  7,-231(7)	CALL outnl
268:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
269:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
270:    LDA  3,-1(0)	Load address of base of array y
271:     ST  3,-8(1)	Save left side 
272:    LDC  3,0(6)	Load integer constant 
273:     LD  4,-8(1)	Load left into ac1 
274:    SUB  3,4,3	compute location from index 
275:     LD  3,0(3)	Load array element 
276:     ST  3,-8(1)	Save left side 
277:     LD  3,-2(1)	Load variable a
278:     LD  4,-8(1)	Load left into ac1 
279:    TNE  3,4,3	Op != 
280:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
281:    LDA  1,-6(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-266(7)	CALL outputb
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
285:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
286:    LDA  3,-1(0)	Load address of base of array y
287:     ST  3,-8(1)	Save left side 
288:    LDC  3,0(6)	Load integer constant 
289:     LD  4,-8(1)	Load left into ac1 
290:    SUB  3,4,3	compute location from index 
291:     LD  3,0(3)	Load array element 
292:     ST  3,-8(1)	Save left side 
293:     LD  3,-3(1)	Load variable b
294:     LD  4,-8(1)	Load left into ac1 
295:    TNE  3,4,3	Op != 
296:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
297:    LDA  1,-6(1)	Load address of new frame 
298:    LDA  3,1(7)	Return address in ac 
299:    LDA  7,-282(7)	CALL outputb
300:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
301:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
302:     LD  3,-2(1)	Load variable a
303:     ST  3,-8(1)	Save left side 
304:     LD  3,-3(1)	Load variable b
305:     LD  4,-8(1)	Load left into ac1 
306:    TNE  3,4,3	Op != 
307:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
308:    LDA  1,-6(1)	Load address of new frame 
309:    LDA  3,1(7)	Return address in ac 
310:    LDA  7,-293(7)	CALL outputb
311:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
312:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
313:     LD  3,-3(1)	Load variable b
314:     ST  3,-8(1)	Save left side 
315:     LD  3,-3(1)	Load variable b
316:     LD  4,-8(1)	Load left into ac1 
317:    TNE  3,4,3	Op != 
318:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
319:    LDA  1,-6(1)	Load address of new frame 
320:    LDA  3,1(7)	Return address in ac 
321:    LDA  7,-304(7)	CALL outputb
322:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
323:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
324:    LDA  1,-6(1)	Load address of new frame 
325:    LDA  3,1(7)	Return address in ac 
326:    LDA  7,-290(7)	CALL outnl
327:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
328:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
329:    LDC  3,1(6)	Load Boolean constant 
330:     ST  3,-8(1)	Save left side 
331:    LDC  3,1(6)	Load Boolean constant 
332:     LD  4,-8(1)	Load left into ac1 
333:    AND  3,4,3	Op AND 
334:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
335:    LDA  1,-6(1)	Load address of new frame 
336:    LDA  3,1(7)	Return address in ac 
337:    LDA  7,-320(7)	CALL outputb
338:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
339:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
340:    LDC  3,1(6)	Load Boolean constant 
341:     ST  3,-8(1)	Save left side 
342:    LDC  3,0(6)	Load Boolean constant 
343:     LD  4,-8(1)	Load left into ac1 
344:    AND  3,4,3	Op AND 
345:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
346:    LDA  1,-6(1)	Load address of new frame 
347:    LDA  3,1(7)	Return address in ac 
348:    LDA  7,-331(7)	CALL outputb
349:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
350:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
351:    LDC  3,0(6)	Load Boolean constant 
352:     ST  3,-8(1)	Save left side 
353:    LDC  3,1(6)	Load Boolean constant 
354:     LD  4,-8(1)	Load left into ac1 
355:    AND  3,4,3	Op AND 
356:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
357:    LDA  1,-6(1)	Load address of new frame 
358:    LDA  3,1(7)	Return address in ac 
359:    LDA  7,-342(7)	CALL outputb
360:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
361:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
362:    LDC  3,0(6)	Load Boolean constant 
363:     ST  3,-8(1)	Save left side 
364:    LDC  3,0(6)	Load Boolean constant 
365:     LD  4,-8(1)	Load left into ac1 
366:    AND  3,4,3	Op AND 
367:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
368:    LDA  1,-6(1)	Load address of new frame 
369:    LDA  3,1(7)	Return address in ac 
370:    LDA  7,-353(7)	CALL outputb
371:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
372:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
373:    LDA  1,-6(1)	Load address of new frame 
374:    LDA  3,1(7)	Return address in ac 
375:    LDA  7,-339(7)	CALL outnl
376:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
377:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
378:    LDC  3,1(6)	Load Boolean constant 
379:     ST  3,-8(1)	Save left side 
380:    LDC  3,1(6)	Load Boolean constant 
381:     LD  4,-8(1)	Load left into ac1 
382:     OR  3,4,3	Op OR 
383:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
384:    LDA  1,-6(1)	Load address of new frame 
385:    LDA  3,1(7)	Return address in ac 
386:    LDA  7,-369(7)	CALL outputb
387:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
388:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
389:     LD  3,-5(1)	Load variable z
390:     ST  3,-8(1)	Save left side 
391:    LDC  3,0(6)	Load Boolean constant 
392:     LD  4,-8(1)	Load left into ac1 
393:     OR  3,4,3	Op OR 
394:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
395:    LDA  1,-6(1)	Load address of new frame 
396:    LDA  3,1(7)	Return address in ac 
397:    LDA  7,-380(7)	CALL outputb
398:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
399:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
400:    LDC  3,0(6)	Load Boolean constant 
401:     ST  3,-8(1)	Save left side 
402:    LDC  3,1(6)	Load Boolean constant 
403:     LD  4,-8(1)	Load left into ac1 
404:     OR  3,4,3	Op OR 
405:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
406:    LDA  1,-6(1)	Load address of new frame 
407:    LDA  3,1(7)	Return address in ac 
408:    LDA  7,-391(7)	CALL outputb
409:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
410:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
411:    LDC  3,0(6)	Load Boolean constant 
412:     ST  3,-8(1)	Save left side 
413:    LDC  3,0(6)	Load Boolean constant 
414:     LD  4,-8(1)	Load left into ac1 
415:     OR  3,4,3	Op OR 
416:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
417:    LDA  1,-6(1)	Load address of new frame 
418:    LDA  3,1(7)	Return address in ac 
419:    LDA  7,-402(7)	CALL outputb
420:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
421:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
422:    LDA  1,-6(1)	Load address of new frame 
423:    LDA  3,1(7)	Return address in ac 
424:    LDA  7,-388(7)	CALL outnl
425:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
426:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
427:    LDC  3,1(6)	Load Boolean constant 
428:    LDC  4,1(6)	Load 1 
429:    XOR  3,3,4	Op NOT 
430:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
431:    LDA  1,-6(1)	Load address of new frame 
432:    LDA  3,1(7)	Return address in ac 
433:    LDA  7,-416(7)	CALL outputb
434:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
435:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
436:     LD  3,-11(0)	Load variable x
437:    LDC  4,1(6)	Load 1 
438:    XOR  3,3,4	Op NOT 
439:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
440:    LDA  1,-6(1)	Load address of new frame 
441:    LDA  3,1(7)	Return address in ac 
442:    LDA  7,-425(7)	CALL outputb
443:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
444:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
445:    LDA  1,-6(1)	Load address of new frame 
446:    LDA  3,1(7)	Return address in ac 
447:    LDA  7,-411(7)	CALL outnl
448:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
449:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
450:    LDC  3,5(6)	Load integer constant 
451:     ST  3,-8(1)	Save left side 
452:    LDC  3,50(6)	Load integer constant 
453:     LD  4,-8(1)	Load left into ac1 
454:    ADD  3,4,3	Op + 
455:     ST  3,-8(1)	Store parameter 
*                       Jump to output
456:    LDA  1,-6(1)	Load address of new frame 
457:    LDA  3,1(7)	Return address in ac 
458:    LDA  7,-453(7)	CALL output
459:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
460:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
461:    LDA  3,-1(0)	Load address of base of array y
462:     ST  3,-8(1)	Save left side 
463:     LD  3,-4(1)	Load variable c
464:     LD  4,-8(1)	Load left into ac1 
465:    SUB  3,4,3	compute location from index 
466:     LD  3,0(3)	Load array element 
467:     ST  3,-8(1)	Save left side 
468:    LDC  3,50(6)	Load integer constant 
469:     LD  4,-8(1)	Load left into ac1 
470:    ADD  3,4,3	Op + 
471:     ST  3,-8(1)	Store parameter 
*                       Jump to output
472:    LDA  1,-6(1)	Load address of new frame 
473:    LDA  3,1(7)	Return address in ac 
474:    LDA  7,-469(7)	CALL output
475:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
476:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
477:    LDA  1,-6(1)	Load address of new frame 
478:    LDA  3,1(7)	Return address in ac 
479:    LDA  7,-443(7)	CALL outnl
480:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
481:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
482:    LDC  3,5(6)	Load integer constant 
483:     ST  3,-8(1)	Save left side 
484:    LDC  3,50(6)	Load integer constant 
485:     LD  4,-8(1)	Load left into ac1 
486:    SUB  3,4,3	Op - 
487:     ST  3,-8(1)	Store parameter 
*                       Jump to output
488:    LDA  1,-6(1)	Load address of new frame 
489:    LDA  3,1(7)	Return address in ac 
490:    LDA  7,-485(7)	CALL output
491:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
492:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
493:    LDC  3,30(6)	Load integer constant 
494:     ST  3,-8(1)	Save left side 
495:    LDC  3,5(6)	Load integer constant 
496:     LD  4,-8(1)	Load left into ac1 
497:    SUB  3,4,3	Op - 
498:     ST  3,-8(1)	Save left side 
499:    LDC  3,50(6)	Load integer constant 
500:     LD  4,-8(1)	Load left into ac1 
501:    SUB  3,4,3	Op - 
502:     ST  3,-8(1)	Store parameter 
*                       Jump to output
503:    LDA  1,-6(1)	Load address of new frame 
504:    LDA  3,1(7)	Return address in ac 
505:    LDA  7,-500(7)	CALL output
506:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
507:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
508:    LDA  1,-6(1)	Load address of new frame 
509:    LDA  3,1(7)	Return address in ac 
510:    LDA  7,-474(7)	CALL outnl
511:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
512:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
513:     LD  3,-2(1)	Load variable a
514:    LDC  4,0(6)	Load 0 
515:    SUB  3,4,3	Op unary - 
516:     ST  3,-8(1)	Store parameter 
*                       Jump to output
517:    LDA  1,-6(1)	Load address of new frame 
518:    LDA  3,1(7)	Return address in ac 
519:    LDA  7,-514(7)	CALL output
520:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
521:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
522:    LDC  3,0(6)	Load integer constant 
523:    LDC  4,0(6)	Load 0 
524:    SUB  3,4,3	Op unary - 
525:     ST  3,-8(1)	Store parameter 
*                       Jump to output
526:    LDA  1,-6(1)	Load address of new frame 
527:    LDA  3,1(7)	Return address in ac 
528:    LDA  7,-523(7)	CALL output
529:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
530:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
531:    LDC  3,1(6)	Load integer constant 
532:    LDC  4,0(6)	Load 0 
533:    SUB  3,4,3	Op unary - 
534:     ST  3,-8(1)	Store parameter 
*                       Jump to output
535:    LDA  1,-6(1)	Load address of new frame 
536:    LDA  3,1(7)	Return address in ac 
537:    LDA  7,-532(7)	CALL output
538:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
539:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
540:    LDA  1,-6(1)	Load address of new frame 
541:    LDA  3,1(7)	Return address in ac 
542:    LDA  7,-506(7)	CALL outnl
543:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
544:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
545:    LDC  3,2(6)	Load integer constant 
546:     ST  3,-8(1)	Save left side 
547:    LDC  3,3(6)	Load integer constant 
548:     LD  4,-8(1)	Load left into ac1 
549:    MUL  3,4,3	Op * 
550:     ST  3,-8(1)	Save left side 
551:    LDC  3,5(6)	Load integer constant 
552:     LD  4,-8(1)	Load left into ac1 
553:    MUL  3,4,3	Op * 
554:     ST  3,-8(1)	Save left side 
555:    LDC  3,7(6)	Load integer constant 
556:     LD  4,-8(1)	Load left into ac1 
557:    MUL  3,4,3	Op * 
558:     ST  3,-8(1)	Save left side 
559:    LDC  3,11(6)	Load integer constant 
560:     LD  4,-8(1)	Load left into ac1 
561:    MUL  3,4,3	Op * 
562:     ST  3,-8(1)	Store parameter 
*                       Jump to output
563:    LDA  1,-6(1)	Load address of new frame 
564:    LDA  3,1(7)	Return address in ac 
565:    LDA  7,-560(7)	CALL output
566:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
567:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
568:    LDC  3,50(6)	Load integer constant 
569:     ST  3,-8(1)	Save left side 
570:    LDA  3,-1(0)	Load address of base of array y
571:     ST  3,-9(1)	Save left side 
572:    LDC  3,8(6)	Load integer constant 
573:     LD  4,-9(1)	Load left into ac1 
574:    SUB  3,4,3	compute location from index 
575:     LD  3,0(3)	Load array element 
576:     LD  4,-8(1)	Load left into ac1 
577:    MUL  3,4,3	Op * 
578:     ST  3,-8(1)	Store parameter 
*                       Jump to output
579:    LDA  1,-6(1)	Load address of new frame 
580:    LDA  3,1(7)	Return address in ac 
581:    LDA  7,-576(7)	CALL output
582:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
583:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
584:    LDA  3,-1(0)	Load address of base of array y
585:     ST  3,-8(1)	Save left side 
586:    LDC  3,8(6)	Load integer constant 
587:     LD  4,-8(1)	Load left into ac1 
588:    SUB  3,4,3	compute location from index 
589:     LD  3,0(3)	Load array element 
590:     ST  3,-8(1)	Save left side 
591:    LDC  3,50(6)	Load integer constant 
592:     LD  4,-8(1)	Load left into ac1 
593:    MUL  3,4,3	Op * 
594:     ST  3,-8(1)	Store parameter 
*                       Jump to output
595:    LDA  1,-6(1)	Load address of new frame 
596:    LDA  3,1(7)	Return address in ac 
597:    LDA  7,-592(7)	CALL output
598:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
599:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
600:    LDA  1,-6(1)	Load address of new frame 
601:    LDA  3,1(7)	Return address in ac 
602:    LDA  7,-566(7)	CALL outnl
603:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
604:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
605:    LDC  3,50(6)	Load integer constant 
606:     ST  3,-8(1)	Save left side 
607:    LDA  3,-1(0)	Load address of base of array y
608:     ST  3,-9(1)	Save left side 
609:    LDC  3,8(6)	Load integer constant 
610:     LD  4,-9(1)	Load left into ac1 
611:    SUB  3,4,3	compute location from index 
612:     LD  3,0(3)	Load array element 
613:     LD  4,-8(1)	Load left into ac1 
614:    DIV  3,4,3	Op / 
615:     ST  3,-8(1)	Store parameter 
*                       Jump to output
616:    LDA  1,-6(1)	Load address of new frame 
617:    LDA  3,1(7)	Return address in ac 
618:    LDA  7,-613(7)	CALL output
619:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
620:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
621:    LDA  3,-1(0)	Load address of base of array y
622:     ST  3,-8(1)	Save left side 
623:    LDC  3,8(6)	Load integer constant 
624:     LD  4,-8(1)	Load left into ac1 
625:    SUB  3,4,3	compute location from index 
626:     LD  3,0(3)	Load array element 
627:     ST  3,-8(1)	Save left side 
628:    LDC  3,50(6)	Load integer constant 
629:     LD  4,-8(1)	Load left into ac1 
630:    DIV  3,4,3	Op / 
631:     ST  3,-8(1)	Store parameter 
*                       Jump to output
632:    LDA  1,-6(1)	Load address of new frame 
633:    LDA  3,1(7)	Return address in ac 
634:    LDA  7,-629(7)	CALL output
635:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
636:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
637:    LDA  3,-1(0)	Load address of base of array y
638:     ST  3,-8(1)	Save left side 
639:    LDC  3,8(6)	Load integer constant 
640:     LD  4,-8(1)	Load left into ac1 
641:    SUB  3,4,3	compute location from index 
642:     LD  3,0(3)	Load array element 
643:     ST  3,-8(1)	Save left side 
644:     LD  3,-3(1)	Load variable b
645:     LD  4,-8(1)	Load left into ac1 
646:    DIV  3,4,3	Op / 
647:     ST  3,-8(1)	Store parameter 
*                       Jump to output
648:    LDA  1,-6(1)	Load address of new frame 
649:    LDA  3,1(7)	Return address in ac 
650:    LDA  7,-645(7)	CALL output
651:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
652:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
653:    LDC  3,210(6)	Load integer constant 
654:     ST  3,-8(1)	Save left side 
655:    LDC  3,7(6)	Load integer constant 
656:     LD  4,-8(1)	Load left into ac1 
657:    DIV  3,4,3	Op / 
658:     ST  3,-8(1)	Save left side 
659:    LDC  3,3(6)	Load integer constant 
660:     LD  4,-8(1)	Load left into ac1 
661:    DIV  3,4,3	Op / 
662:     ST  3,-8(1)	Store parameter 
*                       Jump to output
663:    LDA  1,-6(1)	Load address of new frame 
664:    LDA  3,1(7)	Return address in ac 
665:    LDA  7,-660(7)	CALL output
666:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
667:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
668:    LDA  1,-6(1)	Load address of new frame 
669:    LDA  3,1(7)	Return address in ac 
670:    LDA  7,-634(7)	CALL outnl
671:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
672:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
673:    LDC  3,211(6)	Load integer constant 
674:     ST  3,-8(1)	Save left side 
675:    LDC  3,7(6)	Load integer constant 
676:     LD  4,-8(1)	Load left into ac1 
677:    DIV  5,4,3	Op % 
678:    MUL  5,5,3	 
679:    SUB  3,4,5	 
680:     ST  3,-8(1)	Store parameter 
*                       Jump to output
681:    LDA  1,-6(1)	Load address of new frame 
682:    LDA  3,1(7)	Return address in ac 
683:    LDA  7,-678(7)	CALL output
684:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
685:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
686:    LDC  3,211(6)	Load integer constant 
687:     ST  3,-8(1)	Save left side 
688:    LDC  3,6(6)	Load integer constant 
689:     LD  4,-8(1)	Load left into ac1 
690:    DIV  5,4,3	Op % 
691:    MUL  5,5,3	 
692:    SUB  3,4,5	 
693:     ST  3,-8(1)	Store parameter 
*                       Jump to output
694:    LDA  1,-6(1)	Load address of new frame 
695:    LDA  3,1(7)	Return address in ac 
696:    LDA  7,-691(7)	CALL output
697:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
698:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
699:    LDC  3,211(6)	Load integer constant 
700:     ST  3,-8(1)	Save left side 
701:    LDC  3,5(6)	Load integer constant 
702:     LD  4,-8(1)	Load left into ac1 
703:    DIV  5,4,3	Op % 
704:    MUL  5,5,3	 
705:    SUB  3,4,5	 
706:     ST  3,-8(1)	Store parameter 
*                       Jump to output
707:    LDA  1,-6(1)	Load address of new frame 
708:    LDA  3,1(7)	Return address in ac 
709:    LDA  7,-704(7)	CALL output
710:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
711:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
712:    LDC  3,211(6)	Load integer constant 
713:     ST  3,-8(1)	Save left side 
714:    LDC  3,4(6)	Load integer constant 
715:     LD  4,-8(1)	Load left into ac1 
716:    DIV  5,4,3	Op % 
717:    MUL  5,5,3	 
718:    SUB  3,4,5	 
719:     ST  3,-8(1)	Store parameter 
*                       Jump to output
720:    LDA  1,-6(1)	Load address of new frame 
721:    LDA  3,1(7)	Return address in ac 
722:    LDA  7,-717(7)	CALL output
723:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
724:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
725:    LDC  3,211(6)	Load integer constant 
726:     ST  3,-8(1)	Save left side 
727:    LDC  3,100(6)	Load integer constant 
728:     LD  4,-8(1)	Load left into ac1 
729:    DIV  5,4,3	Op % 
730:    MUL  5,5,3	 
731:    SUB  3,4,5	 
732:     ST  3,-8(1)	Save left side 
733:    LDC  3,3(6)	Load integer constant 
734:     LD  4,-8(1)	Load left into ac1 
735:    DIV  5,4,3	Op % 
736:    MUL  5,5,3	 
737:    SUB  3,4,5	 
738:     ST  3,-8(1)	Store parameter 
*                       Jump to output
739:    LDA  1,-6(1)	Load address of new frame 
740:    LDA  3,1(7)	Return address in ac 
741:    LDA  7,-736(7)	CALL output
742:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
743:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
744:    LDA  1,-6(1)	Load address of new frame 
745:    LDA  3,1(7)	Return address in ac 
746:    LDA  7,-710(7)	CALL outnl
747:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
748:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
749:    LDC  3,43(6)	Load integer constant 
750:     ST  3,-4(1)	Store variable c
751:     ST  3,-3(1)	Store variable b
752:     ST  3,-2(1)	Store variable a
753:     ST  3,-8(1)	Store parameter 
*                       Jump to output
754:    LDA  1,-6(1)	Load address of new frame 
755:    LDA  3,1(7)	Return address in ac 
756:    LDA  7,-751(7)	CALL output
757:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
758:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
759:     LD  3,-2(1)	Load variable a
760:     ST  3,-8(1)	Store parameter 
*                       Jump to output
761:    LDA  1,-6(1)	Load address of new frame 
762:    LDA  3,1(7)	Return address in ac 
763:    LDA  7,-758(7)	CALL output
764:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
765:    LDC  3,3(6)	Load integer constant 
766:     ST  3,-3(1)	Store variable b
767:     ST  3,-6(1)	Save left side 
768:    LDC  3,4(6)	Load integer constant 
769:     ST  3,-4(1)	Store variable c
770:     LD  4,-6(1)	Load left into ac1 
771:    MUL  3,4,3	Op * 
772:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
773:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
774:     LD  3,-2(1)	Load variable a
775:     ST  3,-8(1)	Store parameter 
*                       Jump to output
776:    LDA  1,-6(1)	Load address of new frame 
777:    LDA  3,1(7)	Return address in ac 
778:    LDA  7,-773(7)	CALL output
779:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
780:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
781:    LDA  1,-6(1)	Load address of new frame 
782:    LDA  3,1(7)	Return address in ac 
783:    LDA  7,-747(7)	CALL outnl
784:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
785:    LDC  3,44(6)	Load integer constant 
786:     ST  3,-2(1)	Store variable a
* EXPRESSION
787:    LDC  3,2(6)	Load integer constant 
788:     ST  3,-3(1)	Store variable b
* EXPRESSION
*                       Begin call to  output
789:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
790:     LD  3,-3(1)	Load variable b
791:     LD  4,-2(1)	load lhs variable a
792:    ADD  3,4,3	op += 
793:     ST  3,-2(1)	Store variable a
794:     ST  3,-8(1)	Store parameter 
*                       Jump to output
795:    LDA  1,-6(1)	Load address of new frame 
796:    LDA  3,1(7)	Return address in ac 
797:    LDA  7,-792(7)	CALL output
798:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
799:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
800:     LD  3,-3(1)	Load variable b
801:     LD  4,-2(1)	load lhs variable a
802:    SUB  3,4,3	op -= 
803:     ST  3,-2(1)	Store variable a
804:     ST  3,-8(1)	Store parameter 
*                       Jump to output
805:    LDA  1,-6(1)	Load address of new frame 
806:    LDA  3,1(7)	Return address in ac 
807:    LDA  7,-802(7)	CALL output
808:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
809:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
810:     LD  3,-2(1)	Load variable a
811:     LD  4,-2(1)	load lhs variable a
812:    SUB  3,4,3	op -= 
813:     ST  3,-2(1)	Store variable a
814:     ST  3,-8(1)	Store parameter 
*                       Jump to output
815:    LDA  1,-6(1)	Load address of new frame 
816:    LDA  3,1(7)	Return address in ac 
817:    LDA  7,-812(7)	CALL output
818:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
819:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
820:    LDC  3,10(6)	Load integer constant 
821:     LD  4,-3(1)	load lhs variable b
822:    ADD  3,4,3	op += 
823:     ST  3,-3(1)	Store variable b
824:     LD  4,-2(1)	load lhs variable a
825:    ADD  3,4,3	op += 
826:     ST  3,-2(1)	Store variable a
827:     ST  3,-8(1)	Store parameter 
*                       Jump to output
828:    LDA  1,-6(1)	Load address of new frame 
829:    LDA  3,1(7)	Return address in ac 
830:    LDA  7,-825(7)	CALL output
831:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
832:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
833:    LDA  1,-6(1)	Load address of new frame 
834:    LDA  3,1(7)	Return address in ac 
835:    LDA  7,-799(7)	CALL outnl
836:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
837:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
838:    LDC  3,3(6)	Load integer constant 
839:     ST  3,-8(1)	Save left side 
840:    LDC  3,4(6)	Load integer constant 
841:     LD  4,-8(1)	Load left into ac1 
842:    SUB  3,4,3	Op - 
843:     ST  3,-8(1)	Save left side 
844:    LDC  3,5(6)	Load integer constant 
845:     LD  4,-8(1)	Load left into ac1 
846:    SUB  3,4,3	Op - 
847:     ST  3,-8(1)	Store parameter 
*                       Jump to output
848:    LDA  1,-6(1)	Load address of new frame 
849:    LDA  3,1(7)	Return address in ac 
850:    LDA  7,-845(7)	CALL output
851:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
852:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
853:    LDC  3,211(6)	Load integer constant 
854:     ST  3,-8(1)	Save left side 
855:    LDC  3,17(6)	Load integer constant 
856:     LD  4,-8(1)	Load left into ac1 
857:    DIV  3,4,3	Op / 
858:     ST  3,-8(1)	Save left side 
859:    LDC  3,5(6)	Load integer constant 
860:     LD  4,-8(1)	Load left into ac1 
861:    DIV  3,4,3	Op / 
862:     ST  3,-8(1)	Store parameter 
*                       Jump to output
863:    LDA  1,-6(1)	Load address of new frame 
864:    LDA  3,1(7)	Return address in ac 
865:    LDA  7,-860(7)	CALL output
866:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
867:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
868:    LDC  3,211(6)	Load integer constant 
869:     ST  3,-8(1)	Save left side 
870:    LDC  3,17(6)	Load integer constant 
871:     ST  3,-9(1)	Save left side 
872:    LDC  3,5(6)	Load integer constant 
873:     LD  4,-9(1)	Load left into ac1 
874:    DIV  3,4,3	Op / 
875:     LD  4,-8(1)	Load left into ac1 
876:    DIV  3,4,3	Op / 
877:     ST  3,-8(1)	Store parameter 
*                       Jump to output
878:    LDA  1,-6(1)	Load address of new frame 
879:    LDA  3,1(7)	Return address in ac 
880:    LDA  7,-875(7)	CALL output
881:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
882:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
883:    LDC  3,1(6)	Load Boolean constant 
884:     ST  3,-8(1)	Save left side 
885:    LDC  3,0(6)	Load Boolean constant 
886:     LD  4,-8(1)	Load left into ac1 
887:     OR  3,4,3	Op OR 
888:     ST  3,-8(1)	Save left side 
889:    LDC  3,0(6)	Load Boolean constant 
890:     LD  4,-8(1)	Load left into ac1 
891:    AND  3,4,3	Op AND 
892:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
893:    LDA  1,-6(1)	Load address of new frame 
894:    LDA  3,1(7)	Return address in ac 
895:    LDA  7,-878(7)	CALL outputb
896:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
897:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
898:    LDC  3,1(6)	Load Boolean constant 
899:     ST  3,-8(1)	Save left side 
900:    LDC  3,0(6)	Load Boolean constant 
901:     ST  3,-9(1)	Save left side 
902:    LDC  3,0(6)	Load Boolean constant 
903:     LD  4,-9(1)	Load left into ac1 
904:    AND  3,4,3	Op AND 
905:     LD  4,-8(1)	Load left into ac1 
906:     OR  3,4,3	Op OR 
907:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
908:    LDA  1,-6(1)	Load address of new frame 
909:    LDA  3,1(7)	Return address in ac 
910:    LDA  7,-893(7)	CALL outputb
911:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
912:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
913:    LDC  3,1(6)	Load Boolean constant 
914:     ST  3,-8(1)	Save left side 
915:    LDC  3,0(6)	Load Boolean constant 
916:     ST  3,-9(1)	Save left side 
917:    LDC  3,0(6)	Load Boolean constant 
918:     LD  4,-9(1)	Load left into ac1 
919:    AND  3,4,3	Op AND 
920:     LD  4,-8(1)	Load left into ac1 
921:     OR  3,4,3	Op OR 
922:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
923:    LDA  1,-6(1)	Load address of new frame 
924:    LDA  3,1(7)	Return address in ac 
925:    LDA  7,-908(7)	CALL outputb
926:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
927:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
928:    LDA  1,-6(1)	Load address of new frame 
929:    LDA  3,1(7)	Return address in ac 
930:    LDA  7,-894(7)	CALL outnl
931:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
932:    LDC  2,0(6)	Set return value to 0 
933:     LD  3,-1(1)	Load return address 
934:     LD  1,0(1)	Adjust fp 
935:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,935(7)	Jump to init [backpatch] 
* INIT
936:     LD  0,0(0)	Set the global pointer 
937:    LDA  1,-12(0)	set first frame at end of globals 
938:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
939:    LDC  3,10(6)	load size of array y
940:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
941:    LDA  3,1(7)	Return address in ac 
942:    LDA  7,-901(7)	Jump to main 
943:   HALT  0,0,0	DONE! 
* END INIT
