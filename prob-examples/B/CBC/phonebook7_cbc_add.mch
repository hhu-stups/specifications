MACHINE phonebook7_cbc_add
 /* why is this so much more (5 times) efficient than -cbc add on phonebook7.mch ?? */
SETS
	Name  ; Code = {c1,c2,c3,c4}

CONSTANTS db, active, activec,
          nn,cc,
          db2, active2, activec2

DEFINITIONS
    scope_Name == 1..4;
    scope_Code == 1..4

PROPERTIES
		db : Name +-> Code & active:POW(Name) & activec:POW(Code) &
                dom(db) = active & ran(db) = activec
  &

/* add */
	/* PRE */
		nn:Name & cc:Code  & nn /: active 
 /*	THEN */ &
		db2= db \/ { nn |-> cc} & active2 = active \/ {nn} & activec2 = activec \/ {cc}

  &

	not(
	db2 : Name +-> Code & /* active:POW(Name) & activec2:POW(Code) & */
                dom(db2) = active2 & ran(db2) = activec2)
END
