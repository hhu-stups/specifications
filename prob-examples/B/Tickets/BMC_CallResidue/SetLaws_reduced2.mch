MACHINE SetLaws_reduced2
// would case pending co-routines (call_residue) in bmc

SETS
  setX = {el1,el2}

VARIABLES
   SS, TT

INVARIANT
   SS : POW(setX) & TT : POW(setX) &
   SS \/ SS = SS  &
   SS = SS \/ {}  &
   SS /\ {} = {}

  & (POW(SS-TT) = { xx | xx<:SS & xx /\ TT = {} })
  & {1,2} = {2,2,1,3} \ {3} // <---


INITIALISATION

   SS,TT := {},{}

OPERATIONS

 add_SS(el) = PRE el: setX  THEN  SS := SS \/ {el} END

END
