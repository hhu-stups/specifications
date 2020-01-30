MACHINE UnsatCore_einstein_ctx_v2
SETS /* enumerated */
  Farben={Rot,Gruen,Weiss,Gelb,Blau};
  Getraenke={Tee,Kaffee,Milch,Bier,Wasser};
  Menschen={Brite,Schwede,Daene,Norweger,Deutscher};
  Tiere={Hund,Vogel,Katze,Pferd,Fisch};
  Zigaretten={PallMall,DunHill,Marlboro,Winfield,Rothmanns}
CONSTANTS Trinkt
PROPERTIES
 /* @einstein:trinkt  */ Trinkt : Menschen >->> Getraenke & 
 /* @einstein:däne_tee  */ Daene |-> Tee : Trinkt
END
