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
* FUNCTION dog
42:     ST  3,-1(1)	Store return address.
* COMPOUND
* Compound Body
43:     ST  3,0(1)	Store variable (null)
 44:    ADD  3,4,3	Op +
 45:    MUL  3,4,3	Op *
46:    LDC  3,111(6)	Load int constant
47:    LDC  3,222(6)	Load int constant
48:     ST  3,-2(1)	Store variable x
* END COMPOUND
* END FUNCTION dog
* FUNCTION main
49:     ST  3,-1(1)	Store return address.
* COMPOUND
* Compound Body
*			 Begin call to output
50:     ST  1,-2(1)	Store old fp in ghost frame
*			 Begin call to dog
51:     ST  1,-4(1)	Store old fp in ghost frame
52:    LDC  3,666(6)	Load int constant
53:     ST  3,-6(1)	Store Parameter
*			 Jump to dog
54:    LDA 1, -4(1)	Load address of new frame
55:    LDA 3, 1(7)	Return address in ac
56:    LDA 3, -15(7)	CALL dog
57:    LDA 3, 0(2)	save result in ac
*			 Begin call to outnl
58:     ST  1,-4(1)	Store old fp in ghost frame
*			 Jump to outnl
59:    LDA 1, -4(1)	Load address of new frame
60:    LDA 3, 1(7)	Return address in ac
61:    LDA 3, -25(7)	CALL outnl
62:    LDA 3, 0(2)	save result in ac
* END COMPOUND
* END FUNCTION main
0:    LDA  7,62(7)	Jump to init [backpatch]
* INIT
63:     LD  0,0(0)	Set the global pointer
64:    LDA  1,0(0)	set first frame at end of globals
65:     ST  1,0(1)	store old fp (point to self)
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
66:    LDA  3,1(7)	Return address in ac
67:    LDA  7,-19(7)	Jump to main
68:   HALT  0,0,0	DONE!
* END INIT
