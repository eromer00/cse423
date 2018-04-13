* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  j00.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* RETURN
 43:     LD  3,-2(1)	Load address of base of array x
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-3(1)	Load variable i
 46:     LD  4,-4(1)	Load left into ac1 
 47:    SUB  3,4,3	compute location from index 
 48:     LD  3,0(3)	Load array element 
 49:    LDA  2,0(3)	Copy result to rt register 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 57:     ST  3,-1(1)	Store return address. 
* RETURN
*                       Begin call to  cat
 58:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 59:     LD  3,-2(1)	Load address of base of array x
 60:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 61:     LD  3,-3(1)	Load variable i
 62:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
 63:    LDA  1,-4(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-24(7)	CALL cat
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 67:    LDA  2,0(3)	Copy result to rt register 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fox
 75:     ST  3,-1(1)	Store return address. 
* RETURN
*                       Begin call to  dog
 76:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 77:     LD  3,-2(1)	Load address of base of array x
 78:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 79:     LD  3,-3(1)	Load variable i
 80:     ST  3,-7(1)	Store parameter 
*                       Jump to dog
 81:    LDA  1,-4(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-27(7)	CALL dog
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
 85:    LDA  2,0(3)	Copy result to rt register 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    LDA  7,0(3)	Return 
* END FUNCTION fox
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 93:     ST  3,-1(1)	Store return address. 
* COMPOUND
 94:    LDC  3,10(6)	load size of array h
 95:     ST  3,-3(1)	save size of array h
 96:    LDC  3,10(6)	load size of array s
 97:     ST  3,-14(1)	save size of array s
* Compound Body
* EXPRESSION
 98:    LDC  3,1(6)	Load integer constant 
 99:     ST  3,-2(1)	Store variable i
* WHILE
100:     LD  3,-2(1)	Load variable i
101:     ST  3,-25(1)	Save left side 
102:    LDC  3,10(6)	Load integer constant 
103:     LD  4,-25(1)	Load left into ac1 
104:    TLT  3,4,3	Op < 
105:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
107:     LD  3,-2(1)	Load variable i
108:     ST  3,-25(1)	Save index 
109:     LD  3,-2(1)	Load variable i
110:     ST  3,-26(1)	Save index 
111:     LD  3,-2(1)	Load variable i
112:     ST  3,-27(1)	Save index 
113:     LD  3,-2(1)	load lhs variable i
114:    LDA  3,1(3)	increment value of i
115:     ST  3,-2(1)	Store variable i
116:     LD  4,-27(1)	Restore index 
117:    LDA  5,-15(1)	Load address of base of array s
118:    SUB  5,5,4	Compute offset of value 
119:     ST  3,0(5)	Store variable s
120:     LD  4,-26(1)	Restore index 
121:    LDA  5,-1(0)	Load address of base of array g
122:    SUB  5,5,4	Compute offset of value 
123:     ST  3,0(5)	Store variable g
124:     LD  4,-25(1)	Restore index 
125:    LDA  5,-4(1)	Load address of base of array h
126:    SUB  5,5,4	Compute offset of value 
127:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-2(1)	Load variable i
130:     ST  3,-27(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-25(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
135:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to outnl
136:    LDA  1,-25(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-102(7)	CALL outnl
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
140:    LDA  7,-41(7)	go to beginning of loop 
106:    LDA  7,34(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
142:    LDA  3,-1(0)	Load address of base of array g
143:     ST  3,-27(1)	Save left side 
144:    LDC  3,6(6)	Load integer constant 
145:     LD  4,-27(1)	Load left into ac1 
146:    SUB  3,4,3	compute location from index 
147:     LD  3,0(3)	Load array element 
148:     ST  3,-27(1)	Store parameter 
*                       Jump to output
149:    LDA  1,-25(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
153:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDA  3,-4(1)	Load address of base of array h
155:     ST  3,-27(1)	Save left side 
156:    LDC  3,6(6)	Load integer constant 
157:     LD  4,-27(1)	Load left into ac1 
158:    SUB  3,4,3	compute location from index 
159:     LD  3,0(3)	Load array element 
160:     ST  3,-27(1)	Store parameter 
*                       Jump to output
161:    LDA  1,-25(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
165:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
166:    LDA  3,-15(1)	Load address of base of array s
167:     ST  3,-27(1)	Save left side 
168:    LDC  3,6(6)	Load integer constant 
169:     LD  4,-27(1)	Load left into ac1 
170:    SUB  3,4,3	compute location from index 
171:     LD  3,0(3)	Load array element 
172:     ST  3,-27(1)	Store parameter 
*                       Jump to output
173:    LDA  1,-25(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
177:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to outnl
178:    LDA  1,-25(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-144(7)	CALL outnl
181:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
182:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
183:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
184:    LDA  3,-1(0)	Load address of base of array g
185:     ST  3,-29(1)	Store parameter 
*                       Load param 2
186:    LDC  3,6(6)	Load integer constant 
187:     ST  3,-30(1)	Store parameter 
*                       Jump to cat
188:    LDA  1,-27(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-149(7)	CALL cat
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
192:     ST  3,-27(1)	Store parameter 
*                       Jump to output
193:    LDA  1,-25(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-190(7)	CALL output
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
197:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
198:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
199:    LDA  3,-4(1)	Load address of base of array h
200:     ST  3,-29(1)	Store parameter 
*                       Load param 2
201:    LDC  3,6(6)	Load integer constant 
202:     ST  3,-30(1)	Store parameter 
*                       Jump to cat
203:    LDA  1,-27(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-164(7)	CALL cat
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
207:     ST  3,-27(1)	Store parameter 
*                       Jump to output
208:    LDA  1,-25(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
212:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
213:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
214:    LDA  3,-15(1)	Load address of base of array s
215:     ST  3,-29(1)	Store parameter 
*                       Load param 2
216:    LDC  3,6(6)	Load integer constant 
217:     ST  3,-30(1)	Store parameter 
*                       Jump to cat
218:    LDA  1,-27(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-179(7)	CALL cat
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
222:     ST  3,-27(1)	Store parameter 
*                       Jump to output
223:    LDA  1,-25(1)	Load address of new frame 
224:    LDA  3,1(7)	Return address in ac 
225:    LDA  7,-220(7)	CALL output
226:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
227:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to outnl
228:    LDA  1,-25(1)	Load address of new frame 
229:    LDA  3,1(7)	Return address in ac 
230:    LDA  7,-194(7)	CALL outnl
231:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
232:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
233:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
234:    LDA  3,-1(0)	Load address of base of array g
235:     ST  3,-29(1)	Store parameter 
*                       Load param 2
236:    LDC  3,6(6)	Load integer constant 
237:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
238:    LDA  1,-27(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-184(7)	CALL dog
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
242:     ST  3,-27(1)	Store parameter 
*                       Jump to output
243:    LDA  1,-25(1)	Load address of new frame 
244:    LDA  3,1(7)	Return address in ac 
245:    LDA  7,-240(7)	CALL output
246:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
247:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
248:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
249:    LDA  3,-4(1)	Load address of base of array h
250:     ST  3,-29(1)	Store parameter 
*                       Load param 2
251:    LDC  3,6(6)	Load integer constant 
252:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
253:    LDA  1,-27(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-199(7)	CALL dog
256:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
257:     ST  3,-27(1)	Store parameter 
*                       Jump to output
258:    LDA  1,-25(1)	Load address of new frame 
259:    LDA  3,1(7)	Return address in ac 
260:    LDA  7,-255(7)	CALL output
261:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
262:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
263:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
264:    LDA  3,-15(1)	Load address of base of array s
265:     ST  3,-29(1)	Store parameter 
*                       Load param 2
266:    LDC  3,6(6)	Load integer constant 
267:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
268:    LDA  1,-27(1)	Load address of new frame 
269:    LDA  3,1(7)	Return address in ac 
270:    LDA  7,-214(7)	CALL dog
271:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
272:     ST  3,-27(1)	Store parameter 
*                       Jump to output
273:    LDA  1,-25(1)	Load address of new frame 
274:    LDA  3,1(7)	Return address in ac 
275:    LDA  7,-270(7)	CALL output
276:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
277:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to outnl
278:    LDA  1,-25(1)	Load address of new frame 
279:    LDA  3,1(7)	Return address in ac 
280:    LDA  7,-244(7)	CALL outnl
281:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
282:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
283:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
284:    LDA  3,-1(0)	Load address of base of array g
285:     ST  3,-29(1)	Store parameter 
*                       Load param 2
286:    LDC  3,6(6)	Load integer constant 
287:     ST  3,-30(1)	Store parameter 
*                       Jump to fox
288:    LDA  1,-27(1)	Load address of new frame 
289:    LDA  3,1(7)	Return address in ac 
290:    LDA  7,-216(7)	CALL fox
291:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
292:     ST  3,-27(1)	Store parameter 
*                       Jump to output
293:    LDA  1,-25(1)	Load address of new frame 
294:    LDA  3,1(7)	Return address in ac 
295:    LDA  7,-290(7)	CALL output
296:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
297:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
298:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
299:    LDA  3,-4(1)	Load address of base of array h
300:     ST  3,-29(1)	Store parameter 
*                       Load param 2
301:    LDC  3,6(6)	Load integer constant 
302:     ST  3,-30(1)	Store parameter 
*                       Jump to fox
303:    LDA  1,-27(1)	Load address of new frame 
304:    LDA  3,1(7)	Return address in ac 
305:    LDA  7,-231(7)	CALL fox
306:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
307:     ST  3,-27(1)	Store parameter 
*                       Jump to output
308:    LDA  1,-25(1)	Load address of new frame 
309:    LDA  3,1(7)	Return address in ac 
310:    LDA  7,-305(7)	CALL output
311:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
312:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
313:     ST  1,-27(1)	Store old fp in ghost frame 
*                       Load param 1
314:    LDA  3,-15(1)	Load address of base of array s
315:     ST  3,-29(1)	Store parameter 
*                       Load param 2
316:    LDC  3,6(6)	Load integer constant 
317:     ST  3,-30(1)	Store parameter 
*                       Jump to fox
318:    LDA  1,-27(1)	Load address of new frame 
319:    LDA  3,1(7)	Return address in ac 
320:    LDA  7,-246(7)	CALL fox
321:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
322:     ST  3,-27(1)	Store parameter 
*                       Jump to output
323:    LDA  1,-25(1)	Load address of new frame 
324:    LDA  3,1(7)	Return address in ac 
325:    LDA  7,-320(7)	CALL output
326:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
327:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to outnl
328:    LDA  1,-25(1)	Load address of new frame 
329:    LDA  3,1(7)	Return address in ac 
330:    LDA  7,-294(7)	CALL outnl
331:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
332:    LDC  2,0(6)	Set return value to 0 
333:     LD  3,-1(1)	Load return address 
334:     LD  1,0(1)	Adjust fp 
335:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,335(7)	Jump to init [backpatch] 
* INIT
336:     LD  0,0(0)	Set the global pointer 
337:    LDA  1,-11(0)	set first frame at end of globals 
338:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
339:    LDC  3,10(6)	load size of array g
340:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
341:    LDA  3,1(7)	Return address in ac 
342:    LDA  7,-250(7)	Jump to main 
343:   HALT  0,0,0	DONE! 
* END INIT
