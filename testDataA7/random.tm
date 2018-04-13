* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  random.c-
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
 43:    LDC  3,10000(6)	Load integer constant 
 44:     ST  3,-4(1)	Store variable max
 45:    LDC  3,120(6)	Load integer constant 
 46:     ST  3,-5(1)	Store variable range
 47:    LDC  3,120(6)	Load integer constant 
 48:     ST  3,-8(1)	Save left side 
 49:    LDC  3,1(6)	Load integer constant 
 50:     LD  4,-8(1)	Load left into ac1 
 51:    SUB  3,4,3	Op - 
 52:     ST  3,-6(1)	Store variable rangeM1
 53:    LDC  3,35(6)	Load integer constant 
 54:     ST  3,-7(1)	Store variable sd
* Compound Body
* EXPRESSION
 55:    LDC  3,0(6)	Load integer constant 
 56:     ST  3,-2(1)	Store variable i
* WHILE
 57:     LD  3,-2(1)	Load variable i
 58:     ST  3,-8(1)	Save left side 
 59:    LDC  3,20(6)	Load integer constant 
 60:     LD  4,-8(1)	Load left into ac1 
 61:    TLT  3,4,3	Op < 
 62:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  outputb
 64:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 65:    LDC  3,10(6)	Load integer constant 
 66:    RND  3,3,6	Op ? 
 67:     ST  3,-10(1)	Save left side 
 68:    LDC  3,10(6)	Load integer constant 
 69:     LD  4,-10(1)	Load left into ac1 
 70:    TLT  3,4,3	Op < 
 71:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
 72:    LDA  1,-8(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-57(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 76:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDC  3,10(6)	Load integer constant 
 78:    RND  3,3,6	Op ? 
 79:     ST  3,-10(1)	Save left side 
 80:    LDC  3,0(6)	Load integer constant 
 81:     LD  4,-10(1)	Load left into ac1 
 82:    TGE  3,4,3	Op >= 
 83:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
 84:    LDA  1,-8(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-69(7)	CALL outputb
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
 88:     LD  3,-2(1)	load lhs variable i
 89:    LDA  3,1(3)	increment value of i
 90:     ST  3,-2(1)	Store variable i
* END COMPOUND
 91:    LDA  7,-35(7)	go to beginning of loop 
 63:    LDA  7,28(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 92:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
 93:    LDA  1,-8(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-59(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 97:    LDC  3,0(6)	Load integer constant 
 98:     ST  3,-3(1)	Store variable sum
* EXPRESSION
 99:    LDC  3,0(6)	Load integer constant 
100:     ST  3,-2(1)	Store variable i
* WHILE
101:     LD  3,-2(1)	Load variable i
102:     ST  3,-8(1)	Save left side 
103:     LD  3,-4(1)	Load variable max
104:     LD  4,-8(1)	Load left into ac1 
105:    TLT  3,4,3	Op < 
106:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
108:     LD  3,-5(1)	Load variable range
109:    RND  3,3,6	Op ? 
110:     LD  4,-3(1)	load lhs variable sum
111:    ADD  3,4,3	op += 
112:     ST  3,-3(1)	Store variable sum
* EXPRESSION
113:     LD  3,-2(1)	load lhs variable i
114:    LDA  3,1(3)	increment value of i
115:     ST  3,-2(1)	Store variable i
* END COMPOUND
116:    LDA  7,-16(7)	go to beginning of loop 
107:    LDA  7,9(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outputb
117:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
118:     LD  3,-3(1)	Load variable sum
119:     ST  3,-10(1)	Save left side 
120:     LD  3,-4(1)	Load variable max
121:     LD  4,-10(1)	Load left into ac1 
122:    DIV  3,4,3	Op / 
123:     ST  3,-10(1)	Save left side 
124:     LD  3,-6(1)	Load variable rangeM1
125:     ST  3,-11(1)	Save left side 
126:    LDC  3,2(6)	Load integer constant 
127:     LD  4,-11(1)	Load left into ac1 
128:    DIV  3,4,3	Op / 
129:     ST  3,-11(1)	Save left side 
130:     LD  3,-7(1)	Load variable sd
131:     ST  3,-12(1)	Save left side 
132:    LDC  3,3(6)	Load integer constant 
133:     LD  4,-12(1)	Load left into ac1 
134:    MUL  3,4,3	Op * 
135:     LD  4,-11(1)	Load left into ac1 
136:    SUB  3,4,3	Op - 
137:     LD  4,-10(1)	Load left into ac1 
138:    TGT  3,4,3	Op > 
139:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
140:    LDA  1,-8(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-125(7)	CALL outputb
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
144:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
145:     LD  3,-3(1)	Load variable sum
146:     ST  3,-10(1)	Save left side 
147:     LD  3,-4(1)	Load variable max
148:     LD  4,-10(1)	Load left into ac1 
149:    DIV  3,4,3	Op / 
150:     ST  3,-10(1)	Save left side 
151:     LD  3,-6(1)	Load variable rangeM1
152:     ST  3,-11(1)	Save left side 
153:    LDC  3,2(6)	Load integer constant 
154:     LD  4,-11(1)	Load left into ac1 
155:    DIV  3,4,3	Op / 
156:     ST  3,-11(1)	Save left side 
157:     LD  3,-7(1)	Load variable sd
158:     ST  3,-12(1)	Save left side 
159:    LDC  3,3(6)	Load integer constant 
160:     LD  4,-12(1)	Load left into ac1 
161:    MUL  3,4,3	Op * 
162:     LD  4,-11(1)	Load left into ac1 
163:    ADD  3,4,3	Op + 
164:     LD  4,-10(1)	Load left into ac1 
165:    TLT  3,4,3	Op < 
166:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
167:    LDA  1,-8(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-152(7)	CALL outputb
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
171:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
172:    LDA  1,-8(1)	Load address of new frame 
173:    LDA  3,1(7)	Return address in ac 
174:    LDA  7,-138(7)	CALL outnl
175:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
176:    LDC  2,0(6)	Set return value to 0 
177:     LD  3,-1(1)	Load return address 
178:     LD  1,0(1)	Adjust fp 
179:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,179(7)	Jump to init [backpatch] 
* INIT
180:     LD  0,0(0)	Set the global pointer 
181:    LDA  1,0(0)	set first frame at end of globals 
182:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-143(7)	Jump to main 
185:   HALT  0,0,0	DONE! 
* END INIT
