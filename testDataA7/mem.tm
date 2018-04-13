* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  mem.c-
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
* FUNCTION polgara
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 43:     LD  3,-2(1)	Load variable a
 44:     ST  3,-4(1)	Store variable x
* RETURN
 45:     LD  3,-4(1)	Load variable x
 46:    LDA  2,0(3)	Copy result to rt register 
 47:     LD  3,-1(1)	Load return address 
 48:     LD  1,0(1)	Adjust fp 
 49:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
* END FUNCTION polgara
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 54:     ST  3,-1(1)	Store return address. 
* COMPOUND
 55:    LDC  3,3(6)	load size of array ai
 56:     ST  3,-4(1)	save size of array ai
 57:    LDC  3,2(6)	load size of array ab
 58:     ST  3,-8(1)	save size of array ab
* Compound Body
* EXPRESSION
*                       Begin call to  polgara
 59:     ST  1,-12(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-2(1)	Load variable i
 61:     ST  3,-14(1)	Save left side 
 62:    LDC  3,43(6)	Load integer constant 
 63:     LD  4,-14(1)	Load left into ac1 
 64:    ADD  3,4,3	Op + 
 65:     ST  3,-14(1)	Store parameter 
*                       Load param 2
 66:     LD  3,-3(1)	Load variable b
 67:     ST  3,-15(1)	Store parameter 
*                       Jump to polgara
 68:    LDA  1,-12(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-29(7)	CALL polgara
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to polgara
 72:     ST  3,-11(1)	Store variable z
* EXPRESSION
 73:    LDC  3,666(6)	Load integer constant 
 74:     ST  3,0(0)	Store variable u
* EXPRESSION
 75:    LDC  3,3(6)	Load integer constant 
 76:     ST  3,-12(1)	Save index 
 77:    LDC  3,1(6)	Load Boolean constant 
 78:     LD  4,-12(1)	Restore index 
 79:    LDA  5,-2(0)	Load address of base of array v
 80:    SUB  5,5,4	Compute offset of value 
 81:     ST  3,0(5)	Store variable v
* END COMPOUND
* Add standard closing in case there is no return statement
 82:    LDC  2,0(6)	Set return value to 0 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,85(7)	Jump to init [backpatch] 
* INIT
 86:     LD  0,0(0)	Set the global pointer 
 87:    LDA  1,-6(0)	set first frame at end of globals 
 88:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 89:    LDC  3,4(6)	load size of array v
 90:     ST  3,-1(0)	save size of array v
* END INIT GLOBALS AND STATICS
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-39(7)	Jump to main 
 93:   HALT  0,0,0	DONE! 
* END INIT
