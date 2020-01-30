MACHINE RecursiveSeqLenFunction
/* Using recursive functions now without the need for explicitly using
   the external function mechanism
 */
SETS
 ID={aa,bb,cc,dd}
DEFINITIONS
  SET_PREF_MAXINT ==  3 ; SET_PREF_TIME_OUT == 1000;
  SET_PREF_SYMBOLIC == FALSE
ABSTRACT_CONSTANTS mylen
PROPERTIES
   mylen: (INTEGER<->ID) <-> INTEGER &
/* mylen: seq(ID) <-> INTEGER &  causes expansion */
       mylen =  %x.(x=[]|0) \/ %x.(x/=[]|1 + mylen(tail(x)) )
VARIABLES xx
INVARIANT
 xx:seq(ID)
INITIALISATION xx:=[]
OPERATIONS
  Add(yy) = PRE yy:ID THEN xx:= yy -> xx END;
  r <-- GetMyLength = BEGIN r := mylen(xx) END
ASSERTIONS
  mylen([aa]) = 1;
  {x|([x]|->1) : mylen} = ID
 /*  ;   still expand mylen:
  mylen[ {[aa],[bb]} ] = {1}
  ;
  ([ [aa], [aa,bb] ] ; mylen) = [1,2] */
END

