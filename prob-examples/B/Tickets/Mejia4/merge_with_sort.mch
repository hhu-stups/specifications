MACHINE
	merge
INCLUDES SortSet
DEFINITIONS SET_PREF_MAXINT == 100
CONSTANTS
	absc
,	grad

PROPERTIES
	absc =
	[	[0,14875,29802,44882,60940,79742,103440]
	, 	[0,14900,29793,44718,60776,79423,102998]
	]
&	grad =
	[	[14990324,11672045,8369985,5234303,2367125,-109355,-1858892]
	, 	[15048140,11734816,8397153,5240256,2356112,-143714,-1875280]
	]

VARIABLES
	absc1
,	grad1

INVARIANT
	absc1 : seq (INTEGER)
&	grad1 : seq (INTEGER)
&	size (absc1) = size (grad1)

INITIALISATION
	absc1 := <>
||	grad1 := <>

OPERATIONS
	MERGE_Sort = BEGIN
            absc1 := sort(UNION (ind1).(ind1 : dom (absc) | ran (absc (ind1))))
	END;
        FinishedSkip = skip
END
