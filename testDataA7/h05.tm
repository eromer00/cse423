* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  h05.c-
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
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load address of base of array x
 45:     ST  3,-5(1)	Save left side 
 46:    LDC  3,3(6)	Load integer constant 
 47:     LD  4,-5(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-3(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 60:     LD  3,-2(1)	Load address of base of array x
 61:     ST  3,-3(1)	Save left side 
 62:    LDC  3,3(6)	Load integer constant 
 63:     LD  4,-3(1)	Load left into ac1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
 66:     ST  3,-3(1)	Save left side 
 67:    LDC  3,0(6)	Load integer constant 
 68:     LD  4,-3(1)	Load left into ac1 
 69:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 71:    LDC  3,3(6)	Load integer constant 
 72:     ST  3,-3(1)	Save index 
 73:    LDC  3,1(6)	Load integer constant 
 74:     LD  4,-3(1)	Restore index 
 75:     LD  5,-2(1)	Load address of base of array x
 76:    SUB  5,5,4	Compute offset of value 
 77:     LD  4,0(5)	load lhs variable x
 78:    SUB  3,4,3	op -= 
 79:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
 80:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 81:     LD  3,-2(1)	Load address of base of array x
 82:     ST  3,-5(1)	Store parameter 
*                       Jump to cat
 83:    LDA  1,-3(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	CALL cat
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
 70:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 94:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
 95:    LDC  3,3(6)	Load integer constant 
 96:     ST  3,-2(1)	Save index 
 97:    LDC  3,12(6)	Load integer constant 
 98:     LD  4,-2(1)	Restore index 
 99:    LDA  5,-1(0)	Load address of base of array x
100:    SUB  5,5,4	Compute offset of value 
101:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
102:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
103:    LDA  3,-1(0)	Load address of base of array x
104:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
105:    LDA  1,-2(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-66(7)	CALL cat
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
109:    LDC  2,0(6)	Set return value to 0 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,112(7)	Jump to init [backpatch] 
* INIT
113:     LD  0,0(0)	Set the global pointer 
114:    LDA  1,-19(0)	set first frame at end of globals 
115:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
116:    LDC  3,18(6)	load size of array x
117:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-26(7)	Jump to main 
120:   HALT  0,0,0	DONE! 
* END INIT
