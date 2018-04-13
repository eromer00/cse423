* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  func.c-
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
* FUNCTION ant
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 43:    LDC  3,0(6)	Load integer constant 
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION ant
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION bat
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 53:     LD  3,-2(1)	Load variable x
 54:     ST  3,-3(1)	Save left side 
 55:    LDC  3,0(6)	Load integer constant 
 56:     LD  4,-3(1)	Load left into ac1 
 57:    TGT  3,4,3	Op > 
 58:    LDA  2,0(3)	Copy result to rt register 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 62:    LDC  2,0(6)	Set return value to 0 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END FUNCTION bat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
 66:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 70:    LDC  2,0(6)	Set return value to 0 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 74:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 75:     LD  3,-2(1)	Load variable a
 76:    LDA  2,0(3)	Copy result to rt register 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION gnu
 84:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 85:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,0(0)	Load variable eel
 87:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-2(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust fp 
 94:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6)	Set return value to 0 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust fp 
 98:    LDA  7,0(3)	Return 
* END FUNCTION gnu
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION hog
 99:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
100:     LD  3,-2(1)	Load variable z
101:    LDA  2,0(3)	Copy result to rt register 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION hog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION jay
109:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* END FUNCTION jay
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION owl
114:     ST  3,-1(1)	Store return address. 
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    LDA  7,0(3)	Return 
* END FUNCTION owl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION pig
119:     ST  3,-1(1)	Store return address. 
* EXPRESSION
*                       Begin call to  output
120:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
121:     LD  3,-2(1)	Load variable z
122:     ST  3,-5(1)	Store parameter 
*                       Jump to output
123:    LDA  1,-3(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* Add standard closing in case there is no return statement
127:    LDC  2,0(6)	Set return value to 0 
128:     LD  3,-1(1)	Load return address 
129:     LD  1,0(1)	Adjust fp 
130:    LDA  7,0(3)	Return 
* END FUNCTION pig
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION pigs
131:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  pig
132:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
133:     LD  3,-2(1)	Load variable z
134:     ST  3,-5(1)	Store parameter 
*                       Jump to pig
135:    LDA  1,-3(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-19(7)	CALL pig
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to pig
* EXPRESSION
*                       Begin call to  outnl
139:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
140:    LDA  1,-3(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-106(7)	CALL outnl
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust fp 
147:    LDA  7,0(3)	Return 
* END FUNCTION pigs
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION max
148:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* IF
149:     LD  3,-2(1)	Load variable x
150:     ST  3,-5(1)	Save left side 
151:     LD  3,-3(1)	Load variable y
152:     LD  4,-5(1)	Load left into ac1 
153:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
155:     LD  3,-2(1)	Load variable x
156:     ST  3,-4(1)	Store variable z
154:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
158:     LD  3,-3(1)	Load variable y
159:     ST  3,-4(1)	Store variable z
157:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
160:     LD  3,-4(1)	Load variable z
161:    LDA  2,0(3)	Copy result to rt register 
162:     LD  3,-1(1)	Load return address 
163:     LD  1,0(1)	Adjust fp 
164:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
165:    LDC  2,0(6)	Set return value to 0 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    LDA  7,0(3)	Return 
* END FUNCTION max
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
169:     ST  3,-1(1)	Store return address. 
* COMPOUND
170:    LDC  3,5(6)	load size of array a
171:     ST  3,-2(1)	save size of array a
172:    LDC  3,7(6)	load size of array b
173:     ST  3,-8(1)	save size of array b
* Compound Body
* EXPRESSION
*                       Begin call to  ant
174:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to ant
175:    LDA  1,-16(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-136(7)	CALL ant
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to ant
* EXPRESSION
*                       Begin call to  bat
179:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
180:    LDC  3,2(6)	Load integer constant 
181:     ST  3,-18(1)	Store parameter 
*                       Jump to bat
182:    LDA  1,-16(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-133(7)	CALL bat
185:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  cat
186:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
187:    LDC  3,1(6)	Load Boolean constant 
188:     ST  3,-18(1)	Store parameter 
*                       Jump to cat
189:    LDA  1,-16(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-126(7)	CALL cat
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  dog
193:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
194:    LDC  3,3(6)	Load integer constant 
195:     ST  3,-18(1)	Store parameter 
*                       Load param 2
196:    LDA  3,-3(1)	Load address of base of array a
197:     ST  3,-19(1)	Store parameter 
*                       Load param 3
198:    LDA  3,-9(1)	Load address of base of array b
199:     ST  3,-20(1)	Save left side 
200:    LDC  3,1(6)	Load integer constant 
201:     LD  4,-20(1)	Load left into ac1 
202:    SUB  3,4,3	compute location from index 
203:     LD  3,0(3)	Load array element 
204:     ST  3,-20(1)	Store parameter 
*                       Load param 4
205:    LDA  3,-9(1)	Load address of base of array b
206:     ST  3,-21(1)	Store parameter 
*                       Jump to dog
207:    LDA  1,-16(1)	Load address of new frame 
208:    LDA  3,1(7)	Return address in ac 
209:    LDA  7,-136(7)	CALL dog
210:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
211:    LDC  3,9(6)	Load integer constant 
212:     ST  3,0(0)	Store variable eel
* EXPRESSION
213:     LD  3,0(0)	Load variable eel
214:     ST  3,-16(1)	Save index 
215:     LD  3,0(0)	Load variable eel
216:     LD  4,-16(1)	Restore index 
217:    LDA  5,-2(0)	Load address of base of array fox
218:    SUB  5,5,4	Compute offset of value 
219:     ST  3,0(5)	Store variable fox
* EXPRESSION
*                       Begin call to  pig
220:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
221:     LD  3,0(0)	Load variable eel
222:     ST  3,-18(1)	Store parameter 
*                       Jump to pig
223:    LDA  1,-16(1)	Load address of new frame 
224:    LDA  3,1(7)	Return address in ac 
225:    LDA  7,-107(7)	CALL pig
226:    LDA  3,0(2)	Save the result in ac 
*                       End call to pig
* EXPRESSION
*                       Begin call to  pig
227:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
228:    LDA  3,-2(0)	Load address of base of array fox
229:     ST  3,-18(1)	Save left side 
230:     LD  3,0(0)	Load variable eel
231:     LD  4,-18(1)	Load left into ac1 
232:    SUB  3,4,3	compute location from index 
233:     LD  3,0(3)	Load array element 
234:     ST  3,-18(1)	Store parameter 
*                       Jump to pig
235:    LDA  1,-16(1)	Load address of new frame 
236:    LDA  3,1(7)	Return address in ac 
237:    LDA  7,-119(7)	CALL pig
238:    LDA  3,0(2)	Save the result in ac 
*                       End call to pig
* EXPRESSION
*                       Begin call to  gnu
239:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to gnu
240:    LDA  1,-16(1)	Load address of new frame 
241:    LDA  3,1(7)	Return address in ac 
242:    LDA  7,-159(7)	CALL gnu
243:    LDA  3,0(2)	Save the result in ac 
*                       End call to gnu
* EXPRESSION
*                       Begin call to  pigs
244:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  hog
245:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
246:    LDC  3,1729(6)	Load integer constant 
247:     ST  3,-20(1)	Store parameter 
*                       Jump to hog
248:    LDA  1,-18(1)	Load address of new frame 
249:    LDA  3,1(7)	Return address in ac 
250:    LDA  7,-152(7)	CALL hog
251:    LDA  3,0(2)	Save the result in ac 
*                       End call to hog
252:     ST  3,-18(1)	Store parameter 
*                       Jump to pigs
253:    LDA  1,-16(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-125(7)	CALL pigs
256:    LDA  3,0(2)	Save the result in ac 
*                       End call to pigs
* EXPRESSION
*                       Begin call to  jay
257:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to jay
258:    LDA  1,-16(1)	Load address of new frame 
259:    LDA  3,1(7)	Return address in ac 
260:    LDA  7,-152(7)	CALL jay
261:    LDA  3,0(2)	Save the result in ac 
*                       End call to jay
* EXPRESSION
*                       Begin call to  owl
262:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to owl
263:    LDA  1,-16(1)	Load address of new frame 
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-152(7)	CALL owl
266:    LDA  3,0(2)	Save the result in ac 
*                       End call to owl
* EXPRESSION
*                       Begin call to  pigs
267:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
268:     LD  3,0(0)	Load variable eel
269:     ST  3,-18(1)	Store parameter 
*                       Jump to pigs
270:    LDA  1,-16(1)	Load address of new frame 
271:    LDA  3,1(7)	Return address in ac 
272:    LDA  7,-142(7)	CALL pigs
273:    LDA  3,0(2)	Save the result in ac 
*                       End call to pigs
* EXPRESSION
*                       Begin call to  pigs
274:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  hog
275:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
276:     LD  3,0(0)	Load variable eel
277:     ST  3,-20(1)	Store parameter 
*                       Jump to hog
278:    LDA  1,-18(1)	Load address of new frame 
279:    LDA  3,1(7)	Return address in ac 
280:    LDA  7,-182(7)	CALL hog
281:    LDA  3,0(2)	Save the result in ac 
*                       End call to hog
282:     ST  3,-18(1)	Store parameter 
*                       Jump to pigs
283:    LDA  1,-16(1)	Load address of new frame 
284:    LDA  3,1(7)	Return address in ac 
285:    LDA  7,-155(7)	CALL pigs
286:    LDA  3,0(2)	Save the result in ac 
*                       End call to pigs
* EXPRESSION
*                       Begin call to  pigs
287:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
288:    LDA  3,-2(0)	Load address of base of array fox
289:     ST  3,-18(1)	Save left side 
*                       Begin call to  hog
290:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
291:     LD  3,0(0)	Load variable eel
292:     ST  3,-21(1)	Store parameter 
*                       Jump to hog
293:    LDA  1,-19(1)	Load address of new frame 
294:    LDA  3,1(7)	Return address in ac 
295:    LDA  7,-197(7)	CALL hog
296:    LDA  3,0(2)	Save the result in ac 
*                       End call to hog
297:     LD  4,-18(1)	Load left into ac1 
298:    SUB  3,4,3	compute location from index 
299:     LD  3,0(3)	Load array element 
300:     ST  3,-18(1)	Store parameter 
*                       Jump to pigs
301:    LDA  1,-16(1)	Load address of new frame 
302:    LDA  3,1(7)	Return address in ac 
303:    LDA  7,-173(7)	CALL pigs
304:    LDA  3,0(2)	Save the result in ac 
*                       End call to pigs
* END COMPOUND
* Add standard closing in case there is no return statement
305:    LDC  2,0(6)	Set return value to 0 
306:     LD  3,-1(1)	Load return address 
307:     LD  1,0(1)	Adjust fp 
308:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,308(7)	Jump to init [backpatch] 
* INIT
309:     LD  0,0(0)	Set the global pointer 
310:    LDA  1,-13(0)	set first frame at end of globals 
311:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
312:    LDC  3,11(6)	load size of array fox
313:     ST  3,-1(0)	save size of array fox
* END INIT GLOBALS AND STATICS
314:    LDA  3,1(7)	Return address in ac 
315:    LDA  7,-147(7)	Jump to main 
316:   HALT  0,0,0	DONE! 
* END INIT
