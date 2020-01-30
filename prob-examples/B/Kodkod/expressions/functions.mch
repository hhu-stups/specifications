MACHINE functions
SETS
  A={a,b,c};
  S={s,t,u}
CONSTANTS
  B,T,
  total,
  tot_injective,
  tot_surjective,
  tot_bijective,

  partial,
  part_injective,
  part_surjective,
  part_bijective  
PROPERTIES
  B = {a,b} & T = {s,t} &
  total : B --> S &
  tot_injective : B >-> T &
  tot_surjective : A -->> T &
  tot_bijective : A >->> S &

  total(a) = s & u:ran(total) &
  tot_injective(a) = t &
  tot_surjective(a) = tot_surjective(b) & a|->s : tot_surjective &
  {a|->u,b|->s} <: tot_bijective &

  partial : A +-> S &
  part_injective : A >+> T &
  part_surjective : A +->> {t} &
  part_bijective : A >+>> T &

  partial <: total & a/:dom(partial) &
  dom(part_injective) = {a,c} & part_injective(a) = t &
  dom(part_surjective) = {a,c} &
  dom(part_bijective) = {b,c} & part_bijective(b) = s
  
END
