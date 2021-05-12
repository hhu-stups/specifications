
MACHINE RelLaws_internal
SETS /* enumerated */
  setX={el1,el2};
  setY={y1,y2}
ABSTRACT_VARIABLES
  ff,
  gg,
  hh,
  rx,
  ry
INVARIANT
    ff : POW(setX * setY)
  & gg : POW(setX * setY)
  & hh : POW(setX * setX)
  & rx : POW(setX * setX)
  & ry : POW(setY * setY)
  & ff <+ gg = gg \/ (dom(gg) <<| ff)
  & ff <+ {} = ff
  & {} <+ ff = ff
  & ff <+ ff = ff
  & ff~ = {yy,xx|yy : setY & xx : setX & (xx : dom(ff) & yy : ran(ff) & xx |-> yy : ff)}
  & id(ff) = {xx,yy|xx : setX * setY & yy : setX * setY & (xx : ff & yy : ff & xx = yy)}
  & prj1(ff,gg) = %(xx,yy).(xx : setX * setY & yy : setX * setY & (xx : ff & yy : gg)|xx)
  & prj2(ff,gg) = %(xx,yy).(xx : setX * setY & yy : setX * setY & (xx : ff & yy : gg)|yy)
  & iterate(hh,1) = hh
  & dom(ff >< gg) = dom(ff) /\ dom(gg)
  & ran(ff >< gg) = {y,z|y : setY & z : setY & (y : ran(dom(gg) <| ff) & z : ran(dom(ff) <| gg) & #x.(x : setX & (x : dom(ff) & x : dom(gg) & x |-> y : ff & x |-> z : gg)))}
  &
    !(fx,fy,gy).(
     (
      fx : setX
      &
      fy : setY
      &
      gy : setY
     )
     =>
     (
      (
       fx |-> fy : ff
       &
       fx |-> gy : gg
      )
      <=>
      (fx |-> (fy |-> gy) : ff >< gg)
     )
    )
  & card(ff >< gg) <= card(ff) * card(gg)
  & dom((ff || gg)) = dom(ff) * dom(gg)
  & ran((ff || gg)) = ran(ff) * ran(gg)
  & card((ff || gg)) = card(ff) * card(gg)
  & (ff || gg) = {xy,mn|xy : setX * setX & mn : setY * setY & #(x,y,m,n).(x : setX & y : setX & m : setY & n : setY & (xy = x |-> y & mn = m |-> n & x |-> m : ff & y |-> n : gg))}
  &
    !(fx,fy,gx,gy).(
     (
      fx : setX
      &
      fy : setY
      &
      gx : setX
      &
      gy : setY
     )
     =>
     (
      (
       fx |-> fy : ff
       &
       gx |-> gy : gg
      )
      <=>
      (fx |-> gx |-> (fy |-> gy) : (ff || gg))
     )
    )
  &
    !nn.(
     (
      nn : INTEGER
      &
      nn : 0 .. 100
      &
      nn > 0
     )
     =>
     iterate(hh,nn) = (iterate(hh,nn - 1) ; hh)
    )
  & ff[dom(rx)] = ran((id(dom(rx)) ; ff))
  & (id(setX) ; ff) = ff
  & (ff ; id(setY)) = ff
  & (id(setX) ; rx) = rx
  & (id(setX) ; gg) = gg
  & (id(setY) ; ry) = ry
  & (rx ; ff)~ = (ff~ ; rx~)
  & dom(ff \/ gg) = dom(ff) \/ dom(gg)
  & ran(ff \/ gg) = ran(ff) \/ ran(gg)
  & dom(ff /\ gg) <: dom(ff) /\ dom(gg)
  & ran(ff /\ gg) <: ran(ff) /\ ran(gg)
  & (ff \/ gg)~ = ff~ \/ gg~
  & dom((ff ; gg~)) <: dom(ff)
  & (

     !(xx,yy).(
      (
       xx : setX
       &
       yy : setY
       &
       xx |-> yy : ff
      )
      =>
      yy : ran(gg)
     )
     =>
     dom((ff ; gg~)) = dom(ff)
    )
  & (
     (ff : setX --> setY)
     <=>
     (
      ff : setX +-> setY
      &
      dom(ff) = setX
     )
    )
  & (
     (ff : setX +-> setY)
     <=>

     !(xx,yy,zz).(
      (
       xx : setX
       &
       yy : setY
       &
       zz : setY
       &
       xx |-> yy : ff
       &
       xx |-> zz : ff
      )
      =>
      yy = zz
     )
    )
  & (
     (ff : setX >->> setY)
     <=>
     (
      ff : setX >-> setY
      &
      ff~ : setY >-> setX
     )
    )
  & (
     (ff : setX >+> setY)
     <=>
     (
      ff : setX +-> setY
      &

      !(xx,yy).(
       (
        xx : setX
        &
        yy : setX
        &
        xx /= yy
        &
        xx : dom(ff)
        &
        yy : dom(ff)
        &
        1=1 /* LEQ_SYM_BREAK(xx,yy) */
       )
       =>
       ff(xx) /= ff(yy)
      )
     )
    )
  & (
     (ff : setX +->> setY)
     <=>
     (
      ff : setX +-> setY
      &

      !yy.(
       yy : setY
       =>
       yy : ran(ff)
      )
     )
    )
  & (
     (ff : setX >-> setY)
     <=>
     (
      ff : setX >+> setY
      &
      ff : setX --> setY
     )
    )
  & (
     (ff : setX -->> setY)
     <=>
     (
      ff : setX +->> setY
      &
      ff : setX --> setY
     )
    )
  & (
     (ff : setX >->> setY)
     <=>
     (
      ff : setX -->> setY
      &
      ff : setX >-> setY
     )
    )
  & ff <: ff \/ gg
  & gg <: ff \/ gg
  & ff /\ gg <: ff
  & ff /\ gg <: gg
  & {xx|xx : setX * setY & (xx : ff & xx : gg)} = ff /\ gg
  & {xx|xx : setX * setY & (xx : ff & not(xx : gg))} = ff - gg
  &
    !xx.(
     (
      xx : setX * setY
      &
      xx : ff
      &
      xx : gg
     )
     =>
     xx : ff /\ gg
    )
  &
    !xx.(
     (
      xx : setX * setY
      &
      xx : ff
      &
      not(xx : gg)
     )
     =>
     (
      xx : ff - gg
      &
      xx /: gg
     )
    )
  & (
     #xx.(xx : setX * setY & (xx : ff & xx /: gg))
     =>
     (
      not(ff \/ gg = gg)
      &
      not(ff - gg = {})
     )
    )
  & (
     ff <<: gg
     or
     ff /<<: gg
    )
  & (
     ff <: gg
     or
     ff /<: gg
    )
  & (
     ff : POW(gg)
     or
     ff /: POW(gg)
    )
  & (
     (
      ff <: gg
      &
      ff /<<: gg
     )
     =>
     ff = gg
    )
  & (
     ff <: gg
     =>
     (
      ff /= gg
      <=>
      ff <<: gg
     )
    )
  & (
     ff <<: gg
     =>
     (
      ff /= gg
      &
      gg /= {}
     )
    )
  & (
     ff = gg
     =>
     ff /<<: gg
    )
  & (
     ff <<: gg
     =>
     ff <: gg
    )
  & (
     ff <<: gg
     =>
     #xx.(xx : setX * setY & (xx : gg & xx /: ff))
    )
  & (
     ff <: gg
     <=>

     !x.(
      (
       x : setX * setY
       &
       x : ff
      )
      =>
      x : gg
     )
    )
  & (
     ff <<: gg
     =>
     card(ff) < card(gg)
    )
  & (
     ff <: gg
     =>
     card(ff) <= card(gg)
    )
  & (
     card(ff) < card(gg)
     =>
     gg /<: ff
    )
  & card(ff \/ gg) <= card(ff) + card(gg)
  & (
     (ff /\ gg = {})
     <=>
     ff <: setX * setY - gg
    )
  & union({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX * setY) & #ss.(ss : POW(setX * setY) & (ss <: ff & RANGE_LAMBDA__ = ss))}) = ff
  & (
     card(ff) /= 1
     <=>
     (union({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX * setY) & #ss.(ss : POW(setX * setY) & (ss <<: ff & RANGE_LAMBDA__ = ss))}) = ff)
    )
  & inter({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX * setY) & #ss.(ss : POW(setX * setY) & (ss <: ff & RANGE_LAMBDA__ = ss))}) = {}
  & (
     (ff /\ gg) /= {}
     <=>
     (ff /\ gg) /= {}
    )
  & (
     ff /<: gg
     <=>
     #ee.(ee : setX * setY & (ee : ff & ee /: gg))
    )
  & (
     ff <<: gg
     <=>
     (
      ff <: gg
      &
      #ee.(ee : setX * setY & (ee : gg & ee /: ff))
     )
    )
  & (
     (ff : dom(gg) <-> ran(gg))
     <=>
     (
      dom(ff) <: dom(gg)
      &
      ran(ff) <: ran(gg)
     )
    )
  & ff |> {} = {}
  & ff |> ran(ff) = ff
  & ff |>> {} = ff
  & ff |>> ran(ff) = {}
  & (
     ff : setX +-> setY
     =>
     ff |> ran(gg) = %fx.(fx : setX & (fx : dom(ff) & ff(fx) : ran(gg))|ff(fx))
    )
  & (
     ff : setX +-> setY
     =>
     ff |>> ran(gg) = %fx.(fx : setX & (fx : dom(ff) & ff(fx) /: ran(gg))|ff(fx))
    )
  & ff |> ran(gg) = {xy|xy : setX * setY & (xy : ff & prj2(setX,setY)(xy) : ran(gg))}
  & ff |>> ran(gg) = {xy|xy : setX * setY & (xy : ff & prj2(setX,setY)(xy) /: ran(gg))}
  & {} <| ff = {}
  & dom(ff) <| ff = ff
  & {} <<| ff = ff
  & dom(ff) <<| ff = {}
  & dom(gg) <| ff = {xy|xy : setX * setY & (xy : ff & prj1(setX,setY)(xy) : dom(gg))}
  & dom(gg) <<| ff = {xy|xy : setX * setY & (xy : ff & prj1(setX,setY)(xy) /: dom(gg))}
  & {dd|dd : POW(setX) & dd <| ff = ff} = {dd|dd : POW(setX) & dom(ff) <: dd}
  & {rr|rr : POW(setY) & ff |> rr = ff} = {rr|rr : POW(setY) & ran(ff) <: rr}
  & {dd|dd : POW(setX) & dd <<| ff = ff} = {dd|dd : POW(setX) & dom(ff) /\ dd = {}}
  & {rr|rr : POW(setY) & ff |>> rr = ff} = {rr|rr : POW(setY) & ran(ff) /\ rr = {}}
  & rx <: closure1(rx)
  & rx <: closure(rx)
  & id(dom(rx) \/ ran(rx)) <: closure(rx)
  & closure(rx) = closure(rx) \/ id(dom(rx) \/ ran(rx))
  & closure(rx) = closure(rx \/ id(dom(rx) \/ ran(rx)))
  & closure1(rx) <: closure(rx)
  & id(dom(rx) \/ ran(rx)) <: closure(rx)
  & closure1(rx \/ id(dom(rx) \/ ran(rx))) <: closure(rx)
  & closure1(rx) \/ id(setX) = closure(rx)
  & closure1(rx \/ id(setX)) = closure(rx)
  & iterate(rx,1) = rx
  & iterate(rx,0) = id(setX)
  & (
     rx <: hh
     =>
     (
      closure1(rx) <: closure1(hh)
      &
      id(setX) <: closure(hh)
      &
      closure1(rx) <: closure(hh)
     )
    )
  & closure(rx) = closure(closure(rx))
  & closure(rx) = closure1(closure(rx))
  & (closure(rx) ; closure(rx)) = closure(rx)
  & closure(rx)~ = closure(rx~)
  & (
     rx[dom(hh)] <: dom(hh)
     =>
     closure(rx)[dom(hh)] = dom(hh)
    )
  & closure1(rx) = union({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX * setX) & #n.(n : INTEGER & (n : 1 .. card(rx) & RANGE_LAMBDA__ = iterate(rx,n)))})
  & closure(rx) = union({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX * setX) & #n.(n : INTEGER & (n : 0 .. card(rx) & RANGE_LAMBDA__ = iterate(rx,n)))})
  & (closure1(rx) ; closure1(rx)) <: closure1(rx)
  & closure1(rx) = closure1(closure1(rx))
  & closure1(rx)~ = closure1(rx~)
  & (
     rx <: hh
     =>
     closure1(rx) <: closure1(hh)
    )
  & closure1(rx)[dom(hh)] = rx[dom(hh)] \/ (closure1(rx) ; rx)[dom(hh)]
  & closure1(rx)[dom(hh)] = union({RANGE_LAMBDA__|RANGE_LAMBDA__ : POW(setX) & #n.(n : INTEGER & (n : 1 .. card(rx) & RANGE_LAMBDA__ = iterate(rx,n)[dom(hh)]))})
  & (
     rx[dom(hh)] <: dom(hh)
     =>
     closure1(rx)[dom(hh)] <: dom(hh)
    )
  & ff[{}] = {}
  & gg[{}] = {}
  & hh[{}] = {}
  & ff[dom(ff)] = ran(ff)
  & gg[dom(gg)] = ran(gg)
  & hh[dom(hh)] = ran(hh)
  & (ff~)[ran(ff)] = dom(ff)
  & (gg~)[ran(gg)] = dom(gg)
  & (hh~)[ran(hh)] = dom(hh)
  & (
     (ff * hh = gg * hh)
     <=>
     (
      (
       (
        ff = {}
        or
        hh = {}
       )
       &
       (
        gg = {}
        or
        hh = {}
       )
      )
      or
      ff = gg
     )
    )
  & (
     (id(ff) = id(gg))
     <=>
     (ff = gg)
    )
  & (
     id(ff) <: id(gg)
     <=>
     ff <: gg
    )
  & %fnc_x.(fnc_x : setX & fnc_x : dom(ff)|ff[{fnc_x}]) : dom(ff) --> POW(ran(ff))
  & {rel_x,rel_y|rel_x : setX & rel_y : setY & (rel_x : dom(ff) & rel_y : union(%fnc_x.(fnc_x : setX & fnc_x : dom(ff)|ff[{fnc_x}])[{rel_x}]))} = ff
  &
    !x.(
     (
      x : setX
      &
      x : dom(ff)
     )
     =>
     %fnc_x.(fnc_x : setX & fnc_x : dom(ff)|ff[{fnc_x}])(x) = ff[{x}]
    )
  & ff~ = {b,a|b : setY & a : setX & a |-> b : ff}
  & dom(ff) = {a|a : setX & #b.(b : setY & a |-> b : ff)}
  & ran(ff) = dom(ff~)
  & (ff ; ry) = {a,c|a : setX & c : setY & #b.(b : setY & (a |-> b : ff & b |-> c : ry))}
  & id(dom(ff)) = {a,b|a : setX & b : setX & (a |-> b : dom(ff) * dom(ff) & a = b)}
  & dom(ff) <| gg = (id(dom(ff)) ; gg)
  & gg |> ran(ff) = (gg ; id(ran(ff)))
  & dom(ff) <<| gg = dom(gg) - dom(ff) <| gg
  & gg |>> ran(ff) = gg |> ran(gg) - ran(ff)
  & ran(ff) = {b|b : setY & #a.(a : setX & a |-> b : ff)}
  & dom(ff) <| gg = {a,b|a : setX & b : setY & (a |-> b : gg & a : dom(ff))}
  & gg |> ran(ff) = {a,b|a : setX & b : setY & (a |-> b : gg & b : ran(ff))}
  & dom(ff) <<| gg = {a,b|a : setX & b : setY & (a |-> b : gg & a /: dom(ff))}
  & gg |>> ran(ff) = {a,b|a : setX & b : setY & (a |-> b : gg & b /: ran(ff))}
  & ff[dom(gg)] = ran(dom(gg) <| ff)
  & gg <+ ff = (dom(ff) <<| gg) \/ ff
  & ff >< gg = {a,bc|a : setX & bc : setY * setY & #(b,c).(b : setY & c : setY & (bc = b |-> c & a |-> b : ff & a |-> c : gg))}
  & prj1(setX,setY) = (id(setX) >< setX * setY)~
  & prj2(setX,setY) = (setY * setX >< id(setY))~
  & (ff || hh) = (prj1(setX,setX) ; ff) >< (prj2(setX,setX) ; hh)
  & (ff || ry) = (prj1(setX,setY) ; ff) >< (prj2(setX,setY) ; ry)
  & ff[dom(gg)] = {b|b : setY & #a.(a : setX & (a : dom(gg) & a |-> b : ff))}
  & gg <+ ff = {a,b|a : setX & b : setY & ((a |-> b : gg & a /: dom(ff)) or a |-> b : ff)}
  & prj1(setX,setY) = {a,b,c|a : setX & b : setY & c : setX & c = a}
  & prj2(setX,setY) = {a,b,c|a : setX & b : setY & c : setY & c = b}
  & (ff || hh) = {ab,cd|ab : setX * setX & cd : setY * setX & #(a,b,c,d).(a : setX & b : setX & c : setY & d : setX & (ab = a |-> b & cd = c |-> d & a |-> c : ff & b |-> d : hh))}
  & (ff || ry) = {ab,cd|ab : setX * setY & cd : setY * setY & #(a,b,c,d).(a : setX & b : setY & c : setY & d : setY & (ab = a |-> b & cd = c |-> d & a |-> c : ff & b |-> d : ry))}
  & (ff ; ry)[dom(hh)] = ry[ff[dom(hh)]]
  & (
     (
      dom(hh) <: dom(ff)
      &
      ff~ : setY +-> setX
     )
     =>
     (ff ; ff~)[dom(hh)] = dom(hh)
    )
  & id(dom(hh))[dom(ff)] = dom(hh) /\ dom(ff)
  & (
     (dom(hh) /\ dom(ff)) /= {}
     =>
     (dom(hh) * dom(ry))[dom(ff)] = dom(ry)
    )
  & (
     dom(hh) /\ dom(ff) = {}
     =>
     (dom(hh) * dom(ry))[dom(ff)] = {}
    )
  & (rx ; {}) = {}
  & {} = ({} ; rx)
  & (ff ; gg~) = {b,c|b : setX & c : setX & #a.(a : setY & (b |-> a : ff & c |-> a : gg))}
  & (
     (ff~ ; ff) <: id(setY)
     <=>
     (ff : setX +-> setY)
    )
  & (rx ; (ff ; ry)) = ((rx ; ff) ; ry)
  & rx <: ((rx ; rx~) ; rx)
INITIALISATION
    BEGIN
      ff,gg,hh,rx,ry := {},{},{},{},{}
    END
OPERATIONS
  add_ff(xx,yy) =
    PRE
        xx : setX
      & yy : setY
      & (xx |-> yy) /: ff
    THEN
      ff := ff \/ {xx |-> yy}
    END;

  add_gg(xx,yy) =
    PRE
        xx : setX
      & yy : setY
      & (xx |-> yy) /: gg
    THEN
      gg := gg \/ {xx |-> yy}
    END;

  add_hh(xx,yy) =
    PRE
        xx : setX
      & yy : setX
      & (xx |-> yy) /: hh
    THEN
      hh := hh \/ {xx |-> yy}
    END;

  add_rx(xx,yy) =
    PRE
        xx : setX
      & yy : setX
      & (xx |-> yy) /: rx
    THEN
      rx := rx \/ {xx |-> yy}
    END;

  add_ry(xx,yy) =
    PRE
        xx : setY
      & yy : setY
      & (xx |-> yy) /: ry
    THEN
      ry := ry \/ {xx |-> yy}
    END
END
