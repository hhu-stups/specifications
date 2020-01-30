MACHINE SubsetFail
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT xx<:{aa}
INITIALISATION
  xx := {aa}
ASSERTIONS /* all FALSE */
  xx \/ {bb} <: ID \ {iv};
  xx <: {bb};
  {xx,{},{bb}} : POW(POW({bb}))
END

