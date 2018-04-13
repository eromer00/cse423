* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  examplearray.c-
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
 43:    LDC  3,22(6)	load size of array y
 44:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
 45:    LDC  3,11(6)	Load integer constant 
 46:     ST  3,-27(1)	Save index 
 47:     LD  3,-2(1)	Load variable x
 48:     ST  3,-28(1)	Save left side 
 49:    LDC  3,111(6)	Load integer constant 
 50:     LD  4,-28(1)	Load left into ac1 
 51:    MUL  3,4,3	Op * 
 52:     ST  3,-28(1)	Save left side 
 53:    LDC  3,222(6)	Load integer constant 
 54:     LD  4,-28(1)	Load left into ac1 
 55:    ADD  3,4,3	Op + 
 56:     LD  4,-27(1)	Restore index 
 57:    LDA  5,-4(1)	Load address of base of array y
 58:    SUB  5,5,4	Compute offset of value 
 59:     ST  3,0(5)	Store variable y
* EXPRESSION
 60:    LDA  3,-4(1)	Load address of base of array y
 61:     ST  3,-27(1)	Save left side 
 62:    LDC  3,11(6)	Load integer constant 
 63:     LD  4,-27(1)	Load left into ac1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
 66:     ST  3,-26(1)	Store variable z
* EXPRESSION
 67:    LDC  3,13(6)	Load integer constant 
 68:     ST  3,-27(1)	Save index 
 69:    LDA  3,-1(0)	Load address of base of array w
 70:     ST  3,-28(1)	Save left side 
 71:    LDC  3,15(6)	Load integer constant 
 72:     LD  4,-28(1)	Load left into ac1 
 73:    SUB  3,4,3	compute location from index 
 74:     LD  3,0(3)	Load array element 
 75:    LDC  4,0(6)	Load 0 
 76:    SUB  3,4,3	Op unary - 
 77:     ST  3,-28(1)	Save left side 
 78:     LD  3,-2(1)	Load variable x
 79:     LD  4,-28(1)	Load left into ac1 
 80:    MUL  3,4,3	Op * 
 81:     ST  3,-28(1)	Save left side 
 82:    LDA  3,-4(1)	Load address of base of array y
 83:     ST  3,-29(1)	Save left side 
 84:    LDC  3,17(6)	Load integer constant 
 85:     LD  4,-29(1)	Load left into ac1 
 86:    SUB  3,4,3	compute location from index 
 87:     LD  3,0(3)	Load array element 
 88:     LD  4,-28(1)	Load left into ac1 
 89:    MUL  3,4,3	Op * 
 90:     ST  3,-28(1)	Save left side 
 91:     LD  3,-26(1)	Load variable z
 92:     LD  4,-28(1)	Load left into ac1 
 93:    MUL  3,4,3	Op * 
 94:     LD  4,-27(1)	Restore index 
 95:    LDA  5,-1(0)	Load address of base of array w
 96:    SUB  5,5,4	Compute offset of value 
 97:     ST  3,0(5)	Store variable w
* RETURN
 98:     LD  3,-26(1)	Load variable z
 99:    LDA  2,0(3)	Copy result to rt register 
100:     LD  3,-1(1)	Load return address 
101:     LD  1,0(1)	Adjust fp 
102:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
107:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  dog
108:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
109:    LDC  3,666(6)	Load integer constant 
110:     ST  3,-4(1)	Store parameter 
*                       Jump to dog
111:    LDA  1,-2(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-72(7)	CALL dog
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,118(7)	Jump to init [backpatch] 
* INIT
119:     LD  0,0(0)	Set the global pointer 
120:    LDA  1,-34(0)	set first frame at end of globals 
121:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
122:    LDC  3,33(6)	load size of array w
123:     ST  3,0(0)	save size of array w
* END INIT GLOBALS AND STATICS
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-19(7)	Jump to main 
126:   HALT  0,0,0	DONE! 
* END INIT
