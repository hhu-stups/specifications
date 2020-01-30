MACHINE WhileLoop1
/* without pe : 34 secs to find invariant violation ;  (30 secs w/o cart. closure + new merge_remove code; 32 just with new improved merge_remove code)
   with pe+post-process specialized clause down to 14.4 - 15.2 secs
   with pe+post-process+compiled: 5.5 secs (23.3.2013)

  with new post-processing+compilation: 8.1 secs; 
     w/o cartesian closure detection : 7secs
     w/o waitflags grounding (det + other): 6.7 secs
     w/o both: 6.48 secs
  + in addition    simplifyng check_less and getting rid of negate: 3.89 secs
  + after improving merge_remove 2.2 secs !
*/
SETS
 ID={aa,bb}
CONSTANTS mx
PROPERTIES
  mx=5000
VARIABLES xx
INVARIANT
 xx:1..mx
INITIALISATION xx:=4900
OPERATIONS
  Increase = VAR v IN 
               v := 0;
               WHILE v<=xx DO
                 v := (v+1+xx)-xx
               INVARIANT v:0..(xx+1)
               VARIANT 1+xx-v
               END;
               xx := v
             END
END

