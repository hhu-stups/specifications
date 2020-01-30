MACHINE AVal
VARIABLES count
INVARIANT
 count:NATURAL
INITIALISATION count:=1
OPERATIONS
  Validate = BEGIN
    count :: {count+1, count+2}
  END
END
