MACHINE AssignToRecordField
SETS
 ID={aa,bb,cc}
VARIABLES xx, ff, nn
INVARIANT
  xx:struct(pid:ID, name:STRING) &
  ff : 1..2 --> struct(pid:ID, name:STRING) &
  nn:struct(user:struct(pid:ID, name:STRING), balance:NATURAL)
INITIALISATION xx:=rec(pid:aa,name:"Peter")
            || ff := [rec(pid:aa,name:"Peter1"),rec(pid:aa,name:"Peter2")]
            || nn:=rec(user:rec(pid:aa,name:"Peter"),balance:100)
OPERATIONS
  SetID(yy) = PRE yy:ID THEN xx'pid:= yy END;
  Get_pid(yy) = PRE yy:ID & xx'pid=yy THEN skip END;
//  SetID1(yy) = PRE yy:ID THEN ff(1)'pid:= yy END; // not supported
  SetNestedID(yy) = PRE yy:ID THEN nn'user'pid := yy END;
  Get_Nested_pid(yy) = PRE yy:ID & nn'user'pid=yy THEN skip END
END

