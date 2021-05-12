MACHINE Partition
/* Beschreibung der (unordered) partition refinement fuer
   gerichtete Graphen mit Labels */
/* Sehr langsam in ProB wenn Lazy expansion of lambdas in
   Animation Preferences eingestellt ist */
SETS Nodes= {n1,n2,n3,n4};Labels= {la,lb,lc}
DEFINITIONS
  SET_PREF_SYMBOLIC == FALSE;
  transparts(e1,ll) == ({p1 | p1: POW(Nodes) & p1:partition & p1 /\ trans(e1)(ll) /= {}});
  LTS1 == ( trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {n1} },
                      n2 |-> {la |-> {}, lb|-> {n1,n4}, lc |-> {n2}},
                      n3 |-> {la |-> {}, lb|-> {n3}, lc |-> {n1,n4}},
                      n4 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {n4}}  }   );
  LTS2 == ( trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {}, lc |-> {}},
                      n3 |-> {la |-> {n4}, lb|-> {}, lc |-> {}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {n4}}  }  )
CONSTANTS trans
PROPERTIES trans: Nodes --> (Labels --> POW(Nodes)) & LTS1
VARIABLES
  partition
INVARIANT partition<: POW(Nodes) &
          union(partition) = Nodes &
          !(p1,p2).(p1:partition & p2:partition & p1 /= p2 => p1 /\ p2 = {})
INITIALISATION
   partition := { Nodes }
OPERATIONS
  refine_out_partition(p,p2,e1,e2,ll,out1) =
   /* man kann die Unterpartition p splitten: die Konnektivitaet von e1:p nach p2
      ist out1 und ist verschieden von der Konnektivitaet von e2:p nach p2*/
    PRE p:partition & p2:partition & /* note p2 can be p */
        e1:p & e2:p & e1 /= e2 & ll:Labels & out1:NAT &
        out1 = card(trans(e1)(ll) /\ p2) &
        card(trans(e2)(ll) /\ p2) > out1 THEN
        partition := partition - {p} \/
             { {n1 | n1: Nodes & n1:p & card(trans(n1)(ll) /\ p2) = out1 },
               {n2 | n2: Nodes & n2:p & card(trans(n2)(ll) /\ p2) /= out1 } } 
    END;
  refine_in_partition(p,p2,e1,e2,ll,in1) =
   /* man kann die Unterpartition p splitten: die Konnektivitaet von p2 nach e1:p
      ist in1 und ist verschieden von der Konnektivitaet von p2 nach e2:p */
    PRE p:partition & p2:partition & /* note p2 can be p */
        e1:p & e2:p & e1 /= e2 & ll:Labels & in1:NAT &
        in1 = card({ee1|ee1:Nodes & ee1:p2 & e1: trans(ee1)(ll) }) &
        card({ee2|ee2:Nodes & ee2:p2 & e2:trans(ee2)(ll) }) > in1 THEN
        partition := partition - {p} \/
             { {n1 | n1: Nodes & n1:p & card({ee3|ee3:Nodes & ee3:p2 & n1:trans(ee3)(ll)}) = in1 },
               {n2 | n2: Nodes & n2:p & card({ee4|ee4:Nodes & ee4:p2 & n2:trans(ee4)(ll)}) /= in1 } } 
    END
END