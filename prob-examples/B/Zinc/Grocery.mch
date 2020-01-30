MACHINE Grocery
/*
var 0..711: item1; var 0..711: item2; var 0..711: item3; var 0..711: item4;
constraint item1 + constraint item1 *
grocery.mzn
item2 + item3 + item4 == 711; item2 * item3 * item4 == 711 * 100 * 100 * 100;
% symmetry breaking constraint item1 <= item2 /\ item2 <= item3 /\ item3 <= item4;
solve satisfy;
output ["{", show(item1), ",", show(item2), ",", show(item3), ",", show(item4),"}\n"];

mzn2fzn: error:
grocery.mzn:7 In constraint. In ’*’ expression. the bounds on this expression exceed what can be represented on a 32 bit machine.

Also results in CLP(FD) overflow on 32-bit machine;
 with 64-bit SICStus it produces 120,125,150,316 as solution
*/
DEFINITIONS ITEM == 1..4
CONSTANTS item
PROPERTIES
 item: 1..4 --> 0..711 &
 SIGMA(i).(i:ITEM|item(i)) = 711 &
 PI(i).(i:ITEM|item(i)) = 711 * 100 * 100 * 100
END

