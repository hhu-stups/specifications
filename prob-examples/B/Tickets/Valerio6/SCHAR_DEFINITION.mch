/* SCHAR_DEFINITION
* Author: atelierb
* Creation date: Thu Feb 12 2009
*/
MACHINE
    SCHAR_DEFINITION
    
SEES
    BIT_DEFINITION,
    MAX_BIT_VECTOR_DEFINITION,
    BYTE_DEFINITION,
    UCHAR_DEFINITION,
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
    pow2_8 == 256
    
CONSTANTS
    
    SCHAR_MAX ,
    SCHAR_MIN ,
    
    SCHAR ,
    
    byte_schar,
    schar_byte,
    
    uchar_schar,
    schar_uchar
    
PROPERTIES
    
    
    SCHAR_MAX = (pow2_7-1) &
    SCHAR_MIN = (-pow2_7 ) &
    
    SCHAR = SCHAR_MIN..SCHAR_MAX &
    
    /*byte_schar : BYTE --> SCHAR &*/
    byte_schar = % ( v0 ) . ( v0 : BYTE | (- pow2_7) *  v0(8) + pow2_6 * v0(7) + pow2_5 * v0(6) + pow2_4 *v0(5) + pow2_3 * v0(4) + pow2_2 * v0(3) + 2 * v0(2) + v0(1) ) &
    
   /* schar_byte : SCHAR +-> BYTE &  ProB simplification*/
    schar_byte = % ( v0 ) . ( v0 : SCHAR  & v0>=0 |  
								[( v0  mod pow2_1)/pow2_0,
	        ( v0  mod pow2_2)/pow2_1,
	        ( v0  mod pow2_3)/pow2_2,
         ( v0  mod pow2_4)/pow2_3,
         ( v0  mod pow2_5)/pow2_4,
         ( v0  mod pow2_6)/pow2_5,
         ( v0  mod pow2_7)/pow2_6, 
         ( v0 mod pow2_8)/pow2_7]  )\/
 							% ( v0 ).( v0 : SCHAR  & not(v0>=0) |  
								[((v0+UCHAR_MAX + 1) mod pow2_1)/pow2_0,
	        ((v0+UCHAR_MAX + 1) mod pow2_2)/pow2_1,
	        ((v0+UCHAR_MAX + 1) mod pow2_3)/pow2_2,
         ((v0+UCHAR_MAX + 1) mod pow2_4)/pow2_3,
         ((v0+UCHAR_MAX + 1) mod pow2_5)/pow2_4,
         ((v0+UCHAR_MAX + 1) mod pow2_6)/pow2_5,
         ((v0+UCHAR_MAX + 1) mod pow2_7)/pow2_6, 
         ((v0+UCHAR_MAX + 1) mod pow2_8)/pow2_7]  )
 &
    /* schar_byte : SCHAR --> BYTE &
    schar_byte = byte_schar ~ &  */ 
   
    
  /*  uchar_schar : UCHAR --> SCHAR &*/
    uchar_schar=%(v1).(v1:UCHAR & v1<=SCHAR_MAX| v1) \/
                %(v1).(v1:UCHAR & not(v1<=SCHAR_MAX) | v1-UCHAR_MAX + 1 )  &
    
  /*  schar_uchar : SCHAR --> UCHAR &*/
    schar_uchar=%(v1).(v1:SCHAR & v1>=0 | v1) \/
                %(v1).(v1:SCHAR & not(v1>=0) | v1+UCHAR_MAX + 1 )  

   

/*    */
    
ASSERTIONS   
    
    card(uchar_schar) = 256 &
    card(schar_uchar) = 256 &


    SCHAR_MAX : INTEGER &
    SCHAR_MIN : INTEGER &
    
    dom(byte_schar) = BYTE &
    ran(byte_schar) = SCHAR &
    
    dom(schar_byte) = SCHAR &
    ran(schar_byte) = BYTE &
    
    schar_uchar=uchar_schar~	 &
    schar_byte = byte_schar ~    &
    
   /* dom(uchar_schar) = UCHAR &
    ran(uchar_schar) = SCHAR &
    dom(schar_uchar) = SCHAR &
    ran(schar_uchar) = UCHAR &*/
    
    pow2_0 = 2**0 &
    pow2_1 = 2**1 &
    pow2_2 = 2**2 &
    pow2_3 = 2**3 &
    pow2_4 = 2**4 &
    pow2_5 = 2**5 &
    pow2_6 = 2**6 &
    pow2_7 = 2**7 &
    pow2_8 = 2**8
    
    
END
