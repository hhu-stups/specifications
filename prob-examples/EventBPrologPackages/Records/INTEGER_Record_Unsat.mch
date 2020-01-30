MACHINE INTEGER_Record_Unsat
SETS
 REC
DEFINITIONS SET_PREF_MAXINT == 1024
CONSTANTS make
PROPERTIES
 make: INTEGER * INTEGER >->> REC &
 make : INTEGER * INTEGER --> REC &
 make : INT * INT --> REC  /* this is wrong --> inconsistency ; is detected by ProB */
VARIABLES xx
INVARIANT
 xx:REC
INITIALISATION xx:=make(1,1)
END

