MODEL
   FileTransfer0
SETS DATA
CONSTANTS empty
PROPERTIES empty:DATA
VARIABLES sender,receiver, finished
INVARIANT
 sender:DATA & receiver:DATA & finished:BOOL & 
 (finished = TRUE => sender = receiver)
INITIALISATION
  sender := empty || receiver := empty || finished := FALSE
OPERATIONS
  start_transfer(d) = PRE d:DATA THEN finished:=FALSE || sender:=d END;
  send_one_block = PRE finished=FALSE THEN skip END;
  send = PRE finished=FALSE THEN finished := TRUE || receiver := sender END
END