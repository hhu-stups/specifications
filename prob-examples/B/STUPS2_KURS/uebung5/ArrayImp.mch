MODEL ArrayImp

SEES ArrayElem

CONSTANTS length

PROPERTIES length : NAT & length = 5

VARIABLES array

INVARIANT array : 1..length --> ELEMENTS 

INITIALISATION array :: 1..length --> ELEMENTS

OPERATIONS
/*
set_array =
	ANY aa WHERE aa : 1..length --> ELEM  THEN array := aa END  ;
*/

reverse = ANY aa 
	WHERE aa : 1..length --> ELEMENTS &
		 !(i).(i: NAT & i:dom(array) => array(i) = aa(size(array)-i+1)) 
	THEN array := aa
	END
 
END