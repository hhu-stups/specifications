MACHINE FunLaws
/* This machine is intended so that you can check whether ProB deals
   with basic laws associated to functions and relations. ProB should
   not find an invariant violation. */

SETS
    SETX = {el1,el2}; SETY = {y1,y2}
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
  law15 == (ff: setX >->> setY <=> (ff: setX -->> setY & ff: setX >-> setY));

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

   card(dom(ff))<3 &
   card(ran(ff))<3 &
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

   ( ff |>  {} = {}) &
   ( ff |>  ran(ff) = ff) &
   ( ff |>> {} = ff) &
   ( ff |>> ran(ff) = {}) &
   ( ff: setX +-> setY => (ff |>  ran(gg) = %fx.(fx:dom(ff) & ff(fx):ran(gg) | ff(fx)) ) ) &
   ( ff: setX +-> setY => (ff |>> ran(gg) = %fx.(fx:dom(ff) & ff(fx)/:ran(gg)| ff(fx)) ) ) &
   ( ff |>  ran(gg) = {xy|xy:ff & prj2(SETX,SETY)(xy):ran(gg)} ) &
   ( ff |>> ran(gg) = {xy|xy:ff & prj2(SETX,SETY)(xy)/:ran(gg)} ) &

   (      {}  <| ff = {}) &
   ( dom(ff)  <| ff = ff) &
   (      {} <<| ff = ff) &
   ( dom(ff) <<| ff = {}) &
   ( dom(gg)  <| ff  = {xy|xy:ff & prj1(SETX,SETY)(xy):dom(gg)} ) &
   ( dom(gg) <<| ff  = {xy|xy:ff & prj1(SETX,SETY)(xy)/:dom(gg)} ) &
   
   
   ( {dd | dd <| ff = ff} = {dd| dom(ff) <: dd} ) &
   ( {rr | ff |> rr = ff} = {rr| ran(ff) <: rr} ) &
   ( {dd | dd <<| ff = ff} = {dd| dom(ff) /\ dd = {}} ) &
   ( {rr | ff |>> rr = ff} = {rr| ran(ff) /\ rr = {}} ) &
   
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
   ( ff: SETX +-> SETY =>  !x.(x:dom(ff) => ff(x):ran(ff))) 
   
   &
   (ff |> setY = ff |>> (SETY - setY)) &
   (ff |>> setY = ff |> (SETY - setY)) &
   (setX <| ff = (SETX-setX) <<| ff) &
   (setX <<| ff = (SETX-setX) <| ff) &
   (ff <+ gg =  (dom(gg) <<| ff) \/ gg )
   &
   fnc(ff) : dom(ff) --> POW(ran(ff)) &
   rel(fnc(ff)) = ff &
   !x.(x:dom(ff) => fnc(ff)(x) = ff[{x}]) &

      /* Definitions from page 78 of B-Book */
   ff~ = {b,a| (a,b):ff} &
   dom(ff) = {a | #b.( a|->b : ff)} &
   ran(ff) = dom(ff~) &
   (ff;(gg~)) = {a,c| #b.((a,b):ff & (b,c):(gg~))} &
   id(dom(ff)) = {a,b| (a,b):(dom(ff)*dom(ff)) & a=b} &
   dom(ff) <| gg = (id(dom(ff));gg) &
   gg |> ran(ff) = (gg ; id(ran(ff))) &
   dom(ff) <<| gg = (dom(gg)-dom(ff)) <| gg &
   gg |>> ran(ff) = gg |> (ran(gg)-ran(ff)) &
   ran(ff) = {b | #a.( a|->b : ff)} &
   dom(ff) <| gg = {a,b| (a,b):gg & a:dom(ff)} &
   gg |> ran(ff) = {a,b| (a,b):gg & b:ran(ff)} &
   dom(ff) <<| gg = {a,b| (a,b):gg & a/:dom(ff)} &
   gg |>> ran(ff) = {a,b| (a,b):gg & b/:ran(ff)} &
   
   /* Definitions from page 80 of B-Book */
   ff[dom(gg)] = ran(dom(gg) <| ff) & /* p[w] = ran(w <| p) with w=dom(gg) */
   gg <+ ff = (dom(ff) <<| gg) \/ ff & /* q<+ r = ... in book, error in book p should be r */
   ff >< gg = {a,bc| #(b,c).(bc=(b,c) & (a,b) : ff & (a,c) : gg)} &
   prj1(setX,setY) = (id(setX) >< (setX * setY))~ &
   prj2(setX,setY) = ((setY*setX) >< id(setY))~ &
   (ff||gg) = (prj1(SETX,SETX);ff) >< (prj2(SETX,SETX);gg) &
   
   ff[dom(gg)] = {b| #a.(a:dom(gg) & (a,b):ff)} & /* again error in B-Book (a,b) instead of (x,y) */
   gg <+ ff = {a,b | ( (a,b):gg & a/:dom(ff) ) or (a,b):ff} &
   prj1(setX,setY) = {a,b,c| (a,b,c) : setX*setY*setX & c=a} &
   prj2(setX,setY) = {a,b,c| (a,b,c) : setX*setY*setY & c=b} &
   (ff||gg) = {ab,cd | #(a,b,c,d).(ab=(a,b) & cd = (c,d) & (a,c):ff & (b,d):gg)} &
   
   /* Inclusion Properties from page 98 of B-Book (not complete) */
   id(dom(ff)) <: (ff; ff~) &
   id(ran(ff)) <: (ff~;ff) &
   ff[setX /\ {el1}] <: ff[setX] /\ ff[{el1}] &
   ff[setX] - ff[{el1}] <: ff[setX - {el1}] &
   dom(ff /\ gg) <: dom(ff) /\ dom(gg) &
   dom(ff) - dom(gg) <: dom(ff-gg) &
   ran(ff /\ gg) <: ran(ff) /\ ran(gg) &
   ran(ff) - ran(gg) <: ran(ff-gg) &
   (ff /\ gg)[setX] <: ff[setX] /\ gg[setX] &
   ff[setX] - gg[setX] <: (ff-gg) [setX] &
   
   /* Inverse Properties from page 100 of B-Book */
   (ff~)~ = ff &
   (ff ; (gg~))~ = ((gg~)~ ; ff~) &
   id(setX)~ = id(setX) &
   (setX <| ff)~ = ff~ |> setX &
   (ff |> setY)~ = setY <| ff~ &
   (setX <<| ff)~ = ff~ |>> setX &
   (ff |>> setY)~ = setY <<| ff~ &
   (ff <+ gg)~ = (ff~|>>dom(gg)) \/ gg~ &
   (ff || gg)~ = (ff~ || gg~) &
   (ff \/ gg)~ = ff~ \/ gg~ &
   (ff /\ gg)~ = ff~ /\ gg~ &
   (ff - gg)~ = ff~ - gg~ &
   {1|->2}~ = {2|->1} &
   (ff={} => ff~={}) &
   (setX * setY)~ = setY*setX &
   
   /* Domain Properties from pages 100-101 of B-Book */
   (ff: setX --> SETY => (dom(ff) = setX)) &
   dom(ff~) = ran(ff) &
   dom(ff ; (gg~)) = ff~[dom(gg~)] &
   (ran(ff) <: dom(gg~) => dom(ff ; (gg~)) = dom(ff) ) &
   dom(id(setX)) = setX &
   dom(setX <| ff) = setX /\ dom(ff) &
   dom(ff |> setY) = ff~[setY] &
   dom(setX <<| ff) = dom(ff)-setX &
   (ff: SETX +-> SETY => dom(ff |>> setY) = dom(ff) - ff~[setY]) &
   dom(ff<+gg) = dom(ff) \/ dom(gg) &
   dom(ff><gg) = dom(ff) /\ dom(gg) &
   dom(ff||gg) = dom(ff) * dom(gg) &
   dom(ff \/ gg) = dom(ff) \/ dom(gg) &
   (ff:SETX +-> SETY & gg:SETX +-> SETY & 
     dom(ff) <| gg = dom(gg) <| ff
    => (dom(ff /\ gg) = dom(ff) /\ dom(gg) &
       dom(ff - gg) = dom(ff) - dom(gg))
    ) &
   dom({ 1|-> 2}) = {1} &
   (ff={} => dom(ff) = {}) &
   (setY /= {} => dom(setX*setY) = setX) &
   
   /* Range Properties from pages 102-103 of B-Book */
   (ff: SETX +->> setY => (ran(ff) = setY)) &
   ran(ff~) = dom(ff) &
   ran((ff ; (gg~))) = (gg~)[ran(ff)] &
   (dom(gg~) <: ran(ff) => ran((ff ; (gg~))) = ran(gg~)) /* error in B-Book: should be ran(q) not ran(p) */ &
   ran(id(setX)) = setX &
   ran(setX <| ff) = ff[setX] &
   ran(ff |> setY) = ran(ff) /\ setY &
   (ff~:SETY +-> SETX => ran(setX <<| ff) = ran(ff)-ff[setX]) &
   ran(ff |>> setY) = ran(ff) - setY &
   ran(ff <+ gg) = ran(dom(gg)<<|ff) \/ ran(gg) &
   ran(ff><gg) = (ff~ ; gg) &
   ran(ff||gg) = ran(ff)*ran(gg) &
   ran(ff \/ gg) = ran(ff) \/ ran(gg) &
   (ff~:SETY +-> SETX & gg~:SETY +-> SETX & 
     ff |> ran(gg) = gg |> ran(ff)
    => (ran(ff /\ gg) = ran(ff) /\ ran(gg) &
        ran(ff - gg) = ran(ff) - ran(gg))) &
   ran({ 1|-> 2}) = {2} &
   (ff={} => ran(ff) = {}) &
   (setX /= {} => ran(setX*setY) = setY)
   
   &
   /* more cardinality properties */
   card(ff||gg) = card(ff)*card(gg) &
   card(ff*gg) = card(ff)*card(gg) &
   card(ff><gg) <= card(ff)*card(gg) 
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

  set_ff_cart = BEGIN ff:= setX*setY END;
  set_gg_cart = BEGIN gg:= setX*setY END;

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
