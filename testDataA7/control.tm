* C- compiler version C-F16
* Built: Nov 13, 2016
* Author: Robert B. Heckendorn
* File compiled:  control.c-
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
* IF
 43:    LDC  3,6(6)	Load integer constant 
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,3(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 49:    LDC  3,111(6)	Load integer constant 
 50:     ST  3,-2(1)	Store variable x
* END COMPOUND
 48:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* Compound Body
* EXPRESSION
 52:    LDC  3,222(6)	Load integer constant 
 53:     ST  3,-2(1)	Store variable x
* END COMPOUND
 51:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* WHILE
 54:    LDC  3,7(6)	Load integer constant 
 55:     ST  3,-3(1)	Save left side 
 56:    LDC  3,3(6)	Load integer constant 
 57:     LD  4,-3(1)	Load left into ac1 
 58:    TGT  3,4,3	Op > 
 59:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* Compound Body
* EXPRESSION
 61:    LDC  3,333(6)	Load integer constant 
 62:     ST  3,-2(1)	Store variable x
* IF
 63:     LD  3,-2(1)	Load variable x
 64:     ST  3,-3(1)	Save left side 
 65:    LDC  3,9(6)	Load integer constant 
 66:     LD  4,-3(1)	Load left into ac1 
 67:    TLT  3,4,3	Op < 
* THEN
* BREAK
 69:    LDA  7,-10(7)	break 
 68:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 70:    LDC  3,444(6)	Load integer constant 
 71:     ST  3,-2(1)	Store variable x
* BREAK
 72:    LDA  7,-13(7)	break 
* END COMPOUND
 73:    LDA  7,-20(7)	go to beginning of loop 
 60:    LDA  7,13(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,77(7)	Jump to init [backpatch] 
* INIT
 78:     LD  0,0(0)	Set the global pointer 
 79:    LDA  1,0(0)	set first frame at end of globals 
 80:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-41(7)	Jump to main 
 83:   HALT  0,0,0	DONE! 
* END INIT
