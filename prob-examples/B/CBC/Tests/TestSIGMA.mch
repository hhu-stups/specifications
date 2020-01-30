MACHINE TestSIGMA
 /* test performance of Sigma constraint */
SETS
   lam={mod11,mod12,mod13,mod14,mod15,mod16,mod17,mod18,mod19,mod20,mod21,mod22,mod23,mod24,mod25,mod26}
DEFINITIONS
  "LibraryIO.def";
  SET_PREF_MAX_INITIALISATIONS == 10;
  SET_PREF_TIME_OUT == 50000
CONSTANTS
   minCreditPoints,maxCreditPoints, creditPoints, choices
PROPERTIES
 minCreditPoints=20 &
 maxCreditPoints=20 &
 creditPoints = {(mod11|->10),(mod12|->10),(mod13|->5),(mod14|->5),
                 (mod15|->5),(mod16|->10),(mod17|->10),(mod18|->10),
                 (mod19|->5),(mod20|->5),(mod21|->5),(mod22|->10),
                 (mod23|->5),(mod24|->5),(mod25|->5),(mod26|->5)}
  &
  choices = {choice | choice: lam --> BOOL & SIGMA(module).(module: lam | IF choice(module)=TRUE THEN creditPoints(module) ELSE 0 END) : minCreditPoints..maxCreditPoints}
   // Note: the IF-THEN-ELSE means that ProB can expand the domain of the SIGMA fully
ASSERTIONS
 card(choices) = 495;

 // choices = {choice | choice: lam --> BOOL & SIGMA(module).(module: choice~[{TRUE}] | creditPoints(module)) = minCreditPoints};
 // 25 seconds; because ProB cannot expand the SIGMA domain;
 // TO DO: automatically insert IF-THEN-ELSE or improve Sigma treatment in kernel

 choices = {choice | choice: lam --> BOOL & SIGMA(module).(module: lam | IF choice(module)=TRUE THEN creditPoints(module) ELSE 0 END) = minCreditPoints}; // 0.05 seconds
 choices = {choice | choice: lam --> BOOL & SIGMA(module).(module: lam | IF choice(module)=TRUE THEN creditPoints(module) ELSE 0 END) : minCreditPoints..maxCreditPoints} // 0.05 seconds
END