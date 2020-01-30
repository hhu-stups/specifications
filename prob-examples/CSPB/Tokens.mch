MACHINE     Tokens

SETS
    OFFICE = {o1,o2 } ; 
    CUST = {c1,c2 }

VARIABLES  tokens

INVARIANT  tokens : CUST +-> NAT

INITIALISATION tokens := {}
    
OPERATIONS


AddCust( cc ) = 
    PRE cc:CUST  &  cc/:dom(tokens)
    THEN tokens := tokens \/ { cc |-> 0 }
    END;

RemCust( cc ) = 
    PRE cc:dom(tokens)
    THEN tokens := {cc} <<| tokens 
    END;

AllocToken( cc )  =
    PRE cc:dom(tokens)
    THEN
        tokens(cc) := tokens(cc)+1
    END;

ReqToken( cc, pp ) =
    PRE cc:dom(tokens)  &  pp:OFFICE 
    THEN
        skip
    END;

toks <-- CollToken( cc, pp ) =
    PRE cc:dom(tokens) &  pp:OFFICE
    THEN
        IF tokens(cc)=0 
        THEN toks := 0
        ELSE    ANY nn WHERE  nn:NATURAL &
                1<=nn & nn<=tokens(cc)
                /* nn : (1..tokens(cc)) */
            THEN  toks:=nn   ||  tokens(cc) := tokens(cc) - nn
            END
        END
    END


END
    
