* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  assign2.c-
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
 47:    LDC  3,6(6)	load size of array a
 48:     ST  3,-19(1)	save size of array a
 49:    LDC  3,5(6)	load size of array b
 50:     ST  3,-26(1)	save size of array b
* Compound Body
* EXPRESSION
 51:    LDC  3,5(6)	Load integer constant 
 52:     ST  3,-32(1)	Save index 
 53:    LDC  3,111(6)	Load integer constant 
 54:     LD  4,-32(1)	Restore index 
 55:    LDA  5,-3(1)	Load address of base of array x
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDA  3,-3(1)	Load address of base of array x
 60:     ST  3,-34(1)	Save left side 
 61:    LDC  3,5(6)	Load integer constant 
 62:     LD  4,-34(1)	Load left into ac1 
 63:    SUB  3,4,3	compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     ST  3,-34(1)	Store parameter 
*                       Jump to output
 66:    LDA  1,-32(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 70:    LDC  3,4(6)	Load integer constant 
 71:     ST  3,-32(1)	Save index 
 72:    LDC  3,222(6)	Load integer constant 
 73:     LD  4,-32(1)	Restore index 
 74:    LDA  5,-12(1)	Load address of base of array y
 75:    SUB  5,5,4	Compute offset of value 
 76:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDA  3,-12(1)	Load address of base of array y
 79:     ST  3,-34(1)	Save left side 
 80:    LDC  3,4(6)	Load integer constant 
 81:     LD  4,-34(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     ST  3,-34(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-32(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 89:    LDC  3,3(6)	Load integer constant 
 90:     ST  3,-32(1)	Save index 
 91:    LDC  3,1(6)	Load Boolean constant 
 92:     LD  4,-32(1)	Restore index 
 93:    LDA  5,-20(1)	Load address of base of array a
 94:    SUB  5,5,4	Compute offset of value 
 95:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
 96:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 97:    LDA  3,-20(1)	Load address of base of array a
 98:     ST  3,-34(1)	Save left side 
 99:    LDC  3,3(6)	Load integer constant 
100:     LD  4,-34(1)	Load left into ac1 
101:    SUB  3,4,3	compute location from index 
102:     LD  3,0(3)	Load array element 
103:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
104:    LDA  1,-32(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-89(7)	CALL outputb
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
108:    LDC  3,2(6)	Load integer constant 
109:     ST  3,-32(1)	Save index 
110:    LDC  3,0(6)	Load Boolean constant 
111:     LD  4,-32(1)	Restore index 
112:    LDA  5,-27(1)	Load address of base of array b
113:    SUB  5,5,4	Compute offset of value 
114:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  outputb
115:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
116:    LDA  3,-27(1)	Load address of base of array b
117:     ST  3,-34(1)	Save left side 
118:    LDC  3,2(6)	Load integer constant 
119:     LD  4,-34(1)	Load left into ac1 
120:    SUB  3,4,3	compute location from index 
121:     LD  3,0(3)	Load array element 
122:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
123:    LDA  1,-32(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-108(7)	CALL outputb
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
127:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
128:    LDA  1,-32(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-94(7)	CALL outnl
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
132:    LDC  3,5(6)	Load integer constant 
133:     ST  3,-32(1)	Save index 
134:    LDC  3,333(6)	Load integer constant 
135:     LD  4,-32(1)	Restore index 
136:    LDA  5,-1(0)	Load address of base of array gx
137:    SUB  5,5,4	Compute offset of value 
138:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
139:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
140:    LDA  3,-1(0)	Load address of base of array gx
141:     ST  3,-34(1)	Save left side 
142:    LDC  3,5(6)	Load integer constant 
143:     LD  4,-34(1)	Load left into ac1 
144:    SUB  3,4,3	compute location from index 
145:     LD  3,0(3)	Load array element 
146:     ST  3,-34(1)	Store parameter 
*                       Jump to output
147:    LDA  1,-32(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
151:    LDC  3,4(6)	Load integer constant 
152:     ST  3,-32(1)	Save index 
153:    LDC  3,444(6)	Load integer constant 
154:     LD  4,-32(1)	Restore index 
155:    LDA  5,-9(0)	Load address of base of array gy
156:    SUB  5,5,4	Compute offset of value 
157:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
158:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
159:    LDA  3,-9(0)	Load address of base of array gy
160:     ST  3,-34(1)	Save left side 
161:    LDC  3,4(6)	Load integer constant 
162:     LD  4,-34(1)	Load left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
165:     ST  3,-34(1)	Store parameter 
*                       Jump to output
166:    LDA  1,-32(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-163(7)	CALL output
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
170:    LDC  3,3(6)	Load integer constant 
171:     ST  3,-32(1)	Save index 
172:    LDC  3,0(6)	Load Boolean constant 
173:     LD  4,-32(1)	Restore index 
174:    LDA  5,-16(0)	Load address of base of array ga
175:    SUB  5,5,4	Compute offset of value 
176:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
177:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
178:    LDA  3,-16(0)	Load address of base of array ga
179:     ST  3,-34(1)	Save left side 
180:    LDC  3,3(6)	Load integer constant 
181:     LD  4,-34(1)	Load left into ac1 
182:    SUB  3,4,3	compute location from index 
183:     LD  3,0(3)	Load array element 
184:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
185:    LDA  1,-32(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-170(7)	CALL outputb
188:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
189:    LDC  3,2(6)	Load integer constant 
190:     ST  3,-32(1)	Save index 
191:    LDC  3,1(6)	Load Boolean constant 
192:     LD  4,-32(1)	Restore index 
193:    LDA  5,-22(0)	Load address of base of array gb
194:    SUB  5,5,4	Compute offset of value 
195:     ST  3,0(5)	Store variable gb
* EXPRESSION
*                       Begin call to  outputb
196:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
197:    LDA  3,-22(0)	Load address of base of array gb
198:     ST  3,-34(1)	Save left side 
199:    LDC  3,2(6)	Load integer constant 
200:     LD  4,-34(1)	Load left into ac1 
201:    SUB  3,4,3	compute location from index 
202:     LD  3,0(3)	Load array element 
203:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
204:    LDA  1,-32(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-189(7)	CALL outputb
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
208:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
209:    LDA  1,-32(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-175(7)	CALL outnl
212:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
213:    LDC  3,5(6)	Load integer constant 
214:     ST  3,-32(1)	Save index 
215:    LDA  3,-12(1)	Load address of base of array y
216:     ST  3,-33(1)	Save left side 
217:    LDC  3,4(6)	Load integer constant 
218:     LD  4,-33(1)	Load left into ac1 
219:    SUB  3,4,3	compute location from index 
220:     LD  3,0(3)	Load array element 
221:     LD  4,-32(1)	Restore index 
222:    LDA  5,-3(1)	Load address of base of array x
223:    SUB  5,5,4	Compute offset of value 
224:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
225:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
226:    LDA  3,-3(1)	Load address of base of array x
227:     ST  3,-34(1)	Save left side 
228:    LDC  3,5(6)	Load integer constant 
229:     LD  4,-34(1)	Load left into ac1 
230:    SUB  3,4,3	compute location from index 
231:     LD  3,0(3)	Load array element 
232:     ST  3,-34(1)	Store parameter 
*                       Jump to output
233:    LDA  1,-32(1)	Load address of new frame 
234:    LDA  3,1(7)	Return address in ac 
235:    LDA  7,-230(7)	CALL output
236:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
237:    LDC  3,3(6)	Load integer constant 
238:     ST  3,-32(1)	Save index 
239:    LDA  3,-27(1)	Load address of base of array b
240:     ST  3,-33(1)	Save left side 
241:    LDC  3,2(6)	Load integer constant 
242:     LD  4,-33(1)	Load left into ac1 
243:    SUB  3,4,3	compute location from index 
244:     LD  3,0(3)	Load array element 
245:     LD  4,-32(1)	Restore index 
246:    LDA  5,-20(1)	Load address of base of array a
247:    SUB  5,5,4	Compute offset of value 
248:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
249:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
250:    LDA  3,-20(1)	Load address of base of array a
251:     ST  3,-34(1)	Save left side 
252:    LDC  3,3(6)	Load integer constant 
253:     LD  4,-34(1)	Load left into ac1 
254:    SUB  3,4,3	compute location from index 
255:     LD  3,0(3)	Load array element 
256:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
257:    LDA  1,-32(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-242(7)	CALL outputb
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
261:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
262:    LDA  1,-32(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-228(7)	CALL outnl
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
266:    LDC  3,5(6)	Load integer constant 
267:     ST  3,-32(1)	Save index 
268:    LDA  3,-9(0)	Load address of base of array gy
269:     ST  3,-33(1)	Save left side 
270:    LDC  3,4(6)	Load integer constant 
271:     LD  4,-33(1)	Load left into ac1 
272:    SUB  3,4,3	compute location from index 
273:     LD  3,0(3)	Load array element 
274:     LD  4,-32(1)	Restore index 
275:    LDA  5,-1(0)	Load address of base of array gx
276:    SUB  5,5,4	Compute offset of value 
277:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
278:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
279:    LDA  3,-1(0)	Load address of base of array gx
280:     ST  3,-34(1)	Save left side 
281:    LDC  3,5(6)	Load integer constant 
282:     LD  4,-34(1)	Load left into ac1 
283:    SUB  3,4,3	compute location from index 
284:     LD  3,0(3)	Load array element 
285:     ST  3,-34(1)	Store parameter 
*                       Jump to output
286:    LDA  1,-32(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-283(7)	CALL output
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
290:    LDC  3,3(6)	Load integer constant 
291:     ST  3,-32(1)	Save index 
292:    LDA  3,-22(0)	Load address of base of array gb
293:     ST  3,-33(1)	Save left side 
294:    LDC  3,2(6)	Load integer constant 
295:     LD  4,-33(1)	Load left into ac1 
296:    SUB  3,4,3	compute location from index 
297:     LD  3,0(3)	Load array element 
298:     LD  4,-32(1)	Restore index 
299:    LDA  5,-16(0)	Load address of base of array ga
300:    SUB  5,5,4	Compute offset of value 
301:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
302:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
303:    LDA  3,-16(0)	Load address of base of array ga
304:     ST  3,-34(1)	Save left side 
305:    LDC  3,3(6)	Load integer constant 
306:     LD  4,-34(1)	Load left into ac1 
307:    SUB  3,4,3	compute location from index 
308:     LD  3,0(3)	Load array element 
309:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
310:    LDA  1,-32(1)	Load address of new frame 
311:    LDA  3,1(7)	Return address in ac 
312:    LDA  7,-295(7)	CALL outputb
313:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
314:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
315:    LDA  1,-32(1)	Load address of new frame 
316:    LDA  3,1(7)	Return address in ac 
317:    LDA  7,-281(7)	CALL outnl
318:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
319:     LD  3,-1(1)	Load return address 
320:     LD  1,0(1)	Adjust fp 
321:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
322:    LDC  2,0(6)	Set return value to 0 
323:     LD  3,-1(1)	Load return address 
324:     LD  1,0(1)	Adjust fp 
325:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,325(7)	Jump to init [backpatch] 
* INIT
326:     LD  0,0(0)	Set the global pointer 
327:    LDA  1,-26(0)	set first frame at end of globals 
328:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
329:    LDC  3,5(6)	load size of array ga
330:     ST  3,-15(0)	save size of array ga
331:    LDC  3,4(6)	load size of array gb
332:     ST  3,-21(0)	save size of array gb
333:    LDC  3,7(6)	load size of array gx
334:     ST  3,0(0)	save size of array gx
335:    LDC  3,6(6)	load size of array gy
336:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
337:    LDA  3,1(7)	Return address in ac 
338:    LDA  7,-297(7)	Jump to main 
339:   HALT  0,0,0	DONE! 
* END INIT
