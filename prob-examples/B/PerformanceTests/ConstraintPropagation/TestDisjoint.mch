MACHINE TestDisjoint
SETS SA
DEFINITIONS
 scope_SA == 7
CONSTANTS a,b,c,d,e,f,g
PROPERTIES
 a <: SA &   g /={} & a /= {} & b /= {} & c /= {} & d/= {} & e /= {} & f /= {} &
 a /\ b = {} & a /\ c = {} & a /\ d = {} & a /\ e = {} & a /\ f = {} &  a /\ g = {} &
 b /\ c = {} & b /\ d = {} & b /\ e = {} & b /\ f = {} &  b /\ g = {} &
 c /\ d = {} & c /\ e = {} & c /\ f = {} &  c /\ g = {} &
 d /\ e = {} & d /\ f = {} &  d /\ g = {} &
 e /\ f = {} & e /\ g = {} &
 f /\ g = {}
OPERATIONS
 cc <-- card_a = BEGIN cc:= card(a) END;
 cc <-- card_b = BEGIN cc:= card(b) END;
 cc <-- card_c = BEGIN cc:= card(c) END;
 cc <-- card_d = BEGIN cc:= card(d) END;
 cc <-- card_e = BEGIN cc:= card(e) END;
 cc <-- card_f = BEGIN cc:= card(f) END;
 cc <-- card_g = BEGIN cc:= card(g) END;
 ia <-- inall = ANY el WHERE el:SA & el: a /\ b /\ c /\ d /\ e /\ f /\ g THEN ia := el END;
 rr <-- check = IF g = a /\ b /\ c /\ d /\ e /\ f /\ g THEN
                    rr := TRUE
                ELSE
                    rr := FALSE
                END
END