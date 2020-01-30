
MACHINE model_internal_ppf
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
INVARIANT
    Ligne : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
  & Vol : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
  & ligneDeVol : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
  & volsDeLigne : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
INITIALISATION
    LET Vol',Ligne',volsDeLigne',ligneDeVol' BE Vol' = {} & Ligne' = {} & volsDeLigne' = {} & ligneDeVol' = union({cmpset__1114|cmpset__1114 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1114 = {cmpset__1113|cmpset__1113 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1113 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
    IN
      SELECT 
          volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1112|cmpset__1112 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1112 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = {}
      THEN 
        Ligne,Vol,ligneDeVol,volsDeLigne := Ligne',Vol',ligneDeVol',volsDeLigne'
      END
    END
OPERATIONS
  Vol_delWithLinks(this?) = 
    PRE 
        this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      LET Vol',ligneDeVol',volsDeLigne' BE Vol' = Vol - {this?} & ligneDeVol' = {m|m : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & (m : ligneDeVol & prj1(struct(har:HR, hdep:HR, numvol:NUMVOL),struct(dist:DIST, var:VILLE, vdep:VILLE))(m) /= this?)} & volsDeLigne' = {cmpset__970|cmpset__970 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__970 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
      IN
        SELECT 
            volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
          & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
          & dom(volsDeLigne') <: Ligne
          & union(ran(volsDeLigne')) <: Vol'
          & ligneDeVol' = union({cmpset__972|cmpset__972 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__972 = {cmpset__971|cmpset__971 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__971 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        THEN 
          Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
        END
      END
    END;
  
  Vol_setNumvol(numvol?,this?) = 
    PRE 
        numvol? : NUMVOL
      & this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & numvol' = numvol?
        & hdep' = hdep
        & har' = har
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__976|cmpset__976 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__976 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__978|cmpset__978 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__978 = {cmpset__977|cmpset__977 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__977 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__979|cmpset__979 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__979 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Vol_getNumvol(this?) = 
    PRE 
        this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1133,har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1133 : NUMVOL
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & numvol = numvol'
        & hdep = hdep'
        & har = har'
        & result!1133 = numvol
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__983|cmpset__983 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__983 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__985|cmpset__985 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__985 = {cmpset__984|cmpset__984 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__984 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__986|cmpset__986 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__986 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1133
      END
    END;
  
  Vol_setHdep(hdep?,this?) = 
    PRE 
        hdep? : HR
      & this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & hdep' = hdep?
        & numvol' = numvol
        & har' = har
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__990|cmpset__990 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__990 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__992|cmpset__992 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__992 = {cmpset__991|cmpset__991 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__991 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__993|cmpset__993 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__993 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Vol_getHdep(this?) = 
    PRE 
        this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1134,har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1134 : HR
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & numvol = numvol'
        & hdep = hdep'
        & har = har'
        & result!1134 = hdep
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__997|cmpset__997 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__997 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__999|cmpset__999 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__999 = {cmpset__998|cmpset__998 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__998 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__1000|cmpset__1000 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1000 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1134
      END
    END;
  
  Vol_setHar(har?,this?) = 
    PRE 
        har? : HR
      & this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & har' = har?
        & numvol' = numvol
        & hdep' = hdep
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1004|cmpset__1004 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1004 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1006|cmpset__1006 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1006 = {cmpset__1005|cmpset__1005 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1005 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__1007|cmpset__1007 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1007 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne := Vol',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Vol_getHar(this?) = 
    PRE 
        this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1135,har,har',hdep,hdep',numvol,numvol'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1135 : HR
        & har : HR
        & har' : HR
        & hdep : HR
        & hdep' : HR
        & numvol : NUMVOL
        & numvol' : NUMVOL
        & this? : Vol
        & rec(numvol:numvol,hdep:hdep,har:har) = this?
        & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
        & numvol = numvol'
        & hdep = hdep'
        & har = har'
        & result!1135 = har
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1011|cmpset__1011 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1011 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1013|cmpset__1013 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1013 = {cmpset__1012|cmpset__1012 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1012 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Ligne = Ligne'
        & (# /* LET */ (newId).( (newId)=({cmpset__1014|cmpset__1014 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(har:HR,hdep:HR,numvol:NUMVOL) & #x.(x : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1014 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)}))} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(har:HR,hdep:HR,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      THEN
        Vol,ligneDeVol,volsDeLigne,result! := Vol',ligneDeVol',volsDeLigne',result!1135
      END
    END;
  
  Vol_linkLigneDeVol(l?,this?) = 
    PRE 
        l? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY ligneDeVol',volsDeLigne'
      WHERE 
          ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne
        & union(ran(volsDeLigne')) <: Vol
        & volsDeLigne' = {cmpset__1018|cmpset__1018 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1018 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1020|cmpset__1020 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1020 = {cmpset__1019|cmpset__1019 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1019 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & l? : Ligne
        & this? : Vol
        & ligneDeVol' = ligneDeVol <+ {this? |-> l?}
      THEN
        ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
      END
    END;
  
  Vol_unlinkLigneDeVol(l?,this?) = 
    PRE 
        l? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY ligneDeVol',volsDeLigne'
      WHERE 
          ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne
        & union(ran(volsDeLigne')) <: Vol
        & volsDeLigne' = {cmpset__1024|cmpset__1024 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1024 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1026|cmpset__1026 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1026 = {cmpset__1025|cmpset__1025 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1025 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & this? : dom(ligneDeVol)
        & ligneDeVol' = ligneDeVol - {this? |-> l?}
      THEN
        ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Vol_getLigneDeVol(this?) = 
    PRE 
        this? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      LET result!1136 BE result!1136 = ligneDeVol(this?)
      IN
        result! := result!1136
      END
    END;
  
  Ligne_delWithLinks(this?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      LET Ligne',volsDeLigne',ligneDeVol' BE Ligne' = Ligne - {this?} & volsDeLigne' = {m|m : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & (m : volsDeLigne & prj1(struct(dist:DIST, var:VILLE, vdep:VILLE),POW(struct(har:HR, hdep:HR, numvol:NUMVOL)))(m) /= this?)} & ligneDeVol' = union({cmpset__1051|cmpset__1051 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1051 = {cmpset__1050|cmpset__1050 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1050 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
      IN
        SELECT 
            volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
          & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
          & dom(volsDeLigne') <: Ligne'
          & union(ran(volsDeLigne')) <: Vol
          & volsDeLigne' = {cmpset__1049|cmpset__1049 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1049 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        THEN 
          Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
        END
      END
    END;
  
  Ligne_setVdep(this?,vdep?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & vdep? : VILLE
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & vdep' = vdep?
        & var' = var
        & dist' = dist
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1055|cmpset__1055 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1055 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1057|cmpset__1057 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1057 = {cmpset__1056|cmpset__1056 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1056 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1058|cmpset__1058 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1058 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Ligne_getVdep(this?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1137,dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1137 : VILLE
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & vdep = vdep'
        & var = var'
        & dist = dist'
        & result!1137 = vdep
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1062|cmpset__1062 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1062 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1064|cmpset__1064 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1064 = {cmpset__1063|cmpset__1063 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1063 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1065|cmpset__1065 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1065 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1137
      END
    END;
  
  Ligne_setVar(this?,var?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & var? : VILLE
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & var' = var?
        & vdep' = vdep
        & dist' = dist
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1069|cmpset__1069 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1069 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1071|cmpset__1071 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1071 = {cmpset__1070|cmpset__1070 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1070 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1072|cmpset__1072 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1072 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Ligne_getVar(this?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1138,dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1138 : VILLE
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & vdep = vdep'
        & var = var'
        & dist = dist'
        & result!1138 = var
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1076|cmpset__1076 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1076 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1078|cmpset__1078 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1078 = {cmpset__1077|cmpset__1077 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1077 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1079|cmpset__1079 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1079 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1138
      END
    END;
  
  Ligne_setDist(dist?,this?) = 
    PRE 
        dist? : DIST
      & this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & dist' = dist?
        & vdep' = vdep
        & var' = var
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1083|cmpset__1083 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1083 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1085|cmpset__1085 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1085 = {cmpset__1084|cmpset__1084 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1084 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1086|cmpset__1086 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1086 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Ligne_getDist(this?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!1139,dist,dist',var,var',vdep,vdep'
      WHERE 
          Ligne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE))
        & Vol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & result!1139 : DIST
        & dist : DIST
        & dist' : DIST
        & var : VILLE
        & var' : VILLE
        & vdep : VILLE
        & vdep' : VILLE
        & this? : Ligne
        & rec(vdep:vdep,var:var,dist:dist) = this?
        & Ligne' = Ligne - {this?} \/ {rec(vdep:vdep',var:var',dist:dist')}
        & vdep = vdep'
        & var = var'
        & dist = dist'
        & result!1139 = dist
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) <: Vol'
        & volsDeLigne' = {cmpset__1090|cmpset__1090 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1090 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1092|cmpset__1092 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1092 = {cmpset__1091|cmpset__1091 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1091 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & Vol = Vol'
        & (# /* LET */ (newId).( (newId)=({cmpset__1093|cmpset__1093 : struct(dist:DIST,var:VILLE,vdep:VILLE) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1093 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)}))} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> struct(dist:DIST,var:VILLE,vdep:VILLE) & volsDeLigne' = (newId~ ; volsDeLigne)))
      THEN
        Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!1139
      END
    END;
  
  Ligne_linkVolsDeLigne(this?,v?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & v? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY ligneDeVol',volsDeLigne'
      WHERE 
          ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne
        & union(ran(volsDeLigne')) <: Vol
        & volsDeLigne' = {cmpset__1097|cmpset__1097 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1097 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1099|cmpset__1099 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1099 = {cmpset__1098|cmpset__1098 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1098 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & v? : Vol
        & this? : Ligne
        & ligneDeVol' = ligneDeVol <+ {v? |-> this?}
      THEN
        ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
      END
    END;
  
  Ligne_unlinkVolsDeLigne(this?,v?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
      & v? : struct(har:HR,hdep:HR,numvol:NUMVOL)
    THEN
      ANY ligneDeVol',volsDeLigne'
      WHERE 
          ligneDeVol' : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE))
        & volsDeLigne' : POW(struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)))
        & volsDeLigne' : struct(dist:DIST,var:VILLE,vdep:VILLE) +-> POW(struct(har:HR,hdep:HR,numvol:NUMVOL))
        & ligneDeVol' : struct(har:HR,hdep:HR,numvol:NUMVOL) +-> struct(dist:DIST,var:VILLE,vdep:VILLE)
        & dom(volsDeLigne') <: Ligne
        & union(ran(volsDeLigne')) <: Vol
        & volsDeLigne' = {cmpset__1103|cmpset__1103 : struct(dist:DIST,var:VILLE,vdep:VILLE) * POW(struct(har:HR,hdep:HR,numvol:NUMVOL)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1103 = x |-> {y|y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & ligneDeVol' = union({cmpset__1105|cmpset__1105 : POW(struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:DIST,var:VILLE,vdep:VILLE) & (cmpset__1105 = {cmpset__1104|cmpset__1104 : struct(har:HR,hdep:HR,numvol:NUMVOL) * struct(dist:DIST,var:VILLE,vdep:VILLE) & #y.(y : struct(har:HR,hdep:HR,numvol:NUMVOL) & (cmpset__1104 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))})
        & this? : dom(volsDeLigne)
        & ligneDeVol' = ligneDeVol - {v? |-> this?}
      THEN
        ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
      END
    END;
  
  result! <-- Ligne_getVolsDeLigne(this?) = 
    PRE 
        this? : struct(dist:DIST,var:VILLE,vdep:VILLE)
    THEN
      LET result!1140 BE result!1140 = volsDeLigne(this?)
      IN
        result! := result!1140
      END
    END;
  
  CheckGlobalInvariant = 
    skip;
  
  zcoverage!,zcoverageMax!,znotCovered! <-- Coverage_model = 
    LET zcoverage!1141,zcoverageMax!1142,znotCovered!1143 BE zcoverage!1141 = 0 + (IF Vol /= {} THEN 1 ELSE 0 END) + (IF Ligne /= {} THEN 1 ELSE 0 END) + (IF volsDeLigne /= {} THEN 1 ELSE 0 END) + (IF ligneDeVol /= {} THEN 1 ELSE 0 END) & zcoverageMax!1142 = 4 & znotCovered!1143 = zcoverageMax!1142 - zcoverage!1141
    IN
      zcoverage!,zcoverageMax!,znotCovered! := zcoverage!1141,zcoverageMax!1142,znotCovered!1143
    END
END
