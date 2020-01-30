/* Purse
 * Author: Michael Leuschel
 * Creation date: Mon Jun 8 2009
 */
MACHINE
    Purse
CONSTANTS Coins
PROPERTIES Coins <: NAT1 &  Coins = {1,2}
DEFINITIONS
    total(pp) == SIGMA(cc,nn).(cc:Coins & nn:NAT & cc|->nn : pp | cc*nn);
    diff(pp,qq) == {cc,nn|cc:Coins & nn:NAT & nn = pp(cc)-qq(cc)};
    less(pp,qq) == !cc.(cc:Coins => pp(cc) <= qq(cc));
    ASSERT_LTL == "G F ([AddCoin] or [Empty] or [Total])";
    SET_PREF_MAXINT == 2
VARIABLES purse
INVARIANT purse : Coins --> NAT
INITIALISATION purse := Coins * {0}
OPERATIONS
    AddCoin(cc) = PRE cc:Coins & purse(cc)<MAXINT THEN
        purse(cc) := purse(cc)+1
    END;
    rr <-- Pay(amount) = PRE amount:NAT1 THEN
        ANY p2 WHERE
            p2:Coins --> NAT & /* important for WD; without it we get timeout (would Daniel's inference get us a better, tighter range for enumerating ? */
            /* less(p2,purse) & */ /* without this we get strange behaviour */
            total(diff(purse,p2)) = amount
        THEN
            purse := p2 ||
            rr := diff(purse,p2)
        END
    END;
    tt <-- Total = tt := total(purse);
    Empty = SELECT total(purse) = 0 THEN skip END
END
