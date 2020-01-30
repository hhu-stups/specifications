
MACHINE model_internal_ppf
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
INVARIANT
    Avion : POW(struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE))
  & Instance : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER))
  & Ligne : POW(struct(dist:INTEGER,var:VILLE,vdep:VILLE))
  & Vol : POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL))
  & avionDInstance : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE))
  & instancesDAvion : POW(struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) * POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)))
  & instancesDeVol : POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) * POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)))
  & ligneDeVol : POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) * struct(dist:INTEGER,var:VILLE,vdep:VILLE))
  & volDInstance : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL))
  & volsDeLigne : POW(struct(dist:INTEGER,var:VILLE,vdep:VILLE) * POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)))
INITIALISATION
    LET Vol',Ligne',Instance',Avion',volsDeLigne',ligneDeVol',instancesDAvion',avionDInstance',volDInstance',instancesDeVol' BE Vol' = {} & Ligne' = {} & Instance' = {} & Avion' = {} & volsDeLigne' = {} & ligneDeVol' = union({cmpset__4764|cmpset__4764 : POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) * struct(dist:INTEGER,var:VILLE,vdep:VILLE)) & #x.(x : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (cmpset__4764 = {cmpset__4763|cmpset__4763 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) * struct(dist:INTEGER,var:VILLE,vdep:VILLE) & #y.(y : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (cmpset__4763 = y |-> x & y : volsDeLigne'(x)))} & x : dom(volsDeLigne')))}) & instancesDAvion' = {} & avionDInstance' = union({cmpset__4767|cmpset__4767 : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE)) & #x.(x : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & (cmpset__4767 = {cmpset__4766|cmpset__4766 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & #y.(y : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (cmpset__4766 = y |-> x & y : instancesDAvion'(x)))} & x : dom(instancesDAvion')))}) & volDInstance' = {} & instancesDeVol' = {cmpset__4768|cmpset__4768 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) * POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)) & #x.(x : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (cmpset__4768 = x |-> {y|y : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (y : dom(volDInstance') & x = volDInstance'(y))} & x : ran(volDInstance')))}
    IN
      SELECT 
          Vol' : FIN({rec__3723|rec__3723 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__3723'hdep : 0 .. 1439 & rec__3723'har : 0 .. 1439)})
        & Ligne' : FIN({rec__3724|rec__3724 : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (rec__3724'dist : 0 .. 2000 & rec__3724'vdep /= rec__3724'var)})
        & Instance' : FIN({rec__3725|rec__3725 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3725'sem : 1 .. 53 & rec__3725'jr : 1 .. 7 & rec__3725'duree : NATURAL & rec__3725'res1 : 0 .. 150 & rec__3725'res2 : 0 .. 150 & rec__3725'tonnage : 0 .. 15000)})
        & Avion' : FIN({rec__3726|rec__3726 : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & (rec__3726'rayon : 0 .. 2000 & rec__3726'hrv : NATURAL & rec__3726'capa1 : 0 .. 150 & rec__3726'capa2 : 0 .. 150 & rec__3726'tonnage : 0 .. 15000)})
        & volsDeLigne' : {rec__3727|rec__3727 : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (rec__3727'dist : 0 .. 2000 & rec__3727'vdep /= rec__3727'var)} +-> FIN({rec__3728|rec__3728 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__3728'hdep : 0 .. 1439 & rec__3728'har : 0 .. 1439)})
        & ligneDeVol' : {rec__3729|rec__3729 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__3729'hdep : 0 .. 1439 & rec__3729'har : 0 .. 1439)} +-> {rec__3730|rec__3730 : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (rec__3730'dist : 0 .. 2000 & rec__3730'vdep /= rec__3730'var)}
        & dom(volsDeLigne') <: Ligne'
        & union(ran(volsDeLigne')) = Vol'
        & volsDeLigne' = {cmpset__4762|cmpset__4762 : struct(dist:INTEGER,var:VILLE,vdep:VILLE) * POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)) & #x.(x : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (cmpset__4762 = x |-> {y|y : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (y : dom(ligneDeVol') & x = ligneDeVol'(y))} & x : ran(ligneDeVol')))}
        & instancesDAvion' : {rec__3731|rec__3731 : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & (rec__3731'rayon : 0 .. 2000 & rec__3731'hrv : NATURAL & rec__3731'capa1 : 0 .. 150 & rec__3731'capa2 : 0 .. 150 & rec__3731'tonnage : 0 .. 15000)} +-> FIN({rec__3732|rec__3732 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3732'sem : 1 .. 53 & rec__3732'jr : 1 .. 7 & rec__3732'duree : NATURAL & rec__3732'res1 : 0 .. 150 & rec__3732'res2 : 0 .. 150 & rec__3732'tonnage : 0 .. 15000)})
        & avionDInstance' : {rec__3733|rec__3733 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3733'sem : 1 .. 53 & rec__3733'jr : 1 .. 7 & rec__3733'duree : NATURAL & rec__3733'res1 : 0 .. 150 & rec__3733'res2 : 0 .. 150 & rec__3733'tonnage : 0 .. 15000)} +-> {rec__3734|rec__3734 : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & (rec__3734'rayon : 0 .. 2000 & rec__3734'hrv : NATURAL & rec__3734'capa1 : 0 .. 150 & rec__3734'capa2 : 0 .. 150 & rec__3734'tonnage : 0 .. 15000)}
        & dom(instancesDAvion') <: Avion'
        & union(ran(instancesDAvion')) <: Instance'
        & instancesDAvion' = {cmpset__4765|cmpset__4765 : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) * POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)) & #x.(x : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE) & (cmpset__4765 = x |-> {y|y : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (y : dom(avionDInstance') & x = avionDInstance'(y))} & x : ran(avionDInstance')))}
        & volDInstance' : {rec__3735|rec__3735 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3735'sem : 1 .. 53 & rec__3735'jr : 1 .. 7 & rec__3735'duree : NATURAL & rec__3735'res1 : 0 .. 150 & rec__3735'res2 : 0 .. 150 & rec__3735'tonnage : 0 .. 15000)} +-> {rec__3736|rec__3736 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__3736'hdep : 0 .. 1439 & rec__3736'har : 0 .. 1439)}
        & instancesDeVol' : {rec__3737|rec__3737 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__3737'hdep : 0 .. 1439 & rec__3737'har : 0 .. 1439)} +-> FIN({rec__3738|rec__3738 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3738'sem : 1 .. 53 & rec__3738'jr : 1 .. 7 & rec__3738'duree : NATURAL & rec__3738'res1 : 0 .. 150 & rec__3738'res2 : 0 .. 150 & rec__3738'tonnage : 0 .. 15000)})
        & dom(volDInstance') = Instance'
        & ran(volDInstance') <: Vol'
        & volDInstance' = union({cmpset__4770|cmpset__4770 : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)) & #x.(x : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (cmpset__4770 = {cmpset__4769|cmpset__4769 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) * struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & #y.(y : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (cmpset__4769 = y |-> x & y : instancesDeVol'(x)))} & x : dom(instancesDeVol')))})
        & ligneDeVol' = {}
        & avionDInstance' = {}
        & instancesDeVol' = {}
      THEN 
        Avion,Instance,Ligne,Vol,avionDInstance,instancesDAvion,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Avion',Instance',Ligne',Vol',avionDInstance',instancesDAvion',instancesDeVol',ligneDeVol',volDInstance',volsDeLigne'
      END
    END
OPERATIONS
  result! <-- Vol_getLigneDeVol(this?) = 
    PRE 
        this? : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)
    THEN
      ANY result!4825
      WHERE 
          result!4825 : struct(dist:INTEGER,var:VILLE,vdep:VILLE)
        & this?'hdep : 0 .. 1439
        & this?'har : 0 .. 1439
        & result!4825'dist : 0 .. 2000
        & result!4825'vdep /= result!4825'var
        & this? : dom(ligneDeVol)
        & result!4825 = ligneDeVol(this?)
      THEN
        result! := result!4825
      END
    END;
  
  result! <-- Vol_getInstancesDeVol(this?) = 
    PRE 
        this? : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)
    THEN
      ANY result!4826
      WHERE 
          result!4826 : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER))
        & this?'hdep : 0 .. 1439
        & this?'har : 0 .. 1439
        & result!4826 : FIN({rec__988|rec__988 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__988'sem : 1 .. 53 & rec__988'jr : 1 .. 7 & rec__988'duree : NATURAL & rec__988'res1 : 0 .. 150 & rec__988'res2 : 0 .. 150 & rec__988'tonnage : 0 .. 15000)})
        & this? : dom(instancesDeVol)
        & result!4826 = instancesDeVol(this?)
      THEN
        result! := result!4826
      END
    END;
  
  Ligne_new2(ligne?) = 
    PRE 
        ligne? : struct(dist:INTEGER,var:VILLE,vdep:VILLE)
    THEN
      ANY Ligne'
      WHERE 
          Ligne' : POW(struct(dist:INTEGER,var:VILLE,vdep:VILLE))
        & Ligne' : FIN({rec__1147|rec__1147 : struct(dist:INTEGER,var:VILLE,vdep:VILLE) & (rec__1147'dist : 0 .. 2000 & rec__1147'vdep /= rec__1147'var)})
        & dom(volsDeLigne) <: Ligne'
        & ligne?'dist : 0 .. 2000
        & ligne?'vdep /= ligne?'var
        & Ligne' = Ligne \/ {ligne?}
      THEN
        Ligne := Ligne'
      END
    END;
  
  result! <-- Ligne_getVolsDeLigne(this?) = 
    PRE 
        this? : struct(dist:INTEGER,var:VILLE,vdep:VILLE)
    THEN
      ANY result!4827
      WHERE 
          result!4827 : POW(struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL))
        & this?'dist : 0 .. 2000
        & this?'vdep /= this?'var
        & result!4827 : FIN({rec__1540|rec__1540 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL) & (rec__1540'hdep : 0 .. 1439 & rec__1540'har : 0 .. 1439)})
        & this? : dom(volsDeLigne)
        & result!4827 = volsDeLigne(this?)
      THEN
        result! := result!4827
      END
    END;
  
  result! <-- Instance_getAvionDInstance(this?) = 
    PRE 
        this? : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)
    THEN
      ANY result!4828
      WHERE 
          result!4828 : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE)
        & this?'sem : 1 .. 53
        & this?'jr : 1 .. 7
        & this?'duree : NATURAL
        & this?'res1 : 0 .. 150
        & this?'res2 : 0 .. 150
        & this?'tonnage : 0 .. 15000
        & result!4828'rayon : 0 .. 2000
        & result!4828'hrv : NATURAL
        & result!4828'capa1 : 0 .. 150
        & result!4828'capa2 : 0 .. 150
        & result!4828'tonnage : 0 .. 15000
        & result!4828 = avionDInstance(this?)
      THEN
        result! := result!4828
      END
    END;
  
  result! <-- Instance_getVolDInstance(this?) = 
    PRE 
        this? : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER)
    THEN
      ANY result!4829
      WHERE 
          result!4829 : struct(har:INTEGER,hdep:INTEGER,numvol:NUMVOL)
        & this?'sem : 1 .. 53
        & this?'jr : 1 .. 7
        & this?'duree : NATURAL
        & this?'res1 : 0 .. 150
        & this?'res2 : 0 .. 150
        & this?'tonnage : 0 .. 15000
        & result!4829'hdep : 0 .. 1439
        & result!4829'har : 0 .. 1439
        & result!4829 = volDInstance(this?)
      THEN
        result! := result!4829
      END
    END;
  
  result! <-- Avion_getInstancesDAvion(this?) = 
    PRE 
        this? : struct(capa1:INTEGER,capa2:INTEGER,categ:CATEG,hrv:INTEGER,noimmat:NOIMMAT,rayon:INTEGER,tonnage:INTEGER,type:TYPE)
    THEN
      ANY result!4830
      WHERE 
          result!4830 : POW(struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER))
        & this?'rayon : 0 .. 2000
        & this?'hrv : NATURAL
        & this?'capa1 : 0 .. 150
        & this?'capa2 : 0 .. 150
        & this?'tonnage : 0 .. 15000
        & result!4830 : FIN({rec__3706|rec__3706 : struct(categ:CATEG,duree:INTEGER,jr:INTEGER,numvol:NUMVOL,res1:INTEGER,res2:INTEGER,sem:INTEGER,tonnage:INTEGER) & (rec__3706'sem : 1 .. 53 & rec__3706'jr : 1 .. 7 & rec__3706'duree : NATURAL & rec__3706'res1 : 0 .. 150 & rec__3706'res2 : 0 .. 150 & rec__3706'tonnage : 0 .. 15000)})
        & result!4830 = instancesDAvion(this?)
      THEN
        result! := result!4830
      END
    END;
  
  CheckGlobalInvariant = 
    skip;
  
  zcoverage!,zcoverageMax!,znotCovered! <-- Coverage_model = 
    LET zcoverage!4831,zcoverageMax!4832,znotCovered!4833 BE zcoverage!4831 = 0 + (IF Vol /= {} THEN 1 ELSE 0 END) + (IF Ligne /= {} THEN 1 ELSE 0 END) + (IF Instance /= {} THEN 1 ELSE 0 END) + (IF Avion /= {} THEN 1 ELSE 0 END) + (IF volsDeLigne /= {} THEN 1 ELSE 0 END) + (IF ligneDeVol /= {} THEN 1 ELSE 0 END) + (IF instancesDAvion /= {} THEN 1 ELSE 0 END) + (IF avionDInstance /= {} THEN 1 ELSE 0 END) + (IF volDInstance /= {} THEN 1 ELSE 0 END) + (IF instancesDeVol /= {} THEN 1 ELSE 0 END) & zcoverageMax!4832 = 10 & znotCovered!4833 = zcoverageMax!4832 - zcoverage!4831
    IN
      zcoverage!,zcoverageMax!,znotCovered! := zcoverage!4831,zcoverageMax!4832,znotCovered!4833
    END
END
