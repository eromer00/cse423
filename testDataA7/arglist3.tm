* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  arglist3.c-
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
* FUNCTION kate
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* RETURN
 43:    LDC  3,666(6)	Load integer constant 
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION kate
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 53:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  kate
 54:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDC  3,2(6)	Load integer constant 
 56:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 57:    LDC  3,3(6)	Load integer constant 
 58:     ST  3,-7(1)	Store parameter 
*                       Load param 3
 59:    LDC  3,5(6)	Load integer constant 
 60:     ST  3,-8(1)	Store parameter 
*                       Load param 4
 61:    LDC  3,7(6)	Load integer constant 
 62:     ST  3,-9(1)	Store parameter 
*                       Load param 5
 63:    LDC  3,11(6)	Load integer constant 
 64:     ST  3,-10(1)	Store parameter 
*                       Load param 6
 65:    LDC  3,13(6)	Load integer constant 
 66:     ST  3,-11(1)	Store parameter 
*                       Jump to kate
 67:    LDA  1,-4(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-28(7)	CALL kate
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to kate
 71:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
 76:    LDC  3,42(6)	Load integer constant 
 77:    LDA  2,0(3)	Copy result to rt register 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 81:    LDC  2,0(6)	Set return value to 0 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,84(7)	Jump to init [backpatch] 
* INIT
 85:     LD  0,0(0)	Set the global pointer 
 86:    LDA  1,0(0)	set first frame at end of globals 
 87:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-38(7)	Jump to main 
 90:   HALT  0,0,0	DONE! 
* END INIT
