
MACHINE model
SETS /* deferred */
  NUMVOL;
  VILLE;
  NOIMMAT;
  TYPE
 ; /* enumerated */
  CATEG={Fret,Passagers}
ABSTRACT_VARIABLES
  Avion,
  Instance,
  Ligne,
  Vol,
  avionDInstance,
  instancesDAvion,
  instancesDeVol,
  ligneDeVol,
  volDInstance,
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
  Vol_linkInstancesDeVol,
  Vol_unlinkInstancesDeVol,
  Vol_getInstancesDeVol,
  Ligne_new,
  Ligne_new2,
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
  Instance_new,
  Instance_newWithLinks,
  Instance_delete,
  Instance_delWithLinks,
  Instance_setNumvol_EXT,
  Instance_setNumvol,
  Instance_getNumvol_EXT,
  Instance_getNumvol,
  Instance_setSem_EXT,
  Instance_setSem,
  Instance_getSem_EXT,
  Instance_getSem,
  Instance_setJr_EXT,
  Instance_setJr,
  Instance_getJr_EXT,
  Instance_getJr,
  Instance_setCateg_EXT,
  Instance_setCateg,
  Instance_getCateg_EXT,
  Instance_getCateg,
  Instance_setDuree_EXT,
  Instance_setDuree,
  Instance_getDuree_EXT,
  Instance_getDuree,
  Instance_setRes1_EXT,
  Instance_setRes1,
  Instance_getRes1_EXT,
  Instance_getRes1,
  Instance_setRes2_EXT,
  Instance_setRes2,
  Instance_getRes2_EXT,
  Instance_getRes2,
  Instance_setTonnage_EXT,
  Instance_setTonnage,
  Instance_getTonnage_EXT,
  Instance_getTonnage,
  Instance_linkAvionDInstance,
  Instance_unlinkAvionDInstance,
  Instance_getAvionDInstance,
  Instance_linkVolDInstance,
  Instance_unlinkVolDInstance,
  Instance_getVolDInstance,
  Avion_new,
  Avion_newWithLinks,
  Avion_delete,
  Avion_delWithLinks,
  Avion_setNoimmat_EXT,
  Avion_setNoimmat,
  Avion_getNoimmat_EXT,
  Avion_getNoimmat,
  Avion_setCateg_EXT,
  Avion_setCateg,
  Avion_getCateg_EXT,
  Avion_getCateg,
  Avion_setRayon_EXT,
  Avion_setRayon,
  Avion_getRayon_EXT,
  Avion_getRayon,
  Avion_setHrv_EXT,
  Avion_setHrv,
  Avion_getHrv_EXT,
  Avion_getHrv,
  Avion_setType_EXT,
  Avion_setType,
  Avion_getType_EXT,
  Avion_getType,
  Avion_setCapa1_EXT,
  Avion_setCapa1,
  Avion_getCapa1_EXT,
  Avion_getCapa1,
  Avion_setCapa2_EXT,
  Avion_setCapa2,
  Avion_getCapa2_EXT,
  Avion_getCapa2,
  Avion_setTonnage_EXT,
  Avion_setTonnage,
  Avion_getTonnage_EXT,
  Avion_getTonnage,
  Avion_linkInstancesDAvion,
  Avion_unlinkInstancesDAvion,
  Avion_getInstancesDAvion,
  CheckGlobalInvariant,
  Coverage_model */
INITIALISATION
    LET Vol',Ligne',Instance',Avion',volsDeLigne',ligneDeVol',instancesDAvion',avionDInstance',volDInstance',instancesDeVol' BE Vol' = {} & Ligne' = {} & Instance' = {} & Avion' = {} & volsDeLigne' = {} & ligneDeVol' = union({cmpset__5975|#x.(cmpset__5975 = {cmpset__5974|#y.(cmpset__5974 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))}) & instancesDAvion' = {} & avionDInstance' = union({cmpset__5978|#x.(cmpset__5978 = {cmpset__5977|#y.(cmpset__5977 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))}) & volDInstance' = {} & instancesDeVol' = {cmpset__5979|#x.(cmpset__5979 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
    IN
      SELECT 
          Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
        & Ligne' : FIN({rec__4935|rec__4935'dist : 0 .. 2000 & rec__4935'vdep /= rec__4935'var})
        & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
        & volsDeLigne' : {rec__4938|rec__4938'dist : 0 .. 2000 & rec__4938'vdep /= rec__4938'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
        & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4941|rec__4941'dist : 0 .. 2000 & rec__4941'vdep /= rec__4941'var}
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) = Vol'
        & volsDeLigne' = {cmpset__5973|#x.(cmpset__5973 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
        & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
        & dom(instancesDAvion') <: Avion'
        & union(ran(instancesDAvion')) <: Instance'
        & instancesDAvion' = {cmpset__5976|#x.(cmpset__5976 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
        & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
        & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & dom(volDInstance') = Instance'
        & ran(volDInstance') <: Vol'
        & volDInstance' = union({cmpset__5981|#x.(cmpset__5981 = {cmpset__5980|#y.(cmpset__5980 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
        & ligneDeVol' = {}
        & avionDInstance' = {}
        & instancesDeVol' = {}
      THEN 
        Avion,Instance,Ligne,Vol,avionDInstance,instancesDAvion,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Avion',Instance',Ligne',Vol',avionDInstance',instancesDAvion',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
      END
    END
OPERATIONS
  Vol_new(vol?) = 
    ANY Vol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & vol?'hdep : 0 .. 1439
      & vol?'har : 0 .. 1439
      & Vol' = Vol \/ {vol?}
    THEN
      Vol := Vol'
    END;
  
  Vol_newWithLinks(ligneDeVol?,vol?) = 
    ANY Vol',ligneDeVol',volsDeLigne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1460|rec__1460'dist : 0 .. 2000 & rec__1460'vdep /= rec__1460'var})
      & volsDeLigne : {rec__1461|rec__1461'dist : 0 .. 2000 & rec__1461'vdep /= rec__1461'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1464|rec__1464'dist : 0 .. 2000 & rec__1464'vdep /= rec__1464'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5195|#x.(cmpset__5195 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5197|#x.(cmpset__5197 = {cmpset__5196|#y.(cmpset__5196 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne : FIN({rec__1465|rec__1465'dist : 0 .. 2000 & rec__1465'vdep /= rec__1465'var})
      & volsDeLigne' : {rec__1466|rec__1466'dist : 0 .. 2000 & rec__1466'vdep /= rec__1466'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1469|rec__1469'dist : 0 .. 2000 & rec__1469'vdep /= rec__1469'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5198|#x.(cmpset__5198 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5200|#x.(cmpset__5200 = {cmpset__5199|#y.(cmpset__5199 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & vol?'hdep : 0 .. 1439
      & vol?'har : 0 .. 1439
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
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & Vol' = Vol - {this?}
    THEN
      Vol := Vol'
    END;
  
  Vol_delWithLinks(this?) = 
    ANY Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1503|rec__1503'dist : 0 .. 2000 & rec__1503'vdep /= rec__1503'var})
      & volsDeLigne : {rec__1504|rec__1504'dist : 0 .. 2000 & rec__1504'vdep /= rec__1504'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1507|rec__1507'dist : 0 .. 2000 & rec__1507'vdep /= rec__1507'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5201|#x.(cmpset__5201 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5203|#x.(cmpset__5203 = {cmpset__5202|#y.(cmpset__5202 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne : FIN({rec__1508|rec__1508'dist : 0 .. 2000 & rec__1508'vdep /= rec__1508'var})
      & volsDeLigne' : {rec__1509|rec__1509'dist : 0 .. 2000 & rec__1509'vdep /= rec__1509'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1512|rec__1512'dist : 0 .. 2000 & rec__1512'vdep /= rec__1512'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5204|#x.(cmpset__5204 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5206|#x.(cmpset__5206 = {cmpset__5205|#y.(cmpset__5205 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5207|#x.(cmpset__5207 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5209|#x.(cmpset__5209 = {cmpset__5208|#y.(cmpset__5208 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5210|#x.(cmpset__5210 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5212|#x.(cmpset__5212 = {cmpset__5211|#y.(cmpset__5211 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & Vol' = Vol - {this?}
      & ligneDeVol' = {m|m : ligneDeVol & prj1(struct(har:INTEGER, hdep:INTEGER, numvol:NUMVOL),struct(dist:INTEGER, var:VILLE, vdep:VILLE))(m) /= this?}
      & instancesDeVol' = {m|m : instancesDeVol & prj1(struct(har:INTEGER, hdep:INTEGER, numvol:NUMVOL),POW(struct(categ:CATEG, duree:INTEGER, jr:INTEGER, numvol:NUMVOL, res1:INTEGER, res2:INTEGER, sem:INTEGER, tonnage:INTEGER)))(m) /= this?}
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
    END;
  
  Vol_setNumvol_EXT(numvol?,this?) = 
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
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
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol' = numvol?
      & hdep' = hdep
      & har' = har
      & Ligne : FIN({rec__1556|rec__1556'dist : 0 .. 2000 & rec__1556'vdep /= rec__1556'var})
      & volsDeLigne : {rec__1557|rec__1557'dist : 0 .. 2000 & rec__1557'vdep /= rec__1557'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1560|rec__1560'dist : 0 .. 2000 & rec__1560'vdep /= rec__1560'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5213|#x.(cmpset__5213 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5215|#x.(cmpset__5215 = {cmpset__5214|#y.(cmpset__5214 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1561|rec__1561'dist : 0 .. 2000 & rec__1561'vdep /= rec__1561'var})
      & volsDeLigne' : {rec__1562|rec__1562'dist : 0 .. 2000 & rec__1562'vdep /= rec__1562'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1565|rec__1565'dist : 0 .. 2000 & rec__1565'vdep /= rec__1565'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5216|#x.(cmpset__5216 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5218|#x.(cmpset__5218 = {cmpset__5217|#y.(cmpset__5217 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5219|#x.(cmpset__5219 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5221|#x.(cmpset__5221 = {cmpset__5220|#y.(cmpset__5220 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5222|#x.(cmpset__5222 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5224|#x.(cmpset__5224 = {cmpset__5223|#y.(cmpset__5223 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5225|#x.(cmpset__5225 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5226|#x.(cmpset__5226 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
    END;
  
  result! <-- Vol_getNumvol_EXT(this?) = 
    ANY Vol',result!6036,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6036 = numvol
    THEN
      Vol,result! := Vol',result!6036
    END;
  
  result! <-- Vol_getNumvol(this?) = 
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6037,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6037 = numvol
      & Ligne : FIN({rec__1616|rec__1616'dist : 0 .. 2000 & rec__1616'vdep /= rec__1616'var})
      & volsDeLigne : {rec__1617|rec__1617'dist : 0 .. 2000 & rec__1617'vdep /= rec__1617'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1620|rec__1620'dist : 0 .. 2000 & rec__1620'vdep /= rec__1620'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5227|#x.(cmpset__5227 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5229|#x.(cmpset__5229 = {cmpset__5228|#y.(cmpset__5228 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1621|rec__1621'dist : 0 .. 2000 & rec__1621'vdep /= rec__1621'var})
      & volsDeLigne' : {rec__1622|rec__1622'dist : 0 .. 2000 & rec__1622'vdep /= rec__1622'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1625|rec__1625'dist : 0 .. 2000 & rec__1625'vdep /= rec__1625'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5230|#x.(cmpset__5230 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5232|#x.(cmpset__5232 = {cmpset__5231|#y.(cmpset__5231 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5233|#x.(cmpset__5233 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5235|#x.(cmpset__5235 = {cmpset__5234|#y.(cmpset__5234 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5236|#x.(cmpset__5236 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5238|#x.(cmpset__5238 = {cmpset__5237|#y.(cmpset__5237 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5239|#x.(cmpset__5239 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5240|#x.(cmpset__5240 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne,result! := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6037
    END;
  
  Vol_setHdep_EXT(hdep?,this?) = 
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
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
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & hdep? : 0 .. 1439
      & hdep' = hdep?
      & numvol' = numvol
      & har' = har
      & Ligne : FIN({rec__1676|rec__1676'dist : 0 .. 2000 & rec__1676'vdep /= rec__1676'var})
      & volsDeLigne : {rec__1677|rec__1677'dist : 0 .. 2000 & rec__1677'vdep /= rec__1677'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1680|rec__1680'dist : 0 .. 2000 & rec__1680'vdep /= rec__1680'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5241|#x.(cmpset__5241 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5243|#x.(cmpset__5243 = {cmpset__5242|#y.(cmpset__5242 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1681|rec__1681'dist : 0 .. 2000 & rec__1681'vdep /= rec__1681'var})
      & volsDeLigne' : {rec__1682|rec__1682'dist : 0 .. 2000 & rec__1682'vdep /= rec__1682'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1685|rec__1685'dist : 0 .. 2000 & rec__1685'vdep /= rec__1685'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5244|#x.(cmpset__5244 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5246|#x.(cmpset__5246 = {cmpset__5245|#y.(cmpset__5245 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5247|#x.(cmpset__5247 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5249|#x.(cmpset__5249 = {cmpset__5248|#y.(cmpset__5248 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5250|#x.(cmpset__5250 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5252|#x.(cmpset__5252 = {cmpset__5251|#y.(cmpset__5251 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5253|#x.(cmpset__5253 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5254|#x.(cmpset__5254 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
    END;
  
  result! <-- Vol_getHdep_EXT(this?) = 
    ANY Vol',result!6038,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6038 : 0 .. 1439
      & result!6038 = hdep
    THEN
      Vol,result! := Vol',result!6038
    END;
  
  result! <-- Vol_getHdep(this?) = 
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6039,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6039 : 0 .. 1439
      & result!6039 = hdep
      & Ligne : FIN({rec__1736|rec__1736'dist : 0 .. 2000 & rec__1736'vdep /= rec__1736'var})
      & volsDeLigne : {rec__1737|rec__1737'dist : 0 .. 2000 & rec__1737'vdep /= rec__1737'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1740|rec__1740'dist : 0 .. 2000 & rec__1740'vdep /= rec__1740'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5255|#x.(cmpset__5255 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5257|#x.(cmpset__5257 = {cmpset__5256|#y.(cmpset__5256 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1741|rec__1741'dist : 0 .. 2000 & rec__1741'vdep /= rec__1741'var})
      & volsDeLigne' : {rec__1742|rec__1742'dist : 0 .. 2000 & rec__1742'vdep /= rec__1742'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1745|rec__1745'dist : 0 .. 2000 & rec__1745'vdep /= rec__1745'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5258|#x.(cmpset__5258 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5260|#x.(cmpset__5260 = {cmpset__5259|#y.(cmpset__5259 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5261|#x.(cmpset__5261 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5263|#x.(cmpset__5263 = {cmpset__5262|#y.(cmpset__5262 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5264|#x.(cmpset__5264 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5266|#x.(cmpset__5266 = {cmpset__5265|#y.(cmpset__5265 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5267|#x.(cmpset__5267 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5268|#x.(cmpset__5268 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne,result! := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6039
    END;
  
  Vol_setHar_EXT(har?,this?) = 
    ANY Vol',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
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
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & har? : 0 .. 1439
      & har' = har?
      & numvol' = numvol
      & hdep' = hdep
      & Ligne : FIN({rec__1796|rec__1796'dist : 0 .. 2000 & rec__1796'vdep /= rec__1796'var})
      & volsDeLigne : {rec__1797|rec__1797'dist : 0 .. 2000 & rec__1797'vdep /= rec__1797'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1800|rec__1800'dist : 0 .. 2000 & rec__1800'vdep /= rec__1800'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5269|#x.(cmpset__5269 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5271|#x.(cmpset__5271 = {cmpset__5270|#y.(cmpset__5270 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1801|rec__1801'dist : 0 .. 2000 & rec__1801'vdep /= rec__1801'var})
      & volsDeLigne' : {rec__1802|rec__1802'dist : 0 .. 2000 & rec__1802'vdep /= rec__1802'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1805|rec__1805'dist : 0 .. 2000 & rec__1805'vdep /= rec__1805'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5272|#x.(cmpset__5272 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5274|#x.(cmpset__5274 = {cmpset__5273|#y.(cmpset__5273 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5275|#x.(cmpset__5275 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5277|#x.(cmpset__5277 = {cmpset__5276|#y.(cmpset__5276 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5278|#x.(cmpset__5278 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5280|#x.(cmpset__5280 = {cmpset__5279|#y.(cmpset__5279 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5281|#x.(cmpset__5281 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5282|#x.(cmpset__5282 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
    END;
  
  result! <-- Vol_getHar_EXT(this?) = 
    ANY Vol',result!6040,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6040 : 0 .. 1439
      & result!6040 = har
    THEN
      Vol,result! := Vol',result!6040
    END;
  
  result! <-- Vol_getHar(this?) = 
    ANY Instance',Ligne',Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6041,har,har',hdep,hdep',numvol,numvol'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & hdep : 0 .. 1439
      & har : 0 .. 1439
      & hdep' : 0 .. 1439
      & har' : 0 .. 1439
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & this? : Vol
      & rec(numvol:numvol,hdep:hdep,har:har) = this?
      & Vol' = Vol - {this?} \/ {rec(numvol:numvol',hdep:hdep',har:har')}
      & numvol = numvol'
      & hdep = hdep'
      & har = har'
      & result!6041 : 0 .. 1439
      & result!6041 = har
      & Ligne : FIN({rec__1856|rec__1856'dist : 0 .. 2000 & rec__1856'vdep /= rec__1856'var})
      & volsDeLigne : {rec__1857|rec__1857'dist : 0 .. 2000 & rec__1857'vdep /= rec__1857'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1860|rec__1860'dist : 0 .. 2000 & rec__1860'vdep /= rec__1860'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5283|#x.(cmpset__5283 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5285|#x.(cmpset__5285 = {cmpset__5284|#y.(cmpset__5284 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Ligne' : FIN({rec__1861|rec__1861'dist : 0 .. 2000 & rec__1861'vdep /= rec__1861'var})
      & volsDeLigne' : {rec__1862|rec__1862'dist : 0 .. 2000 & rec__1862'vdep /= rec__1862'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1865|rec__1865'dist : 0 .. 2000 & rec__1865'vdep /= rec__1865'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5286|#x.(cmpset__5286 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5288|#x.(cmpset__5288 = {cmpset__5287|#y.(cmpset__5287 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Ligne = Ligne'
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5289|#x.(cmpset__5289 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5291|#x.(cmpset__5291 = {cmpset__5290|#y.(cmpset__5290 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5292|#x.(cmpset__5292 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5294|#x.(cmpset__5294 = {cmpset__5293|#y.(cmpset__5293 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5295|#x.(cmpset__5295 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & ligneDeVol' = (newId~ ; ligneDeVol)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5296|#x.(cmpset__5296 = x |-> x & x : Vol - {rec(numvol:numvol,hdep:hdep,har:har)})} \/ {rec(numvol:numvol,hdep:hdep,har:har) |-> rec(numvol:numvol',hdep:hdep',har:har')}) & newId : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) & instancesDeVol' = (newId~ ; instancesDeVol)))
    THEN
      Vol,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne,result! := Vol',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne',result!6041
    END;
  
  Vol_linkLigneDeVol(l?,this?) = 
    ANY ligneDeVol',volsDeLigne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1903|rec__1903'dist : 0 .. 2000 & rec__1903'vdep /= rec__1903'var})
      & volsDeLigne : {rec__1904|rec__1904'dist : 0 .. 2000 & rec__1904'vdep /= rec__1904'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1907|rec__1907'dist : 0 .. 2000 & rec__1907'vdep /= rec__1907'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5297|#x.(cmpset__5297 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5299|#x.(cmpset__5299 = {cmpset__5298|#y.(cmpset__5298 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1909|rec__1909'dist : 0 .. 2000 & rec__1909'vdep /= rec__1909'var})
      & volsDeLigne' : {rec__1910|rec__1910'dist : 0 .. 2000 & rec__1910'vdep /= rec__1910'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1913|rec__1913'dist : 0 .. 2000 & rec__1913'vdep /= rec__1913'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__5300|#x.(cmpset__5300 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5302|#x.(cmpset__5302 = {cmpset__5301|#y.(cmpset__5301 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
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
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1931|rec__1931'dist : 0 .. 2000 & rec__1931'vdep /= rec__1931'var})
      & volsDeLigne : {rec__1932|rec__1932'dist : 0 .. 2000 & rec__1932'vdep /= rec__1932'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1935|rec__1935'dist : 0 .. 2000 & rec__1935'vdep /= rec__1935'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5303|#x.(cmpset__5303 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5305|#x.(cmpset__5305 = {cmpset__5304|#y.(cmpset__5304 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__1937|rec__1937'dist : 0 .. 2000 & rec__1937'vdep /= rec__1937'var})
      & volsDeLigne' : {rec__1938|rec__1938'dist : 0 .. 2000 & rec__1938'vdep /= rec__1938'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__1941|rec__1941'dist : 0 .. 2000 & rec__1941'vdep /= rec__1941'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__5306|#x.(cmpset__5306 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5308|#x.(cmpset__5308 = {cmpset__5307|#y.(cmpset__5307 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & l?'dist : 0 .. 2000
      & l?'vdep /= l?'var
      & this? : dom(ligneDeVol)
      & ligneDeVol' = ligneDeVol - {this? |-> l?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;
  
  result! <-- Vol_getLigneDeVol(this?) = 
    ANY result!6042
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2043|rec__2043'dist : 0 .. 2000 & rec__2043'vdep /= rec__2043'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2046|rec__2046'dist : 0 .. 2000 & rec__2046'vdep /= rec__2046'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2049|rec__2049'dist : 0 .. 2000 & rec__2049'vdep /= rec__2049'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5327|#x.(cmpset__5327 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5329|#x.(cmpset__5329 = {cmpset__5328|#y.(cmpset__5328 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5330|#x.(cmpset__5330 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5332|#x.(cmpset__5332 = {cmpset__5331|#y.(cmpset__5331 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5333|#x.(cmpset__5333 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5335|#x.(cmpset__5335 = {cmpset__5334|#y.(cmpset__5334 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2059|rec__2059'dist : 0 .. 2000 & rec__2059'vdep /= rec__2059'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2062|rec__2062'dist : 0 .. 2000 & rec__2062'vdep /= rec__2062'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2065|rec__2065'dist : 0 .. 2000 & rec__2065'vdep /= rec__2065'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5336|#x.(cmpset__5336 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5338|#x.(cmpset__5338 = {cmpset__5337|#y.(cmpset__5337 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5339|#x.(cmpset__5339 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5341|#x.(cmpset__5341 = {cmpset__5340|#y.(cmpset__5340 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5342|#x.(cmpset__5342 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5344|#x.(cmpset__5344 = {cmpset__5343|#y.(cmpset__5343 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & result!6042'dist : 0 .. 2000
      & result!6042'vdep /= result!6042'var
      & this? : dom(ligneDeVol)
      & result!6042 = ligneDeVol(this?)
    THEN
      result! := result!6042
    END;
  
  Vol_linkInstancesDeVol(i?,this?) = 
    ANY instancesDeVol',volDInstance'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5345|#x.(cmpset__5345 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5347|#x.(cmpset__5347 = {cmpset__5346|#y.(cmpset__5346 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5348|#x.(cmpset__5348 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5350|#x.(cmpset__5350 = {cmpset__5349|#y.(cmpset__5349 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & i?'sem : 1 .. 53
      & i?'jr : 1 .. 7
      & i?'duree : NATURAL
      & i?'res1 : 0 .. 150
      & i?'res2 : 0 .. 150
      & i?'tonnage : 0 .. 15000
      & i? : Instance
      & this? : Vol
      & volDInstance' = volDInstance <+ {i? |-> this?}
    THEN
      instancesDeVol,volDInstance := instancesDeVol',volDInstance'
    END;
  
  Vol_unlinkInstancesDeVol(i?,this?) = 
    ANY instancesDeVol',volDInstance'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5351|#x.(cmpset__5351 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5353|#x.(cmpset__5353 = {cmpset__5352|#y.(cmpset__5352 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5354|#x.(cmpset__5354 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5356|#x.(cmpset__5356 = {cmpset__5355|#y.(cmpset__5355 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & i?'sem : 1 .. 53
      & i?'jr : 1 .. 7
      & i?'duree : NATURAL
      & i?'res1 : 0 .. 150
      & i?'res2 : 0 .. 150
      & i?'tonnage : 0 .. 15000
      & this? : dom(instancesDeVol)
      & volDInstance' = volDInstance - {i? |-> this?}
    THEN
      instancesDeVol,volDInstance := instancesDeVol',volDInstance'
    END;
  
  result! <-- Vol_getInstancesDeVol(this?) = 
    ANY result!6043
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2167|rec__2167'dist : 0 .. 2000 & rec__2167'vdep /= rec__2167'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2170|rec__2170'dist : 0 .. 2000 & rec__2170'vdep /= rec__2170'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2173|rec__2173'dist : 0 .. 2000 & rec__2173'vdep /= rec__2173'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5357|#x.(cmpset__5357 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5359|#x.(cmpset__5359 = {cmpset__5358|#y.(cmpset__5358 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5360|#x.(cmpset__5360 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5362|#x.(cmpset__5362 = {cmpset__5361|#y.(cmpset__5361 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5363|#x.(cmpset__5363 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5365|#x.(cmpset__5365 = {cmpset__5364|#y.(cmpset__5364 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2183|rec__2183'dist : 0 .. 2000 & rec__2183'vdep /= rec__2183'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2186|rec__2186'dist : 0 .. 2000 & rec__2186'vdep /= rec__2186'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2189|rec__2189'dist : 0 .. 2000 & rec__2189'vdep /= rec__2189'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5366|#x.(cmpset__5366 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5368|#x.(cmpset__5368 = {cmpset__5367|#y.(cmpset__5367 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5369|#x.(cmpset__5369 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5371|#x.(cmpset__5371 = {cmpset__5370|#y.(cmpset__5370 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5372|#x.(cmpset__5372 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5374|#x.(cmpset__5374 = {cmpset__5373|#y.(cmpset__5373 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'hdep : 0 .. 1439
      & this?'har : 0 .. 1439
      & result!6043 : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & this? : dom(instancesDeVol)
      & result!6043 = instancesDeVol(this?)
    THEN
      result! := result!6043
    END;
  
  Ligne_new(ligne?) = 
    ANY Ligne'
    WHERE 
        Ligne : FIN({rec__2241|rec__2241'dist : 0 .. 2000 & rec__2241'vdep /= rec__2241'var})
      & Ligne' : FIN({rec__2242|rec__2242'dist : 0 .. 2000 & rec__2242'vdep /= rec__2242'var})
      & ligne?'dist : 0 .. 2000
      & ligne?'vdep /= ligne?'var
      & Ligne' = Ligne \/ {ligne?}
    THEN
      Ligne := Ligne'
    END;
  
  Ligne_new2(ligne?) = 
    ANY Ligne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2342|rec__2342'dist : 0 .. 2000 & rec__2342'vdep /= rec__2342'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2345|rec__2345'dist : 0 .. 2000 & rec__2345'vdep /= rec__2345'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2348|rec__2348'dist : 0 .. 2000 & rec__2348'vdep /= rec__2348'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5400|#x.(cmpset__5400 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5402|#x.(cmpset__5402 = {cmpset__5401|#y.(cmpset__5401 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5403|#x.(cmpset__5403 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5405|#x.(cmpset__5405 = {cmpset__5404|#y.(cmpset__5404 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5406|#x.(cmpset__5406 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5408|#x.(cmpset__5408 = {cmpset__5407|#y.(cmpset__5407 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne' : FIN({rec__2358|rec__2358'dist : 0 .. 2000 & rec__2358'vdep /= rec__2358'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2361|rec__2361'dist : 0 .. 2000 & rec__2361'vdep /= rec__2361'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2364|rec__2364'dist : 0 .. 2000 & rec__2364'vdep /= rec__2364'var}
      & dom(volsDeLigne) <: Ligne'
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5409|#x.(cmpset__5409 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5411|#x.(cmpset__5411 = {cmpset__5410|#y.(cmpset__5410 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5412|#x.(cmpset__5412 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5414|#x.(cmpset__5414 = {cmpset__5413|#y.(cmpset__5413 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5415|#x.(cmpset__5415 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5417|#x.(cmpset__5417 = {cmpset__5416|#y.(cmpset__5416 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & ligne?'dist : 0 .. 2000
      & ligne?'vdep /= ligne?'var
      & Ligne' = Ligne \/ {ligne?}
    THEN
      Ligne := Ligne'
    END;
  
  Ligne_newWithLinks(ligne?) = 
    ANY Ligne'
    WHERE 
        Ligne : FIN({rec__2377|rec__2377'dist : 0 .. 2000 & rec__2377'vdep /= rec__2377'var})
      & Ligne' : FIN({rec__2378|rec__2378'dist : 0 .. 2000 & rec__2378'vdep /= rec__2378'var})
      & ligne?'dist : 0 .. 2000
      & ligne?'vdep /= ligne?'var
      & Ligne' = Ligne \/ {ligne?}
    THEN
      Ligne := Ligne'
    END;
  
  Ligne_delete(this?) = 
    ANY Ligne'
    WHERE 
        Ligne : FIN({rec__2383|rec__2383'dist : 0 .. 2000 & rec__2383'vdep /= rec__2383'var})
      & Ligne' : FIN({rec__2384|rec__2384'dist : 0 .. 2000 & rec__2384'vdep /= rec__2384'var})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & Ligne' = Ligne - {this?}
    THEN
      Ligne := Ligne'
    END;
  
  Ligne_delWithLinks(this?) = 
    ANY Ligne',ligneDeVol',volsDeLigne'
    WHERE 
        Ligne : FIN({rec__2399|rec__2399'dist : 0 .. 2000 & rec__2399'vdep /= rec__2399'var})
      & Ligne' : FIN({rec__2400|rec__2400'dist : 0 .. 2000 & rec__2400'vdep /= rec__2400'var})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2402|rec__2402'dist : 0 .. 2000 & rec__2402'vdep /= rec__2402'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2405|rec__2405'dist : 0 .. 2000 & rec__2405'vdep /= rec__2405'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5418|#x.(cmpset__5418 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5420|#x.(cmpset__5420 = {cmpset__5419|#y.(cmpset__5419 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2407|rec__2407'dist : 0 .. 2000 & rec__2407'vdep /= rec__2407'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2410|rec__2410'dist : 0 .. 2000 & rec__2410'vdep /= rec__2410'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__5421|#x.(cmpset__5421 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5423|#x.(cmpset__5423 = {cmpset__5422|#y.(cmpset__5422 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
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
        Ligne : FIN({rec__2415|rec__2415'dist : 0 .. 2000 & rec__2415'vdep /= rec__2415'var})
      & Ligne' : FIN({rec__2416|rec__2416'dist : 0 .. 2000 & rec__2416'vdep /= rec__2416'var})
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
        Ligne : FIN({rec__2431|rec__2431'dist : 0 .. 2000 & rec__2431'vdep /= rec__2431'var})
      & Ligne' : FIN({rec__2432|rec__2432'dist : 0 .. 2000 & rec__2432'vdep /= rec__2432'var})
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
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2435|rec__2435'dist : 0 .. 2000 & rec__2435'vdep /= rec__2435'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2438|rec__2438'dist : 0 .. 2000 & rec__2438'vdep /= rec__2438'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5424|#x.(cmpset__5424 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5426|#x.(cmpset__5426 = {cmpset__5425|#y.(cmpset__5425 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2440|rec__2440'dist : 0 .. 2000 & rec__2440'vdep /= rec__2440'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2443|rec__2443'dist : 0 .. 2000 & rec__2443'vdep /= rec__2443'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5427|#x.(cmpset__5427 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5429|#x.(cmpset__5429 = {cmpset__5428|#y.(cmpset__5428 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5430|#x.(cmpset__5430 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2446|rec__2446'dist : 0 .. 2000 & rec__2446'vdep /= rec__2446'var} +-> {rec__2447|rec__2447'dist : 0 .. 2000 & rec__2447'vdep /= rec__2447'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;
  
  result! <-- Ligne_getVdep_EXT(this?) = 
    ANY Ligne',result!6044,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2451|rec__2451'dist : 0 .. 2000 & rec__2451'vdep /= rec__2451'var})
      & Ligne' : FIN({rec__2452|rec__2452'dist : 0 .. 2000 & rec__2452'vdep /= rec__2452'var})
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
      & result!6044 = vdep
    THEN
      Ligne,result! := Ligne',result!6044
    END;
  
  result! <-- Ligne_getVdep(this?) = 
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!6045,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2467|rec__2467'dist : 0 .. 2000 & rec__2467'vdep /= rec__2467'var})
      & Ligne' : FIN({rec__2468|rec__2468'dist : 0 .. 2000 & rec__2468'vdep /= rec__2468'var})
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
      & result!6045 = vdep
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2471|rec__2471'dist : 0 .. 2000 & rec__2471'vdep /= rec__2471'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2474|rec__2474'dist : 0 .. 2000 & rec__2474'vdep /= rec__2474'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5431|#x.(cmpset__5431 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5433|#x.(cmpset__5433 = {cmpset__5432|#y.(cmpset__5432 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2476|rec__2476'dist : 0 .. 2000 & rec__2476'vdep /= rec__2476'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2479|rec__2479'dist : 0 .. 2000 & rec__2479'vdep /= rec__2479'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5434|#x.(cmpset__5434 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5436|#x.(cmpset__5436 = {cmpset__5435|#y.(cmpset__5435 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5437|#x.(cmpset__5437 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2482|rec__2482'dist : 0 .. 2000 & rec__2482'vdep /= rec__2482'var} +-> {rec__2483|rec__2483'dist : 0 .. 2000 & rec__2483'vdep /= rec__2483'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!6045
    END;
  
  Ligne_setVar_EXT(this?,var?) = 
    ANY Ligne',dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2487|rec__2487'dist : 0 .. 2000 & rec__2487'vdep /= rec__2487'var})
      & Ligne' : FIN({rec__2488|rec__2488'dist : 0 .. 2000 & rec__2488'vdep /= rec__2488'var})
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
        Ligne : FIN({rec__2503|rec__2503'dist : 0 .. 2000 & rec__2503'vdep /= rec__2503'var})
      & Ligne' : FIN({rec__2504|rec__2504'dist : 0 .. 2000 & rec__2504'vdep /= rec__2504'var})
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
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2507|rec__2507'dist : 0 .. 2000 & rec__2507'vdep /= rec__2507'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2510|rec__2510'dist : 0 .. 2000 & rec__2510'vdep /= rec__2510'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5438|#x.(cmpset__5438 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5440|#x.(cmpset__5440 = {cmpset__5439|#y.(cmpset__5439 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2512|rec__2512'dist : 0 .. 2000 & rec__2512'vdep /= rec__2512'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2515|rec__2515'dist : 0 .. 2000 & rec__2515'vdep /= rec__2515'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5441|#x.(cmpset__5441 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5443|#x.(cmpset__5443 = {cmpset__5442|#y.(cmpset__5442 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5444|#x.(cmpset__5444 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2518|rec__2518'dist : 0 .. 2000 & rec__2518'vdep /= rec__2518'var} +-> {rec__2519|rec__2519'dist : 0 .. 2000 & rec__2519'vdep /= rec__2519'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;
  
  result! <-- Ligne_getVar_EXT(this?) = 
    ANY Ligne',result!6046,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2523|rec__2523'dist : 0 .. 2000 & rec__2523'vdep /= rec__2523'var})
      & Ligne' : FIN({rec__2524|rec__2524'dist : 0 .. 2000 & rec__2524'vdep /= rec__2524'var})
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
      & result!6046 = var
    THEN
      Ligne,result! := Ligne',result!6046
    END;
  
  result! <-- Ligne_getVar(this?) = 
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!6047,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2539|rec__2539'dist : 0 .. 2000 & rec__2539'vdep /= rec__2539'var})
      & Ligne' : FIN({rec__2540|rec__2540'dist : 0 .. 2000 & rec__2540'vdep /= rec__2540'var})
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
      & result!6047 = var
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2543|rec__2543'dist : 0 .. 2000 & rec__2543'vdep /= rec__2543'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2546|rec__2546'dist : 0 .. 2000 & rec__2546'vdep /= rec__2546'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5445|#x.(cmpset__5445 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5447|#x.(cmpset__5447 = {cmpset__5446|#y.(cmpset__5446 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2548|rec__2548'dist : 0 .. 2000 & rec__2548'vdep /= rec__2548'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2551|rec__2551'dist : 0 .. 2000 & rec__2551'vdep /= rec__2551'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5448|#x.(cmpset__5448 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5450|#x.(cmpset__5450 = {cmpset__5449|#y.(cmpset__5449 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5451|#x.(cmpset__5451 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2554|rec__2554'dist : 0 .. 2000 & rec__2554'vdep /= rec__2554'var} +-> {rec__2555|rec__2555'dist : 0 .. 2000 & rec__2555'vdep /= rec__2555'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!6047
    END;
  
  Ligne_setDist_EXT(dist?,this?) = 
    ANY Ligne',dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2559|rec__2559'dist : 0 .. 2000 & rec__2559'vdep /= rec__2559'var})
      & Ligne' : FIN({rec__2560|rec__2560'dist : 0 .. 2000 & rec__2560'vdep /= rec__2560'var})
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
        Ligne : FIN({rec__2575|rec__2575'dist : 0 .. 2000 & rec__2575'vdep /= rec__2575'var})
      & Ligne' : FIN({rec__2576|rec__2576'dist : 0 .. 2000 & rec__2576'vdep /= rec__2576'var})
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
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2579|rec__2579'dist : 0 .. 2000 & rec__2579'vdep /= rec__2579'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2582|rec__2582'dist : 0 .. 2000 & rec__2582'vdep /= rec__2582'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5452|#x.(cmpset__5452 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5454|#x.(cmpset__5454 = {cmpset__5453|#y.(cmpset__5453 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2584|rec__2584'dist : 0 .. 2000 & rec__2584'vdep /= rec__2584'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2587|rec__2587'dist : 0 .. 2000 & rec__2587'vdep /= rec__2587'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5455|#x.(cmpset__5455 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5457|#x.(cmpset__5457 = {cmpset__5456|#y.(cmpset__5456 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5458|#x.(cmpset__5458 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2590|rec__2590'dist : 0 .. 2000 & rec__2590'vdep /= rec__2590'var} +-> {rec__2591|rec__2591'dist : 0 .. 2000 & rec__2591'vdep /= rec__2591'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne := Ligne',ligneDeVol',volsDeLigne'
    END;
  
  result! <-- Ligne_getDist_EXT(this?) = 
    ANY Ligne',result!6048,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2595|rec__2595'dist : 0 .. 2000 & rec__2595'vdep /= rec__2595'var})
      & Ligne' : FIN({rec__2596|rec__2596'dist : 0 .. 2000 & rec__2596'vdep /= rec__2596'var})
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
      & result!6048 : 0 .. 2000
      & result!6048 = dist
    THEN
      Ligne,result! := Ligne',result!6048
    END;
  
  result! <-- Ligne_getDist(this?) = 
    ANY Ligne',Vol',ligneDeVol',volsDeLigne',result!6049,dist,dist',var,var',vdep,vdep'
    WHERE 
        Ligne : FIN({rec__2611|rec__2611'dist : 0 .. 2000 & rec__2611'vdep /= rec__2611'var})
      & Ligne' : FIN({rec__2612|rec__2612'dist : 0 .. 2000 & rec__2612'vdep /= rec__2612'var})
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
      & result!6049 : 0 .. 2000
      & result!6049 = dist
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne : {rec__2615|rec__2615'dist : 0 .. 2000 & rec__2615'vdep /= rec__2615'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2618|rec__2618'dist : 0 .. 2000 & rec__2618'vdep /= rec__2618'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5459|#x.(cmpset__5459 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5461|#x.(cmpset__5461 = {cmpset__5460|#y.(cmpset__5460 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volsDeLigne' : {rec__2620|rec__2620'dist : 0 .. 2000 & rec__2620'vdep /= rec__2620'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2623|rec__2623'dist : 0 .. 2000 & rec__2623'vdep /= rec__2623'var}
      & dom(volsDeLigne') <: Ligne'
      & union(ran(volsDeLigne')) = Vol'
      & volsDeLigne' = {cmpset__5462|#x.(cmpset__5462 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5464|#x.(cmpset__5464 = {cmpset__5463|#y.(cmpset__5463 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5465|#x.(cmpset__5465 = x |-> x & x : Ligne - {rec(vdep:vdep,var:var,dist:dist)})} \/ {rec(vdep:vdep,var:var,dist:dist) |-> rec(vdep:vdep',var:var',dist:dist')}) & newId : {rec__2626|rec__2626'dist : 0 .. 2000 & rec__2626'vdep /= rec__2626'var} +-> {rec__2627|rec__2627'dist : 0 .. 2000 & rec__2627'vdep /= rec__2627'var} & volsDeLigne' = (newId~ ; volsDeLigne)))
    THEN
      Ligne,ligneDeVol,volsDeLigne,result! := Ligne',ligneDeVol',volsDeLigne',result!6049
    END;
  
  Ligne_linkVolsDeLigne(this?,v?) = 
    ANY ligneDeVol',volsDeLigne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2643|rec__2643'dist : 0 .. 2000 & rec__2643'vdep /= rec__2643'var})
      & volsDeLigne : {rec__2644|rec__2644'dist : 0 .. 2000 & rec__2644'vdep /= rec__2644'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2647|rec__2647'dist : 0 .. 2000 & rec__2647'vdep /= rec__2647'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5466|#x.(cmpset__5466 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5468|#x.(cmpset__5468 = {cmpset__5467|#y.(cmpset__5467 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2649|rec__2649'dist : 0 .. 2000 & rec__2649'vdep /= rec__2649'var})
      & volsDeLigne' : {rec__2650|rec__2650'dist : 0 .. 2000 & rec__2650'vdep /= rec__2650'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2653|rec__2653'dist : 0 .. 2000 & rec__2653'vdep /= rec__2653'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__5469|#x.(cmpset__5469 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5471|#x.(cmpset__5471 = {cmpset__5470|#y.(cmpset__5470 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & v? : Vol
      & this? : Ligne
      & ligneDeVol' = ligneDeVol <+ {v? |-> this?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;
  
  Ligne_unlinkVolsDeLigne(this?,v?) = 
    ANY ligneDeVol',volsDeLigne'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2671|rec__2671'dist : 0 .. 2000 & rec__2671'vdep /= rec__2671'var})
      & volsDeLigne : {rec__2672|rec__2672'dist : 0 .. 2000 & rec__2672'vdep /= rec__2672'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2675|rec__2675'dist : 0 .. 2000 & rec__2675'vdep /= rec__2675'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5472|#x.(cmpset__5472 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5474|#x.(cmpset__5474 = {cmpset__5473|#y.(cmpset__5473 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2677|rec__2677'dist : 0 .. 2000 & rec__2677'vdep /= rec__2677'var})
      & volsDeLigne' : {rec__2678|rec__2678'dist : 0 .. 2000 & rec__2678'vdep /= rec__2678'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2681|rec__2681'dist : 0 .. 2000 & rec__2681'vdep /= rec__2681'var}
      & dom(volsDeLigne') <: Ligne
      & union(ran(volsDeLigne')) = Vol
      & volsDeLigne' = {cmpset__5475|#x.(cmpset__5475 = x |-> {y|y : dom(ligneDeVol') & x = ligneDeVol'(y)} & x : ran(ligneDeVol'))}
      & ligneDeVol' = union({cmpset__5477|#x.(cmpset__5477 = {cmpset__5476|#y.(cmpset__5476 = y |-> x & y : volsDeLigne'(x))} & x : dom(volsDeLigne'))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & this? : dom(volsDeLigne)
      & ligneDeVol' = ligneDeVol - {v? |-> this?}
    THEN
      ligneDeVol,volsDeLigne := ligneDeVol',volsDeLigne'
    END;
  
  result! <-- Ligne_getVolsDeLigne(this?) = 
    ANY result!6050
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2719|rec__2719'dist : 0 .. 2000 & rec__2719'vdep /= rec__2719'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2722|rec__2722'dist : 0 .. 2000 & rec__2722'vdep /= rec__2722'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2725|rec__2725'dist : 0 .. 2000 & rec__2725'vdep /= rec__2725'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5478|#x.(cmpset__5478 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5480|#x.(cmpset__5480 = {cmpset__5479|#y.(cmpset__5479 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5481|#x.(cmpset__5481 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5483|#x.(cmpset__5483 = {cmpset__5482|#y.(cmpset__5482 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5484|#x.(cmpset__5484 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5486|#x.(cmpset__5486 = {cmpset__5485|#y.(cmpset__5485 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__2735|rec__2735'dist : 0 .. 2000 & rec__2735'vdep /= rec__2735'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__2738|rec__2738'dist : 0 .. 2000 & rec__2738'vdep /= rec__2738'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__2741|rec__2741'dist : 0 .. 2000 & rec__2741'vdep /= rec__2741'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5487|#x.(cmpset__5487 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5489|#x.(cmpset__5489 = {cmpset__5488|#y.(cmpset__5488 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5490|#x.(cmpset__5490 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5492|#x.(cmpset__5492 = {cmpset__5491|#y.(cmpset__5491 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5493|#x.(cmpset__5493 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5495|#x.(cmpset__5495 = {cmpset__5494|#y.(cmpset__5494 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'dist : 0 .. 2000
      & this?'vdep /= this?'var
      & result!6050 : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & this? : dom(volsDeLigne)
      & result!6050 = volsDeLigne(this?)
    THEN
      result! := result!6050
    END;
  
  Instance_new(instance?) = 
    ANY Instance'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instance?'sem : 1 .. 53
      & instance?'jr : 1 .. 7
      & instance?'duree : NATURAL
      & instance?'res1 : 0 .. 150
      & instance?'res2 : 0 .. 150
      & instance?'tonnage : 0 .. 15000
      & Instance' = Instance \/ {instance?}
    THEN
      Instance := Instance'
    END;
  
  Instance_newWithLinks(instance?,volDInstance?) = 
    ANY Instance',instancesDeVol',volDInstance'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5516|#x.(cmpset__5516 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5518|#x.(cmpset__5518 = {cmpset__5517|#y.(cmpset__5517 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5519|#x.(cmpset__5519 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5521|#x.(cmpset__5521 = {cmpset__5520|#y.(cmpset__5520 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & instance?'sem : 1 .. 53
      & instance?'jr : 1 .. 7
      & instance?'duree : NATURAL
      & instance?'res1 : 0 .. 150
      & instance?'res2 : 0 .. 150
      & instance?'tonnage : 0 .. 15000
      & volDInstance?'hdep : 0 .. 1439
      & volDInstance?'har : 0 .. 1439
      & Instance' = Instance \/ {instance?}
      & volDInstance? : Vol
      & volDInstance' = volDInstance \/ {instance? |-> volDInstance?}
    THEN
      Instance,instancesDeVol,volDInstance := Instance',instancesDeVol',volDInstance'
    END;
  
  Instance_delete(this?) = 
    ANY Instance'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & Instance' = Instance - {this?}
    THEN
      Instance := Instance'
    END;
  
  Instance_delWithLinks(this?) = 
    ANY Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5522|#x.(cmpset__5522 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5524|#x.(cmpset__5524 = {cmpset__5523|#y.(cmpset__5523 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5525|#x.(cmpset__5525 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5527|#x.(cmpset__5527 = {cmpset__5526|#y.(cmpset__5526 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5528|#x.(cmpset__5528 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5530|#x.(cmpset__5530 = {cmpset__5529|#y.(cmpset__5529 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5531|#x.(cmpset__5531 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5533|#x.(cmpset__5533 = {cmpset__5532|#y.(cmpset__5532 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & Instance' = Instance - {this?}
      & avionDInstance' = {m|m : avionDInstance & prj1(struct(categ:CATEG, duree:INTEGER, jr:INTEGER, numvol:NUMVOL, res1:INTEGER, res2:INTEGER, sem:INTEGER, tonnage:INTEGER),struct(capa1:INTEGER, capa2:INTEGER, categ:CATEG, hrv:INTEGER, noimmat:NOIMMAT, rayon:INTEGER, tonnage:INTEGER, type:TYPE))(m) /= this?}
      & volDInstance' = {m|m : volDInstance & prj1(struct(categ:CATEG, duree:INTEGER, jr:INTEGER, numvol:NUMVOL, res1:INTEGER, res2:INTEGER, sem:INTEGER, tonnage:INTEGER),struct(har:INTEGER, hdep:INTEGER, numvol:NUMVOL))(m) /= this?}
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  Instance_setNumvol_EXT(numvol?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol' = numvol?
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setNumvol(numvol?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol' = numvol?
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5534|#x.(cmpset__5534 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5536|#x.(cmpset__5536 = {cmpset__5535|#y.(cmpset__5535 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5537|#x.(cmpset__5537 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5539|#x.(cmpset__5539 = {cmpset__5538|#y.(cmpset__5538 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5540|#x.(cmpset__5540 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5542|#x.(cmpset__5542 = {cmpset__5541|#y.(cmpset__5541 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5543|#x.(cmpset__5543 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5545|#x.(cmpset__5545 = {cmpset__5544|#y.(cmpset__5544 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5546|#x.(cmpset__5546 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5547|#x.(cmpset__5547 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getNumvol_EXT(this?) = 
    ANY Instance',result!6051,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6051 = numvol
    THEN
      Instance,result! := Instance',result!6051
    END;
  
  result! <-- Instance_getNumvol(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6052,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6052 = numvol
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5548|#x.(cmpset__5548 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5550|#x.(cmpset__5550 = {cmpset__5549|#y.(cmpset__5549 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5551|#x.(cmpset__5551 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5553|#x.(cmpset__5553 = {cmpset__5552|#y.(cmpset__5552 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5554|#x.(cmpset__5554 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5556|#x.(cmpset__5556 = {cmpset__5555|#y.(cmpset__5555 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5557|#x.(cmpset__5557 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5559|#x.(cmpset__5559 = {cmpset__5558|#y.(cmpset__5558 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5560|#x.(cmpset__5560 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5561|#x.(cmpset__5561 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6052
    END;
  
  Instance_setSem_EXT(sem?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & sem? : 1 .. 53
      & sem' = sem?
      & numvol' = numvol
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setSem(sem?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & sem? : 1 .. 53
      & sem' = sem?
      & numvol' = numvol
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5562|#x.(cmpset__5562 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5564|#x.(cmpset__5564 = {cmpset__5563|#y.(cmpset__5563 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5565|#x.(cmpset__5565 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5567|#x.(cmpset__5567 = {cmpset__5566|#y.(cmpset__5566 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5568|#x.(cmpset__5568 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5570|#x.(cmpset__5570 = {cmpset__5569|#y.(cmpset__5569 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5571|#x.(cmpset__5571 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5573|#x.(cmpset__5573 = {cmpset__5572|#y.(cmpset__5572 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5574|#x.(cmpset__5574 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5575|#x.(cmpset__5575 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getSem_EXT(this?) = 
    ANY Instance',result!6053,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6053 : 1 .. 53
      & result!6053 = sem
    THEN
      Instance,result! := Instance',result!6053
    END;
  
  result! <-- Instance_getSem(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6054,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6054 : 1 .. 53
      & result!6054 = sem
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5576|#x.(cmpset__5576 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5578|#x.(cmpset__5578 = {cmpset__5577|#y.(cmpset__5577 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5579|#x.(cmpset__5579 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5581|#x.(cmpset__5581 = {cmpset__5580|#y.(cmpset__5580 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5582|#x.(cmpset__5582 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5584|#x.(cmpset__5584 = {cmpset__5583|#y.(cmpset__5583 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5585|#x.(cmpset__5585 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5587|#x.(cmpset__5587 = {cmpset__5586|#y.(cmpset__5586 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5588|#x.(cmpset__5588 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5589|#x.(cmpset__5589 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6054
    END;
  
  Instance_setJr_EXT(jr?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & jr? : 1 .. 7
      & jr' = jr?
      & numvol' = numvol
      & sem' = sem
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setJr(jr?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & jr? : 1 .. 7
      & jr' = jr?
      & numvol' = numvol
      & sem' = sem
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5590|#x.(cmpset__5590 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5592|#x.(cmpset__5592 = {cmpset__5591|#y.(cmpset__5591 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5593|#x.(cmpset__5593 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5595|#x.(cmpset__5595 = {cmpset__5594|#y.(cmpset__5594 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5596|#x.(cmpset__5596 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5598|#x.(cmpset__5598 = {cmpset__5597|#y.(cmpset__5597 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5599|#x.(cmpset__5599 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5601|#x.(cmpset__5601 = {cmpset__5600|#y.(cmpset__5600 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5602|#x.(cmpset__5602 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5603|#x.(cmpset__5603 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getJr_EXT(this?) = 
    ANY Instance',result!6055,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6055 : 1 .. 7
      & result!6055 = jr
    THEN
      Instance,result! := Instance',result!6055
    END;
  
  result! <-- Instance_getJr(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6056,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6056 : 1 .. 7
      & result!6056 = jr
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5604|#x.(cmpset__5604 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5606|#x.(cmpset__5606 = {cmpset__5605|#y.(cmpset__5605 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5607|#x.(cmpset__5607 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5609|#x.(cmpset__5609 = {cmpset__5608|#y.(cmpset__5608 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5610|#x.(cmpset__5610 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5612|#x.(cmpset__5612 = {cmpset__5611|#y.(cmpset__5611 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5613|#x.(cmpset__5613 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5615|#x.(cmpset__5615 = {cmpset__5614|#y.(cmpset__5614 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5616|#x.(cmpset__5616 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5617|#x.(cmpset__5617 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6056
    END;
  
  Instance_setCateg_EXT(categ?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & categ' = categ?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setCateg(categ?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & categ' = categ?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5618|#x.(cmpset__5618 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5620|#x.(cmpset__5620 = {cmpset__5619|#y.(cmpset__5619 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5621|#x.(cmpset__5621 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5623|#x.(cmpset__5623 = {cmpset__5622|#y.(cmpset__5622 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5624|#x.(cmpset__5624 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5626|#x.(cmpset__5626 = {cmpset__5625|#y.(cmpset__5625 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5627|#x.(cmpset__5627 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5629|#x.(cmpset__5629 = {cmpset__5628|#y.(cmpset__5628 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5630|#x.(cmpset__5630 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5631|#x.(cmpset__5631 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getCateg_EXT(this?) = 
    ANY Instance',result!6057,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6057 = categ
    THEN
      Instance,result! := Instance',result!6057
    END;
  
  result! <-- Instance_getCateg(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6058,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6058 = categ
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5632|#x.(cmpset__5632 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5634|#x.(cmpset__5634 = {cmpset__5633|#y.(cmpset__5633 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5635|#x.(cmpset__5635 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5637|#x.(cmpset__5637 = {cmpset__5636|#y.(cmpset__5636 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5638|#x.(cmpset__5638 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5640|#x.(cmpset__5640 = {cmpset__5639|#y.(cmpset__5639 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5641|#x.(cmpset__5641 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5643|#x.(cmpset__5643 = {cmpset__5642|#y.(cmpset__5642 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5644|#x.(cmpset__5644 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5645|#x.(cmpset__5645 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6058
    END;
  
  Instance_setDuree_EXT(duree?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & duree? : NATURAL
      & duree' = duree?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setDuree(duree?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & duree? : NATURAL
      & duree' = duree?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & res1' = res1
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5646|#x.(cmpset__5646 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5648|#x.(cmpset__5648 = {cmpset__5647|#y.(cmpset__5647 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5649|#x.(cmpset__5649 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5651|#x.(cmpset__5651 = {cmpset__5650|#y.(cmpset__5650 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5652|#x.(cmpset__5652 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5654|#x.(cmpset__5654 = {cmpset__5653|#y.(cmpset__5653 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5655|#x.(cmpset__5655 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5657|#x.(cmpset__5657 = {cmpset__5656|#y.(cmpset__5656 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5658|#x.(cmpset__5658 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5659|#x.(cmpset__5659 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getDuree_EXT(this?) = 
    ANY Instance',result!6059,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6059 : NATURAL
      & result!6059 = duree
    THEN
      Instance,result! := Instance',result!6059
    END;
  
  result! <-- Instance_getDuree(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6060,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6060 : NATURAL
      & result!6060 = duree
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5660|#x.(cmpset__5660 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5662|#x.(cmpset__5662 = {cmpset__5661|#y.(cmpset__5661 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5663|#x.(cmpset__5663 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5665|#x.(cmpset__5665 = {cmpset__5664|#y.(cmpset__5664 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5666|#x.(cmpset__5666 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5668|#x.(cmpset__5668 = {cmpset__5667|#y.(cmpset__5667 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5669|#x.(cmpset__5669 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5671|#x.(cmpset__5671 = {cmpset__5670|#y.(cmpset__5670 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5672|#x.(cmpset__5672 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5673|#x.(cmpset__5673 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6060
    END;
  
  Instance_setRes1_EXT(res1?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & res1? : 0 .. 150
      & res1' = res1?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res2' = res2
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setRes1(res1?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & res1? : 0 .. 150
      & res1' = res1?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res2' = res2
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5674|#x.(cmpset__5674 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5676|#x.(cmpset__5676 = {cmpset__5675|#y.(cmpset__5675 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5677|#x.(cmpset__5677 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5679|#x.(cmpset__5679 = {cmpset__5678|#y.(cmpset__5678 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5680|#x.(cmpset__5680 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5682|#x.(cmpset__5682 = {cmpset__5681|#y.(cmpset__5681 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5683|#x.(cmpset__5683 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5685|#x.(cmpset__5685 = {cmpset__5684|#y.(cmpset__5684 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5686|#x.(cmpset__5686 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5687|#x.(cmpset__5687 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getRes1_EXT(this?) = 
    ANY Instance',result!6061,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6061 : 0 .. 150
      & result!6061 = res1
    THEN
      Instance,result! := Instance',result!6061
    END;
  
  result! <-- Instance_getRes1(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6062,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6062 : 0 .. 150
      & result!6062 = res1
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5688|#x.(cmpset__5688 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5690|#x.(cmpset__5690 = {cmpset__5689|#y.(cmpset__5689 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5691|#x.(cmpset__5691 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5693|#x.(cmpset__5693 = {cmpset__5692|#y.(cmpset__5692 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5694|#x.(cmpset__5694 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5696|#x.(cmpset__5696 = {cmpset__5695|#y.(cmpset__5695 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5697|#x.(cmpset__5697 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5699|#x.(cmpset__5699 = {cmpset__5698|#y.(cmpset__5698 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5700|#x.(cmpset__5700 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5701|#x.(cmpset__5701 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6062
    END;
  
  Instance_setRes2_EXT(res2?,this?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & res2? : 0 .. 150
      & res2' = res2?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & tonnage' = tonnage
    THEN
      Instance := Instance'
    END;
  
  Instance_setRes2(res2?,this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & res2? : 0 .. 150
      & res2' = res2?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & tonnage' = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5702|#x.(cmpset__5702 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5704|#x.(cmpset__5704 = {cmpset__5703|#y.(cmpset__5703 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5705|#x.(cmpset__5705 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5707|#x.(cmpset__5707 = {cmpset__5706|#y.(cmpset__5706 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5708|#x.(cmpset__5708 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5710|#x.(cmpset__5710 = {cmpset__5709|#y.(cmpset__5709 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5711|#x.(cmpset__5711 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5713|#x.(cmpset__5713 = {cmpset__5712|#y.(cmpset__5712 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5714|#x.(cmpset__5714 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5715|#x.(cmpset__5715 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getRes2_EXT(this?) = 
    ANY Instance',result!6063,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6063 : 0 .. 150
      & result!6063 = res2
    THEN
      Instance,result! := Instance',result!6063
    END;
  
  result! <-- Instance_getRes2(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6064,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6064 : 0 .. 150
      & result!6064 = res2
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5716|#x.(cmpset__5716 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5718|#x.(cmpset__5718 = {cmpset__5717|#y.(cmpset__5717 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5719|#x.(cmpset__5719 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5721|#x.(cmpset__5721 = {cmpset__5720|#y.(cmpset__5720 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5722|#x.(cmpset__5722 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5724|#x.(cmpset__5724 = {cmpset__5723|#y.(cmpset__5723 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5725|#x.(cmpset__5725 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5727|#x.(cmpset__5727 = {cmpset__5726|#y.(cmpset__5726 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5728|#x.(cmpset__5728 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5729|#x.(cmpset__5729 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6064
    END;
  
  Instance_setTonnage_EXT(this?,tonnage?) = 
    ANY Instance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & tonnage? : 0 .. 15000
      & tonnage' = tonnage?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
    THEN
      Instance := Instance'
    END;
  
  Instance_setTonnage(this?,tonnage?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & tonnage? : 0 .. 15000
      & tonnage' = tonnage?
      & numvol' = numvol
      & sem' = sem
      & jr' = jr
      & categ' = categ
      & duree' = duree
      & res1' = res1
      & res2' = res2
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5730|#x.(cmpset__5730 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5732|#x.(cmpset__5732 = {cmpset__5731|#y.(cmpset__5731 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5733|#x.(cmpset__5733 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5735|#x.(cmpset__5735 = {cmpset__5734|#y.(cmpset__5734 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5736|#x.(cmpset__5736 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5738|#x.(cmpset__5738 = {cmpset__5737|#y.(cmpset__5737 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5739|#x.(cmpset__5739 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5741|#x.(cmpset__5741 = {cmpset__5740|#y.(cmpset__5740 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5742|#x.(cmpset__5742 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5743|#x.(cmpset__5743 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getTonnage_EXT(this?) = 
    ANY Instance',result!6065,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6065 : 0 .. 15000
      & result!6065 = tonnage
    THEN
      Instance,result! := Instance',result!6065
    END;
  
  result! <-- Instance_getTonnage(this?) = 
    ANY Avion',Instance',Vol',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6066,tonnage,tonnage',res2,res2',res1,res1',duree,duree',categ,categ',jr,jr',sem,sem',numvol,numvol'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & sem : 1 .. 53
      & jr : 1 .. 7
      & duree : NATURAL
      & res1 : 0 .. 150
      & res2 : 0 .. 150
      & tonnage : 0 .. 15000
      & sem' : 1 .. 53
      & jr' : 1 .. 7
      & duree' : NATURAL
      & res1' : 0 .. 150
      & res2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Instance
      & rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) = this?
      & Instance' = Instance - {this?} \/ {rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}
      & numvol = numvol'
      & sem = sem'
      & jr = jr'
      & categ = categ'
      & duree = duree'
      & res1 = res1'
      & res2 = res2'
      & tonnage = tonnage'
      & result!6066 : 0 .. 15000
      & result!6066 = tonnage
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5744|#x.(cmpset__5744 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5746|#x.(cmpset__5746 = {cmpset__5745|#y.(cmpset__5745 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5747|#x.(cmpset__5747 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5749|#x.(cmpset__5749 = {cmpset__5748|#y.(cmpset__5748 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Avion = Avion'
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5750|#x.(cmpset__5750 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5752|#x.(cmpset__5752 = {cmpset__5751|#y.(cmpset__5751 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol' : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance'
      & ran(volDInstance') <: Vol'
      & instancesDeVol' = {cmpset__5753|#x.(cmpset__5753 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5755|#x.(cmpset__5755 = {cmpset__5754|#y.(cmpset__5754 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & Vol = Vol'
      & (# /* LET */ (newId).( (newId)=({cmpset__5756|#x.(cmpset__5756 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & avionDInstance' = (newId~ ; avionDInstance)))
      & (# /* LET */ (newId).( (newId)=({cmpset__5757|#x.(cmpset__5757 = x |-> x & x : Instance - {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage)})} \/ {rec(numvol:numvol,sem:sem,jr:jr,categ:categ,duree:duree,res1:res1,res2:res2,tonnage:tonnage) |-> rec(numvol:numvol',sem:sem',jr:jr',categ:categ',duree:duree',res1:res1',res2:res2',tonnage:tonnage')}) & newId : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) & volDInstance' = (newId~ ; volDInstance)))
    THEN
      Instance,avionDInstance,instancesDAvion,instancesDeVol,volDInstance,result! := Instance',avionDInstance',instancesDAvion',instancesDeVol',volDInstance',result!6066
    END;
  
  Instance_linkAvionDInstance(a?,this?) = 
    ANY avionDInstance',instancesDAvion'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5758|#x.(cmpset__5758 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5760|#x.(cmpset__5760 = {cmpset__5759|#y.(cmpset__5759 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion
      & union(ran(instancesDAvion')) <: Instance
      & instancesDAvion' = {cmpset__5761|#x.(cmpset__5761 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5763|#x.(cmpset__5763 = {cmpset__5762|#y.(cmpset__5762 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & a?'rayon : 0 .. 2000
      & a?'hrv : NATURAL
      & a?'capa1 : 0 .. 150
      & a?'capa2 : 0 .. 150
      & a?'tonnage : 0 .. 15000
      & a? : Avion
      & this? : Instance
      & avionDInstance' = avionDInstance <+ {this? |-> a?}
    THEN
      avionDInstance,instancesDAvion := avionDInstance',instancesDAvion'
    END;
  
  Instance_unlinkAvionDInstance(a?,this?) = 
    ANY avionDInstance',instancesDAvion'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5764|#x.(cmpset__5764 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5766|#x.(cmpset__5766 = {cmpset__5765|#y.(cmpset__5765 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion
      & union(ran(instancesDAvion')) <: Instance
      & instancesDAvion' = {cmpset__5767|#x.(cmpset__5767 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5769|#x.(cmpset__5769 = {cmpset__5768|#y.(cmpset__5768 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & a?'rayon : 0 .. 2000
      & a?'hrv : NATURAL
      & a?'capa1 : 0 .. 150
      & a?'capa2 : 0 .. 150
      & a?'tonnage : 0 .. 15000
      & this? : dom(avionDInstance)
      & avionDInstance' = avionDInstance - {this? |-> a?}
    THEN
      avionDInstance,instancesDAvion := avionDInstance',instancesDAvion'
    END;
  
  result! <-- Instance_getAvionDInstance(this?) = 
    ANY result!6067
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__3979|rec__3979'dist : 0 .. 2000 & rec__3979'vdep /= rec__3979'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__3982|rec__3982'dist : 0 .. 2000 & rec__3982'vdep /= rec__3982'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__3985|rec__3985'dist : 0 .. 2000 & rec__3985'vdep /= rec__3985'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5770|#x.(cmpset__5770 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5772|#x.(cmpset__5772 = {cmpset__5771|#y.(cmpset__5771 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5773|#x.(cmpset__5773 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5775|#x.(cmpset__5775 = {cmpset__5774|#y.(cmpset__5774 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5776|#x.(cmpset__5776 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5778|#x.(cmpset__5778 = {cmpset__5777|#y.(cmpset__5777 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__3995|rec__3995'dist : 0 .. 2000 & rec__3995'vdep /= rec__3995'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__3998|rec__3998'dist : 0 .. 2000 & rec__3998'vdep /= rec__3998'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4001|rec__4001'dist : 0 .. 2000 & rec__4001'vdep /= rec__4001'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5779|#x.(cmpset__5779 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5781|#x.(cmpset__5781 = {cmpset__5780|#y.(cmpset__5780 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5782|#x.(cmpset__5782 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5784|#x.(cmpset__5784 = {cmpset__5783|#y.(cmpset__5783 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5785|#x.(cmpset__5785 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5787|#x.(cmpset__5787 = {cmpset__5786|#y.(cmpset__5786 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & result!6067'rayon : 0 .. 2000
      & result!6067'hrv : NATURAL
      & result!6067'capa1 : 0 .. 150
      & result!6067'capa2 : 0 .. 150
      & result!6067'tonnage : 0 .. 15000
      & result!6067 = avionDInstance(this?)
    THEN
      result! := result!6067
    END;
  
  Instance_linkVolDInstance(this?,v?) = 
    ANY instancesDeVol',volDInstance'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5788|#x.(cmpset__5788 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5790|#x.(cmpset__5790 = {cmpset__5789|#y.(cmpset__5789 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5791|#x.(cmpset__5791 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5793|#x.(cmpset__5793 = {cmpset__5792|#y.(cmpset__5792 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & v? : Vol
      & this? : Instance
      & volDInstance' = volDInstance <+ {this? |-> v?}
    THEN
      instancesDeVol,volDInstance := instancesDeVol',volDInstance'
    END;
  
  Instance_unlinkVolDInstance(this?,v?) = 
    ANY instancesDeVol',volDInstance'
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5794|#x.(cmpset__5794 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5796|#x.(cmpset__5796 = {cmpset__5795|#y.(cmpset__5795 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & volDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol' : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance') = Instance
      & ran(volDInstance') <: Vol
      & instancesDeVol' = {cmpset__5797|#x.(cmpset__5797 = x |-> {y|y : dom(volDInstance') & x = volDInstance'(y)} & x : ran(volDInstance'))}
      & volDInstance' = union({cmpset__5799|#x.(cmpset__5799 = {cmpset__5798|#y.(cmpset__5798 = y |-> x & y : instancesDeVol'(x))} & x : dom(instancesDeVol'))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & v?'hdep : 0 .. 1439
      & v?'har : 0 .. 1439
      & this? : dom(volDInstance)
      & volDInstance' = volDInstance - {this? |-> v?}
    THEN
      instancesDeVol,volDInstance := instancesDeVol',volDInstance'
    END;
  
  result! <-- Instance_getVolDInstance(this?) = 
    ANY result!6068
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__4103|rec__4103'dist : 0 .. 2000 & rec__4103'vdep /= rec__4103'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__4106|rec__4106'dist : 0 .. 2000 & rec__4106'vdep /= rec__4106'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4109|rec__4109'dist : 0 .. 2000 & rec__4109'vdep /= rec__4109'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5800|#x.(cmpset__5800 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5802|#x.(cmpset__5802 = {cmpset__5801|#y.(cmpset__5801 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5803|#x.(cmpset__5803 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5805|#x.(cmpset__5805 = {cmpset__5804|#y.(cmpset__5804 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5806|#x.(cmpset__5806 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5808|#x.(cmpset__5808 = {cmpset__5807|#y.(cmpset__5807 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__4119|rec__4119'dist : 0 .. 2000 & rec__4119'vdep /= rec__4119'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__4122|rec__4122'dist : 0 .. 2000 & rec__4122'vdep /= rec__4122'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4125|rec__4125'dist : 0 .. 2000 & rec__4125'vdep /= rec__4125'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5809|#x.(cmpset__5809 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5811|#x.(cmpset__5811 = {cmpset__5810|#y.(cmpset__5810 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5812|#x.(cmpset__5812 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5814|#x.(cmpset__5814 = {cmpset__5813|#y.(cmpset__5813 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5815|#x.(cmpset__5815 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5817|#x.(cmpset__5817 = {cmpset__5816|#y.(cmpset__5816 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'sem : 1 .. 53
      & this?'jr : 1 .. 7
      & this?'duree : NATURAL
      & this?'res1 : 0 .. 150
      & this?'res2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & result!6068'hdep : 0 .. 1439
      & result!6068'har : 0 .. 1439
      & result!6068 = volDInstance(this?)
    THEN
      result! := result!6068
    END;
  
  Avion_new(avion?) = 
    ANY Avion'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & avion?'rayon : 0 .. 2000
      & avion?'hrv : NATURAL
      & avion?'capa1 : 0 .. 150
      & avion?'capa2 : 0 .. 150
      & avion?'tonnage : 0 .. 15000
      & Avion' = Avion \/ {avion?}
    THEN
      Avion := Avion'
    END;
  
  Avion_newWithLinks(avion?) = 
    ANY Avion'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & avion?'rayon : 0 .. 2000
      & avion?'hrv : NATURAL
      & avion?'capa1 : 0 .. 150
      & avion?'capa2 : 0 .. 150
      & avion?'tonnage : 0 .. 15000
      & Avion' = Avion \/ {avion?}
    THEN
      Avion := Avion'
    END;
  
  Avion_delete(this?) = 
    ANY Avion'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & Avion' = Avion - {this?}
    THEN
      Avion := Avion'
    END;
  
  Avion_delWithLinks(this?) = 
    ANY Avion',avionDInstance',instancesDAvion'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5825|#x.(cmpset__5825 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5827|#x.(cmpset__5827 = {cmpset__5826|#y.(cmpset__5826 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance
      & instancesDAvion' = {cmpset__5828|#x.(cmpset__5828 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5830|#x.(cmpset__5830 = {cmpset__5829|#y.(cmpset__5829 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & Avion' = Avion - {this?}
      & instancesDAvion' = {m|m : instancesDAvion & prj1(struct(capa1:INTEGER, capa2:INTEGER, categ:CATEG, hrv:INTEGER, noimmat:NOIMMAT, rayon:INTEGER, tonnage:INTEGER, type:TYPE),POW(struct(categ:CATEG, duree:INTEGER, jr:INTEGER, numvol:NUMVOL, res1:INTEGER, res2:INTEGER, sem:INTEGER, tonnage:INTEGER)))(m) /= this?}
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  Avion_setNoimmat_EXT(noimmat?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat' = noimmat?
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setNoimmat(noimmat?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat' = noimmat?
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5831|#x.(cmpset__5831 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5833|#x.(cmpset__5833 = {cmpset__5832|#y.(cmpset__5832 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5834|#x.(cmpset__5834 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5836|#x.(cmpset__5836 = {cmpset__5835|#y.(cmpset__5835 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5837|#x.(cmpset__5837 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getNoimmat_EXT(this?) = 
    ANY Avion',result!6069,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6069 = noimmat
    THEN
      Avion,result! := Avion',result!6069
    END;
  
  result! <-- Avion_getNoimmat(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6070,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6070 = noimmat
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5838|#x.(cmpset__5838 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5840|#x.(cmpset__5840 = {cmpset__5839|#y.(cmpset__5839 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5841|#x.(cmpset__5841 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5843|#x.(cmpset__5843 = {cmpset__5842|#y.(cmpset__5842 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5844|#x.(cmpset__5844 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6070
    END;
  
  Avion_setCateg_EXT(categ?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & categ' = categ?
      & noimmat' = noimmat
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setCateg(categ?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & categ' = categ?
      & noimmat' = noimmat
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5845|#x.(cmpset__5845 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5847|#x.(cmpset__5847 = {cmpset__5846|#y.(cmpset__5846 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5848|#x.(cmpset__5848 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5850|#x.(cmpset__5850 = {cmpset__5849|#y.(cmpset__5849 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5851|#x.(cmpset__5851 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getCateg_EXT(this?) = 
    ANY Avion',result!6071,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6071 = categ
    THEN
      Avion,result! := Avion',result!6071
    END;
  
  result! <-- Avion_getCateg(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6072,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6072 = categ
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5852|#x.(cmpset__5852 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5854|#x.(cmpset__5854 = {cmpset__5853|#y.(cmpset__5853 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5855|#x.(cmpset__5855 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5857|#x.(cmpset__5857 = {cmpset__5856|#y.(cmpset__5856 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5858|#x.(cmpset__5858 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6072
    END;
  
  Avion_setRayon_EXT(rayon?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & rayon? : 0 .. 2000
      & rayon' = rayon?
      & noimmat' = noimmat
      & categ' = categ
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setRayon(rayon?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & rayon? : 0 .. 2000
      & rayon' = rayon?
      & noimmat' = noimmat
      & categ' = categ
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5859|#x.(cmpset__5859 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5861|#x.(cmpset__5861 = {cmpset__5860|#y.(cmpset__5860 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5862|#x.(cmpset__5862 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5864|#x.(cmpset__5864 = {cmpset__5863|#y.(cmpset__5863 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5865|#x.(cmpset__5865 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getRayon_EXT(this?) = 
    ANY Avion',result!6073,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6073 : 0 .. 2000
      & result!6073 = rayon
    THEN
      Avion,result! := Avion',result!6073
    END;
  
  result! <-- Avion_getRayon(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6074,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6074 : 0 .. 2000
      & result!6074 = rayon
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5866|#x.(cmpset__5866 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5868|#x.(cmpset__5868 = {cmpset__5867|#y.(cmpset__5867 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5869|#x.(cmpset__5869 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5871|#x.(cmpset__5871 = {cmpset__5870|#y.(cmpset__5870 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5872|#x.(cmpset__5872 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6074
    END;
  
  Avion_setHrv_EXT(hrv?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & hrv? : NATURAL
      & hrv' = hrv?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setHrv(hrv?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & hrv? : NATURAL
      & hrv' = hrv?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5873|#x.(cmpset__5873 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5875|#x.(cmpset__5875 = {cmpset__5874|#y.(cmpset__5874 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5876|#x.(cmpset__5876 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5878|#x.(cmpset__5878 = {cmpset__5877|#y.(cmpset__5877 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5879|#x.(cmpset__5879 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getHrv_EXT(this?) = 
    ANY Avion',result!6075,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6075 : NATURAL
      & result!6075 = hrv
    THEN
      Avion,result! := Avion',result!6075
    END;
  
  result! <-- Avion_getHrv(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6076,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6076 : NATURAL
      & result!6076 = hrv
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5880|#x.(cmpset__5880 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5882|#x.(cmpset__5882 = {cmpset__5881|#y.(cmpset__5881 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5883|#x.(cmpset__5883 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5885|#x.(cmpset__5885 = {cmpset__5884|#y.(cmpset__5884 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5886|#x.(cmpset__5886 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6076
    END;
  
  Avion_setType_EXT(this?,type?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & type' = type?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setType(this?,type?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & type' = type?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & capa1' = capa1
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5887|#x.(cmpset__5887 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5889|#x.(cmpset__5889 = {cmpset__5888|#y.(cmpset__5888 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5890|#x.(cmpset__5890 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5892|#x.(cmpset__5892 = {cmpset__5891|#y.(cmpset__5891 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5893|#x.(cmpset__5893 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getType_EXT(this?) = 
    ANY Avion',result!6077,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6077 = type
    THEN
      Avion,result! := Avion',result!6077
    END;
  
  result! <-- Avion_getType(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6078,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6078 = type
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5894|#x.(cmpset__5894 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5896|#x.(cmpset__5896 = {cmpset__5895|#y.(cmpset__5895 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5897|#x.(cmpset__5897 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5899|#x.(cmpset__5899 = {cmpset__5898|#y.(cmpset__5898 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5900|#x.(cmpset__5900 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6078
    END;
  
  Avion_setCapa1_EXT(capa1?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & capa1? : 0 .. 150
      & capa1' = capa1?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa2' = capa2
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setCapa1(capa1?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & capa1? : 0 .. 150
      & capa1' = capa1?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa2' = capa2
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5901|#x.(cmpset__5901 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5903|#x.(cmpset__5903 = {cmpset__5902|#y.(cmpset__5902 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5904|#x.(cmpset__5904 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5906|#x.(cmpset__5906 = {cmpset__5905|#y.(cmpset__5905 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5907|#x.(cmpset__5907 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getCapa1_EXT(this?) = 
    ANY Avion',result!6079,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6079 : 0 .. 150
      & result!6079 = capa1
    THEN
      Avion,result! := Avion',result!6079
    END;
  
  result! <-- Avion_getCapa1(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6080,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6080 : 0 .. 150
      & result!6080 = capa1
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5908|#x.(cmpset__5908 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5910|#x.(cmpset__5910 = {cmpset__5909|#y.(cmpset__5909 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5911|#x.(cmpset__5911 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5913|#x.(cmpset__5913 = {cmpset__5912|#y.(cmpset__5912 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5914|#x.(cmpset__5914 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6080
    END;
  
  Avion_setCapa2_EXT(capa2?,this?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & capa2? : 0 .. 150
      & capa2' = capa2?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & tonnage' = tonnage
    THEN
      Avion := Avion'
    END;
  
  Avion_setCapa2(capa2?,this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & capa2? : 0 .. 150
      & capa2' = capa2?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & tonnage' = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5915|#x.(cmpset__5915 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5917|#x.(cmpset__5917 = {cmpset__5916|#y.(cmpset__5916 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5918|#x.(cmpset__5918 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5920|#x.(cmpset__5920 = {cmpset__5919|#y.(cmpset__5919 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5921|#x.(cmpset__5921 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getCapa2_EXT(this?) = 
    ANY Avion',result!6081,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6081 : 0 .. 150
      & result!6081 = capa2
    THEN
      Avion,result! := Avion',result!6081
    END;
  
  result! <-- Avion_getCapa2(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6082,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6082 : 0 .. 150
      & result!6082 = capa2
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5922|#x.(cmpset__5922 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5924|#x.(cmpset__5924 = {cmpset__5923|#y.(cmpset__5923 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5925|#x.(cmpset__5925 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5927|#x.(cmpset__5927 = {cmpset__5926|#y.(cmpset__5926 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5928|#x.(cmpset__5928 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6082
    END;
  
  Avion_setTonnage_EXT(this?,tonnage?) = 
    ANY Avion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & tonnage? : 0 .. 15000
      & tonnage' = tonnage?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
    THEN
      Avion := Avion'
    END;
  
  Avion_setTonnage(this?,tonnage?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & tonnage? : 0 .. 15000
      & tonnage' = tonnage?
      & noimmat' = noimmat
      & categ' = categ
      & rayon' = rayon
      & hrv' = hrv
      & type' = type
      & capa1' = capa1
      & capa2' = capa2
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5929|#x.(cmpset__5929 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5931|#x.(cmpset__5931 = {cmpset__5930|#y.(cmpset__5930 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5932|#x.(cmpset__5932 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5934|#x.(cmpset__5934 = {cmpset__5933|#y.(cmpset__5933 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5935|#x.(cmpset__5935 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion := Avion',avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getTonnage_EXT(this?) = 
    ANY Avion',result!6083,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6083 : 0 .. 15000
      & result!6083 = tonnage
    THEN
      Avion,result! := Avion',result!6083
    END;
  
  result! <-- Avion_getTonnage(this?) = 
    ANY Avion',Instance',avionDInstance',instancesDAvion',result!6084,tonnage,tonnage',capa2,capa2',capa1,capa1',type,type',hrv,hrv',rayon,rayon',categ,categ',noimmat,noimmat'
    WHERE 
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion' : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & rayon : 0 .. 2000
      & hrv : NATURAL
      & capa1 : 0 .. 150
      & capa2 : 0 .. 150
      & tonnage : 0 .. 15000
      & rayon' : 0 .. 2000
      & hrv' : NATURAL
      & capa1' : 0 .. 150
      & capa2' : 0 .. 150
      & tonnage' : 0 .. 15000
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & this? : Avion
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this?
      & Avion' = Avion - {this?} \/ {rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}
      & noimmat = noimmat'
      & categ = categ'
      & rayon = rayon'
      & hrv = hrv'
      & type = type'
      & capa1 = capa1'
      & capa2 = capa2'
      & tonnage = tonnage'
      & result!6084 : 0 .. 15000
      & result!6084 = tonnage
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5936|#x.(cmpset__5936 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5938|#x.(cmpset__5938 = {cmpset__5937|#y.(cmpset__5937 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance' : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion'
      & union(ran(instancesDAvion')) <: Instance'
      & instancesDAvion' = {cmpset__5939|#x.(cmpset__5939 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5941|#x.(cmpset__5941 = {cmpset__5940|#y.(cmpset__5940 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & Instance = Instance'
      & (# /* LET */ (newId).( (newId)=({cmpset__5942|#x.(cmpset__5942 = x |-> x & x : Avion - {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage)})} \/ {rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) |-> rec(noimmat:noimmat',categ:categ',rayon:rayon',hrv:hrv',type:type',capa1:capa1',capa2:capa2',tonnage:tonnage')}) & newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) & instancesDAvion' = (newId~ ; instancesDAvion)))
    THEN
      Avion,avionDInstance,instancesDAvion,result! := Avion',avionDInstance',instancesDAvion',result!6084
    END;
  
  Avion_linkInstancesDAvion(i?,this?) = 
    ANY avionDInstance',instancesDAvion'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5943|#x.(cmpset__5943 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5945|#x.(cmpset__5945 = {cmpset__5944|#y.(cmpset__5944 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion
      & union(ran(instancesDAvion')) <: Instance
      & instancesDAvion' = {cmpset__5946|#x.(cmpset__5946 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5948|#x.(cmpset__5948 = {cmpset__5947|#y.(cmpset__5947 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & i?'sem : 1 .. 53
      & i?'jr : 1 .. 7
      & i?'duree : NATURAL
      & i?'res1 : 0 .. 150
      & i?'res2 : 0 .. 150
      & i?'tonnage : 0 .. 15000
      & i? : Instance
      & this? : Avion
      & avionDInstance' = avionDInstance <+ {i? |-> this?}
    THEN
      avionDInstance,instancesDAvion := avionDInstance',instancesDAvion'
    END;
  
  Avion_unlinkInstancesDAvion(i?,this?) = 
    ANY avionDInstance',instancesDAvion'
    WHERE 
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5949|#x.(cmpset__5949 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5951|#x.(cmpset__5951 = {cmpset__5950|#y.(cmpset__5950 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & instancesDAvion' : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance' : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion') <: Avion
      & union(ran(instancesDAvion')) <: Instance
      & instancesDAvion' = {cmpset__5952|#x.(cmpset__5952 = x |-> {y|y : dom(avionDInstance') & x = avionDInstance'(y)} & x : ran(avionDInstance'))}
      & avionDInstance' = union({cmpset__5954|#x.(cmpset__5954 = {cmpset__5953|#y.(cmpset__5953 = y |-> x & y : instancesDAvion'(x))} & x : dom(instancesDAvion'))})
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & i?'sem : 1 .. 53
      & i?'jr : 1 .. 7
      & i?'duree : NATURAL
      & i?'res1 : 0 .. 150
      & i?'res2 : 0 .. 150
      & i?'tonnage : 0 .. 15000
      & this? : dom(instancesDAvion)
      & avionDInstance' = avionDInstance - {i? |-> this?}
    THEN
      avionDInstance,instancesDAvion := avionDInstance',instancesDAvion'
    END;
  
  result! <-- Avion_getInstancesDAvion(this?) = 
    ANY result!6085
    WHERE 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__4885|rec__4885'dist : 0 .. 2000 & rec__4885'vdep /= rec__4885'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__4888|rec__4888'dist : 0 .. 2000 & rec__4888'vdep /= rec__4888'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4891|rec__4891'dist : 0 .. 2000 & rec__4891'vdep /= rec__4891'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5955|#x.(cmpset__5955 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5957|#x.(cmpset__5957 = {cmpset__5956|#y.(cmpset__5956 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5958|#x.(cmpset__5958 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5960|#x.(cmpset__5960 = {cmpset__5959|#y.(cmpset__5959 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5961|#x.(cmpset__5961 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5963|#x.(cmpset__5963 = {cmpset__5962|#y.(cmpset__5962 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__4901|rec__4901'dist : 0 .. 2000 & rec__4901'vdep /= rec__4901'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__4904|rec__4904'dist : 0 .. 2000 & rec__4904'vdep /= rec__4904'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4907|rec__4907'dist : 0 .. 2000 & rec__4907'vdep /= rec__4907'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__5964|#x.(cmpset__5964 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__5966|#x.(cmpset__5966 = {cmpset__5965|#y.(cmpset__5965 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__5967|#x.(cmpset__5967 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__5969|#x.(cmpset__5969 = {cmpset__5968|#y.(cmpset__5968 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__5970|#x.(cmpset__5970 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__5972|#x.(cmpset__5972 = {cmpset__5971|#y.(cmpset__5971 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & this?'rayon : 0 .. 2000
      & this?'hrv : NATURAL
      & this?'capa1 : 0 .. 150
      & this?'capa2 : 0 .. 150
      & this?'tonnage : 0 .. 15000
      & result!6085 : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & result!6085 = instancesDAvion(this?)
    THEN
      result! := result!6085
    END;
  
  CheckGlobalInvariant = 
    SELECT 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__5047|rec__5047'dist : 0 .. 2000 & rec__5047'vdep /= rec__5047'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__5050|rec__5050'dist : 0 .. 2000 & rec__5050'vdep /= rec__5050'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__5053|rec__5053'dist : 0 .. 2000 & rec__5053'vdep /= rec__5053'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__6000|#x.(cmpset__6000 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__6002|#x.(cmpset__6002 = {cmpset__6001|#y.(cmpset__6001 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__6003|#x.(cmpset__6003 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__6005|#x.(cmpset__6005 = {cmpset__6004|#y.(cmpset__6004 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__6006|#x.(cmpset__6006 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__6008|#x.(cmpset__6008 = {cmpset__6007|#y.(cmpset__6007 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__5063|rec__5063'dist : 0 .. 2000 & rec__5063'vdep /= rec__5063'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__5066|rec__5066'dist : 0 .. 2000 & rec__5066'vdep /= rec__5066'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__5069|rec__5069'dist : 0 .. 2000 & rec__5069'vdep /= rec__5069'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__6009|#x.(cmpset__6009 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__6011|#x.(cmpset__6011 = {cmpset__6010|#y.(cmpset__6010 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__6012|#x.(cmpset__6012 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__6014|#x.(cmpset__6014 = {cmpset__6013|#y.(cmpset__6013 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__6015|#x.(cmpset__6015 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__6017|#x.(cmpset__6017 = {cmpset__6016|#y.(cmpset__6016 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
    THEN 
      skip
    END;
  
  zcoverage!,zcoverageMax!,znotCovered! <-- Coverage_model = 
    SELECT 
        Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__5111|rec__5111'dist : 0 .. 2000 & rec__5111'vdep /= rec__5111'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__5114|rec__5114'dist : 0 .. 2000 & rec__5114'vdep /= rec__5114'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__5117|rec__5117'dist : 0 .. 2000 & rec__5117'vdep /= rec__5117'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__6018|#x.(cmpset__6018 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__6020|#x.(cmpset__6020 = {cmpset__6019|#y.(cmpset__6019 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__6021|#x.(cmpset__6021 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__6023|#x.(cmpset__6023 = {cmpset__6022|#y.(cmpset__6022 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__6024|#x.(cmpset__6024 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__6026|#x.(cmpset__6026 = {cmpset__6025|#y.(cmpset__6025 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
      & Vol : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & Ligne : FIN({rec__5127|rec__5127'dist : 0 .. 2000 & rec__5127'vdep /= rec__5127'var})
      & Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & volsDeLigne : {rec__5130|rec__5130'dist : 0 .. 2000 & rec__5130'vdep /= rec__5130'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
      & ligneDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__5133|rec__5133'dist : 0 .. 2000 & rec__5133'vdep /= rec__5133'var}
      & dom(volsDeLigne) <: Ligne
      & union(ran(volsDeLigne)) = Vol
      & volsDeLigne = {cmpset__6027|#x.(cmpset__6027 = x |-> {y|y : dom(ligneDeVol) & x = ligneDeVol(y)} & x : ran(ligneDeVol))}
      & ligneDeVol = union({cmpset__6029|#x.(cmpset__6029 = {cmpset__6028|#y.(cmpset__6028 = y |-> x & y : volsDeLigne(x))} & x : dom(volsDeLigne))})
      & instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion) <: Avion
      & union(ran(instancesDAvion)) <: Instance
      & instancesDAvion = {cmpset__6030|#x.(cmpset__6030 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      & avionDInstance = union({cmpset__6032|#x.(cmpset__6032 = {cmpset__6031|#y.(cmpset__6031 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & volDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
      & instancesDeVol : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & dom(volDInstance) = Instance
      & ran(volDInstance) <: Vol
      & instancesDeVol = {cmpset__6033|#x.(cmpset__6033 = x |-> {y|y : dom(volDInstance) & x = volDInstance(y)} & x : ran(volDInstance))}
      & volDInstance = union({cmpset__6035|#x.(cmpset__6035 = {cmpset__6034|#y.(cmpset__6034 = y |-> x & y : instancesDeVol(x))} & x : dom(instancesDeVol))})
    THEN 
      LET zcoverage!6086,zcoverageMax!6087,znotCovered!6088 BE zcoverage!6086 = 0 + (IF Vol /= {} THEN 1 ELSE 0 END) + (IF Ligne /= {} THEN 1 ELSE 0 END) + (IF Instance /= {} THEN 1 ELSE 0 END) + (IF Avion /= {} THEN 1 ELSE 0 END) + (IF volsDeLigne /= {} THEN 1 ELSE 0 END) + (IF ligneDeVol /= {} THEN 1 ELSE 0 END) + (IF instancesDAvion /= {} THEN 1 ELSE 0 END) + (IF avionDInstance /= {} THEN 1 ELSE 0 END) + (IF volDInstance /= {} THEN 1 ELSE 0 END) + (IF instancesDeVol /= {} THEN 1 ELSE 0 END) & zcoverageMax!6087 = 10 & znotCovered!6088 = zcoverageMax!6087 - zcoverage!6086
      IN
        zcoverage!,zcoverageMax!,znotCovered! := zcoverage!6086,zcoverageMax!6087,znotCovered!6088
      END
    END
END
