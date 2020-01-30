MACHINE B_Spec
VARIABLES nr_msgs
INVARIANT
 nr_msgs:NATURAL
INITIALISATION nr_msgs:=0
OPERATIONS
  in = SELECT nr_msgs <10 THEN nr_msgs := nr_msgs + 1 END;
  out = SELECT nr_msgs >0 THEN nr_msgs := nr_msgs -1 END
END

