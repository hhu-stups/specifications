MACHINE Countries
SETS
 Country={France, Germany, Belgium, Spain, Italy, Switzerland, Portugal, Austria, Netherlands, England, Scotland};
 City = {Paris, Lyon, Bruxelles, Aachen, Liege, Koeln, Duesseldorf, Berlin, Madrid, Wien, Bern, Lisbon, Rome, Amsterdam, Antwerpen, Rotterdam, Aix_en_Provence, Marseille,London,Edinburgh}

CONSTANTS neighbour,nxt, capital, tgv1, tgv
PROPERTIES
 neighbour = {France |-> Germany, France |-> Belgium, France |-> Switzerland,
        France |-> Italy, France |-> Spain,
        Spain |-> Portugal,
        Belgium |-> Germany, Belgium |-> Netherlands,
        Germany |-> Austria, Germany |-> Netherlands,
        Austria |-> Switzerland, Austria |-> Italy,
        Switzerland |-> Italy,
        England |-> Scotland
     } &
  nxt = neighbour \/ neighbour~ &
  capital = {France |-> Paris, Germany |-> Berlin, Belgium |-> Bruxelles,
             Austria |-> Wien, Switzerland |-> Bern, Spain |-> Madrid,
             Portugal |-> Lisbon, Italy |-> Rome, England |-> London,
             Scotland |-> Edinburgh} &
  tgv1 = {Paris |-> Bruxelles, Bruxelles |-> Liege, Liege |-> Aachen,
         Aachen |-> Koeln, Koeln |-> Duesseldorf, Bruxelles |-> Antwerpen,
         Antwerpen |-> Rotterdam, Rotterdam |-> Amsterdam,
          Paris |-> Lyon, Lyon |-> Aix_en_Provence, Aix_en_Provence |-> Marseille} &
  tgv = tgv1 \/ tgv1~
VARIABLES cur
INVARIANT
 cur:City
INITIALISATION cur:=Paris
OPERATIONS
  Go(to) = PRE cur|->to : tgv THEN cur:= to END
END

/*
 Demo examples for ProB shell:
  capital~(Paris)
  closure1(tgv)[{Duesseldorf}] /\ ran(capital)
  !x.(x:Country => closure1(nxt)[{x}] = Country)
  Country - dom(capital)
  col : Country --> 1..3 & !(x,y).(x|->y:neighbour => col(x) /= col(y))
  col : City --> 1..3 & !(x,y).(x|->y:tgv => col(x) /= col(y))


DEFINITIONS path(p,n,X,Y) == (n=size(p) & n<=card(City) & p:iseq1(City) & p(1)=X & last(p)=Y & !i.(i:1..(n-1) => p(i)|->p(i+1):tgv))
*/

