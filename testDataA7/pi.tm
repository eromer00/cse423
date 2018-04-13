* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  pi.c-
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
 43:    LDC  3,340(6)	load size of array a
 44:     ST  3,-11(1)	save size of array a
* Compound Body
* EXPRESSION
 45:    LDC  3,100(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable N
* EXPRESSION
 47:     LD  3,-2(1)	Load variable N
 48:     ST  3,-352(1)	Save left side 
 49:    LDC  3,10(6)	Load integer constant 
 50:     LD  4,-352(1)	Load left into ac1 
 51:    MUL  3,4,3	Op * 
 52:     ST  3,-352(1)	Save left side 
 53:    LDC  3,3(6)	Load integer constant 
 54:     LD  4,-352(1)	Load left into ac1 
 55:    DIV  3,4,3	Op / 
 56:     ST  3,-3(1)	Store variable LEN
* EXPRESSION
 57:    LDC  3,0(6)	Load integer constant 
 58:     ST  3,-5(1)	Store variable j
* WHILE
 59:     LD  3,-5(1)	Load variable j
 60:     ST  3,-352(1)	Save left side 
 61:     LD  3,-3(1)	Load variable LEN
 62:     LD  4,-352(1)	Load left into ac1 
 63:    TLT  3,4,3	Op < 
 64:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 66:     LD  3,-5(1)	Load variable j
 67:     ST  3,-352(1)	Save index 
 68:    LDC  3,2(6)	Load integer constant 
 69:     LD  4,-352(1)	Restore index 
 70:    LDA  5,-12(1)	Load address of base of array a
 71:    SUB  5,5,4	Compute offset of value 
 72:     ST  3,0(5)	Store variable a
* EXPRESSION
 73:     LD  3,-5(1)	load lhs variable j
 74:    LDA  3,1(3)	increment value of j
 75:     ST  3,-5(1)	Store variable j
* END COMPOUND
 76:    LDA  7,-18(7)	go to beginning of loop 
 65:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
 77:    LDC  3,0(6)	Load integer constant 
 78:     ST  3,-9(1)	Store variable nines
* EXPRESSION
 79:    LDC  3,0(6)	Load integer constant 
 80:     ST  3,-10(1)	Store variable predigit
* EXPRESSION
 81:    LDC  3,0(6)	Load integer constant 
 82:     ST  3,-5(1)	Store variable j
* WHILE
 83:     LD  3,-5(1)	Load variable j
 84:     ST  3,-352(1)	Save left side 
 85:     LD  3,-2(1)	Load variable N
 86:     LD  4,-352(1)	Load left into ac1 
 87:    TLT  3,4,3	Op < 
 88:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 90:    LDC  3,0(6)	Load integer constant 
 91:     ST  3,-7(1)	Store variable q
* EXPRESSION
 92:     LD  3,-3(1)	Load variable LEN
 93:     ST  3,-4(1)	Store variable i
* WHILE
 94:     LD  3,-4(1)	Load variable i
 95:     ST  3,-352(1)	Save left side 
 96:    LDC  3,0(6)	Load integer constant 
 97:     LD  4,-352(1)	Load left into ac1 
 98:    TGT  3,4,3	Op > 
 99:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
101:    LDC  3,10(6)	Load integer constant 
102:     ST  3,-352(1)	Save left side 
103:    LDA  3,-12(1)	Load address of base of array a
104:     ST  3,-353(1)	Save left side 
105:     LD  3,-4(1)	Load variable i
106:     ST  3,-354(1)	Save left side 
107:    LDC  3,1(6)	Load integer constant 
108:     LD  4,-354(1)	Load left into ac1 
109:    SUB  3,4,3	Op - 
110:     LD  4,-353(1)	Load left into ac1 
111:    SUB  3,4,3	compute location from index 
112:     LD  3,0(3)	Load array element 
113:     LD  4,-352(1)	Load left into ac1 
114:    MUL  3,4,3	Op * 
115:     ST  3,-352(1)	Save left side 
116:     LD  3,-7(1)	Load variable q
117:     ST  3,-353(1)	Save left side 
118:     LD  3,-4(1)	Load variable i
119:     LD  4,-353(1)	Load left into ac1 
120:    MUL  3,4,3	Op * 
121:     LD  4,-352(1)	Load left into ac1 
122:    ADD  3,4,3	Op + 
123:     ST  3,-8(1)	Store variable x
* EXPRESSION
124:     LD  3,-4(1)	Load variable i
125:     ST  3,-352(1)	Save left side 
126:    LDC  3,1(6)	Load integer constant 
127:     LD  4,-352(1)	Load left into ac1 
128:    SUB  3,4,3	Op - 
129:     ST  3,-352(1)	Save index 
130:     LD  3,-8(1)	Load variable x
131:     ST  3,-353(1)	Save left side 
132:    LDC  3,2(6)	Load integer constant 
133:     ST  3,-354(1)	Save left side 
134:     LD  3,-4(1)	Load variable i
135:     LD  4,-354(1)	Load left into ac1 
136:    MUL  3,4,3	Op * 
137:     ST  3,-354(1)	Save left side 
138:    LDC  3,1(6)	Load integer constant 
139:     LD  4,-354(1)	Load left into ac1 
140:    SUB  3,4,3	Op - 
141:     LD  4,-353(1)	Load left into ac1 
142:    DIV  5,4,3	Op % 
143:    MUL  5,5,3	 
144:    SUB  3,4,5	 
145:     LD  4,-352(1)	Restore index 
146:    LDA  5,-12(1)	Load address of base of array a
147:    SUB  5,5,4	Compute offset of value 
148:     ST  3,0(5)	Store variable a
* EXPRESSION
149:     LD  3,-8(1)	Load variable x
150:     ST  3,-352(1)	Save left side 
151:    LDC  3,2(6)	Load integer constant 
152:     ST  3,-353(1)	Save left side 
153:     LD  3,-4(1)	Load variable i
154:     LD  4,-353(1)	Load left into ac1 
155:    MUL  3,4,3	Op * 
156:     ST  3,-353(1)	Save left side 
157:    LDC  3,1(6)	Load integer constant 
158:     LD  4,-353(1)	Load left into ac1 
159:    SUB  3,4,3	Op - 
160:     LD  4,-352(1)	Load left into ac1 
161:    DIV  3,4,3	Op / 
162:     ST  3,-7(1)	Store variable q
* EXPRESSION
163:    LDC  3,1(6)	Load integer constant 
164:     LD  4,-4(1)	load lhs variable i
165:    SUB  3,4,3	op -= 
166:     ST  3,-4(1)	Store variable i
* END COMPOUND
167:    LDA  7,-74(7)	go to beginning of loop 
100:    LDA  7,67(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
168:    LDC  3,0(6)	Load integer constant 
169:     ST  3,-352(1)	Save index 
170:     LD  3,-7(1)	Load variable q
171:     ST  3,-353(1)	Save left side 
172:    LDC  3,10(6)	Load integer constant 
173:     LD  4,-353(1)	Load left into ac1 
174:    DIV  5,4,3	Op % 
175:    MUL  5,5,3	 
176:    SUB  3,4,5	 
177:     LD  4,-352(1)	Restore index 
178:    LDA  5,-12(1)	Load address of base of array a
179:    SUB  5,5,4	Compute offset of value 
180:     ST  3,0(5)	Store variable a
* EXPRESSION
181:     LD  3,-7(1)	Load variable q
182:     ST  3,-352(1)	Save left side 
183:    LDC  3,10(6)	Load integer constant 
184:     LD  4,-352(1)	Load left into ac1 
185:    DIV  3,4,3	Op / 
186:     ST  3,-7(1)	Store variable q
* IF
187:     LD  3,-7(1)	Load variable q
188:     ST  3,-352(1)	Save left side 
189:    LDC  3,9(6)	Load integer constant 
190:     LD  4,-352(1)	Load left into ac1 
191:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
193:     LD  3,-9(1)	load lhs variable nines
194:    LDA  3,1(3)	increment value of nines
195:     ST  3,-9(1)	Store variable nines
* END COMPOUND
192:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* IF
197:     LD  3,-7(1)	Load variable q
198:     ST  3,-352(1)	Save left side 
199:    LDC  3,10(6)	Load integer constant 
200:     LD  4,-352(1)	Load left into ac1 
201:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
203:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
204:     LD  3,-10(1)	Load variable predigit
205:     ST  3,-354(1)	Save left side 
206:    LDC  3,1(6)	Load integer constant 
207:     LD  4,-354(1)	Load left into ac1 
208:    ADD  3,4,3	Op + 
209:     ST  3,-354(1)	Store parameter 
*                       Jump to output
210:    LDA  1,-352(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
214:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
215:    LDA  1,-352(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-181(7)	CALL outnl
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
219:    LDC  3,0(6)	Load integer constant 
220:     ST  3,-10(1)	Store variable predigit
* WHILE
221:     LD  3,-9(1)	Load variable nines
222:     ST  3,-352(1)	Save left side 
223:    LDC  3,0(6)	Load integer constant 
224:     LD  4,-352(1)	Load left into ac1 
225:    TGT  3,4,3	Op > 
226:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
228:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
229:    LDC  3,0(6)	Load integer constant 
230:     ST  3,-354(1)	Store parameter 
*                       Jump to output
231:    LDA  1,-352(1)	Load address of new frame 
232:    LDA  3,1(7)	Return address in ac 
233:    LDA  7,-228(7)	CALL output
234:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
235:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
236:    LDA  1,-352(1)	Load address of new frame 
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-202(7)	CALL outnl
239:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
240:     LD  3,-9(1)	load lhs variable nines
241:    LDA  3,-1(3)	decrement value of nines
242:     ST  3,-9(1)	Store variable nines
* END COMPOUND
243:    LDA  7,-23(7)	go to beginning of loop 
227:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
202:    JZR  3,42(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
245:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
246:     LD  3,-10(1)	Load variable predigit
247:     ST  3,-354(1)	Store parameter 
*                       Jump to output
248:    LDA  1,-352(1)	Load address of new frame 
249:    LDA  3,1(7)	Return address in ac 
250:    LDA  7,-245(7)	CALL output
251:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
252:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
253:    LDA  1,-352(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-219(7)	CALL outnl
256:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
257:     LD  3,-7(1)	Load variable q
258:     ST  3,-10(1)	Store variable predigit
* WHILE
259:     LD  3,-9(1)	Load variable nines
260:     ST  3,-352(1)	Save left side 
261:    LDC  3,0(6)	Load integer constant 
262:     LD  4,-352(1)	Load left into ac1 
263:    TGT  3,4,3	Op > 
264:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
266:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
267:    LDC  3,9(6)	Load integer constant 
268:     ST  3,-354(1)	Store parameter 
*                       Jump to output
269:    LDA  1,-352(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-266(7)	CALL output
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
273:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
274:    LDA  1,-352(1)	Load address of new frame 
275:    LDA  3,1(7)	Return address in ac 
276:    LDA  7,-240(7)	CALL outnl
277:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
278:     LD  3,-9(1)	load lhs variable nines
279:    LDA  3,-1(3)	decrement value of nines
280:     ST  3,-9(1)	Store variable nines
* END COMPOUND
281:    LDA  7,-23(7)	go to beginning of loop 
265:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
244:    LDA  7,37(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
196:    LDA  7,85(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
282:     LD  3,-5(1)	load lhs variable j
283:    LDA  3,1(3)	increment value of j
284:     ST  3,-5(1)	Store variable j
* END COMPOUND
285:    LDA  7,-203(7)	go to beginning of loop 
 89:    LDA  7,196(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
286:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
287:     LD  3,-10(1)	Load variable predigit
288:     ST  3,-354(1)	Store parameter 
*                       Jump to output
289:    LDA  1,-352(1)	Load address of new frame 
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-286(7)	CALL output
292:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
293:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
294:    LDA  1,-352(1)	Load address of new frame 
295:    LDA  3,1(7)	Return address in ac 
296:    LDA  7,-260(7)	CALL outnl
297:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
298:    LDC  2,0(6)	Set return value to 0 
299:     LD  3,-1(1)	Load return address 
300:     LD  1,0(1)	Adjust fp 
301:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,301(7)	Jump to init [backpatch] 
* INIT
302:     LD  0,0(0)	Set the global pointer 
303:    LDA  1,0(0)	set first frame at end of globals 
304:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
305:    LDA  3,1(7)	Return address in ac 
306:    LDA  7,-265(7)	Jump to main 
307:   HALT  0,0,0	DONE! 
* END INIT
