MACHINE PDA3_from_CFG
/* Ein B Modell eines Kellerautomaten.
   Hier wird der Automat selber von einer CFG generiert
 */
SETS
 STATES = {z0};
 SYMBOLS={a,b, S,C, lambda} /* BOT = # = bottom of stack*/
DEFINITIONS
 Alphabet  == (SYMBOLS - {lambda});
 Terminals == {a,b}; StackSymbols == {a,b, S,C,BOT};
  BOT == S;
 ANIMATION_FUNCTION_DEFAULT == {(1,1,state)};
 ANIMATION_FUNCTION == {2}*input \/ {3}*(stack);
 ANIMATION_FUNCTION1 == {(1,0,"STATE: "),(2,0,"INPUT:"),(3,0,"STACK:")}
CONSTANTS delta, P
PROPERTIES
 /* Die Grammatik Regeln */
 P = { S |-> [a,S,b], S |-> [C],
       C |-> [a,b] } &

 delta =  /* laesst sich eine Regel auf das Top-Symbol im Keller anwenden tue dies ohne etwas zu lesen :*/
         { lhs,rhs | #(A,q).( A|->q : P & lhs=(z0,lambda,A) & rhs=(z0,q))}
         \/
          /* ist das Top-Symbol im Keller ein Terminalzeichen a welches auf der Eingabe steht, so wird dies aus dem Keller gePOPt */
         { lhs,rhs | #a.(a:Terminals & lhs = (z0,a,a) & rhs = (z0,[]))}
         

VARIABLES stack, state, input
INVARIANT
 state:STATES & stack: seq(StackSymbols) & input : seq(Terminals)
INITIALISATION state := z0 || stack := [BOT] || input := [a,a,b,b]
OPERATIONS
  Go(z,s) = PRE input /= {} & stack /= {} &
                z|->s : delta[{(state,first(input),first(stack))}] THEN
     state := z || input := tail(input) || stack := s^tail(stack)
  END;
  GoLambda(z,s) = PRE stack /= {} &
                      z|->s : delta[{(state,lambda,first(stack))}] THEN
     state := z || stack := s^tail(stack)
  END;
  Accept = PRE stack = {} & input = {} THEN skip END
END

