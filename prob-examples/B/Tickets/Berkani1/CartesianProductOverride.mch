MACHINE CartesianProductOverride
SETS
 S;T
CONSTANTS a,b,c
PROPERTIES
 /* Rule Hypotheses */
 a :  S <-> T &
 dom(a) = b &
 c <: T & 
 /* without c={} ProB did find no counter-example due to erroneous
    block declaration for cond_assign_eq_obj not detected by SICStus ! */

 /* Rule Conclusion */
 not( a <+ b * c = b * c )
ASSERTIONS
  c = {};
  a /= {}
END

