MACHINE MinSet_NoDeadlock
CONSTANTS NN, II
PROPERTIES
NN >= 0 & II <: 0..NN & NN<4
VARIABLES ss,ww,zz
INVARIANT
ss <: 0..NN & ww : 0..NN & zz : 0..NN & ww : ss
INITIALISATION ss,ww,zz := II\/{NN},NN,NN
OPERATIONS
 acc = ANY xx WHERE ww : ss & xx : ss & xx < ww THEN ww,ss:= xx,ss-{ww} END;
 rej = ANY xx WHERE ww : ss & xx : ss & xx > ww THEN ss:= ss-{xx} END;
 get = SELECT ss = {ww} THEN zz:= ww END
END
