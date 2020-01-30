MACHINE TrainTorchPuzzle
SETS
 Persons={aa,bb,cc,dd}
DEFINITIONS
 GOAL == (Pleft={} & time < traindeparts);
 HEURISTIC_FUNCTION == card(Pleft)
CONSTANTS speed, traindeparts
PROPERTIES
 speed: Persons --> NATURAL1 &
 speed(aa) = 1 & speed(bb) = 2 & speed(cc) = 5 & speed(dd) = 8 &
 traindeparts = 16
/*
                _____
 o o o o      //     \\
 | | | | =*  //       \\      TRAIN
 ^ ^ ^ ^ ----   Bridge  -----
*/
VARIABLES torchLeft, Pleft, time
INVARIANT
  torchLeft:BOOL & Pleft <: Persons & time: NATURAL
INITIALISATION torchLeft := TRUE || Pleft := Persons || time := 0
OPERATIONS
   Go_Right_Over_Bridge(PP) =
    PRE PP<:Pleft & card(PP)<3 & PP /= {} & torchLeft = TRUE & time<traindeparts THEN
     torchLeft := FALSE ||
     Pleft := Pleft - PP ||
     time := time + max(speed[PP])
    END;
   Go_Left_Over_Bridge(PP) =
    PRE PP<:Persons - Pleft & card(PP)<3 & PP /= {} & torchLeft = FALSE & time<traindeparts THEN
     torchLeft := TRUE ||
     Pleft := Pleft \/ PP ||
     time := time + max(speed[PP])
    END;
   Success = PRE Pleft={} & time < traindeparts THEN skip END
END

