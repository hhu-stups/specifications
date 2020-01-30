MACHINE Universitemch
SETS
 COURS = {c1, c2};
 SESSION = {s1, s2};
 GROUPECOURS = {gc1, gc2, gc3};
 MATRICULE = {m1, m2, m3, m4}

CONSTANTS 
 NOTE

PROPERTIES
 NOTE = 0..1

VARIABLES
 cours, session, groupecours, groupe, matricule, inscription, 
 enseignant, prealable, accessibilite, etudiant, note

INVARIANT
 cours <: COURS
 & session <: SESSION
 & groupecours <: GROUPECOURS
 & groupe : cours <-> groupecours
 & matricule <: MATRICULE
 & inscription : cours * session <-> matricule
 & note : inscription <-> NOTE
 & enseignant : matricule <-> groupecours
 & prealable : cours <-> cours
 & accessibilite : cours <-> session
 & etudiant : inscription +-> groupecours
 & id(COURS) /\ prealable = {}
 & !(cc,ss,mm).((cc:cours & ss:session & mm:matricule) => (ran({mm} <| enseignant)/\ran({((cc|->ss)|->mm)} <| etudiant) = {}))
 & !(cc,ss,mm,gg).((cc:cours & ss:session & mm:matricule & gg:groupecours & gg: ran({cc} <| groupe)) => (ran({mm} <| enseignant)/\ran({((cc|->ss)|->mm)} <| (etudiant |> {gg})) = {}))
 & !(cc,ss,mm,g1,g2).((cc:cours & ss:session & mm:matricule & g1:groupecours & g2:groupecours & g1 /= g2 & g1:ran({((cc|->ss)|->mm)} <| etudiant) & g2:ran({((cc|->ss)|->mm)} <| etudiant))=>( dom(groupe |> {g1}) /\ dom(groupe |> {g2}) = {} ))
 & !(c1, c2, ss, mm).((c1:cours & c2:cours & c1 : {prealable(c2)} & ss:session & mm:matricule) => (ran({((c1|->ss)|->mm)} <| note) = {1}))
 
INITIALISATION
 cours := { c1, c2 }
 || session := { s1 }
 || groupecours := { gc1, gc2, gc3 }
 || matricule:= { m1, m2 }
 || inscription := {}
 || enseignant := {(m1|->gc1), (m1|->gc2)}
 || prealable := {}
 || accessibilite := {c1|->s1,c2|->s1}
 || etudiant := {}
 || note := {}
 || groupe := {(c1|->gc1), (c1|->gc2)}
OPERATIONS
 Inscrire(mat, sig, sess)=
  PRE
   mat : MATRICULE
   & mat : matricule
   & sig : COURS
   & sig : cours
   & sess : SESSION
   & sess : session
   & (sig|->sess) : accessibilite
   & !(gg).((gg:groupecours & gg:ran({sig} <| groupe)) => ((mat|->gg) /: enseignant))
   & !(cc, ss).((cc : cours & cc : {prealable(sig)} & ss : session) => (0 /: {note( ((cc|->ss)|->mat) )}))
   & ((sig|->sess)|->mat) /: inscription
  THEN
   inscription := inscription \/ {((sig|->sess)|->mat)}
  END;
 Affecter_groupe_cours(mat, sig, sess, group)=
  PRE
   mat : MATRICULE
   & mat : matricule
   & sig : COURS
   & sig : cours
   & sess : SESSION
   & sess : session
   & group : GROUPECOURS
   & group : groupecours
   & ((sig|->sess)|->mat) : inscription
   & (sig|->sess) : accessibilite
   & (mat|->group) /: enseignant
   & (sig|->group) : groupe
   & !(gg).((gg:groupecours & gg:ran({((sig|->sess)|->mat)} <| etudiant))=>( dom(groupe |> {gg}) /\ dom(groupe |> {group}) = {} ))
  THEN
   etudiant := etudiant \/ {(((sig|->sess)|->mat)|->group)}
  END
END

