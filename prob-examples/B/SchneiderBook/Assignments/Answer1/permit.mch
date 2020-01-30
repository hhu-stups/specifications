MACHINE           Permit

SETS              PERSON; CAR; 
                  RESPONSE ={yes, no}

VARIABLES         reg

INVARIANT         reg : PERSON >+> CAR

INITIALISATION    reg := {}

OPERATIONS

  registercar(pp,vv) =
  PRE
    pp : PERSON & vv : CAR & pp /: dom(reg) & vv /: ran(reg)
  THEN
    reg(pp) := vv
  END;

  deregister(pp) =
  PRE
    pp : PERSON
  THEN
    reg := {pp} <<| reg
  END;

ans <-- registered(pp) =
  PRE
    pp : PERSON
  THEN
    IF pp : dom(reg)
    THEN ans := yes
    ELSE ans := no
    END
  END;

vv <-- vehicle(pp) =
  PRE
    pp : PERSON
  THEN
    vv := reg(pp)
  END;

pp <-- owner(vv) =
  PRE
    vv : CAR
  THEN
    pp := reg~(vv)
  END;

change_register(pp,vv,ww) =
  PRE
    pp : PERSON & vv : CAR & ww : CAR
    & ww /: ran(reg)
  THEN
    reg(pp) := ww
  END;

vv <-- drugs_check =
  PRE
    ran(reg) /= {}
  THEN
    vv :: ran(reg)
  END

END
