MACHINE NinePrisoners
/* 
From
 http://www.wired.com/2015/06/answer-150-year-old-math-conundrum-brings-mystery/ :
"So in the spirit of Kirkman, we will leave the gentle reader with another brainteaser, a slight variation on the schoolgirl puzzle devised in 1917 by the British puzzle aficionado Henry Ernest Dudeney and later popularized by Martin Gardner: Nine prisoners are taken outdoors for exercise in rows of three, with each adjacent pair of prisoners linked by handcuffs, on each of the six weekdays (back in Dudeney’s less enlightened times, Saturday was still a weekday). Can the prisoners be arranged over the course of the six days so that each pair of prisoners shares handcuffs exactly once?"

*/
DEFINITIONS
 Prisoners == 1..9;
 Days == 5; /* 4 Days: 80 ms ; 5 = 200 ms ; 6 = 82.3 seconds*/
 Cuffs == {1,2,  4,5, 7,8 };
 share(day,cuff) == {arrange(day)(cuff),arrange(day)(cuff+1)};
 ANIMATION_FUNCTION ==
  {r,c,i| r:1..Days & c:1..3 & i = arrange(r)(c) } \/
  {r,c,i| r:1..Days & c:5..7 & i = arrange(r)(c-1) } \/
  {r,c,i| r:1..Days & c:9..11 & i = arrange(r)(c-2) };
 xANIMATION_FUNCTION_DEFAULT == {r,c,i| r:1..Days & c:1..11 & i = "  " };
 ANIMATION_FUNCTION_DEFAULT == {r,c,i| r:1..Days & c:1..11 & i = 0 };
 ANIMATION_IMG0 == "images/Prisoner_0.gif";
 ANIMATION_IMG1 == "images/Prisoner_1.gif";
 ANIMATION_IMG2 == "images/Prisoner_2.gif";
 ANIMATION_IMG3 == "images/Prisoner_3.gif";
 ANIMATION_IMG4 == "images/Prisoner_4.gif";
 ANIMATION_IMG5 == "images/Prisoner_5.gif";
 ANIMATION_IMG6 == "images/Prisoner_6.gif";
 ANIMATION_IMG7 == "images/Prisoner_7.gif";
 ANIMATION_IMG8 == "images/Prisoner_8.gif";
 ANIMATION_IMG9 == "images/Prisoner_9.gif"
CONSTANTS arrange
PROPERTIES
 /* typing + permutation requirement */
  arrange : (1..Days) --> perm(Prisoners) &  /* perm is faster than (Prisoners>->Prisoners) or >->> or -->> */

 /* symmetry breaking */
  arrange(1) = %i.(i:Prisoners|i) &
  !d.(d:1..Days => 
       !c.(c:Prisoners & c mod 3 = 1 => arrange(d)(c) < arrange(d)(c+2))) &
  !d.(d:1..Days => 
       !c.(c:{1,3} => arrange(d)(c) < arrange(d)(c+3))) 
 &

/* the constraint proper */
  !(c,d).(c:Cuffs & d:2..Days =>
     !(c1,d1).(d1<d & d1>0 & c1:Cuffs =>
          share(d,c) /= share(d1,c1))
      )
OPERATIONS
  r <-- Neighbours(i) = PRE i:Prisoners THEN /* compute for every day the neighbours of i */
     r := %d.(d:1..Days | 
                UNION(x,c).( x:Prisoners & c:Cuffs & i: share(d,c)| share(d,c) \ {i})
              ) END
END

