MACHINE ArtikelA4
SETS
 Autoren={aa,bb}
VARIABLES al
INVARIANT
 al: NAT1 +-> iseq1(Autoren)
INITIALISATION /* al :: (NAT1 +-> iseq1(Autoren)) */
 /* ANY al2 WHERE al2 :  NAT1 +-> iseq1(Autoren) THEN
   al := al2
 END */
 al : (al: NAT1 +-> iseq1(Autoren))
OPERATIONS
   aid <-- AddArtikel(ha) = PRE ha:Autoren THEN
     ANY nid WHERE nid:NAT1 & nid/:dom(al) THEN
       /* al(nid) := [ha] */
       al := al \/ {nid |-> [ha]}
         ||
       aid := nid
     END
    END;
  AddAutor(au,aid) = PRE au:Autoren & aid:dom(al) & au /: ran(al(aid)) THEN
    al(aid) := al(aid) <- au /* \/ {size(al(aid))+1 |-> au} */
  END;
  res <-- FindAutor(au) = PRE au:Autoren THEN
    res :=  {aid |  aid:dom(al) & au : ran(al(aid)) }
  END
END
