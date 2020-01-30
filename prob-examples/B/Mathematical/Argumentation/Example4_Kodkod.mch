MACHINE ArgumentationTotFun
DEFINITIONS SET_PREF_KODKOD == TRUE; /* use Kodkod backend instead of default CLP backend for first-order predicates */
 CUSTOM_GRAPH_NODES == (label~[{in}] * {"green"}) \/ (label~[{out}] * {"red"}) \/ (label~[{undec}] * {"orange"});
 CUSTOM_GRAPH_EDGES == attacks
SETS
 ARGUMENTS = {A2,A30,A1,A31,A4,A3,A6,A5,A8,A7,A9,A29,A28,A27,A26,A25,A24,A23,A22,A21,A0,A40,A41,A42,A37,A36,A39,A38,A33,A32,A35,A34,A45,A46,A43,A44,A49,A47,A48,A20,A19,A18,A11,A10,A13,A12,A15,A14,A17,A16};
 STATUS = {in,out,undec}
CONSTANTS attacks, label
PROPERTIES
  attacks : ARGUMENTS <-> ARGUMENTS  /* which argument attacks which other argument */
  &
  label: ARGUMENTS --> {in,out,undec} & /* the labeling function */

  /* if an argument y is in any attacker must be out:*/
  !(x,y).(x|->y:attacks => (label(y)=in => label(x)=out)) &
  /* if an argument x is in anything it attacks must be out: */
  !(x,y).(x|->y:attacks => (label(x)=in => label(y)=out)) &
  /*if an argument y is out it must be attacked by a valid argument:*/
  !(y).(y:ARGUMENTS => (label(y)=out => #x.(x|->y:attacks & label(x)=in))) & 
  /* if an argument y is undecided it must be attacked by an undecided argument:*/
  !(y).(y:ARGUMENTS => (label(y)=undec => #x.(x|->y:attacks & label(x)=undec))) 
 &
  /* here we model one particular argumentation graph
    */
   attacks = {A3|->A0, A48|->A5, A49|->A0, A36|->A23, A37|->A10, A37|->A16, A3|->A8, A33|->A24, A47|->A2, A33|->A26, A43|->A3, A7|->A0, A6|->A2, A30|->A28, A31|->A21, A32|->A11, A41|->A6, A33|->A16, A8|->A37, A4|->A44, A3|->A48, A9|->A9, A30|->A18, A31|->A12, A6|->A42, A7|->A45, A7|->A47, A7|->A42, A7|->A43, A49|->A9, A45|->A45, A46|->A44, A29|->A47, A29|->A40, A28|->A49, A26|->A48, A43|->A47, A44|->A47, A26|->A41, A45|->A44, A27|->A40, A29|->A34, A24|->A47, A29|->A32, A25|->A44, A29|->A30, A28|->A36, A22|->A46, A22|->A47, A27|->A35, A22|->A42, A26|->A35, A49|->A46, A25|->A33, A10|->A9, A20|->A49, A25|->A34, A24|->A35, A40|->A1, A24|->A38, A28|->A24, A23|->A30, A27|->A24, A22|->A39, A21|->A37, A24|->A23, A24|->A21, A23|->A21, A27|->A15, A27|->A10, A26|->A14, A1|->A0, A43|->A33, A43|->A39, A16|->A9, A16|->A8, A18|->A8, A48|->A29, A31|->A3, A31|->A0, A18|->A3, A31|->A6, A18|->A2, A41|->A43, A42|->A41, A33|->A4, A20|->A15, A20|->A12, A13|->A1, A43|->A26, A43|->A27, A22|->A18, A49|->A11, A44|->A25, A13|->A5, A49|->A12, A13|->A7, A49|->A14, A45|->A23, A23|->A18, A14|->A9, A41|->A31, A49|->A18, A23|->A16, A20|->A24, A24|->A15, A15|->A6, A20|->A20, A39|->A5, A19|->A38, A44|->A12, A16|->A48, A41|->A25, A16|->A49, A45|->A13, A41|->A20, A40|->A27, A17|->A49, A18|->A45, A18|->A47, A42|->A20, A19|->A45, A35|->A3, A35|->A8, A41|->A10, A37|->A1, A42|->A11, A16|->A25, A12|->A33, A11|->A34, A16|->A22, A10|->A36, A15|->A22, A6|->A21, A19|->A17, A6|->A25, A9|->A12, A14|->A32, A5|->A24, A0|->A37, A1|->A30, A13|->A35, A18|->A23, A4|->A28, A13|->A37, A8|->A12, A16|->A28, A37|->A48, A7|->A30, A28|->A9, A7|->A32, A2|->A47, A38|->A45, A3|->A41, A11|->A46, A38|->A46, A7|->A35, A38|->A47, A15|->A37, A16|->A30, A27|->A8, A19|->A26, A37|->A42, A37|->A44, A15|->A30, A18|->A39, A19|->A32, A8|->A29, A4|->A36, A18|->A34, A13|->A48, A0|->A48, A1|->A41, A38|->A49, A39|->A45, A13|->A42, A8|->A25, A12|->A48, A17|->A34, A8|->A27, A4|->A34, A39|->A48, A4|->A33, A34|->A43, A24|->A4, A25|->A3, A38|->A33, A37|->A38, A11|->A18, A1|->A16, A23|->A5, A23|->A6, A33|->A41, A32|->A45, A24|->A0, A23|->A8, A0|->A14, A27|->A0, A13|->A15, A13|->A18, A35|->A48, A10|->A20, A25|->A6, A25|->A5, A26|->A4, A39|->A32, A25|->A9, A38|->A23, A2|->A26, A15|->A17, A34|->A32, A34|->A33, A2|->A23, A6|->A17, A7|->A10, A15|->A19, A16|->A12, A2|->A25, A32|->A36, A14|->A16, A10|->A24, A10|->A22, A11|->A20, A18|->A13, A36|->A32, A5|->A10, A32|->A42, A31|->A49, A5|->A12, A17|->A17, A31|->A42, A22|->A6, A31|->A44, A17|->A12, A16|->A18, A3|->A12, A17|->A15, A39|->A22}
END

