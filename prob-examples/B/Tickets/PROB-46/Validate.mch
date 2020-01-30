MACHINE Validate
VARIABLES count
INVARIANT
 count:NATURAL
INITIALISATION count:=1
OPERATIONS
  Validate = BEGIN
    count := count + 1;
    IF count < 3 THEN Validate END  /* call to opeation in same machine not allowed */
  END
END

