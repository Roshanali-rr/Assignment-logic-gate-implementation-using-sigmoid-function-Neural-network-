 	AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
    
	 VLDR.F32   s1, = 5 
    VLDR.F32   s2, = 5
    VLDR.F32   s5, = 5 
    VLDR.F32   s6, = 1	
    VLDR.F32   S4, = -1
    VLDR.F32   S11, = -1
    VLDR.F32   S12, = 1          

   MOV R3,#100; N=100 FOR 100 iterations
   MOV R5,#5;
   MOV R6,#0 ; r6 and s6 are used as a counter to count 100 iterations 
	
LOOP CMP R3,R6
     BGE LOOP1 ; till 100 iterations it will move to LOOP1 and after that it go to STOP
     B stop
	
LOOP1 ADD R6,R6,#1; r6 and s6 are incremented after every iteration
      VADD.F32	s6,s6,s12;
      VMUL.F32 S5,S5,S2;
	  VDIV.F32 s8,s5,s6;
	  VMUL.F32 S9,S8,S4;
	  VMUL.F32 S4,s4,s11;
	  VMOV.F32 S7, S1;
	  VADD.F32 s1,s7,s9; s1 is the ln(1+x) value with x=5
	  
	  B LOOP;
	  
stop B stop 
   ENDFUNC
   END