MACHINE LetPredMultipleVariables
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set1 =  LET ii,jj BE ii = ID \ {iv} & 
                       jj = card(ii) // no longer allowed
            IN  xx:: ii END;

  Set2(yy) = PRE LET ii BE ii = ID \ {iv} IN LET jj BE jj = card(ii) IN yy:ii END END
             THEN xx:= yy END
/*;
  Set3(yy) = PRE LET ii,jj BE ii = ID \ {iv} & jj = card(ii) IN yy:ii END
             THEN xx:= yy END
*/
END

