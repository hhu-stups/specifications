/******************************************************************************
 maMachine3.mch

 Date        : 2013-01-04
******************************************************************************/
MACHINE
maMachine
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647
ASSERTIONS
/*@label vrai */ ( 0+0=0 )    &
/*@label faux */ ( 0=1 )    &
/*@label et vrai */ ( 0+0=0 & 0+0=0 & 0+0=0 )    &
/*@label et faux 1 */ ( 0=1 &  0+0=0 & 0+0=0 )    &
/*@label et faux 2 */ ( 0+0=0 & 0=1 & 0+0=0 )
END