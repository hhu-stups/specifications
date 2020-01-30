MACHINE RecursiveEnumEquation
SETS
 ID={aa,bb,cc,dd,ee,ff}
ABSTRACT_CONSTANTS x,nxt,root
PROPERTIES
 nxt = {aa|->bb,bb|->cc,cc|->dd,dd|->ee,ee|->ff,ff|->aa} &
 root =  {aa|->ff,bb|->dd,cc|->dd,dd|->ff,ee|->ff,ff|->dd} &
 x:ID &
 x = root(nxt(x)) /* check that this is not treated like a recursive function */
ASSERTIONS
 x=ff
END

