MACHINE concset
SETS
 Alphabet={a,b,X,Blank}
DEFINITIONS
  CHOOSE(X) == "a member of X";
  EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
  SET_PREF_MAX_DISPLAY_SET == 300;
  SET_PREF_TIME_OUT == 900;
  SET_PREF_SYMBOLIC == TRUE
ABSTRACT_CONSTANTS concset
PROPERTIES
    /* a function to concatenate a set of sequences */
  concset = %x1.(x1={}|<>) \/ 
            %x.(x:POW(seq(Alphabet)) & x/={}| CHOOSE(x)^concset(x-{CHOOSE(x)}))

ASSERTIONS
  concset({}) = [];
  concset({[a]}) = [a];
  concset({[a],[b]}) : { [a,b] , [b,a] }
END

