* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  massign.c-
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
 43:    LDC  3,11(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* Compound Body
* EXPRESSION
 45:     LD  3,-4(1)	Load variable a
 46:     ST  3,-17(1)	Save left side 
 47:    LDC  3,777(6)	Load integer constant 
 48:     LD  4,-17(1)	Load left into ac1 
 49:    ADD  3,4,3	Op + 
 50:     ST  3,-4(1)	Store variable a
* EXPRESSION
 51:    LDC  3,777(6)	Load integer constant 
 52:     LD  4,-4(1)	load lhs variable a
 53:    ADD  3,4,3	op += 
 54:     ST  3,-4(1)	Store variable a
* EXPRESSION
 55:    LDC  3,7(6)	Load integer constant 
 56:     ST  3,-17(1)	Save index 
 57:    LDA  3,-6(1)	Load address of base of array y
 58:     ST  3,-18(1)	Save left side 
 59:    LDC  3,7(6)	Load integer constant 
 60:     LD  4,-18(1)	Load left into ac1 
 61:    SUB  3,4,3	compute location from index 
 62:     LD  3,0(3)	Load array element 
 63:     ST  3,-18(1)	Save left side 
 64:    LDC  3,888(6)	Load integer constant 
 65:     LD  4,-18(1)	Load left into ac1 
 66:    ADD  3,4,3	Op + 
 67:     LD  4,-17(1)	Restore index 
 68:    LDA  5,-6(1)	Load address of base of array y
 69:    SUB  5,5,4	Compute offset of value 
 70:     ST  3,0(5)	Store variable y
* EXPRESSION
 71:    LDC  3,7(6)	Load integer constant 
 72:     ST  3,-17(1)	Save index 
 73:    LDC  3,888(6)	Load integer constant 
 74:     LD  4,-17(1)	Restore index 
 75:    LDA  5,-6(1)	Load address of base of array y
 76:    SUB  5,5,4	Compute offset of value 
 77:     LD  4,0(5)	load lhs variable y
 78:    ADD  3,4,3	op += 
 79:     ST  3,0(5)	Store variable y
* EXPRESSION
 80:    LDC  3,7(6)	Load integer constant 
 81:     ST  3,-17(1)	Save index 
 82:     LD  3,-2(1)	Load address of base of array x
 83:     ST  3,-18(1)	Save left side 
 84:    LDC  3,7(6)	Load integer constant 
 85:     LD  4,-18(1)	Load left into ac1 
 86:    SUB  3,4,3	compute location from index 
 87:     LD  3,0(3)	Load array element 
 88:     ST  3,-18(1)	Save left side 
 89:    LDC  3,888(6)	Load integer constant 
 90:     LD  4,-18(1)	Load left into ac1 
 91:    ADD  3,4,3	Op + 
 92:     LD  4,-17(1)	Restore index 
 93:     LD  5,-2(1)	Load address of base of array x
 94:    SUB  5,5,4	Compute offset of value 
 95:     ST  3,0(5)	Store variable x
* EXPRESSION
 96:    LDC  3,7(6)	Load integer constant 
 97:     ST  3,-17(1)	Save index 
 98:    LDC  3,888(6)	Load integer constant 
 99:     LD  4,-17(1)	Restore index 
100:     LD  5,-2(1)	Load address of base of array x
101:    SUB  5,5,4	Compute offset of value 
102:     LD  4,0(5)	load lhs variable x
103:    ADD  3,4,3	op += 
104:     ST  3,0(5)	Store variable x
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
109:     ST  3,-1(1)	Store return address. 
* COMPOUND
110:    LDC  3,22(6)	load size of array ma
111:     ST  3,-3(1)	save size of array ma
* Compound Body
* EXPRESSION
*                       Begin call to  dog
112:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
113:    LDA  3,-4(1)	Load address of base of array ma
114:     ST  3,-28(1)	Store parameter 
*                       Load param 2
115:     LD  3,-2(1)	Load variable m
116:     ST  3,-29(1)	Store parameter 
*                       Jump to dog
117:    LDA  1,-26(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-78(7)	CALL dog
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
121:    LDC  2,0(6)	Set return value to 0 
122:     LD  3,-1(1)	Load return address 
123:     LD  1,0(1)	Adjust fp 
124:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,124(7)	Jump to init [backpatch] 
* INIT
125:     LD  0,0(0)	Set the global pointer 
126:    LDA  1,0(0)	set first frame at end of globals 
127:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-21(7)	Jump to main 
130:   HALT  0,0,0	DONE! 
* END INIT
