/******************************************************************************
 maMachine3.mch

 Date        : 2013-01-04
******************************************************************************/
MACHINE
maMachine
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647
CONSTANTS x
PROPERTIES x=1
ASSERTIONS
/*@label vrai */ ( 0+0=0 )    ;
/*@label faux */ ( 0=1 )    ;
/*@label et vrai */ ( 0+0=0 & 0+0=0 & 0+0=0 )    ;
/*@label etfaux1 */ ( 0=1 &  0+0=0 & 0+0=0 )    ;
/*@label et faux 2 */ (  0=x & 1=x  ) ;
/*@label ou vrai */ (  0=x or 1=x  )
END