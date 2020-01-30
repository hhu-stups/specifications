MACHINE SimpleComputation
CONSTANTS limit, a, b, x
PROPERTIES
 a = 1..limit & b = (-limit .. -1) &
 x = a \/ b &

 limit = 100
END

/*

kodkod ok:   limit = 100  ints: irange(100,100), intatoms: none
kodkod ok:   a = 1 .. limit  ints: irange(1,100), intatoms: irange(1,100)
kodkod fail: b = -limit .. -1  , reason: unsupported expression unary_minus/1: -limit while translate and type Kodkod formula
kodkod ok:   x = a \/ b  ints: none, intatoms: irange(-100,100)
nr_of_components(1)
% finished_processing_component_predicates
% grounding_wait_flags
de.stups.probkodkod.parser.parser.ParserException: [6,38] expecting: number
	at de.stups.probkodkod.parser.parser.Parser.parse(Parser.java:863)
	at de.stups.probkodkod.KodkodInteraction.interaction(KodkodInteraction.java:53)
	at de.stups.probkodkod.KodkodInteraction.main(KodkodInteraction.java:95)
unsatisfiable_component(1)
Some solutions were found:
limit/int(100)
no_sol_for(a)


*/