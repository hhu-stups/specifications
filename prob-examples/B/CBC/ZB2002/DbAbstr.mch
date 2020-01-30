MACHINE DbAbstr
/* taken from paper by Mikhailov & Butler, ZB 2002 */
SETS
 STUDENTS; GRADES
VARIABLES abstDb
INVARIANT
 abstDb : STUDENTS +-> GRADES
INITIALISATION abstDb:={}
OPERATIONS
  append(st,gr) = PRE st:STUDENTS & gr:GRADES & st /: dom(abstDb) THEN
     abstDb := abstDb \/ {st|->gr}
  END
END

