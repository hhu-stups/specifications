MACHINE DefTestStrings
DEFINITIONS
  str1 == "str1 == ; str3 == 12 ;;";
  str2 = '''
             str1 == "str1 == ;;";
             str2 = error;
''' ; 
SETS
 ID={aa,bb}
ASSERTIONS
  str1 /= str2
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

