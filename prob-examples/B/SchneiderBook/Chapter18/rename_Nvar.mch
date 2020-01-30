MACHINE         rename_Nvar(maxint)

CONSTRAINTS     maxint <= 2147483646

SEES            Bool_TYPE

VARIABLES       rename_Nvar

INVARIANT       rename_Nvar:0..maxint

INITIALISATION  rename_Nvar:=0

OPERATIONS

  vv <-- rename_VAL_NVAR =
  BEGIN 
    vv:=rename_Nvar
  END;

  rename_STO_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN 
    rename_Nvar:=vv
  END;

  uu <-- rename_MIN_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=min({rename_Nvar,vv})
  END;

  uu <-- rename_MAX_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=max({rename_Nvar,vv})
  END;

  bb <-- rename_PRE_INC_NVAR =
  BEGIN
    bb:=bool(rename_Nvar<maxint)
  END;

  rename_INC_NVAR =
  PRE
    rename_Nvar+1:0..maxint
  THEN
    rename_Nvar:=rename_Nvar+1
  END;

  bb <-- rename_PRE_DEC_NVAR =
  BEGIN
    bb:=bool(rename_Nvar>0)
  END;

  rename_DEC_NVAR =
  PRE
    rename_Nvar:1..maxint
  THEN
    rename_Nvar:=rename_Nvar-1
  END;

  bb <-- rename_PRE_ADD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar+vv <= maxint)
  END;

  rename_ADD_NVAR(vv) =
  PRE
    vv:0..maxint &
    rename_Nvar+vv <= maxint
  THEN 
    rename_Nvar:=rename_Nvar+vv
  END;

  bb <-- rename_PRE_MUL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar*vv <= maxint)
  END;

  rename_MUL_NVAR(vv) =
  PRE
    vv:0..maxint &
    rename_Nvar*vv <= maxint
  THEN 
    rename_Nvar:=rename_Nvar*vv
  END;

  bb <-- rename_PRE_SUB_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar-vv >= 0)
  END;

  rename_SUB_NVAR(vv) =
  PRE
    vv:0..maxint &
    rename_Nvar-vv >= 0
  THEN 
    rename_Nvar:=rename_Nvar-vv
  END;

  bb <-- rename_PRE_DIV_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  rename_DIV_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    rename_Nvar:=rename_Nvar/vv
  END;

  bb <-- rename_PRE_MOD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  rename_MOD_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    rename_Nvar:=rename_Nvar-vv*(rename_Nvar/vv)
  END;

  bb <-- rename_EQL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar=vv)
  END;

  bb <-- rename_NEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar/=vv)
  END;

  bb <-- rename_GTR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar>vv)
  END;

  bb <-- rename_GEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar>=vv)
  END;

  bb <-- rename_SMR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar<vv)
  END;

  bb <-- rename_LEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(rename_Nvar<=vv)
  END;


/**************  save/restore host byte order **************/

  rename_SAV_NVAR =
  BEGIN
     skip
  END;

  rename_RST_NVAR =
  BEGIN
    rename_Nvar :: 0..maxint
  END;

/**************  save/restore network byte order **************/

  rename_SAVN_NVAR =
  BEGIN
     skip
  END;

  rename_RSTN_NVAR =
  BEGIN
    rename_Nvar :: 0..maxint
  END

END



