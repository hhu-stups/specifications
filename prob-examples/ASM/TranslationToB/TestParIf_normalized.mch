MACHINE TestParIf_normalized
DEFINITIONS
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == FALSE
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy
INVARIANT
 xx:ID & yy : POW(ID)
INITIALISATION 
/* ORIGINAL FORM for $initialise_machine

   xx := aa
||
   yy := {}
  NORMAL FORM: */
ANY xx__1,xx__upd_,yy__1,yy__upd_
WHERE 
    xx__1 = aa
  & xx__upd_ = TRUE
  & yy__1 = {}
  & yy__upd_ = TRUE
THEN
     xx := {TRUE |-> xx__1,FALSE |-> xx}(xx__upd_)
  ||
     yy := {TRUE |-> yy__1,FALSE |-> yy}(yy__upd_)
END
OPERATIONS
/* ORIGINAL FORM for Test

   xx := aa
||
   skip
  NORMAL FORM: */
  Test = 
ANY xx__1,xx__upd_
WHERE 
    xx__1 = aa
  & xx__upd_ = TRUE
THEN
  xx := {TRUE |-> xx__1,FALSE |-> xx}(xx__upd_)
END;

/* ORIGINAL FORM for Set

   IF xx = aa THEN
     xx := bb
   END
||
   IF xx = bb THEN
     xx := cc
   END
% merging_parameter(xx__1)
% merging_parameter(xx__upd_)
  NORMAL FORM: */
  Set = 
ANY xx__1,xx__upd_,xx__upd_1,xx__upd_2
WHERE 
    (xx = aa => xx__1 = bb & xx__upd_1 = TRUE)
  & (not(xx = aa) => xx__upd_1 = FALSE)
  & (xx = bb => xx__1 = cc & xx__upd_2 = TRUE)
  & (not(xx = bb) => xx__upd_2 = FALSE)
  & (xx__upd_ = TRUE) <=> (xx__upd_1 = TRUE or xx__upd_2 = TRUE)
THEN
  xx := {TRUE |-> xx__1,FALSE |-> xx}(xx__upd_)
END;

/* ORIGINAL FORM for Set2

   IF xx = aa THEN
     xx := bb
   END
||
   IF xx = bb THEN
     yy := {xx}
   ELSE
     yy := {}
   END
% merging_parameter(yy__1)
% merging_parameter(yy__upd_)
  NORMAL FORM: */
  Set2 = 
ANY xx__1,xx__upd_,yy__1,yy__upd_
WHERE 
    (xx = aa => xx__1 = bb & xx__upd_ = TRUE)
  & (not(xx = aa) => xx__upd_ = FALSE)
  & (xx = bb => yy__1 = {xx} & yy__upd_ = TRUE)
  & (not(xx = bb) => yy__1 = {} & yy__upd_ = TRUE)
THEN
     xx := {TRUE |-> xx__1,FALSE |-> xx}(xx__upd_)
  ||
     yy := {TRUE |-> yy__1,FALSE |-> yy}(yy__upd_)
END
ASSERTIONS
  {TRUE |-> 1, FALSE|->2}(FALSE) = 2;
  {TRUE |-> xx, FALSE|->aa}(FALSE) = aa
END