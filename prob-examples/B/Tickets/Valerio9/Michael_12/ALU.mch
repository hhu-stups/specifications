MACHINE
    ALU
    
SEES
    TYPES,
    BIT_DEFINITION ,
    BYTE_DEFINITION,
    BV16_DEFINITION,
    
    UCHAR_DEFINITION,
    SCHAR_DEFINITION,
    SSHORT_DEFINITION,
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
    
    
CONCRETE_CONSTANTS

    
    is_zero16USHORT,
    is_negative,
    
    half8UCHAR,
    inc,dec,
    simple_add8UCHAR,
    add8UCHAR , substract8UCHAR,
    
    add16USHORT,
    add_carryUSHORT,
    add_halfcarryUSHORT,
    sub16USHORT,
    sub_carryUSHORT,
    sub_halfcarryUSHORT,
    
    
    inc_BV16,
    dec_BV16,
    
    update_refresh_reg,
    
    instruction_next ,
    instruction_jump /*,
    
    daa_function*/
    
PROPERTIES
    
/*    abs :  INTEGER  --> INTEGER &
    abs = % (nn).(nn : INTEGER  & (0 <= nn)  | nn  ) \/ 
    % (nn).(nn : INTEGER  & 0 > nn| -nn  ) & */
    
/*    is_zero16USHORT : USHORT --> BIT &*/
    is_zero16USHORT = %(nat1).(nat1 : USHORT | bool_bit(bool(nat1 = 0  ) ) ) &
    
/*    is_negative : BYTE --> BIT &*/
    is_negative = %(w1).(w1 : BYTE |  w1(7)  )&
    
    
/*    half8UCHAR : UCHAR --> UCHAR &*/
    half8UCHAR = % (ww).(ww : UCHAR | ww mod pow2_4) &	
    
/*    inc :  BYTE  --> BYTE &*/
    inc = % (w1). (w1 : BYTE | uchar_byte(((byte_uchar(w1) + 1)  mod pow2_8 ) ) ) &
    
/*    dec :  BYTE  --> BYTE &*/
    dec = % (w1). (w1 : BYTE | uchar_byte( (byte_uchar(w1) + 255 ) mod pow2_8 ) ) &
    
/*    simple_add8UCHAR  : (UCHAR * UCHAR) --> UCHAR &*/
    simple_add8UCHAR = % (w1,w2) . (w1 : UCHAR & w2 : UCHAR | (w1 + w2) mod pow2_8) &	
    
    
    /* add (w1, w2) = (sum, is_negative, carry, half_carry, zero) */
   /* add8UCHAR : (BIT * UCHAR * UCHAR) --> (UCHAR * BIT * BIT * BIT * BIT) &*/
    add8UCHAR = % (carry,w1, w2). ( carry : BIT & w1 : UCHAR & w2 : UCHAR    |
        (( ( carry + w1 + w2 ) mod pow2_8)   ,  
            bool_bit(bool( carry + uchar_schar(w1) + uchar_schar (w2) < 0))	,
            bool_bit(bool( carry + w1 + w2 > UCHAR_MAX)),
            bool_bit(bool( carry + half8UCHAR(w1) + half8UCHAR( w2) >= pow2_4)),
            bool_bit(bool( ( (carry + w1 + w2 ) mod pow2_8) = 0))  ))  &
    
    
    /* substract8UCHAR (w1, w2) = (result, is_negative, carry, half_carry, zero) */
    /*substract8UCHAR : (BIT * UCHAR * UCHAR) --> (UCHAR * BIT * BIT * BIT * BIT) &*/
    substract8UCHAR = % (carry,w1, w2). ( carry : BIT & w1 : UCHAR & w2 : UCHAR   |
         ( ( carry + w1 +   byte_uchar(complement( uchar_byte(w2) ) )+1 mod pow2_8)   ,  
            bool_bit(bool( carry + uchar_schar(w1) - uchar_schar (w2) < 0))	,
            bool_bit(bool( carry + w1 + w2 > UCHAR_MAX)),
            bool_bit(bool( carry + half8UCHAR(w1) + half8UCHAR( byte_uchar(complement( uchar_byte(w2) ) )+1) >= pow2_4)),
            bool_bit(bool( ( (carry + w1 +   byte_uchar(complement( uchar_byte(w2) ) )+1 mod pow2_8) = 0)) )))   &
    
    
/*    add16USHORT : ( BIT * USHORT * USHORT ) --> (USHORT ) &*/
    add16USHORT = % (b1, w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  |(b1+w1+w2) mod  pow2_16  ) &
    
/*    add_carryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
    add_carryUSHORT = % (b1,w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  |
        bool_bit(bool((b1+w1+w2) > pow2_16 ) )  ) &
    
/*    add_halfcarryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
    add_halfcarryUSHORT = % (b1,w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  | 
        bool_bit(bool(( b1 + (w1) mod pow2_12 + (w2) mod pow2_12 ) >  pow2_12 ))  ) &
    
/*    sub16USHORT : ( BIT * USHORT * USHORT ) --> (USHORT ) &*/
	sub16USHORT = % (b1, w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  |
     ((b1+w1+bv16_ushort( complement16(ushort_bv16(w2))))  mod  pow2_16  )) &
    /* ( carry + w1 +   byte_uchar(bv_not( uchar_byte(w2) ) )+1 mod pow2_8) */
/*    sub_carryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
    sub_carryUSHORT = % (b1,w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  |
        bool_bit(bool((w1-w2-b1) > pow2_16 ) )  ) &
    
/*    sub_halfcarryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
    sub_halfcarryUSHORT = % (b1,w1, w2). (b1 : BIT & w1 : USHORT & w2 : USHORT  | 
        bool_bit(bool((  (w1) mod pow2_12 - (w2) mod pow2_12 ) -b1 >  pow2_12 ))  ) &
    
    
/*    inc_BV16 :  BV16  --> BV16 &*/
    inc_BV16 = % (w1). (w1 : BV16 | ushort_bv16 ((bv16_ushort(w1)+1 ) mod pow2_16)  ) &
    
/*    dec_BV16 :  BV16  --> BV16 &*/
    dec_BV16 = % (w1). (w1 : BV16 | ushort_bv16 ( (bv16_ushort(w1)+pow2_16-1)  mod pow2_16 )  ) &
    
    
/*    update_refresh_reg   : BYTE --> BYTE &*/
    update_refresh_reg =  % ( v0 ) .  ( v0 : BYTE | uchar_byte (pow2_7*v0 ( 8 ) + ((  pow2_6 * v0 ( 7 ) + pow2_5 * v0 ( 6 ) + pow2_4 * v0 ( 5 ) +  pow2_3 * v0 ( 4 ) +   pow2_2 * v0 ( 3 ) + pow2_1 * v0 ( 2 ) + v0 ( 1 ) ) mod pow2_7 ) ) ) &   
    
    
/*    instruction_next : USHORT --> USHORT &*/
    instruction_next =  % (w1). (w1 : USHORT  |(w1+1) mod  pow2_16  ) &
    
/*    instruction_jump :  (USHORT * ((-126)..129) ) --> USHORT &*/ 
    instruction_jump = % ( p0 , e0 ) . ( p0 : USHORT & e0 : ((-126)..129) | (p0 + e0 + pow2_16) mod  pow2_16 ) /* &
    
    
     changed to partial function ( to run in ProB), but it is not a partial function 
    daa_function : ( BIT * BIT * BIT * BYTE) +-> ( BYTE * BIT * BIT ) &
    !(zn, c0 , h0 , value ) .(zn : BIT & c0 : BIT & h0 : BIT & value : BYTE =>
        (  (  zn = 0 & c0 = 0 & get_upper_digit(value) : 0..9 & h0 = 0 & get_lower_digit(value) : 0..9 =>
                daa_function(zn, c0 , h0  , value )=( value , 0 ,0  ) ) &
            (  zn = 0 & c0 = 0 & get_upper_digit(value) : 0..8 & h0 = 0 & get_lower_digit(value) : 10..15 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 6 )) , 0 ,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(6) >= pow2_4)) ) ) &
            (  zn = 0 & c0 = 0 & get_upper_digit(value) : 0..9 & h0 = 1 & get_lower_digit(value) : 0..3 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 6 )) , 0 ,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(6) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 0 & get_upper_digit(value) : 10..15 & h0 = 0 & get_lower_digit(value) : 0..9 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 96 )) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(96) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 0 & get_upper_digit(value) : 9..15 & h0 = 0 & get_lower_digit(value) : 10..15 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 102 )) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(102) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 0 & get_upper_digit(value) : 10..15 & h0 = 1 & get_lower_digit(value) : 0..3 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 102 )) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(102) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 1 & get_upper_digit(value) : 0..2 & h0 = 0 & get_lower_digit(value) : 0..9 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 96 )) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(96) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 1 & get_upper_digit(value) : 0..2 & h0 = 0 & get_lower_digit(value) : 10..15 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 102)) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(102) >= pow2_4)) ) )&
            (  zn = 0 & c0 = 1 & get_upper_digit(value) : 0..3 & h0 = 1 & get_lower_digit(value) : 0..3 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 102)) , 1,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(102) >= pow2_4)) ) )&
            
            (  zn = 1 & c0 = 0 & get_upper_digit(value) : 0..9 & h0 = 0 & get_lower_digit(value) : 0..9 =>
                daa_function(zn, c0 , h0  , value )= (  value , 0 , 0 ) ) &
            (  zn = 1 & c0 = 0 & get_upper_digit(value) : 0..8 & h0 = 1 & get_lower_digit(value) : 6..15 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 250)) , 0,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(250) >= pow2_4)) ) )&
            (  zn = 1 & c0 = 1 & get_upper_digit(value) : 7..15 & h0 = 0 & get_lower_digit(value) : 0..9 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 160)) , 1 ,  bool_bit(bool(   half8UCHAR(byte_uchar(value)) + half8UCHAR(160) >= pow2_4)) ) )&
            (  zn = 1 & c0 = 1 & get_upper_digit(value) : 6..7 & h0 = 1 & get_lower_digit(value) : 6..15 =>
                daa_function(zn, c0 , h0  , value )= ( uchar_byte(simple_add8UCHAR( byte_uchar( value) , 154)) , 1,  bool_bit(bool(  half8UCHAR(byte_uchar(value)) + half8UCHAR(154) >= pow2_4)) ) )  ) ) 
    
    */
    
    
    
    
ASSERTIONS
    
    /* Informations moved from properties */ 
    
/*    abs :  INTEGER  --> INTEGER &*/
    is_zero16USHORT : USHORT --> BIT &
    is_negative : BYTE --> BIT &
    half8UCHAR : UCHAR --> UCHAR &
    inc :  BYTE  --> BYTE &
    dec :  BYTE  --> BYTE &
    simple_add8UCHAR  : (UCHAR * UCHAR) --> UCHAR &
	add16USHORT : ( BIT * USHORT * USHORT ) --> (USHORT ) &
    substract8UCHAR : (BIT * UCHAR * UCHAR) --> (UCHAR * BIT * BIT * BIT * BIT) &
    add_carryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &
	/*add_halfcarryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
	sub16USHORT : ( BIT * USHORT * USHORT ) --> (USHORT ) &
	sub_carryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &
	/*sub_halfcarryUSHORT : ( BIT * USHORT * USHORT ) --> BIT &*/
	inc_BV16 :  BV16  --> BV16 &
	dec_BV16 :  BV16  --> BV16 &
	update_refresh_reg   : BYTE --> BYTE &
	instruction_next : USHORT --> USHORT &
	instruction_jump :  (USHORT * ((-126)..129) ) --> USHORT &

    /* Assertions -  Types of Functions */ 
    
    dom(is_zero16USHORT)= USHORT &
    ran(is_zero16USHORT)= BIT  &
    
    dom(is_negative)= BYTE &
    ran(is_negative)= BIT  &
    
    dom(half8UCHAR)= UCHAR &
    ran(half8UCHAR)= UCHAR &
    
    dom(inc) = BYTE &
    ran(inc) = BYTE &
    
    dom(dec) = BYTE &
    ran(dec) = BYTE &
    
    dom(simple_add8UCHAR) = (UCHAR * UCHAR) &
    ran(simple_add8UCHAR) = UCHAR &
    
    
    dom( add8UCHAR ) = BIT * UCHAR * UCHAR &
    ran( add8UCHAR ) : POW(UCHAR * BIT * BIT * BIT * BIT) &
    
    dom( substract8UCHAR ) = BIT*UCHAR * UCHAR &
    ran( substract8UCHAR ) : POW(UCHAR * BIT * BIT * BIT * BIT)  &
    
    
    dom( add16USHORT ) = ( BIT * USHORT * USHORT ) &
    ran( add16USHORT ) = (USHORT )  &
    
    dom(add_carryUSHORT) = ( BIT * USHORT * USHORT ) &
    ran(add_carryUSHORT) = BIT &
    
    
    /*dom(add_halfcarryUSHORT) = ( BIT * USHORT * USHORT ) &
    ran(add_halfcarryUSHORT) = BIT &*/
    
    
    dom(sub16USHORT) = ( BIT * USHORT * USHORT ) &
    ran(sub16USHORT) = USHORT &
    
    dom(sub_carryUSHORT) = ( BIT * USHORT * USHORT ) &
    ran(sub_carryUSHORT) = BIT &
    
    /*dom(sub_halfcarryUSHORT) = ( BIT * USHORT * USHORT ) &
    ran(sub_halfcarryUSHORT) = BIT &
    */
    dom(inc_BV16) = BV16 &
    ran(inc_BV16) = BV16 &
    
    dom(dec_BV16) = BV16 &
    ran(dec_BV16) = BV16 &
    
    dom(update_refresh_reg) = BYTE &
    ran(update_refresh_reg) = BYTE &   
    
    dom(instruction_next) = USHORT &
    ran(instruction_next) = USHORT &
    
    dom(instruction_jump) = (USHORT * ((-126)..129) ) &
    ran(instruction_jump) = USHORT &
    
    /*
    dom(daa_function) = ( BIT * BIT * BIT * BYTE  )&
    ran(daa_function) <: ( BYTE * BIT * BIT ) &*/
    

    
    /* Assertions -  Frequently used */      
    0 = schar_sshort ( 0 , 0 ) &
    
    /* Assertions - Pow function */
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

