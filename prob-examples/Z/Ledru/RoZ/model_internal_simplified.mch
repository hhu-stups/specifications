
MACHINE model
DEFINITIONS "LibraryIO.def"
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
    LET Vol_pr_,Ligne_pr_,Instance_pr_,Avion_pr_,volsDeLigne_pr_,ligneDeVol_pr_,instancesDAvion_pr_,avionDInstance_pr_,volDInstance_pr_,instancesDeVol_pr_ BE Vol_pr_ = {} & Ligne_pr_ = {} & Instance_pr_ = {} & Avion_pr_ = {} & volsDeLigne_pr_ = {} & ligneDeVol_pr_ = union({cmpset__5975|#x.(cmpset__5975 = {cmpset__5974|#y.(cmpset__5974 = y |-> x & y : volsDeLigne_pr_(x))} & x : dom(volsDeLigne_pr_))}) & instancesDAvion_pr_ = {} & avionDInstance_pr_ = union({cmpset__5978|#x.(cmpset__5978 = {cmpset__5977|#y.(cmpset__5977 = y |-> x & y : instancesDAvion_pr_(x))} & x : dom(instancesDAvion_pr_))}) & volDInstance_pr_ = {} & instancesDeVol_pr_ = {cmpset__5979|#x.(cmpset__5979 = x |-> {y|y : dom(volDInstance_pr_) & x = volDInstance_pr_(y)} & x : ran(volDInstance_pr_))}
    IN
      SELECT
          Vol_pr_ : FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
        & Ligne_pr_ : FIN({rec__4935|rec__4935'dist : 0 .. 2000 & rec__4935'vdep /= rec__4935'var})
        & Instance_pr_ : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & Avion_pr_ : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
        & volsDeLigne_pr_ : {rec__4938|rec__4938'dist : 0 .. 2000 & rec__4938'vdep /= rec__4938'var} +-> FIN(struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL))
        & ligneDeVol_pr_ : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> {rec__4941|rec__4941'dist : 0 .. 2000 & rec__4941'vdep /= rec__4941'var}
        & dom(volsDeLigne_pr_) <: Ligne_pr_
        & union(ran(volsDeLigne_pr_)) = Vol_pr_
        & volsDeLigne_pr_ = {cmpset__5973|#x.(cmpset__5973 = x |-> {y|y : dom(ligneDeVol_pr_) & x = ligneDeVol_pr_(y)} & x : ran(ligneDeVol_pr_))}
        & instancesDAvion_pr_ : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & avionDInstance_pr_ : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
        & dom(instancesDAvion_pr_) <: Avion_pr_
        & union(ran(instancesDAvion_pr_)) <: Instance_pr_
        & instancesDAvion_pr_ = {cmpset__5976|#x.(cmpset__5976 = x |-> {y|y : dom(avionDInstance_pr_) & x = avionDInstance_pr_(y)} & x : ran(avionDInstance_pr_))}
        & volDInstance_pr_ : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL)
        & instancesDeVol_pr_ : struct(har:0 .. 1439,hdep:0 .. 1439,numvol:NUMVOL) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
        & dom(volDInstance_pr_) = Instance_pr_
        & ran(volDInstance_pr_) <: Vol_pr_
        & volDInstance_pr_ = union({cmpset__5981|#x.(cmpset__5981 = {cmpset__5980|#y.(cmpset__5980 = y |-> x & y : instancesDeVol_pr_(x))} & x : dom(instancesDeVol_pr_))})
        & ligneDeVol_pr_ = {}
        & avionDInstance_pr_ = {}
        & instancesDeVol_pr_ = {}
      THEN
        Avion,Instance,Ligne,Vol,avionDInstance,instancesDAvion,instancesDeVol,ligneDeVol,volDInstance,volsDeLigne := Avion_pr_,Instance_pr_,Ligne_pr_,Vol_pr_,avionDInstance_pr_,instancesDAvion_pr_,instancesDeVol_pr_,ligneDeVol_pr_,volDInstance_pr_,volsDeLigne_pr_
      END
    END
OPERATIONS


  Instance_new(instance_q) =
    ANY Instance_pr_
    WHERE
        Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & Instance_pr_ : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instance_q'sem : 1 .. 53
      & instance_q'jr : 1 .. 7
      & instance_q'duree : NATURAL
      & instance_q'res1 : 0 .. 150
      & instance_q'res2 : 0 .. 150
      & instance_q'tonnage : 0 .. 15000
      & Instance_pr_ = Instance \/ {instance_q}
    THEN
      Instance := Instance_pr_
    END;





  Avion_new(avion_q) =
    ANY Avion_pr_
    WHERE
        Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & Avion_pr_ : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
      & avion_q'rayon : 0 .. 2000
      & avion_q'hrv : NATURAL
      & avion_q'capa1 : 0 .. 150
      & avion_q'capa2 : 0 .. 150
      & avion_q'tonnage : 0 .. 15000
      & Avion_pr_ = Avion \/ {avion_q}
    THEN
      Avion := Avion_pr_
    END;





  Avion_setTonnage(this_q,tonnage_q) =
    ANY Avion_pr_,Instance_pr_,avionDInstance_pr_,instancesDAvion_pr_,tonnage,tonnage_pr_,capa2,capa2_pr_,capa1,capa1_pr_,type,type_pr_,hrv,hrv_pr_,rayon,rayon_pr_,categ,categ_pr_,noimmat,noimmat_pr_,
    newId
    WHERE
       // Avion : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
       Avion_pr_ : FIN(struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE))
     // & rayon : 0 .. 2000
      //& hrv : NATURAL
     // & capa1 : 0 .. 150
      //& capa2 : 0 .. 150
      //& tonnage : 0 .. 15000
      //& rayon_pr_ : 0 .. 2000
      //& hrv_pr_ : NATURAL
      //& capa1_pr_ : 0 .. 150
      //& capa2_pr_ : 0 .. 150
      //& tonnage_pr_ : 0 .. 15000
      //& this_q'rayon : 0 .. 2000
      //& this_q'hrv : NATURAL
      //& this_q'capa1 : 0 .. 150
      //& this_q'capa2 : 0 .. 150
      //& this_q'tonnage : 0 .. 15000
        & this_q : Avion
      & observe(this_q)
      & rec(noimmat:noimmat,categ:categ,rayon:rayon,hrv:hrv,type:type,capa1:capa1,capa2:capa2,tonnage:tonnage) = this_q
      & Avion_pr_ = Avion - {this_q} \/ {rec(noimmat:noimmat_pr_,categ:categ_pr_,rayon:rayon_pr_,hrv:hrv_pr_,type:type_pr_,capa1:capa1_pr_,capa2:capa2_pr_,tonnage:tonnage_pr_)}
      & tonnage_q : 0 .. 15000
      & tonnage_pr_ = tonnage_q
      & noimmat_pr_ = noimmat
      & categ_pr_ = categ
      & rayon_pr_ = rayon
      & hrv_pr_ = hrv
      & type_pr_ = type
      & capa1_pr_ = capa1
      & capa2_pr_ = capa2
      //& Instance : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      //& instancesDAvion : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      //& avionDInstance : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
     // & dom(instancesDAvion) <: Avion
      //& union(ran(instancesDAvion)) <: Instance
      //& instancesDAvion = {cmpset__5929|#x.(cmpset__5929 = x |-> {y|y : dom(avionDInstance) & x = avionDInstance(y)} & x : ran(avionDInstance))}
      //& avionDInstance = union({cmpset__5931|#x.(cmpset__5931 = {cmpset__5930|#y.(cmpset__5930 = y |-> x & y : instancesDAvion(x))} & x : dom(instancesDAvion))})
      & Instance_pr_ : FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & instancesDAvion_pr_ : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance_pr_ : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
       //& dom(instancesDAvion_pr_) <: Avion_pr_
        & union(ran(instancesDAvion_pr_)) <: Instance_pr_  // THIS IS CAUSING THE PROBLEM; it instantiates the LHS, initially to the empty set
       // & !xx. (xx:ran(instancesDAvion_pr_) => xx <: Instance_pr_)  // This works instead of line above !!
     // & instancesDAvion_pr_ = {cmpset__5932|#x.(cmpset__5932 = x |-> {y|y : dom(avionDInstance_pr_) & x = avionDInstance_pr_(y)} & x : ran(avionDInstance_pr_))}
      & avionDInstance_pr_ = union({cmpset__5934|#x.(cmpset__5934 = {cmpset__5933|#y.(cmpset__5933 = y |-> x & y : instancesDAvion_pr_(x))} & x : dom(instancesDAvion_pr_))})
      & Instance = Instance_pr_
      & //(# /* LET */ (newId).
      ( (newId)= ({cmpset__5935|
                     #x.(cmpset__5935 = x |-> x &
                   x : Avion - {this_q}
                  )}
                  \/
                {this_q
                 |-> rec(noimmat:noimmat_pr_,categ:categ_pr_,rayon:rayon_pr_,hrv:hrv_pr_,type:type_pr_,capa1:capa1_pr_,capa2:capa2_pr_,tonnage:tonnage_pr_)}) &
       // newId : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)  &
    //   observe(newId) & //observe(instancesDAvion_pr_) &
   //   instancesDAvion_pr_ = (newId~ ; instancesDAvion))
       instancesDAvion_pr_ = {x,y| #z.( (z,x):newId & (z,y):instancesDAvion)} )
    //  instancesDAvion_pr_ = %x.(x:
     // instancesDAvion_pr_ = instancesDAvion )  // no timeout
      //)
    THEN
      Avion,avionDInstance,instancesDAvion := Avion_pr_,avionDInstance_pr_,instancesDAvion_pr_
    END;



  Avion_linkInstancesDAvion(i_q,this_q) =
    ANY avionDInstance_pr_,instancesDAvion_pr_
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
      & instancesDAvion_pr_ : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance_pr_ : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion_pr_) <: Avion
      & union(ran(instancesDAvion_pr_)) <: Instance
      & instancesDAvion_pr_ = {cmpset__5946|#x.(cmpset__5946 = x |-> {y|y : dom(avionDInstance_pr_) & x = avionDInstance_pr_(y)} & x : ran(avionDInstance_pr_))}
      & avionDInstance_pr_ = union({cmpset__5948|#x.(cmpset__5948 = {cmpset__5947|#y.(cmpset__5947 = y |-> x & y : instancesDAvion_pr_(x))} & x : dom(instancesDAvion_pr_))})
      & this_q'rayon : 0 .. 2000
      & this_q'hrv : NATURAL
      & this_q'capa1 : 0 .. 150
      & this_q'capa2 : 0 .. 150
      & this_q'tonnage : 0 .. 15000
      & i_q'sem : 1 .. 53
      & i_q'jr : 1 .. 7
      & i_q'duree : NATURAL
      & i_q'res1 : 0 .. 150
      & i_q'res2 : 0 .. 150
      & i_q'tonnage : 0 .. 15000
      & i_q : Instance
      & this_q : Avion
      & avionDInstance_pr_ = avionDInstance <+ {i_q |-> this_q}
    THEN
      avionDInstance,instancesDAvion := avionDInstance_pr_,instancesDAvion_pr_
    END
/*

  Avion_unlinkInstancesDAvion(i_q,this_q) =
    ANY avionDInstance_pr_,instancesDAvion_pr_
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
      & instancesDAvion_pr_ : struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE) +-> FIN(struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000))
      & avionDInstance_pr_ : struct(categ:CATEG,duree:NATURAL,jr:1 .. 7,numvol:NUMVOL,res1:0 .. 150,res2:0 .. 150,sem:1 .. 53,tonnage:0 .. 15000) +-> struct(capa1:0 .. 150,capa2:0 .. 150,categ:CATEG,hrv:NATURAL,noimmat:NOIMMAT,rayon:0 .. 2000,tonnage:0 .. 15000,type:TYPE)
      & dom(instancesDAvion_pr_) <: Avion
      & union(ran(instancesDAvion_pr_)) <: Instance
      & instancesDAvion_pr_ = {cmpset__5952|#x.(cmpset__5952 = x |-> {y|y : dom(avionDInstance_pr_) & x = avionDInstance_pr_(y)} & x : ran(avionDInstance_pr_))}
      & avionDInstance_pr_ = union({cmpset__5954|#x.(cmpset__5954 = {cmpset__5953|#y.(cmpset__5953 = y |-> x & y : instancesDAvion_pr_(x))} & x : dom(instancesDAvion_pr_))})
      & this_q'rayon : 0 .. 2000
      & this_q'hrv : NATURAL
      & this_q'capa1 : 0 .. 150
      & this_q'capa2 : 0 .. 150
      & this_q'tonnage : 0 .. 15000
      & i_q'sem : 1 .. 53
      & i_q'jr : 1 .. 7
      & i_q'duree : NATURAL
      & i_q'res1 : 0 .. 150
      & i_q'res2 : 0 .. 150
      & i_q'tonnage : 0 .. 15000
      & this_q : dom(instancesDAvion)
      & avionDInstance_pr_ = avionDInstance - {i_q |-> this_q}
    THEN
      avionDInstance,instancesDAvion := avionDInstance_pr_,instancesDAvion_pr_
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
    END
*/

END
