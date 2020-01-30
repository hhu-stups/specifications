MACHINE SETPREF
/* Test whether overriding from command-line works */
/* ./probcli -t -strict examples/B/FeatureChecks/DEFINITIONS/SETPREF.mch -p MAXINT 1024 -card ID 3 */
SETS
 ID
DEFINITIONS
 SET_PREF_MAXINT == 2 /* from CLI: 1024 */;
 SET_PREF_MININT == -1;
 scope_ID == 1 /* from CLI: 3 */
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  SetDif(yy) = PRE yy:ID & xx/=yy THEN xx:= yy END;
  c <-- CardID = BEGIN c:= card(ID) END;
  m <-- SizeINT = BEGIN m:= 1+MAXINT-MININT END
END

