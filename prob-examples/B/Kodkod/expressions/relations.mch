MACHINE relations
SETS 
  A={a1,a2,a3,a4};
  B={b1,b2,b3,b4}
CONSTANTS
  r,q,g,
  i,
  s,t,u,
  dres,dnres,rres,rnres,
  c,
  ov,
  cl1,cl
PROPERTIES
  r = {a1|->b2,a1|->b3,a2|->b3,a4|->b4} & 
  i : A <-> A &
  i = id(s) &
  s = dom(r) &
  t = ran(r) &
  u = r~[{b3,b4}] &
  dres = {a1,a4}<|r &
  dnres = {a1,a3,a4}<<|r &
  rres = r|>{b2,b3} &
  rnres = r|>>{b3,b4} &
  q = {b1|->a2,b2|->a3,b3|->a4,b4|->a1} &
  c = (r;q) &
  ov = r <+ {a1|->b4,a3|->b1} &
  g = {a1|->a2,a2|->a3,a3|->a4} &
  cl1 = closure1(g) &
  cl = closure(g)
END
