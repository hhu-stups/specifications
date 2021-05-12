MACHINE Europe_Colouring
DEFINITIONS
 SET_PREF_SMT == TRUE;
 SET_PREF_SOLVER_STRENGTH == 100
SETS
 Col = {green, red, blue, yellow, purple};
 Country = {
        albania,
        austria,
        belgium,
        bulgaria,
        bosnia_and_herz,
        belarus,
        switzerland,
        czech_rep,
        denmark,
        germany,
        spain,
        estonia,
        finland,
        france,
        united_kingdom,
        greece,
        croatia,
        hungary,
        ireland,
        iceland,
        italy,
        kosovo,
        lithuania,
        luxembourg,
        latvia,
        moldova,
        macedonia,
        montenegro,
        netherlands,
        norway,
        poland,
        portugal,
        romania,
        russia,
        serbia,
        slovakia,
        sweden,
        slovenia,
        ukraine
 }
 CONSTANTS Border_, Border, Color
 PROPERTIES
   Color : Country --> Col &

   !(country1,country2).
     (country1|->country2 : Border
       => Color(country1) /= Color(country2)
     )
   &
   !(country1).
     (Color(country1) /= blue
       // => blue : Color[Border[{country1}]]
       => # c2.( c2:Border[{country1}]
                 & Color(c2) = blue)
     ) /*@desc "use blue as default color (symmetry breaking)" */
   &

   Border = Border_ \/ Border_
   &
   Border_ = {
       albania |-> greece,
        albania |-> kosovo,
        albania |-> macedonia,
        albania |-> montenegro,
        austria |-> czech_rep,
        austria |-> germany,
        austria |-> hungary,
        austria |-> italy,
        austria |-> slovakia,
        austria |-> slovenia,
        austria |-> switzerland,
        belgium |-> france,
        belgium |-> germany,
        belgium |-> luxembourg,
        belgium |-> netherlands,
        bulgaria |-> greece,
        bulgaria |-> macedonia,
        bulgaria |-> romania,
        bulgaria |-> serbia,
        bosnia_and_herz |-> croatia,
        bosnia_and_herz |-> montenegro,
        bosnia_and_herz |-> serbia,
        belarus |-> poland,
        belarus |-> ukraine,
        czech_rep |-> germany,
        czech_rep |-> poland,
        czech_rep |-> slovakia,
        denmark |-> germany,
        denmark |-> sweden,
        germany |-> luxembourg,
        germany |-> netherlands,
        germany |-> poland,
        germany |-> switzerland,
        estonia |-> latvia,
        estonia |-> russia,
        finland |-> norway,
        finland |-> russia,
        finland |-> sweden,
        france |-> germany,
        france |-> italy,
        france |-> luxembourg,
        france |-> spain,
        france |-> switzerland,
        france |-> united_kingdom,
        united_kingdom |-> ireland,
        greece |-> macedonia,
        croatia |-> hungary,
        croatia |-> montenegro,
        croatia |-> serbia,
        croatia |-> slovenia,
        hungary |-> austria,
        hungary |-> romania,
        hungary |-> serbia,
        hungary |-> slovakia,
        hungary |-> slovenia,
        hungary |-> ukraine,
        italy |-> slovenia,
        italy |-> switzerland,
        kosovo |-> macedonia,
        kosovo |-> serbia,
        lithuania |-> poland,
        lithuania |-> russia,
        latvia |-> lithuania,
        moldova |-> romania,
        moldova |-> ukraine,
        macedonia |-> serbia,
        norway |-> russia,
        norway |-> sweden,
        poland |-> russia,
        poland |-> slovakia,
        poland |-> ukraine,
        portugal |-> spain,
        romania |-> serbia,
        romania |-> ukraine,
        russia |-> ukraine,
        slovakia |-> ukraine,
        russia |-> latvia,
        russia |-> belarus,
        latvia |-> belarus,
        lithuania |-> belarus,
        serbia |-> montenegro,
        montenegro |-> kosovo
    }

END
