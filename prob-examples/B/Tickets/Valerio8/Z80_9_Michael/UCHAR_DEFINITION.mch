/* UCHAR_DEFINITION
 * Author: atelierb
 * Creation date: Thu Feb 12 2009
 */
MACHINE
    UCHAR_DEFINITION
    
SEES
    
    
    BIT_DEFINITION,
    BYTE_DEFINITION,
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
    
   UCHAR_MAX,
   UCHAR_MIN,      
    
    
   UCHAR ,
   uchar_byte,
   byte_uchar 
   
PROPERTIES
    
   UCHAR_MAX = pow2_8 - 1 &
   UCHAR_MIN = 0  &
     
   UCHAR = ( UCHAR_MIN .. UCHAR_MAX) &

   byte_uchar : BYTE  >->>  UCHAR &
   byte_uchar =  % ( v0 ) . ( v0 : BYTE |  pow2_7*v0(8)+pow2_6 *v0(7)+ pow2_5*v0(6)+pow2_4*v0(5) +
   pow2_3 * v0(4 ) + pow2_2 *v0(3) + pow2_1 * v0(2) + pow2_0 * v0(1) )&

	uchar_byte :  UCHAR >->>  BYTE 	&	
	uchar_byte = % ( v0 ) . ( v0 : UCHAR  | 
         [(v0 mod pow2_1)/pow2_0,
         (v0 mod pow2_2)/pow2_1,
         (v0 mod pow2_3)/pow2_2,
         (v0 mod pow2_4)/pow2_3,
         (v0 mod pow2_5)/pow2_4,
         (v0 mod pow2_6)/pow2_5,
         (v0 mod pow2_7)/pow2_6, 
         (v0 mod pow2_8)/pow2_7]  )
 
      /*  [(((((((v0 mod pow2_7) mod pow2_6) mod pow2_5)mod pow2_4)mod pow2_3) mod pow2_2)mod pow2_1)/pow2_0 ,
        ((((((v0 mod pow2_7) mod pow2_6) mod pow2_5)mod pow2_4)mod pow2_3) mod pow2_2)/ pow2_1  , 
        (((((v0 mod pow2_7) mod pow2_6) mod pow2_5)mod pow2_4)mod pow2_3) / pow2_2 ,
        ((((v0 mod pow2_7) mod pow2_6) mod pow2_5)mod pow2_4)/pow2_3 , 
        (((v0 mod pow2_7) mod pow2_6) mod pow2_5)/ pow2_4 ,
        ((v0 mod pow2_7) mod pow2_6)/ pow2_5 ,
        (v0 mod pow2_7)/pow2_6 ,
        v0/pow2_7 ])*/

  

ASSERTIONS

    card(byte_uchar) = 256 &
    card(uchar_byte) = 256 &

    uchar_byte = byte_uchar ~ & /* ProB */ 

    UCHAR_MAX : INTEGER &
    UCHAR_MIN : INTEGER &
    
    dom(byte_uchar) = BYTE &
    ran(byte_uchar) = UCHAR &

    dom(uchar_byte) = UCHAR &
    ran(uchar_byte) = BYTE &

        
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

