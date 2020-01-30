MACHINE SetLawsNat

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
  setcomprlaw2 == ( {xx | xx: NAT & (xx: SS or xx:TT)} = SS \/ TT);
  setcomprlaw3 == ( {xx | xx: NAT & xx: SS & (xx: TT or xx:VV)} = SS /\ (VV \/TT));
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
  cardlaw4 == (card(SS \/ VV) <= (card(SS) + card(VV)))
  
INVARIANT
   SS : POW(NAT) & TT : POW(NAT) & VV : POW(NAT) &
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
    (SS<:VV or not(SS<:VV)) & not(SS<:VV & not(SS<:VV)) &

   (SS/<<:VV or not(SS/<<:VV)) & not(SS/<<:VV & not(SS/<<:VV)) &
   (SS/<:VV or not(SS/<:VV)) & not(SS/<:VV & not(SS/<:VV)) &
   (SS/:POW(TT) or not(SS/:POW(TT))) & not(SS/:POW(TT) & not(SS/:POW(TT))) &
   (SS:POW(TT) or not(SS:POW(TT))) & not(SS:POW(TT) & not(SS:POW(TT))) &
   ((POW1(SS)) = (POW(SS)-{{}})) &
   ((FIN1(SS)) = (FIN(SS)-{{}})) &
    
    ((SS=VV & SS /= {}) => (max(SS) = max(VV) & min(SS)=min(VV))) &
    
    (SS=VV or SS/=VV) & not(SS=VV & SS/=VV) &
    
    ((SS <: VV & SS/= {})  => (max(SS) <= max(VV) & min(SS) >= min(VV))) &
    
    (card(SS)=1  <=> (SS /={} & max(SS) = min(SS))) &
    (card(SS)=1  => (SS /={} & max(SS) = SIGMA (gg).(gg:SS|gg))) &
    (card(SS)=1  => (SS /={} & max(SS) = PI (gg).(gg:SS|gg)))&
    ((SS /={} & 1 /: SS & max(SS) = PI (gg).(gg:SS|gg)) => card(SS)=1) &
    
    (UNION(ss).(ss<:SS & card(ss)<3 | ss) = SS)  &
    (INTER(ss).(ss<:SS & card(ss)<3 | ss) = {}) 

   & !(xx,yy).(xx:NAT&yy:NAT1 => (xx mod yy = xx - (xx/yy)*yy ))

    & /* new, July 2008 */
    SS /\ NAT = SS &
    SS \/ NAT = NAT &
    SS \/ (NAT \ SS) = NAT &
    SS /\ (NAT \ SS) = {} &
    (NAT \ (NAT \ SS) = SS)
INITIALISATION

    SS,TT,VV := {},{},{}

OPERATIONS

 /* cc <-- compr = BEGIN cc := {xx | xx: SS & xx:TT} END;
 cc <-- inte = BEGIN cc := SS /\ TT END;
 cc <-- sig = BEGIN cc := SIGMA (gg).(gg:SS|gg) END;
 cc <-- mx = PRE SS /= {} THEN cc := max(SS) END; 
 
 ss_neq_vv = PRE SS/= VV THEN skip END;
 ss_eq_vv = PRE SS = VV THEN skip END; */
 add_SS(el) = PRE el: NAT & el /: SS THEN  SS := SS \/ {el} END;
 add_TT(el) = PRE el: NAT & el /: TT THEN  TT := TT \/ {el} END;
 add_VV(el) = PRE el: NAT & el /: VV THEN  VV := VV \/ {el} END ;
 
 set_SS_NAT = BEGIN SS := NAT END;
 set_SS_01 = BEGIN SS := {xx | xx:NAT & xx>=0 & xx< 2} END;
 set_SS_0 = BEGIN SS := {xx | xx:NAT & xx>=0 & xx< 1} END;
 set_SS_empty = BEGIN SS := {xx | xx:NAT & xx>=0 & xx< 0} END;
 set_TT_NAT = BEGIN TT := NAT END;
 set_VV_NAT = BEGIN VV := NAT END/* ;
  
 laws_ok = PRE law1 & law2 & law3 & law4 & law5 &
               law6 & law7 & law8 & law9 & law10 & law11 THEN skip END */

END









