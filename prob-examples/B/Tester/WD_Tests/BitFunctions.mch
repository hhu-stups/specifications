MACHINE BitFunctions
ABSTRACT_CONSTANTS
  countLeadingZeroesUI8, countLeadingZeroesUI16
CONSTANTS countLeadingZeroesUI4
PROPERTIES
        countLeadingZeroesUI4 ={0|->4,1|->3,2|->2,3|->2,
                    4|->1,5|->1,6|->1,7|->1,
                    8|->0,9|->0,10|->0,11|->0,
                    12|->0,13|->0,14|->0,15|->0} &

        countLeadingZeroesUI8:(0..((2**8)-1))--> INTEGER &
        countLeadingZeroesUI8 = %ui.(ui:0..((2**8)-1) |
           IF ui > (2**4)-1 THEN countLeadingZeroesUI4(ui/(2**4)) ELSE 4+countLeadingZeroesUI4(ui) END) &

        countLeadingZeroesUI16:(0..((2**16)-1))-->INTEGER &
        countLeadingZeroesUI16 = %ui.(ui:0..((2**16)-1) |
           IF ui > (2**8)-1 THEN countLeadingZeroesUI8(ui/(2**8)) ELSE 8+countLeadingZeroesUI8(ui) END)

ASSERTIONS
        countLeadingZeroesUI8:(0..((2**8)-1))-->(0..8); // this can now be checked quickly
        countLeadingZeroesUI16:(0..((2**16)-1))-->(0..16);
        not(# d.(d:dom(countLeadingZeroesUI8) & countLeadingZeroesUI8(d)<0));
        not(# d.(d:dom(countLeadingZeroesUI8) & countLeadingZeroesUI8(d)>8));
        not(# d.(d:dom(countLeadingZeroesUI16) & countLeadingZeroesUI16(d)<0));
        not(# d.(d:dom(countLeadingZeroesUI16) & countLeadingZeroesUI16(d)>16))
END

