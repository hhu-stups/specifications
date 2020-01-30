MACHINE TestParserFunLaw
VARIABLES ff,gg
INVARIANT
 ff:INT+->INT & gg:INT+->INT &
 dom(dom(gg)<<|ff) = dom(ff)-dom(gg) 
INITIALISATION ff,gg:={},{}
END

