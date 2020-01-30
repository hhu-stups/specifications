MACHINE SetLaws

SETS
  setX = {el1,el2,el3}

VARIABLES
   SS, TT, VV

DEFINITIONS
 GOAL == (FIN1(SS)) = (FIN(SS)-{{}});
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


 /* laws for <<:, <:, /<: and /<<: */
 orderlaw5 == ( SS <<: VV  or SS /<<: VV );
 orderlaw6 == ( (VV <<: SS & SS <: TT) => (VV <<: TT));
 orderlaw7 == ( (VV <: SS & SS <<: TT) => (VV <<: TT));
 orderlaw8 == ( SS <: VV  or SS /<: VV );
 orderlaw9 == ( SS : POW(TT)  or SS /: POW(TT) );

 otherlaw1 == ( (SS <: VV & SS /<<: VV) => SS = VV);
 otherlaw1b ==(  SS <: VV => (SS /= VV  <=> SS <<: VV));
 otherlaw2 == ( (SS <<: VV ) => (SS /= VV & card(VV)>0));
 otherlaw3 == ( (SS = VV ) => SS /<<: VV);
 otherlaw4 == ( SS <<: VV  => SS <: VV);
 otherlaw5 == ( SS <<: VV => #xx.(xx:VV & xx/:SS));
 otherlaw6 == ( SS <: VV <=> !x.(x:SS => x:VV) );

 cardlaw1 == (SS <<: VV => (card(SS) < card(VV)));
 cardlaw2 == (SS <: VV => (card(SS) <= card(VV)));
 cardlaw3 == (card(SS) < card(VV) => (VV /<: SS));
 cardlaw4 == (card(SS \/ VV) <= (card(SS) + card(VV)));

 difflaw1 == (SS /\ VV = {}  <=> SS <: setX - VV);
 difflaw2 == (SS \ VV = SS-VV);
 difflaw3 == (VV-SS = VV\SS)

INVARIANT
  SS : POW(setX) & TT : POW(setX) & VV : POW(setX) &
   law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 &
   law9 & law10 & law11 & law12 & law13 & law14 &
   orderlaw1  & orderlaw2 & orderlaw3 & orderlaw4 &
   setcomprlaw1  & setcomprlaw2 & setcomprlaw3 & setcomprlaw4 &
   foralllaw1 & foralllaw2 & existslaw1 & existslaw2 &

   orderlaw5 & orderlaw6 & orderlaw7 & 
   orderlaw8 & orderlaw9 &
   otherlaw1 & otherlaw1b & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 & otherlaw6 &

   cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4
   &
   difflaw1 & difflaw2
   &
   difflaw3 &

   (SS<<:VV or not(SS<<:VV)) & not(SS<<:VV & not(SS<<:VV)) &
   (SS<:VV or not(SS<:VV)) & not(SS<:VV & not(SS<:VV)) &
    /* */
   (SS/<<:VV or not(SS/<<:VV)) & not(SS/<<:VV & not(SS/<<:VV)) &
   (SS/<:VV or not(SS/<:VV)) & not(SS/<:VV & not(SS/<:VV)) &
   (SS/:POW(TT) or not(SS/:POW(TT))) & not(SS/:POW(TT) & not(SS/:POW(TT))) &
   (SS:POW(TT) or not(SS:POW(TT))) & not(SS:POW(TT) & not(SS:POW(TT))) &
   ((POW1(SS)) = (POW(SS)-{{}})) &
   ((FIN1(SS)) = (FIN(SS)-{{}})) &
   {} : POW(SS) & 
  /* {} : FIN(SS) & */ /* this was false due to a bug in the Parser, which returned FIN1 for FIN */
   {} /: POW1(SS) & {} /: FIN1(SS) &

   (UNION(ss).(ss<:SS | ss) = SS) &
   (card(SS) /= 1  <=> UNION(ss).(ss<<:SS | ss) = SS) &
   (INTER(ss).(ss<:SS | ss) = {}) &

   (SS : POW(TT) <=> SS <: TT) &
   (SS=TT <=> POW(SS) = POW(TT)) &
   (POW(SS-TT) = { xx | xx<:SS & xx /\ TT = {} })

   & /* new, July 2008 */
    SS /\ setX = SS &
    SS \/ setX = setX &
    SS \/ (setX \ SS) = setX &
    SS /\ (setX \ SS) = {} &
    (setX \ (setX \ SS) = SS)
   &
   (SS /\ TT = {}  <=> not(#x.(x:SS & x:TT)) )   &
   (SS /\ TT /\ VV = {}  <=> not(#x.(x:SS & x:TT & x:VV)) ) & 
   (SS <: TT  <=>  not(#y.(y:SS & y/: TT))) 

   &
   (SS/={} <=> #ee.(ee:SS) )
   &
   (SS /\ TT /= {}  <=>   #ee.(ee:SS & ee:TT) )
   &
   ( SS /<: TT  <=>  #ee.(ee:SS & ee/:TT))
   &
   ( SS<<:TT <=>  (SS<:TT & #ee.(ee:TT & ee/:SS)))
ASSERTIONS
   /* (UNION(ss).(ss<:SS | ss) = SS); 
   (POW1(SS) = POW(SS) - {{}}); */
   VV - SS = VV - SS
INITIALISATION

   SS,TT,VV := {},{},{}

OPERATIONS
/* cc <-- powss1 = BEGIN cc := POW(SS-TT) END;
cc <-- powss2 = BEGIN cc := { xx | xx<:SS & xx /\ TT = {} } END; */
 add_SS(el) = PRE el: setX & el /: SS THEN  SS := SS \/ {el} END;
 add_TT(el) = PRE el: setX & el /: TT THEN  TT := TT \/ {el} END;
 add_VV(el) = PRE el: setX & el /: VV THEN  VV := VV \/ {el} END ;

 set_SS_setX = BEGIN SS := setX END;
 set_TT_setX = BEGIN TT := setX END;
 set_VV_setX = BEGIN VV := setX END/* ;

 laws_ok = PRE law1 & law2 & law3 & law4 & law5 &
              law6 & law7 & law8 & law9 & law10 & law11 THEN skip END */

END

