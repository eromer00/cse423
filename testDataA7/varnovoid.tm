* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  varnovoid.c-
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
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-4(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 51:     LD  3,-3(1)	Load address of base of array xa
 52:     ST  3,-6(1)	Save left side 
 53:    LDC  3,3(6)	Load integer constant 
 54:     LD  4,-6(1)	Load left into ac1 
 55:    SUB  3,4,3	compute location from index 
 56:     LD  3,0(3)	Load array element 
 57:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-4(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-4(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 71:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 72:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-2(1)	Load variable x
 74:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-4(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 80:     LD  3,-3(1)	Load address of base of array xa
 81:     ST  3,-6(1)	Save left side 
 82:    LDC  3,3(6)	Load integer constant 
 83:     LD  4,-6(1)	Load left into ac1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
 86:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 87:    LDA  1,-4(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 91:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 92:    LDA  1,-4(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-58(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 96:    LDC  3,668(6)	Load integer constant 
 97:     ST  3,-2(1)	Store variable x
* EXPRESSION
 98:    LDC  3,1(6)	Load integer constant 
 99:     ST  3,-4(1)	Save left side 
100:    LDC  3,2(6)	Load integer constant 
101:     LD  4,-4(1)	Load left into ac1 
102:    ADD  3,4,3	Op + 
103:     ST  3,-4(1)	Save index 
104:    LDC  3,669(6)	Load integer constant 
105:     LD  4,-4(1)	Restore index 
106:     LD  5,-3(1)	Load address of base of array xa
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable xa
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
110:     LD  3,-2(1)	Load variable x
111:     ST  3,-6(1)	Store parameter 
*                       Jump to output
112:    LDA  1,-4(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-109(7)	CALL output
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
116:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
117:     LD  3,-3(1)	Load address of base of array xa
118:     ST  3,-6(1)	Save left side 
119:    LDC  3,3(6)	Load integer constant 
120:     LD  4,-6(1)	Load left into ac1 
121:    SUB  3,4,3	compute location from index 
122:     LD  3,0(3)	Load array element 
123:     ST  3,-6(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-4(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
128:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
129:    LDA  1,-4(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-95(7)	CALL outnl
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
133:    LDC  3,670(6)	Load integer constant 
134:     ST  3,0(0)	Store variable g
* EXPRESSION
135:    LDC  3,2(6)	Load integer constant 
136:     ST  3,-4(1)	Save left side 
137:    LDC  3,1(6)	Load integer constant 
138:     LD  4,-4(1)	Load left into ac1 
139:    ADD  3,4,3	Op + 
140:     ST  3,-4(1)	Save index 
141:    LDC  3,671(6)	Load integer constant 
142:     LD  4,-4(1)	Restore index 
143:    LDA  5,-2(0)	Load address of base of array ga
144:    SUB  5,5,4	Compute offset of value 
145:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  output
146:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
147:     LD  3,0(0)	Load variable g
148:     ST  3,-6(1)	Store parameter 
*                       Jump to output
149:    LDA  1,-4(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
153:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDA  3,-2(0)	Load address of base of array ga
155:     ST  3,-6(1)	Save left side 
156:    LDC  3,3(6)	Load integer constant 
157:     LD  4,-6(1)	Load left into ac1 
158:    SUB  3,4,3	compute location from index 
159:     LD  3,0(3)	Load array element 
160:     ST  3,-6(1)	Store parameter 
*                       Jump to output
161:    LDA  1,-4(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
165:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
166:    LDA  1,-4(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-132(7)	CALL outnl
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  cat
170:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
171:     LD  3,-2(1)	Load variable x
172:     ST  3,-6(1)	Store parameter 
*                       Load param 2
173:     LD  3,-3(1)	Load address of base of array xa
174:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
175:    LDA  1,-4(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-136(7)	CALL cat
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  cat
179:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
180:     LD  3,0(0)	Load variable g
181:     ST  3,-6(1)	Store parameter 
*                       Load param 2
182:    LDA  3,-2(0)	Load address of base of array ga
183:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
184:    LDA  1,-4(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-145(7)	CALL cat
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
188:    LDC  2,0(6)	Set return value to 0 
189:     LD  3,-1(1)	Load return address 
190:     LD  1,0(1)	Adjust fp 
191:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
192:     ST  3,-1(1)	Store return address. 
* COMPOUND
193:    LDC  3,10(6)	load size of array ya
194:     ST  3,-3(1)	save size of array ya
* Compound Body
* EXPRESSION
195:    LDC  3,666(6)	Load integer constant 
196:     ST  3,-2(1)	Store variable y
* EXPRESSION
197:    LDC  3,1(6)	Load integer constant 
198:     ST  3,-14(1)	Save left side 
199:    LDC  3,2(6)	Load integer constant 
200:     LD  4,-14(1)	Load left into ac1 
201:    ADD  3,4,3	Op + 
202:     ST  3,-14(1)	Save index 
203:    LDC  3,667(6)	Load integer constant 
204:     LD  4,-14(1)	Restore index 
205:    LDA  5,-4(1)	Load address of base of array ya
206:    SUB  5,5,4	Compute offset of value 
207:     ST  3,0(5)	Store variable ya
* EXPRESSION
*                       Begin call to  output
208:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
209:     LD  3,-2(1)	Load variable y
210:     ST  3,-16(1)	Store parameter 
*                       Jump to output
211:    LDA  1,-14(1)	Load address of new frame 
212:    LDA  3,1(7)	Return address in ac 
213:    LDA  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
215:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
216:    LDA  3,-4(1)	Load address of base of array ya
217:     ST  3,-16(1)	Save left side 
218:    LDC  3,3(6)	Load integer constant 
219:     LD  4,-16(1)	Load left into ac1 
220:    SUB  3,4,3	compute location from index 
221:     LD  3,0(3)	Load array element 
222:     ST  3,-16(1)	Store parameter 
*                       Jump to output
223:    LDA  1,-14(1)	Load address of new frame 
224:    LDA  3,1(7)	Return address in ac 
225:    LDA  7,-220(7)	CALL output
226:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
227:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
228:    LDA  1,-14(1)	Load address of new frame 
229:    LDA  3,1(7)	Return address in ac 
230:    LDA  7,-194(7)	CALL outnl
231:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  dog
232:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
233:     LD  3,-2(1)	Load variable y
234:     ST  3,-16(1)	Store parameter 
*                       Load param 2
235:    LDA  3,-4(1)	Load address of base of array ya
236:     ST  3,-17(1)	Store parameter 
*                       Jump to dog
237:    LDA  1,-14(1)	Load address of new frame 
238:    LDA  3,1(7)	Return address in ac 
239:    LDA  7,-169(7)	CALL dog
240:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
241:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
242:     LD  3,-2(1)	Load variable y
243:     ST  3,-16(1)	Store parameter 
*                       Jump to output
244:    LDA  1,-14(1)	Load address of new frame 
245:    LDA  3,1(7)	Return address in ac 
246:    LDA  7,-241(7)	CALL output
247:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
248:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
249:    LDA  3,-4(1)	Load address of base of array ya
250:     ST  3,-16(1)	Save left side 
251:    LDC  3,3(6)	Load integer constant 
252:     LD  4,-16(1)	Load left into ac1 
253:    SUB  3,4,3	compute location from index 
254:     LD  3,0(3)	Load array element 
255:     ST  3,-16(1)	Store parameter 
*                       Jump to output
256:    LDA  1,-14(1)	Load address of new frame 
257:    LDA  3,1(7)	Return address in ac 
258:    LDA  7,-253(7)	CALL output
259:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
260:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
261:    LDA  1,-14(1)	Load address of new frame 
262:    LDA  3,1(7)	Return address in ac 
263:    LDA  7,-227(7)	CALL outnl
264:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
265:    LDC  2,0(6)	Set return value to 0 
266:     LD  3,-1(1)	Load return address 
267:     LD  1,0(1)	Adjust fp 
268:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,268(7)	Jump to init [backpatch] 
* INIT
269:     LD  0,0(0)	Set the global pointer 
270:    LDA  1,-12(0)	set first frame at end of globals 
271:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
272:    LDC  3,10(6)	load size of array ga
273:     ST  3,-1(0)	save size of array ga
* END INIT GLOBALS AND STATICS
274:    LDA  3,1(7)	Return address in ac 
275:    LDA  7,-84(7)	Jump to main 
276:   HALT  0,0,0	DONE! 
* END INIT
