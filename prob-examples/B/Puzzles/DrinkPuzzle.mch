MACHINE DrinkPuzzle /* ABZ'16 Drink Puzzle */
SETS
 P = {Fr,Ger,Aus,Ir};
 D = {B,Sch,RW,WW}  // Bier, Schnapps, RedWine, WhiteWine
CONSTANTS dr,opp
PROPERTIES
 dr : P >-> D &
 opp : P >-> P & opp~=opp & !p.(p:P => opp(p) /= p) &
 not(dr(Fr)=RW) & not(dr(Fr)=WW) &
 not(dr(Aus)=Sch) &
 not(dr(Ger)=WW) &
 opp(Fr) = Ger &
 opp(dr~(B)) = dr~(WW)
END

