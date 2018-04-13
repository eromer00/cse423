* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  localArray.c-
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
 43:    LDC  3,3(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,4(6)	load size of array b
 46:     ST  3,-6(1)	save size of array b
* Compound Body
* EXPRESSION
 47:    LDC  3,2(6)	Load integer constant 
 48:     ST  3,-11(1)	Save index 
 49:    LDC  3,666(6)	Load integer constant 
 50:     LD  4,-11(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
 54:    LDC  3,3(6)	Load integer constant 
 55:     ST  3,-11(1)	Save index 
 56:    LDC  3,1(6)	Load Boolean constant 
 57:     LD  4,-11(1)	Restore index 
 58:    LDA  5,-7(1)	Load address of base of array b
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
 61:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
 62:    LDA  3,-3(1)	Load address of base of array x
 63:     ST  3,-13(1)	Save left side 
 64:    LDC  3,2(6)	Load integer constant 
 65:     LD  4,-13(1)	Load left into ac1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
 68:     ST  3,-13(1)	Store parameter 
*                       Jump to output
 69:    LDA  1,-11(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 73:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
 74:    LDA  3,-7(1)	Load address of base of array b
 75:     ST  3,-13(1)	Save left side 
 76:    LDC  3,3(6)	Load integer constant 
 77:     LD  4,-13(1)	Load left into ac1 
 78:    SUB  3,4,3	compute location from index 
 79:     LD  3,0(3)	Load array element 
 80:     ST  3,-13(1)	Store parameter 
*                       Jump to outputb
 81:    LDA  1,-11(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-66(7)	CALL outputb
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* RETURN
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,91(7)	Jump to init [backpatch] 
* INIT
 92:     LD  0,0(0)	Set the global pointer 
 93:    LDA  1,0(0)	set first frame at end of globals 
 94:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-55(7)	Jump to main 
 97:   HALT  0,0,0	DONE! 
* END INIT
