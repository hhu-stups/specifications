MACHINE TestEncodingSequence
 // leads to time out in operations in DockingApproachExample_Ext2, investigate
SETS REF = {ref}

ABSTRACT_CONSTANTS
 al_not
CONSTANTS l_not,
 bnot
PROPERTIES
  bnot = {TRUE|->FALSE,FALSE|->TRUE} &

  l_not : POW(REF * BOOL) +-> POW(REF * BOOL) &
  l_not = (%x.(x : (REF +-> BOOL) | IF x = {} THEN {} ELSE {ref |-> bnot(x(ref))} END)) &

  al_not : POW(REF * BOOL) +-> POW(REF * BOOL) &
  al_not = (%x.(x : (REF +-> BOOL) | IF x = {} THEN {} ELSE {ref |-> bnot(x(ref))} END))
VARIABLES
  x
INVARIANT
  x : REF +-> BOOL
INITIALISATION
  x := {ref |-> TRUE}
OPERATIONS
  neg(p,pi) = PRE p: REF +-> BOOL & pi: REF +-> INT THEN
     VAR x1, x2 IN
       x1 := l_not(l_not(x));
       x1 := IF pi={} THEN {} ELSE {ref|->TRUE} END;
       x1 := l_not(l_not(p));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));
       x2 := l_not(l_not(l_not(x1)));
       x1 := l_not(l_not(x2));

       x := l_not(x1);
       x1 := IF pi={} THEN {} ELSE {ref|->TRUE} END
     END
   END
END
