
MACHINE m4
SETS /* enumerated */
  EV={prs_ev,dpr_ev,opn_ev,cls_ev,ext_ev,rtr_ev,no_ev}
CONCRETE_CONSTANTS
  NOT,
  act_ev,
  change,
  N,
  R,
  timing
ABSTRACT_VARIABLES
  X3,
  alarm_boolean,
  alarm_door_gear_switch,
  anomaly,
  gears_locked_down,
  gears_maneuvering,
  green_light,
  opening_switch,
  orange_light,
  red_light,
  which_ev_OLD,
  working_door_gear_switch,
  ana_closing,
  ana_cls,
  ana_opening,
  ana_opn,
  H,
  h,
  X,
  ext,
  which_ev
/* PROMOTED OPERATIONS
  CLICK,
  act0,
  act1,
  chg1,
  X_act,
  X_chg,
  act6,
  detect_anomaly,
  CHANGE_1,
  CHANGE_2,
  end_ana_cls,
  beg_ana_opn,
  end_ana_opn,
  beg_X,
  inv_X,
  end_X,
  beg_X3,
  inv_X3,
  end_X3,
  Three_X_FALSE,
  Three_X_TRUE,
  green_light_on,
  green_light_off,
  orange_light_on,
  orange_light_off,
  red_light_on */
PROPERTIES
    /* @C0:axm2 */ NOT ∈ BOOL → BOOL
  & /* @C0:axm3 */ NOT(TRUE) = FALSE
  & /* @C0:axm4 */ NOT(FALSE) = TRUE
  & /* @C0:axm5 */ act_ev ∈ BOOL → {ext_ev,rtr_ev}
  & /* @C0:axm6 */ act_ev(TRUE) = rtr_ev
  & /* @C0:axm7 */ act_ev(FALSE) = ext_ev
  & /* @C0:axm8 */ change ∈ {ext_ev,rtr_ev} → {ext_ev,rtr_ev}
  & /* @C0:axm9 */ change(ext_ev) = rtr_ev
  & /* @C0:axm10 */ change(rtr_ev) = ext_ev
  & /* @C1:axm1 */ R ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} → {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
  & /* @C1:axm2 */ R(opn_ev) = cls_ev
  & /* @C1:axm3 */ R(cls_ev) = opn_ev
  & /* @C1:axm4 */ R(prs_ev) = dpr_ev
  & /* @C1:axm5 */ R(dpr_ev) = prs_ev
  & /* @C1:axm6 */ R(ext_ev) = rtr_ev
  & /* @C1:axm7 */ R(rtr_ev) = ext_ev
  & /* @C1:axm10 */ N ∈ BOOL × EV → EV
  & /* @C1:axm11 */ N(TRUE ↦ no_ev) = prs_ev
  & /* @C1:axm12 */ N(TRUE ↦ prs_ev) = opn_ev
  & /* @C1:axm13 */ N(TRUE ↦ opn_ev) = rtr_ev
  & /* @C1:axm14 */ N(TRUE ↦ rtr_ev) = cls_ev
  & /* @C1:axm15 */ N(TRUE ↦ ext_ev) = cls_ev
  & /* @C1:axm16 */ N(TRUE ↦ cls_ev) = dpr_ev
  & /* @C1:axm17 */ N(TRUE ↦ dpr_ev) = no_ev
  & /* @C1:axm18 */ N(FALSE ↦ no_ev) = prs_ev
  & /* @C1:axm19 */ N(FALSE ↦ prs_ev) = opn_ev
  & /* @C1:axm20 */ N(FALSE ↦ opn_ev) = ext_ev
  & /* @C1:axm21 */ N(FALSE ↦ rtr_ev) = cls_ev
  & /* @C1:axm22 */ N(FALSE ↦ ext_ev) = cls_ev
  & /* @C1:axm23 */ N(FALSE ↦ cls_ev) = dpr_ev
  & /* @C1:axm24 */ N(FALSE ↦ dpr_ev) = no_ev
  & /* @C2:axm1 */ timing ∈ {prs_ev,opn_ev,rtr_ev,ext_ev,cls_ev,dpr_ev} → 0 ‥ 10000
  & /* @C2:axm2 */ timing(prs_ev) = 2000
  & /* @C2:axm3 */ timing(opn_ev) = 7000
  & /* @C2:axm4 */ timing(rtr_ev) = 10000
  & /* @C2:axm5 */ timing(ext_ev) = 10000
  & /* @C2:axm6 */ timing(cls_ev) = 7000
  & /* @C2:axm7 */ timing(dpr_ev) = 10000
INVARIANT
    /* @m4:inv1 */ X3 ∈ {cls_ev,ext_ev,rtr_ev,opn_ev} → ({1,2,3} → BOOL)
  & /* @m4:inv4 */ ∀ev·(ev ∈ dom(X3) ⇒ (X3(ev) = {1,2,3} × {TRUE} ⇒ X(ev) = TRUE))
  & /* @m4:inv5 */ ∀ev·(ev ∈ dom(X3) ⇒ (X3(ev) ≠ {1,2,3} × {TRUE} ⇒ X(ev) = FALSE))
  & /* @m4:inv7 */ ∀ev·(ev ∈ dom(X3) ∧ X3(R(ev)) ≠ {1,2,3} × {TRUE} ⇒ X(R(ev)) = FALSE)
  & /* @m3:inv1 */ working_door_gear_switch ∈ 0 ‥ 100000
  & /* @m3:inv2 */ alarm_door_gear_switch ∈ 0 ‥ 100000
  & /* @m3:inv4 */ opening_switch ∈ 0 ‥ 100000
  & /* @m3:inv9 */ (
     gears_maneuvering = TRUE
     ⇒
     (
      gears_locked_down = FALSE
      ∧
      anomaly = FALSE
     )
    )
  & /* @m3:inv10 */ (
     gears_locked_down = TRUE
     ⇒
     anomaly = FALSE
    )
  & /* @m2:inv1 */ (
     ana_cls = TRUE
     ⇒
     ana_opn = FALSE
    )
  & /* @m2:inv2 */ (
     ana_closing = TRUE
     ⇒
     (
      ana_cls = FALSE
      ∧
      ana_opn = FALSE
     )
    )
  & /* @m2:inv3 */ (
     ana_opening = TRUE
     ⇒
     (
      ana_opn = FALSE
      ∧
      ana_cls = FALSE
     )
    )
  & /* @m2:inv4 */ (
     ana_opening = TRUE
     ⇒
     ana_closing = FALSE
    )
  & /* @m2:inv6 */ (
     (
      which_ev = no_ev
      ∧
      H ≠ h
     )
     ⇒
     (
      (
       which_ev = no_ev
       ∧
       H ≠ h
       ∧
       ana_cls = TRUE
      )
      ∨
      ana_cls = TRUE
      ∨
      ana_closing = TRUE
      ∨
      (
       ana_cls = TRUE
       ∧
       ana_closing = FALSE
       ∧
       H = h
       ∧
       which_ev = no_ev
      )
      ∨
      ana_opening = TRUE
      ∨
      ana_opn = FALSE
     )
    )
  & /* @m2:inv7 */ (
     ana_opening = TRUE
     ⇒
     H = h
    )
  & /* @m1:inv1 */ (
     which_ev = no_ev
     ⇒
     (
      (H = h)
      ⇔
      (ext = H)
     )
    )
  & /* @m1:inv2 */ (
     which_ev ≠ no_ev
     ⇒
     (
      (H = h)
      ⇔
      ext ≠ H
     )
    )
  & /* @m1:inv3 */ (
     ¬(
      (
       which_ev = no_ev
       ∧
       H ≠ h
      )
      ∨
      (
       which_ev ≠ no_ev
       ∧
       X(which_ev) = TRUE
       ∧
       H = h
      )
      ∨
      (
       which_ev ≠ no_ev
       ∧
       H ≠ h
      )
      ∨
      (
       which_ev ≠ no_ev
       ∧
       X(which_ev) = FALSE
       ∧
       X(R(which_ev)) = TRUE
      )
      ∨
      (
       which_ev ≠ no_ev
       ∧
       X(which_ev) = FALSE
       ∧
       X(R(which_ev)) = FALSE
      )
     )
     ⇒
     which_ev = no_ev
    )
  & /* @m0:inv1 */ X ∈ EV → BOOL
  & /* @m0:inv3 */ ∀ev·(ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} ⇒ (X(ev) = TRUE ⇒ X(R(ev)) = FALSE))
  & /* @m0:inv6 */ (
     which_ev = no_ev
     ⇒
     X(cls_ev) = TRUE
    )
  & /* @m0:inv9 */ (
     which_ev = dpr_ev
     ⇒
     X(cls_ev) = TRUE
    )
  & /* @m0:inv10 */ (
     which_ev = prs_ev
     ⇒
     X(cls_ev) = TRUE
    )
  & /* @m0:inv11 */ (
     which_ev = no_ev
     ⇒
     X(dpr_ev) = TRUE
    )
  & /* @m0:inv12 */ (
     (
      which_ev = no_ev
      ∧
      ext = TRUE
     )
     ⇒
     X(ext_ev) = TRUE
    )
  & /* @m0:inv13 */ (
     (
      which_ev ∈ {cls_ev,dpr_ev}
      ∧
      ext = FALSE
     )
     ⇒
     X(ext_ev) = TRUE
    )
  & /* @m0:inv14 */ (
     (
      which_ev ∈ {no_ev,prs_ev,opn_ev}
      ∧
      ext = TRUE
     )
     ⇒
     X(ext_ev) = TRUE
    )
  & /* @m0:inv15 */ (
     which_ev = rtr_ev
     ⇒
     ext = TRUE
    )
  & /* @m0:inv16 */ (
     which_ev = ext_ev
     ⇒
     ext = FALSE
    )
  & /* @m0:inv17 */ (
     (
      which_ev = no_ev
      ∧
      ext = FALSE
     )
     ⇒
     X(rtr_ev) = TRUE
    )
  & /* @m0:inv18 */ (
     (
      which_ev ∈ {cls_ev,dpr_ev}
      ∧
      ext = TRUE
     )
     ⇒
     X(rtr_ev) = TRUE
    )
  & /* @m0:inv19 */ (
     (
      which_ev ∈ {prs_ev,opn_ev}
      ∧
      ext = FALSE
     )
     ⇒
     X(rtr_ev) = TRUE
    )
  & /* @m0:inv21 */ (
     which_ev ∈ {rtr_ev,ext_ev}
     ⇒
     X(opn_ev) = TRUE
    )
ASSERTIONS
     /* @C1:axm8 */ ∀ev·(ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} ⇒ R(ev) ≠ ev)
   ; /* @C1:axm9 */ ∀ev·(ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev} ⇒ R(R(ev)) = ev)
   ; /* @C1:axm25 */ ∀ev·(ev ∈ dom(R) ⇒ R(ev) ∈ dom(R))
   ; /* @m4:inv2 */ dom(X3) = {cls_ev,ext_ev,rtr_ev,opn_ev}
   ; /* @m4:inv3 */ ∀ev·(ev ∈ dom(X3) ⇒ R(ev) ∈ dom(X3))
   ; /* @m4:inv6 */ (
      (
       which_ev ∉ dom(X3)
       ∧
       which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      )
      ⇒
      R(which_ev) ∉ dom(X3)
     )
   ; /* @m4:DLF */ (
      ¬(
       (
        H ≠ h
        ∧
        which_ev = no_ev
        ∧
        ana_cls = FALSE
        ∧
        alarm_boolean = FALSE
        ∧
        anomaly = FALSE
       )
       ∨
       (
        which_ev = no_ev
        ∧
        H ≠ h
        ∧
        ana_cls = TRUE
        ∧
        anomaly = FALSE
        ∧
        N(ext ↦ no_ev) = prs_ev
       )
       ∨
       (
        H = h
        ∧
        which_ev = no_ev
        ∧
        ana_cls = TRUE
        ∧
        anomaly = FALSE
        ∧
        alarm_boolean = TRUE
       )
       ∨
       (
        (
         which_ev ∈ EV - {dpr_ev,no_ev}
         ∧
         which_ev ∉ dom(X3)
        )
        ⇒
        (
         X(which_ev) = TRUE
         ∧
         H = h
         ∧
         anomaly = FALSE
         ∧
         (
          which_ev ∈ dom(X3)
          ⇒
          X3(which_ev) = {1,2,3} × {TRUE}
         )
        )
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        H ≠ h
        ∧
        anomaly = FALSE
       )
       ∨
       (
        which_ev = dpr_ev
        ∧
        X(which_ev) = TRUE
        ∧
        H = h
        ∧
        anomaly = FALSE
        ∧
        N(ext ↦ dpr_ev) = no_ev
       )
       ∨
       (
        alarm_door_gear_switch = 0
        ∧
        alarm_boolean = TRUE
       )
       ∨
       (
        ana_opn = TRUE
        ∧
        ana_opening = FALSE
       )
       ∨
       (
        ana_closing = TRUE
        ∧
        working_door_gear_switch = 0
       )
       ∨
       (
        ana_cls = TRUE
        ∧
        ana_closing = FALSE
        ∧
        H = h
        ∧
        opening_switch = 0
       )
       ∨
       ana_opening = TRUE
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(R(which_ev)) = TRUE
        ∧
        X(which_ev) = FALSE
        ∧
        which_ev ∉ dom(X3)
        ∧
        R(which_ev) ∉ dom(X3)
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
        ∧
        which_ev_OLD = R(which_ev)
        ∧
        which_ev ∉ dom(X3)
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
        ∧
        working_door_gear_switch = 0
        ∧
        which_ev_OLD = which_ev
        ∧
        which_ev ∉ dom(X3)
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        which_ev ∈ dom(X3)
        ∧
        X3(R(which_ev)) = {1,2,3} × {TRUE}
        ∧
        X3(which_ev) ≠ {1,2,3} × {TRUE}
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        which_ev_OLD = R(which_ev)
        ∧
        which_ev ∈ dom(X3)
        ∧
        X3(which_ev) ≠ {1,2,3} × {TRUE}
        ∧
        X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        working_door_gear_switch = 0
        ∧
        which_ev_OLD = which_ev
        ∧
        ∃i·(i ∈ {1,2,3} ∧ X3(which_ev) <+ {i ↦ TRUE} = {1,2,3} × {TRUE} ∧ X3(R(which_ev))(i) = FALSE)
        ∧
        which_ev ∈ dom(X3)
        ∧
        X3(which_ev) ≠ {1,2,3} × {TRUE}
        ∧
        X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
       )
       ∨
       (
        ∃i·(i ∈ {1,2,3} ∧ X3(R(which_ev))(i) = TRUE ∧ i ∈ dom(X3(R(which_ev))))
        ∧
        which_ev ∈ dom(X3)
        ∧
        X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
       )
       ∨
       (
        ∃i·(i ∈ {1,2,3} ∧ X3(R(which_ev))(i) = FALSE ∧ X3(which_ev)(i) = FALSE ∧ (X3(which_ev) <+ {i ↦ TRUE}) ≠ {1,2,3} × {TRUE})
        ∧
        which_ev ∈ dom(X3)
       )
       ∨
       (
        gears_locked_down = TRUE
        ∧
        green_light = FALSE
        ∧
        orange_light = FALSE
        ∧
        red_light = FALSE
       )
       ∨
       (
        gears_locked_down = FALSE
        ∧
        green_light = TRUE
       )
       ∨
       (
        gears_maneuvering = TRUE
        ∧
        orange_light = FALSE
        ∧
        green_light = FALSE
        ∧
        red_light = FALSE
       )
       ∨
       (
        gears_maneuvering = FALSE
        ∧
        orange_light = TRUE
       )
       ∨
       (
        anomaly = TRUE
        ∧
        red_light = FALSE
        ∧
        green_light = FALSE
        ∧
        orange_light = FALSE
       )
      )
      ⇒
      (
       ana_cls = FALSE
       ∨
       anomaly = TRUE
       ∨
       {working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0} ≠ ∅
       ∨
       (
        ana_cls = TRUE
        ∧
        (
         (
          act_ev(NOT(h)) = rtr_ev
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(rtr_ev) = TRUE
         )
         ∨
         (
          act_ev(NOT(h)) = ext_ev
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(ext_ev) = TRUE
         )
        )
       )
      )
     )
   ; /* @m3:DLF */ (
      ¬(
       (
        H ≠ h
        ∧
        which_ev = no_ev
        ∧
        ana_cls = FALSE
        ∧
        alarm_boolean = FALSE
        ∧
        anomaly = FALSE
       )
       ∨
       (
        which_ev = no_ev
        ∧
        H ≠ h
        ∧
        ana_cls = TRUE
        ∧
        anomaly = FALSE
       )
       ∨
       (
        H = h
        ∧
        which_ev = no_ev
        ∧
        ana_cls = TRUE
        ∧
        anomaly = FALSE
        ∧
        alarm_boolean = TRUE
       )
       ∨
       (
        which_ev ∈ EV - {dpr_ev,no_ev}
        ∧
        X(which_ev) = TRUE
        ∧
        H = h
        ∧
        anomaly = FALSE
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        H ≠ h
        ∧
        anomaly = FALSE
       )
       ∨
       (
        which_ev = dpr_ev
        ∧
        X(which_ev) = TRUE
        ∧
        H = h
        ∧
        anomaly = FALSE
       )
       ∨
       (
        alarm_door_gear_switch = 0
        ∧
        alarm_boolean = TRUE
       )
       ∨
       (
        ana_opn = TRUE
        ∧
        ana_opening = FALSE
       )
       ∨
       (
        ana_closing = TRUE
        ∧
        working_door_gear_switch = 0
       )
       ∨
       (
        ana_cls = TRUE
        ∧
        ana_closing = FALSE
        ∧
        H = h
        ∧
        opening_switch = 0
       )
       ∨
       ana_opening = TRUE
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(R(which_ev)) = TRUE
        ∧
        X(which_ev) = FALSE
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
        ∧
        which_ev_OLD = R(which_ev)
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
        ∧
        working_door_gear_switch = 0
        ∧
        which_ev_OLD = which_ev
       )
       ∨
       (
        gears_locked_down = TRUE
        ∧
        green_light = FALSE
        ∧
        orange_light = FALSE
        ∧
        red_light = FALSE
       )
       ∨
       (
        gears_locked_down = FALSE
        ∧
        green_light = TRUE
       )
       ∨
       (
        gears_maneuvering = TRUE
        ∧
        orange_light = FALSE
        ∧
        green_light = FALSE
        ∧
        red_light = FALSE
       )
       ∨
       (
        gears_maneuvering = FALSE
        ∧
        orange_light = TRUE
       )
       ∨
       (
        anomaly = TRUE
        ∧
        red_light = FALSE
        ∧
        green_light = FALSE
        ∧
        orange_light = FALSE
       )
      )
      ⇒
      (
       ana_cls = FALSE
       ∨
       anomaly = TRUE
       ∨
       {working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0} ≠ ∅
       ∨
       (
        ana_cls = TRUE
        ∧
        (
         (
          act_ev(NOT(h)) = rtr_ev
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(rtr_ev) = TRUE
         )
         ∨
         (
          act_ev(NOT(h)) = ext_ev
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(ext_ev) = TRUE
         )
        )
       )
      )
     )
   ; /* @m2:DLF */ (
      ¬(
       (
        which_ev = no_ev
        ∧
        H ≠ h
        ∧
        ana_cls = TRUE
       )
       ∨
       (
        which_ev ∈ EV - {dpr_ev,no_ev}
        ∧
        X(which_ev) = TRUE
        ∧
        H = h
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        H ≠ h
       )
       ∨
       (
        which_ev = dpr_ev
        ∧
        X(which_ev) = TRUE
        ∧
        H = h
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(R(which_ev)) = TRUE
        ∧
        X(which_ev) = FALSE
       )
       ∨
       (
        which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
       )
       ∨
       (
        ana_opn = TRUE
        ∧
        ana_opening = FALSE
       )
       ∨
       ana_closing = TRUE
       ∨
       (
        ana_cls = TRUE
        ∧
        ana_closing = FALSE
        ∧
        H = h
        ∧
        which_ev = no_ev
       )
       ∨
       ana_opening = TRUE
      )
      ⇒
      (
       ana_cls = FALSE
       ∨
       (
        ana_cls = TRUE
        ∧
        (
         (
          h = FALSE
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(rtr_ev) = TRUE
         )
         ∨
         (
          h = TRUE
          ∧
          which_ev = no_ev
          ∧
          X(prs_ev) = FALSE
          ∧
          X(dpr_ev) = TRUE
          ∧
          X(opn_ev) = FALSE
          ∧
          X(cls_ev) = TRUE
          ∧
          X(ext_ev) = TRUE
         )
        )
       )
      )
     )
   ; /* @m0:inv20 */ (
      which_ev = no_ev
      ⇒
      (
       X(cls_ev) = TRUE
       ∧
       X(dpr_ev) = TRUE
       ∧
       (
        ext = TRUE
        ⇒
        X(ext_ev) = TRUE
       )
       ∧
       (
        ext = FALSE
        ⇒
        X(rtr_ev) = TRUE
       )
      )
     )
   ; /* @m0:inv22 */ (
      ¬(
       which_ev = no_ev
       ∨
       (
        which_ev ≠ no_ev
        ∧
        X(which_ev) = TRUE
       )
       ∨
       which_ev ≠ no_ev
       ∨
       (
        which_ev ≠ no_ev
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = TRUE
       )
       ∨
       (
        which_ev ≠ no_ev
        ∧
        X(which_ev) = FALSE
        ∧
        X(R(which_ev)) = FALSE
       )
      )
      ⇒
      which_ev = no_ev
     )
INITIALISATION
    EVENT INITIALISATION = /* of machine m4 */
    THEN 
         which_ev := no_ev
      ||
         ext := TRUE
      ||
         X := {cls_ev,ext_ev,dpr_ev,no_ev} × {TRUE} ∪ {rtr_ev,opn_ev,prs_ev} × {FALSE}
      ||
         H := TRUE
      ||
         h := TRUE
      ||
         ana_cls := FALSE
      ||
         ana_opn := TRUE
      ||
         ana_closing := FALSE
      ||
         ana_opening := FALSE
      ||
         working_door_gear_switch := 100000
      ||
         alarm_door_gear_switch := 100000
      ||
         alarm_boolean := FALSE
      ||
         opening_switch := 100000
      ||
         anomaly := FALSE
      ||
         which_ev_OLD := no_ev
      ||
         gears_maneuvering := FALSE
      ||
         gears_locked_down := TRUE
      ||
         green_light := TRUE
      ||
         orange_light := FALSE
      ||
         red_light := FALSE
      ||
         X3 := {cls_ev,ext_ev} × {{1,2,3} × {TRUE}} ∪ {rtr_ev,opn_ev} × {{1,2,3} × {FALSE}}
    REFINES 
      EVENT INITIALISATION = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT INITIALISATION = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT INITIALISATION = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT INITIALISATION = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END
OPERATIONS
  CLICK(w) = 
    EVENT CLICK = /* of machine m4 */
    ANY w
    WHERE 
        /* @m4:grd1 */ {working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0} ≠ ∅
      & /* @m4:grd2 */ w = min({working_door_gear_switch,opening_switch,alarm_door_gear_switch} - {0})
      & /* @m4:grd12 */ ¬(
         (
          H ≠ h
          ∧
          which_ev = no_ev
          ∧
          ana_cls = FALSE
          ∧
          alarm_boolean = FALSE
          ∧
          anomaly = FALSE
         )
         ∨
         (
          which_ev = no_ev
          ∧
          H ≠ h
          ∧
          ana_cls = TRUE
          ∧
          anomaly = FALSE
          ∧
          N(ext ↦ no_ev) = prs_ev
         )
         ∨
         (
          H = h
          ∧
          which_ev = no_ev
          ∧
          ana_cls = TRUE
          ∧
          anomaly = FALSE
          ∧
          alarm_boolean = TRUE
         )
         ∨
         (
          (
           which_ev ∈ EV - {dpr_ev,no_ev}
           ∧
           which_ev ∉ dom(X3)
          )
          ⇒
          (
           X(which_ev) = TRUE
           ∧
           H = h
           ∧
           anomaly = FALSE
           ∧
           (
            which_ev ∈ dom(X3)
            ⇒
            X3(which_ev) = {1,2,3} × {TRUE}
           )
          )
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          H ≠ h
          ∧
          anomaly = FALSE
         )
         ∨
         (
          which_ev = dpr_ev
          ∧
          X(which_ev) = TRUE
          ∧
          H = h
          ∧
          anomaly = FALSE
          ∧
          N(ext ↦ dpr_ev) = no_ev
         )
         ∨
         (
          alarm_door_gear_switch = 0
          ∧
          alarm_boolean = TRUE
         )
         ∨
         (
          ana_opn = TRUE
          ∧
          ana_opening = FALSE
         )
         ∨
         (
          ana_closing = TRUE
          ∧
          working_door_gear_switch = 0
         )
         ∨
         (
          ana_cls = TRUE
          ∧
          ana_closing = FALSE
          ∧
          H = h
          ∧
          opening_switch = 0
         )
         ∨
         ana_opening = TRUE
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          X(R(which_ev)) = TRUE
          ∧
          X(which_ev) = FALSE
          ∧
          which_ev ∉ dom(X3)
          ∧
          R(which_ev) ∉ dom(X3)
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          X(which_ev) = FALSE
          ∧
          X(R(which_ev)) = FALSE
          ∧
          which_ev_OLD = R(which_ev)
          ∧
          which_ev ∉ dom(X3)
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          X(which_ev) = FALSE
          ∧
          X(R(which_ev)) = FALSE
          ∧
          working_door_gear_switch = 0
          ∧
          which_ev_OLD = which_ev
          ∧
          which_ev ∉ dom(X3)
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          which_ev ∈ dom(X3)
          ∧
          X3(R(which_ev)) = {1,2,3} × {TRUE}
          ∧
          X3(which_ev) ≠ {1,2,3} × {TRUE}
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          which_ev_OLD = R(which_ev)
          ∧
          which_ev ∈ dom(X3)
          ∧
          X3(which_ev) ≠ {1,2,3} × {TRUE}
          ∧
          X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
         )
         ∨
         (
          which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
          ∧
          working_door_gear_switch = 0
          ∧
          which_ev_OLD = which_ev
          ∧
          ∃i·(i ∈ {1,2,3} ∧ X3(which_ev) <+ {i ↦ TRUE} = {1,2,3} × {TRUE} ∧ X3(R(which_ev))(i) = FALSE)
          ∧
          which_ev ∈ dom(X3)
          ∧
          X3(which_ev) ≠ {1,2,3} × {TRUE}
          ∧
          X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
         )
         ∨
         (
          ∃i·(i ∈ {1,2,3} ∧ X3(R(which_ev))(i) = TRUE ∧ i ∈ dom(X3(R(which_ev))))
          ∧
          which_ev ∈ dom(X3)
          ∧
          X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
         )
         ∨
         (
          ∃i·(i ∈ {1,2,3} ∧ X3(R(which_ev))(i) = FALSE ∧ X3(which_ev)(i) = FALSE ∧ (X3(which_ev) <+ {i ↦ TRUE}) ≠ {1,2,3} × {TRUE})
          ∧
          which_ev ∈ dom(X3)
         )
         ∨
         (
          gears_locked_down = TRUE
          ∧
          green_light = FALSE
          ∧
          orange_light = FALSE
          ∧
          red_light = FALSE
         )
         ∨
         (
          gears_locked_down = FALSE
          ∧
          green_light = TRUE
         )
         ∨
         (
          gears_maneuvering = TRUE
          ∧
          orange_light = FALSE
          ∧
          green_light = FALSE
          ∧
          red_light = FALSE
         )
         ∨
         (
          gears_maneuvering = FALSE
          ∧
          orange_light = TRUE
         )
         ∨
         (
          anomaly = TRUE
          ∧
          red_light = FALSE
          ∧
          green_light = FALSE
          ∧
          orange_light = FALSE
         )
        )
    THEOREMS 
        /* @m4:grd9 */ max({0,working_door_gear_switch - w}) ∈ ℕ
      & /* @m4:grd10 */ max({0,opening_switch - w}) ∈ ℕ
      & /* @m4:grd11 */ max({0,alarm_door_gear_switch - w}) ∈ ℕ
    THEN 
         working_door_gear_switch := max({0,working_door_gear_switch - w})
      ||
         opening_switch := max({0,opening_switch - w})
      ||
         alarm_door_gear_switch := max({0,alarm_door_gear_switch - w})
      ||
         which_ev_OLD := which_ev
    REFINES 
      EVENT CLICK = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  act0 = 
    EVENT act0 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ H ≠ h
      & /* @m4:grd2 */ which_ev = no_ev
      & /* @m4:grd3 */ ana_cls = FALSE
      & /* @m4:grd4 */ alarm_boolean = FALSE
      & /* @m4:grd5 */ anomaly = FALSE
    THEN 
         alarm_boolean := TRUE
      ||
         alarm_door_gear_switch := 1000
    REFINES 
      EVENT act0 = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  act1 = 
    EVENT act1 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev = no_ev
      & /* @m4:grd2 */ H ≠ h
      & /* @m4:grd3 */ ana_cls = TRUE
      & /* @m4:grd4 */ anomaly = FALSE
    THEOREMS 
        /* @m4:grd5 */ N(ext ↦ no_ev) = prs_ev
    THEN 
         which_ev := N(ext ↦ which_ev)
      ||
         h := H
      ||
         alarm_door_gear_switch := timing(N(ext ↦ which_ev))
      ||
         alarm_boolean := TRUE
      ||
         gears_locked_down := FALSE
      ||
         gears_maneuvering := TRUE
    REFINES 
      EVENT act1 = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT act1 = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT act1 = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT act1 = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  chg1 = 
    EVENT chg1 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ H = h
      & /* @m4:grd2 */ which_ev = no_ev
      & /* @m4:grd3 */ ana_cls = TRUE
      & /* @m4:grd4 */ anomaly = FALSE
      & /* @m4:grd5 */ alarm_boolean = TRUE
    THEN 
         alarm_door_gear_switch := 0
      ||
         alarm_boolean := FALSE
    REFINES 
      EVENT chg1 = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  X_act = 
    EVENT X_act = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev ∈ EV - {dpr_ev,no_ev}
      & /* @m4:grd2 */ (
         which_ev ∉ dom(X3)
         ⇒
         X(which_ev) = TRUE
        )
      & /* @m4:grd3 */ H = h
      & /* @m4:grd4 */ anomaly = FALSE
      & /* @m4:grd5 */ (
         which_ev ∈ dom(X3)
         ⇒
         X3(which_ev) = {1,2,3} × {TRUE}
        )
    THEN 
         which_ev := N(ext ↦ which_ev)
      ||
         alarm_door_gear_switch := timing(N(ext ↦ which_ev))
      ||
         alarm_boolean := TRUE
    REFINES 
      EVENT X_act = /* of machine m3 */
      WHEN 
          /* @m3:grd2 */ X(which_ev) = TRUE
      THEN 
        skip
      REFINES 
        EVENT X_act = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT X_act = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT X_act = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  X_chg = 
    EVENT X_chg = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd2 */ H ≠ h
      & /* @m4:grd3 */ anomaly = FALSE
    THEN 
         which_ev := R(which_ev)
      ||
         ext := NOT(ext)
      ||
         h := H
      ||
         alarm_door_gear_switch := timing(R(which_ev))
      ||
         alarm_boolean := TRUE
    REFINES 
      EVENT X_chg = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT X_chg = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT X_chg = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT X_chg = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  act6 = 
    EVENT act6 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev = dpr_ev
      & /* @m4:grd2 */ X(which_ev) = TRUE
      & /* @m4:grd3 */ H = h
      & /* @m4:grd4 */ anomaly = FALSE
    THEOREMS 
        /* @m4:grd5 */ N(ext ↦ dpr_ev) = no_ev
    THEN 
         which_ev := N(ext ↦ which_ev)
      ||
         ext := NOT(ext)
      ||
         alarm_boolean := FALSE
      ||
         alarm_door_gear_switch := 0
      ||
         gears_locked_down := bool(h = TRUE)
      ||
         gears_maneuvering := FALSE
    REFINES 
      EVENT act6 = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT act6 = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT act6 = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT act6 = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  detect_anomaly = 
    EVENT detect_anomaly = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ alarm_door_gear_switch = 0
      & /* @m4:grd2 */ alarm_boolean = TRUE
    THEN 
         anomaly := TRUE
      ||
         alarm_boolean := FALSE
      ||
         gears_locked_down := FALSE
      ||
         gears_maneuvering := FALSE
    REFINES 
      EVENT detect_anomaly = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  CHANGE_1 = 
    EVENT CHANGE_1 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ ana_cls = TRUE
    THEN 
         H := NOT(H)
      ||
         opening_switch := 40000
    REFINES 
      EVENT CHANGE_1 = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT CHANGE_1 = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT CHANGE = /* of machine m1 */
          THEN 
            skip
          END
        END
      END
    END;
  
  CHANGE_2 = 
    EVENT CHANGE_2 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ ana_opn = TRUE
    THEOREMS 
        /* @m4:grd2 */ ana_opening = FALSE
    THEN 
         H := NOT(H)
      ||
         ana_opn := FALSE
      ||
         ana_closing := TRUE
      ||
         opening_switch := 40000
      ||
         working_door_gear_switch :: 1 ‥ 100000
    REFINES 
      EVENT CHANGE_2 = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT CHANGE_2 = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT CHANGE = /* of machine m1 */
          THEN 
            skip
          END
        END
      END
    END;
  
  end_ana_cls = 
    EVENT end_ana_cls = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ ana_closing = TRUE
      & /* @m4:grd2 */ working_door_gear_switch = 0
    THEN 
         ana_cls := TRUE
      ||
         ana_closing := FALSE
    REFINES 
      EVENT end_ana_cls = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT end_ana_cls = /* of machine m2 */
        THEN 
          skip
        END
      END
    END;
  
  beg_ana_opn = 
    EVENT beg_ana_opn = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ ana_cls = TRUE
      & /* @m4:grd2 */ ana_closing = FALSE
      & /* @m4:grd3 */ H = h
      & /* @m4:grd5 */ opening_switch = 0
    THEN 
         ana_cls := FALSE
      ||
         ana_opening := TRUE
      ||
         opening_switch := 100000
    REFINES 
      EVENT beg_ana_opn = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT beg_ana_opn = /* of machine m2 */
        THEN 
          skip
        END
      END
    END;
  
  end_ana_opn = 
    EVENT end_ana_opn = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ ana_opening = TRUE
    THEN 
         ana_opn := TRUE
      ||
         ana_opening := FALSE
    REFINES 
      EVENT end_ana_opn = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT end_ana_opn = /* of machine m2 */
        THEN 
          skip
        END
      END
    END;
  
  beg_X = 
    EVENT beg_X = /* of machine m4 */
    WHEN 
        /* @m4:grd5 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd3 */ X(R(which_ev)) = TRUE
      & /* @m4:grd6 */ which_ev ∉ dom(X3)
    THEOREMS 
        /* @m4:grd4 */ X(which_ev) = FALSE
      & /* @m4:grd7 */ R(which_ev) ∉ dom(X3)
    THEN 
         X := X <+ {R(which_ev) ↦ FALSE}
      ||
         working_door_gear_switch :: 1 ‥ 100000
      ||
         which_ev_OLD := which_ev
    REFINES 
      EVENT beg_X = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT beg_X = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT beg_X = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT beg_X = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  inv_X = 
    EVENT inv_X = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd2 */ X(which_ev) = FALSE
      & /* @m4:grd3 */ X(R(which_ev)) = FALSE
      & /* @m4:grd4 */ which_ev_OLD = R(which_ev)
      & /* @m4:grd5 */ which_ev ∉ dom(X3)
    THEN 
         working_door_gear_switch :: 1 ‥ 100000
      ||
         which_ev_OLD := which_ev
    REFINES 
      EVENT inv_X = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  end_X = 
    EVENT end_X = /* of machine m4 */
    WHEN 
        /* @m4:grd5 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd3 */ X(which_ev) = FALSE
      & /* @m4:grd4 */ X(R(which_ev)) = FALSE
      & /* @m4:grd6 */ working_door_gear_switch = 0
      & /* @m4:grd7 */ which_ev_OLD = which_ev
      & /* @m4:grd8 */ which_ev ∉ dom(X3)
    THEN 
         X := X <+ {which_ev ↦ TRUE}
      ||
         which_ev_OLD := which_ev
    REFINES 
      EVENT end_X = /* of machine m3 */
      THEN 
        skip
      REFINES 
        EVENT end_X = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT end_X = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT end_X = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  beg_X3(i) = 
    EVENT beg_X3 = /* of machine m4 */
    ANY i
    WHERE 
        /* @m4:grd5 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd6 */ which_ev ∈ dom(X3)
      & /* @m4:grd7 */ i ∈ {1,2,3}
      & /* @m4:grd8 */ X3(R(which_ev)) = {1,2,3} × {TRUE}
      & /* @m4:grd9 */ X3(which_ev) ≠ {1,2,3} × {TRUE}
    THEN 
         X := X <+ {R(which_ev) ↦ FALSE}
      ||
         working_door_gear_switch :: 1 ‥ 100000
      ||
         which_ev_OLD := which_ev
      ||
         X3 := X3 <+ {R(which_ev) ↦ (X3(R(which_ev)) <+ {i ↦ FALSE})}
    REFINES 
      EVENT beg_X = /* of machine m3 */
      WHEN 
          /* @m3:grd3 */ X(R(which_ev)) = TRUE
      THEOREMS 
          /* @m3:grd4 */ X(which_ev) = FALSE
      THEN 
        skip
      REFINES 
        EVENT beg_X = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT beg_X = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT beg_X = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  inv_X3 = 
    EVENT inv_X3 = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd4 */ which_ev_OLD = R(which_ev)
      & /* @m4:grd5 */ which_ev ∈ dom(X3)
      & /* @m4:grd6 */ X3(which_ev) ≠ {1,2,3} × {TRUE}
      & /* @m4:grd7 */ X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
    THEN 
         working_door_gear_switch :: 1 ‥ 100000
      ||
         which_ev_OLD := which_ev
    REFINES 
      EVENT inv_X = /* of machine m3 */
      WHEN 
          /* @m3:grd2 */ X(which_ev) = FALSE
        & /* @m3:grd3 */ X(R(which_ev)) = FALSE
      THEN 
        skip
      END
    END;
  
  end_X3(i) = 
    EVENT end_X3 = /* of machine m4 */
    ANY i
    WHERE 
        /* @m4:grd5 */ which_ev ∈ {cls_ev,ext_ev,dpr_ev,rtr_ev,opn_ev,prs_ev}
      & /* @m4:grd6 */ working_door_gear_switch = 0
      & /* @m4:grd7 */ which_ev_OLD = which_ev
      & /* @m4:grd8 */ i ∈ {1,2,3}
      & /* @m4:grd9 */ which_ev ∈ dom(X3)
      & /* @m4:grd10 */ X3(which_ev) <+ {i ↦ TRUE} = {1,2,3} × {TRUE}
      & /* @m4:grd11 */ X3(R(which_ev))(i) = FALSE
      & /* @m4:grd12 */ X3(which_ev) ≠ {1,2,3} × {TRUE}
    THEOREMS 
        /* @m4:grd13 */ X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
    THEN 
         X := X <+ {which_ev ↦ TRUE}
      ||
         which_ev_OLD := which_ev
      ||
         X3 := X3 <+ {which_ev ↦ {1,2,3} × {TRUE}}
    REFINES 
      EVENT end_X = /* of machine m3 */
      WHEN 
          /* @m3:grd3 */ X(which_ev) = FALSE
        & /* @m3:grd4 */ X(R(which_ev)) = FALSE
      THEN 
        skip
      REFINES 
        EVENT end_X = /* of machine m2 */
        THEN 
          skip
        REFINES 
          EVENT end_X = /* of machine m1 */
          THEN 
            skip
          REFINES 
            EVENT end_X = /* of machine m0 */
            THEN 
              skip
            END
          END
        END
      END
    END;
  
  Three_X_FALSE(i) = 
    EVENT Three_X_FALSE = /* of machine m4 */
    ANY i
    WHERE 
        /* @m4:grd1 */ i ∈ {1,2,3}
      & /* @m4:grd3 */ which_ev ∈ dom(X3)
      & /* @m4:grd2 */ X3(R(which_ev))(i) = TRUE
      & /* @m4:grd4 */ X3(R(which_ev)) ≠ {1,2,3} × {TRUE}
    THEOREMS 
        /* @m4:grd5 */ i ∈ dom(X3(R(which_ev)))
    THEN 
         X3 := X3 <+ {R(which_ev) ↦ (X3(R(which_ev)) <+ {i ↦ FALSE})}
    END;
  
  Three_X_TRUE(i) = 
    EVENT Three_X_TRUE = /* of machine m4 */
    ANY i
    WHERE 
        /* @m4:grd1 */ i ∈ {1,2,3}
      & /* @m4:grd2 */ which_ev ∈ dom(X3)
      & /* @m4:grd3 */ X3(R(which_ev))(i) = FALSE
      & /* @m4:grd4 */ X3(which_ev)(i) = FALSE
      & /* @m4:grd5 */ (X3(which_ev) <+ {i ↦ TRUE}) ≠ {1,2,3} × {TRUE}
    THEN 
         X3 := X3 <+ {which_ev ↦ (X3(which_ev) <+ {i ↦ TRUE})}
    END;
  
  green_light_on = 
    EVENT green_light_on = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ gears_locked_down = TRUE
      & /* @m4:grd2 */ green_light = FALSE
      & /* @m4:grd3 */ orange_light = FALSE
      & /* @m4:grd4 */ red_light = FALSE
    THEN 
         green_light := TRUE
    REFINES 
      EVENT green_light_on = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  green_light_off = 
    EVENT green_light_off = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ gears_locked_down = FALSE
      & /* @m4:grd2 */ green_light = TRUE
    THEN 
         green_light := FALSE
    REFINES 
      EVENT green_light_off = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  orange_light_on = 
    EVENT orange_light_on = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ gears_maneuvering = TRUE
      & /* @m4:grd2 */ orange_light = FALSE
      & /* @m4:grd3 */ green_light = FALSE
      & /* @m4:grd4 */ red_light = FALSE
    THEN 
         orange_light := TRUE
    REFINES 
      EVENT orange_light_on = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  orange_light_off = 
    EVENT orange_light_off = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ gears_maneuvering = FALSE
      & /* @m4:grd2 */ orange_light = TRUE
    THEN 
         orange_light := FALSE
    REFINES 
      EVENT orange_light_off = /* of machine m3 */
      THEN 
        skip
      END
    END;
  
  red_light_on = 
    EVENT red_light_on = /* of machine m4 */
    WHEN 
        /* @m4:grd1 */ anomaly = TRUE
      & /* @m4:grd2 */ red_light = FALSE
      & /* @m4:grd3 */ green_light = FALSE
      & /* @m4:grd4 */ orange_light = FALSE
    THEN 
         red_light := TRUE
    REFINES 
      EVENT red_light_on = /* of machine m3 */
      THEN 
        skip
      END
    END
END
