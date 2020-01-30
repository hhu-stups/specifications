MACHINE function_cards
SETS
  A;B
CONSTANTS
  pfun,dompfun,ranpfun,
  tfun,domtfun,rantfun,
  surj,domsurj,ransurj,
  tinj,dominj,raninj,
  bij,dombij,ranbij,
  psurj,pdomsurj,pransurj,
  pinj,pdominj,praninj,
  pbij,pdombij,pranbij
PROPERTIES
    card(A) = 5 & card(B) = 5

  & dompfun <: A & ranpfun <: B & card(dompfun) = 2
  & pfun : dompfun +-> ranpfun

  & domtfun <: A & rantfun <: B & card(domtfun) = 2
  & tfun : domtfun --> rantfun

  & domsurj <: A & ransurj <: B & card(domsurj) = 2
  & surj : domsurj -->> ransurj

  & dominj <: A & raninj <: B & card(dominj) = 2
  & tinj : dominj >-> raninj

  & dombij <: A & ranbij <: B & card(dombij) = 2
  & bij : dombij >->> ranbij

  & pdomsurj <: A & pransurj <: B & card(pdomsurj) = 2
  & psurj : pdomsurj +->> pransurj

  & pdominj <: A & praninj <: B & card(pdominj) = 2
  & pinj : pdominj >+> praninj

  & pdombij <: A & pranbij <: B & card(pdombij) = 2
  & pbij : pdombij >+>> pranbij

ASSERTIONS
  /* pfun is a partial function, card(pfun) <= card(dompfun) */
  card(pfun) : 0..2;
  card(dompfun) = 2;
  card(ranpfun) : 0..5;

  /* tfun is a total function, card(tfun) = card(domtfun) */
  /*                   TODO: card(rantfun) > 0 */
  card(tfun) = 2;
  card(domtfun) = 2;
  card(rantfun) : 0..5;

  /* surj is a total surjection, card(ransurj) <= card(domsurj)  (+total function above) */
  card(surj) = 2;
  card(domsurj) = 2;
  card(ransurj) : 0..2;

  /* tinj is a total injection, card(raninj) >= card(dominj)  (+total function above) */
  card(tinj) = 2;
  card(dominj) = 2;
  card(raninj) : 2..5;

  /* tinj is a total bijection, card(raninj) = card(dominj)  (+total function above) */
  card(bij) = 2;
  card(dombij) = 2;
  card(ranbij) = 2;

  /* psurj is a partial injection, currently only partial function properties are tested */
  card(pinj) : 0..2;
  card(pdomsurj) = 2;
  card(pransurj) : 0..5;

  /* pinj is a partial injection, currently only partial function properties are tested */
  card(pinj) : 0..2;
  card(pdominj) = 2;
  card(praninj) : 0..5;

  /* pinj is a partial injection, currently only partial function properties are tested */
  card(pbij) : 0..2;
  card(pdombij) = 2;
  card(pranbij) : 0..5
END
