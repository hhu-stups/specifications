MACHINE base
SETS
    /* a: 8:30  - 10:00
     * b: 10:30 - 12:00
     * c: 12:30 - 14:00
     * d: 14:30 - 16:00
     * e: 16:30 - 18:00
     * f: 18:30 - 20:00
     *
     * 1: Mon
     * 2: Tue
     * ...
    */
    SLOTS = {a1,a2,a3,a4,a5,
             b1,b2,b3,b4,b5,
             c1,c2,c3,c4,c5,
             d1,d2,d3,d4,d5,
             e1,e2,e3,e4,e5,
             f1,f2,f3,f4,f5,
             g1,g2,g3,g4,g5,
             unknown};

    PRIORITIES={P,W,S,F}

CONSTANTS
  DAYS,
  same_day
PROPERTIES
  DAYS = {{a1,b1,c1,d1,e1,f1,g1},
          {a2,b2,c2,d2,e2,f2,g2},
          {a3,b3,c3,d3,e3,f3,g3},
          {a4,b4,c4,d4,e4,f4,g4},
          {a5,b5,c5,d5,e5,f5,g5}}
  &
  same_day = %(a,b).(a : SLOTS & b : SLOTS| bool(#(s).(s : DAYS & {a,b} <: s)))
END
