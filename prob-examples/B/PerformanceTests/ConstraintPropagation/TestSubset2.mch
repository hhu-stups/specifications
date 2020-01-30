MACHINE TestSubset2
SETS SA = {s1,s2,s3,s4,s5,s6,s7}
DEFINITIONS
 scope_SA == 7
CONSTANTS a,b,c,d,e,f,g
PROPERTIES
 a <: SA &   g /={} &  card(g)=6 & /* Equality rather than >5 */
 g <: a & a <: b  & b <: c & c <<: d & d <: e & e <: f
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
                    ASSERT(TRUE=FALSE) THEN rr := FALSE END
                END
END