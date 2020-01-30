MACHINE Helper
DEFINITIONS
 "ExternalFunctions.def";
 ifte(Test,ThenExpr,ElseExpr) == (%(iif).(iif=0 & (Test=TRUE)|ThenExpr) \/
                                     %(iif).(iif=0 & (Test=FALSE)|ElseExpr)) (0);
ABSTRACT_CONSTANTS
  DECIMAL_TO_INT
PROPERTIES
 DECIMAL_TO_INT : STRING <-> INTEGER
&  DECIMAL_TO_INT =
    {s,res|
      #split.(split=STRING_SPLIT(s,".") // & size(split)=2
        & res=STRING_TO_INT(STRING_APPEND(split(1),split(2))))} 

/* version which checks domain :
  DECIMAL_TO_INT = %s.(s:STRING & size(STRING_SPLIT(s,"."))=2 |
           LET split BE split = STRING_SPLIT(s,".") IN 
              STRING_TO_INT(STRING_APPEND(split(1),split(2)))
           END )
  & 
//ASSERTIONS
  DECIMAL_TO_INT("") = 123456
*/
END
