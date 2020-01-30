MACHINE LocalOperationCall
DEFINITIONS SET_PREF_ALLOW_LOCAL_OPERATION_CALLS == TRUE
SETS
 ID={aa,bb}
VARIABLES xx,yy
INVARIANT
 xx:NATURAL & yy:NATURAL
INITIALISATION xx:=1 || yy:=2
OPERATIONS
  Incxx = BEGIN xx <-- Add END;
  r <-- Add = BEGIN r:=xx+yy END;
  Incyy = BEGIN yy <-- Add END;
  SK = BEGIN Sk2 END;
  Sk2 = BEGIN skip END;
  rx,ry <-- GetXY = BEGIN rx,ry := xx,yy END
END


