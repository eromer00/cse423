* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  sieve.c-
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
 43:    LDC  3,201(6)	load size of array n
 44:     ST  3,-4(1)	save size of array n
* Compound Body
* EXPRESSION
 45:    LDC  3,200(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable max
* EXPRESSION
 47:    LDC  3,2(6)	Load integer constant 
 48:     ST  3,-3(1)	Store variable k
* WHILE
 49:     LD  3,-3(1)	Load variable k
 50:     ST  3,-206(1)	Save left side 
 51:     LD  3,-2(1)	Load variable max
 52:     LD  4,-206(1)	Load left into ac1 
 53:    TLE  3,4,3	Op <= 
 54:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 56:     LD  3,-3(1)	Load variable k
 57:     ST  3,-206(1)	Save index 
 58:    LDC  3,1(6)	Load Boolean constant 
 59:     LD  4,-206(1)	Restore index 
 60:    LDA  5,-5(1)	Load address of base of array n
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable n
* EXPRESSION
 63:     LD  3,-3(1)	Load variable k
 64:     ST  3,-206(1)	Save left side 
 65:    LDC  3,1(6)	Load integer constant 
 66:     LD  4,-206(1)	Load left into ac1 
 67:    ADD  3,4,3	Op + 
 68:     ST  3,-3(1)	Store variable k
* END COMPOUND
 69:    LDA  7,-21(7)	go to beginning of loop 
 55:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
 70:    LDC  3,2(6)	Load integer constant 
 71:     ST  3,-3(1)	Store variable k
* WHILE
 72:     LD  3,-3(1)	Load variable k
 73:     ST  3,-206(1)	Save left side 
 74:     LD  3,-3(1)	Load variable k
 75:     LD  4,-206(1)	Load left into ac1 
 76:    MUL  3,4,3	Op * 
 77:     ST  3,-206(1)	Save left side 
 78:     LD  3,-2(1)	Load variable max
 79:     LD  4,-206(1)	Load left into ac1 
 80:    TLE  3,4,3	Op <= 
 81:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 83:     LD  3,-3(1)	Load variable k
 84:     ST  3,-207(1)	Save left side 
 85:     LD  3,-3(1)	Load variable k
 86:     LD  4,-207(1)	Load left into ac1 
 87:    MUL  3,4,3	Op * 
 88:     ST  3,-206(1)	Store variable j
* WHILE
 89:     LD  3,-206(1)	Load variable j
 90:     ST  3,-207(1)	Save left side 
 91:     LD  3,-2(1)	Load variable max
 92:     LD  4,-207(1)	Load left into ac1 
 93:    TLE  3,4,3	Op <= 
 94:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 96:     LD  3,-206(1)	Load variable j
 97:     ST  3,-207(1)	Save index 
 98:    LDC  3,0(6)	Load Boolean constant 
 99:     LD  4,-207(1)	Restore index 
100:    LDA  5,-5(1)	Load address of base of array n
101:    SUB  5,5,4	Compute offset of value 
102:     ST  3,0(5)	Store variable n
* EXPRESSION
103:     LD  3,-206(1)	Load variable j
104:     ST  3,-207(1)	Save left side 
105:     LD  3,-3(1)	Load variable k
106:     LD  4,-207(1)	Load left into ac1 
107:    ADD  3,4,3	Op + 
108:     ST  3,-206(1)	Store variable j
* END COMPOUND
109:    LDA  7,-21(7)	go to beginning of loop 
 95:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
110:     LD  3,-3(1)	Load variable k
111:     ST  3,-207(1)	Save left side 
112:    LDC  3,1(6)	Load integer constant 
113:     LD  4,-207(1)	Load left into ac1 
114:    ADD  3,4,3	Op + 
115:     ST  3,-3(1)	Store variable k
* WHILE
116:     LD  3,-3(1)	Load variable k
117:     ST  3,-207(1)	Save left side 
118:     LD  3,-2(1)	Load variable max
119:     LD  4,-207(1)	Load left into ac1 
120:    TLE  3,4,3	Op <= 
121:     ST  3,-207(1)	Save left side 
122:    LDA  3,-5(1)	Load address of base of array n
123:     ST  3,-208(1)	Save left side 
124:     LD  3,-3(1)	Load variable k
125:     LD  4,-208(1)	Load left into ac1 
126:    SUB  3,4,3	compute location from index 
127:     LD  3,0(3)	Load array element 
128:    LDC  4,1(6)	Load 1 
129:    XOR  3,3,4	Op NOT 
130:     LD  4,-207(1)	Load left into ac1 
131:    AND  3,4,3	Op AND 
132:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
134:     LD  3,-3(1)	Load variable k
135:     ST  3,-207(1)	Save left side 
136:    LDC  3,1(6)	Load integer constant 
137:     LD  4,-207(1)	Load left into ac1 
138:    ADD  3,4,3	Op + 
139:     ST  3,-3(1)	Store variable k
140:    LDA  7,-25(7)	go to beginning of loop 
133:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
141:    LDA  7,-70(7)	go to beginning of loop 
 82:    LDA  7,59(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
142:    LDC  3,2(6)	Load integer constant 
143:     ST  3,-3(1)	Store variable k
* WHILE
144:     LD  3,-3(1)	Load variable k
145:     ST  3,-206(1)	Save left side 
146:     LD  3,-2(1)	Load variable max
147:     LD  4,-206(1)	Load left into ac1 
148:    TLE  3,4,3	Op <= 
149:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* IF
151:    LDA  3,-5(1)	Load address of base of array n
152:     ST  3,-207(1)	Save left side 
153:     LD  3,-3(1)	Load variable k
154:     LD  4,-207(1)	Load left into ac1 
155:    SUB  3,4,3	compute location from index 
156:     LD  3,0(3)	Load array element 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
158:     ST  1,-207(1)	Store old fp in ghost frame 
*                       Load param 1
159:     LD  3,-3(1)	Load variable k
160:     ST  3,-209(1)	Store parameter 
*                       Jump to output
161:    LDA  1,-207(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
165:     ST  1,-207(1)	Store old fp in ghost frame 
*                       Jump to outnl
166:    LDA  1,-207(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-132(7)	CALL outnl
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
157:    JZR  3,12(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
170:     LD  3,-3(1)	Load variable k
171:     ST  3,-207(1)	Save left side 
172:    LDC  3,1(6)	Load integer constant 
173:     LD  4,-207(1)	Load left into ac1 
174:    ADD  3,4,3	Op + 
175:     ST  3,-3(1)	Store variable k
* END COMPOUND
176:    LDA  7,-33(7)	go to beginning of loop 
150:    LDA  7,26(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
177:    LDC  3,0(6)	Load integer constant 
178:    LDA  2,0(3)	Copy result to rt register 
179:     LD  3,-1(1)	Load return address 
180:     LD  1,0(1)	Adjust fp 
181:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
182:    LDC  2,0(6)	Set return value to 0 
183:     LD  3,-1(1)	Load return address 
184:     LD  1,0(1)	Adjust fp 
185:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,185(7)	Jump to init [backpatch] 
* INIT
186:     LD  0,0(0)	Set the global pointer 
187:    LDA  1,0(0)	set first frame at end of globals 
188:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-149(7)	Jump to main 
191:   HALT  0,0,0	DONE! 
* END INIT
