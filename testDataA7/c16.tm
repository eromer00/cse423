* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  c16.c-
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
* Compound Body
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable z
* EXPRESSION
 45:    LDC  3,2(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable zz
* EXPRESSION
 47:     LD  3,-3(1)	Load variable zz
 48:     ST  3,-4(1)	Save index 
 49:    LDC  3,73(6)	Load integer constant 
 50:     LD  4,-4(1)	Restore index 
 51:    LDA  5,-1(0)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
 54:     LD  3,-2(1)	Load variable z
 55:     ST  3,-4(1)	Save index 
 56:    LDC  3,211(6)	Load integer constant 
 57:     LD  4,-4(1)	Restore index 
 58:    LDA  5,-5(0)	Load address of base of array y
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 61:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 62:    LDA  3,-1(0)	Load address of base of array x
 63:     ST  3,-6(1)	Save left side 
 64:    LDC  3,33(6)	Load integer constant 
 65:     ST  3,-7(1)	Save left side 
 66:    LDC  3,31(6)	Load integer constant 
 67:     LD  4,-7(1)	Load left into ac1 
 68:    SUB  3,4,3	Op - 
 69:     LD  4,-6(1)	Load left into ac1 
 70:    SUB  3,4,3	compute location from index 
 71:     LD  3,0(3)	Load array element 
 72:     ST  3,-6(1)	Save left side 
 73:    LDA  3,-5(0)	Load address of base of array y
 74:     ST  3,-7(1)	Save left side 
 75:    LDC  3,9123(6)	Load integer constant 
 76:     ST  3,-8(1)	Save left side 
 77:    LDC  3,9100(6)	Load integer constant 
 78:     ST  3,-9(1)	Save left side 
 79:    LDC  3,23(6)	Load integer constant 
 80:     LD  4,-9(1)	Load left into ac1 
 81:    ADD  3,4,3	Op + 
 82:     LD  4,-8(1)	Load left into ac1 
 83:    DIV  3,4,3	Op / 
 84:     LD  4,-7(1)	Load left into ac1 
 85:    SUB  3,4,3	compute location from index 
 86:     LD  3,0(3)	Load array element 
 87:     LD  4,-6(1)	Load left into ac1 
 88:    ADD  3,4,3	Op + 
 89:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-4(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 94:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 95:    LDA  1,-4(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-61(7)	CALL outnl
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 99:    LDC  2,0(6)	Set return value to 0 
100:     LD  3,-1(1)	Load return address 
101:     LD  1,0(1)	Adjust fp 
102:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,102(7)	Jump to init [backpatch] 
* INIT
103:     LD  0,0(0)	Set the global pointer 
104:    LDA  1,-9(0)	set first frame at end of globals 
105:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
106:    LDC  3,3(6)	load size of array x
107:     ST  3,0(0)	save size of array x
108:    LDC  3,4(6)	load size of array y
109:     ST  3,-4(0)	save size of array y
* END INIT GLOBALS AND STATICS
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-70(7)	Jump to main 
112:   HALT  0,0,0	DONE! 
* END INIT
