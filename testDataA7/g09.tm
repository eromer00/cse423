* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  g09.c-
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
* RETURN
 43:    LDC  3,77(6)	Load integer constant 
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-2(1)	Load address of base of array z
 46:     ST  3,-5(1)	Save left side 
 47:     LD  3,-3(1)	Load variable x
 48:     LD  4,-5(1)	Load left into ac1 
 49:    SUB  3,4,3	compute location from index 
 50:     LD  3,0(3)	Load array element 
 51:     ST  3,-5(1)	Save left side 
 52:     LD  3,-2(1)	Load address of base of array z
 53:     ST  3,-6(1)	Save left side 
 54:     LD  3,-3(1)	Load variable x
 55:     LD  4,-6(1)	Load left into ac1 
 56:    SUB  3,4,3	compute location from index 
 57:     LD  3,0(3)	Load array element 
 58:     LD  4,-5(1)	Load left into ac1 
 59:    MUL  3,4,3	Op * 
 60:     LD  4,-4(1)	Load left into ac1 
 61:    ADD  3,4,3	Op + 
 62:    LDA  2,0(3)	Copy result to rt register 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 70:     ST  3,-1(1)	Store return address. 
* COMPOUND
 71:    LDC  3,10(6)	load size of array z
 72:     ST  3,-2(1)	save size of array z
* Compound Body
* EXPRESSION
 73:    LDC  3,3(6)	Load integer constant 
 74:     ST  3,-13(1)	Save index 
 75:    LDC  3,445(6)	Load integer constant 
 76:     LD  4,-13(1)	Restore index 
 77:    LDA  5,-3(1)	Load address of base of array z
 78:    SUB  5,5,4	Compute offset of value 
 79:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  output
 80:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
 81:     ST  1,-15(1)	Store old fp in ghost frame 
*                       Load param 1
 82:    LDA  3,-3(1)	Load address of base of array z
 83:     ST  3,-17(1)	Store parameter 
*                       Load param 2
 84:    LDC  3,3(6)	Load integer constant 
 85:     ST  3,-18(1)	Store parameter 
*                       Jump to cat
 86:    LDA  1,-15(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-47(7)	CALL cat
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 90:     ST  3,-15(1)	Save left side 
 91:    LDC  3,100(6)	Load integer constant 
 92:     LD  4,-15(1)	Load left into ac1 
 93:    DIV  5,4,3	Op % 
 94:    MUL  5,5,3	 
 95:    SUB  3,4,5	 
 96:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 97:    LDA  1,-13(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
101:    LDC  2,0(6)	Set return value to 0 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,104(7)	Jump to init [backpatch] 
* INIT
105:     LD  0,0(0)	Set the global pointer 
106:    LDA  1,0(0)	set first frame at end of globals 
107:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-40(7)	Jump to main 
110:   HALT  0,0,0	DONE! 
* END INIT
