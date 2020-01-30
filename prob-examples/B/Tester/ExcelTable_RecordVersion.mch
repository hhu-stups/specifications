MACHINE ExcelTable_RecordVersion
/*
   A    B
   ID   WEIGHT
   a    22
   b    33

*/
ABSTRACT_CONSTANTS ID, WEIGHT
CONSTANTS Excel
PROPERTIES
  Excel : POW(struct(fID:STRING,fWEIGHT:INTEGER)) &  /* Typing */

 
  Excel = { /* the Data */
  rec(fID:"a",fWEIGHT:22),
  rec(fID:"b",fWEIGHT:33) }
&
  /* the generated projection functions */
  ID = %x1.(x1:struct(fID:STRING,fWEIGHT:INTEGER)|x1'fID)
&
  WEIGHT = %x2.(x2:struct(fID:STRING,fWEIGHT:INTEGER)|x2'fWEIGHT)

ASSERTIONS /* not part of the translation */
  ID[Excel] = {"a","b"}
END
