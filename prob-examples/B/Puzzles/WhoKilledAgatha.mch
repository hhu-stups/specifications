MACHINE WhoKilledAgatha
/*
$ Who killed agatha? (The Dreadsbury Mansion Murder Mystery) in Essence'.
$
$ This is a standard benchmark for theorem proving.
$
$ http://www.lsv.ens-cachan.fr/~goubault/H1.dist/H1.1/Doc/h1003.html
$
$ """ 
$ Someone in Dreadsbury Mansion killed Aunt Agatha. 
$ Agatha, the butler, and Charles live in Dreadsbury Mansion, and 
$ are the only ones to live there. A killer always hates, and is no 
$ richer than his victim. Charles hates noone that Agatha hates. Agatha 
$ hates everybody except the butler. The butler hates everyone not richer 
$ than Aunt Agatha. The butler hates everyone whom Agatha hates. 
$ Noone hates everyone. Who killed Agatha? 
*/
SETS
 Persons = {Agatha, butler, Charles}
CONSTANTS hates, richer, killer,victim /* Typing : 2,359,296 candidate solutions */
PROPERTIES
 hates : Persons <-> Persons &
 richer : Persons <-> Persons &  /* richer /\ richer~ = {} & */
 richer /\ id(Persons) = {} &
 !(x,y,z).(x|->y:richer & y|->z:richer => x|->z:richer) &
 !(x,y).(x:Persons & y:Persons & x/=y => (x|->y:richer <=> y|->x /: richer)) &
 
 killer : Persons &   victim : Persons &
 killer|->victim : hates & /* A killer always hates his victim */
 killer|->victim /: richer & /* and is no richer than his victim */
 hates[{Agatha}] /\ hates[{Charles}] = {} & /* Charles hates noone that Agatha hates. */
 hates[{Agatha}] = Persons - {butler} & /* Agatha hates everybody except the butler. */
 !x.( x|->Agatha /: richer => butler|->x : hates) & /* The butler hates everyone not richer than Aunt Agatha */
 hates[{Agatha}] <: hates[{butler}] & /* The butler hates everyone whom Agatha hates.  */
 !x.(x:Persons => hates[{x}] /= Persons) /* Noone hates everyone. */ &
 victim = Agatha
ASSERTIONS killer=Agatha
OPERATIONS
 k <-- Killer = BEGIN k := killer END
END

