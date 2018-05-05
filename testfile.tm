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
 46:    ADD  3,4,3	Op +
47:    LDC  3,111(6)	Load int constant
48:    LDC  3,1(6)	Load int constant
49:    LDC  3,1(6)	Load int constant
*			 Begin call to output
50:     ST  1,-6(1)	Store old fp in ghost frame
51:    LDC  3,-2(6)	Load variable
52:     ST  3,-8(1)	Store Parameter
*			 Jump to output
53:    LDA 1,-6(1)	Load address of new frame
54:    LDA 3,1(7)	Return address in ac
55:    LDA 7,-50(7)	CALL output
56:    LDA 3,0(2)	save result in ac
57:     ST  3,-2(1)	Store variable x
58:    LDC  3,-3(6)	Load variable
59:    LDC  3,222(6)	Load int constant
*			 Begin call to output
60:     ST  1,-6(1)	Store old fp in ghost frame
61:    LDC  3,-3(6)	Load variable
62:     ST  3,-8(1)	Store Parameter
*			 Jump to output
63:    LDA 1,-6(1)	Load address of new frame
64:    LDA 3,1(7)	Return address in ac
65:    LDA 7,-60(7)	CALL output
66:    LDA 3,0(2)	save result in ac
67:     ST  3,-3(1)	Store variable y
68:    LDC  3,-4(6)	Load variable
69:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
70:     ST  1,-6(1)	Store old fp in ghost frame
71:    LDC  3,-4(6)	Load variable
72:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
73:    LDA 1,-6(1)	Load address of new frame
74:    LDA 3,1(7)	Return address in ac
75:    LDA 7,-58(7)	CALL outputb
76:    LDA 3,0(2)	save result in ac
77:     ST  3,-4(1)	Store variable a
78:    LDC  3,-5(6)	Load variable
79:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
80:     ST  1,-6(1)	Store old fp in ghost frame
81:    LDC  3,-5(6)	Load variable
82:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
83:    LDA 1,-6(1)	Load address of new frame
84:    LDA 3,1(7)	Return address in ac
85:    LDA 7,-68(7)	CALL outputb
86:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
87:     ST  1,-6(1)	Store old fp in ghost frame
*			 Jump to outnl
88:    LDA 1,-6(1)	Load address of new frame
89:    LDA 3,1(7)	Return address in ac
90:    LDA 7,-54(7)	CALL outnl
91:    LDA 3,0(2)	save result in ac
92:     ST  3,-5(1)	Store variable b
93:    LDC  3,0(6)	Load variable
94:    LDC  3,333(6)	Load int constant
*			 Begin call to output
95:     ST  1,-6(1)	Store old fp in ghost frame
96:    LDC  3,0(6)	Load variable
97:     ST  3,-8(1)	Store Parameter
*			 Jump to output
98:    LDA 1,-6(1)	Load address of new frame
99:    LDA 3,1(7)	Return address in ac
100:    LDA 7,-95(7)	CALL output
101:    LDA 3,0(2)	save result in ac
102:     ST  3,0(1)	Store variable gx
103:    LDC  3,-1(6)	Load variable
104:    LDC  3,444(6)	Load int constant
*			 Begin call to output
105:     ST  1,-6(1)	Store old fp in ghost frame
106:    LDC  3,-1(6)	Load variable
107:     ST  3,-8(1)	Store Parameter
*			 Jump to output
108:    LDA 1,-6(1)	Load address of new frame
109:    LDA 3,1(7)	Return address in ac
110:    LDA 7,-105(7)	CALL output
111:    LDA 3,0(2)	save result in ac
112:     ST  3,-1(1)	Store variable gy
113:    LDC  3,-2(6)	Load variable
114:    LDC  3,0(6)	Load false constant
*			 Begin call to outputb
115:     ST  1,-6(1)	Store old fp in ghost frame
116:    LDC  3,-2(6)	Load variable
117:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
118:    LDA 1,-6(1)	Load address of new frame
119:    LDA 3,1(7)	Return address in ac
120:    LDA 7,-103(7)	CALL outputb
121:    LDA 3,0(2)	save result in ac
122:     ST  3,-2(1)	Store variable ga
123:    LDC  3,-3(6)	Load variable
124:    LDC  3,1(6)	Load true constant
*			 Begin call to outputb
125:     ST  1,-6(1)	Store old fp in ghost frame
126:    LDC  3,-3(6)	Load variable
127:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
128:    LDA 1,-6(1)	Load address of new frame
129:    LDA 3,1(7)	Return address in ac
130:    LDA 7,-113(7)	CALL outputb
131:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
132:     ST  1,-6(1)	Store old fp in ghost frame
*			 Jump to outnl
133:    LDA 1,-6(1)	Load address of new frame
134:    LDA 3,1(7)	Return address in ac
135:    LDA 7,-99(7)	CALL outnl
136:    LDA 3,0(2)	save result in ac
137:     ST  3,-3(1)	Store variable gb
138:    LDC  3,-2(6)	Load variable
139:    LDC  3,-3(6)	Load variable
*			 Begin call to output
140:     ST  1,-6(1)	Store old fp in ghost frame
141:    LDC  3,-2(6)	Load variable
142:     ST  3,-8(1)	Store Parameter
*			 Jump to output
143:    LDA 1,-6(1)	Load address of new frame
144:    LDA 3,1(7)	Return address in ac
145:    LDA 7,-140(7)	CALL output
146:    LDA 3,0(2)	save result in ac
147:     ST  3,-2(1)	Store variable x
148:    LDC  3,-4(6)	Load variable
149:    LDC  3,-5(6)	Load variable
*			 Begin call to outputb
150:     ST  1,-6(1)	Store old fp in ghost frame
151:    LDC  3,-4(6)	Load variable
152:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
153:    LDA 1,-6(1)	Load address of new frame
154:    LDA 3,1(7)	Return address in ac
155:    LDA 7,-138(7)	CALL outputb
156:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
157:     ST  1,-6(1)	Store old fp in ghost frame
*			 Jump to outnl
158:    LDA 1,-6(1)	Load address of new frame
159:    LDA 3,1(7)	Return address in ac
160:    LDA 7,-124(7)	CALL outnl
161:    LDA 3,0(2)	save result in ac
162:     ST  3,-4(1)	Store variable a
163:    LDC  3,0(6)	Load variable
164:    LDC  3,-1(6)	Load variable
*			 Begin call to output
165:     ST  1,-6(1)	Store old fp in ghost frame
166:    LDC  3,0(6)	Load variable
167:     ST  3,-8(1)	Store Parameter
*			 Jump to output
168:    LDA 1,-6(1)	Load address of new frame
169:    LDA 3,1(7)	Return address in ac
170:    LDA 7,-165(7)	CALL output
171:    LDA 3,0(2)	save result in ac
172:     ST  3,0(1)	Store variable gx
173:    LDC  3,-2(6)	Load variable
174:    LDC  3,-3(6)	Load variable
*			 Begin call to outputb
175:     ST  1,-6(1)	Store old fp in ghost frame
176:    LDC  3,-2(6)	Load variable
177:     ST  3,-8(1)	Store Parameter
*			 Jump to outputb
178:    LDA 1,-6(1)	Load address of new frame
179:    LDA 3,1(7)	Return address in ac
180:    LDA 7,-163(7)	CALL outputb
181:    LDA 3,0(2)	save result in ac
*			 Begin call to outnl
182:     ST  1,-6(1)	Store old fp in ghost frame
*			 Jump to outnl
183:    LDA 1,-6(1)	Load address of new frame
184:    LDA 3,1(7)	Return address in ac
185:    LDA 7,-149(7)	CALL outnl
186:    LDA 3,0(2)	save result in ac
* END COMPOUND
* END FUNCTION main
0:    LDA  7,186(7)	Jump to init [backpatch]
* INIT
187:     LD  0,0(0)	Set the global pointer
188:    LDA  1,0(0)	set first frame at end of globals
189:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
190:    LDA  3,1(7)	Return address in ac
191:    LDA  7,-150(7)	Jump to main
192:   HALT  0,0,0	DONE!
* END INIT
