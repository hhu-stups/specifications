MACHINE PDA2
/* A B model of a push-down automaton ; with another example*/
SETS
 STATES = {z0,z1};
 SYMBOLS={a,b, A,B, BOT, lambda} /* BOT = # = bottom of stack*/
DEFINITIONS
 Alphabet  == (SYMBOLS - {lambda});
 Terminals == {a,b}; StackSymbols == {A,B,BOT};
 ANIMATION_FUNCTION_DEFAULT == {(1,1,state)};
 ANIMATION_FUNCTION == {2}*input \/ {3}*rev(stack);
CONSTANTS delta
PROPERTIES
 /* Dieser nicht-deterministische PDA akzeptiert die Sprache {w sp(w) | w:{a,b}*} ; Info4 Folien 99ff */
 delta = { (z0,a,BOT) |-> (z0,[A,BOT]),  /* push A for a */
           (z0,a,A) |-> (z0,[A,A]),
           (z0,a,B) |-> (z0,[A,B]),

           (z0,b,BOT) |-> (z0,[B,BOT]), /* push B for b */
           (z0,b,A) |-> (z0,[B,A]),
           (z0,b,B) |-> (z0,[B,B]),

           (z0,a,A) |-> (z1,[]),    /* decide it is the middle */
           (z0,b,B) |-> (z1,[]),
           (z0,lambda,BOT) |-> (z1,[]),

           (z1,a,A) |-> (z1,[]),
           (z1,b,B) |-> (z1,[]),
           (z1,lambda,BOT) |-> (z1,[]) }
VARIABLES stack, state, input
INVARIANT
 state:STATES & stack: seq(StackSymbols) & input : seq(Terminals)
INITIALISATION state := z0 || stack := [BOT] || input := [a,b,b,a]
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

