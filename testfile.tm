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
 52:    DIV  3,4,3	Op /
53:    LDC  3,389(6)	Load int constant
54:    LDC  3,12(6)	Load int constant
 55:    MUL  3,4,3	Op *
 56:    DIV  3,4,3	Op /
57:    LDC  3,123(6)	Load int constant
58:    LDC  3,12(6)	Load int constant
59:    LDC  3,548(6)	Load int constant
*			 Begin call to output
60:     ST  1,-13(1)	Store old fp in ghost frame
61:    LDC  3,-2(6)	Load variable
62:     ST  3,-15(1)	Store Parameter
*			 Jump to output
63:    LDA 1,-13(1)	Load address of new frame
64:    LDA 3,1(7)	Return address in ac
65:    LDA 7,-60(7)	CALL output
66:    LDA 3,0(2)	save result in ac
67:     ST  3,-2(1)	Store variable x
68:    LDC  3,-3(6)	Load variable
69:    LDC  3,222(6)	Load int constant
*			 Begin call to output
70:     ST  1,-13(1)	Store old fp in ghost frame
71:    LDC  3,-3(6)	Load variable
72:     ST  3,-15(1)	Store Parameter
*			 Jump to output
73:    LDA 1,-13(1)	Load address of new frame
74:    LDA 3,1(7)	Return address in ac
75:    LDA 7,-70(7)	CALL output
76:    LDA 3,0(2)	save result in ac
77:     ST  3,-3(1)	Store variable y
78:    LDC  3,-11(6)	Load variable
79:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
80:     ST  1,-13(1)	Store old fp in ghost frame
81:    LDC  3,-11(6)	Load variable
82:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
83:    LDA 1,-13(1)	Load address of new frame
84:    LDA 3,1(7)	Return address in ac
85:    LDA 7,-68(7)	CALL outputb
86:    LDA 3,0(2)	save result in ac
87:     ST  3,-11(1)	Store variable a
88:    LDC  3,-12(6)	Load variable
89:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
90:     ST  1,-13(1)	Store old fp in ghost frame
91:    LDC  3,-12(6)	Load variable
92:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
93:    LDA 1,-13(1)	Load address of new frame
94:    LDA 3,1(7)	Return address in ac
95:    LDA 7,-78(7)	CALL outputb
96:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
97:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
98:    LDA 1,-13(1)	Load address of new frame
99:    LDA 3,1(7)	Return address in ac
100:    LDA 7,-64(7)	CALL outnl
101:    LDA 3,0(2)	save result in ac
102:     ST  3,-12(1)	Store variable b
103:    LDC  3,0(6)	Load variable
104:    LDC  3,333(6)	Load int constant
*			 Begin call to output
105:     ST  1,-13(1)	Store old fp in ghost frame
106:    LDC  3,0(6)	Load variable
107:     ST  3,-15(1)	Store Parameter
*			 Jump to output
108:    LDA 1,-13(1)	Load address of new frame
109:    LDA 3,1(7)	Return address in ac
110:    LDA 7,-105(7)	CALL output
111:    LDA 3,0(2)	save result in ac
112:     ST  3,0(1)	Store variable gx
113:    LDC  3,-1(6)	Load variable
114:    LDC  3,444(6)	Load int constant
*			 Begin call to output
115:     ST  1,-13(1)	Store old fp in ghost frame
116:    LDC  3,-1(6)	Load variable
117:     ST  3,-15(1)	Store Parameter
*			 Jump to output
118:    LDA 1,-13(1)	Load address of new frame
119:    LDA 3,1(7)	Return address in ac
120:    LDA 7,-115(7)	CALL output
121:    LDA 3,0(2)	save result in ac
122:     ST  3,-1(1)	Store variable gy
123:    LDC  3,-2(6)	Load variable
124:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
125:     ST  1,-13(1)	Store old fp in ghost frame
126:    LDC  3,-2(6)	Load variable
127:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
128:    LDA 1,-13(1)	Load address of new frame
129:    LDA 3,1(7)	Return address in ac
130:    LDA 7,-113(7)	CALL outputb
131:    LDA 3,0(2)	save result in ac
132:     ST  3,-2(1)	Store variable ga
133:    LDC  3,-3(6)	Load variable
134:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
135:     ST  1,-13(1)	Store old fp in ghost frame
136:    LDC  3,-3(6)	Load variable
137:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
138:    LDA 1,-13(1)	Load address of new frame
139:    LDA 3,1(7)	Return address in ac
140:    LDA 7,-123(7)	CALL outputb
141:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
142:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
143:    LDA 1,-13(1)	Load address of new frame
144:    LDA 3,1(7)	Return address in ac
145:    LDA 7,-109(7)	CALL outnl
146:    LDA 3,0(2)	save result in ac
147:     ST  3,-3(1)	Store variable gb
148:    LDC  3,-2(6)	Load variable
149:    LDC  3,-3(6)	Load variable
*			 Begin call to output
150:     ST  1,-13(1)	Store old fp in ghost frame
151:    LDC  3,-2(6)	Load variable
152:     ST  3,-15(1)	Store Parameter
*			 Jump to output
153:    LDA 1,-13(1)	Load address of new frame
154:    LDA 3,1(7)	Return address in ac
155:    LDA 7,-150(7)	CALL output
156:    LDA 3,0(2)	save result in ac
157:     ST  3,-2(1)	Store variable x
158:    LDC  3,-11(6)	Load variable
159:    LDC  3,-12(6)	Load variable
*			 Begin call to outputb
160:     ST  1,-13(1)	Store old fp in ghost frame
161:    LDC  3,-11(6)	Load variable
162:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
163:    LDA 1,-13(1)	Load address of new frame
164:    LDA 3,1(7)	Return address in ac
165:    LDA 7,-148(7)	CALL outputb
166:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
167:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
168:    LDA 1,-13(1)	Load address of new frame
169:    LDA 3,1(7)	Return address in ac
170:    LDA 7,-134(7)	CALL outnl
171:    LDA 3,0(2)	save result in ac
172:     ST  3,-11(1)	Store variable a
173:    LDC  3,0(6)	Load variable
174:    LDC  3,-1(6)	Load variable
*			 Begin call to output
175:     ST  1,-13(1)	Store old fp in ghost frame
176:    LDC  3,0(6)	Load variable
177:     ST  3,-15(1)	Store Parameter
*			 Jump to output
178:    LDA 1,-13(1)	Load address of new frame
179:    LDA 3,1(7)	Return address in ac
180:    LDA 7,-175(7)	CALL output
181:    LDA 3,0(2)	save result in ac
182:     ST  3,0(1)	Store variable gx
183:    LDC  3,-2(6)	Load variable
184:    LDC  3,-3(6)	Load variable
*			 Begin call to outputb
185:     ST  1,-13(1)	Store old fp in ghost frame
186:    LDC  3,-2(6)	Load variable
187:     ST  3,-15(1)	Store Parameter
*			 Jump to outputb
188:    LDA 1,-13(1)	Load address of new frame
189:    LDA 3,1(7)	Return address in ac
190:    LDA 7,-173(7)	CALL outputb
191:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
192:     ST  1,-13(1)	Store old fp in ghost frame
*			 Jump to outnl
193:    LDA 1,-13(1)	Load address of new frame
194:    LDA 3,1(7)	Return address in ac
195:    LDA 7,-159(7)	CALL outnl
196:    LDA 3,0(2)	save result in ac
* END COMPOUND
* END FUNCTION main
0:    LDA  7,196(7)	Jump to init [backpatch]
* INIT
197:     LD  0,0(0)	Set the global pointer
198:    LDA  1,0(0)	set first frame at end of globals
199:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
200:    LDA  3,1(7)	Return address in ac
201:    LDA  7,-160(7)	Jump to main
202:   HALT  0,0,0	DONE!
* END INIT
