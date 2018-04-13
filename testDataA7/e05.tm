* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  e05.c-
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
* IF
 45:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 48:    LDC  3,13(6)	Load integer constant 
 49:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-3(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 46:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 44:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 54:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
 56:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDC  3,23(6)	Load integer constant 
 60:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-3(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 57:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 55:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
 65:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 66:    LDA  1,-3(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-32(7)	CALL outnl
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 70:    LDC  3,0(6)	Load Boolean constant 
 71:     ST  3,-2(1)	Store variable x
* IF
 72:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
 74:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
 76:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDC  3,44(6)	Load integer constant 
 78:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-3(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 75:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 73:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 83:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
 85:     LD  3,-2(1)	Load variable x
 86:    LDC  4,1(6)	Load 1 
 87:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDC  3,55(6)	Load integer constant 
 91:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 92:    LDA  1,-3(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-89(7)	CALL output
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 88:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 84:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
 96:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 97:    LDA  1,-3(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-63(7)	CALL outnl
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
101:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
103:    LDC  3,3(6)	Load integer constant 
104:     ST  3,-3(1)	Save left side 
105:    LDC  3,1(6)	Load integer constant 
106:     LD  4,-3(1)	Load left into ac1 
107:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,987(6)	Load integer constant 
111:     ST  3,-5(1)	Store parameter 
*                       Jump to output
112:    LDA  1,-3(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-109(7)	CALL output
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
108:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
102:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
116:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
118:    LDC  3,3(6)	Load integer constant 
119:     ST  3,-3(1)	Save left side 
120:    LDC  3,1(6)	Load integer constant 
121:     LD  4,-3(1)	Load left into ac1 
122:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
124:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
125:    LDC  3,211(6)	Load integer constant 
126:     ST  3,-5(1)	Store parameter 
*                       Jump to output
127:    LDA  1,-3(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
123:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
117:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
131:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
132:    LDA  1,-3(1)	Load address of new frame 
133:    LDA  3,1(7)	Return address in ac 
134:    LDA  7,-98(7)	CALL outnl
135:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
136:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
138:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
140:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
141:    LDC  3,13(6)	Load integer constant 
142:     ST  3,-5(1)	Store parameter 
*                       Jump to output
143:    LDA  1,-3(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
139:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
148:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
149:    LDC  3,51(6)	Load integer constant 
150:     ST  3,-5(1)	Store parameter 
*                       Jump to output
151:    LDA  1,-3(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
147:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
137:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
155:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
157:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
159:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
160:    LDC  3,23(6)	Load integer constant 
161:     ST  3,-5(1)	Store parameter 
*                       Jump to output
162:    LDA  1,-3(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
158:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
167:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
168:    LDC  3,451(6)	Load integer constant 
169:     ST  3,-5(1)	Store parameter 
*                       Jump to output
170:    LDA  1,-3(1)	Load address of new frame 
171:    LDA  3,1(7)	Return address in ac 
172:    LDA  7,-167(7)	CALL output
173:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
166:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
156:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
174:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
175:    LDA  1,-3(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-141(7)	CALL outnl
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
179:    LDC  3,0(6)	Load Boolean constant 
180:     ST  3,-2(1)	Store variable x
* IF
181:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
183:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
185:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
186:    LDC  3,44(6)	Load integer constant 
187:     ST  3,-5(1)	Store parameter 
*                       Jump to output
188:    LDA  1,-3(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-185(7)	CALL output
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
184:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
193:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
194:    LDC  3,514(6)	Load integer constant 
195:     ST  3,-5(1)	Store parameter 
*                       Jump to output
196:    LDA  1,-3(1)	Load address of new frame 
197:    LDA  3,1(7)	Return address in ac 
198:    LDA  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
192:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
182:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
200:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
202:     LD  3,-2(1)	Load variable x
203:    LDC  4,1(6)	Load 1 
204:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
206:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
207:    LDC  3,55(6)	Load integer constant 
208:     ST  3,-5(1)	Store parameter 
*                       Jump to output
209:    LDA  1,-3(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-206(7)	CALL output
212:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
205:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
214:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
215:    LDC  3,1514(6)	Load integer constant 
216:     ST  3,-5(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-3(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
213:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
201:    JZR  3,19(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
221:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
222:    LDA  1,-3(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
226:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
228:    LDC  3,3(6)	Load integer constant 
229:     ST  3,-3(1)	Save left side 
230:    LDC  3,1(6)	Load integer constant 
231:     LD  4,-3(1)	Load left into ac1 
232:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
234:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
235:    LDC  3,987(6)	Load integer constant 
236:     ST  3,-5(1)	Store parameter 
*                       Jump to output
237:    LDA  1,-3(1)	Load address of new frame 
238:    LDA  3,1(7)	Return address in ac 
239:    LDA  7,-234(7)	CALL output
240:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
233:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
242:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
243:    LDC  3,114(6)	Load integer constant 
244:     ST  3,-5(1)	Store parameter 
*                       Jump to output
245:    LDA  1,-3(1)	Load address of new frame 
246:    LDA  3,1(7)	Return address in ac 
247:    LDA  7,-242(7)	CALL output
248:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
241:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
227:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
249:    LDC  3,1(6)	Load Boolean constant 
* THEN
* IF
251:    LDC  3,3(6)	Load integer constant 
252:     ST  3,-3(1)	Save left side 
253:    LDC  3,1(6)	Load integer constant 
254:     LD  4,-3(1)	Load left into ac1 
255:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
257:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
258:    LDC  3,211(6)	Load integer constant 
259:     ST  3,-5(1)	Store parameter 
*                       Jump to output
260:    LDA  1,-3(1)	Load address of new frame 
261:    LDA  3,1(7)	Return address in ac 
262:    LDA  7,-257(7)	CALL output
263:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
256:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
265:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
266:    LDC  3,1614(6)	Load integer constant 
267:     ST  3,-5(1)	Store parameter 
*                       Jump to output
268:    LDA  1,-3(1)	Load address of new frame 
269:    LDA  3,1(7)	Return address in ac 
270:    LDA  7,-265(7)	CALL output
271:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
264:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
250:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
272:    LDC  2,0(6)	Set return value to 0 
273:     LD  3,-1(1)	Load return address 
274:     LD  1,0(1)	Adjust fp 
275:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,275(7)	Jump to init [backpatch] 
* INIT
276:     LD  0,0(0)	Set the global pointer 
277:    LDA  1,0(0)	set first frame at end of globals 
278:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
279:    LDA  3,1(7)	Return address in ac 
280:    LDA  7,-239(7)	Jump to main 
281:   HALT  0,0,0	DONE! 
* END INIT
