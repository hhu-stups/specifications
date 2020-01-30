MACHINE LawsRelCsts
/* This machine is intended so that you can check whether ProB deals
with basic laws associated to functions and relations. ProB/Kodkod should
 not find a valuation for the CONSTANTS
 */
SETS
setX = {el1,el2}; setY = {y1,y2}

CONSTANTS
ff,gg,hh,rx,ry

DEFINITIONS
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
                                       yy: dom(ff)  => ff(xx)/=ff(yy)))) ;

  law12 == (ff : setX +->> setY  <=>  (ff: setX +-> setY &
                                       !yy.(yy:setY => yy: ran(ff))));

law13 == (ff: setX >-> setY <=> (ff: setX >+> setY & ff: setX --> setY));
law14 == (ff: setX -->> setY <=> (ff: setX +->> setY & ff: setX --> setY));
law15 == (ff: setX >->> setY <=> (ff: setX -->> setY & ff: setX >-> setY));


 orderlaw1 == (ff <: ff \/ gg & gg <: ff \/ gg);
 orderlaw3 == (ff /\ gg <: ff & ff /\ gg <: gg);

 setcomprlaw1 == ( {xx | xx: ff & xx:gg} = ff /\ gg);
 setcomprlaw4 == ( {xx | xx: ff & not(xx:gg)} = ff \ gg);

 foralllaw1 == (!xx.(xx:ff & xx:gg => xx: ff /\ gg));
 foralllaw2 == (!xx.(xx:ff & not(xx:gg) => (xx: ff \ gg & xx /: gg)));

 existslaw2 == (#xx.(xx:ff & xx/:gg) => not(ff \/ gg = gg) & not(ff \ gg = {}));


 /* laws for <<:, <:, /<: and /<<: */
 orderlaw5 == ( ff <<: gg  or ff /<<: gg );
 orderlaw8 == ( ff <: gg  or ff /<: gg );
 orderlaw9 == ( ff : POW(gg)  or ff /: POW(gg) );

 otherlaw1 == ( (ff <: gg & ff /<<: gg) => ff = gg);
 otherlaw1b ==(  ff <: gg => (ff /= gg  <=> ff <<: gg));
 otherlaw2 == ( (ff <<: gg ) => (ff /= gg & card(gg)>0));
 otherlaw3 == ( (ff = gg ) => ff /<<: gg);
 otherlaw4 == ( ff <<: gg  => ff <: gg);
 otherlaw5 == ( ff <<: gg => #xx.(xx:gg & xx/:ff));
 otherlaw6 == ( ff <: gg <=> !x.(x:ff => x:gg) );

 cardlaw1 == (ff <<: gg => (card(ff) < card(gg)));
 cardlaw2 == (ff <: gg => (card(ff) <= card(gg)));
 cardlaw3 == (card(ff) < card(gg) => (gg /<: ff));
 cardlaw4 == (card(ff \/ gg) <= (card(ff) + card(gg)));

 difflaw1 == (ff /\ gg = {}  <=> ff <: (setX*setY) - gg);
 difflaw2 == (ff \ gg = ff-gg);
 difflaw3 == (gg-ff = gg\ff);


  LAWS_TO_CHECK == (

( (ff<+gg) = (gg \/ (dom(gg)<<|ff)) )
&
 ( ff<+{} = ff &  {}<+ff = ff &  ff<+ff = ff)
 &
 /*( (ff+>gg) = (ff \/ (dom(ff)<<|gg)) )
&
( (ff+>gg) = (gg<+ff) )
&*/
(ff~ = {yy,xx|xx:dom(ff)&yy:ran(ff)&({xx|->yy}<:ff)})
&
/* (id(ff) = {xx,yy|xx:ff&yy:ff&xx=yy})
& NOT SUPPORED BY KODKOD; id on unary sets */
(prj1(ff,gg) = ({xx,yy,zz|xx:(ff)&yy:(gg)&zz=xx}) )
&
(prj2(ff,gg) = ({xx,yy,zz|xx:(ff)&yy:(gg)&zz=yy}) )
/* &
  (iterate(hh,1)=(hh)) iteration not supported by KODKOD */
&

/* direct product not supported by KODKOD
(dom(ff><gg) = dom(ff)/\dom(gg))
&
ran(ff><gg) = {y,z|y:ran((dom(gg))<|(ff)) & z:ran((dom(ff))<|(gg)) &
                   #(x).(x:setX & x:dom(ff) & x:dom(gg) & x|->y:ff & x|->z:gg)}
&
!(fx,fy,gy).(fx:setX & fy:setY & gy:setY =>
                  ((fx|->fy:ff & fx|->gy:gg) <=> fx|->(fy,gy) : (ff><gg))) & */

/* some laws about the parallel product ; not supported by KODKOD
dom((ff||gg)) = dom(ff)*dom(gg) &
ran((ff||gg)) = ran(ff)*ran(gg) &
!(fx,fy,gx,gy).(fx:setX & gx:setX & fy:setY & gy:setY =>
                  ((fx|->fy:ff & gx|->gy:gg) <=> (fx,gx)|->(fy,gy) : (ff||gg))) & */

/* (!(nn).((nn:0..100 &nn>0) => (iterate(hh,nn)=(iterate(hh,nn-1);hh))))
& */ /* not translatable by KODKOD */

 ff[dom(rx)] =  ran((id(dom(rx));ff)) &  /* rule f[S] = ran((id(S);f)) */(id(setX) ; ff) = ff & (ff ; id(setY)) = ff &
(id(setX) ; rx) = rx &
(id(setX) ; gg) = gg &
(id(setY) ; ry) = ry &
 (rx ; ff)~ = (ff~ ; rx~) &

law1 & law2 & law3 & law4 & law5 &
law6 & law7 & law8
& law9 & law10 & law11 & law12
& law13 & law14 & law15
&  orderlaw1  & orderlaw3  &
   setcomprlaw1  & setcomprlaw4 &
   foralllaw1 & foralllaw2  & existslaw2  &

   orderlaw5 &
   orderlaw8  & /* orderlaw9  & not translatable by KODKOD */
   otherlaw1 & otherlaw1b & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 & otherlaw6 &

   cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4 /* */
   &
   difflaw1 & difflaw2
   &
   difflaw3 /* &

   (UNION(ss).(ss<:ff | ss) = ff)  not supported by KODKOD &
   (card(ff) /= 1  <=> UNION(ss).(ss<<:ff | ss) = ff) &
   (INTER(ss).(ss<:ff | ss) = {})
*/

   &
   (ff /\ gg /= {}  <=>   #ee.(ee:ff & ee:gg) )
   &
   ( ff /<: gg  <=>  #ee.(ee:ff & ee/:gg))
   &
   ( ff<<:gg <=>  (ff<:gg & #ee.(ee:gg & ee/:ff)))

   &
   (ff: dom(gg) <-> ran(gg)  <=>  (dom(ff)<:dom(gg) & ran(ff) <:ran(gg)) )
&

   ( ff |>  ran(ff) = ff) &
   ( ff |>> ran(ff) = {}) &
   ( ff: setX +-> setY => (ff |>  ran(gg) = %fx.(fx:dom(ff) & ff(fx):ran(gg) | ff(fx)) ) ) &
   ( ff: setX +-> setY => (ff |>> ran(gg) = %fx.(fx:dom(ff) & ff(fx)/:ran(gg)| ff(fx)) ) ) &
   ( ff |>  ran(gg) = {xy|xy:ff & prj2(setX,setY)(xy):ran(gg)} ) &
   ( ff |>> ran(gg) = {xy|xy:ff & prj2(setX,setY)(xy)/:ran(gg)} ) &

   ( dom(ff)  <| ff = ff) &
   ( dom(ff) <<| ff = {}) &
   ( dom(gg)  <| ff  = {xy|xy:ff & prj1(setX,setY)(xy):dom(gg)} ) &
   ( dom(gg) <<| ff  = {xy|xy:ff & prj1(setX,setY)(xy)/:dom(gg)} ) &


   rx <: closure1(rx) &
 /*  iterate(rx,1) = rx &
   iterate(rx,0) = id( dom(rx) \/ ran(rx) ) &  not supported by KODKOD */
   closure1(rx) = closure1(closure1(rx)) &

   closure1(rx)~ = closure1(rx~) &

/*
(rx[ran(hh)] <: ran(hh) => closure(rx)[ran(hh)] = ran(hh)) */ /* this law is violated by current version of closure */


   /* Laws from page 170 of B-Book */
   /* closure1(rx) = UNION(n).(n>0 & n<= card(rx) | iterate(rx,n)) & not supported by KODKOD */
   //(closure1(rx) ; closure1(rx)) <: closure1(rx) &
   //closure1(rx) = closure1(closure1(rx)) &
   closure1(rx)~ = closure1(rx~) &
   (rx <: hh => closure1(rx) <: closure1(hh)) &
   closure1(rx)[ dom(hh) ] =  rx[dom(hh)] \/ ((closure1(rx);rx)[dom(hh)]) /* a = dom(hh) */ &
   /* closure1(rx)[dom(hh)] = UNION(n).(n>0 & n<= card(rx) | iterate(rx,n)[dom(hh)]) & not supported by KODKOD */
   (rx[dom(hh)] <: dom(hh) => closure1(rx)[dom(hh)] <: dom(hh)) /* a = dom(hh) */ &

   /* -- */
   ff[{}] = {} & gg[{}] = {} & hh[{}] = {} &
   ff[dom(ff)] = ran(ff) &
   gg[dom(gg)] = ran(gg) &
   hh[dom(hh)] = ran(hh) &
   ff~[ran(ff)] = dom(ff) &
   gg~[ran(gg)] = dom(gg) &
   hh~[ran(hh)] = dom(hh) &


   (ff*hh = gg*hh  <=>  (((ff={} or hh={}) & (gg={} or hh={})) or (ff=gg & hh=hh))) &
 /*  (id(ff)=id(gg) <=> ff=gg) &
   (id(ff) <: id(gg) <=> ff <: gg)
   &
   fnc(ff) : dom(ff) --> POW(ran(ff)) &
   rel(fnc(ff)) = ff &
   !x.(x:dom(ff) => fnc(ff)(x) = ff[{x}]) not supported by KODKOD */

   /* Definitions from page 78 of B-Book */
   ff~ = {b,a| (a,b):ff} &
   dom(ff) = {a | #b.( a|->b : ff)} &
   ran(ff) = dom(ff~) &
   (ff;ry) = {a,c| #b.((a,b):ff & (b,c):ry)} &
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

/* Laws from page 111 of B-Book */
   (ff ; ry)[dom(hh)] = ry[ff[dom(hh)]]  /* p=ff, q=ry, u=dom(hh) */ &
  ((dom(hh) <: dom(ff) & ff~: setY +-> setX) => (ff ; ff~)[dom(hh)] = dom(hh)) &
 /*   id(dom(hh))[dom(ff)] = dom(hh) /\ dom(ff) not ok for KODKOD */ /* u=dom(hh), v = dom(ff) & */
   /* ... laws not yet encoded ... */
   (dom(hh)/\dom(ff) /= {} => (dom(hh) * dom(ry)) [dom(ff)] = dom(ry)) /*t=dom(ry), u=dom(hh), v=dom(ff) */ &
   (dom(hh)/\dom(ff) = {} => (dom(hh) * dom(ry)) [dom(ff)] = {}) /*t=dom(ry), u=dom(hh), v=dom(ff) */


   & /* Law from Oliveira TSE paper (Alloy meets the Algebra of Programming: a Case Study) */
  /* (rx ; {}) = {} & {} = ({} ; rx) & KODKOD Fails to extract types */
    (ff ; gg~) = {b,c| #a.( (b,a):ff & (a,c):gg~)} &
  /* ((ff~ ; ff) <: id(setY) <=> ff : setX +-> setY) &  not ok for KODKOD */
   (rx ; (ff ; ry)) =  ((rx ; ff) ; ry) &
   rx <: (rx ; rx~ ; rx) &

      /* Inverse Properties from page 100 of B-Book */
   (ff~)~ = ff &
   (ff ; (gg~))~ = ((gg~)~ ; ff~) &
   /* id(setX)~ = id(setX) & not supported by KODKOD */
   (setX <| ff)~ = ff~ |> setX &
   (ff |> setY)~ = setY <| ff~ &
   (setX <<| ff)~ = ff~ |>> setX &
   (ff |>> setY)~ = setY <<| ff~ &
   (ff <+ gg)~ = (ff~|>>dom(gg)) \/ gg~ &
   /* (ff || gg)~ = (ff~ || gg~) & not supported by KODKOD  */
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
   /* dom(id(setX)) = setX & not supported by KODKOD  */
   dom(setX <| ff) = setX /\ dom(ff) &
   dom(ff |> setY) = ff~[setY] &
   dom(setX <<| ff) = dom(ff)-setX &
   (ff: setX +-> setY => dom(ff |>> setY) = dom(ff) - ff~[setY]) &
   dom(ff<+gg) = dom(ff) \/ dom(gg) &
   /* dom(ff><gg) = dom(ff) /\ dom(gg) & not supported by KODKOD  */
   /* dom(ff||gg) = dom(ff) * dom(gg) & not supported by KODKOD  */
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
   /* ran(id(setX)) = setX & not supported by KODKOD  */
   ran(setX <| ff) = ff[setX] &
   ran(ff |> setY) = ran(ff) /\ setY &
   (ff~:setY +-> setX => ran(setX <<| ff) = ran(ff)-ff[setX]) &
   ran(ff |>> setY) = ran(ff) - setY &
   ran(ff <+ gg) = ran(dom(gg)<<|ff) \/ ran(gg) &
   /* ran(ff><gg) = (ff~ ; gg) & not supported by KODKOD  */
   /* ran(ff||gg) = ran(ff)*ran(gg) & not supported by KODKOD  */
   ran(ff \/ gg) = ran(ff) \/ ran(gg) &
   (ff~:setY +-> setX & gg~:setY +-> setX &
     ff |> ran(gg) = gg |> ran(ff)
    => (ran(ff /\ gg) = ran(ff) /\ ran(gg) &
        ran(ff - gg) = ran(ff) - ran(gg))) &
   ran({ 1|-> 2}) = {2} &
   (ff={} => ran(ff) = {}) &
   (setX /= {} => ran(setX*setY) = setY) &

	/* a few more rules trying to use set comprehensions,... so that closures get used */
	ff = {v1,v2|v1:setX & v2:setY & v1|->v2 :ff} &
	 (ff: setX+->setY => !z.(z:dom(ff) => {v1,v2|v1:setX & v2:setY & v1|->v2 :ff}(z) = ff(z))) &
	 (ff: setX+->{y1}  => !z.(z:dom(ff) => {v1,v2|v1:setX & v2:setY & v1|->v2 :ff}(z) = y1)) &

	/* (ff \/ {el1 |-> y1, el1 |-> y2}) /: setX+->setY &  KODKOD FAILS TO EXTRACT TYPES */
	 {el1|->y1, el2|->y2}(el2) = y2 &
	 {el1|->y1, el2|->y2}(el1) = y1 &
	 ran({el1|->y1, el2|->y1}) = {y1} &
	 dom({el1|->y1, el2|->y1}) = setX &

  ({1|->2} ; {2|->3}) = {1|->3}


  ); // LAWS_TO_CHECK

  closure_laws == (
   rx <: closure(rx) &
   closure(rx) = closure(rx) \/ id( dom(rx) \/ ran(rx)) &
   closure(rx) = closure(rx \/ id( dom(rx) \/ ran(rx))) &
   closure1(rx) \/ id( dom(rx) \/ ran(rx)) <: closure(rx) &  // ProB interpretation of closure was =
   closure1(rx \/ id( dom(rx) \/ ran(rx))) <: closure(rx) &  // ProB interpretation of closure was =
   closure1(rx) \/ id( setX ) = closure(rx) & // new Defintion of closure
   closure1(rx \/ id( setX )) = closure(rx) & // new Defintion of closure
   closure(rx) = closure(closure(rx)) &
   closure(rx) = closure1(closure(rx)) &
   (closure(rx) ; closure(rx)) = closure(rx) &
   (rx <: hh => (closure1(rx) <: closure1(hh) & closure(rx) <: closure(hh))) &

   closure(rx)~ = closure(rx~)
                   );

 GOAL == !yy.(yy:setY => yy: ran(ff))



PROPERTIES

ff: setX <-> setY & gg: setX <-> setY & rx: setX <-> setX & ry: setY <-> setY &
hh: setX <-> setX &

not
 ((LAWS_TO_CHECK)
  &  (closure_laws)
 )

ASSERTIONS
  LAWS_TO_CHECK;
  closure_laws
END
