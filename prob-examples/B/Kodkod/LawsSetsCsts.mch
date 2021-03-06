MACHINE LawsSetsCsts
/* Check that KODKOD and ProB do not find counter-example to
   mathematical laws about sets */
SETS
  setX = {el1,el2,el3}
DEFINITIONS
 setXX == BOOL;
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
 cardlaw5 == (card(SS) = card(VV) => (VV /<<: SS));
 cardlaw6 == (card(SS) <= card(VV) => (VV /<<: SS));
 cardlaw7 == (SS = VV => (card(SS) = card(VV)));
 cardlaw8 == (card(SS /\ VV) <= card(SS) & card(SS /\ VV) <= card(VV));

 difflaw1 == (SS /\ VV = {}  <=> SS <: setX - VV);
 difflaw2 == (SS \ VV = SS-VV);
 difflaw3 == (VV-SS = VV\SS)

CONSTANTS
   SS, TT, VV
PROPERTIES
  SS : POW(setX) & TT : POW(setX) & VV : POW(setX) &
 
 not (
   (SS : POW(TT) <=> SS <: TT) /* &
   (SS=TT <=> POW(SS) = POW(TT))  &  NOT SUPPORTED BY KODKOD
   (POW(SS-TT) = { xx | xx<:SS & xx /\ TT = {} })  NOT SUPPORTED BY KODKOD */

   & 
 /* new, July 2008 */
    SS /\ setX = SS &
    SS \/ setX = setX &
    SS \/ (setX \ SS) = setX &
    SS /\ (setX \ SS) = {} &
    (setX \ (setX \ SS) = SS)
   &
   (SS /\ TT = {}  <=> not(#x.(x:SS & x:TT)) )    &
   (SS /\ TT /\ VV = {}  <=> not(#x.(x:SS & x:TT & x:VV)) ) & 
   (SS <: TT  <=>  not(#y.(y:SS & y/: TT))) 

    &
   (SS/={} <=> #ee.(ee:SS) ) /*  16.9.2012 : KODKOD FINDS ILLEGAL COUNTER-EXAMPLE for => direction with SS={el1,el3} */
   &
   (SS /\ TT /= {}  <=>   #ee.(ee:SS & ee:TT) )  
   &
   ( SS /<: TT  <=>  #ee.(ee:SS & ee/:TT)) 
   &
   ( SS<<:TT <=>  (SS<:TT & #ee.(ee:TT & ee/:SS))) 
&
   (id(SS)=SS*SS <=> card(SS)<2) &
   (SS*VV = TT*VV  <=>  (((SS={} or VV={}) & (TT={} or VV={})) or (SS=TT & VV=VV))) &
   (id(SS)=id(TT) <=> SS=TT)   &
   (id(SS) <: id(TT) <=> SS <: TT)
   
& /* commented out because ProB gets gradually slower with increasing number of laws */
  /* law1 & law2 & law3 & law4 & law5 & law6 & law7 & law8 &
    law9 & law10 & law11 & law12 & law13 & law14 &
   orderlaw1  & orderlaw2 & orderlaw3 & orderlaw4 &
   setcomprlaw1  &  setcomprlaw2 & setcomprlaw3 &  setcomprlaw4 &
   foralllaw1 & foralllaw2 &  existslaw1 & existslaw2 & 

   orderlaw5 & orderlaw6 & orderlaw7 & 
   orderlaw8 & */
   /* orderlaw9 &  CANNOT BE TRANSLATED BY KODKOD */
   
   /*  otherlaw1 &  otherlaw1b & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 & otherlaw6 & 

   cardlaw1 & cardlaw2 &  cardlaw3 & cardlaw4 & cardlaw5 &  cardlaw6 & cardlaw7 & cardlaw8
   &
   difflaw1 & difflaw2
   & */
   difflaw3
  )
END

