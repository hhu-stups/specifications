MACHINE SetBecomeElementOf
SETS
 ID={aa,bb,cc}
DEFINITIONS
 SET_PREF_SYMBOLIC == TRUE
VARIABLES xx,yy,f
INVARIANT
 xx:ID & yy:ID & f: ID +-> ID
INITIALISATION xx:=bb || yy:=aa || f:= {}
OPERATIONS
  rx,ry <-- Get = BEGIN rx,ry := xx,yy END;
  Set = BEGIN xx :: {i| i:ID & i/=bb} END; /* used to have pending co-routine due to missing enumeration of xx in SYMBOLIC mode; fixed 13.3.2013 */
  Set2 = BEGIN xx,yy :: {i| i:ID & i/=xx}*{i| i:ID & i/=yy} END /* ;
 this syntax is not allowed  Setf = BEGIN f(xx) :: ID END */
END

