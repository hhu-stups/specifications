MACHINE UGraphsFunctions
DEFINITIONS
  EXTERNAL_FUNCTION_CLOSURE1(T) == (T<->T) --> (T<->T);
  CLOSURE1(relation) == relation;
  EXTERNAL_FUNCTION_SCCS(T) == (T<->T) --> POW(POW(T));
  SCCS(relation) == {}
SETS
 Node={adown,aup,bdown,bup,cdown,cup,ddown,dup}
CONSTANTS nxt, equiv
PROPERTIES
 nxt = {dup|->aup,aup|->bup,bup|->cup, cup|->adown, adown|->ddown,
        bdown|->adown, cdown |->bdown, aup |-> cdown}
&
 equiv = {(aup,adown),(bup,bdown),(cup,cdown),(dup,ddown)} \/
         {(aup,adown),(bup,bdown),(cup,cdown),(dup,ddown)}~ \/
         id(Node)
 ASSERTIONS
  CLOSURE1({dup|->aup} /\ {}) = {};
  CLOSURE1(nxt) = closure1(nxt);
  CLOSURE1(nxt~) = closure1(nxt~);
  CLOSURE1(nxt \/ nxt~) = closure1(nxt \/ nxt~);
  SCCS({1|->2,2|->1,2|->3,3|->4,4|->3}) = {{1,2}, {3,4}};
  SCCS(nxt \/ nxt~) = {Node}
END

