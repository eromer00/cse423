* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  callframe.c-
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
* FUNCTION write
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array k
 44:     ST  3,-3(1)	save size of array k
* Compound Body
* EXPRESSION
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable i
* WHILE
 47:     LD  3,-2(1)	Load variable i
 48:     ST  3,-14(1)	Save left side 
 49:    LDC  3,10(6)	Load integer constant 
 50:     LD  4,-14(1)	Load left into ac1 
 51:    TLT  3,4,3	Op < 
 52:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
 54:     LD  3,-2(1)	Load variable i
 55:     ST  3,-14(1)	Save index 
 56:     LD  3,-2(1)	load lhs variable i
 57:    LDA  3,1(3)	increment value of i
 58:     ST  3,-2(1)	Store variable i
 59:     LD  4,-14(1)	Restore index 
 60:    LDA  5,-4(1)	Load address of base of array k
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable k
 63:    LDA  7,-17(7)	go to beginning of loop 
 53:    LDA  7,10(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    LDA  7,0(3)	Return 
* END FUNCTION write
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION read
 68:     ST  3,-1(1)	Store return address. 
* COMPOUND
 69:    LDC  3,10(6)	load size of array k
 70:     ST  3,-3(1)	save size of array k
* Compound Body
* EXPRESSION
 71:    LDC  3,0(6)	Load integer constant 
 72:     ST  3,-2(1)	Store variable i
* WHILE
 73:     LD  3,-2(1)	Load variable i
 74:     ST  3,-14(1)	Save left side 
 75:    LDC  3,10(6)	Load integer constant 
 76:     LD  4,-14(1)	Load left into ac1 
 77:    TLT  3,4,3	Op < 
 78:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  output
 80:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDA  3,-4(1)	Load address of base of array k
 82:     ST  3,-16(1)	Save left side 
 83:     LD  3,-2(1)	Load variable i
 84:     LD  4,-16(1)	Load left into ac1 
 85:    SUB  3,4,3	compute location from index 
 86:     LD  3,0(3)	Load array element 
 87:     ST  3,-16(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-14(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 92:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
 93:    LDA  1,-14(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-59(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 97:     LD  3,-2(1)	load lhs variable i
 98:    LDA  3,1(3)	increment value of i
 99:     ST  3,-2(1)	Store variable i
* END COMPOUND
100:    LDA  7,-28(7)	go to beginning of loop 
 79:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
101:    LDC  2,0(6)	Set return value to 0 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
* END FUNCTION read
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
105:     ST  3,-1(1)	Store return address. 
* COMPOUND
* Compound Body
* EXPRESSION
*                       Begin call to  write
106:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to write
107:    LDA  1,-2(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-68(7)	CALL write
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to write
* EXPRESSION
*                       Begin call to  read
111:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to read
112:    LDA  1,-2(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-47(7)	CALL read
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to read
* END COMPOUND
* Add standard closing in case there is no return statement
116:    LDC  2,0(6)	Set return value to 0 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,119(7)	Jump to init [backpatch] 
* INIT
120:     LD  0,0(0)	Set the global pointer 
121:    LDA  1,0(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-20(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
