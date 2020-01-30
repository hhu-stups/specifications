MACHINE TestParIf2_normalized
DEFINITIONS
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == FALSE;
 SET_PREF_SHOW_EVENTB_ANY_VALUES == TRUE;
 GOAL == %(UU_uf_7).(UU_uf_7 : POW(ID * ID)|%(ff_uf_4).(ff_uf_4 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((FALSE = TRUE => z__ = ff) & (not(FALSE = TRUE) => z__ = ff))}(TRUE))(%(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((TRUE = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(TRUE = TRUE) => z__ = UU_uf_8))}(TRUE))({z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((FALSE = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(FALSE = TRUE) => z__ = UU_uf_7))}(TRUE))))(ff) = ff
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy, ff
INVARIANT
 xx:ID & yy : POW(ID) & ff: ID +-> ID
INITIALISATION xx:=aa || yy := {} || ff := {}
OPERATIONS
/* ORIGINAL FORM for Set2

   IF xx = aa THEN
        xx := bb
     ||
        ff(xx) := xx
   END
||
   IF xx = bb THEN
     yy := {xx}
   ELSE
        yy := {}
     ||
        ff(xx) := aa
   END

  NORMAL FORM: */
  Set2 = 
ANY xx__1,xx__upd_,ff__upd_1,yy__1,yy__upd_,ff__upd_2
WHERE 
    (xx = aa => (xx__1 = bb & xx__upd_ = TRUE) & ff__upd_1 = TRUE)
  & (not(xx = aa) => xx__upd_ = FALSE & ff__upd_1 = FALSE)
  & (xx = bb => (yy__1 = {xx} & yy__upd_ = TRUE) & ff__upd_2 = FALSE)
  & (not(xx = bb) => (yy__1 = {} & yy__upd_ = TRUE) & ff__upd_2 = TRUE)
THEN
     ff := ff <+ ({TRUE |-> {xx |-> xx},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> aa},FALSE |-> {}}(ff__upd_2))
  ||
     xx := {TRUE |-> xx__1,FALSE |-> xx}(xx__upd_)
  ||
     yy := {TRUE |-> yy__1,FALSE |-> yy}(yy__upd_)
END;

/* ORIGINAL FORM for Set3

   IF xx = aa THEN
     ff(xx) := aa
   ELSE
     ff(xx) := bb
   END
||
   IF xx = bb THEN
     ff(xx) := bb
   ELSE
     ff(xx) := cc
   END

  NORMAL FORM: */
  Set3 = 
ANY ff__upd_1,ff__upd_2,ff__upd_3,ff__upd_4
WHERE 
    (xx = aa => ff__upd_1 = TRUE & ff__upd_2 = FALSE)
  & (not(xx = aa) => ff__upd_2 = TRUE & ff__upd_1 = FALSE)
  & (xx = bb => ff__upd_3 = TRUE & ff__upd_4 = FALSE)
  & (not(xx = bb) => ff__upd_4 = TRUE & ff__upd_3 = FALSE)
THEN
     ff := ff <+ (({TRUE |-> {xx |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_2)) \/ ({TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_3) \/ {TRUE |-> {xx |-> cc},FALSE |-> {}}(ff__upd_4)))
END;

/* ORIGINAL FORM for Set4

   IF xx = aa THEN
     ff(aa) := aa
   ELSE
     ff(xx) := bb
   END
||
   IF xx /= cc THEN
     ff := (ff <+ {xx |-> bb}) <+ {aa |-> aa}
   END
update(ff,b(identifier(aa),global(ID),[nodeid(pos(114,1,23,27,23,28)),loc(local,TestParIf2,enumerated_elements),readonly,enumerated_set_element,def(enumerated_element,TestParIf2)]))
update(ff,b(identifier(xx),global(ID),[nodeid(pos(119,1,23,45,23,46)),loc(local,TestParIf2,abstract_variables)]))
merge_fun_update(ff)
merge_partial_and_full_update(ff)
ff__upd_ = TRUE => {TRUE |-> {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_2) <: ff__1
not(ff__upd_ = TRUE) => ff__1 = ff <+ ({TRUE |-> {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_2))
  NORMAL FORM: */
  
 /* Set4 = 
ANY ff__upd_1,ff__upd_2,ff__,ff__upd_
WHERE 
    (xx = aa => ff__upd_1 = TRUE & ff__upd_2 = FALSE)
  & (not(xx = aa) => ff__upd_2 = TRUE & ff__upd_1 = FALSE)
  & (xx /= cc => ff__ = (ff <+ {xx |-> bb}) <+ {aa |-> aa} & ff__upd_ = TRUE)
  & (not(xx /= cc) => ff__upd_ = FALSE)
THEN
  PRE 
      {} = (({TRUE |-> ({aa} <| ff) - {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ({xx} <| ff) - {xx |-> bb},FALSE |-> {}}(ff__upd_2)) \/ {TRUE |-> ID * ID - {TRUE |-> ff__,FALSE |-> ff}(ff__upd_),FALSE |-> {}}(ff__upd_)) /\ (({TRUE |-> {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_2)) \/ {TRUE |-> ff__,FALSE |-> {}}(ff__upd_))
  THEN
    ff := ff - (({TRUE |-> ({aa} <| ff) - {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ({xx} <| ff) - {xx |-> bb},FALSE |-> {}}(ff__upd_2)) \/ {TRUE |-> ID * ID - {TRUE |-> ff__,FALSE |-> ff}(ff__upd_),FALSE |-> {}}(ff__upd_)) \/ (({TRUE |-> {aa |-> aa},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> {xx |-> bb},FALSE |-> {}}(ff__upd_2)) \/ {TRUE |-> ff__,FALSE |-> {}}(ff__upd_))
  END
END */
  Set4 = 
ANY ff__upd_1,ff__upd_2,ff__,ff__upd_
WHERE 
    (xx = aa => ff__upd_1 = TRUE & ff__upd_2 = FALSE)
  & (not(xx = aa) => ff__upd_2 = TRUE & ff__upd_1 = FALSE)
  & (xx /= cc => ff__ = (ff <+ {xx |-> bb}) <+ {aa |-> aa} & ff__upd_ = TRUE)
  & (not(xx /= cc) => ff__upd_ = FALSE)
THEN
  PRE 
      %(ff_uf_7).(ff_uf_7 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_ = TRUE => z__ = ff__) & (not(ff__upd_ = TRUE) => z__ = ff_uf_7))}(TRUE))(%(UU_uf_7).(UU_uf_7 : POW(ID * ID)|%(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_2 = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(ff__upd_2 = TRUE) => z__ = UU_uf_8))}(TRUE))({z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_1 = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(ff__upd_1 = TRUE) => z__ = UU_uf_7))}(TRUE)))(ff)) = %(UU_uf_7).(UU_uf_7 : POW(ID * ID)|%(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_2 = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(ff__upd_2 = TRUE) => z__ = UU_uf_8))}(TRUE))({z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_1 = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(ff__upd_1 = TRUE) => z__ = UU_uf_7))}(TRUE)))(%(ff_uf_7).(ff_uf_7 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_ = TRUE => z__ = ff__) & (not(ff__upd_ = TRUE) => z__ = ff_uf_7))}(TRUE))(ff))
    & %(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_2 = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(ff__upd_2 = TRUE) => z__ = UU_uf_8))}(TRUE))(%(UU_uf_7).(UU_uf_7 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_1 = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(ff__upd_1 = TRUE) => z__ = UU_uf_7))}(TRUE))(ff)) = %(UU_uf_7).(UU_uf_7 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_1 = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(ff__upd_1 = TRUE) => z__ = UU_uf_7))}(TRUE))(%(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_2 = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(ff__upd_2 = TRUE) => z__ = UU_uf_8))}(TRUE))(ff))
  THEN
    ff := %(UU_uf_7).(UU_uf_7 : POW(ID * ID)|%(ff_uf_7).(ff_uf_7 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_ = TRUE => z__ = ff__) & (not(ff__upd_ = TRUE) => z__ = ff_uf_7))}(TRUE))(%(UU_uf_8).(UU_uf_8 : POW(ID * ID)|{z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_2 = TRUE => z__ = UU_uf_8 <+ {xx |-> bb}) & (not(ff__upd_2 = TRUE) => z__ = UU_uf_8))}(TRUE))({z_,z__|(z_ : BOOL & z__ : POW(ID * ID)) & ((ff__upd_1 = TRUE => z__ = UU_uf_7 <+ {aa |-> aa}) & (not(ff__upd_1 = TRUE) => z__ = UU_uf_7))}(TRUE))))(ff)
  END
END
;

  Conflict = 
ANY ff__upd_1,ff__,ff__upd_
WHERE 
    ff__upd_1 = TRUE
  & ff__ = {bb |-> cc}
  & ff__upd_ = TRUE
THEN
  PRE 
      {} = ({TRUE |-> ({aa} <| ff) - {aa |-> bb},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ID * ID - {TRUE |-> ff__,FALSE |-> ff}(ff__upd_),FALSE |-> {}}(ff__upd_)) /\ ({TRUE |-> {aa |-> bb},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ff__,FALSE |-> {}}(ff__upd_))
  THEN
    ff := ff -
     ({TRUE |-> ({aa} <| ff) - {aa |-> bb},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ID * ID - {TRUE |-> ff__,FALSE |-> ff}(ff__upd_),FALSE |-> {}}(ff__upd_)) 
     \/
      ({TRUE |-> {aa |-> bb},FALSE |-> {}}(ff__upd_1) \/ {TRUE |-> ff__,FALSE |-> {}}(ff__upd_))
  END
END


;
 SetXX(vv) = PRE vv:ID & vv/=xx THEN xx := vv END; 
 SetFF(vv,zz) = PRE vv:ID & zz:ID & vv|->zz /: ff THEN ff(vv) := zz END;
 r <-- GetFF = BEGIN r := ff END
END

