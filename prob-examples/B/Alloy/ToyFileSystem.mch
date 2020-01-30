MACHINE ToyFileSystem
SETS
 OBJ
/* An attempt at translating the ToyFileSystem from Ermina Torlak's thesis
   into B such that we have the same symmetries 
   The B version differs from the Alloy in that no enumerated sets are used
   (in Alloy: File <: {f0,f1,f2}, Dir <: {d0,d1})
   so that we can use ProB's symmetry detection. On the other hand, this
   allows more instantiations for Dir,File without symmetry.
*/
CONSTANTS root, File, Dir, contents
PROPERTIES
 root: Dir &
/* Dir \/ File = OBJ & */
 Dir /\ File = {} &
 card(OBJ) = 5 & card(Dir) <= 2 & card(File) <= 3 &
 contents : Dir <-> OBJ &
 !d.(d:Dir => d /: contents[{d}]) &
 (File \/ Dir) <: closure(contents)[{root}]
END

