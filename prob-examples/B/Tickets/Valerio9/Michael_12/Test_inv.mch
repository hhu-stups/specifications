/* Test_inv
 * Author: valerio
 * Creation date: qui ago 25 2011
 */
MACHINE
    Test_inv
SEES
    BIT_DEFINITION,
    BYTE_DEFINITION,
    UCHAR_DEFINITION,
    SCHAR_DEFINITION
DEFINITIONS
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
    func,
    func_inv
PROPERTIES
    func : 0..1 --> 0..1 &
    func = %(elem).( elem : 0..1 | elem +1) &
    
    func_inv : 0..1 --> 0..1 &
    func_inv = %(elem).( elem : 0..1 | elem -1) 
    
ASSERTIONS
    func(0) = 1&    
    !(xx).(xx : 0..10 => func(xx) = xx+1);
    func(1) /: {0,1};
    func(1) /: ran(func);
    (1 = 0) <=> ( 0= 1);
    ( 0|-> 0) : func~;
    func : 0..1 +-> 0..1;
    func : 0..1 --> 0..1;
    func : 0..1 -->> 0..1;
    func : 0..1 >+> 0..1;
    func : 0..1 >-> 0..1;
    func : 0..1 >->> 0..1;
    
    2 ** 2 = 4;
    
    /* function */
    !(xx,yy,zz).( xx : dom(func) & yy: ran(func) & zz: ran(func) &
        ( xx|-> yy) : func & ( xx|-> zz) : func => yy=zz ) &
    
    /* injective */
    !(vv,xx).( vv: dom(func) & xx : dom(func) => func(vv)=func(xx) ) &
    
    /* Surjection */
    !xx.( xx : dom(func) => #yy.( yy : ran(func) & func(xx)=yy )) &
    
    /* Total */
    !yy.( yy: ran(func)  => #xx.( xx : dom(func)& func(xx)=yy )) &
    
    
    /* function */
    !(xx,yy).( xx : dom(uchar_byte) & yy: ran(uchar_byte) =>
        ( xx|-> yy) : { 0|->[0,0,0,0,0,0,0,0] , 255|->[1,1,1,1,1,1,1,1]  } &
        ( yy|-> xx) : {[0,0,0,0,0,0,0,0]|->0 , [1,1,1,1,1,1,1,1]|->255} ) & 
    
   
%v0.(v0: 1..8 --> {0,1} | 128*v0(8)+64*v0(7)+32*v0(6)+16*v0(5)+8*v0(4)+4*v0(3)+2*v0(2)+1*v0(1)): (1..8 --> {0,1}) >->> 0..255  &


/*
This rule checks the inverse functions
*/
%v0.(v0: 1..8 --> {0,1} | 128*v0(8)+64*v0(7)+32*v0(6)+16*v0(5)+8*v0(4)+4*v0(3)+2*v0(2)+1*v0(1)) = 
(%v0.(v0: 0..255 | [v0 mod 2/1,v0 mod 4/2,v0 mod 8/4,v0 mod 16/8,v0 mod 32/16,v0 mod 64/32,v0 mod 128/64,v0 mod 256/128]))~ 
&
    
       /*byte_schar : BYTE >->> SCHAR &*/
     % ( v0 ) . ( v0 : BYTE | ( - pow2_7 ) * v0 ( 8 ) + pow2_6 * v0 ( 7 ) + pow2_5 * v0 ( 6 ) + pow2_4 * v0 ( 5 ) + pow2_3 * v0 ( 4 ) + pow2_2 * v0 ( 3 ) + 2 * v0 ( 2 ) + v0 ( 1 ) ) : (1..8 --> {0,1}) >->> -128..127   &

    /*schar_byte : SCHAR >->> BYTE &  */
    % ( v0 ) . ( v0 : SCHAR  & v0 >= 0 |
                  [ ( v0 mod pow2_1 ) / pow2_0 ,
                    ( v0  mod pow2_2 ) / pow2_1 ,
                    ( v0  mod pow2_3 ) / pow2_2 ,
                    ( v0 mod pow2_4 ) / pow2_3 ,
                    ( v0 mod pow2_5 ) / pow2_4 ,
                    ( v0 mod pow2_6 ) / pow2_5 ,
                    ( v0 mod pow2_7 ) / pow2_6 ,
                    ( v0 mod pow2_8 ) / pow2_7 ] ) \/
      % ( v0 ) . ( v0 : SCHAR & not ( v0 >= 0 ) |
         [ ( ( v0 + pow2_8 ) mod pow2_1 ) / pow2_0 ,
         ( ( v0 + pow2_8 ) mod pow2_2 ) / pow2_1 ,
         ( ( v0 + pow2_8 ) mod pow2_3 ) / pow2_2 ,
         ( ( v0 + pow2_8 ) mod pow2_4 ) / pow2_3 ,
         ( ( v0 + pow2_8 ) mod pow2_5 ) / pow2_4 ,
         ( ( v0 + pow2_8 ) mod pow2_6 ) / pow2_5 ,
         ( ( v0 + pow2_8 ) mod pow2_7 ) / pow2_6 ,
         ( ( v0 + pow2_8 ) mod pow2_8 ) / pow2_7 ] ) :   -128..127 >->> (1..8 --> {0,1})  
    
    
    /*
This rule checks byte_uchar: FIN(byte_uchar)
*/
&
byte_uchar: FIN(byte_uchar) &
%v0.(v0: 1..8 --> {0,1} | 128*v0(8)+64*v0(7)+32*v0(6)+16*v0(5)+8*v0(4)+4*v0(3)+2*v0(2)+1*v0(1)): FIN(%v0.(v0: 1..8 --> {0,1} | 128*v0(8)+64*v0(7)+32*v0(6)+16*v0(5)+8*v0(4)+4*v0(3)+2*v0(2)+1*v0(1))) 
    
    &
     bit_not = { 0 |-> 1 } \/ { 1 |-> 0 }
    
END
