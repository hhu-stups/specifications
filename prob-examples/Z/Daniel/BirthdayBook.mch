MACHINE BirthdayBook
SETS
 NAME;DATE
CONSTANTS turing, June23
PROPERTIES turing:NAME & June23:DATE
DEFINITIONS INV(k,b) == (k:POW(NAME) & b:NAME+->DATE & k=dom(b))
VARIABLES known,birthday
INVARIANT INV(known,birthday)
INITIALISATION known,birthday := {turing},{turing|->June23}
OPERATIONS
  ZInitialise = BEGIN  known,birthday : (birthday={turing|->June23} & INV(known,birthday))
                END;
  AddBirthday(name,date) = PRE name:NAME & date:DATE & name/:known THEN
    birthday(name) := date || known := known \/ {name}
  END;
  ZAddBirthday(name,date) = PRE name:NAME & date:DATE & name/:known THEN
     ANY known2,birthday2 WHERE birthday2 = birthday \/ {name |-> date} & INV(known2,birthday2) THEN
       known,birthday := known2,birthday2
     END
  END
END

