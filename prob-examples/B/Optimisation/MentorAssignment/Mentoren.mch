MACHINE Mentoren
SETS
 Students = {Lukas, Dominik, John, Ivo, Sebastian, David};
 Professors = {Conrad, Lercher, Linder, Mauve, Rothe, Schoettner}
CONSTANTS  Prefs, Assign, Value
PROPERTIES
Prefs = {
 Lukas |-> [Conrad, Lercher, Linder],
 Dominik |-> [Mauve, Rothe],
 John |-> [Schoettner, Mauve],
 Ivo |-> [Rothe, Lercher],
 Sebastian |-> [Linder, Schoettner],
 David |-> [Conrad, Schoettner]
}
&
Assign : Students >-> Professors & // each Student should get a mentor; every mentor should be used at most once
 !x.(x:Students => Assign(x) : ran(Prefs(x))) // every mentor should be in the list of suggestions
&
 Value = SIGMA(x).(x:Students| Prefs(x)~(Assign(x))) // sum up the index positions
END

