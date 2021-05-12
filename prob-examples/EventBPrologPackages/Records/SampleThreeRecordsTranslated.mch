
MACHINE SampleThreeRecordMachineTranslated
/* Sample Record Context + Machine from Rodin Record Plugin
   Translated by pretty printing inside ProB and correcting */
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == TRUE
SETS /* enumerated */
  Mode={On,Off,Error}
CONCRETE_CONSTANTS
  Rec3,
  fld1,
  fld2,
  fld3,
  make_Rec3,
  update_Rec3_fld1,
  update_Rec3_fld2,
  update_Rec3_fld3
VARIABLES
  r1,
  r2
/* PROMOTED OPERATIONS
  getfields,
  swap */
PROPERTIES
    make_Rec3 = id((BOOL * Mode) * BOOL)
  & Rec3 = (BOOL * Mode) * BOOL
  & fld1 : Rec3 --> BOOL
  & fld2 : Rec3 --> Mode
  & fld3 : Rec3 --> BOOL
  & (fld1 >< fld2) >< fld3 : Rec3 -->> (BOOL * Mode) * BOOL
  & (fld1 >< fld2) >< fld3 : Rec3 >-> (BOOL * Mode) * BOOL
  & !(fld11,fld21,fld31).((fld11 : BOOL & fld21 : Mode) & fld31 : BOOL => fld1(make_Rec3((fld11 |-> fld21) |-> fld31)) = fld11)
  & !(fld11,fld21,fld31).((fld11 : BOOL & fld21 : Mode) & fld31 : BOOL => fld2(make_Rec3((fld11 |-> fld21) |-> fld31)) = fld21)
  & !(fld11,fld21,fld31).((fld11 : BOOL & fld21 : Mode) & fld31 : BOOL => fld3(make_Rec3((fld11 |-> fld21) |-> fld31)) = fld31)
  & update_Rec3_fld1 : Rec3 * BOOL --> Rec3
  & update_Rec3_fld2 : Rec3 * Mode --> Rec3
  & update_Rec3_fld3 : Rec3 * BOOL --> Rec3
  & !(rec31,fld11).(rec31 : (BOOL * Mode) * BOOL & fld11 : BOOL => update_Rec3_fld1(rec31 |-> fld11) = make_Rec3((fld11 |-> fld2(rec31)) |-> fld3(rec31)))
  & !(rec31,fld21).(rec31 : (BOOL * Mode) * BOOL & fld21 : Mode => update_Rec3_fld2(rec31 |-> fld21) = make_Rec3((fld1(rec31) |-> fld21) |-> fld3(rec31)))
  & !(rec31,fld31).(rec31 : (BOOL * Mode) * BOOL & fld31 : BOOL => update_Rec3_fld3(rec31 |-> fld31) = make_Rec3((fld1(rec31) |-> fld2(rec31)) |-> fld31))
INVARIANT
    r1 /= r2 & r1:Rec3
INITIALISATION
    BEGIN
         r1 := make_Rec3((TRUE |-> On) |-> FALSE)
      ||
         r2 := make_Rec3((TRUE |-> On) |-> TRUE)
    END
OPERATIONS
  getfields(x,y,z) = /* of machine SampleThreeRecordMachine */
    PRE
        x = fld1(r1)
      & y = fld2(r1)
      & z = fld3(r1)
    THEN 
         r1 := r1
    END;
  
  swap = /* of machine SampleThreeRecordMachine */
    BEGIN 
         r1,r2 := r2,r1
    END
END
