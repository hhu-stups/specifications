MACHINE TrainTrack
// A small example to show how one can use LibrarySVG to flexibliy visualise
// train track zones,...
SETS
  TTDS = {ttd1,ttd2,ttd3}
CONSTANTS
  TrackElementNumber, TRACK, TTD_TrackElements, train_length
PROPERTIES
  TrackElementNumber : NATURAL1
& TRACK = 0..TrackElementNumber

& TTD_TrackElements : TTDS --> FIN1(TRACK)

& TrackElementNumber = 30
& TTD_TrackElements = {ttd1 |-> 0..10 , ttd2 |-> 11..25 , ttd3 |-> 26..30}
& train_length = 2
VARIABLES
  occ,
  train_rear_end
INVARIANT
  occ <: TTDS &
  train_rear_end : TRACK
INITIALISATION occ := {} || train_rear_end := 0
OPERATIONS
  TTD_Occupied(ttd) = PRE ttd:TTDS \ occ THEN
    occ := occ \/ {ttd}
  END;
  TTD_Free(ttd) = PRE ttd:occ THEN
    occ := occ \ {ttd}
  END;
  TrainMoveForward = PRE train_rear_end+1:TRACK THEN
    train_rear_end := train_rear_end + 1
  END
DEFINITIONS
 "LibrarySVG.def"; // enable to use the external functions in the VisB json file
  OCC_TE == union(ran(%tt.(tt:occ|TTD_TrackElements(tt))));
  FREE_TE == union(ran(%tt.(tt/:occ|TTD_TrackElements(tt))))
END