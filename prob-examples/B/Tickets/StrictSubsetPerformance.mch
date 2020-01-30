MACHINE StrictSubsetPerformance
 /* Time out for with card(SS)=8
    card(SS) /= 1 <=> (union(ran(%ss.(ss <<: SS|ss))) = SS)  
    {ss|ss <: SS} - {SS}  ok
    {ss|ss <<: SS} not ok */
SETS
   elements = {el1,el2,el3}
DEFINITIONS
 SET_PREF_TIME_OUT == 20000; SET_PREF_CHR == FALSE;
setX == (POW(elements));
 GOAL == ({y1,y2|y1:SS & el1:y1 & y2:SS & el1:y2 & y1 /= y2} =
          {y1,y2|y1:SS & el1:y1 & y2:SS-{y1} & el1:y2} );
/*
{y1,y2|y1:SS & el1:y1 & y2:SS & el1:y2 & y1 /= y2  } */
CONSTANTS
   SS
PROPERTIES
   SS : POW(setX) & SS = (setX)
ASSERTIONS
  GOAL /*;
  {ss|ss <: SS} - {SS} /= {};
  {ss|ss <<: SS} /= {} */
END

