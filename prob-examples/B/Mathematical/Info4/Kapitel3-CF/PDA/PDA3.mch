MACHINE PDA3
/* A B model of a push-down automaton */
SETS
 STATES = {z0,z1};
 SYMBOLS={a,b, A, BOT, lambda} /* BOT = # = bottom of stack*/
DEFINITIONS
 Alphabet  == (SYMBOLS - {lambda});
 Terminals == {a,b}; StackSymbols == {A,BOT};
 ANIMATION_FUNCTION_DEFAULT == {(1,1,state)};
 ANIMATION_FUNCTION == {(1,2,input),(1,3,stack)}
CONSTANTS delta
PROPERTIES
 delta = { (z0,a,BOT) |-> (z0,[A,BOT]),
           (z0,a,A) |-> (z0,[A,A]),
           (z0,b,A) |-> (z0,[]),
           (z0,lambda,BOT) |-> (z0,[]),
           (z0,b,A) |-> (z0,[]) }
VARIABLES stack, state, input
INVARIANT
 state:STATES & stack: seq(StackSymbols) & input : seq(Terminals)
INITIALISATION state := z0 || stack := [BOT] || input := [a,b,a,b]
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

