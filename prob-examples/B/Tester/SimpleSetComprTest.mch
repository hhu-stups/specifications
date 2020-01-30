MACHINE SimpleSetComprTest
SETS
 COLOURS={red,green,blue}
CONSTANTS sel_colour,norm_colour
PROPERTIES
 sel_colour=red & norm_colour=blue
VARIABLES DisColours
INVARIANT
 DisColours: 1..3 +-> COLOURS
INITIALISATION DisColours := {nn,cc | nn: 1..3 & cc : COLOURS &
                                     ((nn=1 & cc = sel_colour) or
                                      (nn /= 1 & cc=norm_colour))}
OPERATIONS
 col <-- GetCol(mm) = PRE mm:dom(DisColours) THEN
         col := DisColours(mm)
 END;
 SetDisCol2 = BEGIN
   DisColours := {nn,cc | nn: 1..3 & cc : COLOURS &
                   (nn=1 => cc = sel_colour) & (nn /= 1 => cc=norm_colour)}
 END;
 SetDisCol3 = BEGIN
   DisColours := {nn,cc | nn: 1..3 & cc : COLOURS &
                   (nn=1 <=> cc = sel_colour) & (nn /= 1 <=> cc=norm_colour)}
 END
END

