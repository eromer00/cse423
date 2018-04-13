* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  vararray.c-
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
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load address of base of array q
 45:     ST  3,-5(1)	Save left side 
 46:    LDC  3,10(6)	Load integer constant 
 47:     LD  4,-5(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6)	Set return value to 0 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 59:     ST  3,-1(1)	Store return address. 
* COMPOUND
 60:    LDC  3,9(6)	load size of array y
 61:     ST  3,-3(1)	save size of array y
 62:    LDC  3,10(6)	load size of array z
 63:     ST  3,-13(1)	save size of array z
* Compound Body
* EXPRESSION
*                       Begin call to  output
 64:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
 65:     LD  3,-2(1)	Load address of base of array x
 66:     LD  3,1(3)	Load array size 
 67:     ST  3,-26(1)	Store parameter 
*                       Jump to output
 68:    LDA  1,-24(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 72:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Jump to outnl
 73:    LDA  1,-24(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-39(7)	CALL outnl
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
 78:     LD  3,-2(1)	Load address of base of array x
 79:     ST  3,-26(1)	Save left side 
 80:    LDC  3,10(6)	Load integer constant 
 81:     LD  4,-26(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     ST  3,-26(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-24(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  cat
 89:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
 90:     LD  3,-2(1)	Load address of base of array x
 91:     ST  3,-26(1)	Store parameter 
*                       Jump to cat
 92:    LDA  1,-24(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-53(7)	CALL cat
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  outnl
 96:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Jump to outnl
 97:    LDA  1,-24(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-63(7)	CALL outnl
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
101:    LDC  3,5(6)	Load integer constant 
102:     ST  3,-24(1)	Save index 
103:    LDA  3,-4(1)	Load address of base of array y
104:     ST  3,-25(1)	Save left side 
105:    LDC  3,5(6)	Load integer constant 
106:     LD  4,-25(1)	Load left into ac1 
107:    SUB  3,4,3	compute location from index 
108:     LD  3,0(3)	Load array element 
109:     LD  4,-24(1)	Restore index 
110:     LD  5,-2(1)	Load address of base of array x
111:    SUB  5,5,4	Compute offset of value 
112:     ST  3,0(5)	Store variable x
* EXPRESSION
113:    LDC  3,6(6)	Load integer constant 
114:     ST  3,-24(1)	Save index 
115:    LDA  3,-1(0)	Load address of base of array g
116:     ST  3,-25(1)	Save left side 
117:    LDC  3,6(6)	Load integer constant 
118:     LD  4,-25(1)	Load left into ac1 
119:    SUB  3,4,3	compute location from index 
120:     LD  3,0(3)	Load array element 
121:     LD  4,-24(1)	Restore index 
122:    LDA  5,-14(1)	Load address of base of array z
123:    SUB  5,5,4	Compute offset of value 
124:     ST  3,0(5)	Store variable z
* RETURN
125:    LDA  3,-14(1)	Load address of base of array z
126:     ST  3,-24(1)	Save left side 
127:    LDC  3,4(6)	Load integer constant 
128:     LD  4,-24(1)	Load left into ac1 
129:    SUB  3,4,3	compute location from index 
130:     LD  3,0(3)	Load array element 
131:    LDA  2,0(3)	Copy result to rt register 
132:     LD  3,-1(1)	Load return address 
133:     LD  1,0(1)	Adjust fp 
134:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
135:    LDC  2,0(6)	Set return value to 0 
136:     LD  3,-1(1)	Load return address 
137:     LD  1,0(1)	Adjust fp 
138:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
139:     ST  3,-1(1)	Store return address. 
* COMPOUND
140:    LDC  3,11(6)	load size of array m
141:     ST  3,-2(1)	save size of array m
142:    LDC  3,13(6)	load size of array z
143:     ST  3,-14(1)	save size of array z
* Compound Body
* EXPRESSION
144:    LDC  3,10(6)	Load integer constant 
145:     ST  3,-28(1)	Save index 
146:    LDC  3,111(6)	Load integer constant 
147:     LD  4,-28(1)	Restore index 
148:    LDA  5,-3(1)	Load address of base of array m
149:    SUB  5,5,4	Compute offset of value 
150:     ST  3,0(5)	Store variable m
* EXPRESSION
*                       Begin call to  dog
151:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
152:    LDA  3,-3(1)	Load address of base of array m
153:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
154:    LDA  1,-28(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-98(7)	CALL dog
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
158:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
159:    LDA  3,-3(1)	Load address of base of array m
160:     ST  3,-30(1)	Save left side 
161:    LDC  3,10(6)	Load integer constant 
162:     LD  4,-30(1)	Load left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
165:     ST  3,-30(1)	Store parameter 
*                       Jump to output
166:    LDA  1,-28(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-163(7)	CALL output
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
170:    LDC  3,10(6)	Load integer constant 
171:     ST  3,-28(1)	Save index 
172:    LDC  3,222(6)	Load integer constant 
173:     LD  4,-28(1)	Restore index 
174:    LDA  5,-1(0)	Load address of base of array g
175:    SUB  5,5,4	Compute offset of value 
176:     ST  3,0(5)	Store variable g
* EXPRESSION
*                       Begin call to  dog
177:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
178:    LDA  3,-1(0)	Load address of base of array g
179:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
180:    LDA  1,-28(1)	Load address of new frame 
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-124(7)	CALL dog
183:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
184:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
185:    LDA  3,-1(0)	Load address of base of array g
186:     ST  3,-30(1)	Save left side 
187:    LDC  3,10(6)	Load integer constant 
188:     LD  4,-30(1)	Load left into ac1 
189:    SUB  3,4,3	compute location from index 
190:     LD  3,0(3)	Load array element 
191:     ST  3,-30(1)	Store parameter 
*                       Jump to output
192:    LDA  1,-28(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
196:    LDC  3,10(6)	Load integer constant 
197:     ST  3,-28(1)	Save index 
198:    LDC  3,333(6)	Load integer constant 
199:     LD  4,-28(1)	Restore index 
200:    LDA  5,-15(1)	Load address of base of array z
201:    SUB  5,5,4	Compute offset of value 
202:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  dog
203:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
204:    LDA  3,-15(1)	Load address of base of array z
205:     ST  3,-30(1)	Store parameter 
*                       Jump to dog
206:    LDA  1,-28(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-150(7)	CALL dog
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
210:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
211:    LDA  3,-15(1)	Load address of base of array z
212:     ST  3,-30(1)	Save left side 
213:    LDC  3,10(6)	Load integer constant 
214:     LD  4,-30(1)	Load left into ac1 
215:    SUB  3,4,3	compute location from index 
216:     LD  3,0(3)	Load array element 
217:     ST  3,-30(1)	Store parameter 
*                       Jump to output
218:    LDA  1,-28(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
222:    LDC  2,0(6)	Set return value to 0 
223:     LD  3,-1(1)	Load return address 
224:     LD  1,0(1)	Adjust fp 
225:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,225(7)	Jump to init [backpatch] 
* INIT
226:     LD  0,0(0)	Set the global pointer 
227:    LDA  1,-13(0)	set first frame at end of globals 
228:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
229:    LDC  3,12(6)	load size of array g
230:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-94(7)	Jump to main 
233:   HALT  0,0,0	DONE! 
* END INIT
