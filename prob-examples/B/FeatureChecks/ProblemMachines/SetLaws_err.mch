MACHINE SetLaws_err
 /* Machine takes very long (forever) to get through the parser */

SETS
   setX = {el1,el2,el3}

VARIABLES
    SS, TT, VV

DEFINITIONS
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
  
  setcomprlaw1 == ( {xx | xx: SS & xx:TT} = SS /\ TT);
  setcomprlaw2 == ( {xx | xx: setX & (xx: SS or xx:TT)} = SS \/ TT);
  setcomprlaw3 == ( {xx | xx: setX & xx: SS & (xx: TT or xx:VV)} = SS /\ (VV \/TT));
  setcomprlaw4 == ( {xx | xx: SS & not(xx:TT)} = SS \ TT);
  
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
  cardlaw4 == (card(SS \/ VV) <= (card(SS) + card(VV)) /* <----- il manque une parenthese ici: ) */
  
INVARIANT
   SS : POW(setX) & TT : POW(setX) & VV : POW(setX) &
    law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 &
    law9 & law10 & law11 & law12 & law13 & law14 &
    orderlaw1 & orderlaw2 & orderlaw3 & orderlaw4 &
    setcomprlaw1  & setcomprlaw2 & setcomprlaw3 & setcomprlaw4 &
    foralllaw1 & foralllaw2 & existslaw1 & existslaw2 &
    
    orderlaw5 & orderlaw6 & orderlaw7 & 
    otherlaw1 & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 &
    
    cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4
    &
    
    (SS<<:VV or not(SS<<:VV)) & not(SS<<:VV & not(SS<<:VV)) &
    (SS<:VV or not(SS<:VV)) & not(SS<:VV & not(SS<:VV))

INITIALISATION

    SS,TT,VV := {},{},{}

OPERATIONS

 add_SS(el) = PRE el: setX & el /: SS THEN  SS := SS \/ {el} END;
 add_TT(el) = PRE el: setX & el /: TT THEN  TT := TT \/ {el} END;
 add_VV(el) = PRE el: setX & el /: VV THEN  VV := VV \/ {el} END ;
 
 set_SS_setX = BEGIN SS := setX END;
 set_TT_setX = BEGIN TT := setX END;
 set_VV_setX = BEGIN VV := setX END/* ;
  
 laws_ok = PRE law1 & law2 & law3 & law4 & law5 &
               law6 & law7 & law8 & law9 & law10 & law11 THEN skip END */

END

