MACHINE
    accounting
SETS
    ACCOUNT 
VARIABLES
    accounts,
    balance,
    limit
INVARIANT
     accounts <: ACCOUNT
   & balance: accounts --> INTEGER
   & limit: accounts +-> INTEGER
   
   & ( SIGMA acc.(acc:accounts | balance(acc)) ) = 0
   
   & !(acc,lim).( acc:accounts & lim:INT & (acc|->lim):limit => balance(acc) >= lim)
   
INITIALISATION
    accounts,balance,limit := {},{},{}
    
OPERATIONS
    account <-- newaccount =
    ANY new
    WHERE new : ACCOUNT - accounts
    THEN accounts := accounts\/{new}
      || balance(new) := 0
      || account := new
    END;
    
    bal <-- getbalance(account) =
    PRE account:ACCOUNT & account:accounts
    THEN bal := balance(account)
    END;
    
    transfer(amount,src,dst) =
    PRE amount:NATURAL & src:ACCOUNT & dst:ACCOUNT &
        src:accounts & dst:accounts & src/=dst 
        & (src:dom(limit) => (balance(src)-amount >= limit(src)))
    THEN balance := balance <+ {src |-> balance(src)-amount,  dst |-> balance(dst)+amount}
    END;
    
    setlimit(lim,account) =
    PRE lim:INTEGER & account:ACCOUNT & account:accounts & lim <= balance(account)
    THEN limit(account) := lim
    END;
    
    clearlimit(account) =
    PRE account:ACCOUNT & account:dom(limit)
    THEN limit := {account} <<| limit
    END
END
