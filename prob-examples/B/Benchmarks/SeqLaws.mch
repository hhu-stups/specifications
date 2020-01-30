MACHINE SeqLaws
/* MaxInt must be set to at least 4: otherwise counter examples will be found */

SETS
   setY = {y1,y2}
   
VARIABLES
  ff,gg
   
DEFINITIONS
  SET_PREF_MAXINT == 4;
  law1 ==  (dom(ff\/gg) = dom(ff) \/ dom(gg));
  law2 ==  (ran(ff\/gg) = ran(ff) \/ ran(gg));
  law3 ==  (dom(ff/\gg) <: dom(ff) /\ dom(gg));
  law4 ==  (ran(ff/\gg) <: ran(ff) /\ ran(gg));
  law5 ==  ( (ff \/ gg)~ = ff~ \/ gg~);
  law6 ==  (dom((ff ; (gg~))) <: dom(ff));
  law7 ==  (!(xx,yy).(xx:NAT1 & yy:setY & xx|->yy : ff  =>  yy: ran(gg))
              =>  (dom((ff ; (gg~))) = dom(ff)));
  law8 ==  (ff : NAT1 --> setY  <=>  (ff: NAT1 +-> setY & dom(ff) = NAT1)); 
  ff_is_pf == (!(xx,yy,zz).((xx:NAT1 & yy:setY & zz:setY &
                    xx|->yy:ff & xx|->zz:ff) => (yy=zz)));
  law9a ==  (ff : NAT1 +-> setY  => ff_is_pf);
  law9b ==  (ff_is_pf => ff : NAT1 +-> setY);
  
  law10 == (ff : NAT1 >->> setY  <=>  (ff : NAT1 >-> setY  &  ff~: setY >-> NAT1));
  law11 == (ff : NAT1 >+> setY  <=> (ff: NAT1 +-> setY &
                                     !(xx,yy).(xx:NAT1 & yy:NAT1 & xx/=yy & xx:dom(ff) &
                                       yy: dom(ff)  => ff(xx)/=ff(yy)))) ;
                                       
  law12 == (ff : NAT1 +->> setY  <=>  (ff: NAT1 +-> setY &
                                       !yy.(yy:setY => yy: ran(ff))));

 law13 == (ff: NAT1 >-> setY  <=> (ff: NAT1 >+> setY & ff: NAT1 --> setY));
 law14 == (ff: NAT1 -->> setY <=> (ff: NAT1 +->> setY & ff: NAT1 --> setY));
 law15 == (ff: NAT1 >->> setY <=> (ff: NAT1 -->> setY & ff: NAT1 >-> setY))
INVARIANT

  ff: seq(setY) & gg: seq(setY) &
  
  law1 & law2 & law3 & law4 & law5 & 
  law6 & law7 & law8 & 
  
  law9a & law9b & /* <-- problem if MAXINT<4 */
  law10 & law11 & law12 &
  law13&law14&law15&
  
  (ff: NAT1 --> setY  =>  ff: NAT1 +-> setY) &
  (ff: NAT1 >+> setY  =>  ff: NAT1 +-> setY)  &
  (ff: NAT1 >-> setY  =>  ff: NAT1 >+> setY)  &
  (ff: NAT1 >-> setY  =>  ff: NAT1 --> setY)  &
  (ff: NAT1 >->> setY  =>  ff: NAT1 --> setY) &
  (ff: NAT1 +->> setY  =>  ff: NAT1 +-> setY)  &
  (ff: NAT1 -->> setY  =>  (ff: NAT1 --> setY & ff: NAT1 +->> setY))
  
  &
  
  (ff: NAT1 +->> setY => ran(ff) = setY) &
  (ran(ff) <<: setY => not(ff: NAT1 +->> setY)) &
  
  (ff:NAT1-->>setY or not(ff:NAT1-->>setY)) &  not(ff:NAT1-->>setY & not(ff:NAT1-->>setY))&
  (ff:NAT1>+>setY or not(ff:NAT1>+>setY)) &  not(ff:NAT1>+>setY & not(ff:NAT1>+>setY))&
  (ff:NAT1>->setY or not(ff:NAT1>->setY)) &  not(ff:NAT1>->setY & not(ff:NAT1>->setY))&
  (ff:NAT1+->>setY or not(ff:NAT1+->>setY)) &  not(ff:NAT1+->>setY & not(ff:NAT1+->>setY))&
  (ff:NAT1>->>setY or not(ff:NAT1>->>setY)) &  not(ff:NAT1>->>setY & not(ff:NAT1>->>setY))&
  (ff:NAT1-->setY or not(ff:NAT1-->setY)) &  not(ff:NAT1-->setY & not(ff:NAT1-->setY))&
  (ff:NAT1+->setY or not(ff:NAT1+->setY)) &  not(ff:NAT1+->setY & not(ff:NAT1+->setY))&
  
  (!xx.(xx:NAT1 & xx:dom(ff) => ff(xx):ran(ff))) &
  
  (dom(ff) = {xx | xx: NAT1 & #yy.(yy:setY & xx|->yy:ff)}) & /* <-- problem if MAXINT<4 */
  (ran(ff) = {yy | yy: setY & #xx.(xx:NAT1 & xx|->yy:ff)}) &
  
  /* ---------------------------------------- */
  
  size(rev(ff)) = size(ff) &
  rev(rev(ff)) = ff &
  
  (ff=gg => (dom(ff)=dom(gg) & ran(ff)=ran(gg) & size(ff) = size(gg))) &
  
  ((ff=gg & ff/= <>) => (tail(ff)=tail(gg) & front(ff)=front(gg))) &
  
  (ff/=<> => (first(ff) = last(rev(ff)) & last(ff) = first(rev(ff)))) &
  
  (ff: seq1(setY) <=> ff/=<>) &
  
  (ff: iseq(setY) <=>  card(ran(ff)) = size(ff)) &
  
  (ff: perm(setY) <=>  (ff: iseq(setY) & size(ff) = card(setY))) &
  
  (ff /=<> => (front(ff) <- last(ff) = ff)) &
  
  (ff /=<> => (first(ff) -> tail(ff) = ff)) &

  (conc([ ff, [y1]]) = ff<-y1)

 & ( (size(ff)>=2 & ff:NAT1>+>setY) => ( !xx.(xx:NAT1&xx:1..(size(ff)) => (( (ff/|\xx)/\(ff\|/xx) ) = <> ))))
 & ( (size(ff)>=2) => ( !xx.(xx:NAT1&xx:1..(size(ff)) => (( (ff/|\xx)^(ff\|/xx) ) = ff ))))
 & ( (size(ff)>=2) => ( !xx.(xx:NAT1&xx:1..(size(ff)) => (( (ff/|\xx) ) = ((1..xx)<|ff) ))))
 
INITIALISATION

  ff,gg := [],<>
  
OPERATIONS
  /* ispf = PRE ff: NAT1+->setY THEN skip END;
  nispf = PRE not(ff: NAT1+->setY) THEN skip END;
  istf = PRE ff: NAT1-->setY THEN skip END;
  nistf = PRE not(ff: NAT1-->setY) THEN skip END;
  is_total = PRE dom(ff)=NAT1 THEN skip END;
  df <-- domff = BEGIN df := dom(ff) END;
  n1 <-- n1 = BEGIN n1 := NAT1 END; */

  ispartialsurj = PRE ff : NAT1 +->> setY THEN skip END;
  isnotpartialsurj = PRE not(ff : NAT1 +-> setY) THEN skip END;
  
  add_ff(xx) = PRE xx:setY & size(ff)<4 THEN
                     ff := ff ^ [xx]
               END;
  tail_ff = PRE ff/=[] THEN ff := tail(ff) END;
  revff = BEGIN ff := rev(ff) END;
  add_gg(xx) = PRE xx:setY & size(gg)<3 THEN
                     gg := gg ^ [xx]
               END
                  
END
