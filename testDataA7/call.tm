* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  call.c-
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
* FUNCTION showInt
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-3(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 50:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-17(7)	CALL outnl
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6)	Set return value to 0 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    LDA  7,0(3)	Return 
* END FUNCTION showInt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showIntArray
 59:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 60:    LDC  3,0(6)	Load integer constant 
 61:     ST  3,-4(1)	Store variable i
* WHILE
 62:     LD  3,-4(1)	Load variable i
 63:     ST  3,-5(1)	Save left side 
 64:     LD  3,-3(1)	Load variable size
 65:     LD  4,-5(1)	Load left into ac1 
 66:    TLT  3,4,3	Op < 
 67:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-2(1)	Load address of base of array x
 71:     ST  3,-7(1)	Save left side 
 72:     LD  3,-4(1)	Load variable i
 73:     LD  4,-7(1)	Load left into ac1 
 74:    SUB  3,4,3	compute location from index 
 75:     LD  3,0(3)	Load array element 
 76:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 77:    LDA  1,-5(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 81:     LD  3,-4(1)	Load variable i
 82:     ST  3,-5(1)	Save left side 
 83:    LDC  3,1(6)	Load integer constant 
 84:     LD  4,-5(1)	Load left into ac1 
 85:    ADD  3,4,3	Op + 
 86:     ST  3,-4(1)	Store variable i
* END COMPOUND
 87:    LDA  7,-26(7)	go to beginning of loop 
 68:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 88:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 89:    LDA  1,-5(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-55(7)	CALL outnl
 92:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    LDA  7,0(3)	Return 
* END FUNCTION showIntArray
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showBool
 97:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
 98:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 99:     LD  3,-2(1)	Load variable x
100:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
101:    LDA  1,-3(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-86(7)	CALL outputb
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
105:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
106:    LDA  1,-3(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-72(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* END FUNCTION showBool
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION truth
114:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
115:    LDC  3,1(6)	Load Boolean constant 
116:    LDA  2,0(3)	Copy result to rt register 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    LDA  7,0(3)	Return 
* END FUNCTION truth
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION magic
124:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
125:    LDC  3,666(6)	Load integer constant 
126:    LDA  2,0(3)	Copy result to rt register 
127:     LD  3,-1(1)	Load return address 
128:     LD  1,0(1)	Adjust fp 
129:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
130:    LDC  2,0(6)	Set return value to 0 
131:     LD  3,-1(1)	Load return address 
132:     LD  1,0(1)	Adjust fp 
133:    LDA  7,0(3)	Return 
* END FUNCTION magic
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sqr
134:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
135:     LD  3,-2(1)	Load variable x
136:     ST  3,-3(1)	Save left side 
137:     LD  3,-2(1)	Load variable x
138:     LD  4,-3(1)	Load left into ac1 
139:    MUL  3,4,3	Op * 
140:    LDA  2,0(3)	Copy result to rt register 
141:     LD  3,-1(1)	Load return address 
142:     LD  1,0(1)	Adjust fp 
143:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust fp 
147:    LDA  7,0(3)	Return 
* END FUNCTION sqr
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION add
148:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
149:     LD  3,-2(1)	Load variable x
150:     ST  3,-4(1)	Save left side 
151:     LD  3,-3(1)	Load variable y
152:     LD  4,-4(1)	Load left into ac1 
153:    ADD  3,4,3	Op + 
154:    LDA  2,0(3)	Copy result to rt register 
155:     LD  3,-1(1)	Load return address 
156:     LD  1,0(1)	Adjust fp 
157:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
158:    LDC  2,0(6)	Set return value to 0 
159:     LD  3,-1(1)	Load return address 
160:     LD  1,0(1)	Adjust fp 
161:    LDA  7,0(3)	Return 
* END FUNCTION add
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION mul
162:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
163:     LD  3,-2(1)	Load variable x
164:     ST  3,-4(1)	Save left side 
165:     LD  3,-3(1)	Load variable y
166:     LD  4,-4(1)	Load left into ac1 
167:    MUL  3,4,3	Op * 
168:    LDA  2,0(3)	Copy result to rt register 
169:     LD  3,-1(1)	Load return address 
170:     LD  1,0(1)	Adjust fp 
171:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
172:    LDC  2,0(6)	Set return value to 0 
173:     LD  3,-1(1)	Load return address 
174:     LD  1,0(1)	Adjust fp 
175:    LDA  7,0(3)	Return 
* END FUNCTION mul
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION caller
176:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
177:    LDC  3,666(6)	Load integer constant 
178:     ST  3,-5(1)	Store variable a
* EXPRESSION
179:    LDC  3,777(6)	Load integer constant 
180:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  sqr
181:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
182:     LD  3,-2(1)	Load variable x
183:     ST  3,-8(1)	Store parameter 
*                       Jump to sqr
184:    LDA  1,-6(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-53(7)	CALL sqr
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqr
188:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
189:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
190:     LD  3,-4(1)	Load variable z
191:     ST  3,-8(1)	Store parameter 
*                       Jump to output
192:    LDA  1,-6(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
196:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
197:    LDA  1,-6(1)	Load address of new frame 
198:    LDA  3,1(7)	Return address in ac 
199:    LDA  7,-163(7)	CALL outnl
200:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  sqr
201:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
202:     LD  3,-3(1)	Load address of base of array y
203:     ST  3,-8(1)	Save left side 
204:    LDC  3,7(6)	Load integer constant 
205:     LD  4,-8(1)	Load left into ac1 
206:    SUB  3,4,3	compute location from index 
207:     LD  3,0(3)	Load array element 
208:     ST  3,-8(1)	Store parameter 
*                       Jump to sqr
209:    LDA  1,-6(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-78(7)	CALL sqr
212:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqr
213:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
214:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
215:     LD  3,-4(1)	Load variable z
216:     ST  3,-8(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-6(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
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
*                       Begin call to  sqr
226:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
227:     LD  3,-5(1)	Load variable a
228:     ST  3,-8(1)	Store parameter 
*                       Jump to sqr
229:    LDA  1,-6(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-98(7)	CALL sqr
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqr
233:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
234:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
235:     LD  3,-4(1)	Load variable z
236:     ST  3,-8(1)	Store parameter 
*                       Jump to output
237:    LDA  1,-6(1)	Load address of new frame 
238:    LDA  3,1(7)	Return address in ac 
239:    LDA  7,-234(7)	CALL output
240:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
241:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
242:    LDA  1,-6(1)	Load address of new frame 
243:    LDA  3,1(7)	Return address in ac 
244:    LDA  7,-208(7)	CALL outnl
245:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  sqr
246:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
247:     LD  3,0(0)	Load variable g
248:     ST  3,-8(1)	Store parameter 
*                       Jump to sqr
249:    LDA  1,-6(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-118(7)	CALL sqr
252:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqr
253:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
254:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
255:     LD  3,-4(1)	Load variable z
256:     ST  3,-8(1)	Store parameter 
*                       Jump to output
257:    LDA  1,-6(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-254(7)	CALL output
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
261:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
262:    LDA  1,-6(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-228(7)	CALL outnl
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
266:    LDC  2,0(6)	Set return value to 0 
267:     LD  3,-1(1)	Load return address 
268:     LD  1,0(1)	Adjust fp 
269:    LDA  7,0(3)	Return 
* END FUNCTION caller
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION swap
270:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
271:     LD  3,-2(1)	Load address of base of array x
272:     ST  3,-6(1)	Save left side 
273:     LD  3,-3(1)	Load variable z1
274:     LD  4,-6(1)	Load left into ac1 
275:    SUB  3,4,3	compute location from index 
276:     LD  3,0(3)	Load array element 
277:     ST  3,-5(1)	Store variable tmp
* EXPRESSION
278:     LD  3,-3(1)	Load variable z1
279:     ST  3,-6(1)	Save index 
280:     LD  3,-2(1)	Load address of base of array x
281:     ST  3,-7(1)	Save left side 
282:     LD  3,-4(1)	Load variable z2
283:     LD  4,-7(1)	Load left into ac1 
284:    SUB  3,4,3	compute location from index 
285:     LD  3,0(3)	Load array element 
286:     LD  4,-6(1)	Restore index 
287:     LD  5,-2(1)	Load address of base of array x
288:    SUB  5,5,4	Compute offset of value 
289:     ST  3,0(5)	Store variable x
* EXPRESSION
290:     LD  3,-4(1)	Load variable z2
291:     ST  3,-6(1)	Save index 
292:     LD  3,-5(1)	Load variable tmp
293:     LD  4,-6(1)	Restore index 
294:     LD  5,-2(1)	Load address of base of array x
295:    SUB  5,5,4	Compute offset of value 
296:     ST  3,0(5)	Store variable x
* END COMPOUND
* Add standard closing in case there is no return statement
297:    LDC  2,0(6)	Set return value to 0 
298:     LD  3,-1(1)	Load return address 
299:     LD  1,0(1)	Adjust fp 
300:    LDA  7,0(3)	Return 
* END FUNCTION swap
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
301:     ST  3,-1(1)	Store return address. 
* COMPOUND
302:    LDC  3,10(6)	load size of array r
303:     ST  3,-4(1)	save size of array r
304:    LDC  3,10(6)	load size of array s
305:     ST  3,-15(1)	save size of array s
* Compound Body
* EXPRESSION
306:    LDC  3,0(6)	Load integer constant 
307:     ST  3,-2(1)	Store variable p
* WHILE
308:     LD  3,-2(1)	Load variable p
309:     ST  3,-26(1)	Save left side 
310:    LDC  3,10(6)	Load integer constant 
311:     LD  4,-26(1)	Load left into ac1 
312:    TLT  3,4,3	Op < 
313:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
315:     LD  3,-2(1)	Load variable p
316:     ST  3,-26(1)	Save index 
317:     LD  3,-2(1)	Load variable p
318:     LD  4,-26(1)	Restore index 
319:    LDA  5,-5(1)	Load address of base of array r
320:    SUB  5,5,4	Compute offset of value 
321:     ST  3,0(5)	Store variable r
* EXPRESSION
322:     LD  3,-2(1)	load lhs variable p
323:    LDA  3,1(3)	increment value of p
324:     ST  3,-2(1)	Store variable p
* END COMPOUND
325:    LDA  7,-18(7)	go to beginning of loop 
314:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
326:    LDC  3,111(6)	Load integer constant 
327:     ST  3,-2(1)	Store variable p
* EXPRESSION
328:    LDC  3,222(6)	Load integer constant 
329:     ST  3,-3(1)	Store variable q
* EXPRESSION
330:    LDC  3,7(6)	Load integer constant 
331:     ST  3,-26(1)	Save index 
332:    LDC  3,333(6)	Load integer constant 
333:     LD  4,-26(1)	Restore index 
334:    LDA  5,-5(1)	Load address of base of array r
335:    SUB  5,5,4	Compute offset of value 
336:     ST  3,0(5)	Store variable r
* EXPRESSION
337:    LDC  3,7(6)	Load integer constant 
338:     ST  3,-26(1)	Save index 
339:    LDC  3,444(6)	Load integer constant 
340:     LD  4,-26(1)	Restore index 
341:    LDA  5,-16(1)	Load address of base of array s
342:    SUB  5,5,4	Compute offset of value 
343:     ST  3,0(5)	Store variable s
* EXPRESSION
*                       Begin call to  showInt
344:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
345:     LD  3,-2(1)	Load variable p
346:     ST  3,-28(1)	Store parameter 
*                       Jump to showInt
347:    LDA  1,-26(1)	Load address of new frame 
348:    LDA  3,1(7)	Return address in ac 
349:    LDA  7,-308(7)	CALL showInt
350:    LDA  3,0(2)	Save the result in ac 
*                       End call to showInt
* EXPRESSION
*                       Begin call to  showIntArray
351:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
352:    LDA  3,-5(1)	Load address of base of array r
353:     ST  3,-28(1)	Store parameter 
*                       Load param 2
354:    LDC  3,10(6)	Load integer constant 
355:     ST  3,-29(1)	Store parameter 
*                       Jump to showIntArray
356:    LDA  1,-26(1)	Load address of new frame 
357:    LDA  3,1(7)	Return address in ac 
358:    LDA  7,-300(7)	CALL showIntArray
359:    LDA  3,0(2)	Save the result in ac 
*                       End call to showIntArray
* EXPRESSION
*                       Begin call to  showBool
360:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  truth
361:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Jump to truth
362:    LDA  1,-28(1)	Load address of new frame 
363:    LDA  3,1(7)	Return address in ac 
364:    LDA  7,-251(7)	CALL truth
365:    LDA  3,0(2)	Save the result in ac 
*                       End call to truth
366:     ST  3,-28(1)	Store parameter 
*                       Jump to showBool
367:    LDA  1,-26(1)	Load address of new frame 
368:    LDA  3,1(7)	Return address in ac 
369:    LDA  7,-273(7)	CALL showBool
370:    LDA  3,0(2)	Save the result in ac 
*                       End call to showBool
* EXPRESSION
*                       Begin call to  output
371:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  showInt
372:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
373:     LD  3,-2(1)	Load variable p
374:     ST  3,-30(1)	Store parameter 
*                       Jump to showInt
375:    LDA  1,-28(1)	Load address of new frame 
376:    LDA  3,1(7)	Return address in ac 
377:    LDA  7,-336(7)	CALL showInt
378:    LDA  3,0(2)	Save the result in ac 
*                       End call to showInt
379:     ST  3,-28(1)	Store parameter 
*                       Jump to output
380:    LDA  1,-26(1)	Load address of new frame 
381:    LDA  3,1(7)	Return address in ac 
382:    LDA  7,-377(7)	CALL output
383:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
384:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  showBool
385:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  truth
386:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Jump to truth
387:    LDA  1,-30(1)	Load address of new frame 
388:    LDA  3,1(7)	Return address in ac 
389:    LDA  7,-276(7)	CALL truth
390:    LDA  3,0(2)	Save the result in ac 
*                       End call to truth
391:     ST  3,-30(1)	Store parameter 
*                       Jump to showBool
392:    LDA  1,-28(1)	Load address of new frame 
393:    LDA  3,1(7)	Return address in ac 
394:    LDA  7,-298(7)	CALL showBool
395:    LDA  3,0(2)	Save the result in ac 
*                       End call to showBool
396:     ST  3,-28(1)	Store parameter 
*                       Jump to output
397:    LDA  1,-26(1)	Load address of new frame 
398:    LDA  3,1(7)	Return address in ac 
399:    LDA  7,-394(7)	CALL output
400:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  caller
401:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
402:     LD  3,-2(1)	Load variable p
403:     ST  3,-28(1)	Store parameter 
*                       Load param 2
404:    LDA  3,-5(1)	Load address of base of array r
405:     ST  3,-29(1)	Store parameter 
*                       Jump to caller
406:    LDA  1,-26(1)	Load address of new frame 
407:    LDA  3,1(7)	Return address in ac 
408:    LDA  7,-233(7)	CALL caller
409:    LDA  3,0(2)	Save the result in ac 
*                       End call to caller
* EXPRESSION
*                       Begin call to  output
410:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  add
411:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  add
412:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
413:     LD  3,-2(1)	Load variable p
414:     ST  3,-32(1)	Store parameter 
*                       Load param 2
415:     LD  3,-3(1)	Load variable q
416:     ST  3,-33(1)	Store parameter 
*                       Jump to add
417:    LDA  1,-30(1)	Load address of new frame 
418:    LDA  3,1(7)	Return address in ac 
419:    LDA  7,-272(7)	CALL add
420:    LDA  3,0(2)	Save the result in ac 
*                       End call to add
421:     ST  3,-30(1)	Store parameter 
*                       Load param 2
*                       Begin call to  mul
422:     ST  1,-31(1)	Store old fp in ghost frame 
*                       Load param 1
423:     LD  3,-2(1)	Load variable p
424:     ST  3,-33(1)	Store parameter 
*                       Load param 2
425:     LD  3,-3(1)	Load variable q
426:     ST  3,-34(1)	Store parameter 
*                       Jump to mul
427:    LDA  1,-31(1)	Load address of new frame 
428:    LDA  3,1(7)	Return address in ac 
429:    LDA  7,-268(7)	CALL mul
430:    LDA  3,0(2)	Save the result in ac 
*                       End call to mul
431:     ST  3,-31(1)	Store parameter 
*                       Jump to add
432:    LDA  1,-28(1)	Load address of new frame 
433:    LDA  3,1(7)	Return address in ac 
434:    LDA  7,-287(7)	CALL add
435:    LDA  3,0(2)	Save the result in ac 
*                       End call to add
436:     ST  3,-28(1)	Store parameter 
*                       Jump to output
437:    LDA  1,-26(1)	Load address of new frame 
438:    LDA  3,1(7)	Return address in ac 
439:    LDA  7,-434(7)	CALL output
440:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
441:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Jump to outnl
442:    LDA  1,-26(1)	Load address of new frame 
443:    LDA  3,1(7)	Return address in ac 
444:    LDA  7,-408(7)	CALL outnl
445:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
446:    LDC  3,9(6)	Load integer constant 
447:     ST  3,-26(1)	Save index 
448:    LDC  3,555(6)	Load integer constant 
449:     LD  4,-26(1)	Restore index 
450:    LDA  5,-5(1)	Load address of base of array r
451:    SUB  5,5,4	Compute offset of value 
452:     ST  3,0(5)	Store variable r
* EXPRESSION
*                       Begin call to  swap
453:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
454:    LDA  3,-5(1)	Load address of base of array r
455:     ST  3,-28(1)	Store parameter 
*                       Load param 2
456:    LDC  3,7(6)	Load integer constant 
457:     ST  3,-29(1)	Store parameter 
*                       Load param 3
458:    LDC  3,9(6)	Load integer constant 
459:     ST  3,-30(1)	Store parameter 
*                       Jump to swap
460:    LDA  1,-26(1)	Load address of new frame 
461:    LDA  3,1(7)	Return address in ac 
462:    LDA  7,-193(7)	CALL swap
463:    LDA  3,0(2)	Save the result in ac 
*                       End call to swap
* EXPRESSION
*                       Begin call to  output
464:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
465:    LDA  3,-5(1)	Load address of base of array r
466:     ST  3,-28(1)	Save left side 
467:    LDC  3,9(6)	Load integer constant 
468:     LD  4,-28(1)	Load left into ac1 
469:    SUB  3,4,3	compute location from index 
470:     LD  3,0(3)	Load array element 
471:     ST  3,-28(1)	Store parameter 
*                       Jump to output
472:    LDA  1,-26(1)	Load address of new frame 
473:    LDA  3,1(7)	Return address in ac 
474:    LDA  7,-469(7)	CALL output
475:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
476:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Jump to outnl
477:    LDA  1,-26(1)	Load address of new frame 
478:    LDA  3,1(7)	Return address in ac 
479:    LDA  7,-443(7)	CALL outnl
480:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
481:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
482:    LDC  3,2(6)	Load integer constant 
483:     ST  3,-28(1)	Save left side 
*                       Begin call to  add
484:     ST  1,-29(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  add
485:     ST  1,-31(1)	Store old fp in ghost frame 
*                       Load param 1
486:    LDC  3,3(6)	Load integer constant 
487:     ST  3,-33(1)	Save left side 
488:    LDC  3,4(6)	Load integer constant 
489:     LD  4,-33(1)	Load left into ac1 
490:    MUL  3,4,3	Op * 
491:     ST  3,-33(1)	Store parameter 
*                       Load param 2
492:    LDC  3,5(6)	Load integer constant 
493:     ST  3,-34(1)	Save left side 
494:    LDC  3,6(6)	Load integer constant 
495:     LD  4,-34(1)	Load left into ac1 
496:    MUL  3,4,3	Op * 
497:     ST  3,-34(1)	Store parameter 
*                       Jump to add
498:    LDA  1,-31(1)	Load address of new frame 
499:    LDA  3,1(7)	Return address in ac 
500:    LDA  7,-353(7)	CALL add
501:    LDA  3,0(2)	Save the result in ac 
*                       End call to add
502:     ST  3,-31(1)	Save left side 
503:    LDC  3,7(6)	Load integer constant 
504:     LD  4,-31(1)	Load left into ac1 
505:    MUL  3,4,3	Op * 
506:     ST  3,-31(1)	Store parameter 
*                       Load param 2
*                       Begin call to  add
507:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
508:    LDC  3,9(6)	Load integer constant 
509:     ST  3,-34(1)	Save left side 
510:    LDC  3,10(6)	Load integer constant 
511:     LD  4,-34(1)	Load left into ac1 
512:    MUL  3,4,3	Op * 
513:     ST  3,-34(1)	Store parameter 
*                       Load param 2
514:    LDC  3,11(6)	Load integer constant 
515:     ST  3,-35(1)	Save left side 
516:    LDC  3,12(6)	Load integer constant 
517:     LD  4,-35(1)	Load left into ac1 
518:    MUL  3,4,3	Op * 
519:     ST  3,-35(1)	Store parameter 
*                       Jump to add
520:    LDA  1,-32(1)	Load address of new frame 
521:    LDA  3,1(7)	Return address in ac 
522:    LDA  7,-375(7)	CALL add
523:    LDA  3,0(2)	Save the result in ac 
*                       End call to add
524:     ST  3,-32(1)	Save left side 
525:    LDC  3,13(6)	Load integer constant 
526:     LD  4,-32(1)	Load left into ac1 
527:    MUL  3,4,3	Op * 
528:     ST  3,-32(1)	Store parameter 
*                       Jump to add
529:    LDA  1,-29(1)	Load address of new frame 
530:    LDA  3,1(7)	Return address in ac 
531:    LDA  7,-384(7)	CALL add
532:    LDA  3,0(2)	Save the result in ac 
*                       End call to add
533:     LD  4,-28(1)	Load left into ac1 
534:    MUL  3,4,3	Op * 
535:     ST  3,-28(1)	Store parameter 
*                       Jump to output
536:    LDA  1,-26(1)	Load address of new frame 
537:    LDA  3,1(7)	Return address in ac 
538:    LDA  7,-533(7)	CALL output
539:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
540:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Jump to outnl
541:    LDA  1,-26(1)	Load address of new frame 
542:    LDA  3,1(7)	Return address in ac 
543:    LDA  7,-507(7)	CALL outnl
544:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
545:    LDC  2,0(6)	Set return value to 0 
546:     LD  3,-1(1)	Load return address 
547:     LD  1,0(1)	Adjust fp 
548:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,548(7)	Jump to init [backpatch] 
* INIT
549:     LD  0,0(0)	Set the global pointer 
550:    LDA  1,-1(0)	set first frame at end of globals 
551:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
552:    LDA  3,1(7)	Return address in ac 
553:    LDA  7,-253(7)	Jump to main 
554:   HALT  0,0,0	DONE! 
* END INIT
