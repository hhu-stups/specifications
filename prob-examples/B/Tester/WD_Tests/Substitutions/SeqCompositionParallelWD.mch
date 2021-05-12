
MACHINE
    SeqCompositionParallelWD
ABSTRACT_VARIABLES
      xx, yy
INVARIANT xx : NAT & yy:NAT
INITIALISATION xx := 0 || yy := 0
OPERATIONS
     Add3 = PRE xx < 100 THEN xx := xx + 3 END ;
     Del3 = PRE xx > 2 THEN xx := xx - 3 END ;
     res <-- Inc = PRE xx<100 THEN xx := xx + 1 ; res := 100/xx END; // OK
     res <-- Dec = PRE xx>0 THEN xx := xx - 1 ; res := 100/xx END; // not-OK
     res <-- Inc1 = PRE xx<100 & yy<100 THEN 
                BEGIN xx := xx + 1 || yy := yy+1 END ; res := 100/xx  // OK
     END;
     res <-- Inc2 = PRE xx<100 & yy<100 THEN 
                BEGIN xx := xx + 1 || yy := yy+1 END ; res := 100/yy  // OK
     END
END
