MACHINE GardnerSwitchingPuzzle
/* Puzzle Nr 40 from My best mathematical and logical puzzles, Martin Gardner */
/*
We have ENGINE + two wagons A, B
Only ENGINE can go through tunnel
Layout:
 ==ENGINE ======+======A======\
               /              |
               |             TUN
               |             NEL
               |              |
                \             /
 ======================B======
Task: move A to B's position and vice versa and return ENGINE to original position
*/
SETS
 TRAINS={engine,A,B};
 TRACKS = {topleft,top_middle,bot_left,bot_middle,leftlink}
DEFINITIONS
 GOAL == occ(topleft) = [engine] & occ(top_middle)=[B] & occ(bot_middle)=[A]
CONSTANTS
  link
PROPERTIES
  link = {topleft |->top_middle, leftlink |->top_middle,
          bot_middle|-> bot_left, bot_middle |-> leftlink} 
VARIABLES occ
INVARIANT
 occ: TRACKS --> iseq(TRAINS) &
 !(t1,t2).(t1:TRACKS & t1/=t2 => ran(occ(t1)) /\ ran(occ(t2)) = {} ) &
 UNION(t).(t:TRACKS|ran(occ(t))) = TRAINS
/*
 Sequence Order on Track Sections:
 ====1=2=3======+====1=2=3====\
               /              |
               3             TUN
               2             NEL
               1              |
                \             /
 ====3=2=1===========3=2=1====
*/
INITIALISATION occ := {topleft |-> [engine], top_middle |-> [A], bot_middle |->[B],
                       leftlink |-> <>, bot_left |-> <> }
OPERATIONS
  PassThroughTunnelDown = PRE occ(top_middle) /= <> & last(occ(top_middle))=engine THEN
        occ := occ <+ {top_middle |-> front(occ(top_middle)),
                       bot_middle |-> (engine->occ(bot_middle))}
   END;
  PassThroughTunnelUp = PRE occ(bot_middle) /= <> & first(occ(bot_middle))=engine THEN
        occ := occ <+ {bot_middle |-> tail(occ(bot_middle)),
                       top_middle |-> (occ(top_middle)<-engine)}
   END;
  Move(Seq,T1,T2,Rest) = PRE Seq : iseq1(TRAINS) & Rest : iseq(TRAINS) &
           occ(T1)= Rest^Seq & engine:ran(Seq) & T1|->T2 : link THEN
    occ := occ <+ {T1 |-> Rest, T2 |-> (Seq^occ(T2))}
  END;
  MoveRev(Seq,T1,T2,Rest) = PRE Seq : iseq1(TRAINS) & Rest : iseq(TRAINS) &
           occ(T1)= Seq^Rest & engine:ran(Seq) & T2|->T1 : link THEN
    occ := occ <+ {T1 |-> Rest, T2 |-> (occ(T2)^Seq)}
  END
END

