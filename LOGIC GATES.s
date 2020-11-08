     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	

 
    VLDR.F32   s6, = 1
    VLDR.F32   S12, = 1          
   MOV R11, #0; FOR SWITCHING BETWEEN LOGIC GATES 
   MOV R7,#0 ; INPUT X1
   MOV R8,#1 ; INPUT X2 
   MOV R9,#1; INPUT X3
   MOV R10,#1 ; BIAS 
   MOV R3,#100; N=100 FOR 10 iterations
   MOV R12,#0 ; r12 and S6 are used as a counter to count 100 iterations 
   

LOGIC_AND CMP R11, #0;
          BNE LOGIC_OR;
          MOV R2, #-3;
          MOV R4, #2;
    	  MOV R5, #2;	  
          MOV R6, #-6;
		   B COMPUTE
		  
LOGIC_OR  CMP R11, #1;
          BNE LOGIC_NOT;
          MOV R2, #2;
          MOV R4, #2;
    	  MOV R5, #2;	  
          MOV R6, #-1;
		  B COMPUTE

LOGIC_NOT CMP R11, #2;
          BNE LOGIC_NAND;
          MOV R2, #-3;
          MOV R4, #2;
    	  MOV R5, #2;	  
          MOV R6, #-6;
		   B COMPUTE
		  
LOGIC_NAND CMP R11, #3;
          BNE LOGIC_NOR; 
          MOV R2, #-2;
          MOV R4, #-2;
    	  MOV R5, #-2;	  
          MOV R6, #5;
		   B COMPUTE

LOGIC_NOR CMP R11, #4;
          BNE LOGIC_XOR;
          MOV R2, #-2;
          MOV R4, #-2;
    	  MOV R5, #-2;	  
          MOV R6, #1;
		   B COMPUTE
		  
LOGIC_XOR CMP R11, #6;
          BNE LOGIC_XNOR;
          MOV R2, #-5;
          MOV R4, #2;
    	  MOV R5, #1;	  
          MOV R6, #1;
		   B COMPUTE	

LOGIC_XNOR MOV R2, #-5;
          MOV R4, #2;
    	  MOV R5, #1;	  
          MOV R6, #1;
		  B COMPUTE

COMPUTE   MUL R2,R2,R7;
		  MUL R4,R4,R8;
		  MUL R5,R5,R9;
		  MUL R6,R6,R10;
		  ADD R2,R2,R4;
		  ADD R5,R5,R6;
		  ADD R1,R2,R5;
		  VMOV.F32 D0[1],R1;
		  VMOV.F32 D1[0],R1;
		  VMOV.F32 D2[1],R1;
          B LOOP
	
LOOP CMP R3,R12
     BGE LOOP1 ; till 100 iterations it will move to LOOP1 and after that it go to STOP
     BLE LOOP2
	 B stop
	
LOOP1 ADD R12,R12,#1; r12 and s6 are incremented after every iteration
      VADD.F32	s6,s6,s12;
      VMUL.F32 S5,S5,S2;
      VDIV.F32 s8,s5,s6;
	  VADD.F32 S1,S1,S8;
	  VDIV.F32 s5,s5,s6;
	  B LOOP;

LOOP2 VADD.F32 S1,S1,S12;
      VADD.F32 S2,S1,S12;
	  VDIV.F32 s1,s1,s2;
	  VCVTR.U32.F32 S1,S1;
	  VMOV.F32 R0,D0[1]
	  BL printMsg
       B stop
      

stop B stop 
   ENDFUNC
   END
	   
	
