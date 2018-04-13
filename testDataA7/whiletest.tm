* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  whiletest.c-
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
* IF
 43:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
 45:    LDC  3,0(6)	Load Boolean constant 
 44:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 46:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
 48:    LDC  3,0(6)	Load Boolean constant 
 47:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 50:    LDC  3,1(6)	Load Boolean constant 
 49:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 51:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 53:    LDC  3,1(6)	Load Boolean constant 
 52:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 55:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 57:    LDC  3,1(6)	Load Boolean constant 
 56:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 54:    LDA  7,3(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 58:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 60:    LDC  3,1(6)	Load Boolean constant 
 59:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 62:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 64:    LDC  3,1(6)	Load Boolean constant 
 63:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 66:    LDC  3,0(6)	Load Boolean constant 
 65:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
 61:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 67:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
 69:    LDC  3,0(6)	Load Boolean constant 
 68:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 71:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
 73:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 75:    LDC  3,1(6)	Load Boolean constant 
 74:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 72:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 70:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 76:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 78:    LDC  3,1(6)	Load Boolean constant 
 77:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 80:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
 82:    LDC  3,1(6)	Load Boolean constant 
 83:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
 85:    LDC  3,0(6)	Load Boolean constant 
 86:    LDA  7,-5(7)	go to beginning of loop 
 84:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
 81:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 79:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 87:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
 89:    LDC  3,0(6)	Load Boolean constant 
 88:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
 91:    LDC  3,1(6)	Load Boolean constant 
 92:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
 94:    LDC  3,0(6)	Load Boolean constant 
 95:    LDA  7,-5(7)	go to beginning of loop 
 93:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
 90:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
 96:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
 98:    LDC  3,0(6)	Load Boolean constant 
 97:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
100:    LDC  3,1(6)	Load Boolean constant 
101:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
103:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
105:    LDC  3,1(6)	Load Boolean constant 
104:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
106:    LDA  7,-7(7)	go to beginning of loop 
102:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
 99:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
107:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
109:    LDC  3,1(6)	Load Boolean constant 
108:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
111:    LDC  3,0(6)	Load Boolean constant 
112:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
114:    LDC  3,1(6)	Load Boolean constant 
115:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
117:    LDC  3,0(6)	Load Boolean constant 
118:    LDA  7,-5(7)	go to beginning of loop 
116:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
119:    LDA  7,-9(7)	go to beginning of loop 
113:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
110:    LDA  7,9(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
120:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
122:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
124:    LDC  3,1(6)	Load Boolean constant 
123:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
121:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
125:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
127:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
129:    LDC  3,0(6)	Load Boolean constant 
128:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
131:    LDC  3,1(6)	Load Boolean constant 
130:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
126:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
132:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
134:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
136:    LDC  3,0(6)	Load Boolean constant 
135:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
138:    LDC  3,1(6)	Load Boolean constant 
137:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
133:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
140:    LDC  3,0(6)	Load Boolean constant 
139:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
141:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
143:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
145:    LDC  3,1(6)	Load Boolean constant 
144:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
147:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
149:    LDC  3,1(6)	Load Boolean constant 
148:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
146:    LDA  7,3(7)	Jump around the ELSE [backpatch] 
* ENDIF
142:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
150:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
152:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
154:    LDC  3,0(6)	Load Boolean constant 
153:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
156:    LDC  3,1(6)	Load Boolean constant 
157:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
159:    LDC  3,0(6)	Load Boolean constant 
160:    LDA  7,-5(7)	go to beginning of loop 
158:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
155:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
151:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
161:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
163:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
165:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
167:    LDC  3,0(6)	Load Boolean constant 
166:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
164:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
162:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
168:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
170:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
172:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
174:    LDC  3,0(6)	Load Boolean constant 
173:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
176:    LDC  3,1(6)	Load Boolean constant 
175:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
171:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
169:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
177:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
179:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
181:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
183:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
185:    LDC  3,0(6)	Load Boolean constant 
184:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
182:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
180:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
178:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
186:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
188:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
190:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
192:    LDC  3,0(6)	Load Boolean constant 
193:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
195:    LDC  3,1(6)	Load Boolean constant 
196:    LDA  7,-5(7)	go to beginning of loop 
194:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
191:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
189:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
187:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
197:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
199:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
201:    LDC  3,0(6)	Load Boolean constant 
202:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
204:    LDC  3,1(6)	Load Boolean constant 
205:    LDA  7,-5(7)	go to beginning of loop 
203:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
200:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
198:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
206:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
208:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
210:    LDC  3,0(6)	Load Boolean constant 
211:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
213:    LDC  3,1(6)	Load Boolean constant 
214:    LDA  7,-5(7)	go to beginning of loop 
212:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
209:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
216:    LDC  3,0(6)	Load Boolean constant 
215:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
207:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
217:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
219:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
221:    LDC  3,1(6)	Load Boolean constant 
222:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
224:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
226:    LDC  3,1(6)	Load Boolean constant 
225:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
227:    LDA  7,-7(7)	go to beginning of loop 
223:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
220:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
218:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
228:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
230:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
232:    LDC  3,0(6)	Load Boolean constant 
233:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
235:    LDC  3,1(6)	Load Boolean constant 
236:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
238:    LDC  3,0(6)	Load Boolean constant 
239:    LDA  7,-5(7)	go to beginning of loop 
237:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
240:    LDA  7,-9(7)	go to beginning of loop 
234:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
231:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
229:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
241:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
243:    LDC  3,0(6)	Load Boolean constant 
244:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
246:    LDC  3,1(6)	Load Boolean constant 
247:    LDA  7,-5(7)	go to beginning of loop 
245:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
242:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
248:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
250:    LDC  3,1(6)	Load Boolean constant 
251:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
253:    LDC  3,0(6)	Load Boolean constant 
254:    LDA  7,-5(7)	go to beginning of loop 
252:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
249:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
256:    LDC  3,1(6)	Load Boolean constant 
255:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
257:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
259:    LDC  3,1(6)	Load Boolean constant 
260:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
262:    LDC  3,0(6)	Load Boolean constant 
263:    LDA  7,-5(7)	go to beginning of loop 
261:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
258:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
265:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
267:    LDC  3,0(6)	Load Boolean constant 
266:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
264:    LDA  7,3(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
268:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
270:    LDC  3,0(6)	Load Boolean constant 
271:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
273:    LDC  3,1(6)	Load Boolean constant 
274:    LDA  7,-5(7)	go to beginning of loop 
272:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
269:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
276:    LDC  3,0(6)	Load Boolean constant 
277:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
279:    LDC  3,1(6)	Load Boolean constant 
280:    LDA  7,-5(7)	go to beginning of loop 
278:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
275:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
281:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
283:    LDC  3,1(6)	Load Boolean constant 
284:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
286:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
288:    LDC  3,1(6)	Load Boolean constant 
287:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
289:    LDA  7,-7(7)	go to beginning of loop 
285:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
282:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
290:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
292:    LDC  3,1(6)	Load Boolean constant 
293:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
295:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
297:    LDC  3,1(6)	Load Boolean constant 
296:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
299:    LDC  3,0(6)	Load Boolean constant 
298:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
300:    LDA  7,-9(7)	go to beginning of loop 
294:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
291:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
301:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
303:    LDC  3,0(6)	Load Boolean constant 
304:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
306:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
308:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
310:    LDC  3,1(6)	Load Boolean constant 
309:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
307:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
311:    LDA  7,-9(7)	go to beginning of loop 
305:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
302:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
312:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
314:    LDC  3,1(6)	Load Boolean constant 
315:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
317:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
319:    LDC  3,1(6)	Load Boolean constant 
320:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
322:    LDC  3,0(6)	Load Boolean constant 
323:    LDA  7,-5(7)	go to beginning of loop 
321:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
318:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
324:    LDA  7,-11(7)	go to beginning of loop 
316:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
313:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
325:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
327:    LDC  3,0(6)	Load Boolean constant 
328:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
330:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
332:    LDC  3,0(6)	Load Boolean constant 
333:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
335:    LDC  3,1(6)	Load Boolean constant 
336:    LDA  7,-5(7)	go to beginning of loop 
334:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
331:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
338:    LDC  3,0(6)	Load Boolean constant 
337:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
339:    LDA  7,-13(7)	go to beginning of loop 
329:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
326:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
340:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
342:    LDC  3,0(6)	Load Boolean constant 
343:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
345:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
347:    LDC  3,0(6)	Load Boolean constant 
348:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
350:    LDC  3,1(6)	Load Boolean constant 
351:    LDA  7,-5(7)	go to beginning of loop 
349:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
346:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
353:    LDC  3,0(6)	Load Boolean constant 
352:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
354:    LDA  7,-13(7)	go to beginning of loop 
344:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
341:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
356:    LDC  3,1(6)	Load Boolean constant 
355:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
357:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
359:    LDC  3,1(6)	Load Boolean constant 
360:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
362:    LDC  3,0(6)	Load Boolean constant 
363:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
365:    LDC  3,1(6)	Load Boolean constant 
366:    LDA  7,-5(7)	go to beginning of loop 
364:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
367:    LDA  7,-9(7)	go to beginning of loop 
361:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
358:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
368:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
370:    LDC  3,1(6)	Load Boolean constant 
371:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
373:    LDC  3,0(6)	Load Boolean constant 
374:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
376:    LDC  3,1(6)	Load Boolean constant 
377:    LDA  7,-5(7)	go to beginning of loop 
375:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
378:    LDA  7,-9(7)	go to beginning of loop 
372:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
369:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
380:    LDC  3,0(6)	Load Boolean constant 
379:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
381:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
383:    LDC  3,0(6)	Load Boolean constant 
384:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
386:    LDC  3,1(6)	Load Boolean constant 
387:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
389:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
391:    LDC  3,1(6)	Load Boolean constant 
390:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
392:    LDA  7,-7(7)	go to beginning of loop 
388:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
393:    LDA  7,-11(7)	go to beginning of loop 
385:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
382:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
394:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
396:    LDC  3,1(6)	Load Boolean constant 
397:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
399:    LDC  3,0(6)	Load Boolean constant 
400:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
402:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
404:    LDC  3,0(6)	Load Boolean constant 
403:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
406:    LDC  3,1(6)	Load Boolean constant 
405:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
407:    LDA  7,-9(7)	go to beginning of loop 
401:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
408:    LDA  7,-13(7)	go to beginning of loop 
398:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
395:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
409:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
411:    LDC  3,1(6)	Load Boolean constant 
412:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
414:    LDC  3,0(6)	Load Boolean constant 
415:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
417:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
419:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
421:    LDC  3,1(6)	Load Boolean constant 
420:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
418:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
422:    LDA  7,-9(7)	go to beginning of loop 
416:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
423:    LDA  7,-13(7)	go to beginning of loop 
413:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
410:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
424:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
426:    LDC  3,1(6)	Load Boolean constant 
427:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
429:    LDC  3,0(6)	Load Boolean constant 
430:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
432:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
434:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
436:    LDC  3,1(6)	Load Boolean constant 
435:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
438:    LDC  3,0(6)	Load Boolean constant 
437:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
433:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
439:    LDA  7,-11(7)	go to beginning of loop 
431:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
440:    LDA  7,-15(7)	go to beginning of loop 
428:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
425:    JZR  3,15(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* WHILE
441:    LDC  3,1(6)	Load Boolean constant 
442:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
444:    LDC  3,0(6)	Load Boolean constant 
445:    LDA  7,-5(7)	go to beginning of loop 
443:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
446:    LDC  3,1(6)	Load Boolean constant 
447:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
449:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
451:    LDC  3,1(6)	Load Boolean constant 
450:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
452:    LDA  7,-7(7)	go to beginning of loop 
448:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
453:    LDC  3,0(6)	Load Boolean constant 
454:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
456:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
458:    LDC  3,0(6)	Load Boolean constant 
457:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
460:    LDC  3,1(6)	Load Boolean constant 
459:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
461:    LDA  7,-9(7)	go to beginning of loop 
455:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
462:    LDC  3,0(6)	Load Boolean constant 
463:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
465:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
467:    LDC  3,0(6)	Load Boolean constant 
466:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
469:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
471:    LDC  3,0(6)	Load Boolean constant 
470:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
468:    LDA  7,3(7)	Jump around the ELSE [backpatch] 
* ENDIF
472:    LDA  7,-11(7)	go to beginning of loop 
464:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
473:    LDC  3,1(6)	Load Boolean constant 
474:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
476:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
478:    LDC  3,1(6)	Load Boolean constant 
477:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* WHILE
480:    LDC  3,0(6)	Load Boolean constant 
481:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
483:    LDC  3,1(6)	Load Boolean constant 
484:    LDA  7,-5(7)	go to beginning of loop 
482:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
479:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
485:    LDA  7,-13(7)	go to beginning of loop 
475:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
486:    LDC  3,0(6)	Load Boolean constant 
487:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
489:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
491:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
493:    LDC  3,1(6)	Load Boolean constant 
492:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
490:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
494:    LDA  7,-9(7)	go to beginning of loop 
488:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
495:    LDC  3,0(6)	Load Boolean constant 
496:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
498:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
500:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
502:    LDC  3,1(6)	Load Boolean constant 
501:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
504:    LDC  3,0(6)	Load Boolean constant 
503:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
499:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
505:    LDA  7,-11(7)	go to beginning of loop 
497:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
506:    LDC  3,1(6)	Load Boolean constant 
507:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
509:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
511:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
513:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
515:    LDC  3,1(6)	Load Boolean constant 
514:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
512:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
510:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
516:    LDA  7,-11(7)	go to beginning of loop 
508:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
517:    LDC  3,0(6)	Load Boolean constant 
518:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
520:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
522:    LDC  3,0(6)	Load Boolean constant 
523:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
525:    LDC  3,1(6)	Load Boolean constant 
526:    LDA  7,-5(7)	go to beginning of loop 
524:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
521:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
527:    LDA  7,-11(7)	go to beginning of loop 
519:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
528:    LDC  3,0(6)	Load Boolean constant 
529:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
531:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
533:    LDC  3,0(6)	Load Boolean constant 
534:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
536:    LDC  3,1(6)	Load Boolean constant 
537:    LDA  7,-5(7)	go to beginning of loop 
535:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
532:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
539:    LDC  3,0(6)	Load Boolean constant 
538:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
540:    LDA  7,-13(7)	go to beginning of loop 
530:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
541:    LDC  3,1(6)	Load Boolean constant 
542:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
544:    LDC  3,0(6)	Load Boolean constant 
545:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
547:    LDC  3,1(6)	Load Boolean constant 
548:    LDA  7,-5(7)	go to beginning of loop 
546:    LDA  7,2(7)	Jump past loop [backpatch] 
* ENDWHILE
549:    LDA  7,-9(7)	go to beginning of loop 
543:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
550:    LDC  3,0(6)	Load Boolean constant 
551:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
553:    LDC  3,1(6)	Load Boolean constant 
554:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
556:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
558:    LDC  3,1(6)	Load Boolean constant 
557:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
559:    LDA  7,-7(7)	go to beginning of loop 
555:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
560:    LDA  7,-11(7)	go to beginning of loop 
552:    LDA  7,8(7)	Jump past loop [backpatch] 
* ENDWHILE
* WHILE
561:    LDC  3,0(6)	Load Boolean constant 
562:    JNZ  3,1(7)	Jump to while part 
* DO
* WHILE
564:    LDC  3,1(6)	Load Boolean constant 
565:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
567:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
569:    LDC  3,1(6)	Load Boolean constant 
568:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
571:    LDC  3,0(6)	Load Boolean constant 
570:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
572:    LDA  7,-9(7)	go to beginning of loop 
566:    LDA  7,6(7)	Jump past loop [backpatch] 
* ENDWHILE
573:    LDA  7,-13(7)	go to beginning of loop 
563:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
574:    LDC  2,0(6)	Set return value to 0 
575:     LD  3,-1(1)	Load return address 
576:     LD  1,0(1)	Adjust fp 
577:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,577(7)	Jump to init [backpatch] 
* INIT
578:     LD  0,0(0)	Set the global pointer 
579:    LDA  1,0(0)	set first frame at end of globals 
580:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
581:    LDA  3,1(7)	Return address in ac 
582:    LDA  7,-541(7)	Jump to main 
583:   HALT  0,0,0	DONE! 
* END INIT
