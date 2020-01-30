MACHINE ChemicalElements
DEFINITIONS
 EXTERNAL_FUNCTION_READ_CSV(T) == STRING*BOOL*BOOL --> T;
 READ_CSV(file,SkipLine1,AllowExtraColumns) == {}
SETS
 ID={a,b,c,d,e,f,g,h,i,j,k}
ABSTRACT_CONSTANTS get_name, get_symbol, get_number
CONSTANTS eltable
PROPERTIES
 eltable : POW(STRING*STRING*INTEGER*STRING) &
 eltable = READ_CSV("elementdata.csv",TRUE,TRUE) & // we skip line 1 and extra columns
 get_name = %(n,s,a,w).((n,s,a,w):eltable|n) &
 get_symbol = %(n,s,a,w).((n,s,a,w):eltable|s) &
 get_number = %(n,s,a,w).((n,s,a,w):eltable|a)
VARIABLES xx
INVARIANT
 xx:ran(get_number)
INITIALISATION xx:=1
OPERATIONS
  Inc = SELECT xx+1 : ran(get_number) THEN xx:=xx+1 END;
  name,symbol <-- Convert(el) = PRE el:eltable & get_number(el)=xx  THEN
    name,symbol := get_name(el),get_symbol(el)
  END
END

