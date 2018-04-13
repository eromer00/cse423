* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  return03.c-
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
* FUNCTION ant
 42:     ST  3,-1(1)	Store return address. 
* Add standard closing in case there is no return statement
 43:    LDC  2,0(6)	Set return value to 0 
 44:     LD  3,-1(1)	Load return address 
 45:     LD  1,0(1)	Adjust fp 
 46:    LDA  7,0(3)	Return 
* END FUNCTION ant
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION boa
 47:     ST  3,-1(1)	Store return address. 
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION boa
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cow
 52:     ST  3,-1(1)	Store return address. 
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    LDA  7,0(3)	Return 
* END FUNCTION cow
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 57:     ST  3,-1(1)	Store return address. 
* RETURN
 58:    LDC  3,111(6)	Load integer constant 
 59:    LDA  2,0(3)	Copy result to rt register 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION elk
 67:     ST  3,-1(1)	Store return address. 
* RETURN
 68:    LDC  3,1(6)	Load Boolean constant 
 69:    LDA  2,0(3)	Copy result to rt register 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END FUNCTION elk
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fox
 77:     ST  3,-1(1)	Store return address. 
* RETURN
 78:    LDC  3,122(6)	Load char constant 
 79:    LDA  2,0(3)	Copy result to rt register 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust fp 
 82:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 83:    LDC  2,0(6)	Set return value to 0 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    LDA  7,0(3)	Return 
* END FUNCTION fox
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 87:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 88:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ant
 89:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to ant
 90:    LDA  1,-4(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL ant
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to ant
 94:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 95:    LDA  1,-2(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 99:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  boa
100:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to boa
101:    LDA  1,-4(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-57(7)	CALL boa
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to boa
105:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
106:    LDA  1,-2(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-91(7)	CALL outputb
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputc
110:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cow
111:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to cow
112:    LDA  1,-4(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-63(7)	CALL cow
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to cow
116:     ST  3,-4(1)	Store parameter 
*                       Jump to outputc
117:    LDA  1,-2(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-90(7)	CALL outputc
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
121:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
122:    LDA  1,-2(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-88(7)	CALL outnl
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
126:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
127:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to dog
128:    LDA  1,-4(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-74(7)	CALL dog
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
132:     ST  3,-4(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-2(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
137:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  elk
138:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to elk
139:    LDA  1,-4(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-75(7)	CALL elk
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to elk
143:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
144:    LDA  1,-2(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-129(7)	CALL outputb
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputc
148:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
149:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to fox
150:    LDA  1,-4(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-76(7)	CALL fox
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
154:     ST  3,-4(1)	Store parameter 
*                       Jump to outputc
155:    LDA  1,-2(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-128(7)	CALL outputc
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
159:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
160:    LDA  1,-2(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-126(7)	CALL outnl
163:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
164:    LDC  2,0(6)	Set return value to 0 
165:     LD  3,-1(1)	Load return address 
166:     LD  1,0(1)	Adjust fp 
167:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,167(7)	Jump to init [backpatch] 
* INIT
168:     LD  0,0(0)	Set the global pointer 
169:    LDA  1,0(0)	set first frame at end of globals 
170:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
171:    LDA  3,1(7)	Return address in ac 
172:    LDA  7,-86(7)	Jump to main 
173:   HALT  0,0,0	DONE! 
* END INIT
