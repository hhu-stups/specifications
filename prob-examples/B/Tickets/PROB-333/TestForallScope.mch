/* TestForallScope
 * Author: Michael Leuschel
 * Creation date: 14/05/2014
 */
MACHINE
    TestForallScope
SETS AA ={xx,yy}
ABSTRACT_CONSTANTS BB, rr
PROPERTIES BB <: AA & rr = xx
ASSERTIONS
    !vv.(vv:AA => vv=xx or vv=yy); /* can be proven */
    !zz.(zz:BB => zz=rr); /* FALSE; cannot be proven */
    !xx.(xx:BB => xx=rr) /* ? AtelierB : generates Warning: Identfier xx is already used, but Assertion can be proven (but only because of false assertion above !) ! */
    ;
    {xx|xx:BB} = BB; /* is proven */
    {xx|xx:BB} : { {}, {xx} }; /* not proven */
    {xx|xx:BB & xx=rr} = BB; /* not proven */
    {xx|xx:AA &(xx:BB => xx=rr)} = AA /* not proven */
END

