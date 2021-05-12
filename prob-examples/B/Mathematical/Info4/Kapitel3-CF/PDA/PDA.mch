MACHINE PDA
/* A B model of a push-down automaton */
SETS
 STATES = {z0,z1};
 SYMBOLS={a,b, A, BOT, lambda} /* BOT = # = bottom of stack*/
DEFINITIONS
 Alphabet  == (SYMBOLS - {lambda});
 Terminals == {a,b}; StackSymbols == {A,BOT};
 ANIMATION_FUNCTION_DEFAULT == {(1,1,state)};
 ANIMATION_FUNCTION == {2}*input \/ {3}*(stack);
 ANIMATION_FUNCTION1 == {(1,0,"STATE: "),(2,0,"INPUT:"),(3,0,"STACK:")};
 ANIMATION_STR_JUSTIFY_LEFTx == TRUE
CONSTANTS delta
PROPERTIES
 /* A PDA accepting {a^mb^m| m>=1} ; Beispiel von Info 4 (Folie 95ff) */
 delta = { (z0,a,BOT) |-> (z0,[A,BOT]),
           (z0,a,A) |-> (z0,[A,A]),
           (z0,b,A) |-> (z1,[]),
           (z1,lambda,BOT) |-> (z1,[]),
           (z1,b,A) |-> (z1,[]) }
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
  Accept = PRE stack = {} & input = {} THEN  /* Wir akzeptieren wenn Eingabe und Stapel leer sind */
   skip END
END

