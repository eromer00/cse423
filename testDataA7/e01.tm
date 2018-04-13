* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  e01.c-
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
*                       Begin call to  output
 45:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDC  3,13(6)	Load integer constant 
 47:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 48:    LDA  1,-3(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 44:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 53:    LDC  3,23(6)	Load integer constant 
 54:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 55:    LDA  1,-3(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 59:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 60:    LDA  1,-3(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-26(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 64:    LDC  3,0(6)	Load Boolean constant 
 65:     ST  3,-2(1)	Store variable x
* IF
 66:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 69:    LDC  3,44(6)	Load integer constant 
 70:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 71:    LDA  1,-3(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 67:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 75:     LD  3,-2(1)	Load variable x
 76:    LDC  4,1(6)	Load 1 
 77:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 80:    LDC  3,55(6)	Load integer constant 
 81:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 82:    LDA  1,-3(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 78:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
 86:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 87:    LDA  1,-3(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-53(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 91:    LDC  3,3(6)	Load integer constant 
 92:     ST  3,-3(1)	Save left side 
 93:    LDC  3,1(6)	Load integer constant 
 94:     LD  4,-3(1)	Load left into ac1 
 95:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDC  3,987(6)	Load integer constant 
 99:     ST  3,-5(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-3(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 96:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
104:    LDC  3,3(6)	Load integer constant 
105:     ST  3,-3(1)	Save left side 
106:    LDC  3,1(6)	Load integer constant 
107:     LD  4,-3(1)	Load left into ac1 
108:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
110:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
111:    LDC  3,211(6)	Load integer constant 
112:     ST  3,-5(1)	Store parameter 
*                       Jump to output
113:    LDA  1,-3(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
109:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
117:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
118:    LDA  1,-3(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-84(7)	CALL outnl
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
122:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
124:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
125:    LDC  3,13(6)	Load integer constant 
126:     ST  3,-5(1)	Store parameter 
*                       Jump to output
127:    LDA  1,-3(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
123:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
132:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
133:    LDC  3,51(6)	Load integer constant 
134:     ST  3,-5(1)	Store parameter 
*                       Jump to output
135:    LDA  1,-3(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
131:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
139:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
142:    LDC  3,23(6)	Load integer constant 
143:     ST  3,-5(1)	Store parameter 
*                       Jump to output
144:    LDA  1,-3(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
140:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
149:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
150:    LDC  3,451(6)	Load integer constant 
151:     ST  3,-5(1)	Store parameter 
*                       Jump to output
152:    LDA  1,-3(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
148:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
156:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
157:    LDA  1,-3(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-123(7)	CALL outnl
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
161:    LDC  3,0(6)	Load Boolean constant 
162:     ST  3,-2(1)	Store variable x
* IF
163:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
165:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
166:    LDC  3,44(6)	Load integer constant 
167:     ST  3,-5(1)	Store parameter 
*                       Jump to output
168:    LDA  1,-3(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
164:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
173:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
174:    LDC  3,514(6)	Load integer constant 
175:     ST  3,-5(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-3(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
172:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
180:     LD  3,-2(1)	Load variable x
181:    LDC  4,1(6)	Load 1 
182:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
184:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
185:    LDC  3,55(6)	Load integer constant 
186:     ST  3,-5(1)	Store parameter 
*                       Jump to output
187:    LDA  1,-3(1)	Load address of new frame 
188:    LDA  3,1(7)	Return address in ac 
189:    LDA  7,-184(7)	CALL output
190:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
183:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
192:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
193:    LDC  3,1514(6)	Load integer constant 
194:     ST  3,-5(1)	Store parameter 
*                       Jump to output
195:    LDA  1,-3(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-192(7)	CALL output
198:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
191:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
199:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
200:    LDA  1,-3(1)	Load address of new frame 
201:    LDA  3,1(7)	Return address in ac 
202:    LDA  7,-166(7)	CALL outnl
203:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
204:    LDC  3,3(6)	Load integer constant 
205:     ST  3,-3(1)	Save left side 
206:    LDC  3,1(6)	Load integer constant 
207:     LD  4,-3(1)	Load left into ac1 
208:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
210:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
211:    LDC  3,987(6)	Load integer constant 
212:     ST  3,-5(1)	Store parameter 
*                       Jump to output
213:    LDA  1,-3(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
209:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
218:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
219:    LDC  3,114(6)	Load integer constant 
220:     ST  3,-5(1)	Store parameter 
*                       Jump to output
221:    LDA  1,-3(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-218(7)	CALL output
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
217:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
225:    LDC  3,3(6)	Load integer constant 
226:     ST  3,-3(1)	Save left side 
227:    LDC  3,1(6)	Load integer constant 
228:     LD  4,-3(1)	Load left into ac1 
229:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
231:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
232:    LDC  3,211(6)	Load integer constant 
233:     ST  3,-5(1)	Store parameter 
*                       Jump to output
234:    LDA  1,-3(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
230:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
239:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
240:    LDC  3,1614(6)	Load integer constant 
241:     ST  3,-5(1)	Store parameter 
*                       Jump to output
242:    LDA  1,-3(1)	Load address of new frame 
243:    LDA  3,1(7)	Return address in ac 
244:    LDA  7,-239(7)	CALL output
245:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
238:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
246:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
247:    LDA  1,-3(1)	Load address of new frame 
248:    LDA  3,1(7)	Return address in ac 
249:    LDA  7,-213(7)	CALL outnl
250:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
251:    LDC  2,0(6)	Set return value to 0 
252:     LD  3,-1(1)	Load return address 
253:     LD  1,0(1)	Adjust fp 
254:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,254(7)	Jump to init [backpatch] 
* INIT
255:     LD  0,0(0)	Set the global pointer 
256:    LDA  1,0(0)	set first frame at end of globals 
257:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-218(7)	Jump to main 
260:   HALT  0,0,0	DONE! 
* END INIT
