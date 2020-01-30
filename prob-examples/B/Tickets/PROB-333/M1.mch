MACHINE M1
SEES M2
DEFINITIONS myTRUE == (aa/=bb)
ASSERTIONS
 !(a).(a:ID => card(ID-{a}) = 1);
 #aa.(not(myTRUE)); /* check that local aa used instead of aa enumerated set */
 {aa|myTRUE} = {aa}
PROPERTIES
 !(a).(a:ID => card(ID-{a}) = 1)
END

/*

Beispiele die sich in der Konsole verschieden Verhalten

#(a).(a:NAT)
#(x).(x:NAT)

!(a).(a:ID => card(ID-{a}) = 1)
!(ab).(ab:ID => card(ID-{ab}) = 1)

>>> #a.(a:NAT)
Existentially Quantified Predicate over a is FALSE
% #(a).(a : NAT)
must_fail_det(1,[],
b(exists([b(identifier(a),integer,[nodeid(pos(nan,1,1,2,1,2)),introduced_by(exists)])],b(member(b(identifier(a),integer,[nodeid(pos(nan,1,1,5,1,5)),introduced_by(exists)]),b(integer_set('NAT'),set(integer),[nodeid(pos(nan,1,1,7,1,7))])),pred,[nodeid(pos(nan,1,1,5,1,7))])),pred,[used_ids([]),nodeid(pos(nan,1,1,1,1,10))])).


>>> #b.(b:NAT)
Existentially Quantified Predicate over b is TRUE
Solution: 
       b = 0

>>> $$
% Type: pred
% Eval Time: 0 ms (0 ms walltime)
% #(b).(b : NAT)
b(exists([b(identifier(b),integer,[nodeid(pos(nan,1,1,2,1,2)),introduced_by(exists)])],b(member(b(identifier(b),integer,[nodeid(pos(nan,1,1,5,1,5)),introduced_by(exists)]),b(integer_set('NAT'),set(integer),[nodeid(pos(nan,1,1,7,1,7))])),pred,[nodeid(pos(nan,1,1,5,1,7))])),pred,[used_ids([]),nodeid(pos(nan,1,1,1,1,10))])
% = true



*/