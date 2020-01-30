MACHINE RelLaws
/* This machine is intended so that you can check whether ProB deals
with basic laws associated to functions and relations. ProB should
not find an invariant violation. */
SETS
setX = {el1,el2}; setY = {y1,y2}

VARIABLES
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
 GOAL == !yy.(yy:setY => yy: ran(ff))



INVARIANT

ff: setX <-> setY & gg: setX <-> setY & rx: setX <-> setX & ry: setY <-> setY &
hh: setX <-> setX &


( (ff<+gg) = (gg \/ (dom(gg)<<|ff)) )
&
 ( ff<+{} = ff &  {}<+ff = ff &  ff<+ff = ff) &
/*( (ff+>gg) = (ff \/ (dom(ff)<<|gg)) )
&
( (ff+>gg) = (gg<+ff) )
&*/
(ff~ = {yy,xx|xx:dom(ff)&yy:ran(ff)&({xx|->yy}<:ff)})
&
(id(ff) = {xx,yy|xx:ff&yy:ff&xx=yy})
&
(prj1(ff,gg) = ({xx,yy,zz|xx:(ff)&yy:(gg)&zz=xx}) )
&
(prj2(ff,gg) = ({xx,yy,zz|xx:(ff)&yy:(gg)&zz=yy}) )
&
  (iterate(hh,1)=(hh)) /* should raise type error */
&
/* some laws about the direct product */

(dom(ff><gg) = dom(ff)/\dom(gg)) 
&
ran(ff><gg) = {y,z|y:ran((dom(gg))<|(ff)) & z:ran((dom(ff))<|(gg)) &
                   #(x).(x:setX & x:dom(ff) & x:dom(gg) & x|->y:ff & x|->z:gg)}
&
!(fx,fy,gy).(fx:setX & fy:setY & gy:setY =>
                  ((fx|->fy:ff & fx|->gy:gg) <=> fx|->(fy,gy) : (ff><gg))) &
/* some laws about the parallel product */
dom((ff||gg)) = dom(ff)*dom(gg) &
ran((ff||gg)) = ran(ff)*ran(gg) &
!(fx,fy,gx,gy).(fx:setX & gx:setX & fy:setY & gy:setY =>
                  ((fx|->fy:ff & gx|->gy:gg) <=> (fx,gx)|->(fy,gy) : (ff||gg))) &

/* TLC sometimes produces a stack overflow */
/* (!(nn).((nn:0..100 &nn>0) => (iterate(hh,nn)=(iterate(hh,nn-1);hh)))) 
& */


(id(setX) ; ff) = ff &
(id(setX) ; rx) = rx &
(id(setX) ; gg) = gg &
(id(setY) ; ry) = ry &

(rx ; ff)~ = (ff~ ; rx~) &

law1 & law2 & law3 & law4 & law5 & 
law6 & law7 & law8
& law9 & law10 & law11 & law12
& law13 & law14 & law15 &

 orderlaw1  & orderlaw3  &
   setcomprlaw1  & setcomprlaw4 &
   foralllaw1 & foralllaw2  & existslaw2 &

   orderlaw5 & 
   orderlaw8 & orderlaw9 &
   otherlaw1 & otherlaw1b & otherlaw2 & otherlaw3 & otherlaw4 & otherlaw5 & otherlaw6 &

   cardlaw1 & cardlaw2 & cardlaw3 & cardlaw4
   &
   difflaw1 & difflaw2
   &
   difflaw3 &

   (UNION(ss).(ss<:ff | ss) = ff) &
   (card(ff) /= 1  <=> UNION(ss).(ss<<:ff | ss) = ff) &
   (INTER(ss).(ss<:ff | ss) = {}) 


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
   ( dom(gg) <<| ff  = {xy|xy:ff & prj1(setX,setY)(xy)/:dom(gg)} )
   
    &
   rx <: closure1(rx) &
   rx <: closure(rx) &
   closure(rx) = closure(rx) \/ id( dom(rx) \/ ran(rx)) &
   closure(rx) = closure(rx \/ id( dom(rx) \/ ran(rx))) &
   closure(rx) = closure1(rx) \/ id( dom(rx) \/ ran(rx)) &
   closure(rx) = closure1(rx \/ id( dom(rx) \/ ran(rx))) &
   iterate(rx,1) = rx &
   /* closure1(rx) = UNION(n).(n>0 & n<= card(rx) | iterate(rx,n)) & */ /* can not be handles by TLC */
   iterate(rx,0) = id( dom(rx) \/ ran(rx) ) &
   (rx <: hh => (closure1(rx) <: closure1(hh) & closure(rx) <: closure(hh))) &
   closure1(rx) = closure1(closure1(rx)) &
   closure(rx) = closure(closure(rx)) &
   closure(rx) = closure1(closure(rx)) &
   
   (closure(rx) ; closure(rx)) = closure(rx) &
   
   closure(rx)~ = closure(rx~)  /* &
   
   (rx[ran(hh)] <: ran(hh) => closure(rx)[ran(hh)] = ran(hh)) */ /* this law is violated by current version of closure */
   
   &
   ff[{}] = {} & gg[{}] = {} & hh[{}] = {} &
   ff[dom(ff)] = ran(ff) &
   gg[dom(gg)] = ran(gg) &
   hh[dom(hh)] = ran(hh) &
   ff~[ran(ff)] = dom(ff) &
   gg~[ran(gg)] = dom(gg) &
   hh~[ran(hh)] = dom(hh) &
   

   /* (ff*hh = gg*hh  <=>  (((ff={} or hh={}) & (gg={} or hh={})) or (ff=gg & hh=hh))) & */ /* TLC cartesian product bug */
   (id(ff)=id(gg) <=> ff=gg) &
   (id(ff) <: id(gg) <=> ff <: gg)
   &
   fnc(ff) : dom(ff) --> POW(ran(ff)) &
   rel(fnc(ff)) = ff &
   !x.(x:dom(ff) => fnc(ff)(x) = ff[{x}]) &
   
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
   ff >< gg = {a,bc| #(b,c).(bc=(b,c) & (a,b) : ff & (a,c) : gg)} &
   prj1(setX,setY) = (id(setX) >< (setX * setY))~ &
   prj2(setX,setY) = ((setY*setX) >< id(setY))~ &
   (ff||hh) = (prj1(setX,setX);ff) >< (prj2(setX,setX);hh) &
   (ff||ry) = (prj1(setX,setY);ff) >< (prj2(setX,setY);ry) &
   
   ff[dom(gg)] = {b| #a.(a:dom(gg) & (a,b):ff)} & /* again error in B-Book (a,b) instead of (x,y) */
   gg <+ ff = {a,b | ( (a,b):gg & a/:dom(ff) ) or (a,b):ff} &
   prj1(setX,setY) = {a,b,c| (a,b,c) : setX*setY*setX & c=a} &
   prj2(setX,setY) = {a,b,c| (a,b,c) : setX*setY*setY & c=b} &
   (ff||hh) = {ab,cd | #(a,b,c,d).(ab=(a,b) & cd = (c,d) & (a,c):ff & (b,d):hh)} &
   (ff||ry) = {ab,cd | #(a,b,c,d).(ab=(a,b) & cd = (c,d) & (a,c):ff & (b,d):ry)}
INITIALISATION

ff,gg,hh,rx,ry := {},{},{},{},{}

OPERATIONS

add_ff(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: ff THEN
ff := ff \/ {xx |-> yy}
END;
add_gg(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: gg THEN
gg := gg \/ {xx |-> yy}
END;
add_hh(xx,yy) = PRE xx:setX & yy:setX & xx |-> yy /: hh THEN
hh := hh \/ {xx |-> yy}
END;
add_rx(xx,yy) = PRE xx:setX & yy:setX & xx |-> yy /: rx THEN
rx := rx \/ {xx |-> yy}
END;
add_ry(xx,yy) = PRE xx:setY & yy:setY & xx |-> yy /: ry THEN
ry := ry \/ {xx |-> yy}
END
END