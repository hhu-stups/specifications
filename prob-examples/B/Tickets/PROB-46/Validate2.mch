MACHINE Validate2
VARIABLES count
INVARIANT
 count:NATURAL
INITIALISATION count:=1
LOCAL_OPERATIONS /* clause not allowed in Abstract Machine */
  Inc = count := count + 1
OPERATIONS
  Validate = BEGIN
    count := count + 1;
    IF count < 3 THEN Inc END
  END
END

