* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  sort.c-
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
* FUNCTION minloc
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-3(1)	Load variable low
 44:     ST  3,-7(1)	Store variable k
* EXPRESSION
 45:     LD  3,-2(1)	Load address of base of array a
 46:     ST  3,-8(1)	Save left side 
 47:     LD  3,-3(1)	Load variable low
 48:     LD  4,-8(1)	Load left into ac1 
 49:    SUB  3,4,3	compute location from index 
 50:     LD  3,0(3)	Load array element 
 51:     ST  3,-6(1)	Store variable x
* EXPRESSION
 52:     LD  3,-3(1)	Load variable low
 53:     ST  3,-8(1)	Save left side 
 54:    LDC  3,1(6)	Load integer constant 
 55:     LD  4,-8(1)	Load left into ac1 
 56:    ADD  3,4,3	Op + 
 57:     ST  3,-5(1)	Store variable i
* WHILE
 58:     LD  3,-5(1)	Load variable i
 59:     ST  3,-8(1)	Save left side 
 60:     LD  3,-4(1)	Load variable high
 61:     LD  4,-8(1)	Load left into ac1 
 62:    TLT  3,4,3	Op < 
 63:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
 65:     LD  3,-2(1)	Load address of base of array a
 66:     ST  3,-8(1)	Save left side 
 67:     LD  3,-5(1)	Load variable i
 68:     LD  4,-8(1)	Load left into ac1 
 69:    SUB  3,4,3	compute location from index 
 70:     LD  3,0(3)	Load array element 
 71:     ST  3,-8(1)	Save left side 
 72:     LD  3,-6(1)	Load variable x
 73:     LD  4,-8(1)	Load left into ac1 
 74:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 76:     LD  3,-2(1)	Load address of base of array a
 77:     ST  3,-8(1)	Save left side 
 78:     LD  3,-5(1)	Load variable i
 79:     LD  4,-8(1)	Load left into ac1 
 80:    SUB  3,4,3	compute location from index 
 81:     LD  3,0(3)	Load array element 
 82:     ST  3,-6(1)	Store variable x
* EXPRESSION
 83:     LD  3,-5(1)	Load variable i
 84:     ST  3,-7(1)	Store variable k
* END COMPOUND
 75:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 85:     LD  3,-5(1)	load lhs variable i
 86:    LDA  3,1(3)	increment value of i
 87:     ST  3,-5(1)	Store variable i
* END COMPOUND
 88:    LDA  7,-31(7)	go to beginning of loop 
 64:    LDA  7,24(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
 89:     LD  3,-7(1)	Load variable k
 90:    LDA  2,0(3)	Copy result to rt register 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust fp 
 97:    LDA  7,0(3)	Return 
* END FUNCTION minloc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sort
 98:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 99:     LD  3,-3(1)	Load variable low
100:     ST  3,-5(1)	Store variable i
* WHILE
101:     LD  3,-5(1)	Load variable i
102:     ST  3,-7(1)	Save left side 
103:     LD  3,-4(1)	Load variable high
104:     ST  3,-8(1)	Save left side 
105:    LDC  3,1(6)	Load integer constant 
106:     LD  4,-8(1)	Load left into ac1 
107:    SUB  3,4,3	Op - 
108:     LD  4,-7(1)	Load left into ac1 
109:    TLT  3,4,3	Op < 
110:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  minloc
112:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
113:     LD  3,-2(1)	Load address of base of array a
114:     ST  3,-10(1)	Store parameter 
*                       Load param 2
115:     LD  3,-5(1)	Load variable i
116:     ST  3,-11(1)	Store parameter 
*                       Load param 3
117:     LD  3,-4(1)	Load variable high
118:     ST  3,-12(1)	Store parameter 
*                       Jump to minloc
119:    LDA  1,-8(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-80(7)	CALL minloc
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to minloc
123:     ST  3,-6(1)	Store variable k
* EXPRESSION
124:     LD  3,-2(1)	Load address of base of array a
125:     ST  3,-8(1)	Save left side 
126:     LD  3,-6(1)	Load variable k
127:     LD  4,-8(1)	Load left into ac1 
128:    SUB  3,4,3	compute location from index 
129:     LD  3,0(3)	Load array element 
130:     ST  3,-7(1)	Store variable t
* EXPRESSION
131:     LD  3,-6(1)	Load variable k
132:     ST  3,-8(1)	Save index 
133:     LD  3,-2(1)	Load address of base of array a
134:     ST  3,-9(1)	Save left side 
135:     LD  3,-5(1)	Load variable i
136:     LD  4,-9(1)	Load left into ac1 
137:    SUB  3,4,3	compute location from index 
138:     LD  3,0(3)	Load array element 
139:     LD  4,-8(1)	Restore index 
140:     LD  5,-2(1)	Load address of base of array a
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable a
* EXPRESSION
143:     LD  3,-5(1)	Load variable i
144:     ST  3,-8(1)	Save index 
145:     LD  3,-7(1)	Load variable t
146:     LD  4,-8(1)	Restore index 
147:     LD  5,-2(1)	Load address of base of array a
148:    SUB  5,5,4	Compute offset of value 
149:     ST  3,0(5)	Store variable a
* EXPRESSION
150:     LD  3,-5(1)	load lhs variable i
151:    LDA  3,1(3)	increment value of i
152:     ST  3,-5(1)	Store variable i
* END COMPOUND
153:    LDA  7,-53(7)	go to beginning of loop 
111:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
154:    LDC  2,0(6)	Set return value to 0 
155:     LD  3,-1(1)	Load return address 
156:     LD  1,0(1)	Adjust fp 
157:    LDA  7,0(3)	Return 
* END FUNCTION sort
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
158:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
159:    LDC  3,0(6)	Load integer constant 
160:     ST  3,-2(1)	Store variable i
* WHILE
161:     LD  3,-2(1)	Load variable i
162:     ST  3,-3(1)	Save left side 
163:    LDC  3,10(6)	Load integer constant 
164:     LD  4,-3(1)	Load left into ac1 
165:    TLT  3,4,3	Op < 
166:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
168:     LD  3,-2(1)	Load variable i
169:     ST  3,-3(1)	Save index 
*                       Begin call to  input
170:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
171:    LDA  1,-4(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-173(7)	CALL input
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
175:     LD  4,-3(1)	Restore index 
176:    LDA  5,-1(0)	Load address of base of array x
177:    SUB  5,5,4	Compute offset of value 
178:     ST  3,0(5)	Store variable x
* EXPRESSION
179:     LD  3,-2(1)	load lhs variable i
180:    LDA  3,1(3)	increment value of i
181:     ST  3,-2(1)	Store variable i
* END COMPOUND
182:    LDA  7,-22(7)	go to beginning of loop 
167:    LDA  7,15(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  sort
183:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
184:    LDA  3,-1(0)	Load address of base of array x
185:     ST  3,-5(1)	Store parameter 
*                       Load param 2
186:    LDC  3,0(6)	Load integer constant 
187:     ST  3,-6(1)	Store parameter 
*                       Load param 3
188:    LDC  3,10(6)	Load integer constant 
189:     ST  3,-7(1)	Store parameter 
*                       Jump to sort
190:    LDA  1,-3(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-95(7)	CALL sort
193:    LDA  3,0(2)	Save the result in ac 
*                       End call to sort
* EXPRESSION
194:    LDC  3,0(6)	Load integer constant 
195:     ST  3,-2(1)	Store variable i
* WHILE
196:     LD  3,-2(1)	Load variable i
197:     ST  3,-3(1)	Save left side 
198:    LDC  3,10(6)	Load integer constant 
199:     LD  4,-3(1)	Load left into ac1 
200:    TLT  3,4,3	Op < 
201:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
203:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
204:    LDA  3,-1(0)	Load address of base of array x
205:     ST  3,-5(1)	Save left side 
206:     LD  3,-2(1)	Load variable i
207:     LD  4,-5(1)	Load left into ac1 
208:    SUB  3,4,3	compute location from index 
209:     LD  3,0(3)	Load array element 
210:     ST  3,-5(1)	Store parameter 
*                       Jump to output
211:    LDA  1,-3(1)	Load address of new frame 
212:    LDA  3,1(7)	Return address in ac 
213:    LDA  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
215:     LD  3,-2(1)	load lhs variable i
216:    LDA  3,1(3)	increment value of i
217:     ST  3,-2(1)	Store variable i
* END COMPOUND
218:    LDA  7,-23(7)	go to beginning of loop 
202:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
219:    LDC  2,0(6)	Set return value to 0 
220:     LD  3,-1(1)	Load return address 
221:     LD  1,0(1)	Adjust fp 
222:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,222(7)	Jump to init [backpatch] 
* INIT
223:     LD  0,0(0)	Set the global pointer 
224:    LDA  1,-11(0)	set first frame at end of globals 
225:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
226:    LDC  3,10(6)	load size of array x
227:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
228:    LDA  3,1(7)	Return address in ac 
229:    LDA  7,-72(7)	Jump to main 
230:   HALT  0,0,0	DONE! 
* END INIT
