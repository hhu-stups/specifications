MACHINE LoopByTwiceSeqComp
INCLUDES M1
OPERATIONS
 Set =
 VAR step IN
   step := 1;
     WHILE xx+2*step <= k
   DO
       step <-- AddTwice(step)
   INVARIANT xx : 1..k
   VARIANT k - xx
   END
 END;
 r <-- Get = BEGIN r:= xx END
END

/*
in M1 we have:
res <-- AddTwice(aa) = PRE xx+2*aa <= k THEN
       res := aa+aa;
       xx := xx+aa+aa
    END
    */
