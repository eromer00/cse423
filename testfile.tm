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
* FUNCTION main
42:     ST  3,-1(1)	Store return address.
* COMPOUND
* Compound Body
43:     LD  3,-2(1)	Load variable
44:     LDC  3,10(6)	Load int constant
45:     ST  3,-2(1)	Store variable x
*			 Begin call to output
46:     ST  1,-3(1)	Store old fp in ghost frame
47:     LD  3,-2(1)	Load variable
48:     ST  3,-5(1)	Store Parameter
*			 Jump to output
49:    LDA 1,-3(1)	Load address of new frame
50:    LDA 3,1(7)	Return address in ac
51:    LDA 7,-46(7)	CALL output
52:    LDA 3,0(2)	save result in ac
53:     ST  3,-3(1)	Store parameter
54:     LD  3,-2(1)	Load variable
55:     LDC  3,5(6)	Load int constant
56:     LD  3,-3(1)	Load variable
57:     ST  3,-3(1)	Store variable
58:     LD  3,-2(1)	Load variable
59:     LD  4,-3(1)	Load left into ac1
60:    ADD  3,4,3	Op +
61:     ST  3,-3(1)	Save left side
62:     ST  3,-2(1)	Store variable x
*			 Begin call to output
63:     ST  1,-3(1)	Store old fp in ghost frame
64:     LD  3,-2(1)	Load variable
65:     ST  3,-5(1)	Store Parameter
*			 Jump to output
66:    LDA 1,-3(1)	Load address of new frame
67:    LDA 3,1(7)	Return address in ac
68:    LDA 7,-63(7)	CALL output
69:    LDA 3,0(2)	save result in ac
70:     ST  3,-3(1)	Store parameter
*			 Begin call to outnl
71:     ST  1,-3(1)	Store old fp in ghost frame
*			 Jump to outnl
72:    LDA 1,-3(1)	Load address of new frame
73:    LDA 3,1(7)	Return address in ac
74:    LDA 7,-38(7)	CALL outnl
75:    LDA 3,0(2)	save result in ac
76:     ST  3,-3(1)	Store parameter
* END COMPOUND
* Add standard closing in case there is no return statement
77:    LDC  2,0(6)	Set return value to 0
78:     LD  3,-1(1)	Load return address
79:     LD  1,0(1)	Adjust fp
80:    LDA  7,0(3)	Return
* END FUNCTION main
0:    LDA  7,80(7)	Jump to init [backpatch]
* INIT
81:     LD  0,0(0)	Set the global pointer
82:    LDA  1,0(0)	set first frame at end of globals
83:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
84:    LDA  3,1(7)	Return address in ac
85:    LDA  7,-44(7)	Jump to main
86:   HALT  0,0,0	DONE!
* END INIT
