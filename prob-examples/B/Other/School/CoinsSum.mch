MACHINE CoinsSum
/* Find different combinations of coins which add up to a certain sum 
   (Zahlenbuch, Arbeitsheft, Seite 65)
*/
CONSTANTS coins
PROPERTIES
 coins = {1,2,5,10,20} /* available cent coins */
DEFINITIONS SET_PREF_MAX_OPERATIONS == 110
VARIABLES target
INVARIANT
 target : 1..200
INITIALISATION target:=30
OPERATIONS
  Solve(n,c) = PRE n:1..30 & c:1..n --> coins & 
                   !i.(i:2..n => c(i-1) <= c(i)) &
                   SIGMA(i).(i:1..n|c(i)) = target THEN
    skip
  END
END

