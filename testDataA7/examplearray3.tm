* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  examplearray3.c-
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
 43:    LDC  3,9999(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable q
* Compound Body
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 46:     LD  3,-2(1)	Load address of base of array x
 47:     ST  3,-6(1)	Save left side 
 48:    LDC  3,1(6)	Load integer constant 
 49:     LD  4,-6(1)	Load left into ac1 
 50:    SUB  3,4,3	compute location from index 
 51:     LD  3,0(3)	Load array element 
 52:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 53:    LDA  1,-4(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-50(7)	CALL output
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 57:    LDC  2,0(6)	Set return value to 0 
 58:     LD  3,-1(1)	Load return address 
 59:     LD  1,0(1)	Adjust fp 
 60:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
 61:     ST  3,-1(1)	Store return address. 
* COMPOUND
 62:    LDC  3,9999(6)	Load integer constant 
 63:     ST  3,-3(1)	Store variable q
* Compound Body
* EXPRESSION
*                       Begin call to  cat
 64:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 65:     LD  3,-2(1)	Load address of base of array y
 66:     ST  3,-6(1)	Store parameter 
*                       Jump to cat
 67:    LDA  1,-4(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-28(7)	CALL cat
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 75:     ST  3,-1(1)	Store return address. 
* COMPOUND
 76:    LDC  3,9999(6)	Load integer constant 
 77:     ST  3,-2(1)	Store variable q
 78:    LDC  3,10(6)	load size of array z
 79:     ST  3,-3(1)	save size of array z
* Compound Body
* EXPRESSION
 80:    LDC  3,1(6)	Load integer constant 
 81:     ST  3,-14(1)	Save index 
 82:    LDC  3,777(6)	Load integer constant 
 83:     LD  4,-14(1)	Restore index 
 84:    LDA  5,-4(1)	Load address of base of array z
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  dog
 87:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDA  3,-4(1)	Load address of base of array z
 89:     ST  3,-16(1)	Store parameter 
*                       Jump to dog
 90:    LDA  1,-14(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-32(7)	CALL dog
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust fp 
 97:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,97(7)	Jump to init [backpatch] 
* INIT
 98:     LD  0,0(0)	Set the global pointer 
 99:    LDA  1,0(0)	set first frame at end of globals 
100:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-28(7)	Jump to main 
103:   HALT  0,0,0	DONE! 
* END INIT
