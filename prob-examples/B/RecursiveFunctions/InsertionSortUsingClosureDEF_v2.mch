MACHINE InsertionSortUsingClosureDEF_v2 // not using types
DEFINITIONS
 fsortacc(minf) ==
             %(x,acc).(x /= {} //& x:POW(ElTYPE) & acc:INTEGER<->ElTYPE
                   |
                   LET y BE y=minf(x) IN
                    (x \ {y} |-> (acc<-y))
                    END);
 fsort(minf) ==
          %x.(1=1 //x:POW(ElTYPE)
             |
              closure1(fsortacc(minf))[{x|->[]}]({})
               )
ABSTRACT_CONSTANTS
  mymin, minpair
PROPERTIES
  mymin = %i.(i:POW(INTEGER)|min(i)) &
  minpair = %i.(i:POW(INTEGER*INTEGER)| min(dom(i)) |-> min( i[{min(dom(i))}]) )
ASSERTIONS
  fsort(mymin) ({3,1,9}) = [1,3,9];
  fsort(%i.(i:POW(INTEGER)|max(i))) ({3,1,9}) = [9,3,1];
  fsort(minpair) ({3|->7,1|->10,9|->3,3|->3}) = {(1|->(1|->10)),(2|->(3|->3)),(3|->(3|->7)),(4|->(9|->3))};
 1=1
END
