* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  zcall3.c-
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
* RETURN
 43:    LDC  3,666(6)	Load integer constant 
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,-2(1)	Load variable a
 46:     LD  4,-3(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:    LDA  2,0(3)	Copy result to rt register 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 52:    LDC  2,0(6)	Set return value to 0 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    LDA  7,0(3)	Return 
* END FUNCTION ant
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION bat
 56:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 57:    LDC  3,777(6)	Load integer constant 
 58:     ST  3,-3(1)	Save left side 
 59:     LD  3,-2(1)	Load variable b
 60:     LD  4,-3(1)	Load left into ac1 
 61:    MUL  3,4,3	Op * 
 62:    LDA  2,0(3)	Copy result to rt register 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION bat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cow
 70:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 71:    LDC  3,888(6)	Load integer constant 
 72:     ST  3,-4(1)	Save left side 
 73:     LD  3,-2(1)	Load variable c
 74:     LD  4,-4(1)	Load left into ac1 
 75:    MUL  3,4,3	Op * 
 76:    LDA  2,0(3)	Copy result to rt register 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION cow
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 84:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* COMPOUND
* Compound Body
* RETURN
 85:    LDC  3,999(6)	Load integer constant 
 86:     ST  3,-5(1)	Save left side 
 87:     LD  3,-2(1)	Load variable d
 88:     LD  4,-5(1)	Load left into ac1 
 89:    MUL  3,4,3	Op * 
 90:    LDA  2,0(3)	Copy result to rt register 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END COMPOUND
* RETURN
 94:    LDC  3,555(6)	Load integer constant 
 95:     ST  3,-4(1)	Save left side 
 96:     LD  3,-2(1)	Load variable d
 97:     LD  4,-4(1)	Load left into ac1 
 98:    MUL  3,4,3	Op * 
 99:    LDA  2,0(3)	Copy result to rt register 
100:     LD  3,-1(1)	Load return address 
101:     LD  1,0(1)	Adjust fp 
102:    LDA  7,0(3)	Return 
* COMPOUND
* Compound Body
* RETURN
103:    LDC  3,999(6)	Load integer constant 
104:     ST  3,-6(1)	Save left side 
105:     LD  3,-2(1)	Load variable d
106:     LD  4,-6(1)	Load left into ac1 
107:    MUL  3,4,3	Op * 
108:    LDA  2,0(3)	Copy result to rt register 
109:     LD  3,-1(1)	Load return address 
110:     LD  1,0(1)	Adjust fp 
111:    LDA  7,0(3)	Return 
* END COMPOUND
* RETURN
112:    LDC  3,555(6)	Load integer constant 
113:     ST  3,-4(1)	Save left side 
114:     LD  3,-2(1)	Load variable d
115:     LD  4,-4(1)	Load left into ac1 
116:    MUL  3,4,3	Op * 
117:    LDA  2,0(3)	Copy result to rt register 
118:     LD  3,-1(1)	Load return address 
119:     LD  1,0(1)	Adjust fp 
120:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
121:    LDC  2,0(6)	Set return value to 0 
122:     LD  3,-1(1)	Load return address 
123:     LD  1,0(1)	Adjust fp 
124:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
125:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  ant
126:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
127:    LDC  3,111(6)	Load integer constant 
128:     ST  3,-4(1)	Store parameter 
*                       Jump to ant
129:    LDA  1,-2(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-90(7)	CALL ant
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to ant
* EXPRESSION
*                       Begin call to  bat
133:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
134:    LDC  3,222(6)	Load integer constant 
135:     ST  3,-4(1)	Store parameter 
*                       Jump to bat
136:    LDA  1,-2(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-83(7)	CALL bat
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  cow
140:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
141:    LDC  3,333(6)	Load integer constant 
142:     ST  3,-4(1)	Store parameter 
*                       Jump to cow
143:    LDA  1,-2(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-76(7)	CALL cow
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to cow
* EXPRESSION
*                       Begin call to  dog
147:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
148:    LDC  3,444(6)	Load integer constant 
149:     ST  3,-4(1)	Store parameter 
*                       Jump to dog
150:    LDA  1,-2(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-69(7)	CALL dog
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
154:    LDC  2,0(6)	Set return value to 0 
155:     LD  3,-1(1)	Load return address 
156:     LD  1,0(1)	Adjust fp 
157:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,157(7)	Jump to init [backpatch] 
* INIT
158:     LD  0,0(0)	Set the global pointer 
159:    LDA  1,0(0)	set first frame at end of globals 
160:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-38(7)	Jump to main 
163:   HALT  0,0,0	DONE! 
* END INIT
