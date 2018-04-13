* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  mixedfixed.c-
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
* WHILE
 43:    LDC  3,1(6)	Load Boolean constant 
 44:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
 46:    LDC  3,0(6)	Load Boolean constant 
* THEN
* COMPOUND
* Compound Body
* COMPOUND
* Compound Body
* COMPOUND
* Compound Body
* EXPRESSION
 48:    LDA  3,-2(0)	Load address of base of array b
 49:     ST  3,-2(1)	Save left side 
 50:    LDC  3,2(6)	Load integer constant 
 51:     ST  3,-3(1)	Save left side 
 52:     LD  3,0(0)	Load variable a
 53:     LD  4,-3(1)	Load left into ac1 
 54:    MUL  3,4,3	Op * 
 55:     LD  4,-2(1)	Load left into ac1 
 56:    SUB  3,4,3	compute location from index 
 57:     LD  3,0(3)	Load array element 
* END COMPOUND
* END COMPOUND
* END COMPOUND
 47:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ELSE
* BREAK
 59:    LDA  7,-15(7)	break 
 58:    LDA  7,1(7)	Jump around the ELSE [backpatch] 
* ENDIF
 60:    LDA  7,-18(7)	go to beginning of loop 
 45:    LDA  7,15(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
 61:    LDC  3,1(6)	Load Boolean constant 
* THEN
 62:    JZR  3,0(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    LDA  7,0(3)	Return 
* END FUNCTION main
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION thelma
 67:     ST  3,-1(1)	Store return address. 
* COMPOUND
 68:    LDC  3,666(6)	Load integer constant 
 69:     ST  3,-5(1)	Store variable zz
* Compound Body
* EXPRESSION
*                       Begin call to  thelma
 70:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 71:     LD  3,-2(1)	Load variable a
 72:     ST  3,-8(1)	Store parameter 
*                       Load param 2
 73:     LD  3,-3(1)	Load address of base of array b
 74:     ST  3,-9(1)	Store parameter 
*                       Load param 3
 75:    LDC  3,1(6)	Load Boolean constant 
 76:     ST  3,-10(1)	Store parameter 
*                       Jump to thelma
 77:    LDA  1,-6(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-13(7)	CALL thelma
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to thelma
 81:     ST  3,-6(1)	Save left side 
 82:    LDC  3,2(6)	Load integer constant 
 83:     LD  4,-6(1)	Load left into ac1 
 84:    MUL  3,4,3	Op * 
 85:     ST  3,-2(1)	Store variable a
* IF
 86:     LD  3,-2(1)	Load variable a
 87:     ST  3,-6(1)	Save left side 
 88:    LDC  3,3(6)	Load integer constant 
 89:     LD  4,-6(1)	Load left into ac1 
 90:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 92:    LDA  3,-8(0)	Load address of base of array gromit
 93:     ST  3,-6(1)	Save left side 
 94:    LDC  3,7(6)	Load integer constant 
 95:     LD  4,-6(1)	Load left into ac1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:     ST  3,-2(1)	Store variable a
* END COMPOUND
 91:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
100:     LD  3,-5(1)	Load variable zz
101:    LDA  2,0(3)	Copy result to rt register 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
 99:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION thelma
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION thelma2
109:     ST  3,-1(1)	Store return address. 
* COMPOUND
110:    LDC  3,666(6)	Load integer constant 
111:     ST  3,-5(1)	Store variable zz
* Compound Body
* RETURN
*                       Begin call to  thelma2
112:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
113:     LD  3,-2(1)	Load variable a
114:     ST  3,-8(1)	Store parameter 
*                       Load param 2
115:     LD  3,-3(1)	Load variable b
116:     ST  3,-9(1)	Store parameter 
*                       Load param 3
117:    LDC  3,1(6)	Load Boolean constant 
118:     ST  3,-10(1)	Store parameter 
*                       Jump to thelma2
119:    LDA  1,-6(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-13(7)	CALL thelma2
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to thelma2
123:     ST  3,-6(1)	Save left side 
124:    LDC  3,2(6)	Load integer constant 
125:     LD  4,-6(1)	Load left into ac1 
126:    MUL  3,4,3	Op * 
127:     ST  3,-2(1)	Store variable a
128:    LDA  2,0(3)	Copy result to rt register 
129:     LD  3,-1(1)	Load return address 
130:     LD  1,0(1)	Adjust fp 
131:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
132:    LDC  2,0(6)	Set return value to 0 
133:     LD  3,-1(1)	Load return address 
134:     LD  1,0(1)	Adjust fp 
135:    LDA  7,0(3)	Return 
* END FUNCTION thelma2
  0:    LDA  7,135(7)	Jump to init [backpatch] 
* INIT
136:     LD  0,0(0)	Set the global pointer 
137:    LDA  1,-18(0)	set first frame at end of globals 
138:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
139:    LDC  3,1(6)	Load integer constant 
140:     ST  3,0(0)	Store variable a
141:    LDC  3,4(6)	load size of array b
142:     ST  3,-1(0)	save size of array b
143:    LDC  3,3(6)	Load integer constant 
144:     ST  3,-6(0)	Store variable c
145:    LDC  3,10(6)	load size of array gromit
146:     ST  3,-7(0)	save size of array gromit
* END INIT GLOBALS AND STATICS
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-107(7)	Jump to main 
149:   HALT  0,0,0	DONE! 
* END INIT
