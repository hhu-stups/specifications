MACHINE Login_with_expire_proof
SETS Session
VARIABLES active,expire,h,login_enabled,logout_enabled
DEFINITIONS
  INV == (active<:Session & expire<:Session & active /\ expire = {} & h<: POW(Session) &
  login_enabled: BOOL & logout_enabled:BOOL &
  (login_enabled=TRUE <=> #s.(s:Session & s/: active & s/:expire)) &
  (logout_enabled=TRUE <=> #(s,e).(s: active & e: BOOL)) 
  )
INVARIANT 
  INV
INITIALISATION active,expire,h,login_enabled,logout_enabled : (INV)
OPERATIONS        
   MyPermute = ANY myperm WHERE myperm: Session >->> Session THEN
                 active := myperm[active] ||
                 expire := myperm[expire] ||
                 h := { h2 | h2: POW(Session) & #el.(el:POW(Session) & el: h & h2 = myperm[el]) }
               END
END