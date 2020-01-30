MACHINE RiverCrossing_BMC
DEFINITIONS
 OrderingSCOPE == 8;
 State == 1..OrderingSCOPE;
 firstState == 1;
 lastState == OrderingSCOPE;
 next(s) == {x|x=s+1 & x:State};
 crossRiver(s,from_,from__,to_,to__) ==
       ( obj(s) : from_ &
         from__ = ((from_ - {obj(s)}) - {Farmer}) -
                eats[from__] &
         to__ = to_ \/ {obj(s)} \/ {Farmer});
 crossRiver2(s,from_,from__,to_,to__) ==
       ( obj(s) : from_ &
         from__ = ((from_ - {obj(s)}) - {Farmer}) -
                eats[from_ - {obj(s)} - {Farmer}] &  // THIS IS MUCH MORE EFFICIENT !!
         to__ = to_ \/ {obj(s)} \/ {Farmer});
  SET_PREF_TIME_OUT == 1000
 ; TABLE == %i.(i:State | near(i) |-> far(i))
 ; GOAL == near(lastState) = {} & far(lastState) = Object
SETS
 Object = {Farmer,Fox,Chicken,Grain}
CONSTANTS eats, near, far, obj
PROPERTIES
   eats = {Fox|->Chicken, Chicken|->Grain} &
   near : State --> POW(Object) &
   far : State --> POW(Object) &
   near(firstState) = Object & far(firstState) = {} &
   near(lastState) = {} & far(lastState) = Object &
   obj: State --> Object & obj(lastState) = Farmer & // carried object, can be Farmer itself
    !(s1).({s1} <: State =>
      !(s2).( {s2} <: next(s1)
        =>
            (
             ( {Farmer} <: near(s1)
               //s1 mod 2 = 1
               => crossRiver2(s1,near(s1),near(s2),far(s1),far(s2))
             )
              &
             ( not({Farmer} <: near(s1))
               //s1 mod 2 = 0
               => crossRiver2(s1,far(s1),far(s2),near(s1),near(s2))
             )
          )))
ASSERTIONS

    !(s1).({s1} <: State =>
      !(s2).( {s2} <: next(s1)
        =>
            (
             ( {Farmer} <: near(s1)
               //s1 mod 2 = 1
               => crossRiver(s1,near(s1),near(s2),far(s1),far(s2))
             )
              &
             ( not({Farmer} <: near(s1))
               //s1 mod 2 = 0
               => crossRiver(s1,far(s1),far(s2),near(s1),near(s2))
             )
          )))
END

