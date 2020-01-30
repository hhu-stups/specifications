MACHINE RiverCrossing_BMC_simplified_v2
DEFINITIONS
 OrderingSCOPE == 2;
 State == 1..OrderingSCOPE;
 firstState == 1;
 lastState == OrderingSCOPE;
 next(s) == {x|x=s+1 & x:State};
 crossRiver(s,from_,from__,to_,to__) ==
       ( obj(s) : from_ &
         from__ = ((from_ - {obj(s)}) - {Farmer}) -
                eats[from__] &
               // eats[from_ - {obj(s)} - {Farmer}] &
         to__ = to_ \/ {obj(s)} \/ {Farmer});
 crossRiver3(s,from_,from__) ==
       ( obj(s) : from_ &
         from__ = ((from_ - {obj(s)}) - {Farmer}) -
                eats[from_ - {obj(s)} - {Farmer}] );
  SET_PREF_TIME_OUT == 20000
 ; TABLE == %i.(i:State | near(i) |-> far(i))
 ; GOAL == near(lastState) = {}
SETS
 Object = {Farmer,Fox,Chicken,Grain}
CONSTANTS eats, near, obj
PROPERTIES
   eats = {Fox|->Chicken, Chicken|->Grain} &
   near : State --> POW(Object) &
   near(firstState) = Object &
   //near(lastState) = {} & far(lastState) = Object &
   obj: State --> Object & obj(lastState) = Farmer & // carried object, can be Farmer itself
   crossRiver3(1,near(1),near(2))
ASSERTIONS
   crossRiver3(1,near(1),near(2))

END

