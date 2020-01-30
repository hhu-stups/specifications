MACHINE RelLaws_Simplified
SETS
setX = {el1,el2}; setY = {y1,y2}

CONSTANTS
ff
PROPERTIES
 ff: setX <-> setY & 
 !x.(x:dom(ff) => fnc(ff)(x) = ff[{x}])  /* b_ast_cleanup would apply the function(lambda,x) rule only when
  pretty printing and loading again */
END