MACHINE InsertionSortUsingClosure
ABSTRACT_CONSTANTS fsortacc, fsort /* flexible sort */
PROPERTIES
 fsortacc = %minf.(minf: POW(INTEGER) <-> INTEGER |
             %(x,acc).(x:POW1(INTEGER) & acc:INTEGER<->INTEGER|
                   LET y BE y=minf(x) IN
                    (x \ {y} |-> (acc<-y))
                    END))
                   &
 fsort = %minf.(minf: POW(INTEGER) <-> INTEGER |
          %x.(x:POW(INTEGER)|
              closure1(fsortacc(minf))[{x|->[]}]({})
               ))
ASSERTIONS
  fsort(%i.(i:POW(INTEGER)|min(i))) ({3,1,9}) = [1,3,9];
  fsort(%i.(i:POW(INTEGER)|max(i))) ({3,1,9}) = [9,3,1]
END
