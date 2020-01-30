MACHINE TotFunAnalyseTest
SETS
 ID={aa,bb}
CONSTANTS f
PROPERTIES
 f = {aa |->2, bb|->3}
ASSERTIONS
 f: ID --> INTEGER &
 f: {aa} --> {0,1} &
 f: {aa} -->> {2,3} &
 f: {aa,bb} +->> {2,3,4} &
 f: {aa} +-> INTEGER
END

