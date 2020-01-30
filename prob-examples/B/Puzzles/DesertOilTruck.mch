MACHINE DesertOilTruck
/* Inspired by a Puzzle of Martin Gardner */
DEFINITIONS GOAL == (dist=width); SET_PREF_MAXINT==5
CONSTANTS width, maxload
PROPERTIES
  width = 8 & maxload=5
VARIABLES dist, load, deposit
INVARIANT
 dist:0..width & load : 0..maxload & deposit : 1..width --> NATURAL
INITIALISATION dist := 0 || load := 0 || deposit := (1..width)*{0}
OPERATIONS
  GoBack = PRE load>0 & dist>0 THEN load := load-1 || dist := dist-1 END;
  GoForward = PRE load>0 & dist<width THEN load := load-1 || dist := dist+1 END;
  RefuelHome(amount) = PRE dist=0 & amount>0 & amount=maxload-load & load<maxload THEN
    load:=maxload END;
  Deposit(amount) = PRE amount>0 & amount<load & dist>0 THEN
    load := load - amount || deposit(dist) := deposit(dist)+amount
  END ;
  Refuel(amount) = PRE  amount>0 & dist>0 & amount <= deposit(dist) &
                        amount+load <= maxload  THEN
     load := load + amount || deposit(dist) := deposit(dist)-amount 
  END 
END

