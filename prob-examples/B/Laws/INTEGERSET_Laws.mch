MACHINE INTEGERSET_Laws
/* Laws about predefined sets of integers */
DEFINITIONS
  SET_PREF_MAXINT == 4;
  SET_PREF_MININT == -1;
  SET_PREF_MAX_INITIALISATIONS == 20;
  law1 == (NAT = NAT1 \/ {0});
  law2 == (NAT1 = NAT - {0});
  law3 == (NAT1 - NAT = {});
  law4 == (NAT - NAT1 = {0});
  law5 == (NAT1 <<: NAT & NAT1 <<: INT);
  law6 == (NAT <<: INT & NAT <<: INTEGER);
  law7 == ( {x|x:NAT1} <<: {x|x:NAT} );
  law8 == ( {x|x:NAT} <<: {x|x:INT} );
  law9 == ( {x|x:NAT1} <: {x|x:INT} );
  law10 == ( {x|x:NAT1} \/ {0} = {x|x:NAT} );
  law11 == !y.(y:NAT1 => y:NATURAL1);
  law12 == !y.(y:INT => y:INTEGER);
  law13 == (MAXINT+1 /: INT);
  law14 == (MININT-1 /: INT);
  law15 == (MAXINT+1 : NATURAL);
  laws16 == (0:NAT & 0:INT & 0/:NAT1 & 0:NATURAL & 0/:NATURAL1 &
             MININT:INT & MININT:INTEGER &
             MAXINT:INT & MAXINT:NAT & MAXINT:NAT1 &
             MAXINT:NATURAL & MAXINT:NATURAL1);
  laws17 == (MAXINT-1 : NAT & 1:NAT & 1:NAT1 & 1:INT); /* supposing MAXINT>0 */
  laws18 == (MININT /: NAT & MININT /: NAT1 &
             MININT /:NATURAL & MININT/:NATURAL1);          /* supposing MININT<0 */
  laws19 == ((1=1 <=> 1:INTEGER) & (1=0 <=> 1 /: INTEGER));
  laws20 == (NAT <<: NATURAL & NAT <<: INTEGER & INT <<: INTEGER &
             NAT1 <<: NAT & NAT1 <<: NATURAL & NAT1 <<: NATURAL1 & NAT1 <<: INTEGER &
             NATURAL1 <<: NATURAL & NATURAL1 <<: INTEGER &
             NATURAL <<: INTEGER);
  laws20b == (NAT <: NATURAL & NAT <: INTEGER & INT <: INTEGER &
             NAT1 <: NAT & NAT1 <: NATURAL & NAT1 <: NATURAL1 & NAT1 <: INTEGER &
             NATURAL1 <: NATURAL & NATURAL1 <: INTEGER &
             NATURAL <: INTEGER);
  laws21 == (INT /<<: NAT & INT /<<: NATURAL & INT /<<: NAT1 & INT /<<: NATURAL1 & INT /<<: INT &
             NAT /<<: NAT &
             NATURAL1 /<<: NATURAL1 & NATURAL1 /<<: NAT1 & NATURAL1 /<<: NAT &
             NATURAL /<<: NATURAL & NATURAL /<<: NATURAL1 & NATURAL /<<: INT &
                   NATURAL /<<: NAT & NATURAL /<<: NAT1 &
             not(INT <<: NAT) & not(INT <<: NATURAL));
  laws22 == (NAT<:NAT & INT <:INT & NATURAL <:NATURAL & INTEGER <: INTEGER & NAT1 <: NAT1 &
             NATURAL1 <:NATURAL1);
  laws23 == ({NAT} = {NAT} & {INT,NAT} = {NAT,INT} & {INT} /= {NAT} &
             {NAT} \/ {INT} = {NAT,INT} );
  laws24 == (INT /<: NAT & INT /<: NATURAL & INT /<: NAT1 & INT /<: NATURAL1 &
             NATURAL1 /<: NAT1 & NATURAL1 /<: NAT &
             NATURAL /<: NATURAL1 & NATURAL /<: INT &
             NATURAL /<: NAT & NATURAL /<: NAT1 &
             not(INT <: NAT) & not(INT <: NATURAL));
  laws25 == (0..MAXINT <: NAT & 1..MAXINT <<: NAT & 1..(MAXINT-1) <<: NAT &
             0..MAXINT /<<: NAT);
  laws26 == (1..MAXINT <: NAT1 & 1..MAXINT /<<: NAT1 & 2..MAXINT <<: NAT1 &
             0..MAXINT <: INT & MININT..1 <<: INT);
  laws27 == (1..2 <: 1..2 & 1..1 <<: 1..2 & 1..1 <: 1..2 &
             1..2 <: 1..3 & 1..2 <<: 1..3 & 1..2 <: 0..3 & 1..2 <<: 0..3 );
  laws28 == (2..1 <: 1..2 & 2..1 <<: 1..2 & 2..1 <<: 1..1 &
             2..1 <<: 3..3 & 2..1 <: 3..2 & 2..1 /<<: 3..2 &
             {x|x:INT & x>=2 & x<=1} <<: {3} &
             1..0 <: NAT & 1..0 <<: NAT & 1..0 <: INT & 1..0 <<: INT &
             1..0 <: NAT1 & 1..0 <<: NAT1 &
             1..0 = {} & 1..0 <: 2..3 & 1..0 <<: 2..3);
  laws29 == (min(NAT) = 0 & min(NAT1) = 1 & min(INT) = MININT &
             max(NAT)=MAXINT & max(NAT1) = MAXINT & max(INT) = MAXINT);
  laws30 == ( (1..1000)\/{0} = 0..1000 &
              (1..1000)-{1} = 2..1000 &
              (1..500 \/ 501..1000) = 1..1000 &
              (1..500 \/ 500..1000) = 1..1000 &
              (1..500 \/ 2..1000) = 1..1000 &
              (1..500 \/ 0..1000) = 0..1000 &
              (1..999 \/ 0..200) = 0..999 &
              (1..999 \/ 1000..999) = 1..999 &
              (1..999 \/ 1000..1000) = 1..1000 &
              (1..500) \/ {501} \/ (503..1000) = (1..1000) - {502});
  laws31 == (NATURAL /\ INTEGER = NATURAL &
             NATURAL1 /\ NATURAL = NATURAL1 &
             NATURAL /\ NAT = NAT &
             NATURAL /\ INT = NAT &
             NATURAL1 - NATURAL = {} &
             NATURAL - NATURAL1 = {0} &
             NAT - NATURAL1 = {0} &
             NATURAL - {0} = NATURAL1 &
             NATURAL1 - {0} = NATURAL1 &
             NATURAL - {0} /= NATURAL &
             INTEGER /\  {1} = {1} &
             NATURAL /\  {1} = {1} &
             NATURAL1 /\  {1} = {1} &
             (-100..100) - NATURAL1 = -100..0 &
             (-100..100) - INTEGER = {}&
             (-100..100) - NATURAL = -100..-1 &
             {100} /\ NATURAL = {100} &
              100..1000 /\ NATURAL1 = 100..1000 &
             (9..9999999)-{9} = 10..9999999 &
             (9..9999999)/\{9}  = {9} &
             (NATURAL - (0..3)) /\ -1000..100000 = (4 .. 100000) &
             (NATURAL - (0..3)) /\ 5..100000 = (5 .. 100000) &
             (NATURAL - (0..3)) -  (4..100000) = (NATURAL - (0..100000)) &
             NATURAL - (0..3) /= {} &
             (NATURAL - (0..3) ) = {x|x:INTEGER & 4 <= x} &
             {x|x>=10} /\  {x|x:INTEGER & 99999 >= x} = 10..99999 &
             not({x|x : INT & x >= 10} /\ {x|x : INT & 99999 >= x} = 10 .. 999998)
            );
  laws == (law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 & law9 &
           law10 & law11 & law12 & law13 & law14 & law15 & laws16 & laws17 & laws18 & laws19 &
           laws20 & laws20b & laws21 & laws22 & laws23 & laws24 &
           laws25 & laws26 & laws27 & laws28 & laws29 & laws30 & laws31 &
           #(xy).(xy:(iv-iv2))
           );
CONSTANTS iv, iv2
PROPERTIES
 iv = INTEGER & iv2 = NAT
VARIABLES xx
INVARIANT
 xx:(iv-iv2) &
 laws
ASSERTIONS laws29
INITIALISATION
  xx::(iv-iv2) /\ (-2..7)
OPERATIONS
  lawsok = PRE laws THEN skip END;
  r <-- Get = BEGIN r:= xx END;
  Set(yy) = PRE yy:iv-iv2 /\ (-2..7) THEN xx:= yy END
END

