MACHINE ArgumentationAsSets
// inspired by Claudia Schulz's talk 19th January 2016
// written by Michael Leuschel
// in this model we represent the labelling as a partition into three sets
DEFINITIONS
 CUSTOM_GRAPH_NODES == (in * {"green"}) \/ (out * {"red"}) \/ (undec * {"orange"});
 CUSTOM_GRAPH_EDGES == attacks
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
  // here we model one particular argumentation graph
  // A = the sun will shine to day, B = we are in the UK, C = it is summer, D = there are only 10 days of sunshine per year, E = the BBC has forecast sun
  attacks = {B|->A, C|->B, D|->C, E |-> B, E|->D} 
ASSERTIONS
  in = {A,C,E};
  out = {B,D};
  undec = {}
END

