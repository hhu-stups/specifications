MACHINE GrammarChomskyChecker
/* A simple encoding of grammar rewriting steps as B operations */
/* In addition; before starting the rewriting we check which type of grammar we have */
/* Here the example grammar is a context-sensitive grammar */
SETS
 Alphabet = {a,b,c,   S,B,C}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b,c} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  [S]   |-> [a,S,B,C], 
                  [S]   |-> [a,B,C] ,
                  [C,B] |-> [B,C],
                  [a,B] |-> [a,b],
                  [b,B] |-> [b,b],
                  [b,C] |-> [b,c],
                  [c,C] |-> [c,c]
               }
DEFINITIONS GOAL == (cur = [a,a,b,b,c,c]);
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)}
VARIABLES cur, chomsky_type, analysis_complete
INVARIANT
  cur : seq(Alphabet) &
  chomsky_type : -1..3 & analysis_complete : BOOL
INITIALISATION cur:=[S] || chomsky_type := 0 || analysis_complete := FALSE
OPERATIONS
   ApplyRule(LHS,RHS,pre,post) = PRE analysis_complete=TRUE & 
                   LHS|->RHS : Productions &
                           cur = pre^LHS^post THEN
     cur := pre^RHS^post 
  END;
  RuleIsNotContextSensitive(LHS,RHS) = PRE chomsky_type=0 & analysis_complete = FALSE &
     LHS |-> RHS : Productions &
     size(LHS) > size(RHS) THEN
     analysis_complete := TRUE
  END;
  GrammarIsContextSensitive = PRE chomsky_type=0 & analysis_complete = FALSE &
     !(LHS,RHS).(LHS |-> RHS : Productions => size(LHS) <= size(RHS)) THEN
      chomsky_type := 1
  END;
  RuleIsNotContextFree(LHS,RHS) = PRE chomsky_type=1 & analysis_complete = FALSE &
     LHS |-> RHS : Productions &
     (size(LHS) = 1  =>  first(LHS) /: NonTerminals) THEN
     analysis_complete := TRUE
  END;
  GrammarIsContextFree = PRE chomsky_type=1 & analysis_complete = FALSE &
     !(LHS,RHS).(LHS |-> RHS : Productions => size(LHS)=1 & first(LHS) : NonTerminals) THEN
      chomsky_type := 2
  END;
  RuleIsNotRegular(LHS,RHS) = PRE chomsky_type=2 & analysis_complete = FALSE &
     LHS |-> RHS : Productions &
     (size(RHS):1..2 => first(RHS)/:Terminals) &
     (size(RHS)=2 => last(RHS)/:NonTerminals) THEN
     analysis_complete := TRUE
  END;
  GrammarIsRegular = PRE chomsky_type=2 & analysis_complete = FALSE &
     !(LHS,RHS).(LHS |-> RHS : Productions
                  => size(RHS):1..2 & first(RHS) : Terminals &
                     (size(RHS)=2 => last(RHS) : NonTerminals)) THEN
      chomsky_type := 3 ||
     analysis_complete := TRUE
  END
     
END

