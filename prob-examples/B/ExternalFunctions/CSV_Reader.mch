MACHINE CSV_Reader
DEFINITIONS
 EXTERNAL_FUNCTION_READ_CSV(T) == STRING --> T;
 READ_CSV(file) == {};
 EXTERNAL_FUNCTION_READ_CSV_SEQUENCE(T) == STRING*BOOL*BOOL --> seq(T);
 READ_CSV_SEQUENCE(file,SkipLine1,AllowExtraColumns) == {};
SETS
 ID={a,b,c,d,e,f,g,h,i,j,k}
CONSTANTS table, enumtable, table3, table3v2, table4
PROPERTIES
 table : INTEGER <-> STRING &
 table = READ_CSV("csv_simple.csv") &
 enumtable : INTEGER <-> ID &
 enumtable = READ_CSV("csv_simple.csv") & // check that we can also read in ID instead of STRING
 table3 : POW(INTEGER*ID*STRING) &
 table3 = READ_CSV("csv_simple3.csv") &
 table3v2 : POW(INTEGER*(ID*STRING)) &  // check that we can read in if the tuples are ordered differently
 table3v2 = READ_CSV("csv_simple3.csv") &
 table4 : seq(INTEGER*ID*STRING) &  // check that we can read in table as sequence
 table4 = READ_CSV_SEQUENCE("csv_simple3.csv",FALSE,FALSE)
VARIABLES xx
INVARIANT
 xx:dom(table)
INITIALISATION xx:=1
OPERATIONS
  res <-- Vals = BEGIN res := table[{xx}] END;
  Inc = SELECT xx+1 : dom(table) THEN xx:=xx+1 END;
  Convert(aa,ii,S) = PRE (ii,aa) : enumtable & (ii,aa,S) : table3  THEN
    skip
  END
END

