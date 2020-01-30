/* 
SSHORT_DEFINITION

	\brief
 		This machine define the type short
 	
Author: Valério Jr., Stephenson Galvão, David Déharbe
Creation date: Thu Feb 12 2009
 */
MACHINE
    SSHORT_DEFINITION
    
SEES
	BIT_DEFINITION,
	MAX_BIT_VECTOR_DEFINITION,
	BYTE_DEFINITION,
 BV16_DEFINITION,
 SCHAR_DEFINITION,
 USHORT_DEFINITION,
 POWER2
    
DEFINITIONS
    
    SET_PREF_SYMBOLIC == TRUE;
    
    pow2_0 == 1;
    pow2_1 == 2;
    pow2_2 == 4;
    pow2_3 == 8;
    pow2_4 == 16;
    pow2_5 == 32;
    pow2_6 == 64;
    pow2_7 == 128;
    pow2_8 == 256;
    pow2_9 == 512;
    pow2_10 == 1024;    
    pow2_11 == 2048;  
    pow2_12 == 4096;   
    pow2_13 == 8192;
    pow2_14 == 16384;   
    pow2_15 == 32768; 
    pow2_16 == 65536          
        
CONSTANTS
    
   SSHORT_MIN,
   SSHORT_MAX,
    
   SSHORT ,
      
   bv16_sshort ,   
   sshort_bv16 ,   

   schar_sshort ,
 /*  sshort_schar,*/
   
   ushort_sshort,
   sshort_ushort
   
PROPERTIES
    
   SSHORT_MIN=-(pow2_15)&
   SSHORT_MAX=(pow2_15-1) &
    
   SSHORT= SSHORT_MIN..SSHORT_MAX &
   /*bv16_sshort : BV16 --> SSHORT &*/
   bv16_sshort = % ( v0 ) . ( v0 : BV16 | - pow2_15 * v0 ( 16 ) + pow2_14 * v0 ( 15 ) + pow2_13 * v0 ( 14 ) + pow2_12 * 
        					v0 ( 13 ) + pow2_11 * v0 ( 12 ) + pow2_10 * v0 ( 11 ) + pow2_9 * v0 ( 10 ) + pow2_8 * v0 ( 9 ) + pow2_7 * 
        					v0 ( 8 ) + pow2_6 * v0 ( 7 ) + pow2_5 * v0 ( 6 ) + pow2_4 * v0 ( 5 ) + pow2_3 * v0 ( 4 ) + pow2_2 * v0 ( 3 ) + 2 * v0 ( 2 ) + v0 ( 1 ) )  &
        	
        	
  /* sshort_bv16 : SSHORT +-> BV16 &  ProB simplification */
   sshort_bv16 = % ( v0 ) . ( v0 : SSHORT &  v0>=0|
        [((v0) mod pow2_1)/pow2_0,
	        ((v0) mod pow2_2)/pow2_1,
	        ((v0) mod pow2_3)/pow2_2,
         ((v0) mod pow2_4)/pow2_3,
         ((v0) mod pow2_5)/pow2_4,
         ((v0) mod pow2_6)/pow2_5,
         ((v0) mod pow2_7)/pow2_6, 
         ((v0) mod pow2_8)/pow2_7,
         ((v0) mod pow2_9)/pow2_8,
         ((v0) mod pow2_10)/pow2_9,
         ((v0) mod pow2_11)/pow2_10,
         ((v0) mod pow2_12)/pow2_11,
         ((v0) mod pow2_13)/pow2_12,
         ((v0) mod pow2_14)/pow2_13,
 	       ((v0) mod pow2_15)/pow2_14,
 	       ((v0) mod pow2_16)/pow2_15	]
 					)\/
  		 %( v0 ).( v0 : SSHORT & not(v0>=0) |
        [((v0+USHORT_MAX + 1) mod pow2_1)/pow2_0,
	        ((v0+USHORT_MAX + 1) mod pow2_2)/pow2_1,
	        ((v0+USHORT_MAX + 1) mod pow2_3)/pow2_2,
         ((v0+USHORT_MAX + 1) mod pow2_4)/pow2_3,
         ((v0+USHORT_MAX + 1) mod pow2_5)/pow2_4,
         ((v0+USHORT_MAX + 1) mod pow2_6)/pow2_5,
         ((v0+USHORT_MAX + 1) mod pow2_7)/pow2_6, 
         ((v0+USHORT_MAX + 1) mod pow2_8)/pow2_7,
         ((v0+USHORT_MAX + 1) mod pow2_9)/pow2_8,
         ((v0+USHORT_MAX + 1) mod pow2_10)/pow2_9,
         ((v0+USHORT_MAX + 1) mod pow2_11)/pow2_10,
         ((v0+USHORT_MAX + 1) mod pow2_12)/pow2_11,
         ((v0+USHORT_MAX + 1) mod pow2_13)/pow2_12,
         ((v0+USHORT_MAX + 1) mod pow2_14)/pow2_13,
 	       ((v0+USHORT_MAX + 1) mod pow2_15)/pow2_14,
 	       ((v0+USHORT_MAX + 1) mod pow2_16)/pow2_15	]
 					)
 
							&		
							
			    

    ushort_sshort=%(v1).(v1:USHORT & v1<=SSHORT_MAX| v1) \/
                  %(v1).(v1:USHORT & not(v1<=SSHORT_MAX) | v1-USHORT_MAX + 1 )  &
    

    sshort_ushort=%(v1).(v1:SSHORT & v1>=0 | v1) \/
                  %(v1).(v1:SSHORT & not(v1>=0) | v1+USHORT_MAX + 1 )  				&
							

   schar_sshort = % ( w1 , w2 ) . ( w1 : SCHAR & w2 : SCHAR | (bv16_sshort( byte_bv16 ( schar_byte ( w1 ) , schar_byte ( w2 ) ) )) ) 
   
   
   
  /* sshort_schar  = % ( v0 ) . ( v0 : SSHORT &  v0>=0|
        byte_schar([((v0) mod pow2_1)/pow2_0,
	        ((v0) mod pow2_2)/pow2_1,
	        ((v0) mod pow2_3)/pow2_2,
                ((v0) mod pow2_4)/pow2_3,
                ((v0) mod pow2_5)/pow2_4,
                ((v0) mod pow2_6)/pow2_5,
                ((v0) mod pow2_7)/pow2_6, 
                ((v0) mod pow2_8)/pow2_7]) ,
         byte_schar([((v0) mod pow2_9)/pow2_8,
                ((v0) mod pow2_10)/pow2_9,
                ((v0) mod pow2_11)/pow2_10,
                ((v0) mod pow2_12)/pow2_11,
                ((v0) mod pow2_13)/pow2_12,
                ((v0) mod pow2_14)/pow2_13,
                ((v0) mod pow2_15)/pow2_14,
                ((v0) mod pow2_16)/pow2_15	])
 					)\/
  		 %( v0 ).( v0 : SSHORT & not(v0>=0) |
  		     (byte_schar([((v0+USHORT_MAX + 1) mod pow2_1)/pow2_0,
	        ((v0+USHORT_MAX + 1) mod pow2_2)/pow2_1,
	        ((v0+USHORT_MAX + 1) mod pow2_3)/pow2_2,
         ((v0+USHORT_MAX + 1) mod pow2_4)/pow2_3,
         ((v0+USHORT_MAX + 1) mod pow2_5)/pow2_4,
         ((v0+USHORT_MAX + 1) mod pow2_6)/pow2_5,
         ((v0+USHORT_MAX + 1) mod pow2_7)/pow2_6, 
         ((v0+USHORT_MAX + 1) mod pow2_8)/pow2_7])),
         (byte_schar([((v0+USHORT_MAX + 1) mod pow2_9)/pow2_8,
         ((v0+USHORT_MAX + 1) mod pow2_10)/pow2_9,
         ((v0+USHORT_MAX + 1) mod pow2_11)/pow2_10,
         ((v0+USHORT_MAX + 1) mod pow2_12)/pow2_11,
         ((v0+USHORT_MAX + 1) mod pow2_13)/pow2_12,
         ((v0+USHORT_MAX + 1) mod pow2_14)/pow2_13,
 	       ((v0+USHORT_MAX + 1) mod pow2_15)/pow2_14,
 	       ((v0+USHORT_MAX + 1) mod pow2_16)/pow2_15	]))
 								
									)
*/  		     
  		   
      	
   
ASSERTIONS
 	
   card(bv16_sshort)=pow2_16 &
   card(sshort_bv16)=pow2_16 &   
   card(schar_sshort)=pow2_16 &   

   card(ushort_sshort)=pow2_16 &
   card(sshort_ushort)=pow2_16 &


   SSHORT_MIN : SSHORT &
   SSHORT_MAX : SSHORT &

   	
   	/* added to enable animation in ProB 
    sshort_schar = schar_sshort ~ &*/
    sshort_bv16 = bv16_sshort ~ &
    schar_sshort : SCHAR * SCHAR --> SSHORT &    
    
    dom(bv16_sshort) = BV16 &
    ran(bv16_sshort) = SSHORT &

    dom(sshort_bv16) = SSHORT &
    ran(sshort_bv16) = BV16 &
    
    dom(schar_sshort) = (SCHAR * SCHAR) &
    ran(schar_sshort) = SSHORT &
    
    /*dom(sshort_schar) = SSHORT &
    ran(sshort_schar) = (SCHAR * SCHAR) &*/
    
    
   	
    pow2_0 = 2**0 &
    pow2_1 = 2**1 &
    pow2_2 = 2**2 &
    pow2_3 = 2**3 &
    pow2_4 = 2**4 &
    pow2_5 = 2**5 &
    pow2_6 = 2**6 &
    pow2_7 = 2**7 &
    pow2_8 = 2**8 &
    pow2_9 = 2**9 &    
    pow2_10 = 2**10 &
    pow2_11 = 2**11 &
    pow2_12 = 2**12 &
    pow2_13 = 2**13 &
    pow2_14 = 2**14 &
    pow2_15 = 2**15 &
    pow2_16 = 2**16 
   	
END
