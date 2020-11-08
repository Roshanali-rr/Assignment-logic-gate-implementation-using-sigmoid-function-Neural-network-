 	AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
   
    VLDR.F32   s1, = 5; input x=5 for e power x
    VLDR.F32   s2, = 5
    VLDR.F32   s5, = 5 
    VLDR.F32   s6, = 1	
    VLDR.F32   S12, = 1          

   MOV R3,#4; N=4 FOR 5 iterations till x power 6 (x^6)
   MOV R5,#5;
   MOV R6,#0 ; r6 and s6 are used as a counter to count 100 iterations 
	
LOOP CMP R3,R6
     BGE LOOP1 ; till 5 iterations it will move to LOOP1 and after that it go to STOP
     BLE LOOP2 
	 B stop
	
LOOP1 ADD R6,R6,#1; r6 and s6 are incremented after every iteration
      VADD.F32	s6,s6,s12; 
      VMUL.F32 S5,S5,S2; 
	  VDIV.F32 s8,s5,s6;
	  VADD.F32 S1,S1,S8;
	  VDIV.F32 s5,s5,s6;
	  B LOOP;

LOOP2 VADD.F32 S1,S1,S12; add 1 to result e^x = 1+ s1
       B stop

stop B stop 
   ENDFUNC
   END
