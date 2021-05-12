MACHINE FunLawsWithLambdaMemo
// Version using abstract constants

SETS
  setX = {el1,el2}; setY = {y1,y2}

ABSTRACT_CONSTANTS
  ff  /*@desc memo */,
  gg  /*@desc memo */,
  sx, sy
CONSTANTS
  ff_shadow
, gg_shadow
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 1000; SET_PREF_TRACE_INFO == TRUE;
 law1 ==  (dom(ff\/gg) = dom(ff) \/ dom(gg));
 law2 ==  (ran(ff\/gg) = ran(ff) \/ ran(gg));
 law3 ==  (dom(ff/\gg) <: dom(ff) /\ dom(gg));
 law4 ==  (ran(ff/\gg) <: ran(ff) /\ ran(gg));
 law5 ==  ( (ff \/ gg)~ = ff~ \/ gg~);
 law6 ==  (dom((ff ; (gg~))) <: dom(ff));
 law7 ==  (!(xx,yy).(xx:setX & yy:setY & xx|->yy : ff  =>  yy: ran(gg))
             =>  (dom((ff ; (gg~))) = dom(ff)));
 law8 ==  (ff : setX --> setY  <=>  (ff: setX +-> setY & dom(ff) = setX));
 ff_is_pf == (!(xx,yy,zz).((xx:setX & yy:setY & zz:setY &
                   xx|->yy:ff & xx|->zz:ff) => (yy=zz)));
 law9 ==  (ff : setX +-> setY  <=> ff_is_pf);

 law10 == (ff : setX >->> setY  <=>  (ff : setX >-> setY  &  ff~: setY >-> setX));
 law11 == (ff : setX >+> setY  <=> (ff: setX +-> setY &
                                    !(xx,yy).(xx:setX & yy:setX & xx/=yy & xx:dom(ff) &
                                      yy: dom(ff)  => ff(xx)/=ff(yy))))  ;

 law12 == (ff : setX +->> setY  <=>  (ff: setX +-> setY &
                                      !yy.(yy:setY => yy: ran(ff))));
 law13 == (ff: setX >-> setY  <=> (ff: setX >+> setY & ff: setX --> setY));
 law14 == (ff: setX -->> setY <=> (ff: setX +->> setY & ff: setX --> setY));
 law15 == (ff: setX >->> setY <=> (ff: setX -->> setY & ff: setX >-> setY));

ASSERTIONS

 ff: setX <-> setY & gg: setX <-> setY &

 ff \/ {} = ff &
 ff \/ ff = ff &
 ff /\ ff = ff &
 ff /\ {} = {} &

 law1 & law2 & law3 & law4 & law5 &
 law6 & law7 & law8 &

 law9 & law10 & law11 & law12 &

 law13 & law14 & law15 &

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

 (!xx.(xx:dom(ff) & ff:dom(ff)+->ran(ff) => ff(xx):ran(ff))) &

 (dom(ff) = {xx | xx: setX & #yy.(yy:setY & xx|->yy:ff)}) &
 (ran(ff) = {yy | yy: setY & #xx.(xx:setX & xx|->yy:ff)}) &


 (ff: setX +-> setY => !(xx).(xx:setY & xx:ran(ff) => #ii.(ii:setX & ii:dom(ff) & ff(ii)=xx))) &

 ff[dom(ff)] = ran(ff) &

 (!xx.(xx:setX => ff[{xx}] = {yy | yy:setY & xx |->yy : ff}))&

 (!(xx,xx2).(xx:setX & xx2:setX => ff[{xx,xx2}] = {yy | yy:setY & ((xx |->yy : ff) or (xx2|->yy: ff)) })) &

 (ff~[ff[setX]] = dom(ff)) &

 (ff~[setY] = dom(ff)) &

 (ff[setX] = ran(ff)) &

 (ff: setX >+> setY  =>  !xx.(xx<:dom(ff) => ff~[ff[xx]] = xx))

   &
   (ff /\ gg /= {}  <=>   #ee.(ee:ff & ee:gg) )
   &
   ( ff /<: gg  <=>  #ee.(ee:ff & ee/:gg))
   &
   ( ff<<:gg <=>  (ff<:gg & #ee.(ee:gg & ee/:ff)))

   &


    /* cardinality propagation laws */
   (card(ff)>-1 & card(ff) >= 0) &
   ( ff: sx +-> sy  =>  card(ff) <= card(sx) ) &
   ( ff: sx --> sy  => card(ff) = card(sx) ) &
   ( ff: sx +->> sy => card(ff) >= card(sy) ) &
   ( ff: sx >->> sy => (card(ff) = card(sy) & card(ff) = card(sx) )) &
   (  card(ff \/ gg) <= card(ff)+card(gg)) &
   (  card(ff /\ gg) <= min({card(ff),card(gg)}) ) &
   ( card(ff) >= card(dom(ff)) & card(ff) >= card(ran(ff))) &
   (  card(ff - gg) <= card(ff) & card(ff-gg) >= card(ff)-card(gg)) &
   (  ff <<: gg => card(ff) < card(gg) ) &
   (  ff <: gg => card(ff) <= card(gg) ) &
   ( card(ff~) = card(ff) ) &
   ( card( ff <+ gg) <= card(ff)+card(gg) ) &
   ( ff: sx >-> setY => card(ff[sx]) = card(sx) ) &
   ( ff: setX >+> setY => card(dom(ff)) = card(ran(ff)) ) &
   ( card(ff |> sy) <= card(ff) & card(ff |>> sy) <= card(ff)) &
   ( ff: setX >+> setY => card(ff |>> sy) >= card(ff)-card(sy)) &
   ( card(sx <| ff) <= card(ff) & card(sx <<| ff) <= card(ff)) &
   ( ff: setX +-> setY =>  card(sx <<| ff) >= card(ff)-card(sx)) &
   /* TO DO: more rules about |> , |>>, <|, <<| */


   /* functionality propagation laws */
   ( ff: sx >+> sy => ff~: sy +-> sx) &
   ( ff: setX +-> setY => sx <| ff: sx +-> setY) &
   ( ff: setX +-> setY => sx <<| ff: (setX-sx) +-> setY) &
   ( ff: setX +-> setY =>  ff |> sy : setX +-> sy) &
   ( ff: setX +-> setY =>  ff |>> sy : setX +-> (setY-sy)) &
   ( ff: setX +-> setY & gg: setX +-> setY => ff <+ gg : setX +-> setY) &

   /* TO DO: injectivitiy propagation laws */

   /* membership propagation laws */
   !x.(x:(ff\/gg) & x/: ff => x:gg) &
   !x.(x:ff => x : (ff\/gg) ) &
   !x.(x:(ff/\gg) => (x:ff & x:gg)) &
   /* TO DO: add more */

   /* ran, dom propagation laws */
   /* some laws already above, law1 .. la26: dom(ff \/ gg) = dom(ff) \/ dom(gg) etc */
   dom(sx <| ff) = dom(ff) /\ sx &
   dom(sx <<| ff) = dom(ff) - sx &
   ran(sx <| ff) <: ran(ff) &
   ran(sx <<| ff) <: ran(ff) &
   ran(ff |> sy) = ran(ff) /\ sy &
   ran(ff |>> sy) = ran(ff) - sy &
   dom(ff |> sy) <: dom(ff) &
   dom(ff |>> sy) <: dom(ff) &
   dom(ff<+gg) = dom(ff) \/ dom(gg) &
   ran(gg) <: ran(ff<+gg) &


   /* some new laws */
   (ff |> sy = ff |>> (setY - sy)) &
   (ff |>> sy = ff |> (setY - sy)) &
   (sx <| ff = (setX-sx) <<| ff) &
   (sx <<| ff = (setX-sx) <| ff) &
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
   (ff||gg) = (prj1(setX,setX);ff) >< (prj2(setX,setX);gg) &

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
   (ff: setX --> setY => (dom(ff) = setX)) &
   dom(ff~) = ran(ff) &
   dom(ff ; (gg~)) = ff~[dom(gg~)] &
   (ran(ff) <: dom(gg~) => dom(ff ; (gg~)) = dom(ff) ) &
   dom(id(setX)) = setX &
   dom(setX <| ff) = setX /\ dom(ff) &
   dom(ff |> setY) = ff~[setY] &
   dom(setX <<| ff) = dom(ff)-setX &
   (ff: setX +-> setY => dom(ff |>> setY) = dom(ff) - ff~[setY]) &
   dom(ff<+gg) = dom(ff) \/ dom(gg) &
   dom(ff><gg) = dom(ff) /\ dom(gg) &
   dom(ff||gg) = dom(ff) * dom(gg) &
   dom(ff \/ gg) = dom(ff) \/ dom(gg) &
   (ff:setX +-> setY & gg:setX +-> setY &
     dom(ff) <| gg = dom(gg) <| ff
    => (dom(ff /\ gg) = dom(ff) /\ dom(gg) &
       dom(ff - gg) = dom(ff) - dom(gg))
    ) &
   dom({ 1|-> 2}) = {1} &
   (ff={} => dom(ff) = {}) &
   (setY /= {} => dom(setX*setY) = setX) &

   /* Range Properties from pages 102-103 of B-Book */
   (ff: setX +->> setY => (ran(ff) = setY)) &
   ran(ff~) = dom(ff) &
   ran((ff ; (gg~))) = (gg~)[ran(ff)] &
   (dom(gg~) <: ran(ff) => ran((ff ; (gg~))) = ran(gg~)) /* error in B-Book: should be ran(q) not ran(p) */ &
   ran(id(setX)) = setX &
   ran(setX <| ff) = ff[setX] &
   ran(ff |> setY) = ran(ff) /\ setY &
   (ff~:setY +-> setX => ran(setX <<| ff) = ran(ff)-ff[setX]) &
   ran(ff |>> setY) = ran(ff) - setY &
   ran(ff <+ gg) = ran(dom(gg)<<|ff) \/ ran(gg) &
   ran(ff><gg) = (ff~ ; gg) &
   ran(ff||gg) = ran(ff)*ran(gg) &
   ran(ff \/ gg) = ran(ff) \/ ran(gg) &
   (ff~:setY +-> setX & gg~:setY +-> setX &
     ff |> ran(gg) = gg |> ran(ff)
    => (ran(ff /\ gg) = ran(ff) /\ ran(gg) &
        ran(ff - gg) = ran(ff) - ran(gg))) &
   ran({ 1|-> 2}) = {2} &
   (ff={} => ran(ff) = {}) &
   (setX /= {} => ran(setX*setY) = setY)

PROPERTIES
   sx <: setX &
   sy <: setY &
   ff_shadow : setX +-> setY &
   gg_shadow : setX +-> setY &

   ff = %xx.(xx:dom(ff_shadow) | ff_shadow(xx)) &
   gg = %xx.(xx:dom(gg_shadow) | gg_shadow(xx))

END




