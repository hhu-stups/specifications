MODEL m_3
/*
This model contains an error that was unveiled by ProB and the reduced statespace view:


Summary of Email correspondence

--------------------------

What I am not sure to understand however are the two dashed lines going from 5 to 6 and 10.

On the other hand, there is only one plain line going from 9 to 2.

But in fact the situation is normally COMPLETELY SYMMETRIC between the two parts of the system (I mean, going up or going down)

So, I would have expected a single plain line going from 5 to 6 only.

Otherwise, one "sees" very well the symmetry between

2, 3, 4, 5

and

6, 7, 8, 9

It is very nice!

=======================


I see.

It is because fth=0 has been choosen. I must correct this: fth must be positive and rth must be strictly smaller than m.

With these constraints, this almost deadlock should not occur any more (I think).


========================

Felix,

I think that there is another difficulty.

In problem 1 you state in 8:

0<= fth < rth <=1

But you also mention that the input should be first lower than RTH then HIGHER. What means "higher" here? If rth = 1 than we cannot be higher than rth. We have a similar situation with fth and 0.

I think that if "higher" means strictly greater and "lower" means strictly smaller (as it is usually understood), then the constraint should be

0 < fth < rth < 1

We have a similar difficulty with Problem 2.

These difficulties have been discovered mainly by Michael Leuschel (using ProB) and myself.

Thanks,

jr

==================

Hello again, 

The correct constraints are 

0 < fth < rth < 1 for problem nr. 1

and

0 < rth < 1 for problem nr. 2

Sorry for the errors.
Felix

*/
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE ;
 ASSERT_LTL == "G not(sink)"
CONSTANTS n,fth,m,rth
PROPERTIES (n > 0) & (m > 0) & (rth : (0 .. m)) & (fth : (0 .. m)) & (fth < rth)
 & m>3
VARIABLES c,fe,off,on,output,re
INVARIANT (output : BOOL) & (on : BOOL) & (off : BOOL) & ((output = TRUE) => (on = FALSE)) & ((output = FALSE) => (off = FALSE)) & ((re = TRUE) => (output = FALSE)) & ((re = TRUE) => (on = FALSE)) & ((fe = TRUE) => (output = TRUE)) & ((fe = TRUE) => (off = FALSE)) & (c : (0 .. n))
INITIALISATION output := (FALSE) || on := (FALSE) || off := (FALSE) || re := (FALSE) || fe := (FALSE) || c := (0)
OPERATIONS
 output_FALSE_TRUE = SELECT (output = FALSE) & (on = TRUE) THEN output := (TRUE) || on := (FALSE) END ;
 output_TRUE_FALSE = SELECT (output = TRUE) & (off = TRUE) THEN output := (FALSE) || off := (FALSE) END ;
 on_FALSE_TRUE = SELECT (re = TRUE) & (c = 0) THEN on := (TRUE) || re := (FALSE) END ;
 off_FALSE_TRUE = SELECT (fe = TRUE) & (c = 0) THEN off := (TRUE) || fe := (FALSE) END ;
 re_FALSE_TRUE = ANY input WHERE (output = FALSE) & (on = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input > rth) THEN re := (TRUE) || c := (n) END ;
 re_TRUE_TRUE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input > rth) THEN c := ((c)-(1)) END ;
 re_TRUE_FALSE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input < rth) THEN re := (FALSE) || c := (0) END ;
 re_FALSE_FALSE = ANY input WHERE (output = FALSE) & (on = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input < rth) THEN skip END ;
 fe_FALSE_TRUE = ANY input WHERE (output = TRUE) & (off = FALSE) & (fe = FALSE) & (input : (0 .. m)) & (input < fth) THEN fe := (TRUE) || c := (n) END ;
 fe_TRUE_TRUE = ANY input WHERE (fe = TRUE) & (c > 0) & (input : (0 .. m)) & (input < fth) THEN c := ((c)-(1)) END ;
 fe_TRUE_FALSE = ANY input WHERE (fe = TRUE) & (c > 0) & (input : (0 .. m)) & (input > fth) THEN fe := (FALSE) || c := (0) END ;
 fe_FALSE_FALSE = ANY input WHERE (output = TRUE) & (off = FALSE) & (fe = FALSE) & (input : (0 .. m)) & (input > fth) THEN skip END 
END