MACHINE StonesPuzzle_v2
/*
  From the tlaplus mailing list:
A farmer has a 40 pound stone and a balance scale. How can he break the stone into 4 pieces so that, using those pieces and the balance scale, he can weigh out any integral number of pounds of corn from 1 pound through 40 pounds.

 See also:
    http://tlaplus.codeplex.com/SourceControl/latest#examples/Stones/Stones.tla
*/
/* solutions found MBA 1.7 GHz, ProB 1.5.0, Feb. 2015
 n=5, weight = 70: solution found in 0.35 sec 
 n=7, weight = 70: solution found in 0.21 sec  (36 sec with TLC on Lamport's model)
 n=5, weight = 80: solution found in 1 sec
 n=5, weight = 90: solution found in 2.5 sec
 n=7, weight = 150:  {(1|->1),(2|->3),(3|->9),(4|->12),(5|->12),(6|->13),(7|->100)} in 9.3 secs */
CONSTANTS n, weight, st
PROPERTIES
 n = 4 & /* number of stones into which we divide the main stone */
 weight = 40 & /* weight of the original stone */

 st:1..n-->1..weight & /* the weights of the individual stones */

 SIGMA(i).(i:1..n|st(i))= weight &

 !w.(w:1..weight => #x.(x:1..n--> {-1,0,1} &
                     w = SIGMA(i).(i:1..n|st(i)*x(i)))) 
OPERATIONS
  r <-- WeighStone(w) = PRE w:1..weight THEN
     ANY x WHERE  x:1..n--> {-1,0,1} & w = SIGMA(i).(i:1..n|st(i)*x(i)) THEN
        r := (st[x~[{1}]],st[x~[{-1}]]) /* assumes that st is injective */
     END
  END
END

