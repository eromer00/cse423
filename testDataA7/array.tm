* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  array.c-
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
* FUNCTION get
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load address of base of array x
 45:     ST  3,-6(1)	Save left side 
 46:    LDC  3,0(6)	Load integer constant 
 47:     LD  4,-6(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-4(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-4(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 60:    LDC  3,1(6)	Load integer constant 
 61:     ST  3,-4(1)	Save index 
 62:    LDC  3,666(6)	Load integer constant 
 63:     LD  4,-4(1)	Restore index 
 64:     LD  5,-2(1)	Load address of base of array x
 65:    SUB  5,5,4	Compute offset of value 
 66:     ST  3,0(5)	Store variable x
* RETURN
 67:     LD  3,-2(1)	Load address of base of array x
 68:     ST  3,-4(1)	Save left side 
 69:     LD  3,-3(1)	Load variable i
 70:     LD  4,-4(1)	Load left into ac1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
 73:    LDA  2,0(3)	Copy result to rt register 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    LDA  7,0(3)	Return 
* END FUNCTION get
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 81:     ST  3,-1(1)	Store return address. 
* COMPOUND
 82:    LDC  3,5(6)	load size of array x
 83:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 84:    LDC  3,2(6)	Load integer constant 
 85:     ST  3,-8(1)	Store variable dog
* EXPRESSION
 86:    LDC  3,0(6)	Load integer constant 
 87:     ST  3,-9(1)	Save index 
 88:    LDC  3,3(6)	Load integer constant 
 89:     LD  4,-9(1)	Restore index 
 90:    LDA  5,-3(1)	Load address of base of array x
 91:    SUB  5,5,4	Compute offset of value 
 92:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 93:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
 94:    LDA  3,-3(1)	Load address of base of array x
 95:     ST  3,-11(1)	Save left side 
 96:    LDC  3,0(6)	Load integer constant 
 97:     LD  4,-11(1)	Load left into ac1 
 98:    SUB  3,4,3	compute location from index 
 99:     LD  3,0(3)	Load array element 
100:     ST  3,-11(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-9(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
105:    LDC  3,1(6)	Load integer constant 
106:     ST  3,-9(1)	Save index 
107:    LDA  3,-3(1)	Load address of base of array x
108:     ST  3,-10(1)	Save left side 
109:    LDC  3,0(6)	Load integer constant 
110:     LD  4,-10(1)	Load left into ac1 
111:    SUB  3,4,3	compute location from index 
112:     LD  3,0(3)	Load array element 
113:     LD  4,-9(1)	Restore index 
114:    LDA  5,-3(1)	Load address of base of array x
115:    SUB  5,5,4	Compute offset of value 
116:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
117:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
118:    LDA  3,-3(1)	Load address of base of array x
119:     ST  3,-11(1)	Save left side 
120:    LDC  3,1(6)	Load integer constant 
121:     LD  4,-11(1)	Load left into ac1 
122:    SUB  3,4,3	compute location from index 
123:     LD  3,0(3)	Load array element 
124:     ST  3,-11(1)	Store parameter 
*                       Jump to output
125:    LDA  1,-9(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
129:    LDC  3,2(6)	Load integer constant 
130:     ST  3,-9(1)	Save index 
131:    LDA  3,-3(1)	Load address of base of array x
132:     ST  3,-10(1)	Save left side 
133:    LDC  3,1(6)	Load integer constant 
134:     LD  4,-10(1)	Load left into ac1 
135:    SUB  3,4,3	compute location from index 
136:     LD  3,0(3)	Load array element 
137:     ST  3,-10(1)	Save left side 
138:    LDC  3,1(6)	Load integer constant 
139:     LD  4,-10(1)	Load left into ac1 
140:    ADD  3,4,3	Op + 
141:     LD  4,-9(1)	Restore index 
142:    LDA  5,-3(1)	Load address of base of array x
143:    SUB  5,5,4	Compute offset of value 
144:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
146:    LDA  3,-3(1)	Load address of base of array x
147:     ST  3,-11(1)	Save left side 
148:    LDC  3,2(6)	Load integer constant 
149:     LD  4,-11(1)	Load left into ac1 
150:    SUB  3,4,3	compute location from index 
151:     LD  3,0(3)	Load array element 
152:     ST  3,-11(1)	Store parameter 
*                       Jump to output
153:    LDA  1,-9(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
157:     LD  3,-8(1)	Load variable dog
158:     ST  3,-9(1)	Save left side 
159:     LD  3,-8(1)	Load variable dog
160:     LD  4,-9(1)	Load left into ac1 
161:    ADD  3,4,3	Op + 
162:     ST  3,-9(1)	Save index 
163:    LDC  3,496(6)	Load integer constant 
164:     LD  4,-9(1)	Restore index 
165:    LDA  5,-3(1)	Load address of base of array x
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
168:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
169:    LDA  3,-3(1)	Load address of base of array x
170:     ST  3,-11(1)	Save left side 
171:    LDC  3,4(6)	Load integer constant 
172:     LD  4,-11(1)	Load left into ac1 
173:    SUB  3,4,3	compute location from index 
174:     LD  3,0(3)	Load array element 
175:     ST  3,-11(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-9(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
180:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
181:    LDA  1,-9(1)	Load address of new frame 
182:    LDA  3,1(7)	Return address in ac 
183:    LDA  7,-147(7)	CALL outnl
184:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
185:    LDC  3,2(6)	Load integer constant 
186:     ST  3,-8(1)	Store variable dog
* EXPRESSION
187:    LDC  3,0(6)	Load integer constant 
188:     ST  3,-9(1)	Save index 
189:    LDC  3,3(6)	Load integer constant 
190:     LD  4,-9(1)	Restore index 
191:    LDA  5,-1(0)	Load address of base of array y
192:    SUB  5,5,4	Compute offset of value 
193:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
194:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
195:    LDA  3,-1(0)	Load address of base of array y
196:     ST  3,-11(1)	Save left side 
197:    LDC  3,0(6)	Load integer constant 
198:     LD  4,-11(1)	Load left into ac1 
199:    SUB  3,4,3	compute location from index 
200:     LD  3,0(3)	Load array element 
201:     ST  3,-11(1)	Store parameter 
*                       Jump to output
202:    LDA  1,-9(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-199(7)	CALL output
205:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
206:    LDC  3,1(6)	Load integer constant 
207:     ST  3,-9(1)	Save index 
208:    LDA  3,-1(0)	Load address of base of array y
209:     ST  3,-10(1)	Save left side 
210:    LDC  3,0(6)	Load integer constant 
211:     LD  4,-10(1)	Load left into ac1 
212:    SUB  3,4,3	compute location from index 
213:     LD  3,0(3)	Load array element 
214:     LD  4,-9(1)	Restore index 
215:    LDA  5,-1(0)	Load address of base of array y
216:    SUB  5,5,4	Compute offset of value 
217:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
218:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
219:    LDA  3,-1(0)	Load address of base of array y
220:     ST  3,-11(1)	Save left side 
221:    LDC  3,1(6)	Load integer constant 
222:     LD  4,-11(1)	Load left into ac1 
223:    SUB  3,4,3	compute location from index 
224:     LD  3,0(3)	Load array element 
225:     ST  3,-11(1)	Store parameter 
*                       Jump to output
226:    LDA  1,-9(1)	Load address of new frame 
227:    LDA  3,1(7)	Return address in ac 
228:    LDA  7,-223(7)	CALL output
229:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
230:    LDC  3,2(6)	Load integer constant 
231:     ST  3,-9(1)	Save index 
232:    LDA  3,-1(0)	Load address of base of array y
233:     ST  3,-10(1)	Save left side 
234:    LDC  3,1(6)	Load integer constant 
235:     LD  4,-10(1)	Load left into ac1 
236:    SUB  3,4,3	compute location from index 
237:     LD  3,0(3)	Load array element 
238:     ST  3,-10(1)	Save left side 
239:    LDC  3,311(6)	Load integer constant 
240:     LD  4,-10(1)	Load left into ac1 
241:    ADD  3,4,3	Op + 
242:     LD  4,-9(1)	Restore index 
243:    LDA  5,-1(0)	Load address of base of array y
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
246:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
247:    LDA  3,-1(0)	Load address of base of array y
248:     ST  3,-11(1)	Save left side 
249:    LDC  3,2(6)	Load integer constant 
250:     LD  4,-11(1)	Load left into ac1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     ST  3,-11(1)	Store parameter 
*                       Jump to output
254:    LDA  1,-9(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-251(7)	CALL output
257:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
258:     LD  3,-8(1)	Load variable dog
259:     ST  3,-9(1)	Save left side 
260:     LD  3,-8(1)	Load variable dog
261:     LD  4,-9(1)	Load left into ac1 
262:    ADD  3,4,3	Op + 
263:     ST  3,-9(1)	Save index 
264:    LDC  3,496(6)	Load integer constant 
265:     LD  4,-9(1)	Restore index 
266:    LDA  5,-1(0)	Load address of base of array y
267:    SUB  5,5,4	Compute offset of value 
268:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
269:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
270:    LDA  3,-1(0)	Load address of base of array y
271:     ST  3,-11(1)	Save left side 
272:    LDC  3,4(6)	Load integer constant 
273:     LD  4,-11(1)	Load left into ac1 
274:    SUB  3,4,3	compute location from index 
275:     LD  3,0(3)	Load array element 
276:     ST  3,-11(1)	Store parameter 
*                       Jump to output
277:    LDA  1,-9(1)	Load address of new frame 
278:    LDA  3,1(7)	Return address in ac 
279:    LDA  7,-274(7)	CALL output
280:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
281:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
282:    LDA  1,-9(1)	Load address of new frame 
283:    LDA  3,1(7)	Return address in ac 
284:    LDA  7,-248(7)	CALL outnl
285:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  get
286:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
287:    LDA  3,-1(0)	Load address of base of array y
288:     ST  3,-11(1)	Store parameter 
*                       Load param 2
289:    LDC  3,2(6)	Load integer constant 
290:     ST  3,-12(1)	Store parameter 
*                       Jump to get
291:    LDA  1,-9(1)	Load address of new frame 
292:    LDA  3,1(7)	Return address in ac 
293:    LDA  7,-252(7)	CALL get
294:    LDA  3,0(2)	Save the result in ac 
*                       End call to get
295:     ST  3,-8(1)	Store variable dog
* EXPRESSION
*                       Begin call to  output
296:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
297:     LD  3,-8(1)	Load variable dog
298:     ST  3,-11(1)	Store parameter 
*                       Jump to output
299:    LDA  1,-9(1)	Load address of new frame 
300:    LDA  3,1(7)	Return address in ac 
301:    LDA  7,-296(7)	CALL output
302:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
303:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  get
304:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
305:    LDA  3,-1(0)	Load address of base of array y
306:     ST  3,-13(1)	Store parameter 
*                       Load param 2
307:    LDC  3,2(6)	Load integer constant 
308:     ST  3,-14(1)	Store parameter 
*                       Jump to get
309:    LDA  1,-11(1)	Load address of new frame 
310:    LDA  3,1(7)	Return address in ac 
311:    LDA  7,-270(7)	CALL get
312:    LDA  3,0(2)	Save the result in ac 
*                       End call to get
313:     ST  3,-11(1)	Store parameter 
*                       Jump to output
314:    LDA  1,-9(1)	Load address of new frame 
315:    LDA  3,1(7)	Return address in ac 
316:    LDA  7,-311(7)	CALL output
317:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
318:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
319:    LDA  3,-3(1)	Load address of base of array x
320:     ST  3,-11(1)	Save left side 
321:    LDC  3,1(6)	Load integer constant 
322:     LD  4,-11(1)	Load left into ac1 
323:    SUB  3,4,3	compute location from index 
324:     LD  3,0(3)	Load array element 
325:     ST  3,-11(1)	Store parameter 
*                       Jump to output
326:    LDA  1,-9(1)	Load address of new frame 
327:    LDA  3,1(7)	Return address in ac 
328:    LDA  7,-323(7)	CALL output
329:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
330:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
331:    LDA  1,-9(1)	Load address of new frame 
332:    LDA  3,1(7)	Return address in ac 
333:    LDA  7,-297(7)	CALL outnl
334:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
335:    LDC  2,0(6)	Set return value to 0 
336:     LD  3,-1(1)	Load return address 
337:     LD  1,0(1)	Adjust fp 
338:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,338(7)	Jump to init [backpatch] 
* INIT
339:     LD  0,0(0)	Set the global pointer 
340:    LDA  1,-6(0)	set first frame at end of globals 
341:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
342:    LDC  3,5(6)	load size of array y
343:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
344:    LDA  3,1(7)	Return address in ac 
345:    LDA  7,-265(7)	Jump to main 
346:   HALT  0,0,0	DONE! 
* END INIT
