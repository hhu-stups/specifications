MACHINE         rename_Varr(VALUE,maxidx)

SEES            Bool_TYPE

CONSTRAINTS     maxidx>0

VARIABLES       rename_Varr

INVARIANT       rename_Varr: 1..maxidx --> VALUE

INITIALISATION  rename_Varr:: 1..maxidx --> VALUE

OPERATIONS

  bb <-- rename_TST_IDX_ARR(ii) =
  PRE
    ii: NAT
  THEN
    bb := bool(ii:1..maxidx)
  END;

  vv <-- rename_VAL_ARR(ii) =
  PRE
    ii:1..maxidx
  THEN 
    vv:=rename_Varr(ii)
  END;

  rename_STO_ARR(ii,vv) =
  PRE
    vv:VALUE &
    ii:1..maxidx
  THEN 
    rename_Varr(ii):=vv
  END;

  bb <-- rename_EQL_ARR(ii,vv) =
  PRE
    vv:VALUE &
    ii:1..maxidx
  THEN
    bb:=bool(rename_Varr(ii)=vv)
  END;

  bb <-- rename_NEQ_ARR(ii,vv) =
  PRE
    vv:VALUE &
    ii:1..maxidx
  THEN
    bb:=bool(rename_Varr(ii)/=vv)
  END;


  bb,ii <-- rename_SCH_LO_EQL_ARR(jj,kk,vv) =
  PRE
    vv:VALUE &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ rename_Varr~[{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- rename_SCH_LO_NEQ_ARR(jj,kk,vv) =
  PRE
    vv:VALUE &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ rename_Varr~[(VALUE)-{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;


  bb,ii <-- rename_SCH_HI_EQL_ARR(jj,kk,vv) =
  PRE
    vv:VALUE &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ rename_Varr~[{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- rename_SCH_HI_NEQ_ARR(jj,kk,vv) =
  PRE
    vv:VALUE &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ rename_Varr~[(VALUE)-{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;



  rename_REV_ARR(ii,jj) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    ii < jj
  THEN
    LET Same,Rev BE
      Same = (1..ii-1\/jj+1..maxidx) <| rename_Varr &
      Rev = %kk.(kk:ii..jj | rename_Varr(jj+ii-kk)) 
    IN 
      rename_Varr := Same \/ Rev
    END 
  END;

  rename_RHT_ARR(ii,jj,nn) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    nn:1..maxidx &
    ii <= jj
  THEN
    LET Same, RShift BE
      Same = ((1..ii+nn-1)\/(jj+nn+1..maxidx)) <| rename_Varr &
      RShift = %kk.(kk:ii+nn..min({maxidx,jj+nn}) | rename_Varr(kk-nn)) 
    IN
      rename_Varr := Same \/ RShift
    END
  END;

  rename_LFT_ARR(ii,jj,nn) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    nn:1..maxidx &
    ii <= jj
  THEN
    LET Same, LShift BE
      Same = ((1..ii-nn-1)\/(jj-nn+1..maxidx)) <| rename_Varr &
      LShift = %kk.(kk:max({1,ii-nn})..jj-nn | rename_Varr(kk+nn))    IN
      rename_Varr := Same \/ LShift
    END
  END;

  rename_SWP_ARR(ii,jj) =
  PRE
    ii: 1..maxidx &
    jj: 1..maxidx
  THEN
    rename_Varr:=
    rename_Varr<+{ii |-> rename_Varr(jj), jj |-> rename_Varr(ii)}
  END;


/**************  save/restore host byte order **************/

 rename_SAV_ARR = BEGIN skip END;

 rename_RST_ARR =
 BEGIN  rename_Varr :: 1..maxidx --> VALUE END;

/**************  save/restore network byte order **************/

 rename_SAVN_ARR = BEGIN skip END;

 rename_RSTN_ARR =
 BEGIN  rename_Varr :: 1..maxidx --> VALUE END


END

