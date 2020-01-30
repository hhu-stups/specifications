MACHINE ExistentialTest
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:= aa
OPERATIONS
  rr <-- GetAll = BEGIN rr := {yy | yy:ID & #zz.(zz:ID & zz /=yy) } END;
  rr <-- Get2 = BEGIN rr := card({yy | yy:ID & #zz.(zz:ID & zz /=yy) }) END;
  rr <-- GetXX = BEGIN rr := {yy | yy:ID & #zz.(zz:ID & zz =yy & zz=xx) } END;
  rr <-- GetBB = BEGIN rr := {yy | yy:ID & #zz.(zz:ID & zz|->yy : {(aa|->bb)} ) } END;
  rr <-- GetBB2 = BEGIN rr := {yy | yy:ID & #zz.(zz:ID & zz|->yy : {(bb|->bb)} ) } END; 
  rr <-- GetBB3 = BEGIN rr := {yy | yy:ID & #zz.(zz:ID & yy|->zz : {(bb|->bb)} ) } END;
  rr <-- Get1_v2 = BEGIN rr := card({yy,zz | yy:ID & zz:ID & yy|->zz : {(aa|->bb)}  }) END;
  Test = PRE #zz.(zz:ID & xx|->zz : {(aa|->aa)} ) THEN skip END;

  rr <-- Get1 = BEGIN rr := card({yy | yy:ID & #zz.(zz:ID & yy|->zz : {(aa|->bb)} ) }) END
END

