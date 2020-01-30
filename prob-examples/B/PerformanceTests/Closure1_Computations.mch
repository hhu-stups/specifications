MACHINE Closure1_Computations
CONSTANTS r,s,cs
PROPERTIES
 r = {1 |-> 2, 2|->3, 3|->4, 4|->2} &
 s = %i.(i:NATURAL1|i/2) &
 cs =  closure1(s)
ASSERTIONS
  closure1(r)[{1}] = 2..4;
  closure1(s)[{4}] = {2,1,0};
  closure1(s)[{100}] = {50,25,12,6,3,1,0};
  4|->1 : closure1(s);
  4|->3 /: closure1(s);
  4|->1 : cs;
  cs[{100}] = {50,25,12,6,3,1,0}
END

