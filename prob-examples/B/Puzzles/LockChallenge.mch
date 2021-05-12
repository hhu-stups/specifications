MACHINE LockChallenge
// https://stackoverflow.com/questions/42373479/lock-challenge-in-prolog/
CONSTANTS Digits
PROPERTIES
 // A numeric Lock has a 3 digit key:
 Digits : 1..3 --> 0..9 &

 // Hints
 // [6,8,2]: one number is correct and well-placed
 // [6,1,4]: one number is correct but wrongly placed
 // [2,0,6]: two numbers are correct but wrongly placed
 // [7,3,8]: nothing is correct
 // [7,8,0]: one number is correct but wrongly placed

 // Assertions about correct digits:
 card(ran(Digits) /\ {6,8,2})=1 &
 card(ran(Digits) /\ {6,1,4})=1 &
 card(ran(Digits) /\ {2,0,6})=2 &
      ran(Digits) /\ {7,3,8} = {} &
 card(ran(Digits) /\ {7,8,0})=1 &

 // Assertions about correctly placed digits
 card(Digits /\ [6,8,2])=1 &
     (Digits /\ [6,1,4])={} &
     (Digits /\ [2,0,6])={} &
     (Digits /\ [7,8,0])={}
END

