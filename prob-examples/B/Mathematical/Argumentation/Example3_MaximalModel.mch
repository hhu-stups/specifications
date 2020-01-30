MACHINE Example3_MaximalModel
// inspired by Claudia Schulz's talk 19th January 2016
// written by Michael Leuschel
// in this model we represent the labelling as a total function
// ProB's solver can often deal better with total functions than with sets
DEFINITIONS SET_PREF_KODKOD == FALSE; // Kodkod cannot deal with the nested existential quantifier; better to not enable it
  RULES(label) ==  (label: ARGUMENTS --> {in,out,undec} & /* the labeling function */
  // if an argument y is in any attacker must be out:
  !(x,y).(x|->y:attacks => (label(y)=in => label(x)=out)) &
  // if an argument x is in anything it attacks must be out: 
  !(x,y).(x|->y:attacks => (label(x)=in => label(y)=out)) &
  //if an argument y is out it must be attacked by a valid argument:
  !(y).(y:ARGUMENTS => (label(y)=out => #x.(x:attackers(y) & label(x)=in))) & 
  // if an argument y is undecided it must be attacked by an undecided argument:
  !(y).(y:ARGUMENTS => (label(y)=undec => #x.(x:attackers(y) & label(x)=undec))))
SETS
 ARGUMENTS={A2,A1,A4,A3,A6,A5,A8,A7,A9,A19,A18,A11,A10,A13,A12,A15,A14,A17,A16,A0};
 STATUS = {in,out,undec}
CONSTANTS attacks, label1, attackers
PROPERTIES
  attacks : ARGUMENTS <-> ARGUMENTS  /* which argument attacks which other argument */
  &
  attackers = %y.(y:ARGUMENTS|{x|x|->y:attacks})
  &
 
  RULES(label1) &
  not(#label2.(RULES(label2) & label1~[{in}] <<: label2~[{in}])) // for minimal model invert label1/2

 &

  attacks = {A3|->A10, A11|->A13, A2|->A8, A11|->A7, A11|->A6, A2|->A5, A11|->A17, A12|->A2, A9|->A9, A18|->A5, A10|->A6, A1|->A4, A10|->A16, A19|->A8, A0|->A16, A5|->A3, A9|->A10, A8|->A17, A9|->A17, A0|->A12,A4|->A6, A3|->A4, A3|->A6, A12|->A7, A6|->A15, A12|->A3, A7|->A0, A5|->A19, A6|->A14, A15|->A11, A5|->A17, A9|->A8, A4|->A16, A8|->A9, A4|->A15, A0|->A3, A8|->A7, A16|->A1}
END
