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
*			 Begin call to output
43:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
44:    LDA 1, -2(1)	Load address of new frame
45:    LDA 3, 1(7)	Return address in ac
46:    LDA 3, -41(7)	CALL output
47:    LDA 3, 0(2)	save result in ac
*			 Jump to output
48:    LDA 1, -2(1)	Load address of new frame
49:    LDA 3, 1(7)	Return address in ac
50:    LDA 3, -45(7)	CALL output
51:    LDA 3, 0(2)	save result in ac
*			 Begin call to output
52:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
53:    LDA 1, -2(1)	Load address of new frame
54:    LDA 3, 1(7)	Return address in ac
55:    LDA 3, -50(7)	CALL output
56:    LDA 3, 0(2)	save result in ac
*			 Jump to output
57:    LDA 1, -2(1)	Load address of new frame
58:    LDA 3, 1(7)	Return address in ac
59:    LDA 3, -54(7)	CALL output
60:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
61:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
62:    LDA 1, -2(1)	Load address of new frame
63:    LDA 3, 1(7)	Return address in ac
64:    LDA 3, -47(7)	CALL outputb
65:    LDA 3, 0(2)	save result in ac
*			 Jump to outputb
66:    LDA 1, -2(1)	Load address of new frame
67:    LDA 3, 1(7)	Return address in ac
68:    LDA 3, -51(7)	CALL outputb
69:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
70:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
71:    LDA 1, -2(1)	Load address of new frame
72:    LDA 3, 1(7)	Return address in ac
73:    LDA 3, -56(7)	CALL outputb
74:    LDA 3, 0(2)	save result in ac
*			 Begin call to outnl
75:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outnl
76:    LDA 1, -2(1)	Load address of new frame
77:    LDA 3, 1(7)	Return address in ac
78:    LDA 3, -42(7)	CALL outnl
79:    LDA 3, 0(2)	save result in ac
*			 Jump to outnl
80:    LDA 1, -2(1)	Load address of new frame
81:    LDA 3, 1(7)	Return address in ac
82:    LDA 3, -46(7)	CALL outnl
83:    LDA 3, 0(2)	save result in ac
*			 Begin call to output
84:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
85:    LDA 1, -2(1)	Load address of new frame
86:    LDA 3, 1(7)	Return address in ac
87:    LDA 3, -82(7)	CALL output
88:    LDA 3, 0(2)	save result in ac
*			 Jump to output
89:    LDA 1, -2(1)	Load address of new frame
90:    LDA 3, 1(7)	Return address in ac
91:    LDA 3, -86(7)	CALL output
92:    LDA 3, 0(2)	save result in ac
*			 Begin call to output
93:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
94:    LDA 1, -2(1)	Load address of new frame
95:    LDA 3, 1(7)	Return address in ac
96:    LDA 3, -91(7)	CALL output
97:    LDA 3, 0(2)	save result in ac
*			 Jump to output
98:    LDA 1, -2(1)	Load address of new frame
99:    LDA 3, 1(7)	Return address in ac
100:    LDA 3, -95(7)	CALL output
101:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
102:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
103:    LDA 1, -2(1)	Load address of new frame
104:    LDA 3, 1(7)	Return address in ac
105:    LDA 3, -88(7)	CALL outputb
106:    LDA 3, 0(2)	save result in ac
*			 Jump to outputb
107:    LDA 1, -2(1)	Load address of new frame
108:    LDA 3, 1(7)	Return address in ac
109:    LDA 3, -92(7)	CALL outputb
110:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
111:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
112:    LDA 1, -2(1)	Load address of new frame
113:    LDA 3, 1(7)	Return address in ac
114:    LDA 3, -97(7)	CALL outputb
115:    LDA 3, 0(2)	save result in ac
*			 Begin call to outnl
116:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outnl
117:    LDA 1, -2(1)	Load address of new frame
118:    LDA 3, 1(7)	Return address in ac
119:    LDA 3, -83(7)	CALL outnl
120:    LDA 3, 0(2)	save result in ac
*			 Jump to outnl
121:    LDA 1, -2(1)	Load address of new frame
122:    LDA 3, 1(7)	Return address in ac
123:    LDA 3, -87(7)	CALL outnl
124:    LDA 3, 0(2)	save result in ac
*			 Begin call to output
125:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
126:    LDA 1, -2(1)	Load address of new frame
127:    LDA 3, 1(7)	Return address in ac
128:    LDA 3, -123(7)	CALL output
129:    LDA 3, 0(2)	save result in ac
*			 Jump to output
130:    LDA 1, -2(1)	Load address of new frame
131:    LDA 3, 1(7)	Return address in ac
132:    LDA 3, -127(7)	CALL output
133:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
134:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
135:    LDA 1, -2(1)	Load address of new frame
136:    LDA 3, 1(7)	Return address in ac
137:    LDA 3, -120(7)	CALL outputb
138:    LDA 3, 0(2)	save result in ac
*			 Begin call to outnl
139:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outnl
140:    LDA 1, -2(1)	Load address of new frame
141:    LDA 3, 1(7)	Return address in ac
142:    LDA 3, -106(7)	CALL outnl
143:    LDA 3, 0(2)	save result in ac
*			 Jump to outnl
144:    LDA 1, -2(1)	Load address of new frame
145:    LDA 3, 1(7)	Return address in ac
146:    LDA 3, -110(7)	CALL outnl
147:    LDA 3, 0(2)	save result in ac
*			 Begin call to output
148:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to output
149:    LDA 1, -2(1)	Load address of new frame
150:    LDA 3, 1(7)	Return address in ac
151:    LDA 3, -146(7)	CALL output
152:    LDA 3, 0(2)	save result in ac
*			 Jump to output
153:    LDA 1, -2(1)	Load address of new frame
154:    LDA 3, 1(7)	Return address in ac
155:    LDA 3, -150(7)	CALL output
156:    LDA 3, 0(2)	save result in ac
*			 Begin call to outputb
157:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outputb
158:    LDA 1, -2(1)	Load address of new frame
159:    LDA 3, 1(7)	Return address in ac
160:    LDA 3, -143(7)	CALL outputb
161:    LDA 3, 0(2)	save result in ac
*			 Begin call to outnl
162:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outnl
163:    LDA 1, -2(1)	Load address of new frame
164:    LDA 3, 1(7)	Return address in ac
165:    LDA 3, -129(7)	CALL outnl
166:    LDA 3, 0(2)	save result in ac
*			 Jump to outnl
167:    LDA 1, -2(1)	Load address of new frame
168:    LDA 3, 1(7)	Return address in ac
169:    LDA 3, -133(7)	CALL outnl
170:    LDA 3, 0(2)	save result in ac
* END COMPOUND
* END FUNCTION main
  0:    LDA  7,170(7)	Jump to init [backpatch]
* INIT
 171:     LD  0,0(0)	Set the global pointer
 172:    LDA  1,0(0)	set first frame at end of globals
 173:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 174:    LDA  3,1(7)	Return address in ac
 175:    LDA  7,-134(7)	Jump to main
 176:   HALT  0,0,0	DONE!
* END INIT
