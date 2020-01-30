MACHINE MaxSatSet
/* computing a subset of a starting set which satisfies a certain monotonic property over sets */
DEFINITIONS
  PROP(x) == (x<: {3,5,7} or x<: {4,6,8,12});
   /* a definition for the if-then-else construct; note: Test must be a boolean variable */
   ifte(Test,ThenExpr,ElseExpr) == (%(iif).(iif=0 & (Test=TRUE)|ThenExpr) \/
                                    %(iif).(iif=0 & (Test=FALSE)|ElseExpr)) (0);

   let(V,VE,E) == UNION(V).(V=VE|E);
  random_element(x) == max(x);
  EXTERNAL_FUNCTION_random_element(T) == POW(T) --> T;

  CHOOSE(X) == "a member of X";
  EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);

ABSTRACT_CONSTANTS
  max_sat_limit
PROPERTIES
 max_sat_limit = %(acc,rest).(acc<:INTEGER & rest<:INTEGER 
                     | ifte(bool(card(acc)>2),acc,
                            ifte(bool(rest={}),{},
                             ifte(bool(PROP(acc \/ {CHOOSE(rest)})),
                               let(v,max_sat_limit(acc \/ {CHOOSE(rest)}, rest \ {CHOOSE(rest)}),
                                    ifte(bool(v={}), max_sat_limit(acc, rest \  {CHOOSE(rest)}),
                                         v)
                                   ),
                               max_sat_limit(acc, rest \  {CHOOSE(rest)})
                              )
                            )
                           )
                        )
                        
 
ASSERTIONS
  max_sat_limit({},1..8) = {3,5,7}
END

