MACHINE InitIF_Fails
SETS
 ID={aa,bb}
DEFINITIONS SET_PREF_TRACE_INFO == TRUE
CONSTANTS iv
PROPERTIES
 iv = aa
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION 
   xx:=iv ;
   IF xx=iv THEN yy :: {iv}-{xx} 
            ELSE yy := iv END
END

