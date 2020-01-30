
MACHINE model
SETS /* deferred */
  NUMVOL;
  HR;
  VILLE;
  DIST
ABSTRACT_VARIABLES
  Ligne,
  Vol,
  ligneDeVol,
  volsDeLigne
/* PROMOTED OPERATIONS
  Vol_new,
  Vol_newWithLinks,
  Vol_delete,
  Vol_delWithLinks,
  Vol_setNumvol_EXT,
  Vol_setNumvol,
  Vol_getNumvol_EXT,
  Vol_getNumvol,
  Vol_setHdep_EXT,
  Vol_setHdep,
  Vol_getHdep_EXT,
  Vol_getHdep,
  Vol_setHar_EXT,
  Vol_setHar,
  Vol_getHar_EXT,
  Vol_getHar,
  Vol_linkLigneDeVol,
  Vol_unlinkLigneDeVol,
  Vol_getLigneDeVol,
  Ligne_new,
  Ligne_newWithLinks,
  Ligne_delete,
  Ligne_delWithLinks,
  Ligne_setVdep_EXT,
  Ligne_setVdep,
  Ligne_getVdep_EXT,
  Ligne_getVdep,
  Ligne_setVar_EXT,
  Ligne_setVar,
  Ligne_getVar_EXT,
  Ligne_getVar,
  Ligne_setDist_EXT,
  Ligne_setDist,
  Ligne_getDist_EXT,
  Ligne_getDist,
  Ligne_linkVolsDeLigne,
  Ligne_unlinkVolsDeLigne,
  Ligne_getVolsDeLigne,
  CheckGlobalInvariant,
  Coverage_model */
INVARIANT
    Ligne : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
  & Vol : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
  & ligneDeVol : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
  & volsDeLigne : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
INITIALISATION
    LET Vol_pr_,Ligne_pr_,volsDeLigne_pr_,ligneDeVol_pr_ BE
     Vol_pr_ = {} & Ligne_pr_ = {} & volsDeLigne_pr_ = {} &
     ligneDeVol_pr_ = union({cmpset__3542|#x.(cmpset__3542 = {cmpset__3541|#y.(cmpset__3541 = y |-> x & y : volsDeLigne_pr_(x))} & x : dom(volsDeLigne_pr_))})
    IN
      SELECT
          volsDeLigne_pr_ : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol_pr_ : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne_pr_) <: Ligne_pr_
        & union(ran(volsDeLigne_pr_)) <: Vol_pr_
        & volsDeLigne_pr_ = {cmpset__3540|#x.(cmpset__3540 = x |-> {y|y : dom(ligneDeVol_pr_) & x = ligneDeVol_pr_(y)} & x : ran(ligneDeVol_pr_))}
        & ligneDeVol_pr_ = {}
      THEN
        Ligne,Vol,ligneDeVol,volsDeLigne := Ligne_pr_,Vol_pr_,ligneDeVol_pr_,volsDeLigne_pr_
      END
    END
OPERATIONS
/*
  Vol_new(vol_) =
    LET Vol_pr_ BE Vol_pr_ = Vol \/ {vol_}
    IN
      Vol := Vol_pr_
    END;
*/



  Ligne_new(ligne_) =
    LET Ligne_pr_ BE Ligne_pr_ = Ligne \/ {ligne_}
    IN
      Ligne := Ligne_pr_
    END;



  Ligne_setVdep(this_,vdep_) =
    ANY Ligne_pr_,
        // Vol_pr_, // useless
        ligneDeVol_pr_,volsDeLigne_pr_,dist,dist_pr_,var,var_pr_,vdep,vdep_pr_
    WHERE
        this_ : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this_
      & Ligne_pr_ = Ligne - {this_} \/ {rec(vdep:vdep_pr_,var:var_pr_,dist:dist_pr_)}
      & vdep_pr_ = vdep_
      & var_pr_ = var
      & dist_pr_ = dist
     // & volsDeLigne : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
     //& ligneDeVol : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
      //& dom(volsDeLigne) <: Ligne
      //& union(ran(volsDeLigne)) <: Vol
      //& volsDeLigne = {cmpset__3480|#x.(cmpset__3480 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      //& ligneDeVol = union({cmpset__3482|#x.(cmpset__3482 = {cmpset__3481|#y.(cmpset__3481 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & volsDeLigne_pr_ : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
      & ligneDeVol_pr_ : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
      & dom(volsDeLigne_pr_) <: Ligne_pr_
      & union(ran(volsDeLigne_pr_)) <: Vol // was Vol_pr_
      & volsDeLigne_pr_ = {cmpset__3483|#x.(cmpset__3483 = x |-> {y|y : dom(ligneDeVol_pr_) & x = ligneDeVol_pr_(y)} & x : ran(ligneDeVol_pr_))}
      & ligneDeVol_pr_ = union({cmpset__3485|#x.(cmpset__3485 = {cmpset__3484|#y.(cmpset__3484 = y |-> x & y : volsDeLigne_pr_(x))} & x : dom(volsDeLigne_pr_))})
      // & Vol = Vol_pr_ //useless
      & (# /* LET */ (newId).(
       (newId)=({cmpset__3486|#x.(cmpset__3486 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep_pr_,var:var_pr_,dist:dist_pr_)}) &
       newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) &
        volsDeLigne_pr_ = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne_pr_,ligneDeVol_pr_,volsDeLigne_pr_
    END
END
