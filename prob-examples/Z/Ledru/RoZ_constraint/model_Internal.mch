
MACHINE model_zed
SETS /* deferred */
  NUMVOL;
  VILLE
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
INITIALISATION
    LET Vol',Ligne',volsDeLigne',ligneDeVol' BE Vol' = {} & Ligne' = {} & volsDeLigne' = {} & ligneDeVol' = union({cmpset__1142|#x.(cmpset__1142 = {cmpset__1141|#y.(cmpset__1141 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
    IN
      SELECT
          Vol' : FIN({rec__889|rec__889'hdep : 0 .. 1439 & rec__889'har : 0 .. 1439 & rec__889'hdep <= rec__889'har})
        & Ligne' : FIN({rec__890|rec__890'dist : 0 .. 2000 & rec__890'vdep /= rec__890'var})
        & volsDeLigne' : {rec__891|rec__891'dist : 0 .. 2000 & rec__891'vdep /= rec__891'var} +-> FIN({rec__892|rec__892'hdep : 0 .. 1439 & rec__892'har : 0 .. 1439 & rec__892'hdep <= rec__892'har})
        & ligneDeVol' : {rec__893|rec__893'hdep : 0 .. 1439 & rec__893'har : 0 .. 1439 & rec__893'hdep <= rec__893'har} +-> {rec__894|rec__894'dist : 0 .. 2000 & rec__894'vdep /= rec__894'var}
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) = Vol'
        & volsDeLigne' = {cmpset__1140|#x.(cmpset__1140 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
        & ligneDeVol' = {}
      THEN
        Ligne,Vol,ligneDeVol,volsDeLigne := Ligne',Vol',ligneDeVol',volsDeLigne'
      END
    END
OPERATIONS
  Vol_new(vol?) =
    ANY Vol'
    WHERE
        Vol : FIN({rec__110|rec__110'hdep : 0 .. 1439 & rec__110'har : 0 .. 1439 & rec__110'hdep <= rec__110'har})
      & Vol' : FIN({rec__111|rec__111'hdep : 0 .. 1439 & rec__111'har : 0 .. 1439 & rec__111'hdep <= rec__111'har})
      & vol?'hdep : 0 .. 1439
      & vol?'har : 0 .. 1439
      & vol?'hdep <= vol?'har
      & Vol' = Vol \/ {vol?}
    THEN
      Vol := Vol'
    END;

  Vol_newWithLinks(ligneDeVol?,vol?) =
    ANY Vol',ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__127|rec__127'hdep : 0 .. 1439 & rec__127'har : 0 .. 1439 & rec__127'hdep <= rec__127'har})
      & Vol' : FIN({rec__128|rec__128'hdep : 0 .. 1439 & rec__128'har : 0 .. 1439 & rec__128'hdep <= rec__128'har})
      & Ligne : FIN({rec__129|rec__129'dist : 0 .. 2000 & rec__129'vdep /= rec__129'var})
      & volsDeLigne : {rec__130|rec__130'dist : 0 .. 2000 & rec__130'vdep /= rec__130'var} +-> FIN({rec__131|rec__131'hdep : 0 .. 1439 & rec__131'har : 0 .. 1439 & rec__131'hdep <= rec__131'har})
      & ligneDeVol : {rec__132|rec__132'hdep : 0 .. 1439 & rec__132'har : 0 .. 1439 & rec__132'hdep <= rec__132'har} +-> {rec__133|rec__133'dist : 0 .. 2000 & rec__133'vdep /= rec__133'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__989|#x.(cmpset__989 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__991|#x.(cmpset__991 = {cmpset__990|#y.(cmpset__990 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne : FIN({rec__134|rec__134'dist : 0 .. 2000 & rec__134'vdep /= rec__134'var})
      & volsDeLigne' : {rec__135|rec__135'dist : 0 .. 2000 & rec__135'vdep /= rec__135'var} +-> FIN({rec__136|rec__136'hdep : 0 .. 1439 & rec__136'har : 0 .. 1439 & rec__136'hdep <= rec__136'har})
      & ligneDeVol' : {rec__137|rec__137'hdep : 0 .. 1439 & rec__137'har : 0 .. 1439 & rec__137'hdep <= rec__137'har} +-> {rec__138|rec__138'dist : 0 .. 2000 & rec__138'vdep /= rec__138'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__992|#x.(cmpset__992 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__994|#x.(cmpset__994 = {cmpset__993|#y.(cmpset__993 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & vol?'hdep : 0 .. 1439
      & vol?'har : 0 .. 1439
      & vol?'hdep <= vol?'har
      & ligneDeVol?'dist : 0 .. 2000
      & ligneDeVol?'vdep /= ligneDeVol?'var
      & Vol' = Vol \/ {vol?}
      & ligneDeVol? : Ligne
      & ligneDeVol' = ligneDeVol \/ {vol? |-> ligneDeVol?}
    THEN
      Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
    END;

  Vol_delete(this?) =
    ANY Vol'
    WHERE
        Vol : FIN({rec__144|rec__144'hdep : 0 .. 1439 & rec__144'har : 0 .. 1439 & rec__144'hdep <= rec__144'har})
      & Vol' : FIN({rec__145|rec__145'hdep : 0 .. 1439 & rec__145'har : 0 .. 1439 & rec__145'hdep <= rec__145'har})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & Vol' = Vol - {this?}
    THEN
      Vol := Vol'
    END;

  Vol_delWithLinks(this?) =
    ANY Vol',ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__160|rec__160'hdep : 0 .. 1439 & rec__160'har : 0 .. 1439 & rec__160'hdep <= rec__160'har})
      & Vol' : FIN({rec__161|rec__161'hdep : 0 .. 1439 & rec__161'har : 0 .. 1439 & rec__161'hdep <= rec__161'har})
      & Ligne : FIN({rec__162|rec__162'dist : 0 .. 2000 & rec__162'vdep /= rec__162'var})
      & volsDeLigne : {rec__163|rec__163'dist : 0 .. 2000 & rec__163'vdep /= rec__163'var} +-> FIN({rec__164|rec__164'hdep : 0 .. 1439 & rec__164'har : 0 .. 1439 & rec__164'hdep <= rec__164'har})
      & ligneDeVol : {rec__165|rec__165'hdep : 0 .. 1439 & rec__165'har : 0 .. 1439 & rec__165'hdep <= rec__165'har} +-> {rec__166|rec__166'dist : 0 .. 2000 & rec__166'vdep /= rec__166'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__995|#x.(cmpset__995 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__997|#x.(cmpset__997 = {cmpset__996|#y.(cmpset__996 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne : FIN({rec__167|rec__167'dist : 0 .. 2000 & rec__167'vdep /= rec__167'var})
      & volsDeLigne' : {rec__168|rec__168'dist : 0 .. 2000 & rec__168'vdep /= rec__168'var} +-> FIN({rec__169|rec__169'hdep : 0 .. 1439 & rec__169'har : 0 .. 1439 & rec__169'hdep <= rec__169'har})
      & ligneDeVol' : {rec__170|rec__170'hdep : 0 .. 1439 & rec__170'har : 0 .. 1439 & rec__170'hdep <= rec__170'har} +-> {rec__171|rec__171'dist : 0 .. 2000 & rec__171'vdep /= rec__171'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__998|#x.(cmpset__998 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1000|#x.(cmpset__1000 = {cmpset__999|#y.(cmpset__999 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & Vol' = Vol - {this?}
      & ligneDeVol' = {m|m : ligneDeVol & prj1(struct(har:INTEGER, hdep:INTEGER, numvol:NUMVOL),struct(dist:INTEGER, var:VILLE, vdep:VILLE))(m) /= this?}
    THEN
      Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
    END;

  Vol_setNumvol_EXT(numvol?,this?) =
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__176|rec__176'hdep : 0 .. 1439 & rec__176'har : 0 .. 1439 & rec__176'hdep <= rec__176'har})
      & Vol' : FIN({rec__177|rec__177'hdep : 0 .. 1439 & rec__177'har : 0 .. 1439 & rec__177'hdep <= rec__177'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol' = numvol?
      & hdep' = hdep
      & har' = har
    THEN
      Vol := Vol'
    END;

  Vol_setNumvol(numvol?,this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__192|rec__192'hdep : 0 .. 1439 & rec__192'har : 0 .. 1439 & rec__192'hdep <= rec__192'har})
      & Vol' : FIN({rec__193|rec__193'hdep : 0 .. 1439 & rec__193'har : 0 .. 1439 & rec__193'hdep <= rec__193'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol' = numvol?
      & hdep' = hdep
      & har' = har
      & Ligne : FIN({rec__195|rec__195'dist : 0 .. 2000 & rec__195'vdep /= rec__195'var})
      & volsDeLigne : {rec__196|rec__196'dist : 0 .. 2000 & rec__196'vdep /= rec__196'var} +-> FIN({rec__197|rec__197'hdep : 0 .. 1439 & rec__197'har : 0 .. 1439 & rec__197'hdep <= rec__197'har})
      & ligneDeVol : {rec__198|rec__198'hdep : 0 .. 1439 & rec__198'har : 0 .. 1439 & rec__198'hdep <= rec__198'har} +-> {rec__199|rec__199'dist : 0 .. 2000 & rec__199'vdep /= rec__199'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1001|#x.(cmpset__1001 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1003|#x.(cmpset__1003 = {cmpset__1002|#y.(cmpset__1002 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__200|rec__200'dist : 0 .. 2000 & rec__200'vdep /= rec__200'var})
      & volsDeLigne' : {rec__201|rec__201'dist : 0 .. 2000 & rec__201'vdep /= rec__201'var} +-> FIN({rec__202|rec__202'hdep : 0 .. 1439 & rec__202'har : 0 .. 1439 & rec__202'hdep <= rec__202'har})
      & ligneDeVol' : {rec__203|rec__203'hdep : 0 .. 1439 & rec__203'har : 0 .. 1439 & rec__203'hdep <= rec__203'har} +-> {rec__204|rec__204'dist : 0 .. 2000 & rec__204'vdep /= rec__204'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1004|#x.(cmpset__1004 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1006|#x.(cmpset__1006 = {cmpset__1005|#y.(cmpset__1005 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1007|#x.(cmpset__1007 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__207|rec__207'hdep : 0 .. 1439 & rec__207'har : 0 .. 1439 & rec__207'hdep <= rec__207'har} +-> {rec__208|rec__208'hdep : 0 .. 1439 & rec__208'har : 0 .. 1439 & rec__208'hdep <= rec__208'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
    END;

  result! <-- Vol_getNumvol_EXT(this?) =
    ANY Vol',result!1161,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__212|rec__212'hdep : 0 .. 1439 & rec__212'har : 0 .. 1439 & rec__212'hdep <= rec__212'har})
      & Vol' : FIN({rec__213|rec__213'hdep : 0 .. 1439 & rec__213'har : 0 .. 1439 & rec__213'hdep <= rec__213'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1161 = numvol
    THEN
      Vol,result! := Vol',result!1161
    END;

  result! <-- Vol_getNumvol(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1162,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__228|rec__228'hdep : 0 .. 1439 & rec__228'har : 0 .. 1439 & rec__228'hdep <= rec__228'har})
      & Vol' : FIN({rec__229|rec__229'hdep : 0 .. 1439 & rec__229'har : 0 .. 1439 & rec__229'hdep <= rec__229'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1162 = numvol
      & Ligne : FIN({rec__231|rec__231'dist : 0 .. 2000 & rec__231'vdep /= rec__231'var})
      & volsDeLigne : {rec__232|rec__232'dist : 0 .. 2000 & rec__232'vdep /= rec__232'var} +-> FIN({rec__233|rec__233'hdep : 0 .. 1439 & rec__233'har : 0 .. 1439 & rec__233'hdep <= rec__233'har})
      & ligneDeVol : {rec__234|rec__234'hdep : 0 .. 1439 & rec__234'har : 0 .. 1439 & rec__234'hdep <= rec__234'har} +-> {rec__235|rec__235'dist : 0 .. 2000 & rec__235'vdep /= rec__235'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1008|#x.(cmpset__1008 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1010|#x.(cmpset__1010 = {cmpset__1009|#y.(cmpset__1009 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__236|rec__236'dist : 0 .. 2000 & rec__236'vdep /= rec__236'var})
      & volsDeLigne' : {rec__237|rec__237'dist : 0 .. 2000 & rec__237'vdep /= rec__237'var} +-> FIN({rec__238|rec__238'hdep : 0 .. 1439 & rec__238'har : 0 .. 1439 & rec__238'hdep <= rec__238'har})
      & ligneDeVol' : {rec__239|rec__239'hdep : 0 .. 1439 & rec__239'har : 0 .. 1439 & rec__239'hdep <= rec__239'har} +-> {rec__240|rec__240'dist : 0 .. 2000 & rec__240'vdep /= rec__240'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1011|#x.(cmpset__1011 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1013|#x.(cmpset__1013 = {cmpset__1012|#y.(cmpset__1012 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1014|#x.(cmpset__1014 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__243|rec__243'hdep : 0 .. 1439 & rec__243'har : 0 .. 1439 & rec__243'hdep <= rec__243'har} +-> {rec__244|rec__244'hdep : 0 .. 1439 & rec__244'har : 0 .. 1439 & rec__244'hdep <= rec__244'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1162
    END;

  Vol_setHdep_EXT(hdep?,this?) =
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__248|rec__248'hdep : 0 .. 1439 & rec__248'har : 0 .. 1439 & rec__248'hdep <= rec__248'har})
      & Vol' : FIN({rec__249|rec__249'hdep : 0 .. 1439 & rec__249'har : 0 .. 1439 & rec__249'hdep <= rec__249'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & hdep? : 0 .. 1439
      & hdep' = hdep?
      & numvol' = numvol
      & har' = har
    THEN
      Vol := Vol'
    END;

  Vol_setHdep(hdep?,this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__264|rec__264'hdep : 0 .. 1439 & rec__264'har : 0 .. 1439 & rec__264'hdep <= rec__264'har})
      & Vol' : FIN({rec__265|rec__265'hdep : 0 .. 1439 & rec__265'har : 0 .. 1439 & rec__265'hdep <= rec__265'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & hdep? : 0 .. 1439
      & hdep' = hdep?
      & numvol' = numvol
      & har' = har
      & Ligne : FIN({rec__267|rec__267'dist : 0 .. 2000 & rec__267'vdep /= rec__267'var})
      & volsDeLigne : {rec__268|rec__268'dist : 0 .. 2000 & rec__268'vdep /= rec__268'var} +-> FIN({rec__269|rec__269'hdep : 0 .. 1439 & rec__269'har : 0 .. 1439 & rec__269'hdep <= rec__269'har})
      & ligneDeVol : {rec__270|rec__270'hdep : 0 .. 1439 & rec__270'har : 0 .. 1439 & rec__270'hdep <= rec__270'har} +-> {rec__271|rec__271'dist : 0 .. 2000 & rec__271'vdep /= rec__271'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1015|#x.(cmpset__1015 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1017|#x.(cmpset__1017 = {cmpset__1016|#y.(cmpset__1016 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__272|rec__272'dist : 0 .. 2000 & rec__272'vdep /= rec__272'var})
      & volsDeLigne' : {rec__273|rec__273'dist : 0 .. 2000 & rec__273'vdep /= rec__273'var} +-> FIN({rec__274|rec__274'hdep : 0 .. 1439 & rec__274'har : 0 .. 1439 & rec__274'hdep <= rec__274'har})
      & ligneDeVol' : {rec__275|rec__275'hdep : 0 .. 1439 & rec__275'har : 0 .. 1439 & rec__275'hdep <= rec__275'har} +-> {rec__276|rec__276'dist : 0 .. 2000 & rec__276'vdep /= rec__276'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1018|#x.(cmpset__1018 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1020|#x.(cmpset__1020 = {cmpset__1019|#y.(cmpset__1019 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1021|#x.(cmpset__1021 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__279|rec__279'hdep : 0 .. 1439 & rec__279'har : 0 .. 1439 & rec__279'hdep <= rec__279'har} +-> {rec__280|rec__280'hdep : 0 .. 1439 & rec__280'har : 0 .. 1439 & rec__280'hdep <= rec__280'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
    END;

  result! <-- Vol_getHdep_EXT(this?) =
    ANY Vol',result!1163,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__284|rec__284'hdep : 0 .. 1439 & rec__284'har : 0 .. 1439 & rec__284'hdep <= rec__284'har})
      & Vol' : FIN({rec__285|rec__285'hdep : 0 .. 1439 & rec__285'har : 0 .. 1439 & rec__285'hdep <= rec__285'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1163 : 0 .. 1439
      & result!1163 = hdep
    THEN
      Vol,result! := Vol',result!1163
    END;

  result! <-- Vol_getHdep(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1164,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__300|rec__300'hdep : 0 .. 1439 & rec__300'har : 0 .. 1439 & rec__300'hdep <= rec__300'har})
      & Vol' : FIN({rec__301|rec__301'hdep : 0 .. 1439 & rec__301'har : 0 .. 1439 & rec__301'hdep <= rec__301'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1164 : 0 .. 1439
      & result!1164 = hdep
      & Ligne : FIN({rec__303|rec__303'dist : 0 .. 2000 & rec__303'vdep /= rec__303'var})
      & volsDeLigne : {rec__304|rec__304'dist : 0 .. 2000 & rec__304'vdep /= rec__304'var} +-> FIN({rec__305|rec__305'hdep : 0 .. 1439 & rec__305'har : 0 .. 1439 & rec__305'hdep <= rec__305'har})
      & ligneDeVol : {rec__306|rec__306'hdep : 0 .. 1439 & rec__306'har : 0 .. 1439 & rec__306'hdep <= rec__306'har} +-> {rec__307|rec__307'dist : 0 .. 2000 & rec__307'vdep /= rec__307'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1022|#x.(cmpset__1022 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1024|#x.(cmpset__1024 = {cmpset__1023|#y.(cmpset__1023 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__308|rec__308'dist : 0 .. 2000 & rec__308'vdep /= rec__308'var})
      & volsDeLigne' : {rec__309|rec__309'dist : 0 .. 2000 & rec__309'vdep /= rec__309'var} +-> FIN({rec__310|rec__310'hdep : 0 .. 1439 & rec__310'har : 0 .. 1439 & rec__310'hdep <= rec__310'har})
      & ligneDeVol' : {rec__311|rec__311'hdep : 0 .. 1439 & rec__311'har : 0 .. 1439 & rec__311'hdep <= rec__311'har} +-> {rec__312|rec__312'dist : 0 .. 2000 & rec__312'vdep /= rec__312'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1025|#x.(cmpset__1025 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1027|#x.(cmpset__1027 = {cmpset__1026|#y.(cmpset__1026 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1028|#x.(cmpset__1028 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__315|rec__315'hdep : 0 .. 1439 & rec__315'har : 0 .. 1439 & rec__315'hdep <= rec__315'har} +-> {rec__316|rec__316'hdep : 0 .. 1439 & rec__316'har : 0 .. 1439 & rec__316'hdep <= rec__316'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1164
    END;

  Vol_setHar_EXT(har?,this?) =
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__320|rec__320'hdep : 0 .. 1439 & rec__320'har : 0 .. 1439 & rec__320'hdep <= rec__320'har})
      & Vol' : FIN({rec__321|rec__321'hdep : 0 .. 1439 & rec__321'har : 0 .. 1439 & rec__321'hdep <= rec__321'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & har? : 0 .. 1439
      & har' = har?
      & numvol' = numvol
      & hdep' = hdep
    THEN
      Vol := Vol'
    END;

  Vol_setHar(har?,this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__336|rec__336'hdep : 0 .. 1439 & rec__336'har : 0 .. 1439 & rec__336'hdep <= rec__336'har})
      & Vol' : FIN({rec__337|rec__337'hdep : 0 .. 1439 & rec__337'har : 0 .. 1439 & rec__337'hdep <= rec__337'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & har? : 0 .. 1439
      & har' = har?
      & numvol' = numvol
      & hdep' = hdep
      & Ligne : FIN({rec__339|rec__339'dist : 0 .. 2000 & rec__339'vdep /= rec__339'var})
      & volsDeLigne : {rec__340|rec__340'dist : 0 .. 2000 & rec__340'vdep /= rec__340'var} +-> FIN({rec__341|rec__341'hdep : 0 .. 1439 & rec__341'har : 0 .. 1439 & rec__341'hdep <= rec__341'har})
      & ligneDeVol : {rec__342|rec__342'hdep : 0 .. 1439 & rec__342'har : 0 .. 1439 & rec__342'hdep <= rec__342'har} +-> {rec__343|rec__343'dist : 0 .. 2000 & rec__343'vdep /= rec__343'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1029|#x.(cmpset__1029 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1031|#x.(cmpset__1031 = {cmpset__1030|#y.(cmpset__1030 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__344|rec__344'dist : 0 .. 2000 & rec__344'vdep /= rec__344'var})
      & volsDeLigne' : {rec__345|rec__345'dist : 0 .. 2000 & rec__345'vdep /= rec__345'var} +-> FIN({rec__346|rec__346'hdep : 0 .. 1439 & rec__346'har : 0 .. 1439 & rec__346'hdep <= rec__346'har})
      & ligneDeVol' : {rec__347|rec__347'hdep : 0 .. 1439 & rec__347'har : 0 .. 1439 & rec__347'hdep <= rec__347'har} +-> {rec__348|rec__348'dist : 0 .. 2000 & rec__348'vdep /= rec__348'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1032|#x.(cmpset__1032 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1034|#x.(cmpset__1034 = {cmpset__1033|#y.(cmpset__1033 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1035|#x.(cmpset__1035 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__351|rec__351'hdep : 0 .. 1439 & rec__351'har : 0 .. 1439 & rec__351'hdep <= rec__351'har} +-> {rec__352|rec__352'hdep : 0 .. 1439 & rec__352'har : 0 .. 1439 & rec__352'hdep <= rec__352'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
    END;

  result! <-- Vol_getHar_EXT(this?) =
    ANY Vol',result!1165,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__356|rec__356'hdep : 0 .. 1439 & rec__356'har : 0 .. 1439 & rec__356'hdep <= rec__356'har})
      & Vol' : FIN({rec__357|rec__357'hdep : 0 .. 1439 & rec__357'har : 0 .. 1439 & rec__357'hdep <= rec__357'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1165 : 0 .. 1439
      & result!1165 = har
    THEN
      Vol,result! := Vol',result!1165
    END;

  result! <-- Vol_getHar(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1166,har,har',hdep,hdep',numvol,numvol'
    WHERE
        Vol : FIN({rec__372|rec__372'hdep : 0 .. 1439 & rec__372'har : 0 .. 1439 & rec__372'hdep <= rec__372'har})
      & Vol' : FIN({rec__373|rec__373'hdep : 0 .. 1439 & rec__373'har : 0 .. 1439 & rec__373'hdep <= rec__373'har})
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep <= har
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & hdep' <= har'
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!1166 : 0 .. 1439
      & result!1166 = har
      & Ligne : FIN({rec__375|rec__375'dist : 0 .. 2000 & rec__375'vdep /= rec__375'var})
      & volsDeLigne : {rec__376|rec__376'dist : 0 .. 2000 & rec__376'vdep /= rec__376'var} +-> FIN({rec__377|rec__377'hdep : 0 .. 1439 & rec__377'har : 0 .. 1439 & rec__377'hdep <= rec__377'har})
      & ligneDeVol : {rec__378|rec__378'hdep : 0 .. 1439 & rec__378'har : 0 .. 1439 & rec__378'hdep <= rec__378'har} +-> {rec__379|rec__379'dist : 0 .. 2000 & rec__379'vdep /= rec__379'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1036|#x.(cmpset__1036 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1038|#x.(cmpset__1038 = {cmpset__1037|#y.(cmpset__1037 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__380|rec__380'dist : 0 .. 2000 & rec__380'vdep /= rec__380'var})
      & volsDeLigne' : {rec__381|rec__381'dist : 0 .. 2000 & rec__381'vdep /= rec__381'var} +-> FIN({rec__382|rec__382'hdep : 0 .. 1439 & rec__382'har : 0 .. 1439 & rec__382'hdep <= rec__382'har})
      & ligneDeVol' : {rec__383|rec__383'hdep : 0 .. 1439 & rec__383'har : 0 .. 1439 & rec__383'hdep <= rec__383'har} +-> {rec__384|rec__384'dist : 0 .. 2000 & rec__384'vdep /= rec__384'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1039|#x.(cmpset__1039 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1041|#x.(cmpset__1041 = {cmpset__1040|#y.(cmpset__1040 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & (# /* LET */ (newId).( (newId)=({cmpset__1042|#x.(cmpset__1042 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : {rec__387|rec__387'hdep : 0 .. 1439 & rec__387'har : 0 .. 1439 & rec__387'hdep <= rec__387'har} +-> {rec__388|rec__388'hdep : 0 .. 1439 & rec__388'har : 0 .. 1439 & rec__388'hdep <= rec__388'har} & ligneDeVol' = (newId~ ; ligneDeVol)))
    THEN
      Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1166
    END;

  Vol_linkLigneDeVol(l?,this?) =
    ANY ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__407|rec__407'hdep : 0 .. 1439 & rec__407'har : 0 .. 1439 & rec__407'hdep <= rec__407'har})
      & Ligne : FIN({rec__408|rec__408'dist : 0 .. 2000 & rec__408'vdep /= rec__408'var})
      & volsDeLigne : {rec__409|rec__409'dist : 0 .. 2000 & rec__409'vdep /= rec__409'var} +-> FIN({rec__410|rec__410'hdep : 0 .. 1439 & rec__410'har : 0 .. 1439 & rec__410'hdep <= rec__410'har})
      & ligneDeVol : {rec__411|rec__411'hdep : 0 .. 1439 & rec__411'har : 0 .. 1439 & rec__411'hdep <= rec__411'har} +-> {rec__412|rec__412'dist : 0 .. 2000 & rec__412'vdep /= rec__412'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1043|#x.(cmpset__1043 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1045|#x.(cmpset__1045 = {cmpset__1044|#y.(cmpset__1044 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__413|rec__413'hdep : 0 .. 1439 & rec__413'har : 0 .. 1439 & rec__413'hdep <= rec__413'har})
      & Ligne : FIN({rec__414|rec__414'dist : 0 .. 2000 & rec__414'vdep /= rec__414'var})
      & volsDeLigne' : {rec__415|rec__415'dist : 0 .. 2000 & rec__415'vdep /= rec__415'var} +-> FIN({rec__416|rec__416'hdep : 0 .. 1439 & rec__416'har : 0 .. 1439 & rec__416'hdep <= rec__416'har})
      & ligneDeVol' : {rec__417|rec__417'hdep : 0 .. 1439 & rec__417'har : 0 .. 1439 & rec__417'hdep <= rec__417'har} +-> {rec__418|rec__418'dist : 0 .. 2000 & rec__418'vdep /= rec__418'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__1046|#x.(cmpset__1046 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1048|#x.(cmpset__1048 = {cmpset__1047|#y.(cmpset__1047 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & l?'dist : 0 .. 2000
      & l?'vdep /= l?'var
      & l? : Ligne
      & this? : Vol
      & ligneDeVol' = ligneDeVol <+ {this? |-> l?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;

  Vol_unlinkLigneDeVol(l?,this?) =
    ANY ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__435|rec__435'hdep : 0 .. 1439 & rec__435'har : 0 .. 1439 & rec__435'hdep <= rec__435'har})
      & Ligne : FIN({rec__436|rec__436'dist : 0 .. 2000 & rec__436'vdep /= rec__436'var})
      & volsDeLigne : {rec__437|rec__437'dist : 0 .. 2000 & rec__437'vdep /= rec__437'var} +-> FIN({rec__438|rec__438'hdep : 0 .. 1439 & rec__438'har : 0 .. 1439 & rec__438'hdep <= rec__438'har})
      & ligneDeVol : {rec__439|rec__439'hdep : 0 .. 1439 & rec__439'har : 0 .. 1439 & rec__439'hdep <= rec__439'har} +-> {rec__440|rec__440'dist : 0 .. 2000 & rec__440'vdep /= rec__440'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1049|#x.(cmpset__1049 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1051|#x.(cmpset__1051 = {cmpset__1050|#y.(cmpset__1050 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__441|rec__441'hdep : 0 .. 1439 & rec__441'har : 0 .. 1439 & rec__441'hdep <= rec__441'har})
      & Ligne : FIN({rec__442|rec__442'dist : 0 .. 2000 & rec__442'vdep /= rec__442'var})
      & volsDeLigne' : {rec__443|rec__443'dist : 0 .. 2000 & rec__443'vdep /= rec__443'var} +-> FIN({rec__444|rec__444'hdep : 0 .. 1439 & rec__444'har : 0 .. 1439 & rec__444'hdep <= rec__444'har})
      & ligneDeVol' : {rec__445|rec__445'hdep : 0 .. 1439 & rec__445'har : 0 .. 1439 & rec__445'hdep <= rec__445'har} +-> {rec__446|rec__446'dist : 0 .. 2000 & rec__446'vdep /= rec__446'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__1052|#x.(cmpset__1052 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1054|#x.(cmpset__1054 = {cmpset__1053|#y.(cmpset__1053 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & l?'dist : 0 .. 2000
      & l?'vdep /= l?'var
      & this? : dom(ligneDeVol)
      & ligneDeVol' = ligneDeVol - {this? |-> l?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;

  result! <-- Vol_getLigneDeVol(this?) =
    ANY result!1167
    WHERE
        Vol : FIN({rec__487|rec__487'hdep : 0 .. 1439 & rec__487'har : 0 .. 1439 & rec__487'hdep <= rec__487'har})
      & Ligne : FIN({rec__488|rec__488'dist : 0 .. 2000 & rec__488'vdep /= rec__488'var})
      & volsDeLigne : {rec__489|rec__489'dist : 0 .. 2000 & rec__489'vdep /= rec__489'var} +-> FIN({rec__490|rec__490'hdep : 0 .. 1439 & rec__490'har : 0 .. 1439 & rec__490'hdep <= rec__490'har})
      & ligneDeVol : {rec__491|rec__491'hdep : 0 .. 1439 & rec__491'har : 0 .. 1439 & rec__491'hdep <= rec__491'har} +-> {rec__492|rec__492'dist : 0 .. 2000 & rec__492'vdep /= rec__492'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1061|#x.(cmpset__1061 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1063|#x.(cmpset__1063 = {cmpset__1062|#y.(cmpset__1062 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__493|rec__493'hdep : 0 .. 1439 & rec__493'har : 0 .. 1439 & rec__493'hdep <= rec__493'har})
      & Ligne : FIN({rec__494|rec__494'dist : 0 .. 2000 & rec__494'vdep /= rec__494'var})
      & volsDeLigne : {rec__495|rec__495'dist : 0 .. 2000 & rec__495'vdep /= rec__495'var} +-> FIN({rec__496|rec__496'hdep : 0 .. 1439 & rec__496'har : 0 .. 1439 & rec__496'hdep <= rec__496'har})
      & ligneDeVol : {rec__497|rec__497'hdep : 0 .. 1439 & rec__497'har : 0 .. 1439 & rec__497'hdep <= rec__497'har} +-> {rec__498|rec__498'dist : 0 .. 2000 & rec__498'vdep /= rec__498'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1064|#x.(cmpset__1064 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1066|#x.(cmpset__1066 = {cmpset__1065|#y.(cmpset__1065 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this?'hdep <= this?'har
      & result!1167'dist : 0 .. 2000
      & result!1167'vdep /= result!1167'var
      & result!1167 = ligneDeVol(this?)
    THEN
      result! := result!1167
    END;

  Ligne_new(ligne?) =
    ANY Ligne'
    WHERE
        Ligne : FIN({rec__542|rec__542'dist : 0 .. 2000 & rec__542'vdep /= rec__542'var})
      & Ligne' : FIN({rec__543|rec__543'dist : 0 .. 2000 & rec__543'vdep /= rec__543'var})
      & ligne?'dist : 0 .. 2000
      & ligne?'vdep /= ligne?'var
      & Ligne' = Ligne \/ {ligne?}
    THEN
      Ligne := Ligne'
    END;

  Ligne_newWithLinks(ligne?) =
    ANY Ligne'
    WHERE
        Ligne : FIN({rec__548|rec__548'dist : 0 .. 2000 & rec__548'vdep /= rec__548'var})
      & Ligne' : FIN({rec__549|rec__549'dist : 0 .. 2000 & rec__549'vdep /= rec__549'var})
      & ligne?'dist : 0 .. 2000
      & ligne?'vdep /= ligne?'var
      & Ligne' = Ligne \/ {ligne?}
    THEN
      Ligne := Ligne'
    END;

  Ligne_delete(this?) =
    ANY Ligne'
    WHERE
        Ligne : FIN({rec__554|rec__554'dist : 0 .. 2000 & rec__554'vdep /= rec__554'var})
      & Ligne' : FIN({rec__555|rec__555'dist : 0 .. 2000 & rec__555'vdep /= rec__555'var})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & Ligne' = Ligne - {this?}
    THEN
      Ligne := Ligne'
    END;

  Ligne_delWithLinks(this?) =
    ANY Ligne',ligneDeVol',volsDeLigne'
    WHERE
        Ligne : FIN({rec__570|rec__570'dist : 0 .. 2000 & rec__570'vdep /= rec__570'var})
      & Ligne' : FIN({rec__571|rec__571'dist : 0 .. 2000 & rec__571'vdep /= rec__571'var})
      & Vol : FIN({rec__572|rec__572'hdep : 0 .. 1439 & rec__572'har : 0 .. 1439 & rec__572'hdep <= rec__572'har})
      & volsDeLigne : {rec__573|rec__573'dist : 0 .. 2000 & rec__573'vdep /= rec__573'var} +-> FIN({rec__574|rec__574'hdep : 0 .. 1439 & rec__574'har : 0 .. 1439 & rec__574'hdep <= rec__574'har})
      & ligneDeVol : {rec__575|rec__575'hdep : 0 .. 1439 & rec__575'har : 0 .. 1439 & rec__575'hdep <= rec__575'har} +-> {rec__576|rec__576'dist : 0 .. 2000 & rec__576'vdep /= rec__576'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1074|#x.(cmpset__1074 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1076|#x.(cmpset__1076 = {cmpset__1075|#y.(cmpset__1075 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__577|rec__577'hdep : 0 .. 1439 & rec__577'har : 0 .. 1439 & rec__577'hdep <= rec__577'har})
      & volsDeLigne' : {rec__578|rec__578'dist : 0 .. 2000 & rec__578'vdep /= rec__578'var} +-> FIN({rec__579|rec__579'hdep : 0 .. 1439 & rec__579'har : 0 .. 1439 & rec__579'hdep <= rec__579'har})
      & ligneDeVol' : {rec__580|rec__580'hdep : 0 .. 1439 & rec__580'har : 0 .. 1439 & rec__580'hdep <= rec__580'har} +-> {rec__581|rec__581'dist : 0 .. 2000 & rec__581'vdep /= rec__581'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__1077|#x.(cmpset__1077 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1079|#x.(cmpset__1079 = {cmpset__1078|#y.(cmpset__1078 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & Ligne' = Ligne - {this?}
      & volsDeLigne' = {m|m : volsDeLigne & prj1(struct(dist:INTEGER, var:VILLE, vdep:VILLE),POW(struct(har:INTEGER, hdep:INTEGER, numvol:NUMVOL)))(m) /= this?}
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;

  Ligne_setVdep_EXT(this?,vdep?) =
    ANY Ligne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__586|rec__586'dist : 0 .. 2000 & rec__586'vdep /= rec__586'var})
      & Ligne' : FIN({rec__587|rec__587'dist : 0 .. 2000 & rec__587'vdep /= rec__587'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep' = vdep?
      & var' = var
      & dist' = dist
    THEN
      Ligne := Ligne'
    END;

  Ligne_setVdep(this?,vdep?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__602|rec__602'dist : 0 .. 2000 & rec__602'vdep /= rec__602'var})
      & Ligne' : FIN({rec__603|rec__603'dist : 0 .. 2000 & rec__603'vdep /= rec__603'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep' = vdep?
      & var' = var
      & dist' = dist
      & Vol : FIN({rec__605|rec__605'hdep : 0 .. 1439 & rec__605'har : 0 .. 1439 & rec__605'hdep <= rec__605'har})
      & volsDeLigne : {rec__606|rec__606'dist : 0 .. 2000 & rec__606'vdep /= rec__606'var} +-> FIN({rec__607|rec__607'hdep : 0 .. 1439 & rec__607'har : 0 .. 1439 & rec__607'hdep <= rec__607'har})
      & ligneDeVol : {rec__608|rec__608'hdep : 0 .. 1439 & rec__608'har : 0 .. 1439 & rec__608'hdep <= rec__608'har} +-> {rec__609|rec__609'dist : 0 .. 2000 & rec__609'vdep /= rec__609'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1080|#x.(cmpset__1080 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1082|#x.(cmpset__1082 = {cmpset__1081|#y.(cmpset__1081 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__610|rec__610'hdep : 0 .. 1439 & rec__610'har : 0 .. 1439 & rec__610'hdep <= rec__610'har})
      & volsDeLigne' : {rec__611|rec__611'dist : 0 .. 2000 & rec__611'vdep /= rec__611'var} +-> FIN({rec__612|rec__612'hdep : 0 .. 1439 & rec__612'har : 0 .. 1439 & rec__612'hdep <= rec__612'har})
      & ligneDeVol' : {rec__613|rec__613'hdep : 0 .. 1439 & rec__613'har : 0 .. 1439 & rec__613'hdep <= rec__613'har} +-> {rec__614|rec__614'dist : 0 .. 2000 & rec__614'vdep /= rec__614'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1083|#x.(cmpset__1083 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1085|#x.(cmpset__1085 = {cmpset__1084|#y.(cmpset__1084 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1086|#x.(cmpset__1086 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__617|rec__617'dist : 0 .. 2000 & rec__617'vdep /= rec__617'var} +-> {rec__618|rec__618'dist : 0 .. 2000 & rec__618'vdep /= rec__618'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;

  result! <-- Ligne_getVdep_EXT(this?) =
    ANY Ligne',result!1168,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__622|rec__622'dist : 0 .. 2000 & rec__622'vdep /= rec__622'var})
      & Ligne' : FIN({rec__623|rec__623'dist : 0 .. 2000 & rec__623'vdep /= rec__623'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1168 = vdep
    THEN
      Ligne,result! := Ligne',result!1168
    END;

  result! <-- Ligne_getVdep(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1169,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__638|rec__638'dist : 0 .. 2000 & rec__638'vdep /= rec__638'var})
      & Ligne' : FIN({rec__639|rec__639'dist : 0 .. 2000 & rec__639'vdep /= rec__639'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1169 = vdep
      & Vol : FIN({rec__641|rec__641'hdep : 0 .. 1439 & rec__641'har : 0 .. 1439 & rec__641'hdep <= rec__641'har})
      & volsDeLigne : {rec__642|rec__642'dist : 0 .. 2000 & rec__642'vdep /= rec__642'var} +-> FIN({rec__643|rec__643'hdep : 0 .. 1439 & rec__643'har : 0 .. 1439 & rec__643'hdep <= rec__643'har})
      & ligneDeVol : {rec__644|rec__644'hdep : 0 .. 1439 & rec__644'har : 0 .. 1439 & rec__644'hdep <= rec__644'har} +-> {rec__645|rec__645'dist : 0 .. 2000 & rec__645'vdep /= rec__645'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1087|#x.(cmpset__1087 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1089|#x.(cmpset__1089 = {cmpset__1088|#y.(cmpset__1088 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__646|rec__646'hdep : 0 .. 1439 & rec__646'har : 0 .. 1439 & rec__646'hdep <= rec__646'har})
      & volsDeLigne' : {rec__647|rec__647'dist : 0 .. 2000 & rec__647'vdep /= rec__647'var} +-> FIN({rec__648|rec__648'hdep : 0 .. 1439 & rec__648'har : 0 .. 1439 & rec__648'hdep <= rec__648'har})
      & ligneDeVol' : {rec__649|rec__649'hdep : 0 .. 1439 & rec__649'har : 0 .. 1439 & rec__649'hdep <= rec__649'har} +-> {rec__650|rec__650'dist : 0 .. 2000 & rec__650'vdep /= rec__650'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1090|#x.(cmpset__1090 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1092|#x.(cmpset__1092 = {cmpset__1091|#y.(cmpset__1091 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1093|#x.(cmpset__1093 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__653|rec__653'dist : 0 .. 2000 & rec__653'vdep /= rec__653'var} +-> {rec__654|rec__654'dist : 0 .. 2000 & rec__654'vdep /= rec__654'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1169
    END;

  Ligne_setVar_EXT(this?,var?) =
    ANY Ligne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__658|rec__658'dist : 0 .. 2000 & rec__658'vdep /= rec__658'var})
      & Ligne' : FIN({rec__659|rec__659'dist : 0 .. 2000 & rec__659'vdep /= rec__659'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & var' = var?
      & vdep' = vdep
      & dist' = dist
    THEN
      Ligne := Ligne'
    END;

  Ligne_setVar(this?,var?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__674|rec__674'dist : 0 .. 2000 & rec__674'vdep /= rec__674'var})
      & Ligne' : FIN({rec__675|rec__675'dist : 0 .. 2000 & rec__675'vdep /= rec__675'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & var' = var?
      & vdep' = vdep
      & dist' = dist
      & Vol : FIN({rec__677|rec__677'hdep : 0 .. 1439 & rec__677'har : 0 .. 1439 & rec__677'hdep <= rec__677'har})
      & volsDeLigne : {rec__678|rec__678'dist : 0 .. 2000 & rec__678'vdep /= rec__678'var} +-> FIN({rec__679|rec__679'hdep : 0 .. 1439 & rec__679'har : 0 .. 1439 & rec__679'hdep <= rec__679'har})
      & ligneDeVol : {rec__680|rec__680'hdep : 0 .. 1439 & rec__680'har : 0 .. 1439 & rec__680'hdep <= rec__680'har} +-> {rec__681|rec__681'dist : 0 .. 2000 & rec__681'vdep /= rec__681'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1094|#x.(cmpset__1094 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1096|#x.(cmpset__1096 = {cmpset__1095|#y.(cmpset__1095 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__682|rec__682'hdep : 0 .. 1439 & rec__682'har : 0 .. 1439 & rec__682'hdep <= rec__682'har})
      & volsDeLigne' : {rec__683|rec__683'dist : 0 .. 2000 & rec__683'vdep /= rec__683'var} +-> FIN({rec__684|rec__684'hdep : 0 .. 1439 & rec__684'har : 0 .. 1439 & rec__684'hdep <= rec__684'har})
      & ligneDeVol' : {rec__685|rec__685'hdep : 0 .. 1439 & rec__685'har : 0 .. 1439 & rec__685'hdep <= rec__685'har} +-> {rec__686|rec__686'dist : 0 .. 2000 & rec__686'vdep /= rec__686'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1097|#x.(cmpset__1097 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1099|#x.(cmpset__1099 = {cmpset__1098|#y.(cmpset__1098 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1100|#x.(cmpset__1100 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__689|rec__689'dist : 0 .. 2000 & rec__689'vdep /= rec__689'var} +-> {rec__690|rec__690'dist : 0 .. 2000 & rec__690'vdep /= rec__690'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;

  result! <-- Ligne_getVar_EXT(this?) =
    ANY Ligne',result!1170,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__694|rec__694'dist : 0 .. 2000 & rec__694'vdep /= rec__694'var})
      & Ligne' : FIN({rec__695|rec__695'dist : 0 .. 2000 & rec__695'vdep /= rec__695'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1170 = var
    THEN
      Ligne,result! := Ligne',result!1170
    END;

  result! <-- Ligne_getVar(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1171,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__710|rec__710'dist : 0 .. 2000 & rec__710'vdep /= rec__710'var})
      & Ligne' : FIN({rec__711|rec__711'dist : 0 .. 2000 & rec__711'vdep /= rec__711'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1171 = var
      & Vol : FIN({rec__713|rec__713'hdep : 0 .. 1439 & rec__713'har : 0 .. 1439 & rec__713'hdep <= rec__713'har})
      & volsDeLigne : {rec__714|rec__714'dist : 0 .. 2000 & rec__714'vdep /= rec__714'var} +-> FIN({rec__715|rec__715'hdep : 0 .. 1439 & rec__715'har : 0 .. 1439 & rec__715'hdep <= rec__715'har})
      & ligneDeVol : {rec__716|rec__716'hdep : 0 .. 1439 & rec__716'har : 0 .. 1439 & rec__716'hdep <= rec__716'har} +-> {rec__717|rec__717'dist : 0 .. 2000 & rec__717'vdep /= rec__717'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1101|#x.(cmpset__1101 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1103|#x.(cmpset__1103 = {cmpset__1102|#y.(cmpset__1102 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__718|rec__718'hdep : 0 .. 1439 & rec__718'har : 0 .. 1439 & rec__718'hdep <= rec__718'har})
      & volsDeLigne' : {rec__719|rec__719'dist : 0 .. 2000 & rec__719'vdep /= rec__719'var} +-> FIN({rec__720|rec__720'hdep : 0 .. 1439 & rec__720'har : 0 .. 1439 & rec__720'hdep <= rec__720'har})
      & ligneDeVol' : {rec__721|rec__721'hdep : 0 .. 1439 & rec__721'har : 0 .. 1439 & rec__721'hdep <= rec__721'har} +-> {rec__722|rec__722'dist : 0 .. 2000 & rec__722'vdep /= rec__722'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1104|#x.(cmpset__1104 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1106|#x.(cmpset__1106 = {cmpset__1105|#y.(cmpset__1105 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1107|#x.(cmpset__1107 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__725|rec__725'dist : 0 .. 2000 & rec__725'vdep /= rec__725'var} +-> {rec__726|rec__726'dist : 0 .. 2000 & rec__726'vdep /= rec__726'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1171
    END;

  Ligne_setDist_EXT(dist?,this?) =
    ANY Ligne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__730|rec__730'dist : 0 .. 2000 & rec__730'vdep /= rec__730'var})
      & Ligne' : FIN({rec__731|rec__731'dist : 0 .. 2000 & rec__731'vdep /= rec__731'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & dist? : 0 .. 2000
      & dist' = dist?
      & vdep' = vdep
      & var' = var
    THEN
      Ligne := Ligne'
    END;

  Ligne_setDist(dist?,this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__746|rec__746'dist : 0 .. 2000 & rec__746'vdep /= rec__746'var})
      & Ligne' : FIN({rec__747|rec__747'dist : 0 .. 2000 & rec__747'vdep /= rec__747'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & dist? : 0 .. 2000
      & dist' = dist?
      & vdep' = vdep
      & var' = var
      & Vol : FIN({rec__749|rec__749'hdep : 0 .. 1439 & rec__749'har : 0 .. 1439 & rec__749'hdep <= rec__749'har})
      & volsDeLigne : {rec__750|rec__750'dist : 0 .. 2000 & rec__750'vdep /= rec__750'var} +-> FIN({rec__751|rec__751'hdep : 0 .. 1439 & rec__751'har : 0 .. 1439 & rec__751'hdep <= rec__751'har})
      & ligneDeVol : {rec__752|rec__752'hdep : 0 .. 1439 & rec__752'har : 0 .. 1439 & rec__752'hdep <= rec__752'har} +-> {rec__753|rec__753'dist : 0 .. 2000 & rec__753'vdep /= rec__753'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1108|#x.(cmpset__1108 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1110|#x.(cmpset__1110 = {cmpset__1109|#y.(cmpset__1109 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__754|rec__754'hdep : 0 .. 1439 & rec__754'har : 0 .. 1439 & rec__754'hdep <= rec__754'har})
      & volsDeLigne' : {rec__755|rec__755'dist : 0 .. 2000 & rec__755'vdep /= rec__755'var} +-> FIN({rec__756|rec__756'hdep : 0 .. 1439 & rec__756'har : 0 .. 1439 & rec__756'hdep <= rec__756'har})
      & ligneDeVol' : {rec__757|rec__757'hdep : 0 .. 1439 & rec__757'har : 0 .. 1439 & rec__757'hdep <= rec__757'har} +-> {rec__758|rec__758'dist : 0 .. 2000 & rec__758'vdep /= rec__758'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1111|#x.(cmpset__1111 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1113|#x.(cmpset__1113 = {cmpset__1112|#y.(cmpset__1112 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1114|#x.(cmpset__1114 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__761|rec__761'dist : 0 .. 2000 & rec__761'vdep /= rec__761'var} +-> {rec__762|rec__762'dist : 0 .. 2000 & rec__762'vdep /= rec__762'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;

  result! <-- Ligne_getDist_EXT(this?) =
    ANY Ligne',result!1172,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__766|rec__766'dist : 0 .. 2000 & rec__766'vdep /= rec__766'var})
      & Ligne' : FIN({rec__767|rec__767'dist : 0 .. 2000 & rec__767'vdep /= rec__767'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1172 : 0 .. 2000
      & result!1172 = dist
    THEN
      Ligne,result! := Ligne',result!1172
    END;

  result! <-- Ligne_getDist(this?) =
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1173,dist,dist',var,var',vdep,vdep'
    WHERE
        Ligne : FIN({rec__782|rec__782'dist : 0 .. 2000 & rec__782'vdep /= rec__782'var})
      & Ligne' : FIN({rec__783|rec__783'dist : 0 .. 2000 & rec__783'vdep /= rec__783'var})
      & dist : 0 .. 2000
      & vdep /= var
      & dist' : 0 .. 2000
      & vdep' /= var'
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & this? : Ligne
      & rec(vdep:vdep,var:var,dist:dist) = this?
      & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
      & vdep = vdep'
      & var = var'
      & dist = dist'
      & result!1173 : 0 .. 2000
      & result!1173 = dist
      & Vol : FIN({rec__785|rec__785'hdep : 0 .. 1439 & rec__785'har : 0 .. 1439 & rec__785'hdep <= rec__785'har})
      & volsDeLigne : {rec__786|rec__786'dist : 0 .. 2000 & rec__786'vdep /= rec__786'var} +-> FIN({rec__787|rec__787'hdep : 0 .. 1439 & rec__787'har : 0 .. 1439 & rec__787'hdep <= rec__787'har})
      & ligneDeVol : {rec__788|rec__788'hdep : 0 .. 1439 & rec__788'har : 0 .. 1439 & rec__788'hdep <= rec__788'har} +-> {rec__789|rec__789'dist : 0 .. 2000 & rec__789'vdep /= rec__789'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1115|#x.(cmpset__1115 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1117|#x.(cmpset__1117 = {cmpset__1116|#y.(cmpset__1116 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN({rec__790|rec__790'hdep : 0 .. 1439 & rec__790'har : 0 .. 1439 & rec__790'hdep <= rec__790'har})
      & volsDeLigne' : {rec__791|rec__791'dist : 0 .. 2000 & rec__791'vdep /= rec__791'var} +-> FIN({rec__792|rec__792'hdep : 0 .. 1439 & rec__792'har : 0 .. 1439 & rec__792'hdep <= rec__792'har})
      & ligneDeVol' : {rec__793|rec__793'hdep : 0 .. 1439 & rec__793'har : 0 .. 1439 & rec__793'hdep <= rec__793'har} +-> {rec__794|rec__794'dist : 0 .. 2000 & rec__794'vdep /= rec__794'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__1118|#x.(cmpset__1118 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1120|#x.(cmpset__1120 = {cmpset__1119|#y.(cmpset__1119 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__1121|#x.(cmpset__1121 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__797|rec__797'dist : 0 .. 2000 & rec__797'vdep /= rec__797'var} +-> {rec__798|rec__798'dist : 0 .. 2000 & rec__798'vdep /= rec__798'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1173
    END;

  Ligne_linkVolsDeLigne(this?,v?) =
    ANY ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__813|rec__813'hdep : 0 .. 1439 & rec__813'har : 0 .. 1439 & rec__813'hdep <= rec__813'har})
      & Ligne : FIN({rec__814|rec__814'dist : 0 .. 2000 & rec__814'vdep /= rec__814'var})
      & volsDeLigne : {rec__815|rec__815'dist : 0 .. 2000 & rec__815'vdep /= rec__815'var} +-> FIN({rec__816|rec__816'hdep : 0 .. 1439 & rec__816'har : 0 .. 1439 & rec__816'hdep <= rec__816'har})
      & ligneDeVol : {rec__817|rec__817'hdep : 0 .. 1439 & rec__817'har : 0 .. 1439 & rec__817'hdep <= rec__817'har} +-> {rec__818|rec__818'dist : 0 .. 2000 & rec__818'vdep /= rec__818'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1122|#x.(cmpset__1122 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1124|#x.(cmpset__1124 = {cmpset__1123|#y.(cmpset__1123 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__819|rec__819'hdep : 0 .. 1439 & rec__819'har : 0 .. 1439 & rec__819'hdep <= rec__819'har})
      & Ligne : FIN({rec__820|rec__820'dist : 0 .. 2000 & rec__820'vdep /= rec__820'var})
      & volsDeLigne' : {rec__821|rec__821'dist : 0 .. 2000 & rec__821'vdep /= rec__821'var} +-> FIN({rec__822|rec__822'hdep : 0 .. 1439 & rec__822'har : 0 .. 1439 & rec__822'hdep <= rec__822'har})
      & ligneDeVol' : {rec__823|rec__823'hdep : 0 .. 1439 & rec__823'har : 0 .. 1439 & rec__823'hdep <= rec__823'har} +-> {rec__824|rec__824'dist : 0 .. 2000 & rec__824'vdep /= rec__824'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__1125|#x.(cmpset__1125 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1127|#x.(cmpset__1127 = {cmpset__1126|#y.(cmpset__1126 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & v?'hdep <= v?'har
      & v? : Vol
      & this? : Ligne
      & ligneDeVol' = ligneDeVol <+ {v? |-> this?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;

  Ligne_unlinkVolsDeLigne(this?,v?) =
    ANY ligneDeVol',volsDeLigne'
    WHERE
        Vol : FIN({rec__841|rec__841'hdep : 0 .. 1439 & rec__841'har : 0 .. 1439 & rec__841'hdep <= rec__841'har})
      & Ligne : FIN({rec__842|rec__842'dist : 0 .. 2000 & rec__842'vdep /= rec__842'var})
      & volsDeLigne : {rec__843|rec__843'dist : 0 .. 2000 & rec__843'vdep /= rec__843'var} +-> FIN({rec__844|rec__844'hdep : 0 .. 1439 & rec__844'har : 0 .. 1439 & rec__844'hdep <= rec__844'har})
      & ligneDeVol : {rec__845|rec__845'hdep : 0 .. 1439 & rec__845'har : 0 .. 1439 & rec__845'hdep <= rec__845'har} +-> {rec__846|rec__846'dist : 0 .. 2000 & rec__846'vdep /= rec__846'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1128|#x.(cmpset__1128 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1130|#x.(cmpset__1130 = {cmpset__1129|#y.(cmpset__1129 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__847|rec__847'hdep : 0 .. 1439 & rec__847'har : 0 .. 1439 & rec__847'hdep <= rec__847'har})
      & Ligne : FIN({rec__848|rec__848'dist : 0 .. 2000 & rec__848'vdep /= rec__848'var})
      & volsDeLigne' : {rec__849|rec__849'dist : 0 .. 2000 & rec__849'vdep /= rec__849'var} +-> FIN({rec__850|rec__850'hdep : 0 .. 1439 & rec__850'har : 0 .. 1439 & rec__850'hdep <= rec__850'har})
      & ligneDeVol' : {rec__851|rec__851'hdep : 0 .. 1439 & rec__851'har : 0 .. 1439 & rec__851'hdep <= rec__851'har} +-> {rec__852|rec__852'dist : 0 .. 2000 & rec__852'vdep /= rec__852'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__1131|#x.(cmpset__1131 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__1133|#x.(cmpset__1133 = {cmpset__1132|#y.(cmpset__1132 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & v?'hdep <= v?'har
      & this? : dom(volsDeLigne)
      & ligneDeVol' = ligneDeVol - {v? |-> this?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;

  result! <-- Ligne_getVolsDeLigne(this?) =
    ANY result!1174
    WHERE
        Vol : FIN({rec__869|rec__869'hdep : 0 .. 1439 & rec__869'har : 0 .. 1439 & rec__869'hdep <= rec__869'har})
      & Ligne : FIN({rec__870|rec__870'dist : 0 .. 2000 & rec__870'vdep /= rec__870'var})
      & volsDeLigne : {rec__871|rec__871'dist : 0 .. 2000 & rec__871'vdep /= rec__871'var} +-> FIN({rec__872|rec__872'hdep : 0 .. 1439 & rec__872'har : 0 .. 1439 & rec__872'hdep <= rec__872'har})
      & ligneDeVol : {rec__873|rec__873'hdep : 0 .. 1439 & rec__873'har : 0 .. 1439 & rec__873'hdep <= rec__873'har} +-> {rec__874|rec__874'dist : 0 .. 2000 & rec__874'vdep /= rec__874'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1134|#x.(cmpset__1134 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1136|#x.(cmpset__1136 = {cmpset__1135|#y.(cmpset__1135 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__875|rec__875'hdep : 0 .. 1439 & rec__875'har : 0 .. 1439 & rec__875'hdep <= rec__875'har})
      & Ligne : FIN({rec__876|rec__876'dist : 0 .. 2000 & rec__876'vdep /= rec__876'var})
      & volsDeLigne : {rec__877|rec__877'dist : 0 .. 2000 & rec__877'vdep /= rec__877'var} +-> FIN({rec__878|rec__878'hdep : 0 .. 1439 & rec__878'har : 0 .. 1439 & rec__878'hdep <= rec__878'har})
      & ligneDeVol : {rec__879|rec__879'hdep : 0 .. 1439 & rec__879'har : 0 .. 1439 & rec__879'hdep <= rec__879'har} +-> {rec__880|rec__880'dist : 0 .. 2000 & rec__880'vdep /= rec__880'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1137|#x.(cmpset__1137 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1139|#x.(cmpset__1139 = {cmpset__1138|#y.(cmpset__1138 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & result!1174 : FIN({rec__882|rec__882'hdep : 0 .. 1439 & rec__882'har : 0 .. 1439 & rec__882'hdep <= rec__882'har})
      & result!1174 = volsDeLigne(this?)
    THEN
      result! := result!1174
    END;

  CheckGlobalInvariant =
    SELECT
        Vol : FIN({rec__931|rec__931'hdep : 0 .. 1439 & rec__931'har : 0 .. 1439 & rec__931'hdep <= rec__931'har})
      & Ligne : FIN({rec__932|rec__932'dist : 0 .. 2000 & rec__932'vdep /= rec__932'var})
      & volsDeLigne : {rec__933|rec__933'dist : 0 .. 2000 & rec__933'vdep /= rec__933'var} +-> FIN({rec__934|rec__934'hdep : 0 .. 1439 & rec__934'har : 0 .. 1439 & rec__934'hdep <= rec__934'har})
      & ligneDeVol : {rec__935|rec__935'hdep : 0 .. 1439 & rec__935'har : 0 .. 1439 & rec__935'hdep <= rec__935'har} +-> {rec__936|rec__936'dist : 0 .. 2000 & rec__936'vdep /= rec__936'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1149|#x.(cmpset__1149 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1151|#x.(cmpset__1151 = {cmpset__1150|#y.(cmpset__1150 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__937|rec__937'hdep : 0 .. 1439 & rec__937'har : 0 .. 1439 & rec__937'hdep <= rec__937'har})
      & Ligne : FIN({rec__938|rec__938'dist : 0 .. 2000 & rec__938'vdep /= rec__938'var})
      & volsDeLigne : {rec__939|rec__939'dist : 0 .. 2000 & rec__939'vdep /= rec__939'var} +-> FIN({rec__940|rec__940'hdep : 0 .. 1439 & rec__940'har : 0 .. 1439 & rec__940'hdep <= rec__940'har})
      & ligneDeVol : {rec__941|rec__941'hdep : 0 .. 1439 & rec__941'har : 0 .. 1439 & rec__941'hdep <= rec__941'har} +-> {rec__942|rec__942'dist : 0 .. 2000 & rec__942'vdep /= rec__942'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1152|#x.(cmpset__1152 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1154|#x.(cmpset__1154 = {cmpset__1153|#y.(cmpset__1153 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
    THEN
      skip
    END;

  zcoverage!,zcoverageMax!,znotCovered! <-- Coverage_model =
    SELECT
        Vol : FIN({rec__955|rec__955'hdep : 0 .. 1439 & rec__955'har : 0 .. 1439 & rec__955'hdep <= rec__955'har})
      & Ligne : FIN({rec__956|rec__956'dist : 0 .. 2000 & rec__956'vdep /= rec__956'var})
      & volsDeLigne : {rec__957|rec__957'dist : 0 .. 2000 & rec__957'vdep /= rec__957'var} +-> FIN({rec__958|rec__958'hdep : 0 .. 1439 & rec__958'har : 0 .. 1439 & rec__958'hdep <= rec__958'har})
      & ligneDeVol : {rec__959|rec__959'hdep : 0 .. 1439 & rec__959'har : 0 .. 1439 & rec__959'hdep <= rec__959'har} +-> {rec__960|rec__960'dist : 0 .. 2000 & rec__960'vdep /= rec__960'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1155|#x.(cmpset__1155 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1157|#x.(cmpset__1157 = {cmpset__1156|#y.(cmpset__1156 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN({rec__961|rec__961'hdep : 0 .. 1439 & rec__961'har : 0 .. 1439 & rec__961'hdep <= rec__961'har})
      & Ligne : FIN({rec__962|rec__962'dist : 0 .. 2000 & rec__962'vdep /= rec__962'var})
      & volsDeLigne : {rec__963|rec__963'dist : 0 .. 2000 & rec__963'vdep /= rec__963'var} +-> FIN({rec__964|rec__964'hdep : 0 .. 1439 & rec__964'har : 0 .. 1439 & rec__964'hdep <= rec__964'har})
      & ligneDeVol : {rec__965|rec__965'hdep : 0 .. 1439 & rec__965'har : 0 .. 1439 & rec__965'hdep <= rec__965'har} +-> {rec__966|rec__966'dist : 0 .. 2000 & rec__966'vdep /= rec__966'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__1158|#x.(cmpset__1158 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__1160|#x.(cmpset__1160 = {cmpset__1159|#y.(cmpset__1159 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
    THEN
      LET zcoverage!1175,zcoverageMax!1176,znotCovered!1177 BE zcoverage!1175 = 0 + (IF Vol /= {} THEN 1 ELSE 0 END) + (IF Ligne /= {} THEN 1 ELSE 0 END) + (IF volsDeLigne /= {} THEN 1 ELSE 0 END) + (IF ligneDeVol /= {} THEN 1 ELSE 0 END) & zcoverageMax!1176 = 4 & znotCovered!1177 = zcoverageMax!1176 - zcoverage!1175
      IN
        zcoverage!,zcoverageMax!,znotCovered! := zcoverage!1175,zcoverageMax!1176,znotCovered!1177
      END
    END
END
