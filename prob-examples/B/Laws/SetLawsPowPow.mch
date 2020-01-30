MACHINE SetLawsPowPow

SETS
   elements = {el1}

VARIABLES
SS, TT, VV

DEFINITIONS
setX == (POW(POW1(POW(elements))));
law1 == (SS \/ SS = SS & SS = SS \/ {} & SS = SS /\ SS & SS = SS \ {});
law2 == (SS /\ {} = {} & {} = SS \ SS & ({} \ SS = {}));
law3 == (SS \/ TT = TT \/ SS & SS /\ TT = TT /\ SS); 
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


/* laws for <<:, <:, /<: and /<<: */
orderlaw5 == ( SS <<: VV or SS /<<: VV );
orderlaw6 == ( (VV <<: SS & SS <: TT) => (VV <<: TT));
orderlaw7 == ( (VV <: SS & SS <<: TT) => (VV <<: TT));
orderlaw8 == ( SS <: VV or SS /<: VV );
orderlaw9 == ( SS : POW(TT) or SS /: POW(TT) );

otherlaw1 == ( (SS <: VV & SS /<<: VV) => SS = VV);
 otherlaw1b ==(  SS <: VV => (SS /= VV  <=> SS <<: VV));
otherlaw2 == ( (SS <<: VV ) => SS /= VV);
otherlaw3 == ( (SS = VV ) => SS /<<: VV);
otherlaw4 == ( SS <<: VV => SS <: VV);
otherlaw5 == ( SS <<: VV => #xx.(xx:VV & xx/:SS));
 otherlaw6 == ( SS <: VV <=> !x.(x:SS => x:VV) );

 cardlaw1 == (SS <<: VV => (card(SS) < card(VV)));
 cardlaw2 == (SS <: VV => (card(SS) <= card(VV)));
 cardlaw3 == (card(SS) < card(VV) => (VV /<: SS));
 cardlaw4 == (card(SS \/ VV) <= (card(SS) + card(VV)));
 cardlaw5 == (card(SS) = card(VV) => (VV /<<: SS));
 cardlaw6 == (card(SS) <= card(VV) => (VV /<<: SS));
 cardlaw7 == (SS = VV => (card(SS) = card(VV)));
 cardlaw8 == (card(SS /\ VV) <= card(SS) & card(SS /\ VV) <= card(VV));

INVARIANT
SS : POW(setX) & TT : POW(setX) & VV : POW(setX) &
law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 &
law9 & law10 & law11 & law12 & law13 & law14 &
orderlaw1 & orderlaw2 & orderlaw3 & orderlaw4 &
setcomprlaw1 & setcomprlaw2 & setcomprlaw3 & setcomprlaw4 &
foralllaw1 & foralllaw2 & existslaw1 & existslaw2 &

orderlaw5 & orderlaw6 & orderlaw7 & 
orderlaw8 & orderlaw9 &
otherlaw1 & otherlaw1b & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 & otherlaw6 &

cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4 & cardlaw5 & cardlaw6 & cardlaw7 & cardlaw8
&

(SS<<:VV or not(SS<<:VV)) & not(SS<<:VV & not(SS<<:VV)) &
(SS<:VV or not(SS<:VV)) & not(SS<:VV & not(SS<:VV)) &
(SS/<<:VV or not(SS/<<:VV)) & not(SS/<<:VV & not(SS/<<:VV)) &
(SS/<:VV or not(SS/<:VV)) & not(SS/<:VV & not(SS/<:VV)) &
(SS/:POW(TT) or not(SS/:POW(TT))) & not(SS/:POW(TT) & not(SS/:POW(TT))) &
(SS:POW(TT) or not(SS:POW(TT))) & not(SS:POW(TT) & not(SS:POW(TT))) &
((POW1(SS)) = (POW(SS)-{{}})) &
((FIN1(SS)) = (FIN(SS)-{{}})) &

   (UNION(ss).(ss<:SS | ss) = SS) &
   (card(SS) /= 1  <=> UNION(ss).(ss<<:SS | ss) = SS) &
   (INTER(ss).(ss<:SS | ss) = {}) &
   
   (SS /\ TT /= {}  <=>   #ee.(ee:SS & ee:TT) )
   &
   ( SS /<: TT  <=>  #ee.(ee:SS & ee/:TT))
   &
   ( SS<<:TT <=>  (SS<:TT & #ee.(ee:TT & ee/:SS)))
   &
(SS : POW(TT) <=> SS <: TT) &
(SS=TT <=> POW(SS) = POW(TT)) &
(POW(SS-TT) = { xx | xx<:SS & xx /\ TT = {} }) &
   
   /* law on page 124 of B-Book: */
   (SS/={} =>  inter(SS) = {x| !y.(y:SS => x:y)}) & 
   (inter({SS}) = {x| !y.(y:{SS} => x:y)}) &
   (inter({SS,TT}) = {x| !y.(y:{SS,TT} => x:y)}) &
   (inter({SS,TT,VV}) = {x| !y.(y:{SS,TT,VV} => x:y)}) &
   (union(SS) = {x| #y.(y:SS & x:y)}) &
   (union({}) = {x| x<:TT & #y.(y:{} & x:y)}) &
   (union({SS}) = {x| #y.(y:{SS} & x:y)}) &
   (union({SS,TT}) = {x| #y.(y:{SS,TT} & x:y)}) &
   (union({SS,TT,VV}) = {x| #y.(y:{SS,TT,VV} & x:y)}) &
   
  /* laws on page 126 of B-Book: */
   (SS/={} => inter(SS) = INTER(y).(y:SS|y)) & 
   (union(SS) = UNION(y).(y:SS|y)) &
   (SS /= setX => INTER(x).(x/:SS| x ) = inter(ran(%x.(x/:SS| x )))) &
   (UNION(x).(x/:SS| x ) = union(ran(%x.(x/:SS| x )))) &

  /* laws from page 127 of B-Book */
   (inter({SS}) = SS) &
   (union({SS}) = SS) &
   (inter({SS,TT}) = SS /\ TT) &
   (union({SS,TT}) = SS \/ TT) &
   (SS/={} & TT/={} => inter(SS \/ TT) = inter(SS) /\ inter(TT)) &
   (union(SS \/ TT) = union(SS) \/ union(TT)) &
   (SS/={} & TT/={} => inter(SS \/ TT) = inter({inter(SS),inter(TT)})) &
   (union(SS \/ TT) = union({union(SS), union(TT)}))
INITIALISATION

SS,TT,VV := {},{},{}

OPERATIONS
/* cc <-- powss1 = BEGIN cc := POW(SS-TT) END;
cc <-- powss2 = BEGIN cc := { xx | xx<:SS & xx /\ TT = {} } END; */
add_SS(el) = PRE el: setX & el /: SS THEN SS := SS \/ {el} END;
add_TT(el) = PRE el: setX & el /: TT THEN TT := TT \/ {el} END;
add_VV(el) = PRE el: setX & el /: VV THEN VV := VV \/ {el} END ;

set_SS_setX = BEGIN SS := setX END;
set_TT_setX = BEGIN TT := setX END;
set_VV_setX = BEGIN VV := setX END/* ;

laws_ok = PRE law1 & law2 & law3 & law4 & law5 &
law6 & law7 & law8 & law9 & law10 & law11 THEN skip END */

END