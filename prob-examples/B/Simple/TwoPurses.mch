/* TwoPurses
 * Author: Michael Leuschel
 * Creation date: Mon Jun 8 2009
 */
MACHINE
    TwoPurses
CONSTANTS Coins
PROPERTIES Coins <: NAT1 &  Coins = {1,2}
DEFINITIONS
    total(pp) == SIGMA(cc,nn).(cc:Coins & nn:NAT & cc|->nn : pp | cc*nn);
    diff(pp,qq) == {cc,nn|cc:Coins & nn:NAT & nn = pp(cc)-qq(cc)};
    sum(pp,qq) == {cc,nn|cc:Coins & nn:NAT & nn = pp(cc)+qq(cc)};
    less(pp,qq) == !cc.(cc:Coins => pp(cc) <= qq(cc));
    SET_PREF_MAXINT == 4
VARIABLES purse, other
INVARIANT purse : Coins --> NAT & other : Coins --> NAT
INITIALISATION purse := Coins * {0} || other := Coins * {1}
OPERATIONS
    AddCoin(cc) = PRE cc:Coins & purse(cc)<MAXINT THEN
        purse(cc) := purse(cc)+1
    END;
    AddCoinOther(cc) = PRE cc:Coins & other(cc)<MAXINT THEN
        other(cc) := other(cc)+1
    END;
    rr <-- Pay(amount) = PRE amount:NAT1 THEN
        ANY p2 WHERE
            p2:Coins --> NAT & /* important for WD; without it we get timeout (would Daniel's inference get us a better, tighter range for enumerating ? */
            less(p2,purse) &  /* without this we get strange behaviour */
            total(diff(purse,p2)) = amount
        THEN
            purse := p2 ||
            rr := diff(purse,p2)
        END
    END;
    rr,oo <-- Transfer(amount) = PRE amount:INT & amount /= 0 THEN
        ANY p2,o2 WHERE
            p2:Coins --> NAT & o2:Coins --> NAT &
            less(p2,purse) &  /* without this we get strange behaviour */
            less(o2,other) &  /* without this we get strange behaviour */
            total(diff(purse,p2)) - total(diff(other,o2))= amount
        THEN
            purse := sum(p2,diff(other,o2)) || /* for amount=1 now generates spurious error */
            other := sum(o2,diff(purse,p2)) || 
            rr := diff(purse,p2) ||
            oo := diff(other,o2)
        END
    END;
    tt <-- Total = tt := total(purse);
    tt <-- TotalOther = tt := total(other);
    Empty = SELECT total(purse) = 0 THEN skip END
END
