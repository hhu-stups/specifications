MACHINE ArgumentationTotFun
// inspired by Claudia Schulz's talk 19th January 2016
// written by Michael Leuschel
// in this model we represent the labelling as a total function
// ProB's solver can often deal better with total functions than with sets
SETS
 ARGUMENTS={A,B,C,D,E};
 STATUS = {in,out,undec}
CONSTANTS attacks, label
PROPERTIES
  attacks : ARGUMENTS <-> ARGUMENTS  /* which argument attacks which other argument */
  &
  label: ARGUMENTS --> {in,out,undec} & /* the labeling function */
  
  // if an argument y is in any attacker must be out:
  !(x,y).(x|->y:attacks => (label(y)=in => label(x)=out)) &
  // if an argument x is in anything it attacks must be out: 
  !(x,y).(x|->y:attacks => (label(x)=in => label(y)=out)) &
  //if an argument y is out it must be attacked by a valid argument:
  !(y).(y:ARGUMENTS => (label(y)=out => #x.(x|->y:attacks & label(x)=in))) & 
  // if an argument y is undecided it must be attacked by an undecided argument:
  !(y).(y:ARGUMENTS => (label(y)=undec => #x.(x|->y:attacks & label(x)=undec))) 

 &
  // here we model one particular argumentation graph
  // A = the sun will shine to day, B = we are in the UK, C = it is summer, D = there are only 10 days of sunshine per year, E = the BBC has forecast sun
  attacks = {B|->A, C|->B, D|->C, E |-> B, E|->D, D|-> E} 
END
