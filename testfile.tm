* C- compiler version C-F16
* Built: April 13, 2018
* Author: Franz Chavez, Erik Romero, Carlos Rubio
* File compiled:  testfile.tm
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
* FUNCTION dog
42:     ST  3,-1(1)	Store return address.
* COMPOUND
* Compound Body
43:     LD  3,-3(1)	Load variable
44:     LD  3,-2(1)	Load variable
45:     ST  3,-3(1)	Store variable y
46:     LD  3,-3(1)	Load variable
47:     LD  3,-2(1)	Load variable
48:     ST  3,-3(1)	Store variable y
49:     LD  3,-3(1)	Load variable
50:     LD  3,-3(1)	Load lhs variable
51:    LDA  3,1(3)	increment value
52:     ST  3,-3(1)	Store variable
53:     LD  3,-3(1)	Load variable
54:     LD  3,-2(1)	Load variable
55:     LDC  3,111(6)	Load int constant
56:     LD  3,-2(1)	Load variable
57:     ST  3,-11(1)	Save left side
58:    LDC  3,111(6)	Load constant
59:     LD  4,-11(1)	Load left into ac1
60:    MUL  3,4,3	Op *
61:     ST  3,-11(1)	Save left side
62:     LDC  3,222(6)	Load int constant
63:     LD  3,-11(1)	Load variable
64:     ST  3,-11(1)	Save left side
65:    LDC  3,222(6)	Load constant
66:     LD  4,-11(1)	Load left into ac1
67:    ADD  3,4,3	Op +
68:     ST  3,-11(1)	Save left side
69:     ST  3,-3(1)	Store variable y
70:     LD  3,-4(1)	Load variable
71:     LD  3,-3(1)	Load variable
72:     ST  3,-4(1)	Store variable z
* RETURN
73:     LD  3,-4(1)	Load variable
* END COMPOUND
74:    LDA  2,0(3)	Copy result to rt register
75:     LD  3,-1(1)	Load return address
76:     LD  1,0(1)	Adjust fp
77:    LDA  7,0(3)	Return
* Add standard closing in case there is no return statement
78:    LDC  2,0(6)	Set return value to 0
79:     LD  3,-1(1)	Load return address
80:     LD  1,0(1)	Adjust fp
81:    LDA  7,0(3)	Return
* END FUNCTION dog
* FUNCTION main
82:     ST  3,-1(1)	Store return address.
* COMPOUND
* Compound Body
*			 Begin call to output
83:     ST  1,-2(1)	Store old fp in ghost frame
*			 Begin call to dog
84:     ST  1,-4(1)	Store old fp in ghost frame
85:    LDC  3,666(6)	Load int constant
86:     ST  3,-6(1)	Store Parameter
*			 Jump to dog
87:    LDA 1,-4(1)	Load address of new frame
88:    LDA 3,1(7)	Return address in ac
89:    LDA 7,-48(7)	CALL dog
90:    LDA 3,0(2)	save result in ac
91:     ST  3,-4(1)	Store parameter
*			 Jump to output
92:    LDA 1,-2(1)	Load address of new frame
93:    LDA 3,1(7)	Return address in ac
94:    LDA 7,-89(7)	CALL output
95:    LDA 3,0(2)	save result in ac
96:     ST  3,-2(1)	Store parameter
*			 Begin call to outnl
97:     ST  1,-2(1)	Store old fp in ghost frame
*			 Jump to outnl
98:    LDA 1,-2(1)	Load address of new frame
99:    LDA 3,1(7)	Return address in ac
100:    LDA 7,-64(7)	CALL outnl
101:    LDA 3,0(2)	save result in ac
102:     ST  3,-2(1)	Store parameter
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0
104:     LD  3,-1(1)	Load return address
105:     LD  1,0(1)	Adjust fp
106:    LDA  7,0(3)	Return
* END FUNCTION main
0:    LDA  7,106(7)	Jump to init [backpatch]
* INIT
107:     LD  0,0(0)	Set the global pointer
108:    LDA  1,0(0)	set first frame at end of globals
109:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
110:    LDA  3,1(7)	Return address in ac
111:    LDA  7,-30(7)	Jump to main
112:   HALT  0,0,0	DONE!
* END INIT
