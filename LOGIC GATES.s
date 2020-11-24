     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	
   VLDR.F32   s1, = 90 ;x1
    VLDR.F32   s2, = 5 ; t
    VLDR.F32   s3, = 5 ;x
    VLDR.F32   s6, = 2	;i
    VLDR.F32   S4, = -1
	VLDR.F32   s7, = 1 ; t FOR COS
    VLDR.F32   s8, = 1 ; X FOR COS
	VLDR.F32   S11, = -1;N
    VLDR.F32   S12, = 2 ; 	
 VADD.F32	s8,s8,s4; X=0 
 VLDR.F32   s13, = 3.14 ;
 VLDR.F32   s14, = 180 ;
 VDIV.F32 s15,s13,s14; 

	  
   MOV R1,#0 ;THETA
   MOV R4,#360;
   MOV R3,#100; N=100 FOR 100 iterations
   MOV R5,#5;
   MOV R6,#0 ; r6 and s6 are used as a counter to count 100 iterations 

CIRCLE CMP R4,R1;
       BLE C1;
	   B stop
	   
C1  VMOV.F32 S1,R1;
	VMOV.F32 S2,R1;
	VMOV.F32 S3,R1;
	VMOV.F32 S7,R1;
	VMUL.F32 s1,s1,s15;
    VMUL.F32 s3,s3,s15; 
    VMUL.F32 s7,s7,s15; 
     ADD R1,R1,#1;
	B LOOPC  
   
LOOPC CMP R3,R6
     BGE LOOPC1 ; till 100 iterations it will move to LOOP1 and after that it go to STOP
	 BLE LOOPC2
	 B stop

LOOPC1 ADD R6,R6,#1; r6 and s6 are incremented after every iteration
	  VADD.F32	s5,s6,s4;
	  VMUL.F32 s7,s7,s1; t=t*x1
	  VDIV.F32 s7,s7,s5; t/(i-1)
	  VMUL.F32 s9,s7,s1; T*X1
	  VDIV.F32 s9,s9,s6; T/I
	  VMUL.F32 S9,s9,s11; T*N
	  VADD.F32	s8,s9,s8; X=X+T*N
	  VMUL.F32 S11,s11,s4;N=-n
	  VMUL.F32 S7,s7,s1;t*x1
	  VDIV.F32 s7,s7,s6; 
	  VADD.F32	s6,s6,s12; i+2
	  B LOOPC;   

LOOPC2   VMUL.F32 S4,s4,s4;t*x1
         VADD.F32 s8,s8,S4; X=1+X+T*N  
		 VMUL.F32 S19,s18,s8;R*COS
		 B LOOP;

LOOP CMP R3,R6
     BGE LOOP1 ; till 100 iterations it will move to LOOP1 and after that it go to STOP
	 BLE LOOP2
	 B stop

LOOP1 ADD R6,R6,#1; r6 and s6 are incremented after every iteration
      VADD.F32	s6,s6,s12; i+2
	  VADD.F32	s5,s6,s4;
	  VMUL.F32 s2,s2,s1; t=t*x1
	  VDIV.F32 s2,s2,s5; t/(i-1)
	  VMUL.F32 s9,s2,s1; T*X1
	  VDIV.F32 s9,s9,s6; T/I
	  VMUL.F32 S9,s9,s11; T*N
	  VADD.F32	s3,s9,s3; X=X+T*N
	  VMUL.F32 S11,s11,s4;N=-n
	  VMUL.F32 S2,s2,s1;t*x1
	  VDIV.F32 s2,s2,s6; 
	  B LOOP;
	  
LOOP2 VMUL.F32 S20,s3,s18;R*SIN
      VMOV.F32 S20,R0; Y
      VMOV.F32 R0,D0[0]
	  VMOV.F32 S19,R1; X
	  VMOV.F32 R0,D0[1]
	  BL printMsg2p
      B LOOP
stop B stop 
   ENDFUNC
   END
	   
	
