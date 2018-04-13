* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  array1.c-
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
* FUNCTION ford
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,22(6)	load size of array z
 44:     ST  3,-4(1)	save size of array z
* Compound Body
* EXPRESSION
 45:     LD  3,-2(1)	Load address of base of array x
 46:     LD  3,1(3)	Load array size 
* EXPRESSION
 47:    LDC  3,11(6)	Load integer constant 
 48:     ST  3,-27(1)	Save index 
 49:     LD  3,-2(1)	Load address of base of array x
 50:     ST  3,-28(1)	Save left side 
 51:    LDC  3,3(6)	Load integer constant 
 52:     LD  4,-28(1)	Load left into ac1 
 53:    SUB  3,4,3	compute location from index 
 54:     LD  3,0(3)	Load array element 
 55:     LD  4,-27(1)	Restore index 
 56:    LDA  5,-5(1)	Load address of base of array z
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable z
* EXPRESSION
 59:    LDC  3,3(6)	Load integer constant 
 60:     ST  3,-27(1)	Save index 
 61:    LDC  3,777(6)	Load integer constant 
 62:     LD  4,-27(1)	Restore index 
 63:     LD  5,-2(1)	Load address of base of array x
 64:    SUB  5,5,4	Compute offset of value 
 65:     ST  3,0(5)	Store variable x
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 70:     ST  3,-1(1)	Store return address. 
* COMPOUND
 71:    LDC  3,33(6)	load size of array y
 72:     ST  3,-2(1)	save size of array y
* Compound Body
* EXPRESSION
 73:    LDC  3,3(6)	Load integer constant 
 74:     ST  3,-36(1)	Save index 
 75:    LDC  3,666(6)	Load integer constant 
 76:     LD  4,-36(1)	Restore index 
 77:    LDA  5,-3(1)	Load address of base of array y
 78:    SUB  5,5,4	Compute offset of value 
 79:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  ford
 80:     ST  1,-36(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDA  3,-3(1)	Load address of base of array y
 82:     ST  3,-38(1)	Store parameter 
*                       Load param 2
 83:    LDA  3,-3(1)	Load address of base of array y
 84:     ST  3,-39(1)	Store parameter 
*                       Jump to ford
 85:    LDA  1,-36(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-46(7)	CALL ford
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-36(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDA  3,-3(1)	Load address of base of array y
 91:     ST  3,-38(1)	Save left side 
 92:    LDC  3,3(6)	Load integer constant 
 93:     LD  4,-38(1)	Load left into ac1 
 94:    SUB  3,4,3	compute location from index 
 95:     LD  3,0(3)	Load array element 
 96:     ST  3,-38(1)	Store parameter 
*                       Jump to output
 97:    LDA  1,-36(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
101:     ST  1,-36(1)	Store old fp in ghost frame 
*                       Jump to outnl
102:    LDA  1,-36(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-68(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,109(7)	Jump to init [backpatch] 
* INIT
110:     LD  0,0(0)	Set the global pointer 
111:    LDA  1,0(0)	set first frame at end of globals 
112:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-45(7)	Jump to main 
115:   HALT  0,0,0	DONE! 
* END INIT
