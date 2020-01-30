MACHINE Mikrowelle /* Modell von Larissa Pohler */
SETS
 TIME={sec0,sec15,sec30,min1,sec90,min2,min3}
CONSTANTS timetable /*"Zeitablauf"*/
PROPERTIES  timetable : perm(TIME)&
	    timetable(1)=sec0 &
	    timetable(2)=sec15 &
	    timetable(3)=sec30 &
	    timetable(4)=min1 &
	    timetable(5)=sec90 &
	    timetable(6)=min2 &
	    timetable(7)=min3 
DEFINITIONS
/* Wenn die Mikrowelle heizt ist die Tuer zu und kann nicht geoeffnet werden*/
ASSERT_LTL_1=="G({mag=TRUE}=>({tuer=TRUE} & not e(open)))";
/* Wenn die Mikrowelle heizt, ist die Garzeit nicht 0*/
ASSERT_LTL_2=="G({mag=TRUE}=>((not {i=1}) & not({uhr=sec0})))";
/*Die Mikrowelle kann jeder Zeit gestoppt werden */
ASSERT_LTL_3=="G({mag=TRUE}&({S=TRUE} or {i=1})=>(e(stop)))";
/* Die Mikrowelle heizt nicht dauerhaft*/
ASSERT_LTL_4=="F({mag=FALSE})";
ASSERT_LTL_5=="{mag=TRUE}=>F({mag=FALSE})";
/*Waehrend die Mikrwelle heizt laesst sich die Zeit nicht verstellen*/
ASSERT_LTL_6=="G({mag=TRUE} => (not e(Z_drueck)))";
/*Wenn ein Fehler auftritt, heizt die Mikrowelle nicht*/
ASSERT_LTL_7=="G({error=TRUE} => {mag=FALSE})";
/*Wenn die Mikrowelle heizt, war sie vorher aus und S wurde gedrueckt*/
ASSERT_LTL_8=="({mag=TRUE})=>O({mag=FALSE} &{S=TRUE})";

VARIABLES mag, T, S, uhr, tuer, error, i

INVARIANT
   mag: BOOL & 
   T: BOOL &
   S: BOOL & 
   uhr: ran(timetable) & 
   tuer: BOOL & 
   error:BOOL & 
   i:INTEGER & 
   i: 1..7
INITIALISATION 
	mag:=FALSE ||
	T:=FALSE ||
	S:=FALSE ||
	tuer:=TRUE ||
	error:=FALSE ||
	i:=1||
	uhr:=sec0
OPERATIONS
 S_drueck = PRE error=FALSE THEN 
			IF S=FALSE THEN S:=TRUE 
				ELSE S:=FALSE END 
	END;
 T_drueck = PRE error=FALSE & 
		T=FALSE THEN T:=TRUE 
	END;
 Z_drueck = PRE error=FALSE & mag=FALSE THEN 
			IF i<7 THEN 
				i:=i+1 ||
				uhr:= timetable(i+1) 
			       ELSE 
				i:=1 ||
				uhr:= timetable(1) END
	END;
 close = PRE error=FALSE &
	     tuer=FALSE THEN 
			 tuer:=TRUE ||
			 T:=FALSE 
	END;
 open = PRE error=FALSE &
	    mag=FALSE & 
	    tuer=TRUE & 
	    T=TRUE THEN 
			tuer:=FALSE 
	END;
 start =PRE error =FALSE & 
	    S=TRUE &
            mag=FALSE & 
	    tuer=TRUE & 
	    i>= 2 THEN 
			mag:=TRUE ||
			S:=FALSE 
	END;
 laufe = PRE error=FALSE & 
	     mag=TRUE & 
             S=FALSE & 
	     i>=1 THEN 
			IF i>2
			  THEN i:=i-1 ||
			       uhr:=timetable(i-1)
			  ELSE mag:=FALSE ||
			       i:=1 ||
			       uhr:=timetable(1)
			   END
	END;
 stop = PRE error=FALSE &
	    mag=TRUE &
	    S=TRUE THEN mag:=FALSE || 
			S:=FALSE 
	END;
 
 fehler = PRE error=FALSE THEN error:=TRUE ||
			       mag:=FALSE 
	END;
 reset = PRE error=TRUE THEN 
			error,mag,i,uhr:=FALSE,FALSE, 1, timetable(1)
	 END;
 reset_all = BEGIN mag:=FALSE ||
		   T:=FALSE || 
		   S:=FALSE ||  
		   tuer:=TRUE ||
                   error:=FALSE ||
                   i:=1 ||
		   uhr:=sec0
	END;
 Zeit,Status<-- anzeige  = BEGIN Zeit:=uhr ||
					IF mag=TRUE 
						THEN Status:="Ein"
 						ELSE Status:="Aus"END 
	END
END

