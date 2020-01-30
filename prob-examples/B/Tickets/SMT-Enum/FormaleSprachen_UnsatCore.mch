MACHINE UnsatCore
/* with SMT clpfd enumeration we get virtual timeouts here */
SETS
  Alphabet  /* Ein Alphabet ist eine endliche, nichtleere Menge von Buchstaben (oder Symbolen). */
  = {a,b,c} 
CONSTANTS   teilwort 
PROPERTIES

  teilwort = {ut,vt|(ut : seq(Alphabet) & vt : seq(Alphabet)) &
         #(vt1,vt2).(vt1 : seq(Alphabet) & vt2 : seq(Alphabet) &
                      (vt1 ^ ut) ^ vt2 = vt) } &
 

  {xx|xx|->[a] : teilwort} = {[],[a]} 
  /*
  {xx|xx|->[a] : teilwort} = {lambda,[a]} 
  (teilwort~)[{[a]}] = {lambda,[a]} 
  (teilwort~)[{[a,a,b]}] = {lambda,[a],[b],[a,a],[a,b],[a,a,b]} */
  
END
