MACHINE NastySetComprehensions
SETS
   COLOURS = {red,green,blue};
   ID = {ia,ib,c,iid}
CONSTANTS f,g
PROPERTIES 
    f: COLOURS --> ID &
    g: ID --> COLOURS &
    !x.(x:COLOURS => g(f(x)) = x) &
    f(red) = ia & f(green) = ib
DEFINITIONS
    SET_PREF_MAX_INITIALISATIONS == 10;
    MYID1 == {ii|ii:ID & ii:{i|i:ID & f(g(i)) /= i} or ii:{i|i:ID & f(g(i)) = i}};
    MYID2 == {ii|ii:MYID1 & ii:{i|i:MYID1 & f(g(i)) /= i} or ii:{i|i:MYID1 & f(g(i)) = i}};
    MYCOLOURS1 == {c|c:COLOURS & #z.(z:ID & z=f(c) & g(z) = c)} ;
    MYCOLOURS2 == {c|c:MYCOLOURS1 & #z.(z:ID & z=f(c) & g(z) = c)} ;

    MYCOLOURS3 == {c|c:MYCOLOURS2 & #z.(z:MYID2 & z=f(c) & g(z) = c)};

    MYIDFA == {ii| ii:MYID2 & f(g(ii))=ii or !c.(c:MYCOLOURS3 => f(c) /= ii) } ;
    MYCOLOURS4 == {c|c:MYCOLOURS3 & #z.(z:MYIDFA & z=f(c) & g(z) = c)};

    MYIDFA2 == {ii| ii:MYIDFA & f(g(ii))=ii or !c.(c:MYCOLOURS4 => f(c) /= ii) }
ASSERTIONS
    card({i|i:ID & f(g(i)) /= i}) = 1;
    {i|i:ID & f(g(i)) /= i} = {i|i:ID & #z.(z:COLOURS & z = g(i) & f(z) /= i)};
    card({i|i:ID & #z.(z:COLOURS & z = g(i) & f(z) /= i)}) = 1;
    {c|c:COLOURS & g(f(c)) = c} = COLOURS;
    {c|c:COLOURS & #z.(z:ID & z=f(c) & g(z) = c)} = COLOURS;
    {c|c:MYCOLOURS2 & #z.(z:ID & z=f(c) & g(z) = c)} = COLOURS;
    {c|c:MYCOLOURS3 & #z.(z:MYID2 & z=f(c) & g(z) = c)} = COLOURS;
    MYIDFA = ID;
    MYIDFA2 = ID
VARIABLES cc,ii
INVARIANT
    cc:COLOURS & ii:ID 
INITIALISATION cc := red || ii :: ID
OPERATIONS
  r <-- FG(yy) = PRE yy:ID THEN r:= f(g(yy)) END;
  r <-- NonFix = BEGIN r := {i|i:ID & f(g(i)) /= i} END;
  r <-- NonFix2 = BEGIN r := {i|i:ID & #zz.(zz:COLOURS & zz = g(i) & f(zz) /= i)} END;
  r <-- NonFix3 = BEGIN r := {i|i:MYID2 & #zz.(zz:MYCOLOURS3 & zz = g(i) & f(zz) /= i)} END
END

