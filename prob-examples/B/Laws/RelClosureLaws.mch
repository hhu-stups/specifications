MACHINE RelClosureLaws
DEFINITIONS
 SET_PREF_MAX_OPERATIONS == 12; SET_PREF_CLPFD == TRUE;
 CLOSURE1LAW1(rx,a) == closure1(rx)[ a ] =  rx[a] \/ ((closure1(rx);rx)[a]);
 ASSOCLAW(rx,ff,ry) == (rx ; (ff ; ry)) =  ((rx ; ff) ; ry);
 COMPOSELAW(ff,ry,sss) == (ff ; ry)[sss] = ry[ff[sss]];
 GOAL == closure1(half)[1024 .. xx] = half[1024 .. xx] \/ (closure1(half) ; half)[1024 .. xx]
ABSTRACT_CONSTANTS inc,dec, decn, double, half, fin235711
PROPERTIES
  inc = %x.(x:INTEGER|x+1) &
  dec = %y.(y:INTEGER|y-1) &
  decn = %y.(y:NATURAL1|y-1) &
  double = %z.(z:INTEGER|z*z) &
  half = {x,y|y+y=x} &
  fin235711 = {2 |->3, 3|->5, 5|->7, 7|->11, 11|->13}
ASSERTIONS
  closure1(half)[{1024}] = {512,256,128,64,32,16,8,4,2,1};
  closure1(decn)[{3,5}] = 0..4;
  closure1(decn)[{3,5,1000}] = 0..999;
  closure1((half ; half))[{1024}] = {256,64,16,4,1};
  (half ; {}) = {};
  (closure1(half) ; {}) = {};
  (closure1(decn) ; {}) = {};
  ({} ; half) = {};
  ({} ; closure1(half)) = {};
  ({} ; closure1(decn)) = {};

  dom(fin235711 ; decn) <: dom(fin235711);
  dom(fin235711 ; decn) = dom(fin235711 |> NATURAL1);
  ran(fin235711 ; double) = double[ran(fin235711)];
  ran(fin235711 ; decn) = decn[ran(fin235711)];
  ran(fin235711 ; half) = half[ran(fin235711)];

  ran(fin235711 ; (double;inc)) = (double;inc)[ran(fin235711)];

  ASSOCLAW(fin235711,decn,half);
  ASSOCLAW(fin235711,decn,decn);
  ASSOCLAW(fin235711,half,half);
  ASSOCLAW(fin235711,inc,half);

  (inc;decn)[ss] = ss;

  CLOSURE1LAW1(half,ss);
  CLOSURE1LAW1(half,1..xx);
  CLOSURE1LAW1(half,1024..xx);
  CLOSURE1LAW1(decn,ss);
  /* CLOSURE1LAW1(decn,1..xx); too slow at the moment */
  CLOSURE1LAW1(decn,1..20);
  closure1(decn)[100 .. 100] = decn[100 .. 100] \/ (closure1(decn) ; decn)[100 .. 100];
 /* CLOSURE1LAW1(decn,1024..xx); too slow at the moment */
  CLOSURE1LAW1(decn,10..10);

  COMPOSELAW(decn,decn,1..xx);
  COMPOSELAW(decn,half,1..xx);
  COMPOSELAW(half,decn,1..xx);
  COMPOSELAW((half;half),(decn;decn),1..xx);
  COMPOSELAW(closure1(half),decn,1..xx);
  COMPOSELAW(half,closure1(decn),1..10);
  COMPOSELAW(half,closure1(decn),11..10);
 /* COMPOSELAW(half,closure1(decn),1..xx); too slow at the moment */
  /* COMPOSELAW(closure1(half),closure1(decn),1..xx); too slow at the moment */
  /* COMPOSELAW(half,fin235711,1..xx);  --> this enumerates ! */
  COMPOSELAW(fin235711,half,1..xx);

  card({y|y : INTEGER & (y + y = 1024 or #(yy).(yy : INTEGER & (1024 |-> yy : closure1({x,y|(x : INTEGER & y : INTEGER) & y + y = x}) & yy |-> y : {x,y|(x : INTEGER & y : INTEGER) & y + y = x})))}) = 10;

  (closure1(half) ; closure1(half))[{100}] \/ {100/2} = closure1(half)[{100}];
  {zz|(closure1(half) ; closure1(half))[{100}] \/ {zz} = closure1(half)[{100}]} = {100/2};
  (closure1(half) ; closure1(half) ; closure1(half))[{100}] \/ {100/2,100/4} = closure1(half)[{100}];
  (closure1(half) ; closure1(half) ; closure1(half); closure1(half))[{100}] = {};
  (closure1(half) ; closure1(half) ; closure1(half); closure1(half))[{256}] = {16,8,4,2,1};
  (closure1(half) ; closure1(half) ; closure1(half); closure1(half))[{256}] =
        closure1(half)[closure1(half)[closure1(half)[closure1(half)[{256}]]]];
  (closure1(half) ; closure1(half) ; closure1(half); closure1(half))[{xx}] =
        closure1(half)[closure1(half)[closure1(half)[closure1(half)[{xx}]]]]
VARIABLES xx, ss
INVARIANT
 xx:INTEGER & ss<: INTEGER
INITIALISATION xx:=1024 || ss := {}
OPERATIONS
  AddToss = ss := ss \/ {xx};
  Half(yy) = PRE yy: half[{xx}] THEN xx:=yy END;
  HalfC(yy) = PRE yy: closure1(half)[{xx}] THEN xx:=yy END
END

