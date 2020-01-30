MACHINE BMachineAll
DEFINITIONS
	SET_PREF_MININT == -5;
	SET_PREF_MAXINT == 5;
	SET_PREF_MAX_OPERATIONS == 1;
	SET_PREF_MAX_INITIALISATIONS == 1;
	TypEnvironment == nodesapos : POW(SuperNODES) & SuperNODES /= {} & edgesapos : POW((SuperNODES * SuperNODES));
	Hypotheses == TypEnvironment & ((edgesapos)~ = edgesapos) & (nodesapos <: NODES) & (dom(edgesapos) = nodesapos) & (edgesapos : (nodesapos <-> nodesapos)) & (dom(edgesapos) <: NODES) & (edgesapos : (dom(edgesapos) <-> dom(edgesapos)));
	Goal == # (x,y).((x : NODES & y : NODES) & ((x : dom(edgesapos)) & (y : dom(edgesapos)) & not((x = y)) & (card((edgesapos[{x}])) = card((edgesapos[{y}])))));
	scope_SuperNODES == 1..20;
SETS
 	SuperNODES
VARIABLES varedgesapos,NODES,varnodesapos
INVARIANT varedgesapos : POW((SuperNODES * SuperNODES)) & NODES <: SuperNODES & varnodesapos : POW(SuperNODES)
INITIALISATION NODES :: POW1(SuperNODES) || 
	ANY nodesapos,edgesapos WHERE Hypotheses
	THEN varnodesapos:=nodesapos || varedgesapos:=edgesapos 
	END
OPERATIONS
	 disproveHypotheses(nodesapos,edgesapos) = PRE Hypotheses & not(Goal) THEN varnodesapos:=nodesapos || varedgesapos:=edgesapos END;
	 increm(x0) = PRE x0 : SuperNODES & x0 /: NODES
	 THEN NODES := NODES \/ {x0}
	 END
END

