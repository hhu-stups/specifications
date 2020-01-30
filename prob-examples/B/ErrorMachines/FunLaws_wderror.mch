MACHINE FunLaws_wderror
/* This machine contains two well-defindedness errors */

/* This machine is intended so that you can check whether ProB deals
   with basic laws associated to functions and relations. ProB should
   not find an invariant violation. */

SETS
    SETX = {el1,el2}; SETY = {y1,y2,y3}  /* third element y3 added so that we
     can generate a relation which is not a function without covering the full SETY */
VARIABLES
   ff,gg, setX, setY

DEFINITIONS
  law1 ==  (dom(ff\/gg) = dom(ff) \/ dom(gg));
  law2 ==  (ran(ff\/gg) = ran(ff) \/ ran(gg));
  law3 ==  (dom(ff/\gg) <: dom(ff) /\ dom(gg));
  law4 ==  (ran(ff/\gg) <: ran(ff) /\ ran(gg));
  law5 ==  ( (ff \/ gg)~ = ff~ \/ gg~);
  law6 ==  (dom((ff ; (gg~))) <: dom(ff));
  law7 ==  (!(xx,yy).(xx:SETX & yy:SETY & xx|->yy : ff  =>  yy: ran(gg))
              =>  (dom((ff ; (gg~))) = dom(ff)));
  law8 ==  (ff : setX --> setY  <=>  (ff: setX +-> setY & dom(ff) = setX));
  law8b ==  (ff : setX --> setY  <=>  (ff: SETX +-> setY & dom(ff) = setX)); 
  ff_is_pf == (!(xx,yy,zz).((xx:SETX & yy:SETY & zz:SETY &
                    xx|->yy:ff & xx|->zz:ff) => (yy=zz)));
  law9 ==  (ff : SETX +-> SETY  <=> ff_is_pf);

  law10 == (ff : setX >->> setY  <=>  (ff : setX >-> setY  &  ff~: setY >-> setX));
  law11 == (ff : setX >+> setY  <=> (ff: setX +-> setY &
                                     !(xx,yy).(xx:setX & yy:setX & xx/=yy & xx:dom(ff) &
                                       yy: dom(ff)  => ff(xx)/=ff(yy)))) ;

  law12 == (ff : setX +->> setY  <=>  (ff: setX +-> setY &
                                       !yy.(yy:setY => yy: ran(ff))));
  law13 == (ff: setX >-> setY  <=> (ff: setX >+> setY & ff: setX --> setY));
  law14 == (ff: setX -->> setY <=> (ff: setX +->> setY & ff: setX --> setY));
  law15 == (ff: setX >->> setY <=> (ff: setX -->> setY & ff: setX >-> setY))
INVARIANT

  setX <: SETX & setY <: SETY &
  ff: SETX <-> SETY & gg: SETX <-> SETY &

  law1 & law2 & law3 & law4 & law5 & 
  law6 & law7 & law8 & law8b & 

  law9 & law10 & law11 & law12 &

  law13 & law14 & law15 &
  
  (ff: setX <-> setY <=> (dom(ff)<:setX & ran(ff)<:setY)) &
  (ff: setX --> setY  =>  ff: setX +-> setY) &
  (ff: setX >+> setY  =>  ff: setX +-> setY)  &
  (ff: setX >-> setY  =>  ff: setX >+> setY)  &
  (ff: setX >-> setY  =>  ff: setX --> setY)  &
  (ff: setX >->> setY  =>  ff: setX --> setY) &
  (ff: setX +->> setY  =>  ff: setX +-> setY)  &
  (ff: setX -->> setY  =>  (ff: setX --> setY & ff: setX +->> setY))

  &

  (ff: setX +->> setY => ran(ff) = setY) &
  (ran(ff) <<: setY => not(ff: setX +->> setY)) &

  (ff:setX-->>setY or not(ff:setX-->>setY)) &  not(ff:setX-->>setY & not(ff:setX-->>setY))&
  (ff:setX>+>setY or not(ff:setX>+>setY)) &  not(ff:setX>+>setY & not(ff:setX>+>setY))&
  (ff:setX>->setY or not(ff:setX>->setY)) &  not(ff:setX>->setY & not(ff:setX>->setY))&
  (ff:setX+->>setY or not(ff:setX+->>setY)) &  not(ff:setX+->>setY & not(ff:setX+->>setY))&
  (ff:setX>->>setY or not(ff:setX>->>setY)) &  not(ff:setX>->>setY & not(ff:setX>->>setY))&
  (ff:setX-->setY or not(ff:setX-->setY)) &  not(ff:setX-->setY & not(ff:setX-->setY))&
  (ff:setX+->setY or not(ff:setX+->setY)) &  not(ff:setX+->setY & not(ff:setX+->setY))&

  (!xx.(xx:setX & xx:dom(ff) => ff(xx):ran(ff))) &  /* <--- this is not well-defined without & ff:SETX+->SETY */
   /* however, if ran(ff) = SETY then ProB can determine value of :ran(ff) without looking
      at LHS ! 
      This applies if ProB translate quantification into not-exists
      However, without expansion no wd-error is detected, as ProB infers that ff(xx)
       must be a value not existing in ran(ff) and then via inverse lookup realises no xx value matches
      */
  (!xx.(xx:setX & xx:dom(ff) => (ran(ff) \/ {ff(xx)} = ran(ff)) )) &
    /* with this property ProB currently finds a WD error; added 15th July 2015 */
  
   card(dom(ff))<=card(SETX) &
   card(ran(ff))<=card(SETY) &
  (dom(ff) = {xx | xx: SETX & #yy.(yy:SETY & xx|->yy:ff)}) &
  (ran(ff) = {yy | yy: SETY & #xx.(xx:SETX & xx|->yy:ff)}) &


  (ff: setX +-> setY => !(xx).(xx:setY & xx:ran(ff) => #ii.(ii:setX & ii:dom(ff) & ff(ii)=xx))) &

  ff[dom(ff)] = ran(ff) &
  
  ff[dom(gg)] = ran(dom(gg) <| ff) &

  (!xx.(xx:setX => ff[{xx}] = {yy | yy:SETY & xx |->yy : ff}))&

  (!(xx,xx2).(xx:SETX & xx2:SETX
       => ff[{xx,xx2}] = {yy | yy:SETY & ((xx |->yy : ff) or (xx2|->yy: ff)) })) &

  (ff~[ff[SETX]] = dom(ff)) &

  (ff~[SETY] = dom(ff)) &

  (ff[SETX] = ran(ff)) &

  (ff: setX >+> setY  =>  !xx.(xx<:dom(ff) => ff~[ff[xx]] = xx))

   &
   (ff /\ gg /= {}  <=>   #ee.(ee:ff & ee:gg) )
   &
   ( ff /<: gg  <=>  #ee.(ee:ff & ee/:gg))
   &
   ( ff<<:gg <=>  (ff<:gg & #ee.(ee:gg & ee/:ff))) &

   ( ff |>  ran(ff) = ff) &
   ( ff |>> ran(ff) = {}) &
   ( ff: setX +-> setY => (ff |>  ran(gg) = %fx.(fx:dom(ff) & ff(fx):ran(gg) | ff(fx)) ) ) &
   ( ff: setX +-> setY => (ff |>> ran(gg) = %fx.(fx:dom(ff) & ff(fx)/:ran(gg)| ff(fx)) ) ) &
   ( ff |>  ran(gg) = {xy|xy:ff & prj2(SETX,SETY)(xy):ran(gg)} ) &
   ( ff |>> ran(gg) = {xy|xy:ff & prj2(SETX,SETY)(xy)/:ran(gg)} ) &

   ( dom(ff)  <| ff = ff) &
   ( dom(ff) <<| ff = {}) &
   ( dom(gg)  <| ff  = {xy|xy:ff & prj1(SETX,SETY)(xy):dom(gg)} ) &
   ( dom(gg) <<| ff  = {xy|xy:ff & prj1(SETX,SETY)(xy)/:dom(gg)} ) &
   
   
   /* from Atelier B */
   
/*  RULE SimplifyRelDomXY.13 */
	dom(dom(gg)<<|ff) = dom(ff)-dom(gg) &
	
/*  RULE SimplifyRelDomXY.14 */
	dom(ff~) = ran(ff) &
	
/*  RULE SimplifyRelDomXY.15 */
	dom(ff<+gg) = dom(ff)\/dom(gg) &

/*  RULE SimplifyRelDomXY.22 */
	dom({}) = {}
	
	&
	/* a few more rules trying to use set comprehensions,... so that closures get used */
	ff = {v1,v2|v1:SETX & v2:SETY & v1|->v2 :ff} &
	(ff: setX+->setY => !z.(z:dom(ff) => {v1,v2|v1:setX & v2:setY & v1|->v2 :ff}(z) = ff(z))) &
	(ff: setX+->{y1}  => !z.(z:dom(ff) => {v1,v2|v1:setX & v2:SETY & v1|->v2 :ff}(z) = y1)) &
	
	 (ff \/ {el1 |-> y1, el1 |-> y2}) /: setX+->setY &
	 {el1|->y1, el2|->y2}(el2) = y2 &
	 {el1|->y1, el2|->y2}(el1) = y1 &
	 ran({el1|->y1, el2|->y1}) = {y1} &
	 dom({el1|->y1, el2|->y1}) = SETX &



    /* cardinality propagation laws */
   (card(ff)>-1 & card(ff) >= 0) &
   ( ff: setX +-> setY  =>  card(ff) <= card(setX) ) &
   ( ff: setX --> setY  => card(ff) = card(setX) ) &
   ( ff: setX +->> setY => card(ff) >= card(setY) ) &
   ( ff: setX >->> setY => (card(ff) = card(setY) & card(ff) = card(setX) )) &
   (  card(ff \/ gg) <= card(ff)+card(gg)) &
   (  card(ff /\ gg) <= min({card(ff),card(gg)}) ) &
   ( card(ff) >= card(dom(ff)) & card(ff) >= card(ran(ff))) &
   (  card(ff - gg) <= card(ff) & card(ff-gg) >= card(ff)-card(gg)) &
   (  ff <<: gg => card(ff) < card(gg) ) &
   (  ff <: gg => card(ff) <= card(gg) ) &
   ( card(ff~) = card(ff) ) &
   ( card( ff <+ gg) <= card(ff)+card(gg) ) &
   ( ff: setX >-> SETY => card(ff[setX]) = card(setX) ) &
   ( ff: SETX >+> SETY => card(dom(ff)) = card(ran(ff)) ) &
   ( card(ff |> setY) <= card(ff) & card(ff |>> setY) <= card(ff)) &
   ( ff: SETX >+> SETY => card(ff |>> setY) >= card(ff)-card(setY)) &
   ( card(setX <| ff) <= card(ff) & card(setX <<| ff) <= card(ff)) &
   ( ff: SETX +-> SETY =>  card(setX <<| ff) >= card(ff)-card(setX)) &
   /* TO DO: more rules about |> , |>>, <|, <<| */
   

   /* functionality propagation laws */
   ( ff: setX >+> setY => ff~: setY +-> setX) &
   ( ff: SETX +-> SETY => setX <| ff: setX +-> SETY) & 
   ( ff: SETX +-> SETY => setX <<| ff: (SETX-setX) +-> SETY) & 
   ( ff: SETX +-> SETY =>  ff |> setY : SETX +-> setY) & 
   ( ff: SETX +-> SETY =>  ff |>> setY : SETX +-> (SETY-setY)) & 
   ( ff: SETX +-> SETY & gg: SETX +-> SETY => ff <+ gg : SETX +-> SETY) &

   /* TO DO: injectivitiy propagation laws */

   /* membership propagation laws */
   !x.(x:(ff\/gg) & x/: ff => x:gg) &
   !x.(x:ff => x : (ff\/gg) ) &
   !x.(x:(ff/\gg) => (x:ff & x:gg)) &
   !(x,y).(x:setX & x|->y:ff => y: ff[setX]) &
   /* TO DO: add more */
   
   /* ran, dom propagation laws */
   /* some laws already above, law1 .. la26: dom(ff \/ gg) = dom(ff) \/ dom(gg) etc */
   dom(setX <| ff) = dom(ff) /\ setX &
   dom(setX <<| ff) = dom(ff) - setX &
   ran(setX <| ff) <: ran(ff) &
   ran(setX <<| ff) <: ran(ff) &
   ran(ff |> setY) = ran(ff) /\ setY &
   ran(ff |>> setY) = ran(ff) - setY &
   dom(ff |> setY) <: dom(ff) &
   dom(ff |>> setY) <: dom(ff) &
   dom(ff<+gg) = dom(ff) \/ dom(gg) &
   ran(gg) <: ran(ff<+gg) &
   
   
   /* some new laws */
   (ff: SETX +-> SETY => !x.(x:dom(ff) => ff(x):ran(ff))) 
   &
   (ff |> setY = ff |>> (SETY - setY)) &
   (ff |>> setY = ff |> (SETY - setY)) &
   (setX <| ff = (SETX-setX) <<| ff) &
   (setX <<| ff = (SETX-setX) <| ff) &
   (ff <+ gg =  (dom(gg) <<| ff) \/ gg )
INITIALISATION

  ff,gg,setX,setY := {},{},SETX,SETY

OPERATIONS
  rem_setx(sx) = PRE sx:setX THEN setX := setX - {sx} END;
  rem_sety(sx) = PRE sx:setY THEN setY := setY - {sx} END;
  add_ff(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: ff THEN
                     ff := ff \/ {xx |-> yy}
                  END;
  add_ff_ov(xx,yy) = PRE xx:setX & yy:setY & ff: setX +-> setY THEN
                     ff(xx) := yy
                  END;
  maps_to(x,y) = PRE x|->y : ff THEN skip END;
  not_maps_to(x,y) = PRE x|->y /: ff THEN skip END;
  add_gg(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: gg THEN
                     gg := gg \/ {xx |-> yy}
                  END;

   ff_surj = PRE ff: setX +->> setY THEN skip END;
   ff_surj2 = PRE not(ran(ff)<<:setY) THEN skip END;
   notff_surj = PRE not(ff: setX +->> setY) THEN skip END;
   notff_surj2 = PRE ran(ff)<<:setY THEN skip END;
   ff_inj = PRE ff: setX >+> setY THEN skip END;
   notff_inj = PRE not(ff: setX >+> setY) THEN skip END;
   ff_bij = PRE ff: setX >->> setY THEN skip END;
   notff_bij = PRE not(ff: setX >->> setY) THEN skip END;
   notff_pf2 = PRE not(ff_is_pf) THEN skip END;
   res <-- get_card_dom_ff = BEGIN res := card({xx | xx: setX & #yy.(yy:setY & xx|->yy:ff)}) END;
   res <-- get_dom_ff = BEGIN res := {xx | xx: setX & #yy.(yy:setY & xx|->yy:ff)} END;
   in_dom_ff(aa) = PRE aa:setX & aa: {xx | xx: setX & #yy.(yy:setY & xx|->yy:ff)} THEN skip END

END
