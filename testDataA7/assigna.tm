* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  assigna.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-2(1)	Load address of base of array z
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,7(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    SUB  3,4,3	compute location from index 
 48:     LD  3,0(3)	Load array element 
* EXPRESSION
 49:     LD  3,-2(1)	Load address of base of array z
 50:     LD  3,1(3)	Load array size 
* END COMPOUND
* Add standard closing in case there is no return statement
 51:    LDC  2,0(6)	Set return value to 0 
 52:     LD  3,-1(1)	Load return address 
 53:     LD  1,0(1)	Adjust fp 
 54:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 55:     ST  3,-1(1)	Store return address. 
* COMPOUND
 56:    LDC  3,11(6)	load size of array y
 57:     ST  3,-5(1)	save size of array y
* Compound Body
* EXPRESSION
 58:     LD  3,0(0)	Load variable gnu
 59:     ST  3,0(0)	Store variable gnu
* EXPRESSION
 60:    LDC  3,9(6)	Load integer constant 
 61:     ST  3,-17(1)	Save index 
 62:    LDA  3,-2(0)	Load address of base of array goat
 63:     ST  3,-18(1)	Save left side 
 64:    LDC  3,10(6)	Load integer constant 
 65:     LD  4,-18(1)	Load left into ac1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
 68:     LD  4,-17(1)	Restore index 
 69:    LDA  5,-2(0)	Load address of base of array goat
 70:    SUB  5,5,4	Compute offset of value 
 71:     ST  3,0(5)	Store variable goat
* EXPRESSION
 72:    LDA  3,-2(0)	Load address of base of array goat
 73:     LD  3,1(3)	Load array size 
* EXPRESSION
 74:     LD  3,-4(1)	Load variable a
 75:     ST  3,-4(1)	Store variable a
* EXPRESSION
 76:    LDC  3,3(6)	Load integer constant 
 77:     ST  3,-17(1)	Save index 
 78:    LDA  3,-6(1)	Load address of base of array y
 79:     ST  3,-18(1)	Save left side 
 80:    LDC  3,4(6)	Load integer constant 
 81:     LD  4,-18(1)	Load left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     LD  4,-17(1)	Restore index 
 85:    LDA  5,-6(1)	Load address of base of array y
 86:    SUB  5,5,4	Compute offset of value 
 87:     ST  3,0(5)	Store variable y
* EXPRESSION
 88:    LDA  3,-6(1)	Load address of base of array y
 89:     LD  3,1(3)	Load array size 
* EXPRESSION
 90:     LD  3,-3(1)	Load variable p
 91:     ST  3,-3(1)	Store variable p
* EXPRESSION
 92:    LDC  3,3(6)	Load integer constant 
 93:     ST  3,-17(1)	Save index 
 94:     LD  3,-2(1)	Load address of base of array x
 95:     ST  3,-18(1)	Save left side 
 96:    LDC  3,4(6)	Load integer constant 
 97:     LD  4,-18(1)	Load left into ac1 
 98:    SUB  3,4,3	compute location from index 
 99:     LD  3,0(3)	Load array element 
100:     LD  4,-17(1)	Restore index 
101:     LD  5,-2(1)	Load address of base of array x
102:    SUB  5,5,4	Compute offset of value 
103:     ST  3,0(5)	Store variable x
* EXPRESSION
104:     LD  3,-2(1)	Load address of base of array x
105:     LD  3,1(3)	Load array size 
* EXPRESSION
*                       Begin call to  cat
106:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
107:     LD  3,-2(1)	Load address of base of array x
108:     ST  3,-19(1)	Store parameter 
*                       Jump to cat
109:    LDA  1,-17(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-70(7)	CALL cat
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
117:     ST  3,-1(1)	Store return address. 
* COMPOUND
118:    LDC  3,22(6)	load size of array ma
119:     ST  3,-3(1)	save size of array ma
* Compound Body
* EXPRESSION
*                       Begin call to  dog
120:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
121:    LDA  3,-4(1)	Load address of base of array ma
122:     ST  3,-28(1)	Store parameter 
*                       Load param 2
123:     LD  3,-2(1)	Load variable m
124:     ST  3,-29(1)	Store parameter 
*                       Jump to dog
125:    LDA  1,-26(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-73(7)	CALL dog
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
129:    LDC  2,0(6)	Set return value to 0 
130:     LD  3,-1(1)	Load return address 
131:     LD  1,0(1)	Adjust fp 
132:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,132(7)	Jump to init [backpatch] 
* INIT
133:     LD  0,0(0)	Set the global pointer 
134:    LDA  1,-18(0)	set first frame at end of globals 
135:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
136:    LDC  3,16(6)	load size of array goat
137:     ST  3,-1(0)	save size of array goat
* END INIT GLOBALS AND STATICS
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-23(7)	Jump to main 
140:   HALT  0,0,0	DONE! 
* END INIT
