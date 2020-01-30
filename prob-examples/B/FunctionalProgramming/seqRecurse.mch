MACHINE seqRecurse
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE;
  SET_PREF_MININT == -1;
  SET_PREF_MAXINT == 3
CONSTANTS qpos
PROPERTIES 

qpos = {x,ss,p| x:INTEGER & ss:seq(INTEGER) & p:INTEGER &  
                (size(ss)=0 => p=-2) &
                (size(ss)=1 & x/=first(ss) => p=-1) &
                (size(ss)>0 & x=first(ss) => p=1)    &
                (size(ss)>1 & x/=first(ss) => p=qpos(x,tail(ss))+1 )
        } &
qpos: INTEGER*seq(INTEGER) <-> INTEGER 
VARIABLES myseq
INVARIANT myseq: seq(INTEGER)
INITIALISATION myseq := <>
OPERATIONS
  pos <-- test0(x) = PRE x:NATURAL & x=10 THEN pos := qpos(x,[2,4,8,10]) END;
  pos <-- test1(x) = PRE x:NATURAL & x=2 THEN pos := qpos(x,[2,4,8,10]) END;
  pos <-- test2(x) = PRE x:NATURAL & x=1 THEN pos := qpos(x,[1]) END;
  pos <-- test3(x) = PRE x:NATURAL & x=2 THEN pos := qpos(x,[2]) END;
  pos <-- test4(x) = PRE x:NATURAL & x=1 THEN pos := qpos(x,[0]) END;
  pos <-- test5(x) = PRE x:NATURAL & x=2 THEN pos := qpos(x,[1]) END;
  add(x) = PRE x:INTEGER THEN myseq :=  x -> myseq END;
  r <-- getqpos(x) = PRE x:INT THEN r := qpos(x,myseq) END
END

