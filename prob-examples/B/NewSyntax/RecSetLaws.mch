MACHINE RecSetLaws

SETS
   setField1 = {el1,el2};
   setField2 = {f2el1,f2el2}

PROPERTIES
  card(struct(f1:1..2,f2:1..2)) = 4 &
  card(struct(f1:1..2,f2:1..2) \/ {rec(f1:3,f2:1)}) =5

VARIABLES
    SS, TT, VV

DEFINITIONS
  CARDI == 1..2;
  setX == struct(fill:setField2, cardinality:CARDI, col:setField1, shape:setField1 );
  law1 ==  (SS \/ SS = SS  &  SS = SS \/ {}  &  SS = SS /\ SS  &  SS = SS \ {});
  law2 == (SS /\ {} = {} & {} = SS \ SS &  ({} \ SS = {}));
  law3 == (SS \/ TT = TT \/ SS   &  SS /\ TT = TT /\ SS);
  law4 == (( SS \/ (TT \/ VV) = (SS \/TT) \/ VV) & ( SS /\ (TT /\ VV) = (SS /\ TT) /\ VV));
  law5 == ( SS \/ (TT /\ VV) = (SS \/ TT) /\ (SS \/ VV));
  law6 == ( SS /\ (TT \/ VV) = (SS /\ TT) \/ (SS /\ VV));
  law7 == ( (SS /\ TT) \/ (SS \ TT) = SS);
  law8 == ((SS \ TT) /\ TT = {});
  law9 == (SS \ (TT \ VV) = (SS \ TT) \/ (SS /\ VV));
  law10 == ((SS \ TT) \ VV = (SS \ (TT \/ VV)));
  law11 == (SS \/ (TT \ VV) = (SS \/ TT) \ (VV \ SS));
  law12 == (SS /\ (TT \ VV) = (SS /\ TT) \ VV);
  law13 == ((SS \/ TT) \ VV = (SS \ VV) \/ (TT \ VV));
  law14 == (SS \ (TT /\ VV) = ( SS \ TT) \/ (SS \ VV));

  orderlaw1 == (SS <: SS \/ TT & TT <: SS \/ TT);
  orderlaw2 == ( ( SS <: VV & TT <: VV) => (SS\/TT <: VV));
  orderlaw3 == (SS /\ TT <: SS & SS /\ TT <: TT);
  orderlaw4 == ( (VV <: SS & VV <: TT) => (VV <: SS /\ TT));

  setcomprlaw1 == ( {xx1 | xx1: SS & xx1:TT} = SS /\ TT);
  setcomprlaw2 == ( {xx2 | xx2: setX & (xx2: SS or xx2:TT)} = SS \/ TT);
  setcomprlaw3 == ( {xx3 | xx3: setX & xx3: SS & (xx3: TT or xx3:VV)} = SS /\ (VV \/TT));
  setcomprlaw4 == ( {xx4 | xx4: SS & not(xx4:TT)} = SS \ TT);
  GOAL == setcomprlaw4;


  foralllaw1 == (!xx.(xx:SS & xx:TT => xx: SS /\ TT));
  foralllaw2 == (!xx.(xx:SS & not(xx:TT) => (xx: SS \ TT & xx /: TT)));

  existslaw1 == (#xx.(xx:SS & xx:TT & xx:VV) => not(SS /\ TT /\ VV = {}));
  existslaw2 == (#xx.(xx:SS & xx/:TT) => not(SS \/ TT = TT) & not(SS \ TT = {}));


  /* laws for <<: and /<<: */
  orderlaw5 == ( SS <<: VV  or SS /<<: VV );
  orderlaw6 == ( (VV <<: SS & SS <: TT) => (VV <<: TT));
  orderlaw7 == ( (VV <: SS & SS <<: TT) => (VV <<: TT));
  otherlaw1 == ( (SS <: VV & SS /<<: VV) => SS = VV);
  otherlaw2 == ( (SS <<: VV ) => SS /= VV);
  otherlaw3 == ( (SS = VV ) => SS /<<: VV);
  otherlaw4 == ( SS <<: VV  => SS <: VV);
  otherlaw5 == ( SS <<: VV => #xx.(xx:VV & xx/:SS));

  cardlaw1 == (SS <<: VV => (card(SS) < card(VV)));
  cardlaw2 == (SS <: VV => (card(SS) <= card(VV)));
  cardlaw3 == (card(SS) < card(VV) => (VV /<: SS));
  cardlaw4 == (card(SS \/ VV) <= (card(SS) + card(VV)));

  difflaw1 == (SS /\ VV = {}  <=> SS <: setX - VV);
  difflaw2 == (SS \ VV = SS-VV)

INVARIANT
   SS : FIN(setX) & TT : FIN(setX) & VV : FIN(setX) &
    law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 &
    law9 & law10 & law11 & law12 & law13 & law14 &
    orderlaw1 & orderlaw2 & orderlaw3 & orderlaw4 &
    setcomprlaw1  & setcomprlaw2 & setcomprlaw3 & setcomprlaw4 &
    foralllaw1 & foralllaw2 & existslaw1 & existslaw2 &

    orderlaw5 & orderlaw6 & orderlaw7 &
    otherlaw1 & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 &

    cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4
    &
    difflaw1 & difflaw2
    &

    (SS<<:VV or not(SS<<:VV)) & not(SS<<:VV & not(SS<<:VV)) &
    (SS<:VV or not(SS<:VV)) & not(SS<:VV & not(SS<:VV)) &

    (UNION(ss).(ss<:SS | ss) = SS) &
    (INTER(ss).(ss<:SS | ss) = {}) &

    (SS : POW(TT) <=> SS <: TT) &
    (SS=TT <=> POW(SS) = POW(TT)) &
    (POW(SS-TT) = { xx | xx<:SS & xx /\ TT = {} }) &
    ( {rr|rr:setX & rr:SS & #r2.(r2:setX & r2:TT & r2=rr)} = SS /\ TT) &
    ( {rr|rr:setX & rr:SS & #r2.(r2:setX & (r2:TT or r2:VV) & r2=rr)} = SS /\ (TT\/VV))

    & card({x|rec(cardinality:x,col:el1,fill:f2el1,shape:el1):SS}) <= card(SS)
    & card({x,e,f|rec(cardinality:x,col:e,fill:f,shape:e):SS}) <= card(SS)
    & card({x,e,e2,f|rec(cardinality:x,col:e,fill:f,shape:e2):SS}) = card(SS)
    & ran(%(x,e,e2,f).(rec(cardinality:x,col:e,fill:f,shape:e2):SS|rec(cardinality:x,col:e,fill:f,shape:e2))) = SS
    & card({x,e,e2,f|rec(cardinality:x,col:e,fill:f,shape:e2):SS &
                     rec(cardinality:x,col:e,fill:f,shape:e2):TT}) = card(SS /\ TT)
    & card({x,e,e2,f|rec(cardinality:x,col:e,fill:f,shape:e2):SS or
                     rec(cardinality:x,col:e,fill:f,shape:e2):TT}) = card(SS \/ TT)
    & card({e,e2,f|rec(cardinality:1,col:e,fill:f,shape:e2):SS}) +
      card({e,e2,f|rec(cardinality:2,col:e,fill:f,shape:e2):SS}) = card(SS)
    & card({e,e2,f|rec(cardinality:0,col:e,fill:f,shape:e2):SS}) = 0

INITIALISATION

    SS,TT,VV := {},{},{}

OPERATIONS
 /* cc <-- powss1 = BEGIN cc := POW(SS-TT) END;
 cc <-- powss2 = BEGIN cc := { xx | xx<:SS & xx /\ TT = {} } END; */
 add_SS(el) = PRE card(SS)<5 & el: setX & el /: SS THEN  SS := SS \/ {el} END;
 add_TT(el) = PRE card(TT)<5 & el: setX & el /: TT THEN  TT := TT \/ {el} END;
 add_VV(el) = PRE card(VV)<5 & el: setX & el /: VV THEN  VV := VV \/ {el} END /* ;

 set_SS_setX = BEGIN SS := setX END;
 set_TT_setX = BEGIN TT := setX END;
 set_VV_setX = BEGIN VV := setX END ;

 laws_ok = PRE law1 & law2 & law3 & law4 & law5 &
               law6 & law7 & law8 & law9 & law10 & law11 THEN skip END */

END
