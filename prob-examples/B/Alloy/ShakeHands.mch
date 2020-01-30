MACHINE ShakeHands
SETS
 Persons={alice,bob,m1,m2,m3,m4, f1,f2,f3,f4}
CONSTANTS spouse,shaken
PROPERTIES
 spouse: Persons -->> Persons &
 spouse = {alice |-> bob, bob |-> alice,
           m1 |-> f1, f1 |-> m1,
           m2 |-> f2, f2 |-> m2,
           m3 |-> f3, f3 |-> m3,
           m4 |-> f4, f4 |-> m4 } &
 shaken: Persons <-> Persons &
 shaken~ = shaken &
 !x.(x:Persons => ( x |-> x /: shaken & x |-> spouse(x) /: shaken ) ) &
 !(x,y).(x:Persons & y:Persons & x/=alice & y/=alice => card(shaken[{x}]) /= card(shaken[{y}]) )
END

