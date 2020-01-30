MODEL
   MyTwoDatas
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 20
INCLUDES d1.MyData2, d2.MyData2
VARIABLES x
INVARIANT x:Data
INITIALISATION
 x:= data1
OPERATIONS myset(b) = PRE b:Data THEN x:=b || d1.set(b) || d2.set(b) END ;
  r <-- get = BEGIN r:=x END;
  r1 <-- get1 = BEGIN r1 := d1.el END;
  r2 <-- get2 = BEGIN r2 := d2.el END
END