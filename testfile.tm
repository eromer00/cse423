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
43:     ST  3,0(1)	Store variable (null)
44:    LDC  3,-2(6)	Load variable
 45:    ADD  3,4,3	Op +
 46:    SUB  3,4,3	Op -
 47:    MUL  3,4,3	Op *
 48:    MUL  3,4,3	Op *
49:    LDC  3,111(6)	Load int constant
50:    LDC  3,1(6)	Load int constant
51:    LDC  3,2(6)	Load int constant
52:    LDC  3,389(6)	Load int constant
 53:    MUL  3,4,3	Op *
 54:    DIV  3,4,3	Op /
55:    LDC  3,123(6)	Load int constant
56:    LDC  3,12(6)	Load int constant
57:    LDC  3,548(6)	Load int constant
58:     ST  3,-2(1)	Store variable x
59:    LDC  3,-4(6)	Load variable
 60:    ADD  3,4,3	Op +
 61:    ADD  3,4,3	Op +
62:    LDC  3,100(6)	Load int constant
63:    LDC  3,299(6)	Load int constant
64:    LDC  3,123(6)	Load int constant
65:     ST  3,-4(1)	Store variable u1
66:    LDC  3,-5(6)	Load variable
 67:    SUB  3,4,3	Op -
68:    LDC  3,1999(6)	Load int constant
 69:    DIV  3,4,3	Op /
 70:    MUL  3,4,3	Op *
71:    LDC  3,150(6)	Load int constant
72:    LDC  3,199(6)	Load int constant
73:    LDC  3,299(6)	Load int constant
*			 Begin call to output
74:     ST  1,-13(1)	Store old fp in ghost frame
75:    LDC  3,-2(6)	Load variable
76:     ST  3,-15(1)	Store Parameter
*			 Jump to output
77:    LDA 1,-13(1)	Load address of new frame
78:    LDA 3,1(7)	Return address in ac
79:    LDA 7,-74(7)	CALL output
80:    LDA 3,0(2)	save result in ac
81:     ST  3,-2(1)	Store variable x
82:    LDC  3,-3(6)	Load variable
83:    LDC  3,222(6)	Load int constant
*			 Begin call to output
84:     ST  1,-13(1)	Store old fp in ghost frame
85:    LDC  3,-3(6)	Load variable
86:     ST  3,-15(1)	Store Parameter
*			 Jump to output
87:    LDA 1,-13(1)	Load address of new frame
88:    LDA 3,1(7)	Return address in ac
89:    LDA 7,-84(7)	CALL output
90:    LDA 3,0(2)	save result in ac
91:     ST  3,-3(1)	Store variable y
92:    LDC  3,-11(6)	Load variable
93:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
94:     ST  1,-13(1)	Store old fp in ghost frame
95:    LDC  3,-11(6)	Load variable
96:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
97:    LDA 1,-13(1)	Load address of new frame
98:    LDA 3,1(7)	Return address in ac
99:    LDA 7,-82(7)	CALL outputb
100:    LDA 3,0(2)	save result in ac
101:     ST  3,-11(1)	Store variable a
102:    LDC  3,-12(6)	Load variable
103:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
104:     ST  1,-13(1)	Store old fp in ghost frame
105:    LDC  3,-12(6)	Load variable
106:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
107:    LDA 1,-13(1)	Load address of new frame
108:    LDA 3,1(7)	Return address in ac
109:    LDA 7,-92(7)	CALL outputb
110:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
111:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
112:    LDA 1,-13(1)	Load address of new frame
113:    LDA 3,1(7)	Return address in ac
114:    LDA 7,-78(7)	CALL outnl
115:    LDA 3,0(2)	save result in ac
116:     ST  3,-12(1)	Store variable b
117:    LDC  3,0(6)	Load variable
118:    LDC  3,333(6)	Load int constant
*			 Begin call to output
119:     ST  1,-13(1)	Store old fp in ghost frame
120:    LDC  3,0(6)	Load variable
121:     ST  3,-15(1)	Store Parameter
*			 Jump to output
122:    LDA 1,-13(1)	Load address of new frame
123:    LDA 3,1(7)	Return address in ac
124:    LDA 7,-119(7)	CALL output
125:    LDA 3,0(2)	save result in ac
126:     ST  3,0(1)	Store variable gx
127:    LDC  3,-1(6)	Load variable
128:    LDC  3,444(6)	Load int constant
*			 Begin call to output
129:     ST  1,-13(1)	Store old fp in ghost frame
130:    LDC  3,-1(6)	Load variable
131:     ST  3,-15(1)	Store Parameter
*			 Jump to output
132:    LDA 1,-13(1)	Load address of new frame
133:    LDA 3,1(7)	Return address in ac
134:    LDA 7,-129(7)	CALL output
135:    LDA 3,0(2)	save result in ac
136:     ST  3,-1(1)	Store variable gy
137:    LDC  3,-7(6)	Load variable
 138:    DIV  3,4,3	Op /
 139:    MUL  3,4,3	Op *
 140:    MUL  3,4,3	Op *
141:    LDC  3,100(6)	Load int constant
142:    LDC  3,30(6)	Load int constant
143:    LDC  3,10(6)	Load int constant
144:    LDC  3,150(6)	Load int constant
145:     ST  3,-7(1)	Store variable u4
146:    LDC  3,-9(6)	Load variable
 147:    ADD  3,4,3	Op +
 148:    DIV  3,4,3	Op /
 149:    MUL  3,4,3	Op *
 150:    MUL  3,4,3	Op *
151:    LDC  3,200(6)	Load int constant
 152:    SUB  3,4,3	Op -
 153:    SUB  3,4,3	Op -
154:    LDC  3,1(6)	Load int constant
155:    LDC  3,213(6)	Load int constant
156:    LDC  3,123(6)	Load int constant
157:    LDC  3,1231(6)	Load int constant
158:    LDC  3,342(6)	Load int constant
159:    LDC  3,123(6)	Load int constant
160:     ST  3,-9(1)	Store variable u6
161:    LDC  3,-2(6)	Load variable
162:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
163:     ST  1,-13(1)	Store old fp in ghost frame
164:    LDC  3,-2(6)	Load variable
165:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
166:    LDA 1,-13(1)	Load address of new frame
167:    LDA 3,1(7)	Return address in ac
168:    LDA 7,-151(7)	CALL outputb
169:    LDA 3,0(2)	save result in ac
170:     ST  3,-2(1)	Store variable ga
171:    LDC  3,-3(6)	Load variable
172:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
173:     ST  1,-13(1)	Store old fp in ghost frame
174:    LDC  3,-3(6)	Load variable
175:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
176:    LDA 1,-13(1)	Load address of new frame
177:    LDA 3,1(7)	Return address in ac
178:    LDA 7,-161(7)	CALL outputb
179:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
180:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
181:    LDA 1,-13(1)	Load address of new frame
182:    LDA 3,1(7)	Return address in ac
183:    LDA 7,-147(7)	CALL outnl
184:    LDA 3,0(2)	save result in ac
185:     ST  3,-3(1)	Store variable gb
186:    LDC  3,-2(6)	Load variable
187:    LDC  3,-3(6)	Load variable
*			 Begin call to output
188:     ST  1,-13(1)	Store old fp in ghost frame
189:    LDC  3,-2(6)	Load variable
190:     ST  3,-15(1)	Store Parameter
*			 Jump to output
191:    LDA 1,-13(1)	Load address of new frame
192:    LDA 3,1(7)	Return address in ac
193:    LDA 7,-188(7)	CALL output
194:    LDA 3,0(2)	save result in ac
195:     ST  3,-2(1)	Store variable x
196:    LDC  3,-11(6)	Load variable
197:    LDC  3,-12(6)	Load variable
*			 Begin call to outputb
198:     ST  1,-13(1)	Store old fp in ghost frame
199:    LDC  3,-11(6)	Load variable
200:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
201:    LDA 1,-13(1)	Load address of new frame
202:    LDA 3,1(7)	Return address in ac
203:    LDA 7,-186(7)	CALL outputb
204:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
205:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
206:    LDA 1,-13(1)	Load address of new frame
207:    LDA 3,1(7)	Return address in ac
208:    LDA 7,-172(7)	CALL outnl
209:    LDA 3,0(2)	save result in ac
210:     ST  3,-11(1)	Store variable a
211:    LDC  3,0(6)	Load variable
212:    LDC  3,-1(6)	Load variable
*			 Begin call to output
213:     ST  1,-13(1)	Store old fp in ghost frame
214:    LDC  3,0(6)	Load variable
215:     ST  3,-15(1)	Store Parameter
*			 Jump to output
216:    LDA 1,-13(1)	Load address of new frame
217:    LDA 3,1(7)	Return address in ac
218:    LDA 7,-213(7)	CALL output
219:    LDA 3,0(2)	save result in ac
220:     ST  3,0(1)	Store variable gx
221:    LDC  3,-2(6)	Load variable
222:    LDC  3,-3(6)	Load variable
*			 Begin call to outputb
223:     ST  1,-13(1)	Store old fp in ghost frame
224:    LDC  3,-2(6)	Load variable
225:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
226:    LDA 1,-13(1)	Load address of new frame
227:    LDA 3,1(7)	Return address in ac
228:    LDA 7,-211(7)	CALL outputb
229:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
230:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
231:    LDA 1,-13(1)	Load address of new frame
232:    LDA 3,1(7)	Return address in ac
233:    LDA 7,-197(7)	CALL outnl
234:    LDA 3,0(2)	save result in ac
235:     ST  3,-2(1)	Store variable ga
236:    LDC  3,-6(6)	Load variable
 237:    ADD  3,4,3	Op +
 238:    ADD  3,4,3	Op +
 239:    ADD  3,4,3	Op +
240:    LDC  3,100(6)	Load int constant
241:    LDC  3,199(6)	Load int constant
242:    LDC  3,123(6)	Load int constant
243:    LDC  3,159(6)	Load int constant
244:     ST  3,-6(1)	Store variable u3
245:    LDC  3,-8(6)	Load variable
 246:    ADD  3,4,3	Op +
 247:    ADD  3,4,3	Op +
 248:    ADD  3,4,3	Op +
249:    LDC  3,10(6)	Load int constant
250:    LDC  3,123(6)	Load int constant
251:    LDC  3,12314(6)	Load int constant
 252:    MUL  3,4,3	Op *
 253:    DIV  3,4,3	Op /
 254:    DIV  3,4,3	Op /
255:    LDC  3,123321(6)	Load int constant
256:    LDC  3,123(6)	Load int constant
257:    LDC  3,12(6)	Load int constant
258:    LDC  3,159(6)	Load int constant
* END COMPOUND
* END FUNCTION main
0:    LDA  7,258(7)	Jump to init [backpatch]
* INIT
259:     LD  0,0(0)	Set the global pointer
260:    LDA  1,0(0)	set first frame at end of globals
261:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
262:    LDA  3,1(7)	Return address in ac
263:    LDA  7,-222(7)	Jump to main
264:   HALT  0,0,0	DONE!
* END INIT
