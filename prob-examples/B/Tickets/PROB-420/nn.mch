MACHINE
    nn
SETS
    //Points  =  {s1,s2,s3}//no
    Points  =  {s1,s3,s2}//yes
    //Points  =  {s2,s1,s3}//no
    //Points  =  {s2,s3,s1}//yes
    //Points  =  {s3,s1,s2}//yes
    //Points  =  {s3,s2,s1}//yes
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 9
CONSTANTS
    routes,rouconf
PROPERTIES
    routes:Points<->Points &
    routes={
            (s3|->s2),
            (s2|->s3),
            (s1|->s3)
           } &
    
    rouconf:routes<->POW1(routes) &
    !rc.(rc:rouconf =>
                 #(rcr,rcd).(rcd:dom({rc}) & rcr:ran({rc}) &!se.(se:routes =>{se} <: rcr))
             )
END