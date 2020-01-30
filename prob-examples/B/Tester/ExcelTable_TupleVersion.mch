MACHINE ExcelTable_TupleVersion
/*
   A    B       C
   ID   WEIGHT  LENGTH
   a    22      100
   b    33      99

*/
DEFINITIONS TUPLETYPE == (STRING*INTEGER*INTEGER)
ABSTRACT_CONSTANTS ID, WEIGHT, LENGTH
CONSTANTS Excel
PROPERTIES
  Excel : POW(TUPLETYPE) &  /* Typing */

  Excel = { /* the Data */
  ("a",22,100),
  ("b",33,99) }
&
  /* the generated projection functions */
  ID = %(a,b,c).((a,b,c):TUPLETYPE|a) /* (prj1(STRING*INTEGER,INTEGER) ; prj1(STRING,INTEGER)) */
&
  WEIGHT = %(a,b,c).((a,b,c):TUPLETYPE|b) /* (prj1(STRING*INTEGER,INTEGER) ; prj2(STRING,INTEGER)) */
&
  LENGTH = %(a,b,c).((a,b,c):TUPLETYPE|c) /* (prj2(STRING*INTEGER,INTEGER)) */
  
ASSERTIONS /* not part of the translation */
  ID[Excel] = {"a","b"};
  WEIGHT[Excel] = {22,33};
  LENGTH[Excel] = {100,99};
  not( !row.(row:Excel => WEIGHT(row)*3 < LENGTH(row)) )
END

