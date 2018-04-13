* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  example.c-
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
* EXPRESSION
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-5(1)	Save left side 
 45:    LDC  3,111(6)	Load integer constant 
 46:     LD  4,-5(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:     ST  3,-5(1)	Save left side 
 49:    LDC  3,222(6)	Load integer constant 
 50:     LD  4,-5(1)	Load left into ac1 
 51:    ADD  3,4,3	Op + 
 52:     ST  3,-3(1)	Store variable y
* EXPRESSION
 53:     LD  3,-3(1)	Load variable y
 54:     ST  3,-5(1)	Save left side 
 55:    LDC  3,333(6)	Load integer constant 
 56:     ST  3,-6(1)	Save left side 
 57:    LDC  3,444(6)	Load integer constant 
 58:     ST  3,-7(1)	Save left side 
 59:    LDC  3,555(6)	Load integer constant 
 60:     LD  4,-7(1)	Load left into ac1 
 61:    ADD  3,4,3	Op + 
 62:     LD  4,-6(1)	Load left into ac1 
 63:    MUL  3,4,3	Op * 
 64:     LD  4,-5(1)	Load left into ac1 
 65:    ADD  3,4,3	Op + 
 66:     ST  3,-4(1)	Store variable z
* EXPRESSION
 67:    LDC  3,111(6)	Load integer constant 
 68:     ST  3,-5(1)	Save left side 
 69:    LDC  3,222(6)	Load integer constant 
 70:     LD  4,-5(1)	Load left into ac1 
 71:    ADD  3,4,3	Op + 
 72:     ST  3,-5(1)	Save left side 
 73:    LDC  3,333(6)	Load integer constant 
 74:     ST  3,-6(1)	Save left side 
 75:    LDC  3,444(6)	Load integer constant 
 76:     LD  4,-6(1)	Load left into ac1 
 77:    ADD  3,4,3	Op + 
 78:     LD  4,-5(1)	Load left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,0(0)	Store variable w
* EXPRESSION
*                       Begin call to  dog
 81:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 82:    LDC  3,3(6)	Load integer constant 
 83:     ST  3,-7(1)	Store parameter 
*                       Jump to dog
 84:    LDA  1,-5(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-45(7)	CALL dog
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
 88:     ST  3,-5(1)	Save left side 
*                       Begin call to  dog
 89:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDC  3,3(6)	Load integer constant 
 91:     ST  3,-8(1)	Store parameter 
*                       Jump to dog
 92:    LDA  1,-6(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-53(7)	CALL dog
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
 96:     LD  4,-5(1)	Load left into ac1 
 97:    MUL  3,4,3	Op * 
 98:     ST  3,0(0)	Store variable w
* RETURN
 99:     LD  3,-4(1)	Load variable z
100:    LDA  2,0(3)	Copy result to rt register 
101:     LD  3,-1(1)	Load return address 
102:     LD  1,0(1)	Adjust fp 
103:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
104:    LDC  2,0(6)	Set return value to 0 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
108:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  dog
109:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,666(6)	Load integer constant 
111:     ST  3,-4(1)	Store parameter 
*                       Jump to dog
112:    LDA  1,-2(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-73(7)	CALL dog
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
116:    LDC  2,0(6)	Set return value to 0 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,119(7)	Jump to init [backpatch] 
* INIT
120:     LD  0,0(0)	Set the global pointer 
121:    LDA  1,-1(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-17(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
