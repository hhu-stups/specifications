MACHINE ThreeApprovalKodkod
/* Partial Encoding of Algorithm by Joerg Rothe */
SETS
 /* Candidate = {c1,c2,c3,c4,c5,c6,c7,c8,c9};
 Voter = {v1,v2,v3}; */
 Candidate; Voter;
 Result = {yes,no,unknown}
DEFINITIONS
 V(x) == {v|v:Voter & v|->x:App};  /* this is a function not directly supported by Kodkod; by usinge
  a DEFINITION we hide this from Kodkod */
 SET_PREF_MAX_INITIALISATIONS == 100
CONSTANTS App
PROPERTIES
 App: Voter <-> Candidate &
 dom(App) = Voter &
 !v.(v:Voter => card(App[{v}])=3)  /* does not seem to be dealt with efficiently by ProB; other model better ThreeApproval */

 & card(Candidate)=15 & card(Voter)=5  /* & ran(App) = Candidate */
VARIABLES c, step, output
INVARIANT
  c:Candidate & step:NATURAL & output:Result
INITIALISATION c :: Candidate || step := 1 || output := unknown
OPERATIONS
  r <-- Check = PRE step=1 THEN
    IF V(c)={} THEN  r:=FALSE || output := no ELSE r := TRUE || step := 2 END
  END;
 Find(i,j) = PRE step=2 & i:V(c) & j:V(c) & i/=j & App[{i}] /\ App[{j}] = {c} THEN
   output := yes
 END;
 NoFind = PRE step=2 & !(i,j).( i:V(c) & j:V(c) & i/=j  => App[{i}] /\ App[{j}] /= {c}) THEN
  step := 4
 END;
 CheckAssertion = PRE step=4 THEN
   ASSERT !(i,j).( i:V(c) & j:V(c) & i/=j  => (App[{i}] /\ App[{j}]) -{c} /=  {}) THEN skip
 END
 END;
 FailAssertion(i,j) = PRE step=4 & i:V(c) & j:V(c) & i/=j  & (App[{i}] /\ App[{j}]) -{c} =  {} THEN
  step := -1  /* generate invariant violation */
  END
END

