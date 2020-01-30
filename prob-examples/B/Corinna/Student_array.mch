MODEL
   Student_array(maxsize, STUDENT)

CONSTRAINTS maxsize : NAT & maxsize > 0 & card(STUDENT) : NATURAL

EXTENDS Array(maxsize, STUDENT)

OPERATIONS 
ix <-- find(lim, st) =
   PRE lim : 1..maxsize & st : STUDENT & 1.. lim <: dom(arr)
   THEN IF arr~[{st}] /\ 1..lim /= {}
      THEN ix :: arr~[{st}]
      ELSE ix := 0
      END
   END

END