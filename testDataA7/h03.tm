* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  h03.c-
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
 73:     LD  3,-2(1)	Load address of base of array x
 74:     ST  3,-4(1)	Save left side 
 75:    LDC  3,3(6)	Load integer constant 
 76:     LD  4,-4(1)	Load left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
 79:     ST  3,-4(1)	Save left side 
 80:    LDC  3,1(6)	Load integer constant 
 81:     LD  4,-4(1)	Load left into ac1 
 82:    SUB  3,4,3	Op - 
 83:     LD  4,-3(1)	Restore index 
 84:     LD  5,-2(1)	Load address of base of array x
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-2(1)	Load address of base of array x
 89:     ST  3,-5(1)	Store parameter 
*                       Jump to cat
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL cat
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
 70:    JZR  3,23(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
101:     ST  3,-1(1)	Store return address. 
* COMPOUND
102:    LDC  3,18(6)	load size of array x
103:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
104:    LDC  3,3(6)	Load integer constant 
105:     ST  3,-21(1)	Save index 
106:    LDC  3,12(6)	Load integer constant 
107:     LD  4,-21(1)	Restore index 
108:    LDA  5,-3(1)	Load address of base of array x
109:    SUB  5,5,4	Compute offset of value 
110:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
111:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Load param 1
112:    LDA  3,-3(1)	Load address of base of array x
113:     ST  3,-23(1)	Store parameter 
*                       Jump to cat
114:    LDA  1,-21(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-75(7)	CALL cat
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
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
126:    LDA  7,-26(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
