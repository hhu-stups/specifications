MACHINE      rename_seq_obj(VALUE,maxobj,maxmem)

CONSTRAINTS  maxobj>0

SEES         rename_seq_ctx, Bool_TYPE

VARIABLES

  rename_seqtok, rename_seqstruct, rename_seqmem

INVARIANT

  rename_seqtok <: rename_SEQOBJ &
  rename_seqstruct: rename_seqtok --> seq(VALUE) &
  rename_seqmem = SIGMA tt.(tt : rename_seqtok| size(rename_seqstruct(tt))) &
  rename_seqmem:  NAT &  
  rename_seqmem <= maxmem

INITIALISATION

  rename_seqtok, rename_seqstruct, rename_seqmem := {},{}, 0

OPERATIONS

/******************  General query functions *********************/

  bb <-- rename_MEM_FUL_SEQ_OBJ =
  BEGIN
    bb:=bool(rename_seqmem=maxmem)
  END;

  bb <-- rename_OBJ_FUL_SEQ_OBJ =
  BEGIN
    bb:=bool(card(rename_seqtok) =  maxobj)
  END;

  bb <-- rename_XST_SEQ_OBJ(pp) =
  PRE
    pp: rename_SEQOBJ
  THEN
    bb:=bool(pp:rename_seqtok)
  END;


/******************  Creating and deleting sequences **************/


  rename_INI_SEQ_OBJ =
  BEGIN
    rename_seqtok, rename_seqstruct, rename_seqmem := {},{}, 0
  END;

  pp <-- rename_ANY_SEQ_OBJ =
  BEGIN
    pp :: rename_SEQOBJ
  END;


  bb,pp <-- rename_CRE_SEQ_OBJ =
  IF card(rename_seqtok) < maxobj THEN
      ANY qq WHERE
        qq: rename_SEQOBJ - rename_seqtok
      THEN
        rename_seqstruct(qq):=<> ||
        rename_seqtok := rename_seqtok \/ {qq} ||
        pp:=qq ||
        bb := TRUE
      END
  ELSE
      bb:= FALSE || pp :: rename_SEQOBJ
  END;

  rename_KIL_SEQ_OBJ(pp) =
  PRE
    pp: rename_seqtok &
    rename_seqmem >= size(rename_seqstruct(pp))
  THEN
    rename_seqstruct :=  {pp} <<| rename_seqstruct ||
    rename_seqtok := rename_seqtok - {pp} ||
    rename_seqmem := rename_seqmem - size(rename_seqstruct(pp))
  END;


/******************  Query functions for individual sequences **********/


  vv <-- rename_VAL_SEQ_OBJ(pp,ii) =
  PRE
    pp:rename_seqtok &
    ii:dom(rename_seqstruct(pp))
  THEN 
    vv:=rename_seqstruct(pp)(ii)
  END;

  bb <-- rename_XST_IDX_SEQ_OBJ(pp,ii) =
  PRE
    pp: rename_seqtok &
    ii: 1..maxmem
  THEN
    bb:=bool(ii:1..size(rename_seqstruct(pp)))
  END;

  nn <-- rename_LEN_SEQ_OBJ(pp)=
  PRE
    pp: rename_seqtok
  THEN
    nn:=size(rename_seqstruct(pp))
  END;

  bb <-- rename_EMP_SEQ_OBJ(pp) =
  PRE
    pp: rename_seqtok
  THEN
    bb:=bool(rename_seqstruct(pp)=<>)
  END;

  bb <-- rename_EQL_SEQ_OBJ(ss,tt) =
  PRE
     tt : rename_seqtok &
     ss : rename_seqtok
  THEN
     bb := bool(rename_seqstruct(tt) = rename_seqstruct(ss))
  END;

  bb,ii <-- rename_MBR_SEQ_OBJ(tt,vv) =
  PRE
     tt : rename_seqtok &
     vv : VALUE
  THEN
     IF vv : ran(rename_seqstruct(tt)) THEN
        ANY kk WHERE
           kk: NAT & (rename_seqstruct(tt))(kk) = vv
        THEN
            bb := TRUE || ii := kk  
        END 
     ELSE
        bb := FALSE || ii :: NAT
     END 
  END;


/******************   Sequence Operations ***********************/


  bb <-- rename_PSH_SEQ_OBJ(pp,vv) =
  PRE
    pp:rename_seqtok &
    vv: VALUE
    /* rename_seqmem < maxmem */
  THEN
    IF rename_seqmem<maxmem THEN
      rename_seqstruct(pp):=rename_seqstruct(pp) <- vv ||
      rename_seqmem:=rename_seqmem+1 ||
      bb := TRUE
    ELSE
      bb := FALSE
    END
  END;


  rename_CLR_SEQ_OBJ(pp) =
  PRE
    pp: rename_seqtok  /* &
    rename_seqmem >= size(rename_seqstruct(pp)) */
  THEN
    rename_seqstruct(pp) := <> ||
    rename_seqmem := rename_seqmem - size(rename_seqstruct(pp))
  END;


  rename_KEP_SEQ_OBJ(pp,ii) =
  PRE
    pp:rename_seqtok &
    ii:0..size(rename_seqstruct(pp)) &
    rename_seqmem >= size(rename_seqstruct(pp))+ii
  THEN
    rename_seqstruct(pp):=rename_seqstruct(pp) /|\ ii ||
    rename_seqmem:=rename_seqmem-size(rename_seqstruct(pp))+ii
  END;

  rename_CUT_SEQ_OBJ(pp,ii) =
  PRE
    pp:rename_seqtok &
    ii:0..size(rename_seqstruct(pp)) &
    rename_seqmem >= ii
  THEN
    rename_seqstruct(pp):=rename_seqstruct(pp) \|/ ii ||
    rename_seqmem:=rename_seqmem-ii
  END;


  rename_REV_SEQ_OBJ(pp) =
  PRE
    pp:rename_seqtok
  THEN
    rename_seqstruct(pp):=rev(rename_seqstruct(pp))
  END;


  rename_SWP_SEQ_OBJ(pp,ii,jj) =
  PRE
    pp:rename_seqtok &
    ii:dom(rename_seqstruct(pp)) &
    jj:dom(rename_seqstruct(pp))
  THEN
    rename_seqstruct(pp):= (
     rename_seqstruct(pp) <+  (
       {ii |-> rename_seqstruct(pp)(jj), jj |-> rename_seqstruct(pp)(ii) }
       )
     )
  END;

  rename_POP_SEQ_OBJ(pp) =
  PRE
    pp:rename_seqtok &
    rename_seqstruct(pp)/=<> &
    rename_seqmem > 0
  THEN
    rename_seqstruct(pp):= front(rename_seqstruct(pp)) ||
    rename_seqmem:=rename_seqmem-1
  END;

  rename_STO_SEQ_OBJ(pp,ii,vv) =
  PRE
    pp:rename_seqtok &
    vv:VALUE &
    ii:1..size(rename_seqstruct(pp))
  THEN 
    rename_seqstruct(pp)(ii):=vv
  END;

  bb <-- rename_APP_SEQ_OBJ(pp,qq) =
  PRE
    pp:rename_seqtok &
    qq:rename_seqtok 
    /* rename_seqmem+size(rename_seqstruct(qq))<=maxmem */
  THEN
    IF
     rename_seqmem+size(rename_seqstruct(qq))<=maxmem
    THEN
      rename_seqstruct(pp):= (
        rename_seqstruct(pp)^rename_seqstruct(qq) 
      ) ||
      rename_seqmem:= (
       rename_seqmem+size(rename_seqstruct(qq)) 
      ) ||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;

  bb <-- rename_CPY_SEQ_OBJ(pp,qq) =
  PRE
    pp:rename_seqtok &
    qq:rename_seqtok 
    /* rename_seqmem -  ( 
     size(rename_seqstruct(qq)) + size(rename_seqstruct(pp))
     ) <= maxmem  */
  THEN
    IF
     rename_seqmem - (
       size(rename_seqstruct(qq))+ (
         size(rename_seqstruct(pp))
       )
     ) <= maxmem
    THEN
      rename_seqstruct(qq):=rename_seqstruct(pp) ||
      rename_seqmem:= (
       rename_seqmem-size(rename_seqstruct(qq))+ ( 
         size(rename_seqstruct(pp)) 
         )
      )||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;


  bb <-- rename_OVR_SEQ_OBJ(pp,qq) =
  PRE
    pp:rename_seqtok &
    qq:rename_seqtok 
    /* rename_seqmem + (
     size(rename_seqstruct(qq))-size(rename_seqstruct(pp))
    ) <= maxmem */
  THEN
    IF
      rename_seqmem+ (
        size(rename_seqstruct(qq))-(
          size(rename_seqstruct(pp))
        )
      ) <= maxmem
    THEN
      rename_seqstruct(qq):= (
        rename_seqstruct(qq) <+ rename_seqstruct(pp) 
      ) ||
      rename_seqmem:= (
       rename_seqmem + (
         max({0,(size(rename_seqstruct(qq))-(
          size(rename_seqstruct(pp))
         ))}) 
       )
      ) ||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;

/************************ Persistent storage facilities *****************/

/***********  save/restore host byte order ***********/

  rename_SAV_SEQ_OBJ =
  BEGIN
    skip
  END;

  rename_RST_SEQ_OBJ =
  ANY
    sseqn,sseqo,stotseq
  WHERE
    sseqn <: rename_SEQOBJ &
    sseqo: sseqn --> seq(VALUE) &
    stotseq:  NAT 
  THEN
    rename_seqstruct := sseqo ||
    rename_seqtok := sseqn ||
    rename_seqmem := stotseq
  END;

/***********  save/restore network byte order ***********/

  rename_SAVN_SEQ_OBJ =
  BEGIN
    skip
  END;

  rename_RSTN_SEQ_OBJ =
  ANY
    sseqn,sseqo,stotseq
  WHERE
    sseqn <: rename_SEQOBJ &
    sseqo: sseqn --> seq(VALUE) &
    stotseq:  NAT 
  THEN
    rename_seqstruct := sseqo ||
    rename_seqtok := sseqn ||
    rename_seqmem := stotseq
  END;

/************************** Browsing ************************************/

  nn,pp <-- rename_FIRST_SEQ_OBJ =  
  IF not(rename_seqtok = {}) THEN
     pp :: rename_seqtok || 
     nn := card(rename_seqtok) 
  ELSE
     pp :: rename_SEQOBJ ||
     nn := 0
  END;

  nn,qq <-- rename_NEXT_SEQ_OBJ(mm,pp) = 
  PRE
    pp : rename_seqtok &
    mm : NAT1
  THEN
    nn := mm-1 ||
    qq :: rename_seqtok
  END;


/********************** Input Output facilities ************************/

  rename_OUTPUT_SEQ_OBJ(SS,pp) =  
  PRE
    SS<: VALUE &
    pp: rename_seqtok
  THEN
    skip
  END;

  bb <-- rename_INPUT_SEQ_OBJ(SS,pp,ll) = 
  PRE
    SS<: VALUE &
    pp: rename_seqtok &
    ll: 1..250
  THEN
     IF rename_seqmem + ll <= maxmem THEN
       ANY ss WHERE
         ss : seq(VALUE) &
         size(ss) = ll
       THEN
         rename_seqstruct(pp) := rename_seqstruct(pp) ^ ss ||
         rename_seqmem := rename_seqmem + ll ||
         bb := TRUE
       END
     ELSE
     bb := FALSE
   END
  END

END
