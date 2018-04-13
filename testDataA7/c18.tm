* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c18.c-
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
 43:    LDC  3,7(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,9(6)	load size of array y
 46:     ST  3,-10(1)	save size of array y
* Compound Body
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-20(1)	Save index 
 49:    LDC  3,333(6)	Load integer constant 
 50:     LD  4,-20(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
 54:    LDC  3,7(6)	Load integer constant 
 55:     ST  3,-20(1)	Save index 
 56:    LDC  3,444(6)	Load integer constant 
 57:     LD  4,-20(1)	Restore index 
 58:    LDA  5,-11(1)	Load address of base of array y
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable y
* EXPRESSION
 61:    LDC  3,5(6)	Load integer constant 
 62:     ST  3,-20(1)	Save index 
 63:    LDA  3,-11(1)	Load address of base of array y
 64:     ST  3,-21(1)	Save left side 
 65:    LDC  3,7(6)	Load integer constant 
 66:     LD  4,-21(1)	Load left into ac1 
 67:    SUB  3,4,3	compute location from index 
 68:     LD  3,0(3)	Load array element 
 69:     LD  4,-20(1)	Restore index 
 70:    LDA  5,-3(1)	Load address of base of array x
 71:    SUB  5,5,4	Compute offset of value 
 72:     LD  4,0(5)	load lhs variable x
 73:    ADD  3,4,3	op += 
 74:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 75:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 76:    LDA  3,-3(1)	Load address of base of array x
 77:     ST  3,-22(1)	Save left side 
 78:    LDC  3,5(6)	Load integer constant 
 79:     LD  4,-22(1)	Load left into ac1 
 80:    SUB  3,4,3	compute location from index 
 81:     LD  3,0(3)	Load array element 
 82:     ST  3,-22(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-20(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 87:    LDC  3,7(6)	Load integer constant 
 88:     ST  3,-20(1)	Save index 
 89:    LDA  3,-3(1)	Load address of base of array x
 90:     ST  3,-21(1)	Save left side 
 91:    LDC  3,5(6)	Load integer constant 
 92:     LD  4,-21(1)	Load left into ac1 
 93:    SUB  3,4,3	compute location from index 
 94:     LD  3,0(3)	Load array element 
 95:     LD  4,-20(1)	Restore index 
 96:    LDA  5,-11(1)	Load address of base of array y
 97:    SUB  5,5,4	Compute offset of value 
 98:     LD  4,0(5)	load lhs variable y
 99:    SUB  3,4,3	op -= 
100:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
101:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
102:    LDA  3,-11(1)	Load address of base of array y
103:     ST  3,-22(1)	Save left side 
104:    LDC  3,7(6)	Load integer constant 
105:     LD  4,-22(1)	Load left into ac1 
106:    SUB  3,4,3	compute location from index 
107:     LD  3,0(3)	Load array element 
108:     ST  3,-22(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-20(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
113:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
114:    LDA  1,-20(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-80(7)	CALL outnl
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
118:    LDC  2,0(6)	Set return value to 0 
119:     LD  3,-1(1)	Load return address 
120:     LD  1,0(1)	Adjust fp 
121:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,121(7)	Jump to init [backpatch] 
* INIT
122:     LD  0,0(0)	Set the global pointer 
123:    LDA  1,0(0)	set first frame at end of globals 
124:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-85(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
