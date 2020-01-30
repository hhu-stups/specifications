MACHINE DefSets
 /* Defining deferred set of various sizes for experimentation */
SETS S5;S10;S50;S100;S200;S500;S1000; E100
CONSTANTS e1,e2
PROPERTIES
 card(S5) = 5 &
 card(S10) = 10 &
 card(S50) = 50 &
 card(S100) = 100 &
 card(S200) = 200 &
 card(S500) = 500 &
 card(S1000) = 1000 &
 
 card(E100) = 100 &
 e1:E100 & e2:E100 & e1 /= e2
END