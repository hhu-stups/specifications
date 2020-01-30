MACHINE triples
SETS
  A={a,b,c};
  S={s,t,u}
DEFINITIONS
  sela(x) == prj1(A,INTEGER)(prj1(A*INTEGER,S)(x));
  seli(x) == prj2(A,INTEGER)(prj1(A*INTEGER,S)(x));
  sels(x) == prj2(A*INTEGER,S)(x);
CONSTANTS
  aval, sval, triples
PROPERTIES
    aval : A --> 0..2
  & sval : S --> 3..9
  & aval = {a|->0,b|->1,c|->2}
  & sval = {s|->3,t|->6,u|->9}
  & triples : POW(A * (0..11) * S)
  & !t.(t:triples => seli(t) = aval(sela(t))+sval(sels(t)))
  & ran(dom(triples)) = {9,4,8}
END
