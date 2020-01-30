MACHINE m3_act0_inv2_as_b
SETS /* enumerated */
  EV={prs_ev,dpr_ev,opn_ev,cls_ev,ext_ev,rtr_ev,no_ev}
DEFINITIONS
 /* SET_PREF_CSE == TRUE; */
 SET_PREF_DISPROVER_MODE == TRUE;
 SET_PREF_CHR == FALSE;
 SET_PREF_SMT == FALSE
CONSTANTS H, N, NOT, R, X, act_ev, alarm_boolean, alarm_door_gear_switch, ana_closing, ana_cls, ana_opening, ana_opn, anomaly, change, ext, gears_locked_down, gears_maneuvering, green_light, h, opening_switch, orange_light, red_light, timing, which_ev, which_ev_OLD, working_door_gear_switch
PROPERTIES


 H=TRUE & NOT = {FALSE|->TRUE, TRUE|->FALSE} &
 N={((FALSE|->prs_ev)|->opn_ev),((FALSE|->dpr_ev)|->no_ev),((FALSE|->opn_ev)|->ext_ev),
 ((FALSE|->cls_ev)|->dpr_ev),((FALSE|->ext_ev)|->cls_ev),((FALSE|->rtr_ev)|->cls_ev),((FALSE|->no_ev)
  |->prs_ev),((TRUE|->prs_ev)|->opn_ev),((TRUE|->dpr_ev)|->no_ev),((TRUE|->opn_ev)|->rtr_ev)
  ,((TRUE|->cls_ev)|->dpr_ev),((TRUE|->ext_ev)|->cls_ev),((TRUE|->rtr_ev)|->cls_ev),
  ((TRUE|->no_ev)|->prs_ev)} &
  R = {(prs_ev|->dpr_ev),(dpr_ev|->prs_ev),(opn_ev|->cls_ev),(cls_ev|->opn_ev),(ext_ev|->rtr_ev),(
  rtr_ev|->ext_ev)} &
  act_ev = {(FALSE|->ext_ev),(TRUE|->rtr_ev)} &
  /* alarm_boolean=FALSE & alarm_door_gear_switch=0 &
  h=FALSE &
  opening_switch=0 &
  which_ev = no_ev &
  which_ev_OLD = prs_ev &
  timing = {(prs_ev|->2000),(dpr_ev|->10000),(opn_ev|->7000),(cls_ev|->7000),(ext_ev|->10000),(rtr_ev|->10000)} & */


 1000 : 0 .. 100000
&
(EV = {prs_ev}\/{dpr_ev}\/{opn_ev}\/{cls_ev}\/{ext_ev}\/{rtr_ev}\/{no_ev} & {prs_ev}/\{dpr_ev} = {} & {prs_ev}/\{opn_ev} = {} & {prs_ev}/\{cls_ev} = {} & {prs_ev}/\{ext_ev} = {} & {prs_ev}/\{rtr_ev} = {} & {prs_ev}/\{no_ev} = {} & {dpr_ev}/\{opn_ev} = {} & {dpr_ev}/\{cls_ev} = {} & {dpr_ev}/\{ext_ev} = {} & {dpr_ev}/\{rtr_ev} = {} & {dpr_ev}/\{no_ev} = {} & {opn_ev}/\{cls_ev} = {} & {opn_ev}/\{ext_ev} = {} & {opn_ev}/\{rtr_ev} = {} & {opn_ev}/\{no_ev} = {} & {cls_ev}/\{ext_ev} = {} & {cls_ev}/\{rtr_ev} = {} & {cls_ev}/\{no_ev} = {} & {ext_ev}/\{rtr_ev} = {} & {ext_ev}/\{no_ev} = {} & {rtr_ev}/\{no_ev} = {})
&
NOT : BOOL --> BOOL
&
NOT(TRUE) = FALSE
&
TRUE : dom(NOT)
&
NOT : BOOL +-> BOOL
&
NOT(FALSE) = TRUE
&
FALSE : dom(NOT)
&
act_ev : BOOL --> {ext_ev,rtr_ev}
&
act_ev(TRUE) = rtr_ev
&
TRUE : dom(act_ev)
&
act_ev : BOOL +-> EV
&
act_ev(FALSE) = ext_ev
&
FALSE : dom(act_ev)
&
change : {ext_ev,rtr_ev} --> {ext_ev,rtr_ev}
&
change(ext_ev) = rtr_ev
&
ext_ev : dom(change)
&
change : EV +-> EV
&
change(rtr_ev) = ext_ev
&
rtr_ev : dom(change)
&
R : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} --> {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
&
R(opn_ev) = cls_ev
&
opn_ev : dom(R)
&
R : EV +-> EV
&
R(cls_ev) = opn_ev
&
cls_ev : dom(R)
&
R(prs_ev) = dpr_ev
&
prs_ev : dom(R)
&
R(dpr_ev) = prs_ev
&
dpr_ev : dom(R)
&
R(ext_ev) = rtr_ev
&
ext_ev : dom(R)
&
R(rtr_ev) = ext_ev
&
rtr_ev : dom(R)
&
!(ev).(ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} => R(ev) /= ev)
&
!(ev).(ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} => R(R(ev)) = ev)
&
!(ev).(ev : dom(R) => R(ev) : dom(R))
&
N : BOOL * EV --> EV
&
N(TRUE |-> no_ev) = prs_ev
&
TRUE |-> no_ev : dom(N)
&
N : BOOL * EV +-> EV
&
N(TRUE |-> prs_ev) = opn_ev
&
TRUE |-> prs_ev : dom(N)
&
N(TRUE |-> opn_ev) = rtr_ev
&
TRUE |-> opn_ev : dom(N)
&
N(TRUE |-> rtr_ev) = cls_ev
&
TRUE |-> rtr_ev : dom(N)
&
N(TRUE |-> ext_ev) = cls_ev
&
TRUE |-> ext_ev : dom(N)
&
N(TRUE |-> cls_ev) = dpr_ev
&
TRUE |-> cls_ev : dom(N)
&
N(TRUE |-> dpr_ev) = no_ev
&
TRUE |-> dpr_ev : dom(N)
&
N(FALSE |-> no_ev) = prs_ev
&
FALSE |-> no_ev : dom(N)
&
N(FALSE |-> prs_ev) = opn_ev
&
FALSE |-> prs_ev : dom(N)
&
N(FALSE |-> opn_ev) = ext_ev
&
FALSE |-> opn_ev : dom(N)
&
N(FALSE |-> rtr_ev) = cls_ev
&
FALSE |-> rtr_ev : dom(N)
&
N(FALSE |-> ext_ev) = cls_ev
&
FALSE |-> ext_ev : dom(N)
&
N(FALSE |-> cls_ev) = dpr_ev
&
FALSE |-> cls_ev : dom(N)
&
N(FALSE |-> dpr_ev) = no_ev
&
FALSE |-> dpr_ev : dom(N)
&
timing : {prs_ev,opn_ev,rtr_ev,ext_ev,cls_ev,dpr_ev} --> 0 .. 10000
&
timing(prs_ev) = 2000
&
prs_ev : dom(timing)
&
timing : EV +-> INTEGER
&
timing(opn_ev) = 7000
&
opn_ev : dom(timing)
&
timing(rtr_ev) = 10000
&
rtr_ev : dom(timing)
&
timing(ext_ev) = 10000
&
ext_ev : dom(timing)
&
timing(cls_ev) = 7000
&
cls_ev : dom(timing)
&
timing(dpr_ev) = 10000
&
dpr_ev : dom(timing)
&
X : EV --> BOOL
&
!(ev).(ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} => (X(ev) = TRUE => X(R(ev)) = FALSE))
&
(
  which_ev = no_ev
  =>
  X(cls_ev) = TRUE
)
&
(
  which_ev = no_ev
  =>
  (
    cls_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  which_ev = dpr_ev
  =>
  X(cls_ev) = TRUE
)
&
(
  which_ev = dpr_ev
  =>
  (
    cls_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  which_ev = prs_ev
  =>
  X(cls_ev) = TRUE
)
&
(
  which_ev = prs_ev
  =>
  (
    cls_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  which_ev = no_ev
  =>
  X(dpr_ev) = TRUE
)
&
(
  which_ev = no_ev
  =>
  (
    dpr_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  (
    which_ev = no_ev
    &
    ext = TRUE
  )
  =>
  X(ext_ev) = TRUE
)
&
(
  (
    which_ev = no_ev
    &
    ext = TRUE
  )
  =>
  (
    ext_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  (
    which_ev : {cls_ev,dpr_ev}
    &
    ext = FALSE
  )
  =>
  X(ext_ev) = TRUE
)
&
(
  (
    which_ev : {cls_ev,dpr_ev}
    &
    ext = FALSE
  )
  =>
  (
    ext_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  (
    which_ev : {no_ev,prs_ev,opn_ev}
    &
    ext = TRUE
  )
  =>
  X(ext_ev) = TRUE
)
&
(
  (
    which_ev : {no_ev,prs_ev,opn_ev}
    &
    ext = TRUE
  )
  =>
  (
    ext_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  which_ev = rtr_ev
  =>
  ext = TRUE
)
&
(
  which_ev = ext_ev
  =>
  ext = FALSE
)
&
(
  (
    which_ev = no_ev
    &
    ext = FALSE
  )
  =>
  X(rtr_ev) = TRUE
)
&
(
  (
    which_ev = no_ev
    &
    ext = FALSE
  )
  =>
  (
    rtr_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  (
    which_ev : {cls_ev,dpr_ev}
    &
    ext = TRUE
  )
  =>
  X(rtr_ev) = TRUE
)
&
(
  (
    which_ev : {cls_ev,dpr_ev}
    &
    ext = TRUE
  )
  =>
  (
    rtr_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  (
    which_ev : {prs_ev,opn_ev}
    &
    ext = FALSE
  )
  =>
  X(rtr_ev) = TRUE
)
&
(
  (
    which_ev : {prs_ev,opn_ev}
    &
    ext = FALSE
  )
  =>
  (
    rtr_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  which_ev = no_ev
  =>
  (
    X(cls_ev) = TRUE
    &
    X(dpr_ev) = TRUE
    &
    (
      ext = TRUE
      =>
      X(ext_ev) = TRUE
    )
    &
    (
      ext = FALSE
      =>
      X(rtr_ev) = TRUE
    )
  )
)
&
(
  which_ev = no_ev
  =>
  (
    cls_ev : dom(X)
    &
    X : EV +-> BOOL
    &
    (
      X(cls_ev) = TRUE
      =>
      (
        dpr_ev : dom(X)
        &
        (
          X(dpr_ev) = TRUE
          =>
          (
            (
              ext = TRUE
              =>
              ext_ev : dom(X)
            )
            &
            (
              (
                (
                  ext = TRUE
                  =>
                  X(ext_ev) = TRUE
                )
                &
                ext = FALSE
              )
              =>
              rtr_ev : dom(X)
            )
          )
        )
      )
    )
  )
)
&
(
  which_ev : {rtr_ev,ext_ev}
  =>
  X(opn_ev) = TRUE
)
&
(
  which_ev : {rtr_ev,ext_ev}
  =>
  (
    opn_ev : dom(X)
    &
    X : EV +-> BOOL
  )
)
&
(
  not(
    (
      which_ev = no_ev
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = TRUE
      )
      or
      which_ev /= no_ev
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = TRUE
      )
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
      )
    )
  )
  =>
  which_ev = no_ev
)
&
(
  which_ev = no_ev
  or
  (
    (
      which_ev /= no_ev
      =>
      (
        which_ev : dom(X)
        &
        X : EV +-> BOOL
      )
    )
    &
    (
      (
        which_ev /= no_ev
        &
        X(which_ev) = TRUE
      )
      or
      which_ev /= no_ev
      or
      (
        (
          which_ev /= no_ev
          =>
          (
            which_ev : dom(X)
            &
            X : EV +-> BOOL
            &
            (
              X(which_ev) = FALSE
              =>
              (
                which_ev : dom(R)
                &
                R : EV +-> EV
                &
                R(which_ev) : dom(X)
                &
                X : EV +-> BOOL
              )
            )
          )
        )
        &
        (
          (
            which_ev /= no_ev
            &
            X(which_ev) = FALSE
            &
            X(R(which_ev)) = TRUE
          )
          or
          (
            which_ev /= no_ev
            =>
            (
              which_ev : dom(X)
              &
              X : EV +-> BOOL
              &
              (
                X(which_ev) = FALSE
                =>
                (
                  which_ev : dom(R)
                  &
                  R : EV +-> EV
                  &
                  R(which_ev) : dom(X)
                  &
                  X : EV +-> BOOL
                )
              )
            )
          )
        )
      )
    )
  )
)
&
(
  which_ev = no_ev
  =>
  (
    H = h
    <=>
    ext = H
  )
)
&
(
  which_ev /= no_ev
  =>
  (
    H = h
    <=>
    ext /= H
  )
)
&
(
  not(
    (
      (
        which_ev = no_ev
        &
        H /= h
      )
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev /= no_ev
        &
        H /= h
      )
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = TRUE
      )
      or
      (
        which_ev /= no_ev
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
      )
    )
  )
  =>
  which_ev = no_ev
)
&
(
  (
    which_ev = no_ev
    &
    H /= h
  )
  or
  (
    (
      which_ev /= no_ev
      =>
      (
        which_ev : dom(X)
        &
        X : EV +-> BOOL
      )
    )
    &
    (
      (
        which_ev /= no_ev
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev /= no_ev
        &
        H /= h
      )
      or
      (
        (
          which_ev /= no_ev
          =>
          (
            which_ev : dom(X)
            &
            X : EV +-> BOOL
            &
            (
              X(which_ev) = FALSE
              =>
              (
                which_ev : dom(R)
                &
                R : EV +-> EV
                &
                R(which_ev) : dom(X)
                &
                X : EV +-> BOOL
              )
            )
          )
        )
        &
        (
          (
            which_ev /= no_ev
            &
            X(which_ev) = FALSE
            &
            X(R(which_ev)) = TRUE
          )
          or
          (
            which_ev /= no_ev
            =>
            (
              which_ev : dom(X)
              &
              X : EV +-> BOOL
              &
              (
                X(which_ev) = FALSE
                =>
                (
                  which_ev : dom(R)
                  &
                  R : EV +-> EV
                  &
                  R(which_ev) : dom(X)
                  &
                  X : EV +-> BOOL
                )
              )
            )
          )
        )
      )
    )
  )
)
&
(
  ana_cls = TRUE
  =>
  ana_opn = FALSE
)
&
(
  ana_closing = TRUE
  =>
  (
    ana_cls = FALSE
    &
    ana_opn = FALSE
  )
)
&
(
  ana_opening = TRUE
  =>
  (
    ana_opn = FALSE
    &
    ana_cls = FALSE
  )
)
&
(
  ana_opening = TRUE
  =>
  ana_closing = FALSE
)
&
(
  (
    which_ev = no_ev
    &
    H /= h
  )
  =>
  (
    (
      which_ev = no_ev
      &
      H /= h
      &
      ana_cls = TRUE
    )
    or
    ana_cls = TRUE
    or
    ana_closing = TRUE
    or
    (
      ana_cls = TRUE
      &
      ana_closing = FALSE
      &
      H = h
      &
      which_ev = no_ev
    )
    or
    ana_opening = TRUE
    or
    ana_opn = FALSE
  )
)
&
(
  ana_opening = TRUE
  =>
  H = h
)
&
(
  not(
    (
      (
        which_ev = no_ev
        &
        H /= h
        &
        ana_cls = TRUE
      )
      or
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
      )
      or
      (
        which_ev = dpr_ev
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(R(which_ev)) = TRUE
        &
        X(which_ev) = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
      )
      or
      (
        ana_opn = TRUE
        &
        ana_opening = FALSE
      )
      or
      ana_closing = TRUE
      or
      (
        ana_cls = TRUE
        &
        ana_closing = FALSE
        &
        H = h
        &
        which_ev = no_ev
      )
      or
      ana_opening = TRUE
    )
  )
  =>
  (
    ana_cls = FALSE
    or
    (
      h = FALSE
      &
      ana_cls = TRUE
      &
      which_ev = no_ev
      &
      X(prs_ev) = FALSE
      &
      X(dpr_ev) = TRUE
      &
      X(opn_ev) = FALSE
      &
      X(cls_ev) = TRUE
      &
      X(rtr_ev) = TRUE
    )
    or
    (
      h = TRUE
      &
      ana_cls = TRUE
      &
      which_ev = no_ev
      &
      X(prs_ev) = FALSE
      &
      X(dpr_ev) = TRUE
      &
      X(opn_ev) = FALSE
      &
      X(cls_ev) = TRUE
      &
      X(ext_ev) = TRUE
    )
  )
)
&
(
  (
    which_ev = no_ev
    &
    H /= h
    &
    ana_cls = TRUE
  )
  or
  (
    (
      which_ev : EV - {dpr_ev,no_ev}
      =>
      (
        which_ev : dom(X)
        &
        X : EV +-> BOOL
      )
    )
    &
    (
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
      )
      or
      (
        (
          which_ev = dpr_ev
          =>
          (
            which_ev : dom(X)
            &
            X : EV +-> BOOL
          )
        )
        &
        (
          (
            which_ev = dpr_ev
            &
            X(which_ev) = TRUE
            &
            H = h
          )
          or
          (
            (
              which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
              =>
              (
                which_ev : dom(R)
                &
                R : EV +-> EV
                &
                R(which_ev) : dom(X)
                &
                X : EV +-> BOOL
                &
                (
                  X(R(which_ev)) = TRUE
                  =>
                  (
                    which_ev : dom(X)
                    &
                    X : EV +-> BOOL
                  )
                )
              )
            )
            &
            (
              (
                which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                &
                X(R(which_ev)) = TRUE
                &
                X(which_ev) = FALSE
              )
              or
              (
                which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                =>
                (
                  which_ev : dom(X)
                  &
                  X : EV +-> BOOL
                  &
                  (
                    X(which_ev) = FALSE
                    =>
                    (
                      which_ev : dom(R)
                      &
                      R : EV +-> EV
                      &
                      R(which_ev) : dom(X)
                      &
                      X : EV +-> BOOL
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
&
(
  not(
    (
      (
        which_ev = no_ev
        &
        H /= h
        &
        ana_cls = TRUE
      )
      or
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
      )
      or
      (
        which_ev = dpr_ev
        &
        X(which_ev) = TRUE
        &
        H = h
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(R(which_ev)) = TRUE
        &
        X(which_ev) = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
      )
      or
      (
        ana_opn = TRUE
        &
        ana_opening = FALSE
      )
      or
      ana_closing = TRUE
      or
      (
        ana_cls = TRUE
        &
        ana_closing = FALSE
        &
        H = h
        &
        which_ev = no_ev
      )
      or
      ana_opening = TRUE
    )
  )
  =>
  (
    ana_cls = FALSE
    or
    (
      (
        (
          h = FALSE
          &
          ana_cls = TRUE
          &
          which_ev = no_ev
        )
        =>
        (
          prs_ev : dom(X)
          &
          X : EV +-> BOOL
          &
          (
            X(prs_ev) = FALSE
            =>
            (
              dpr_ev : dom(X)
              &
              X : EV +-> BOOL
              &
              (
                X(dpr_ev) = TRUE
                =>
                (
                  opn_ev : dom(X)
                  &
                  X : EV +-> BOOL
                  &
                  (
                    X(opn_ev) = FALSE
                    =>
                    (
                      cls_ev : dom(X)
                      &
                      X : EV +-> BOOL
                      &
                      (
                        X(cls_ev) = TRUE
                        =>
                        (
                          rtr_ev : dom(X)
                          &
                          X : EV +-> BOOL
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
      &
      (
        (
          h = FALSE
          &
          ana_cls = TRUE
          &
          which_ev = no_ev
          &
          X(prs_ev) = FALSE
          &
          X(dpr_ev) = TRUE
          &
          X(opn_ev) = FALSE
          &
          X(cls_ev) = TRUE
          &
          X(rtr_ev) = TRUE
        )
        or
        (
          (
            h = TRUE
            &
            ana_cls = TRUE
            &
            which_ev = no_ev
          )
          =>
          (
            prs_ev : dom(X)
            &
            X : EV +-> BOOL
            &
            (
              X(prs_ev) = FALSE
              =>
              (
                dpr_ev : dom(X)
                &
                X : EV +-> BOOL
                &
                (
                  X(dpr_ev) = TRUE
                  =>
                  (
                    opn_ev : dom(X)
                    &
                    X : EV +-> BOOL
                    &
                    (
                      X(opn_ev) = FALSE
                      =>
                      (
                        cls_ev : dom(X)
                        &
                        X : EV +-> BOOL
                        &
                        (
                          X(cls_ev) = TRUE
                          =>
                          (
                            ext_ev : dom(X)
                            &
                            X : EV +-> BOOL
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
&
working_door_gear_switch : 0 .. 100000
&
alarm_door_gear_switch : 0 .. 100000
&
opening_switch : 0 .. 100000
&
(
  gears_maneuvering = TRUE
  =>
  (
    gears_locked_down = FALSE
    &
    anomaly = FALSE
  )
)
&
(
  gears_locked_down = TRUE
  =>
  anomaly = FALSE
)
&
(
  not(
    (
      (
        H /= h
        &
        which_ev = no_ev
        &
        ana_cls = FALSE
        &
        alarm_boolean = FALSE
        &
        anomaly = FALSE
      )
      or
      (
        which_ev = no_ev
        &
        H /= h
        &
        ana_cls = TRUE
        &
        anomaly = FALSE
      )
      or
      (
        H = h
        &
        which_ev = no_ev
        &
        ana_cls = TRUE
        &
        anomaly = FALSE
        &
        alarm_boolean = TRUE
      )
      or
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
        &
        anomaly = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
        &
        anomaly = FALSE
      )
      or
      (
        which_ev = dpr_ev
        &
        X(which_ev) = TRUE
        &
        H = h
        &
        anomaly = FALSE
      )
      or
      (
        alarm_door_gear_switch = 0
        &
        alarm_boolean = TRUE
      )
      or
      (
        ana_opn = TRUE
        &
        ana_opening = FALSE
      )
      or
      (
        ana_closing = TRUE
        &
        working_door_gear_switch = 0
      )
      or
      (
        ana_cls = TRUE
        &
        ana_closing = FALSE
        &
        H = h
        &
        opening_switch = 0
      )
      or
      ana_opening = TRUE
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(R(which_ev)) = TRUE
        &
        X(which_ev) = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
        &
        which_ev_OLD = R(which_ev)
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
        &
        working_door_gear_switch = 0
        &
        which_ev_OLD = which_ev
      )
      or
      (
        gears_locked_down = TRUE
        &
        green_light = FALSE
        &
        orange_light = FALSE
        &
        red_light = FALSE
      )
      or
      (
        gears_locked_down = FALSE
        &
        green_light = TRUE
      )
      or
      (
        gears_maneuvering = TRUE
        &
        orange_light = FALSE
        &
        green_light = FALSE
        &
        red_light = FALSE
      )
      or
      (
        gears_maneuvering = FALSE
        &
        orange_light = TRUE
      )
      or
      (
        anomaly = TRUE
        &
        red_light = FALSE
        &
        green_light = FALSE
        &
        orange_light = FALSE
      )
    )
  )
  =>
  (
    ana_cls = FALSE
    or
    anomaly = TRUE
    or
    {working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0} /= {}
    or
    (
      act_ev(NOT(h)) = rtr_ev
      &
      ana_cls = TRUE
      &
      which_ev = no_ev
      &
      X(prs_ev) = FALSE
      &
      X(dpr_ev) = TRUE
      &
      X(opn_ev) = FALSE
      &
      X(cls_ev) = TRUE
      &
      X(rtr_ev) = TRUE
    )
    or
    (
      act_ev(NOT(h)) = ext_ev
      &
      ana_cls = TRUE
      &
      which_ev = no_ev
      &
      X(prs_ev) = FALSE
      &
      X(dpr_ev) = TRUE
      &
      X(opn_ev) = FALSE
      &
      X(cls_ev) = TRUE
      &
      X(ext_ev) = TRUE
    )
  )
)
&
(
  (
    H /= h
    &
    which_ev = no_ev
    &
    ana_cls = FALSE
    &
    alarm_boolean = FALSE
    &
    anomaly = FALSE
  )
  or
  (
    which_ev = no_ev
    &
    H /= h
    &
    ana_cls = TRUE
    &
    anomaly = FALSE
  )
  or
  (
    H = h
    &
    which_ev = no_ev
    &
    ana_cls = TRUE
    &
    anomaly = FALSE
    &
    alarm_boolean = TRUE
  )
  or
  (
    (
      which_ev : EV - {dpr_ev,no_ev}
      =>
      (
        which_ev : dom(X)
        &
        X : EV +-> BOOL
      )
    )
    &
    (
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
        &
        anomaly = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
        &
        anomaly = FALSE
      )
      or
      (
        (
          which_ev = dpr_ev
          =>
          (
            which_ev : dom(X)
            &
            X : EV +-> BOOL
          )
        )
        &
        (
          (
            which_ev = dpr_ev
            &
            X(which_ev) = TRUE
            &
            H = h
            &
            anomaly = FALSE
          )
          or
          (
            alarm_door_gear_switch = 0
            &
            alarm_boolean = TRUE
          )
          or
          (
            ana_opn = TRUE
            &
            ana_opening = FALSE
          )
          or
          (
            ana_closing = TRUE
            &
            working_door_gear_switch = 0
          )
          or
          (
            ana_cls = TRUE
            &
            ana_closing = FALSE
            &
            H = h
            &
            opening_switch = 0
          )
          or
          ana_opening = TRUE
          or
          (
            (
              which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
              =>
              (
                which_ev : dom(R)
                &
                R : EV +-> EV
                &
                R(which_ev) : dom(X)
                &
                X : EV +-> BOOL
                &
                (
                  X(R(which_ev)) = TRUE
                  =>
                  (
                    which_ev : dom(X)
                    &
                    X : EV +-> BOOL
                  )
                )
              )
            )
            &
            (
              (
                which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                &
                X(R(which_ev)) = TRUE
                &
                X(which_ev) = FALSE
              )
              or
              (
                (
                  which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                  =>
                  (
                    which_ev : dom(X)
                    &
                    X : EV +-> BOOL
                    &
                    (
                      X(which_ev) = FALSE
                      =>
                      (
                        which_ev : dom(R)
                        &
                        R : EV +-> EV
                        &
                        R(which_ev) : dom(X)
                        &
                        X : EV +-> BOOL
                        &
                        (
                          X(R(which_ev)) = FALSE
                          =>
                          (
                            which_ev : dom(R)
                            &
                            R : EV +-> EV
                          )
                        )
                      )
                    )
                  )
                )
                &
                (
                  (
                    which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                    &
                    X(which_ev) = FALSE
                    &
                    X(R(which_ev)) = FALSE
                    &
                    which_ev_OLD = R(which_ev)
                  )
                  or
                  (
                    which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
                    =>
                    (
                      which_ev : dom(X)
                      &
                      X : EV +-> BOOL
                      &
                      (
                        X(which_ev) = FALSE
                        =>
                        (
                          which_ev : dom(R)
                          &
                          R : EV +-> EV
                          &
                          R(which_ev) : dom(X)
                          &
                          X : EV +-> BOOL
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
&
(
  not(
    (
      (
        H /= h
        &
        which_ev = no_ev
        &
        ana_cls = FALSE
        &
        alarm_boolean = FALSE
        &
        anomaly = FALSE
      )
      or
      (
        which_ev = no_ev
        &
        H /= h
        &
        ana_cls = TRUE
        &
        anomaly = FALSE
      )
      or
      (
        H = h
        &
        which_ev = no_ev
        &
        ana_cls = TRUE
        &
        anomaly = FALSE
        &
        alarm_boolean = TRUE
      )
      or
      (
        which_ev : EV - {dpr_ev,no_ev}
        &
        X(which_ev) = TRUE
        &
        H = h
        &
        anomaly = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        H /= h
        &
        anomaly = FALSE
      )
      or
      (
        which_ev = dpr_ev
        &
        X(which_ev) = TRUE
        &
        H = h
        &
        anomaly = FALSE
      )
      or
      (
        alarm_door_gear_switch = 0
        &
        alarm_boolean = TRUE
      )
      or
      (
        ana_opn = TRUE
        &
        ana_opening = FALSE
      )
      or
      (
        ana_closing = TRUE
        &
        working_door_gear_switch = 0
      )
      or
      (
        ana_cls = TRUE
        &
        ana_closing = FALSE
        &
        H = h
        &
        opening_switch = 0
      )
      or
      ana_opening = TRUE
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(R(which_ev)) = TRUE
        &
        X(which_ev) = FALSE
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
        &
        which_ev_OLD = R(which_ev)
      )
      or
      (
        which_ev : {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        &
        X(which_ev) = FALSE
        &
        X(R(which_ev)) = FALSE
        &
        working_door_gear_switch = 0
        &
        which_ev_OLD = which_ev
      )
      or
      (
        gears_locked_down = TRUE
        &
        green_light = FALSE
        &
        orange_light = FALSE
        &
        red_light = FALSE
      )
      or
      (
        gears_locked_down = FALSE
        &
        green_light = TRUE
      )
      or
      (
        gears_maneuvering = TRUE
        &
        orange_light = FALSE
        &
        green_light = FALSE
        &
        red_light = FALSE
      )
      or
      (
        gears_maneuvering = FALSE
        &
        orange_light = TRUE
      )
      or
      (
        anomaly = TRUE
        &
        red_light = FALSE
        &
        green_light = FALSE
        &
        orange_light = FALSE
      )
    )
  )
  =>
  (
    ana_cls = FALSE
    or
    anomaly = TRUE
    or
    {working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0} /= {}
    or
    (
      h : dom(NOT)
      &
      NOT : BOOL +-> BOOL
      &
      NOT(h) : dom(act_ev)
      &
      act_ev : BOOL +-> EV
      &
      (
        (
          act_ev(NOT(h)) = rtr_ev
          &
          ana_cls = TRUE
          &
          which_ev = no_ev
        )
        =>
        (
          prs_ev : dom(X)
          &
          X : EV +-> BOOL
          &
          (
            X(prs_ev) = FALSE
            =>
            (
              dpr_ev : dom(X)
              &
              X : EV +-> BOOL
              &
              (
                X(dpr_ev) = TRUE
                =>
                (
                  opn_ev : dom(X)
                  &
                  X : EV +-> BOOL
                  &
                  (
                    X(opn_ev) = FALSE
                    =>
                    (
                      cls_ev : dom(X)
                      &
                      X : EV +-> BOOL
                      &
                      (
                        X(cls_ev) = TRUE
                        =>
                        (
                          rtr_ev : dom(X)
                          &
                          X : EV +-> BOOL
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
      &
      (
        (
          act_ev(NOT(h)) = rtr_ev
          &
          ana_cls = TRUE
          &
          which_ev = no_ev
          &
          X(prs_ev) = FALSE
          &
          X(dpr_ev) = TRUE
          &
          X(opn_ev) = FALSE
          &
          X(cls_ev) = TRUE
          &
          X(rtr_ev) = TRUE
        )
        or
        (
          h : dom(NOT)
          &
          NOT : BOOL +-> BOOL
          &
          NOT(h) : dom(act_ev)
          &
          act_ev : BOOL +-> EV
          &
          (
            (
              act_ev(NOT(h)) = ext_ev
              &
              ana_cls = TRUE
              &
              which_ev = no_ev
            )
            =>
            (
              prs_ev : dom(X)
              &
              X : EV +-> BOOL
              &
              (
                X(prs_ev) = FALSE
                =>
                (
                  dpr_ev : dom(X)
                  &
                  X : EV +-> BOOL
                  &
                  (
                    X(dpr_ev) = TRUE
                    =>
                    (
                      opn_ev : dom(X)
                      &
                      X : EV +-> BOOL
                      &
                      (
                        X(opn_ev) = FALSE
                        =>
                        (
                          cls_ev : dom(X)
                          &
                          X : EV +-> BOOL
                          &
                          (
                            X(cls_ev) = TRUE
                            =>
                            (
                              ext_ev : dom(X)
                              &
                              X : EV +-> BOOL
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
&
H /= h
&
which_ev = no_ev
&
ana_cls = FALSE
&
alarm_boolean = FALSE
&
anomaly = FALSE


END
