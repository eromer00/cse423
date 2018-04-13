* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  permlist.c-
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
* FUNCTION put
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-2(1)	Load address of base of array p
 44:     ST  3,-5(1)	Save left side 
 45:    LDC  3,1(6)	Load integer constant 
 46:     LD  4,-5(1)	Load left into ac1 
 47:    SUB  3,4,3	compute location from index 
 48:     LD  3,0(3)	Load array element 
 49:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 50:    LDC  3,2(6)	Load integer constant 
 51:     ST  3,-3(1)	Store variable j
* WHILE
 52:     LD  3,-3(1)	Load variable j
 53:     ST  3,-5(1)	Save left side 
 54:     LD  3,0(0)	Load variable n
 55:     LD  4,-5(1)	Load left into ac1 
 56:    TLE  3,4,3	Op <= 
 57:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 59:     LD  3,-4(1)	Load variable sum
 60:     ST  3,-5(1)	Save left side 
 61:    LDC  3,10(6)	Load integer constant 
 62:     LD  4,-5(1)	Load left into ac1 
 63:    MUL  3,4,3	Op * 
 64:     ST  3,-5(1)	Save left side 
 65:     LD  3,-2(1)	Load address of base of array p
 66:     ST  3,-6(1)	Save left side 
 67:     LD  3,-3(1)	Load variable j
 68:     LD  4,-6(1)	Load left into ac1 
 69:    SUB  3,4,3	compute location from index 
 70:     LD  3,0(3)	Load array element 
 71:     LD  4,-5(1)	Load left into ac1 
 72:    ADD  3,4,3	Op + 
 73:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 74:     LD  3,-3(1)	Load variable j
 75:     ST  3,-5(1)	Save left side 
 76:    LDC  3,1(6)	Load integer constant 
 77:     LD  4,-5(1)	Load left into ac1 
 78:    ADD  3,4,3	Op + 
 79:     ST  3,-3(1)	Store variable j
* END COMPOUND
 80:    LDA  7,-29(7)	go to beginning of loop 
 58:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 81:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 82:     LD  3,-4(1)	Load variable sum
 83:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 84:    LDA  1,-5(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
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
* END FUNCTION put
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 97:     ST  3,-1(1)	Store return address. 
* COMPOUND
 98:    LDC  3,20(6)	load size of array p
 99:     ST  3,-2(1)	save size of array p
* Compound Body
* EXPRESSION
*                       Begin call to  input
100:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to input
101:    LDA  1,-25(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-103(7)	CALL input
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
105:     ST  3,0(0)	Store variable n
* EXPRESSION
106:    LDC  3,0(6)	Load integer constant 
107:     ST  3,-24(1)	Store variable j
* WHILE
108:     LD  3,-24(1)	Load variable j
109:     ST  3,-25(1)	Save left side 
110:     LD  3,0(0)	Load variable n
111:     LD  4,-25(1)	Load left into ac1 
112:    TLE  3,4,3	Op <= 
113:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
115:     LD  3,-24(1)	Load variable j
116:     ST  3,-25(1)	Save index 
117:     LD  3,-24(1)	Load variable j
118:     LD  4,-25(1)	Restore index 
119:    LDA  5,-3(1)	Load address of base of array p
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable p
* EXPRESSION
122:     LD  3,-24(1)	Load variable j
123:     ST  3,-25(1)	Save left side 
124:    LDC  3,1(6)	Load integer constant 
125:     LD  4,-25(1)	Load left into ac1 
126:    ADD  3,4,3	Op + 
127:     ST  3,-24(1)	Store variable j
* END COMPOUND
128:    LDA  7,-21(7)	go to beginning of loop 
114:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
129:    LDC  3,1(6)	Load integer constant 
130:     ST  3,-23(1)	Store variable i
* WHILE
131:     LD  3,-23(1)	Load variable i
132:     ST  3,-25(1)	Save left side 
133:    LDC  3,0(6)	Load integer constant 
134:     LD  4,-25(1)	Load left into ac1 
135:    TGT  3,4,3	Op > 
136:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  put
138:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
139:    LDA  3,-3(1)	Load address of base of array p
140:     ST  3,-30(1)	Store parameter 
*                       Jump to put
141:    LDA  1,-28(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-102(7)	CALL put
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to put
* EXPRESSION
145:     LD  3,0(0)	Load variable n
146:     ST  3,-28(1)	Save left side 
147:    LDC  3,1(6)	Load integer constant 
148:     LD  4,-28(1)	Load left into ac1 
149:    SUB  3,4,3	Op - 
150:     ST  3,-23(1)	Store variable i
* WHILE
151:    LDA  3,-3(1)	Load address of base of array p
152:     ST  3,-28(1)	Save left side 
153:     LD  3,-23(1)	Load variable i
154:     LD  4,-28(1)	Load left into ac1 
155:    SUB  3,4,3	compute location from index 
156:     LD  3,0(3)	Load array element 
157:     ST  3,-28(1)	Save left side 
158:    LDA  3,-3(1)	Load address of base of array p
159:     ST  3,-29(1)	Save left side 
160:     LD  3,-23(1)	Load variable i
161:     ST  3,-30(1)	Save left side 
162:    LDC  3,1(6)	Load integer constant 
163:     LD  4,-30(1)	Load left into ac1 
164:    ADD  3,4,3	Op + 
165:     LD  4,-29(1)	Load left into ac1 
166:    SUB  3,4,3	compute location from index 
167:     LD  3,0(3)	Load array element 
168:     LD  4,-28(1)	Load left into ac1 
169:    TGT  3,4,3	Op > 
170:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
172:     LD  3,-23(1)	Load variable i
173:     ST  3,-28(1)	Save left side 
174:    LDC  3,1(6)	Load integer constant 
175:     LD  4,-28(1)	Load left into ac1 
176:    SUB  3,4,3	Op - 
177:     ST  3,-23(1)	Store variable i
178:    LDA  7,-28(7)	go to beginning of loop 
171:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
179:     LD  3,0(0)	Load variable n
180:     ST  3,-24(1)	Store variable j
* WHILE
181:    LDA  3,-3(1)	Load address of base of array p
182:     ST  3,-28(1)	Save left side 
183:     LD  3,-23(1)	Load variable i
184:     LD  4,-28(1)	Load left into ac1 
185:    SUB  3,4,3	compute location from index 
186:     LD  3,0(3)	Load array element 
187:     ST  3,-28(1)	Save left side 
188:    LDA  3,-3(1)	Load address of base of array p
189:     ST  3,-29(1)	Save left side 
190:     LD  3,-24(1)	Load variable j
191:     LD  4,-29(1)	Load left into ac1 
192:    SUB  3,4,3	compute location from index 
193:     LD  3,0(3)	Load array element 
194:     LD  4,-28(1)	Load left into ac1 
195:    TGT  3,4,3	Op > 
196:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
198:     LD  3,-24(1)	Load variable j
199:     ST  3,-28(1)	Save left side 
200:    LDC  3,1(6)	Load integer constant 
201:     LD  4,-28(1)	Load left into ac1 
202:    SUB  3,4,3	Op - 
203:     ST  3,-24(1)	Store variable j
204:    LDA  7,-24(7)	go to beginning of loop 
197:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
205:    LDA  3,-3(1)	Load address of base of array p
206:     ST  3,-28(1)	Save left side 
207:     LD  3,-23(1)	Load variable i
208:     LD  4,-28(1)	Load left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
211:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
212:     LD  3,-23(1)	Load variable i
213:     ST  3,-28(1)	Save index 
214:    LDA  3,-3(1)	Load address of base of array p
215:     ST  3,-29(1)	Save left side 
216:     LD  3,-24(1)	Load variable j
217:     LD  4,-29(1)	Load left into ac1 
218:    SUB  3,4,3	compute location from index 
219:     LD  3,0(3)	Load array element 
220:     LD  4,-28(1)	Restore index 
221:    LDA  5,-3(1)	Load address of base of array p
222:    SUB  5,5,4	Compute offset of value 
223:     ST  3,0(5)	Store variable p
* EXPRESSION
224:     LD  3,-24(1)	Load variable j
225:     ST  3,-28(1)	Save index 
226:     LD  3,-27(1)	Load variable tmp
227:     LD  4,-28(1)	Restore index 
228:    LDA  5,-3(1)	Load address of base of array p
229:    SUB  5,5,4	Compute offset of value 
230:     ST  3,0(5)	Store variable p
* EXPRESSION
231:     LD  3,0(0)	Load variable n
232:     ST  3,-25(1)	Store variable r
* EXPRESSION
233:     LD  3,-23(1)	Load variable i
234:     ST  3,-28(1)	Save left side 
235:    LDC  3,1(6)	Load integer constant 
236:     LD  4,-28(1)	Load left into ac1 
237:    ADD  3,4,3	Op + 
238:     ST  3,-26(1)	Store variable s
* WHILE
239:     LD  3,-25(1)	Load variable r
240:     ST  3,-28(1)	Save left side 
241:     LD  3,-26(1)	Load variable s
242:     LD  4,-28(1)	Load left into ac1 
243:    TGT  3,4,3	Op > 
244:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
246:    LDA  3,-3(1)	Load address of base of array p
247:     ST  3,-28(1)	Save left side 
248:     LD  3,-25(1)	Load variable r
249:     LD  4,-28(1)	Load left into ac1 
250:    SUB  3,4,3	compute location from index 
251:     LD  3,0(3)	Load array element 
252:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
253:     LD  3,-25(1)	Load variable r
254:     ST  3,-28(1)	Save index 
255:    LDA  3,-3(1)	Load address of base of array p
256:     ST  3,-29(1)	Save left side 
257:     LD  3,-26(1)	Load variable s
258:     LD  4,-29(1)	Load left into ac1 
259:    SUB  3,4,3	compute location from index 
260:     LD  3,0(3)	Load array element 
261:     LD  4,-28(1)	Restore index 
262:    LDA  5,-3(1)	Load address of base of array p
263:    SUB  5,5,4	Compute offset of value 
264:     ST  3,0(5)	Store variable p
* EXPRESSION
265:     LD  3,-26(1)	Load variable s
266:     ST  3,-28(1)	Save index 
267:     LD  3,-27(1)	Load variable tmp
268:     LD  4,-28(1)	Restore index 
269:    LDA  5,-3(1)	Load address of base of array p
270:    SUB  5,5,4	Compute offset of value 
271:     ST  3,0(5)	Store variable p
* EXPRESSION
272:     LD  3,-25(1)	Load variable r
273:     ST  3,-28(1)	Save left side 
274:    LDC  3,1(6)	Load integer constant 
275:     LD  4,-28(1)	Load left into ac1 
276:    SUB  3,4,3	Op - 
277:     ST  3,-25(1)	Store variable r
* EXPRESSION
278:     LD  3,-26(1)	Load variable s
279:     ST  3,-28(1)	Save left side 
280:    LDC  3,1(6)	Load integer constant 
281:     LD  4,-28(1)	Load left into ac1 
282:    ADD  3,4,3	Op + 
283:     ST  3,-26(1)	Store variable s
* END COMPOUND
284:    LDA  7,-46(7)	go to beginning of loop 
245:    LDA  7,39(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
285:    LDA  7,-155(7)	go to beginning of loop 
137:    LDA  7,148(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
286:    LDC  2,0(6)	Set return value to 0 
287:     LD  3,-1(1)	Load return address 
288:     LD  1,0(1)	Adjust fp 
289:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,289(7)	Jump to init [backpatch] 
* INIT
290:     LD  0,0(0)	Set the global pointer 
291:    LDA  1,-1(0)	set first frame at end of globals 
292:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
293:    LDA  3,1(7)	Return address in ac 
294:    LDA  7,-198(7)	Jump to main 
295:   HALT  0,0,0	DONE! 
* END INIT
