MACHINE FindAttacks
// inspired by Claudia Schulz's talk 19th January 2016
// written by Michael Leuschel
// in this model we represent the labelling as a partition into three sets
// and we try and find attacks relations which have a certain in/out/undec model
DEFINITIONS
 CUSTOM_GRAPH_NODES == (in * {"green"}) \/ (out * {"red"}) \/ (undec * {"orange"});
 CUSTOM_GRAPH_EDGES == attacks;
 SET_PREF_KODKOD == FALSE
SETS
 ARGUMENTS={A,B,C,D,E}
CONSTANTS attacks, in,out,undec
PROPERTIES
  attacks : ARGUMENTS <-> ARGUMENTS  /* which argument attacks which other argument */
  &
  // we partition the arguments into three sets
  ARGUMENTS = in \/ out \/ undec &
  in /\ out = {} & in /\ undec = {} & out /\ undec = {} &
  
  // if an argument is in, any attacker must be out:
  attacks~[in] <: out &
  // if an argument is in, anything it attacks must be out: 
  attacks[in] <: out &
  //if an argument y is out, it must be attacked by a valid argument:
  !y.(y:out => #x.(x|->y:attacks & x:in)) & 
  // if an argument y is undecided, it must be attacked by an undecided argument:
  !y.(y:undec => #x.(x|->y:attacks & x:undec))

 &
   in = {A,B} & out = {C,D} & undec={E} &
   card({x|A|->x:attacks}) >= card({x|B|->x:attacks}) &
   dom(attacks) = ARGUMENTS &
   card(attacks) <6
ASSERTIONS
  attacks /= {}
END

