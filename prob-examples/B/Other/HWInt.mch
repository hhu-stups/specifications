MACHINE HWInt
/**
* Hardware Integers and bitwise operations
*/
ABSTRACT_CONSTANTS
        andUI,
        orUI,
        xorUI,
        compl_i,compl_ui,
        shiftLUI,
        shiftRUI,
        countLeadingZeroesUI4,
        countLeadingZeroesUI8,
        countLeadingZeroesUI16,
        countLeadingZeroesUI32,
        countLeadingZeroesUI64,
        castIToUI
CONSTANTS
        I8,I16,I32,I64,
        UI8,UI16,UI32,UI64,
        intToBool,boolToInt,
        testvar,
        intNot,
        boolAnd,
        boolOr
DEFINITIONS
        ISIGN1(nb1) == -(2**nb1)..(2**nb1)-1;
        ISIGN(nb) == -(2**(nb-1))..(2**(nb-1))-1;
        USIGN(nb) == 0..(2**nb)-1
PROPERTIES
        I8  = ISIGN(8)  & I16 = ISIGN(16) &
        I32 = ISIGN(32) & I64 = ISIGN(64) &
        UI8 = USIGN(8)  & UI16= USIGN(16) & UI32= USIGN(32) & UI64= USIGN(64) &

        intToBool=%i.(i:INTEGER|bool(i/=0)) &

        boolToInt=%b.(b:BOOL|IF b=TRUE THEN 1 ELSE 0 END) &
        boolAnd=%(b1,b2).(b1:BOOL & b2:BOOL|IF b1=TRUE & b2=TRUE THEN TRUE ELSE FALSE END) &
        boolOr =%(b1,b2).(b1:BOOL & b2:BOOL|IF b1=TRUE or b2=TRUE THEN TRUE ELSE FALSE END) &

        andUI=/*@symbolic*/%(a,b,nbits).(nbits:NATURAL1 & a:USIGN(nbits) & b:USIGN(nbits) |
              SIGMA(z).(z:0..nbits|
                ((a/(2**z)) mod 2) * ((b/(2**z)) mod 2) * (2**z)) ) &

        orUI=/*@symbolic*/%(a,b,nbits).(nbits:NATURAL1 & a:USIGN(nbits) & b:USIGN(nbits) |
              SIGMA(z).(z:0..nbits |
         ( (((a/(2**z)) mod 2) + ((b/(2**z)) mod 2)) - ((a/(2**z)) mod 2) * ((b/(2**z)) mod 2)) * (2**z) )) &

        xorUI=/*@symbolic*/%(a,b,nbits).(nbits:NATURAL1 & a:USIGN(nbits) & b:USIGN(nbits)|SIGMA(z).(z:0..nbits|( (((a/(2**z)) mod 2) + ((b/(2**z)) mod 2)) - 2 * ((a/(2**z)) mod 2) * ((b/(2**z)) mod 2)) * (2**z) )) &

        compl_i=/*@symbolic*/%(a,nbits).(nbits:NATURAL1 & a:ISIGN(nbits) | -a -1) &

        compl_ui=/*@symbolic*/%(a,nbits).(nbits:NATURAL1 & a:(USIGN(nbits)) | 2**(nbits)-1-a) &

        shiftRUI=/*@symbolic*/%(ui,shr_amount).(ui:NATURAL & shr_amount:NATURAL | ui/(2**shr_amount)) &

        shiftLUI=/*@symbolic*/%(ui,shl_amount,nbits).(nbits:NATURAL1 & ui:USIGN(nbits) & shl_amount:0..nbits |
               LET with_overflow BE with_overflow=ui*(2**shl_amount) IN
                   with_overflow-((with_overflow/(2**nbits))*(2**nbits)) END) &

        countLeadingZeroesUI4 ={
                    0|->4,1|->3,2|->2,3|->2,
                    4|->1,5|->1,6|->1,7|->1,
                    8|->0,9|->0,10|->0,11|->0,
                    12|->0,13|->0,14|->0,15|->0} &

        countLeadingZeroesUI8   = /*@symbolic*/%ui.(ui:UI8                  | IF ui > (2**4)-1 THEN countLeadingZeroesUI4(ui/(2**4)) ELSE 4+countLeadingZeroesUI4(ui) END) &

        countLeadingZeroesUI16 = /*@symbolic*/%ui.(ui:UI16                  | IF ui > (2**8)-1 THEN countLeadingZeroesUI8(ui/(2**8)) ELSE 8+countLeadingZeroesUI8(ui) END) &

        countLeadingZeroesUI32 = /*@symbolic*/%ui.(ui:UI32                  | IF ui > (2**16)-1 THEN countLeadingZeroesUI16(ui/(2**16)) ELSE 16+countLeadingZeroesUI16(ui) END) &

        countLeadingZeroesUI64 = /*@symbolic*/%ui.(ui:UI64                  | IF ui > (2**32)-1 THEN countLeadingZeroesUI32(ui/(2**32)) ELSE 32+countLeadingZeroesUI32(ui) END) &  // WD ERROR

        intNot=%i.(i:INTEGER|IF i=0 THEN 1 ELSE 0 END) &

        castIToUI=/*@symbolic*/%(a,srcnbits,destnbits).(srcnbits:NATURAL1 & destnbits:NATURAL1 & a:ISIGN(srcnbits)|
            IF a < 0 THEN
              (((2**srcnbits-1)-1) + a) mod (2**destnbits)
           ELSE a mod (2**destnbits) END) &

        testvar=castIToUI(-5,16,32)

ASSERTIONS
        countLeadingZeroesUI8 :  USIGN(8) -->(0..8) &
        countLeadingZeroesUI16 : USIGN(16)-->(0..16) &
        countLeadingZeroesUI32 : USIGN(32)-->(0..32)

END
